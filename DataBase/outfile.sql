--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: blockuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blockuser (
    blocker_user_id character varying(255) NOT NULL,
    blocked_user_id character varying(255) NOT NULL,
    ecreated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blockuser OWNER TO postgres;

--
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    id integer NOT NULL,
    telegram_id character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    info character varying(255),
    creator_id character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- Name: channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_id_seq OWNER TO postgres;

--
-- Name: channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_id_seq OWNED BY public.channel.id;


--
-- Name: channelmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channelmembership (
    user_id character varying(255) NOT NULL,
    channel_id character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.channelmembership OWNER TO postgres;

--
-- Name: channelmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channelmessage (
    id integer NOT NULL,
    channel_id character varying(255) NOT NULL,
    message_type bytea,
    message_text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.channelmessage OWNER TO postgres;

--
-- Name: channelmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channelmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channelmessage_id_seq OWNER TO postgres;

--
-- Name: channelmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channelmessage_id_seq OWNED BY public.channelmessage.id;


--
-- Name: channelmessageattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channelmessageattachment (
    message_id integer NOT NULL,
    attachment_url text NOT NULL,
    attachment_thumb_url text NOT NULL
);


ALTER TABLE public.channelmessageattachment OWNER TO postgres;

--
-- Name: channelmessageattachment_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channelmessageattachment_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channelmessageattachment_message_id_seq OWNER TO postgres;

--
-- Name: channelmessageattachment_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channelmessageattachment_message_id_seq OWNED BY public.channelmessageattachment.message_id;


--
-- Name: groupmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groupmembership (
    user_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.groupmembership OWNER TO postgres;

--
-- Name: groupmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groupmessage (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    sender_id character varying(255) NOT NULL,
    message_type bytea,
    message_text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.groupmessage OWNER TO postgres;

--
-- Name: groupmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groupmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groupmessage_id_seq OWNER TO postgres;

--
-- Name: groupmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groupmessage_id_seq OWNED BY public.groupmessage.id;


--
-- Name: groupmessageattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groupmessageattachment (
    message_id integer NOT NULL,
    attachment_url text NOT NULL,
    attachment_thumb_url text NOT NULL
);


ALTER TABLE public.groupmessageattachment OWNER TO postgres;

--
-- Name: groupmessageattachment_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groupmessageattachment_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groupmessageattachment_message_id_seq OWNER TO postgres;

--
-- Name: groupmessageattachment_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groupmessageattachment_message_id_seq OWNED BY public.groupmessageattachment.message_id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    creator_id character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    join_url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    id integer NOT NULL,
    sender_id character varying(255) NOT NULL,
    receiver_id character varying(255) NOT NULL,
    message_type bytea,
    message_text text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.message OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_id_seq OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;


--
-- Name: messageattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messageattachment (
    message_id integer NOT NULL,
    attachment_url character varying(255) NOT NULL,
    attachment_thumb_url character varying(255) NOT NULL
);


ALTER TABLE public.messageattachment OWNER TO postgres;

--
-- Name: messageattachment_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messageattachment_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messageattachment_message_id_seq OWNER TO postgres;

--
-- Name: messageattachment_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messageattachment_message_id_seq OWNED BY public.messageattachment.message_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    telegram_id character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    verification_code integer,
    profile_picture_url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: channel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel ALTER COLUMN id SET DEFAULT nextval('public.channel_id_seq'::regclass);


--
-- Name: channelmessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessage ALTER COLUMN id SET DEFAULT nextval('public.channelmessage_id_seq'::regclass);


--
-- Name: channelmessageattachment message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessageattachment ALTER COLUMN message_id SET DEFAULT nextval('public.channelmessageattachment_message_id_seq'::regclass);


--
-- Name: groupmessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessage ALTER COLUMN id SET DEFAULT nextval('public.groupmessage_id_seq'::regclass);


--
-- Name: groupmessageattachment message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessageattachment ALTER COLUMN message_id SET DEFAULT nextval('public.groupmessageattachment_message_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- Name: messageattachment message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messageattachment ALTER COLUMN message_id SET DEFAULT nextval('public.messageattachment_message_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: blockuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blockuser (blocker_user_id, blocked_user_id, ecreated_at) FROM stdin;
@milad	@hassan35	2019-04-12 21:52:29.225815
@milad	@pariwsa	2019-04-12 21:52:29.227101
@milad	@sahar	2019-04-12 21:52:29.228044
@sahar	@hassan35	2019-04-12 21:52:30.650043
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel (id, telegram_id, title, info, creator_id, created_at, updated_at) FROM stdin;
0	@aut_ap_2019	Advanced Programming 2019	Programming channel for AP class 2019	@milad	2019-04-12 21:52:29.192774	2019-04-12 21:52:29.192774
1	@varzesh3	sport news	latest news in sport	@hassan35	2019-04-12 21:52:29.195493	2019-04-12 21:52:29.195493
2	@news	NEWS	latest news	@sahar	2019-04-12 21:52:29.196929	2019-04-12 21:52:29.196929
\.


--
-- Data for Name: channelmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channelmembership (user_id, channel_id, created_at) FROM stdin;
@milad	@aut_ap_2019	2019-04-12 21:52:29.198029
@vahid_aki	@aut_ap_2019	2019-04-12 21:52:29.200735
@sHDiV4RHs	@aut_ap_2019	2019-04-12 21:52:29.201874
@pariwsa	@aut_ap_2019	2019-04-12 21:52:29.203055
@amir.jahanshahi	@aut_ap_2019	2019-04-12 21:52:29.204263
@milad	@varzesh3	2019-04-12 21:52:29.205711
@hassan35	@varzesh3	2019-04-12 21:52:29.206782
@hassan35	@news	2019-04-12 21:52:29.209013
@pariwsa	@news	2019-04-12 21:52:29.210129
@sahar	@news	2019-04-12 21:52:29.211671
\.


--
-- Data for Name: channelmessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channelmessage (id, channel_id, message_type, message_text, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: channelmessageattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channelmessageattachment (message_id, attachment_url, attachment_thumb_url) FROM stdin;
\.


--
-- Data for Name: groupmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groupmembership (user_id, group_id, created_at) FROM stdin;
\.


--
-- Data for Name: groupmessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groupmessage (id, group_id, sender_id, message_type, message_text, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groupmessageattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groupmessageattachment (message_id, attachment_url, attachment_thumb_url) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, creator_id, title, join_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (id, sender_id, receiver_id, message_type, message_text, created_at, updated_at) FROM stdin;
0	@sHDiV4RHs	@amir.jahanshahi	\N	salam	2019-04-12 21:52:29.213007	2019-04-12 21:52:29.213007
1	@sHDiV4RHs	@amir.jahanshahi	\N	text_1	2019-04-12 21:52:29.214659	2019-04-12 21:52:29.214659
2	@amir.jahanshahi	@sHDiV4RHs	\N	text_2	2019-04-12 21:52:29.215737	2019-04-12 21:52:29.215737
3	@sHDiV4RHs	@amir.jahanshahi	\N	text_3	2019-04-12 21:52:29.21665	2019-04-12 21:52:29.21665
4	@amir.jahanshahi	@sHDiV4RHs	\N	text_4	2019-04-12 21:52:29.21757	2019-04-12 21:52:29.21757
5	@amir.jahanshahi	@sHDiV4RHs	\N	text_5	2019-04-12 21:52:29.218661	2019-04-12 21:52:29.218661
6	@sHDiV4RHs	@amir.jahanshahi	\N	text6	2019-04-12 21:52:29.219557	2019-04-12 21:52:29.219557
7	@amir.jahanshahi	@sHDiV4RHs	\N	text_7	2019-04-12 21:52:29.220558	2019-04-12 21:52:29.220558
8	@sHDiV4RHs	@amir.jahanshahi	\N	text_8	2019-04-12 21:52:29.221444	2019-04-12 21:52:29.221444
9	@amir.jahanshahi	@sHDiV4RHs	\N	text_9	2019-04-12 21:52:29.222303	2019-04-12 21:52:29.222303
10	@sHDiV4RHs	@amir.jahanshahi	\N	text_10	2019-04-12 21:52:29.223189	2019-04-12 21:52:29.223189
11	@sHDiV4RHs	@amir.jahanshahi	\N	text_11	2019-04-12 21:52:29.224056	2019-04-12 21:52:29.224056
12	@sHDiV4RHs	@amir.jahanshahi	\N	text_12	2019-04-12 21:52:29.224975	2019-04-12 21:52:29.224975
\.


--
-- Data for Name: messageattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messageattachment (message_id, attachment_url, attachment_thumb_url) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, telegram_id, phone, email, password, first_name, last_name, verification_code, profile_picture_url, created_at, updated_at) FROM stdin;
1	@sHDiV4RHs	09129129122	mehdi@yahoo.com	$2a$06$lo/qIJw4CoQIvoGTAOXZJO/f.NE5vodF6NuMDWUuHdHj.Ad.wy59m	mehdi	Naseri	\N	\N	2019-04-12 21:52:29.148888	2019-04-12 21:52:29.148888
2	@Ali	09121111111	ali@aut.ac.ir	$2a$06$XA5hhDOElffqsHj5dLKSbezPZZ8MuEidkozXTDiKbF4cgiM8RDnCS	ali	Jahdi	\N	\N	2019-04-12 21:52:29.155594	2019-04-12 21:52:29.155594
3	@sahar	09145678912	sahar19@gmail.com	$2a$06$vc47U4OnwSvjQp74O.lt8OU3vx/vp1WM4HdTqvyv3D8yMQY9nWAD6	Sahar	Sajadi	\N	\N	2019-04-12 21:52:29.162705	2019-04-12 21:52:29.162705
4	@hassan35	09350350001	hassan35@yahoo.com	$2a$06$fySX.d0W8F6P6PdsIqPrgOioaxRZt/tngpr6HV3MZCz.MIvmjbDnK	Hassan	Salimi	\N	\N	2019-04-12 21:52:29.16858	2019-04-12 21:52:29.16858
5	@vahid_aki	09144771793	vahidpourakbar@aut.ac.ir	$2a$06$w3szJeiZu0T7ZlGOQNJhGeI4hgX9uYle5zBCegH9aSWQ9uXo0ZHT.	Vahid	Pourakbar	\N	\N	2019-04-12 21:52:29.174199	2019-04-12 21:52:29.174199
6	@pariwsa	09359876543	pariwsa@aut.ac.ir	$2a$06$W1uBaTfIUHYJU7l7IkzQheoAJA6Bqs7hvTKC7OyAJcthAmGJTgtt.	Pariwsa	Noori	\N	\N	2019-04-12 21:52:29.181132	2019-04-12 21:52:29.181132
7	@amir.jahanshahi	09351111111	amir.jahanshahi@aut.ac.ir	$2a$06$C8kRQbTuxkfqqhAQc/5Sa.P0CkOaMQiz3xB9/TuGxHCUSqRVawVdi	Amir	Jahanshahi	\N	\N	2019-04-12 21:52:29.187145	2019-04-12 21:52:29.187145
0	@milad	09120000001	apstudent2019@gmail.com	$2a$06$tLgGpO4T0FpJk33FXqR4gOuCflKGOvmjTy2qf0RC9SXg6AU3KF2Ay	milad	barazandeh	\N	\N	2019-04-12 21:52:29.014355	2019-04-12 21:52:29.014355
\.


--
-- Name: channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_id_seq', 1, false);


--
-- Name: channelmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channelmessage_id_seq', 1, false);


--
-- Name: channelmessageattachment_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channelmessageattachment_message_id_seq', 1, false);


--
-- Name: groupmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groupmessage_id_seq', 1, false);


--
-- Name: groupmessageattachment_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groupmessageattachment_message_id_seq', 1, false);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 1, false);


--
-- Name: messageattachment_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messageattachment_message_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: blockuser blockuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockuser
    ADD CONSTRAINT blockuser_pkey PRIMARY KEY (blocker_user_id, blocked_user_id);


--
-- Name: channel channel_creator_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_creator_id_key UNIQUE (creator_id);


--
-- Name: channel channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (id);


--
-- Name: channel channel_telegram_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_telegram_id_key UNIQUE (telegram_id);


--
-- Name: channelmembership channelmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmembership
    ADD CONSTRAINT channelmembership_pkey PRIMARY KEY (user_id, channel_id);


--
-- Name: channelmessage channelmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessage
    ADD CONSTRAINT channelmessage_pkey PRIMARY KEY (id);


--
-- Name: channelmessageattachment channelmessageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessageattachment
    ADD CONSTRAINT channelmessageattachment_pkey PRIMARY KEY (message_id);


--
-- Name: groupmembership groupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmembership
    ADD CONSTRAINT groupmembership_pkey PRIMARY KEY (user_id, group_id);


--
-- Name: groupmessage groupmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessage
    ADD CONSTRAINT groupmessage_pkey PRIMARY KEY (id);


--
-- Name: groupmessageattachment groupmessageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessageattachment
    ADD CONSTRAINT groupmessageattachment_pkey PRIMARY KEY (message_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: messageattachment messageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messageattachment
    ADD CONSTRAINT messageattachment_pkey PRIMARY KEY (message_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_telegram_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_telegram_id_key UNIQUE (telegram_id);


--
-- Name: blockuser blockuser_blocked_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockuser
    ADD CONSTRAINT blockuser_blocked_user_id_fkey FOREIGN KEY (blocked_user_id) REFERENCES public.users(telegram_id);


--
-- Name: blockuser blockuser_blocker_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockuser
    ADD CONSTRAINT blockuser_blocker_user_id_fkey FOREIGN KEY (blocker_user_id) REFERENCES public.users(telegram_id);


--
-- Name: channel channel_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(telegram_id);


--
-- Name: channelmembership channelmembership_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmembership
    ADD CONSTRAINT channelmembership_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channel(telegram_id);


--
-- Name: channelmembership channelmembership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmembership
    ADD CONSTRAINT channelmembership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(telegram_id);


--
-- Name: channelmessage channelmessage_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessage
    ADD CONSTRAINT channelmessage_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channel(telegram_id);


--
-- Name: groupmembership groupmembership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmembership
    ADD CONSTRAINT groupmembership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(telegram_id);


--
-- Name: groupmessage groupmessage_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessage
    ADD CONSTRAINT groupmessage_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(telegram_id);


--
-- Name: groups groups_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(telegram_id);


--
-- Name: message message_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(telegram_id);


--
-- Name: message message_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(telegram_id);


--
-- Name: messageattachment messageattachment_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messageattachment
    ADD CONSTRAINT messageattachment_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.message(id);


--
-- PostgreSQL database dump complete
--

