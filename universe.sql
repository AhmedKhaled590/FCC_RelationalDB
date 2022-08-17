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
    name character varying(30),
    age_in_million_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    area numeric(10,2),
    description text NOT NULL,
    is_sphere boolean,
    can_live_in boolean
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
    name character varying(30),
    age_in_million_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    area numeric(10,2),
    description text NOT NULL,
    is_sphere boolean,
    can_live_in boolean,
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
    name character varying(30),
    age_in_million_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    area numeric(10,2),
    description text NOT NULL,
    is_sphere boolean,
    can_live_in boolean,
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
    name character varying(30),
    age_in_million_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    area numeric(10,2),
    description text NOT NULL,
    is_sphere boolean,
    can_live_in boolean,
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(30),
    age integer NOT NULL,
    distance integer
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'g1', 1, 144005, 78420.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (2, 'g2', 2, 144005, 78420.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (3, 'g3', 3, 144005, 78420.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (4, 's1', 4, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (5, 's2', 5, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (6, 's3', 6, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (7, 's1', 7, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (8, 's2', 8, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (9, 's3', 9, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (10, 's1', 10, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (11, 's2', 11, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (12, 's3', 12, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (13, 's1', 13, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (14, 's2', 14, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (15, 's3', 15, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (16, 's1', 16, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (17, 's2', 17, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (18, 's1', 18, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (19, 's2', 19, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (20, 's3', 20, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (21, 's1', 21, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (22, 's2', 22, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (23, 's3', 23, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (24, 's1', 24, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (25, 's2', 25, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (26, 's3', 26, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (27, 's1', 27, 1024, 784.00, 'galaxy', false, true);
INSERT INTO public.galaxy VALUES (28, 's2', 28, 1024, 784.00, 'galaxy', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 's1', 1, 1024, 784.00, 'galaxy', false, true, 1);
INSERT INTO public.moon VALUES (2, 's2', 2, 1024, 784.00, 'galaxy', false, true, 2);
INSERT INTO public.moon VALUES (3, 's3', 3, 1024, 784.00, 'galaxy', false, true, 3);
INSERT INTO public.moon VALUES (18, 's1', 18, 1024, 784.00, 'galaxy', false, true, 4);
INSERT INTO public.moon VALUES (19, 's2', 19, 1024, 784.00, 'galaxy', false, true, 5);
INSERT INTO public.moon VALUES (20, 's2', 20, 1024, 784.00, 'galaxy', false, true, 6);
INSERT INTO public.moon VALUES (21, 's1', 21, 1024, 784.00, 'galaxy', false, true, 7);
INSERT INTO public.moon VALUES (22, 's2', 22, 1024, 784.00, 'galaxy', false, true, 8);
INSERT INTO public.moon VALUES (23, 's3', 23, 1024, 784.00, 'galaxy', false, true, 9);
INSERT INTO public.moon VALUES (24, 's1', 24, 1024, 784.00, 'galaxy', false, true, 10);
INSERT INTO public.moon VALUES (25, 's2', 25, 1024, 784.00, 'galaxy', false, true, 11);
INSERT INTO public.moon VALUES (26, 's3', 26, 1024, 784.00, 'galaxy', false, true, 12);
INSERT INTO public.moon VALUES (27, 's1', 27, 1024, 784.00, 'galaxy', false, true, 13);
INSERT INTO public.moon VALUES (28, 's2', 28, 1024, 784.00, 'galaxy', false, true, 14);
INSERT INTO public.moon VALUES (29, 's3', 29, 1024, 784.00, 'galaxy', false, true, 15);
INSERT INTO public.moon VALUES (30, 's1', 30, 1024, 784.00, 'galaxy', false, true, 16);
INSERT INTO public.moon VALUES (31, 's2', 31, 1024, 784.00, 'galaxy', false, true, 17);
INSERT INTO public.moon VALUES (32, 's2', 32, 1024, 784.00, 'galaxy', false, true, 18);
INSERT INTO public.moon VALUES (33, 's2', 33, 1024, 784.00, 'galaxy', false, true, 19);
INSERT INTO public.moon VALUES (34, 's2', 34, 1024, 784.00, 'galaxy', false, true, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 's1', 1, 1024, 784.00, 'galaxy', false, true, 1);
INSERT INTO public.planet VALUES (2, 's2', 2, 1024, 784.00, 'galaxy', false, true, 2);
INSERT INTO public.planet VALUES (3, 's3', 3, 1024, 784.00, 'galaxy', false, true, 3);
INSERT INTO public.planet VALUES (4, 's1', 4, 1024, 784.00, 'galaxy', false, true, 7);
INSERT INTO public.planet VALUES (5, 's2', 5, 1024, 784.00, 'galaxy', false, true, 8);
INSERT INTO public.planet VALUES (6, 's3', 6, 1024, 784.00, 'galaxy', false, true, 9);
INSERT INTO public.planet VALUES (7, 's1', 7, 1024, 784.00, 'galaxy', false, true, 10);
INSERT INTO public.planet VALUES (8, 's2', 8, 1024, 784.00, 'galaxy', false, true, 11);
INSERT INTO public.planet VALUES (9, 's3', 9, 1024, 784.00, 'galaxy', false, true, 12);
INSERT INTO public.planet VALUES (10, 's1', 10, 1024, 784.00, 'galaxy', false, true, 13);
INSERT INTO public.planet VALUES (11, 's2', 11, 1024, 784.00, 'galaxy', false, true, 14);
INSERT INTO public.planet VALUES (12, 's3', 12, 1024, 784.00, 'galaxy', false, true, 15);
INSERT INTO public.planet VALUES (13, 's1', 13, 1024, 784.00, 'galaxy', false, true, 16);
INSERT INTO public.planet VALUES (14, 's2', 14, 1024, 784.00, 'galaxy', false, true, 17);
INSERT INTO public.planet VALUES (15, 's2', 15, 1024, 784.00, 'galaxy', false, true, 18);
INSERT INTO public.planet VALUES (16, 's2', 16, 1024, 784.00, 'galaxy', false, true, 19);
INSERT INTO public.planet VALUES (17, 's2', 17, 1024, 784.00, 'galaxy', false, true, 20);
INSERT INTO public.planet VALUES (18, 's1', 18, 1024, 784.00, 'galaxy', false, true, 4);
INSERT INTO public.planet VALUES (19, 's2', 19, 1024, 784.00, 'galaxy', false, true, 5);
INSERT INTO public.planet VALUES (20, 's2', 20, 1024, 784.00, 'galaxy', false, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 's1', 1, 1024, 784.00, 'galaxy', false, true, 1);
INSERT INTO public.star VALUES (2, 's2', 2, 1024, 784.00, 'galaxy', false, true, 2);
INSERT INTO public.star VALUES (3, 's3', 3, 1024, 784.00, 'galaxy', false, true, 3);
INSERT INTO public.star VALUES (4, 's1', 4, 1024, 784.00, 'galaxy', false, true, 4);
INSERT INTO public.star VALUES (5, 's2', 5, 1024, 784.00, 'galaxy', false, true, 5);
INSERT INTO public.star VALUES (6, 's3', 6, 1024, 784.00, 'galaxy', false, true, 6);
INSERT INTO public.star VALUES (7, 's1', 7, 1024, 784.00, 'galaxy', false, true, 7);
INSERT INTO public.star VALUES (8, 's2', 8, 1024, 784.00, 'galaxy', false, true, 8);
INSERT INTO public.star VALUES (9, 's3', 9, 1024, 784.00, 'galaxy', false, true, 9);
INSERT INTO public.star VALUES (10, 's1', 10, 1024, 784.00, 'galaxy', false, true, 10);
INSERT INTO public.star VALUES (11, 's2', 11, 1024, 784.00, 'galaxy', false, true, 11);
INSERT INTO public.star VALUES (12, 's3', 12, 1024, 784.00, 'galaxy', false, true, 12);
INSERT INTO public.star VALUES (13, 's1', 13, 1024, 784.00, 'galaxy', false, true, 13);
INSERT INTO public.star VALUES (14, 's2', 14, 1024, 784.00, 'galaxy', false, true, 14);
INSERT INTO public.star VALUES (15, 's3', 15, 1024, 784.00, 'galaxy', false, true, 15);
INSERT INTO public.star VALUES (16, 's1', 16, 1024, 784.00, 'galaxy', false, true, 16);
INSERT INTO public.star VALUES (17, 's2', 17, 1024, 784.00, 'galaxy', false, true, 17);
INSERT INTO public.star VALUES (18, 's2', 18, 1024, 784.00, 'galaxy', false, true, 18);
INSERT INTO public.star VALUES (19, 's2', 19, 1024, 784.00, 'galaxy', false, true, 19);
INSERT INTO public.star VALUES (20, 's2', 20, 1024, 784.00, 'galaxy', false, true, 20);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'univ', 1, 5254);
INSERT INTO public.universe VALUES (2, 'univ2', 2, 5254);
INSERT INTO public.universe VALUES (3, 'univ3', 3, 5254);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 28, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 3, true);


--
-- Name: galaxy age_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT age_unique UNIQUE (age_in_million_years);


--
-- Name: star age_unique0; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT age_unique0 UNIQUE (age_in_million_years);


--
-- Name: moon age_unique00; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT age_unique00 UNIQUE (age_in_million_years);


--
-- Name: planet age_unique000; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT age_unique000 UNIQUE (age_in_million_years);


--
-- Name: universe age_unique0000; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT age_unique0000 UNIQUE (age);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_star_galaxyid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_galaxyid UNIQUE (galaxy_id);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


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

