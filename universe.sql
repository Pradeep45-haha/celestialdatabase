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
    galaxy_types integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean,
    has_imp_minerals boolean,
    size numeric(12,1),
    description text,
    name character varying(50)
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
-- Name: life_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life_type (
    life_type_id integer NOT NULL,
    description text,
    name character varying(50),
    max_height numeric(3,1) NOT NULL
);


ALTER TABLE public.life_type OWNER TO freecodecamp;

--
-- Name: life_type_life_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_type_life_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_type_life_type_id_seq OWNER TO freecodecamp;

--
-- Name: life_type_life_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_type_life_type_id_seq OWNED BY public.life_type.life_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    name character varying(50),
    has_life boolean,
    has_imp_minerals boolean,
    size numeric(12,1),
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
    age_in_millions_of_years integer NOT NULL,
    name character varying(50),
    has_life boolean,
    has_imp_minerals boolean,
    size numeric(12,1),
    description text,
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
    age_in_millions_of_years integer NOT NULL,
    name character varying(50),
    has_life boolean,
    has_imp_minerals boolean,
    size numeric(12,1),
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: life_type life_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_type ALTER COLUMN life_type_id SET DEFAULT nextval('public.life_type_life_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 12, true, true, 9000.1, 'This is called andromeda galaxy', 'Andromeda galaxy');
INSERT INTO public.galaxy VALUES (3, 1, 12, true, true, 9000.1, 'This is called milky way galaxy', 'Milky way galaxy');
INSERT INTO public.galaxy VALUES (4, 1, 12, true, true, 9000.1, 'This is called backward galaxy', 'Backward galaxy');
INSERT INTO public.galaxy VALUES (5, 1, 12, true, true, 9000.1, 'This is called black eye galaxy', 'Black eye galaxy');
INSERT INTO public.galaxy VALUES (6, 1, 12, true, true, 9000.1, 'This is called cart wheel galaxy', 'Cart wheel galaxy');
INSERT INTO public.galaxy VALUES (7, 1, 12, true, true, 9000.1, 'This is called cigar wheel galaxy', 'Cigar galaxy');


--
-- Data for Name: life_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life_type VALUES (1, 'Basic life with only survival level inteligence', 'Type 1', 3.1);
INSERT INTO public.life_type VALUES (2, 'Advance life with high intelligence level', 'Type 2', 5.3);
INSERT INTO public.life_type VALUES (3, 'Super advance with access to natural fundamental forces and quntum intelligence', 'Type 3', 12.9);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'These all are moons', 2, 'Moon 1', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (2, 'These all are moons', 2, 'Moon 2', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (3, 'These all are moons', 2, 'Moon 3', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (4, 'These all are moons', 2, 'Moon 4', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (5, 'These all are moons', 2, 'Moon 5', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (6, 'These all are moons', 2, 'Moon 6', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (7, 'These all are moons', 2, 'Moon 7', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (8, 'These all are moons', 2, 'Moon 8', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (9, 'These all are moons', 2, 'Moon 9', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (10, 'These all are moons', 2, 'Moon 10', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (11, 'These all are moons', 2, 'Moon 11', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (12, 'These all are moons', 2, 'Moon 12', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (13, 'These all are moons', 2, 'Moon 13', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (14, 'These all are moons', 2, 'Moon 14', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (15, 'These all are moons', 2, 'Moon 15', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (16, 'These all are moons', 2, 'Moon 16', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (17, 'These all are moons', 2, 'Moon 17', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (18, 'These all are moons', 2, 'Moon 18', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (19, 'These all are moons', 2, 'Moon 19', false, true, 1200.0, 1);
INSERT INTO public.moon VALUES (20, 'These all are moons', 2, 'Moon 20', false, true, 1200.0, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 9, 'Planet 1', true, true, 12000.1, 'This is planet 1', 1);
INSERT INTO public.planet VALUES (2, 9, 'Planet 2', true, true, 12000.1, 'This is planet 2', 2);
INSERT INTO public.planet VALUES (3, 9, 'Planet 3', true, true, 12000.1, 'This is planet 3', 3);
INSERT INTO public.planet VALUES (4, 9, 'Planet 4', true, true, 12000.1, 'This is planet 4', 4);
INSERT INTO public.planet VALUES (5, 9, 'Planet 5', true, true, 12000.1, 'This is planet 5', 5);
INSERT INTO public.planet VALUES (6, 9, 'Planet 6', true, true, 12000.1, 'This is planet 6', 6);
INSERT INTO public.planet VALUES (7, 9, 'Planet 7', true, true, 12000.1, 'This is planet 7', 5);
INSERT INTO public.planet VALUES (8, 9, 'Planet 8', true, true, 12000.1, 'This is planet 8', 4);
INSERT INTO public.planet VALUES (9, 9, 'Planet 9', true, true, 12000.1, 'This is planet 9', 3);
INSERT INTO public.planet VALUES (10, 9, 'Planet 10', true, true, 12000.1, 'This is planet 10', 2);
INSERT INTO public.planet VALUES (12, 9, 'Planet 11', true, true, 12000.1, 'This is planet 11', 1);
INSERT INTO public.planet VALUES (13, 9, 'Planet 12', true, true, 12000.1, 'This is planet 12', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 10, 'STAR 1', false, true, 12000.8, 1);
INSERT INTO public.star VALUES (2, 10, 'STAR 2', false, true, 12000.8, 1);
INSERT INTO public.star VALUES (3, 10, 'STAR 3', false, true, 12000.8, 4);
INSERT INTO public.star VALUES (4, 10, 'STAR 4', false, true, 12000.8, 5);
INSERT INTO public.star VALUES (5, 10, 'STAR 5', false, true, 12000.8, 6);
INSERT INTO public.star VALUES (6, 10, 'STAR 6', false, true, 12000.8, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: life_type_life_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_type_life_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life_type life_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_type
    ADD CONSTRAINT life_type_pkey PRIMARY KEY (life_type_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: life_type unique_life_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_type
    ADD CONSTRAINT unique_life_type_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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


