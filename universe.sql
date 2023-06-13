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
    name character varying(200) NOT NULL,
    size integer,
    isactive boolean DEFAULT true,
    yearfound integer,
    ageinmillions numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(200) NOT NULL,
    size integer,
    isactive boolean DEFAULT true,
    yearfound integer,
    ageinmillions numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(200) NOT NULL,
    size integer,
    isactive boolean DEFAULT true,
    yearfound integer,
    ageinmillions numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: spaceship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship (
    spaceship_id integer NOT NULL,
    name character varying(200) NOT NULL,
    country text NOT NULL
);


ALTER TABLE public.spaceship OWNER TO freecodecamp;

--
-- Name: spaceship_shipid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceship_shipid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceship_shipid_seq OWNER TO freecodecamp;

--
-- Name: spaceship_shipid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceship_shipid_seq OWNED BY public.spaceship.spaceship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(200) NOT NULL,
    size integer,
    isactive boolean DEFAULT true,
    yearfound integer,
    ageinmillions numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: spaceship spaceship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship ALTER COLUMN spaceship_id SET DEFAULT nextval('public.spaceship_shipid_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Orion', NULL, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Taurus', NULL, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Libra', NULL, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Scorpio', NULL, true, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'A', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'B', NULL, true, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'C', NULL, true, NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, 'D', NULL, true, NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'E', NULL, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'F', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (7, 'G', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, 'H', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (9, 'I', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (10, 'J', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (11, 'K', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (12, 'L', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (13, 'M', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, 'N', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (15, 'O', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (16, 'P', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (17, 'Q', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (18, 'R', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (19, 'S', NULL, true, NULL, NULL, 1);
INSERT INTO public.moon VALUES (20, 'T', NULL, true, NULL, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Tattoine', NULL, true, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Endor', NULL, true, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Jakku', NULL, true, NULL, NULL, 4);


--
-- Data for Name: spaceship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship VALUES (1, 'Enterprise', 'United States');
INSERT INTO public.spaceship VALUES (2, 'Apollo 11', 'United States');
INSERT INTO public.spaceship VALUES (3, 'UFO', 'Mars');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, true, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centari', NULL, true, NULL, NULL, 4);
INSERT INTO public.star VALUES (3, 'Omega', NULL, true, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Cassiopia-341', NULL, true, NULL, NULL, 3);
INSERT INTO public.star VALUES (5, 'Cassiopia-351', NULL, true, NULL, NULL, 6);
INSERT INTO public.star VALUES (6, 'Cassiopia-352', NULL, true, NULL, NULL, 5);


--
-- Name: spaceship_shipid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceship_shipid_seq', 3, true);


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
-- Name: spaceship spaceship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_name_key UNIQUE (name);


--
-- Name: spaceship spaceship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_pkey PRIMARY KEY (spaceship_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
