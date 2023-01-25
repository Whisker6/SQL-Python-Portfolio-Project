--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2023-01-20 17:28:05 UTC

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
-- TOC entry 216 (class 1259 OID 49419)
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    albumid integer NOT NULL,
    year numeric NOT NULL,
    name text NOT NULL,
    single boolean DEFAULT false NOT NULL,
    artistid integer NOT NULL,
    ep boolean DEFAULT false NOT NULL
);


ALTER TABLE public.album OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 49418)
-- Name: album_albumid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_albumid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.album_albumid_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 215
-- Name: album_albumid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.album_albumid_seq OWNED BY public.album.albumid;


--
-- TOC entry 210 (class 1259 OID 49380)
-- Name: appuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appuser (
    userid integer NOT NULL,
    username text NOT NULL,
    password character varying
);


ALTER TABLE public.appuser OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 49379)
-- Name: appuser_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appuser_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appuser_userid_seq OWNER TO postgres;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 209
-- Name: appuser_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appuser_userid_seq OWNED BY public.appuser.userid;


--
-- TOC entry 218 (class 1259 OID 49429)
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    artistid integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49428)
-- Name: artist_artistid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artist_artistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artist_artistid_seq OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 217
-- Name: artist_artistid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artist_artistid_seq OWNED BY public.artist.artistid;


--
-- TOC entry 222 (class 1259 OID 49449)
-- Name: episode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode (
    episodeid integer NOT NULL,
    length time without time zone NOT NULL,
    name text NOT NULL,
    description text,
    uploaddate date NOT NULL,
    podcastid integer NOT NULL
);


ALTER TABLE public.episode OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 49448)
-- Name: episode_episodeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.episode_episodeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.episode_episodeid_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 221
-- Name: episode_episodeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.episode_episodeid_seq OWNED BY public.episode.episodeid;


--
-- TOC entry 212 (class 1259 OID 49396)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    playlistid integer NOT NULL,
    name text NOT NULL,
    description text,
    appuser integer NOT NULL
);


ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 49395)
-- Name: playlist_playlistid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlist_playlistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlist_playlistid_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 211
-- Name: playlist_playlistid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlist_playlistid_seq OWNED BY public.playlist.playlistid;


--
-- TOC entry 223 (class 1259 OID 49468)
-- Name: playlistsongs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlistsongs (
    playlistid integer NOT NULL,
    songid integer NOT NULL
);


ALTER TABLE public.playlistsongs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 49440)
-- Name: podcast; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.podcast (
    podcastid integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    artistid integer NOT NULL
);


ALTER TABLE public.podcast OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 49439)
-- Name: podcast_podcastid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.podcast_podcastid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.podcast_podcastid_seq OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 219
-- Name: podcast_podcastid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.podcast_podcastid_seq OWNED BY public.podcast.podcastid;


--
-- TOC entry 214 (class 1259 OID 49405)
-- Name: song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song (
    songid integer NOT NULL,
    name text NOT NULL,
    length time without time zone,
    albumid integer NOT NULL
);


ALTER TABLE public.song OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49404)
-- Name: song_songid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.song_songid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.song_songid_seq OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 213
-- Name: song_songid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.song_songid_seq OWNED BY public.song.songid;


