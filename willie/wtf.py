# -*- coding: utf-8 -*-
from willie import module
from willie.module import HALFOP
import psycopg2
from itertools import islice

PageSize = 20

#class Bot:
#    def say(self, text):
#        print(text)
#    def reply(self, text):
#        say(text)
#class Trigger:
#    def __init__(self, cmd):
#	cmd = unicode(cmd, 'utf-8')
#        self._cmd = cmd
#    def group(self, x):
#        return self._cmd


def random_wtf(bot, db, cnt):
    cnt = min(cnt, 42)

    cur = db.cursor()
    cur.execute("SELECT sub.keyword FROM (SELECT DISTINCT keyword FROM wtf) AS sub ORDER BY RANDOM() LIMIT %s", (cnt,))
    keywords = []
    for res in cur:
        keywords.append(res[0])
    cur.execute("SELECT keyword, STRING_AGG(value, ', ' ORDER BY created ASC) FROM wtf \
                 WHERE keyword IN %s GROUP BY keyword", (tuple(keywords), ))
    for res in cur:
        bot.say('%s: %s' % (res[0], res[1]))

def find_wtf(bot, db, keyword):
    cur = db.cursor()
    cur.execute("SELECT keyword, STRING_AGG(value, ', ' ORDER BY created ASC) FROM wtf WHERE keyword = %s GROUP BY keyword", (keyword,))
    if cur.rowcount > 0:
        res = cur.fetchone()
        bot.say('%s: %s' % (res[0], res[1]))
    else:
        bot.say('%s: WAT?' % keyword)

def remove_from_wtf(bot, db, keyword, wtf):
    cur = db.cursor()
    cur.execute("DELETE FROM wtf WHERE keyword = %s AND value = %s", (keyword, wtf))
    db.commit()        
    cur.execute("SELECT keyword, STRING_AGG(value, ', ' ORDER BY created ASC) FROM wtf WHERE keyword = %s GROUP BY keyword", (keyword,))
    if cur.rowcount > 0:
        res = cur.fetchone()
        bot.say('%s: %s' % (res[0], res[1]))
    else:
        bot.say('%s: IT\'S GONE, OK?' % keyword)

def append_to_wtf(bot, db, keyword, wtf):
    cur = db.cursor()
    for val in wtf.split(','):
        v = val.strip()
        if not v:
            continue
        cur.execute("INSERT INTO wtf (keyword, value) VALUES (%s, %s)", (keyword, v))
    db.commit()
    find_wtf(bot, db, keyword)

def replace_wtf(bot, db, keyword, wtf):
    cur = db.cursor()
    cur.execute("DELETE FROM wtf WHERE keyword = %s", (keyword,))
    append_to_wtf(bot, db, keyword, wtf)

def get_db(bot):
    #if not bot.config.has_option('wtf', 'dbhost') \
    #    or not bot.config.has_option('wtf', 'dbname') \
    #    or not bot.config.has_option('wtf', 'dbuser') \
    #    or not bot.config.has_option('wtf',' dbpass'):
    #    return None

    host = bot.config.wtf.dbhost
    name = bot.config.wtf.dbname
    user = bot.config.wtf.dbuser
    pswd = bot.config.wtf.dbpass

    return psycopg2.connect(host = host, dbname = name, user = user, password = pswd)


@module.commands('wtf')
@module.priority('high')
def wtf(bot, trigger):
    """Hovna z pctuningu. 'wtf [slovo]' nebo 'wtf slovo +/-/= kravina'"""
    db = get_db(bot)
    if db == None:
        return bot.reply('I\'m not configured!')

    if not trigger.group(2) or trigger.group(2).isnumeric():
        random_wtf(bot, db, 1 if not trigger.group(2) else int(trigger.group(2)))
        return

    cmd = trigger.group(2).split(' ', 2)
    if len(cmd) == 1:
        find_wtf(bot, db, cmd[0])
    elif len(cmd) == 3:
        if cmd[1] == '-':
            remove_from_wtf(bot, db, cmd[0], cmd[2])
        elif cmd[1] == '+':
            append_to_wtf(bot, db, cmd[0], cmd[2])
        elif cmd[1] == '=':
            replace_wtf(bot, db, cmd[0], cmd[2])
        else:
            return bot.reply('Vo co se jako pokoušíš?')


@module.commands('bu')
@module.priority('high')
def bu(bot, trigger):
    if bot.privileges[trigger.sender][bot.nick] < HALFOP:
        return

    if trigger.nick != bot.config.nick:
        bot.write(['KICK', trigger.sender, trigger.nick, 'bu'])


@module.commands('wtfsearch')
@module.priority('high')
def wtfsearch(bot, trigger):
    db = get_db(bot)
    if db == None:
        return bot.reply('I\'m not configured!')

    cmd = trigger.group(2).split(' ', 1)
    page = 0 if len(cmd) == 1 else int(cmd[1])
    query = '%' + cmd[0] + '%'

    cur = db.cursor()
    cur.execute("SELECT keyword, STRING_AGG(value, ', ' ORDER BY created ASC) FROM wtf \
                 WHERE keyword IN ( \
                     SELECT DISTINCT keyword FROM wtf WHERE keyword LIKE %s OR value LIKE %s) \
                 GROUP BY keyword LIMIT %s OFFSET %s",
                 (query,query, PageSize + 1, page * PageSize))
    for res in islice(cur, 0, PageSize):
        bot.say('%s: %s' % (res[0], res[1]))

    if cur.rowcount > PageSize:
       bot.say(u'WAIT! THERE\'S MORE! Napiš \'wtfsearch %s %d\'' % (cmd[0], (page + 1)))
