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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    size numeric(10,2),
    orbit_period numeric(10,2),
    is_metallic boolean DEFAULT false NOT NULL,
    has_moons boolean DEFAULT false NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric(15,2),
    has_black_hole boolean DEFAULT false NOT NULL,
    is_spiral boolean DEFAULT true NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric(10,2),
    orbit_period integer,
    is_ice boolean DEFAULT false NOT NULL,
    has_atmosphere boolean DEFAULT false NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    radius numeric(10,2),
    orbit_period integer,
    has_rings boolean DEFAULT false NOT NULL,
    has_life boolean DEFAULT false NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(50),
    age integer NOT NULL,
    brightness numeric(10,2),
    is_supernova boolean DEFAULT false NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 939.40, 1680.00, true, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525.40, 1325.00, true, false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 512.00, 1680.00, true, false);
INSERT INTO public.asteroid VALUES (4, 'Juno', 1, 234.00, 1130.00, true, false);
INSERT INTO public.asteroid VALUES (5, 'Hygeia', 1, 430.00, 2435.00, false, false);
INSERT INTO public.asteroid VALUES (6, 'Eros', 1, 16.80, 1.80, true, true);
INSERT INTO public.asteroid VALUES (7, 'Itokawa', 1, 0.30, 0.60, true, true);
INSERT INTO public.asteroid VALUES (8, 'Gaspra', 1, 2.00, 0.80, false, false);
INSERT INTO public.asteroid VALUES (9, 'Ida', 1, 15.70, 1.20, false, true);
INSERT INTO public.asteroid VALUES (10, 'Dactyl', 1, 1.20, 0.30, false, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 0.00, false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 2500000.00, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 3000000.00, false, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Spiral galaxy', 12000000.00, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright spiral galaxy', 28000000.00, false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting spiral galaxy', 23000000.00, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.00, 27, false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.00, 0, true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.00, 1, true, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.00, 2, false, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121.00, 4, true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268.00, 7, false, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4800.00, 17, false, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150.00, 16, true, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 1528.00, 5, true, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1469.00, 79, true, false);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4, 504.00, 1, true, true);
INSERT INTO public.moon VALUES (12, 'Miranda', 5, 471.60, 1, true, false);
INSERT INTO public.moon VALUES (13, 'Ariel', 5, 1167.40, 3, true, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 5, 1169.40, 4, true, false);
INSERT INTO public.moon VALUES (15, 'Titania', 5, 1577.60, 9, true, false);
INSERT INTO public.moon VALUES (16, 'Oberon', 5, 1522.80, 14, true, false);
INSERT INTO public.moon VALUES (17, 'Triton', 6, 2706.80, 6, true, true);
INSERT INTO public.moon VALUES (18, 'Proteus', 6, 418.40, 1, true, false);
INSERT INTO public.moon VALUES (19, 'Nereid', 6, 170.00, 360, true, false);
INSERT INTO public.moon VALUES (20, 'Charon', 7, 1212.00, 6, true, true);
INSERT INTO public.moon VALUES (21, 'Styx', 7, 10.00, 20, true, false);
INSERT INTO public.moon VALUES (22, 'Nix', 7, 45.00, 24, true, false);
INSERT INTO public.moon VALUES (23, 'Kerberos', 7, 13.00, 30, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371.00, 365, false, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389.00, 687, false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911.00, 4333, true, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 58232.00, 10759, true, false);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 25362.00, 30687, true, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 24622.00, 60190, false, false);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 2439.00, 88, false, false);
INSERT INTO public.planet VALUES (8, 'Venus', 1, 6051.00, 225, false, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 1188.00, 90560, false, false);
INSERT INTO public.planet VALUES (10, 'Haumea', 1, 816.00, 103300, false, false);
INSERT INTO public.planet VALUES (11, 'Makemake', 1, 718.00, 112800, false, false);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 1163.00, 203500, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 460, 1.00, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 200, 25.40, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M-type', 100, 120000.00, true);
INSERT INTO public.star VALUES (4, 'Polaris', 1, 'F-type', 700, 2.00, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'M-type', 450, 0.00, false);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'G-type', 550, 1.50, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