--
-- TOC entry 3203 (class 2604 OID 49422)
-- Name: album albumid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album ALTER COLUMN albumid SET DEFAULT nextval('public.album_albumid_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 49383)
-- Name: appuser userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appuser ALTER COLUMN userid SET DEFAULT nextval('public.appuser_userid_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 49432)
-- Name: artist artistid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist ALTER COLUMN artistid SET DEFAULT nextval('public.artist_artistid_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 49452)
-- Name: episode episodeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode ALTER COLUMN episodeid SET DEFAULT nextval('public.episode_episodeid_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 49399)
-- Name: playlist playlistid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist ALTER COLUMN playlistid SET DEFAULT nextval('public.playlist_playlistid_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 49443)
-- Name: podcast podcastid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcast ALTER COLUMN podcastid SET DEFAULT nextval('public.podcast_podcastid_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 49408)
-- Name: song songid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song ALTER COLUMN songid SET DEFAULT nextval('public.song_songid_seq'::regclass);


--
-- TOC entry 3376 (class 0 OID 49419)
-- Dependencies: 216
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (albumid, year, name, single, artistid, ep) FROM stdin;
1	2018	Proper Dose	f	1	f
2	2015	The Story So Far	f	1	f
3	2013	What You Don't See	f	1	f
4	2011	Under Soil and Dirt	f	1	f
5	2017	The Peace And The Panic	f	3	f
6	2015	Life's Not Out To Get You	f	3	f
7	2014	Rain In July / A History Of Bad Decisions	f	3	f
8	2014	Wishful Thinking	f	3	f
10	2020	A Quiet Place To Die	f	4	f
11	2019	Fault	f	4	t
12	2014	The Lost And The Longing	f	4	t
13	2020	The Death Of Me	f	5	f
14	2017	The Mortal Coil	f	5	t
15	2022	Icarus	t	5	f
16	2022	ERRA (Deluxe)	f	6	f
17	2018	Neon	f	6	f
18	2016	Drift	f	6	f
19	2013	Augment	f	6	f
20	2020	Saint	f	7	t
21	2019	Soul Burn	f	7	t
22	2019	Grotesque	t	7	f
23	2019	Crooked	t	7	f
24	2022	Storyteller	f	8	t
25	2021	Deepfake	t	8	f
26	2021	Crowd Control	t	8	f
27	2019	Firsthand Accounts	f	8	f
28	2020	Guardians	f	9	f
29	2017	Phantom Anthem	f	9	f
30	2015	Found In Far Away Places	f	9	f
31	2013	Rescue & Restore	f	9	f
32	2011	Leveler	f	9	f
33	2009	Constellations	f	9	f
\.


--
-- TOC entry 3370 (class 0 OID 49380)
-- Dependencies: 210
-- Data for Name: appuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appuser (userid, username, password) FROM stdin;
1	JeffreyM	au8B9d3G927nMdS
2	BrianK	j4nMh35fw6L9xs
3	RyanS	bnv7wGo4frytbC8cqSWr
4	AnnetteC	WyTMqsPuIKK2xlfe122O
5	RogerC	USNQ8oYNl29IBYWXHHXH
6	ErinM	g1QtPYY8fQv4IA2DKUht
\.


--
-- TOC entry 3378 (class 0 OID 49429)
-- Dependencies: 218
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (artistid, name) FROM stdin;
1	The Story So Far
2	Queens Of The Stone Age
3	Neck Deep
4	Alpha Wolf
5	Polaris
6	ERRA
7	Dealer
8	Johnny Booth
9	August Burns Red
10	Third Party
11	MrBallen
12	Jimmy Akin
13	Matt Fradd
\.


--
-- TOC entry 3382 (class 0 OID 49449)
-- Dependencies: 222
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode (episodeid, length, name, description, uploaddate, podcastid) FROM stdin;
1	00:42:36	Does Player Count Matter?	In this weeks episode we dive into the player charts of Apex Legends.	2023-01-18	1
2	00:43:00	Spellbound CE Breakdown	In this weeks episode were going over the Spellbound Collection Event and patch notes.	2023-01-11	1
3	00:37:26	Fire & Brimstone	This is the story of what is, quite possibly, the strangest outcome of a failed romantic relationship ever.	2023-01-16	2
4	00:39:38	Psycho	On a warm day in July 1989, 32 year old actress Sherry Davis stopped by her grandmother’s house in Los Angeles, California and she made a horrible discovery.	2023-01-08	2
\.


--
-- TOC entry 3372 (class 0 OID 49396)
-- Dependencies: 212
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist (playlistid, name, description, appuser) FROM stdin;
1	Heavy Rock	A collection of my favorite Heavy Rock songs.	1
\.


--
-- TOC entry 3383 (class 0 OID 49468)
-- Dependencies: 223
-- Data for Name: playlistsongs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlistsongs (playlistid, songid) FROM stdin;
1	2
1	18
1	4
1	20
1	12
\.


--
-- TOC entry 3380 (class 0 OID 49440)
-- Dependencies: 220
-- Data for Name: podcast; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.podcast (podcastid, name, description, artistid) FROM stdin;
1	Third Party	An Apex Legends Podcast	10
2	MrBallen Podcast: Strange, Dark & Mysterious Stories	The Strange, Dark and Mysterious delivered in podcast format.	11
3	Jimmy Akins Mysterious World	Beyond the world we can see is a mysterious world.	12
4	Pints With Aquinas	Every episode of Pints With Aquinas revolves around a question, a question that St. Thomas adresses in one of his many works.	13
\.


--
-- TOC entry 3374 (class 0 OID 49405)
-- Dependencies: 214
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.song (songid, name, length, albumid) FROM stdin;
1	Proper Dose	02:20:00	1
2	Keep This Up	02:26:00	1
3	Out of It	02:38:00	1
4	Take Me as You Please	03:42:00	1
5	Let It Go	02:47:00	1
6	Upside Down	03:51:00	1
7	If I Fall	03:27:00	1
8	Need to Know	02:51:00	1
9	Line	02:37:00	1
10	Growing on You	03:16:00	1
11	Light Year	03:32:00	1
12	Things I Cant Change	02:52:00	3
13	Stifled	02:12:00	3
14	Small Talk	02:43:00	3
15	Playing the Victim	02:50:00	3
16	Right Here	02:35:00	3
17	Empty Space	02:29:00	3
18	The Glass	02:47:00	3
19	All Wrong	03:02:00	3
20	Bad Luck	02:21:00	3
21	Face Value	02:52:00	3
22	Framework	03:08:00	3
\.


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 215
-- Name: album_albumid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_albumid_seq', 33, true);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 209
-- Name: appuser_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appuser_userid_seq', 6, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 217
-- Name: artist_artistid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artist_artistid_seq', 13, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 221
-- Name: episode_episodeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.episode_episodeid_seq', 4, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 211
-- Name: playlist_playlistid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlist_playlistid_seq', 1, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 219
-- Name: podcast_podcastid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.podcast_podcastid_seq', 4, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 213
-- Name: song_songid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.song_songid_seq', 22, true);


--
-- TOC entry 3217 (class 2606 OID 49427)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (albumid);


--
-- TOC entry 3210 (class 2606 OID 49387)
-- Name: appuser appuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appuser
    ADD CONSTRAINT appuser_pkey PRIMARY KEY (userid);


--
-- TOC entry 3219 (class 2606 OID 49438)
-- Name: artist artist_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_name_key UNIQUE (name);


--
-- TOC entry 3221 (class 2606 OID 49436)
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artistid);


--
-- TOC entry 3225 (class 2606 OID 49456)
-- Name: episode episode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT episode_pkey PRIMARY KEY (episodeid);


--
-- TOC entry 3212 (class 2606 OID 49403)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (playlistid);


--
-- TOC entry 3223 (class 2606 OID 49447)
-- Name: podcast podcast_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcast
    ADD CONSTRAINT podcast_pkey PRIMARY KEY (podcastid);


--
-- TOC entry 3215 (class 2606 OID 49412)
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (songid);


--
-- TOC entry 3213 (class 1259 OID 90529)
-- Name: song_btree_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX song_btree_index ON public.song USING btree (name);


--
-- TOC entry 3226 (class 2606 OID 49463)
-- Name: song fk_albumid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT fk_albumid FOREIGN KEY (albumid) REFERENCES public.album(albumid);


--
-- TOC entry 3227 (class 2606 OID 49471)
-- Name: album fk_artistid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT fk_artistid FOREIGN KEY (artistid) REFERENCES public.artist(artistid);


--
-- TOC entry 3228 (class 2606 OID 49476)
-- Name: podcast fk_artistid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcast
    ADD CONSTRAINT fk_artistid FOREIGN KEY (artistid) REFERENCES public.artist(artistid);


--
-- TOC entry 3229 (class 2606 OID 49481)
-- Name: episode fk_podcastid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT fk_podcastid FOREIGN KEY (podcastid) REFERENCES public.podcast(podcastid);


-- Completed on 2023-01-20 17:28:05 UTC

--
-- PostgreSQL database dump complete
--

