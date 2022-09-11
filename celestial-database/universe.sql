--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    magnitude numeric(4,1) NOT NULL,
    distance numeric,
    constellation character varying(20) NOT NULL,
    discovered character varying(4),
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean DEFAULT false,
    wiki_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_sun integer NOT NULL,
    has_life boolean DEFAULT false,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance numeric,
    greek character varying(20) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: wiki; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.wiki (
    wiki_id integer NOT NULL,
    href character varying(30) NOT NULL,
    name character varying(30),
    url character varying(35) NOT NULL,
    moon_id integer
);


ALTER TABLE public.wiki OWNER TO freecodecamp;

--
-- Name: wiki_wiki_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.wiki_wiki_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_wiki_id_seq OWNER TO freecodecamp;

--
-- Name: wiki_wiki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.wiki_wiki_id_seq OWNED BY public.wiki.wiki_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: wiki wiki_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wiki ALTER COLUMN wiki_id SET DEFAULT nextval('public.wiki_wiki_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 3.4, 2.5, 'Andromeda', '964', 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.');
INSERT INTO public.galaxy VALUES (2, 'Bodes Galaxy', 6.9, 11.7, 'Ursa Major', '1774', 'Highly experienced amateur astronomers may be able to see Messier 81 under exceptional observing conditions.');
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 6.8, 13.7, 'Centaurus', '1826', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation');
INSERT INTO public.galaxy VALUES (4, 'Milky Way Galaxy', -20.5, 0, 'Galaxius', '1610', 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 5.7, 2.9, 'Triangulum', '1764', 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution, ranging from easily visible in direct vision in truly dark skies to a difficult averted vision object in rural/suburban skies.');
INSERT INTO public.galaxy VALUES (6, 'Wolf Lundmark Melotte', 11.0, 3.04, 'Cetus', '1926', 'Named for the three astronomers instrumental in its discovery and identification.');
INSERT INTO public.galaxy VALUES (7, 'Sculptor Galaxy', 7.2, 12, 'Sculptor', '1783', 'Named after the constellation it is located in (Circinus).');
INSERT INTO public.galaxy VALUES (8, 'Eye of Sauron', 11.5, 61.97, 'Canes Venatici', '1970', 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1, 3);
INSERT INTO public.moon VALUES (2, 'Europa', NULL, 2, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', NULL, 3, 5);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 4, 5);
INSERT INTO public.moon VALUES (5, 'Calista', NULL, 5, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', NULL, 6, 5);
INSERT INTO public.moon VALUES (7, 'Adrastea', NULL, 7, 5);
INSERT INTO public.moon VALUES (8, 'Thebe', NULL, 8, 5);
INSERT INTO public.moon VALUES (9, 'Valetuduo', NULL, 9, 5);
INSERT INTO public.moon VALUES (10, 'Elara', NULL, 10, 5);
INSERT INTO public.moon VALUES (11, 'Titan', NULL, 11, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, 12, 6);
INSERT INTO public.moon VALUES (13, 'Cassini', NULL, 13, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', NULL, 14, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', NULL, 15, 6);
INSERT INTO public.moon VALUES (16, 'Enceladus', NULL, 16, 6);
INSERT INTO public.moon VALUES (17, 'Tethys', NULL, 17, 6);
INSERT INTO public.moon VALUES (18, 'Telesto', NULL, 18, 4);
INSERT INTO public.moon VALUES (19, 'Daphnis', NULL, 19, 4);
INSERT INTO public.moon VALUES (20, 'Erriapus', NULL, 20, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 35, NULL, 9);
INSERT INTO public.planet VALUES (2, 'Venus', 67, NULL, 9);
INSERT INTO public.planet VALUES (3, 'Earth', 93, true, 9);
INSERT INTO public.planet VALUES (4, 'Mars', 142, NULL, 9);
INSERT INTO public.planet VALUES (5, 'Jupiter', 484, NULL, 9);
INSERT INTO public.planet VALUES (6, 'Saturn', 889, NULL, 9);
INSERT INTO public.planet VALUES (7, 'Uranus', 1790, NULL, 9);
INSERT INTO public.planet VALUES (8, 'Neptune', 2880, NULL, 9);
INSERT INTO public.planet VALUES (9, 'Unknown1', 0, NULL, 10);
INSERT INTO public.planet VALUES (10, 'Unknown2', 0, NULL, 10);
INSERT INTO public.planet VALUES (11, 'Unknown3', 0, NULL, 11);
INSERT INTO public.planet VALUES (12, 'Unknown4', 0, NULL, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 97, 'Alpha Andromedae', 1);
INSERT INTO public.star VALUES (2, 'Mirach', 198, 'Beta Andromedae', 1);
INSERT INTO public.star VALUES (3, 'Almach', 358, 'Gamma Andromedae', 1);
INSERT INTO public.star VALUES (4, 'δ Andromedae', 105, 'Delta Andromedae', 1);
INSERT INTO public.star VALUES (5, 'ι Andromedae', 86, 'Iota Andromedae', 1);
INSERT INTO public.star VALUES (6, 'υ Andromedae', 44, 'Upsilon Andromedae', 1);
INSERT INTO public.star VALUES (7, 'Adhil', 598, 'Xi Andromedae', 1);
INSERT INTO public.star VALUES (8, 'Nembus', 177, '51 Andromedae', 1);
INSERT INTO public.star VALUES (9, 'Sol', 151.05, 'Helios', 4);
INSERT INTO public.star VALUES (10, 'β Trianguli', 127, 'Beta Trianguli', 5);
INSERT INTO public.star VALUES (11, 'Mothallah', 112, 'Alpha Trianguli', 5);
INSERT INTO public.star VALUES (12, 'ι Trianguli', 1075, 'Iota Trianguli', 5);


--
-- Data for Name: wiki; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.wiki VALUES (1, 'en.wikipedia.org/wiki/', NULL, 'Moon', 1);
INSERT INTO public.wiki VALUES (2, 'en.wikipedia.org/wiki/', NULL, 'Europa', 2);
INSERT INTO public.wiki VALUES (3, 'en.wikipedia.org/wiki/', NULL, 'Ganymede', 3);
INSERT INTO public.wiki VALUES (4, 'en.wikipedia.org/wiki/', NULL, 'Io', 4);
INSERT INTO public.wiki VALUES (5, 'en.wikipedia.org/wiki/', NULL, 'Calista', 5);
INSERT INTO public.wiki VALUES (6, 'en.wikipedia.org/wiki/', NULL, 'Amalthea', 6);
INSERT INTO public.wiki VALUES (7, 'en.wikipedia.org/wiki/', NULL, 'Adrastea', 7);
INSERT INTO public.wiki VALUES (8, 'en.wikipedia.org/wiki/', NULL, 'Thebe', 7);
INSERT INTO public.wiki VALUES (9, 'en.wikipedia.org/wiki/', NULL, 'Valetuduo', 8);
INSERT INTO public.wiki VALUES (10, 'en.wikipedia.org/wiki/', NULL, 'Elara', 10);
INSERT INTO public.wiki VALUES (11, 'en.wikipedia.org/wiki/', NULL, 'Titan', 11);
INSERT INTO public.wiki VALUES (12, 'en.wikipedia.org/wiki/', NULL, 'Rhea', 12);
INSERT INTO public.wiki VALUES (13, 'en.wikipedia.org/wiki/', NULL, 'Cassini', 13);
INSERT INTO public.wiki VALUES (14, 'en.wikipedia.org/wiki/', NULL, 'Mimas', 14);
INSERT INTO public.wiki VALUES (15, 'en.wikipedia.org/wiki/', NULL, 'Iepatus', 15);
INSERT INTO public.wiki VALUES (16, 'en.wikipedia.org/wiki/', NULL, 'Enceladus', 16);
INSERT INTO public.wiki VALUES (17, 'en.wikipedia.org/wiki/', NULL, 'Tethys', 17);
INSERT INTO public.wiki VALUES (18, 'en.wikipedia.org/wiki/', NULL, 'Telesto', 18);
INSERT INTO public.wiki VALUES (19, 'en.wikipedia.org/wiki/', NULL, 'Daphnis', 19);
INSERT INTO public.wiki VALUES (20, 'en.wikipedia.org/wiki/', NULL, 'Erriapus', 20);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: wiki_wiki_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.wiki_wiki_id_seq', 20, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: wiki wiki_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wiki
    ADD CONSTRAINT wiki_name_key UNIQUE (name);


--
-- Name: wiki wiki_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wiki
    ADD CONSTRAINT wiki_pkey PRIMARY KEY (wiki_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

