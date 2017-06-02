# Git Hooks

## post-checkout

After 'git clone' this hook tries to set the right identity (commit author name
and email) based on the remote from which the repository was cloned.
See comments in the code on how to customize the hook.

## pre-push

Ran before every push. If the remote you are pushing into is a Gerrit server,
it verifies you are really pushing into Gerrit (HEAD:refs/for/foo) instead of
git (master).


# Installation

Copy scripts to ~/.git-templates/hooks/ and make them executable

In ~/.gitconfig add

 [init]
    templatedir = ~/.git-templates
