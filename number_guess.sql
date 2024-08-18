--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1724005903910', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1724005903909', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1724006031619', 2, 96);
INSERT INTO public.users VALUES (3, 'user_1724006031620', 5, 3);
INSERT INTO public.users VALUES (20, 'user_1724006551499', 2, 787);
INSERT INTO public.users VALUES (6, 'user_1724006117933', 2, 382);
INSERT INTO public.users VALUES (19, 'user_1724006551500', 5, 227);
INSERT INTO public.users VALUES (5, 'user_1724006117934', 5, 169);
INSERT INTO public.users VALUES (8, 'user_1724006241119', 2, 939);
INSERT INTO public.users VALUES (36, 'user_1724006972726', 2, 163);
INSERT INTO public.users VALUES (22, 'user_1724006631228', 2, 570);
INSERT INTO public.users VALUES (7, 'user_1724006241120', 5, 67);
INSERT INTO public.users VALUES (21, 'user_1724006631229', 5, 435);
INSERT INTO public.users VALUES (10, 'user_1724006326662', 2, 408);
INSERT INTO public.users VALUES (35, 'user_1724006972727', 5, 289);
INSERT INTO public.users VALUES (9, 'user_1724006326663', 5, 34);
INSERT INTO public.users VALUES (12, 'user_1724006422311', 2, 451);
INSERT INTO public.users VALUES (24, 'user_1724006685786', 2, 207);
INSERT INTO public.users VALUES (11, 'user_1724006422312', 5, 93);
INSERT INTO public.users VALUES (23, 'user_1724006685787', 5, 269);
INSERT INTO public.users VALUES (14, 'user_1724006430538', 2, 256);
INSERT INTO public.users VALUES (13, 'user_1724006430539', 5, 170);
INSERT INTO public.users VALUES (26, 'user_1724006762038', 2, 351);
INSERT INTO public.users VALUES (16, 'user_1724006468885', 2, 782);
INSERT INTO public.users VALUES (38, 'user_1724007069224', 2, 26);
INSERT INTO public.users VALUES (15, 'user_1724006468886', 5, 107);
INSERT INTO public.users VALUES (25, 'user_1724006762039', 5, 258);
INSERT INTO public.users VALUES (18, 'user_1724006508005', 2, 122);
INSERT INTO public.users VALUES (17, 'user_1724006508006', 5, 46);
INSERT INTO public.users VALUES (37, 'user_1724007069225', 5, 90);
INSERT INTO public.users VALUES (28, 'user_1724006795478', 2, 253);
INSERT INTO public.users VALUES (27, 'user_1724006795479', 5, 344);
INSERT INTO public.users VALUES (30, 'user_1724006820690', 2, 182);
INSERT INTO public.users VALUES (29, 'user_1724006820691', 5, 35);
INSERT INTO public.users VALUES (32, 'user_1724006893904', 2, 385);
INSERT INTO public.users VALUES (31, 'user_1724006893905', 5, 210);
INSERT INTO public.users VALUES (34, 'user_1724006933896', 2, 333);
INSERT INTO public.users VALUES (33, 'user_1724006933897', 5, 18);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 38, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

