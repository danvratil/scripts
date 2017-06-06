--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: wtf; Type: TABLE; Schema: public; Owner: services_wtf; Tablespace: 
--

CREATE TABLE wtf (
    keyword character varying(64) NOT NULL,
    value text NOT NULL,
    created timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL
);


ALTER TABLE public.wtf OWNER TO services_wtf;

--
-- Name: CREATED_idx; Type: INDEX; Schema: public; Owner: services_wtf; Tablespace: 
--

CREATE INDEX "CREATED_idx" ON wtf USING btree (created);


--
-- Name: keyword_idx; Type: INDEX; Schema: public; Owner: services_wtf; Tablespace: 
--

CREATE INDEX keyword_idx ON wtf USING btree (keyword);


--
-- PostgreSQL database dump complete
--

