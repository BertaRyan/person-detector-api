--
-- PostgreSQL database dump
--

\restrict 93kC5fSJy4d4Cu0UKQiFknM9BAOOtLLEpLWy4XDHYJuYCyDd0miVdbbL3H4Zviq

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: login; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);


--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    entries bigint DEFAULT 0,
    joined timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.login (id, hash, email) FROM stdin;
5	$2a$10$DhWUWyoOy7shtSsHLSSrL.9ulAyksnmSmbGN7AAY8x9.q1zkUnU6K	easdf@gmail.com
6	$2a$10$CruLqKt7bxUG.vIMWa/VRez0OSBXlMHV6Ae32DHphkjAmZCvGIZX.	ben@gmail.com
10	$2a$10$BnsvsVvXh4OeukbBQBiFa.D7C7M/c2po/yHVuJcl9NYFZAGM3QjNS	ryan@gmail.com
11	$2a$10$V5x7mD/Y4jFis319hZBHm.lBNzBezi.iop1wVCOc0im7WnNJqYUyC	kali@gmail.com
12	$2a$10$3eaTdTNrg53UWsGGs4n5IOSRhZ7AeOyDGXpTS3svKy93gyzS8irKe	billy@gmail.com
13	$2a$10$RMxfqOjvlGVo1Gb2ks6Lf.6oe1mpe1Q8d8sqA3XeZNeFwZ5bwsEmW	rp@gmail.com
15	$2a$10$LHN4wwAuYJrVXDmxJhOgo.SXKBU00SZwDi8IgtfUw1sf9Ol.RTAmu	
26	$2a$10$U2yplXZsuyBt0Tnys6vH0eCeSJx2/NqAV5VCeVt40qf6DmX5ShRbe	toby@gmail.com
27	$2a$10$pA8/u/xr7lKpQJGXAa8imegqDvHMOrj3BSgSdAdk9HWTU5OcYgp8i	spidey@gmail.com
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, entries, joined) FROM stdin;
9	ryan	rp@gmail.com	20	2026-07-14 13:14:48.022
3	brogan	brogan@gmail.com	0	2026-07-13 18:56:40.465
1	ryan	b@gmail.com	9	2026-07-13 18:50:31.672
5	Ben	ben@gmail.com	0	2026-07-13 21:00:18.823
6	Ryan	ryan@gmail.com	0	2026-07-13 21:33:57.608
12	spiderman	spidey@gmail.com	25	2026-07-14 21:10:54.378
7	Kali	kali@gmail.com	5	2026-07-14 07:28:31.921
8	billy	billy@gmail.com	2	2026-07-14 13:12:57.704
11	toby	toby@gmail.com	1	2026-07-14 20:43:38.099
\.


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_id_seq', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: login login_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 93kC5fSJy4d4Cu0UKQiFknM9BAOOtLLEpLWy4XDHYJuYCyDd0miVdbbL3H4Zviq

