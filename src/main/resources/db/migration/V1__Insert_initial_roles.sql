--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: beneficiary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficiary (
    id integer NOT NULL,
    name character varying(255),
    nic character varying(255)
);


ALTER TABLE public.beneficiary OWNER TO postgres;

--
-- Name: beneficiary_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficiary_data (
    id integer NOT NULL,
    deleted boolean NOT NULL,
    percent double precision,
    registerdate date,
    registeryear integer,
    relasionship character varying(255),
    beneficiary_id integer,
    member_id integer
);


ALTER TABLE public.beneficiary_data OWNER TO postgres;

--
-- Name: beneficiary_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beneficiary_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.beneficiary_data_id_seq OWNER TO postgres;

--
-- Name: beneficiary_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beneficiary_data_id_seq OWNED BY public.beneficiary_data.id;


--
-- Name: beneficiary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beneficiary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.beneficiary_id_seq OWNER TO postgres;

--
-- Name: beneficiary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beneficiary_id_seq OWNED BY public.beneficiary.id;


--
-- Name: claim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim (
    id integer NOT NULL,
    acceptedby integer,
    accepteddate date,
    appeal boolean,
    appealrefid integer,
    appealremarks character varying(255),
    category character varying(255),
    claimdate date,
    claimstatus character varying(255),
    completeddate date,
    deductionamount double precision,
    financesenddate date,
    hospitalenddate date,
    hospitalstartdate date,
    illnessdate date,
    illnessfirstconsultdate date,
    illnessfirstdr character varying(255),
    illnessnature character varying(255),
    infoconsultant character varying(255),
    infohospital character varying(255),
    infotreatment character varying(255),
    injurydate date,
    injuryhow character varying(255),
    injurynature character varying(255),
    injuryplace character varying(255),
    mecremarks character varying(255),
    mecreturndate date,
    mecsenddate date,
    paidamount double precision,
    rejectremarks character varying(255),
    rejecteddate date,
    remarks character varying(255),
    requestamount double precision,
    requestfor character varying(255),
    startdate date,
    voucherid bigint,
    dependant_id integer,
    member_id integer
);


ALTER TABLE public.claim OWNER TO postgres;

--
-- Name: claim_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_data (
    id integer NOT NULL,
    claimdatastatus character varying(255),
    adjustamount double precision,
    adjustremarks character varying(255),
    deductionamount double precision,
    deductionremarks character varying(255),
    paidamount double precision,
    rejectremarks character varying(255),
    rejecteddate date,
    remarks character varying(255),
    requestamount double precision,
    claim_id integer,
    scheme_data_id integer
);


ALTER TABLE public.claim_data OWNER TO postgres;

--
-- Name: claim_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.claim_data_id_seq OWNER TO postgres;

--
-- Name: claim_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_data_id_seq OWNED BY public.claim_data.id;


--
-- Name: claim_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.claim_id_seq OWNER TO postgres;

--
-- Name: claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_id_seq OWNED BY public.claim.id;


--
-- Name: dependant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependant (
    id integer NOT NULL,
    dob date,
    name character varying(255),
    nic character varying(255)
);


ALTER TABLE public.dependant OWNER TO postgres;

--
-- Name: dependant_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependant_data (
    id integer NOT NULL,
    deleted boolean NOT NULL,
    registerdate date,
    registeryear integer,
    relasionship character varying(255),
    dependant_id integer,
    member_id integer
);


ALTER TABLE public.dependant_data OWNER TO postgres;

--
-- Name: dependant_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dependant_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dependant_data_id_seq OWNER TO postgres;

--
-- Name: dependant_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dependant_data_id_seq OWNED BY public.dependant_data.id;


--
-- Name: dependant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dependant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dependant_id_seq OWNER TO postgres;

--
-- Name: dependant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dependant_id_seq OWNED BY public.dependant.id;


--
-- Name: hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hr (
    id integer NOT NULL,
    address character varying(255),
    civil_status character varying(255),
    contact_no character varying(255),
    deleted boolean NOT NULL,
    deleted_date date,
    department character varying(255),
    designation character varying(255),
    dob date,
    email character varying(255),
    emp_no character varying(255),
    name character varying(255),
    nic character varying(255),
    photo_url character varying(255),
    sex character varying(255)
);


ALTER TABLE public.hr OWNER TO postgres;

--
-- Name: hr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hr_id_seq OWNER TO postgres;

--
-- Name: hr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hr_id_seq OWNED BY public.hr.id;


--
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    id integer NOT NULL,
    address text,
    civilstatus text,
    contactno character varying(255),
    deleted boolean,
    department text,
    designation text,
    dob date,
    email character varying(255),
    empno character varying(255) NOT NULL,
    mdate date,
    name text,
    nic character varying(255),
    password character varying(255),
    photourl text,
    registrationopen integer,
    sex text,
    status text
);


ALTER TABLE public.member OWNER TO postgres;

--
-- Name: member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.member_id_seq OWNER TO postgres;

--
-- Name: member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_id_seq OWNED BY public.member.id;


--
-- Name: member_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_registration (
    id integer NOT NULL,
    acceptedby integer,
    accepteddate date,
    registerdate date,
    schemetype character varying(255),
    year integer,
    member_id integer
);


ALTER TABLE public.member_registration OWNER TO postgres;

--
-- Name: member_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.member_registration_id_seq OWNER TO postgres;

--
-- Name: member_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_registration_id_seq OWNED BY public.member_registration.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying(20)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schemeplan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schemeplan (
    id integer NOT NULL,
    category character varying(255),
    descriptionen character varying(1000),
    descriptionsi character varying(1000),
    descriptionta character varying(1000),
    idtext character varying(255),
    maxamount double precision,
    rate double precision NOT NULL,
    title character varying(255),
    unit character varying(50)
);


ALTER TABLE public.schemeplan OWNER TO postgres;

--
-- Name: schemeplan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schemeplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schemeplan_id_seq OWNER TO postgres;

--
-- Name: schemeplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schemeplan_id_seq OWNED BY public.schemeplan.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    member_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: beneficiary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary ALTER COLUMN id SET DEFAULT nextval('public.beneficiary_id_seq'::regclass);


--
-- Name: beneficiary_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary_data ALTER COLUMN id SET DEFAULT nextval('public.beneficiary_data_id_seq'::regclass);


--
-- Name: claim id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim ALTER COLUMN id SET DEFAULT nextval('public.claim_id_seq'::regclass);


--
-- Name: claim_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_data ALTER COLUMN id SET DEFAULT nextval('public.claim_data_id_seq'::regclass);


--
-- Name: dependant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependant ALTER COLUMN id SET DEFAULT nextval('public.dependant_id_seq'::regclass);


--
-- Name: dependant_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependant_data ALTER COLUMN id SET DEFAULT nextval('public.dependant_data_id_seq'::regclass);


--
-- Name: hr id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr ALTER COLUMN id SET DEFAULT nextval('public.hr_id_seq'::regclass);


--
-- Name: member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN id SET DEFAULT nextval('public.member_id_seq'::regclass);


--
-- Name: member_registration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_registration ALTER COLUMN id SET DEFAULT nextval('public.member_registration_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: schemeplan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemeplan ALTER COLUMN id SET DEFAULT nextval('public.schemeplan_id_seq'::regclass);


--
-- Data for Name: beneficiary; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: beneficiary_data; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: claim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: claim_data; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: dependant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dependant VALUES (1, '2002-04-08', 'DVG Fernando', '200259902593');
INSERT INTO public.dependant VALUES (2, '1966-12-04', 'DPJ Fernando', '663390910V');
INSERT INTO public.dependant VALUES (3, '2006-08-20', 'DW Hettiarachchi', NULL);
INSERT INTO public.dependant VALUES (4, '1972-05-24', 'KKP Jinadasa', '721450651V');
INSERT INTO public.dependant VALUES (5, '2004-11-14', 'TW Hettiarachchi', '200481902527');
INSERT INTO public.dependant VALUES (6, '1958-11-12', 'W Thilakawathi', '195881703097');
INSERT INTO public.dependant VALUES (7, '1958-12-28', 'G Upali', '195836302190');
INSERT INTO public.dependant VALUES (8, '1993-03-29', 'HS Isurika', '935892279V');
INSERT INTO public.dependant VALUES (9, '2025-03-21', 'RPDV Chamara', '198823000870');
INSERT INTO public.dependant VALUES (10, '2016-07-04', 'RPDS Pramadiga', NULL);
INSERT INTO public.dependant VALUES (11, '2023-07-10', 'SS Balasooriya', NULL);
INSERT INTO public.dependant VALUES (12, '1984-08-17', 'RDN Karunasena', '842300665V');
INSERT INTO public.dependant VALUES (13, '2019-04-24', 'BB Tharulya', NULL);
INSERT INTO public.dependant VALUES (14, '2020-01-30', 'RPSS Pramadiga', NULL);
INSERT INTO public.dependant VALUES (15, '1994-02-23', 'TN Madushan', '940541611V');
INSERT INTO public.dependant VALUES (16, '2017-08-18', 'RALH Ranasinghearachchi', NULL);
INSERT INTO public.dependant VALUES (17, '2022-02-02', 'TY Dulshakya', NULL);
INSERT INTO public.dependant VALUES (18, '1989-11-08', 'MSS Perera', '198931300063');
INSERT INTO public.dependant VALUES (19, '2020-09-10', 'MSS Perera', NULL);
INSERT INTO public.dependant VALUES (20, '1961-03-17', 'AS Chandrasena', '610770746V');
INSERT INTO public.dependant VALUES (21, '2003-04-02', 'DD Chandrasena', '200359301053');
INSERT INTO public.dependant VALUES (22, '2006-06-06', 'DV Chandrasena', NULL);
INSERT INTO public.dependant VALUES (23, '1984-07-23', 'KABA Siriwardana', '847050136V');
INSERT INTO public.dependant VALUES (24, '2017-08-29', 'JPA Sahanya', NULL);
INSERT INTO public.dependant VALUES (25, '1984-07-07', 'NDK Senawirathna', '846890246V');
INSERT INTO public.dependant VALUES (26, '1968-09-26', 'L Gamage', '682701960V');
INSERT INTO public.dependant VALUES (27, '1977-08-26', 'RMJC Somarathna', '777392719V');
INSERT INTO public.dependant VALUES (28, '2001-08-08', 'DN Gamage', '200122103161');
INSERT INTO public.dependant VALUES (29, '2014-09-21', 'BTN Somarathna', NULL);
INSERT INTO public.dependant VALUES (30, '2010-04-08', 'BRD Somarathna', NULL);
INSERT INTO public.dependant VALUES (31, '2005-09-03', 'MV Gammanpila', NULL);
INSERT INTO public.dependant VALUES (32, '1968-12-12', 'UK Gunasinghe', '19683470040V');
INSERT INTO public.dependant VALUES (33, '2007-10-18', 'USR Gunasinghe', NULL);
INSERT INTO public.dependant VALUES (34, '2025-03-21', 'SS Gammanpila', NULL);
INSERT INTO public.dependant VALUES (35, '1970-01-26', 'GMD Dharmapala', '700261182V');
INSERT INTO public.dependant VALUES (36, '1961-12-05', 'MK Gunawardhna', '618404480V');
INSERT INTO public.dependant VALUES (37, '1957-10-03', 'BMG Thilakarathna', '572771482V');
INSERT INTO public.dependant VALUES (38, '2008-05-30', 'RADN Sithlini', NULL);
INSERT INTO public.dependant VALUES (39, '1978-08-04', 'AG Chandima', '787172539V');
INSERT INTO public.dependant VALUES (40, '2014-11-02', 'RADL Sithsadi', NULL);
INSERT INTO public.dependant VALUES (41, '1986-01-29', 'KLMM Perera', '865291582V');
INSERT INTO public.dependant VALUES (42, '2015-09-12', 'HAMT Hettiarachchi', NULL);
INSERT INTO public.dependant VALUES (43, '2020-01-29', 'HAST Hettiarachchi', NULL);
INSERT INTO public.dependant VALUES (44, '1986-12-27', 'KC Seewanthi', '868621273V');
INSERT INTO public.dependant VALUES (45, '2018-06-12', 'AMGTW Thejasa', NULL);
INSERT INTO public.dependant VALUES (46, '2009-11-07', 'DDSS Dahanayaka', NULL);
INSERT INTO public.dependant VALUES (47, '1979-10-29', 'KDC Komani', '798032984');
INSERT INTO public.dependant VALUES (48, '2007-07-07', 'DDHN Dahanayaka', NULL);
INSERT INTO public.dependant VALUES (49, '2017-01-30', 'DDLK Dahanayaka', NULL);
INSERT INTO public.dependant VALUES (50, '1984-01-16', 'RD Wijerathna', '840163482V');
INSERT INTO public.dependant VALUES (51, '1986-03-20', 'NVCP Kumara', '860802295V');
INSERT INTO public.dependant VALUES (52, '2015-07-06', 'RGSD Wijerathna', NULL);
INSERT INTO public.dependant VALUES (53, '2020-10-01', 'RGDR Wijerathna', NULL);
INSERT INTO public.dependant VALUES (54, '2018-01-19', 'NVGVN Vithana', NULL);
INSERT INTO public.dependant VALUES (55, '2022-02-12', 'NVKG Nagodavithana', NULL);
INSERT INTO public.dependant VALUES (56, '2017-04-29', 'ATR Kulathunga', NULL);
INSERT INTO public.dependant VALUES (57, '1988-01-31', 'ACGS Kulathunga', '198803102413');
INSERT INTO public.dependant VALUES (58, '2020-05-20', 'ALR Kulathunga', NULL);
INSERT INTO public.dependant VALUES (59, '2019-06-05', 'WASD Wijesinghe', NULL);
INSERT INTO public.dependant VALUES (60, '1999-12-15', 'SN Atalugamage', '199985010438');
INSERT INTO public.dependant VALUES (61, '1988-11-08', 'PGRP Wijerathna', '888131841V');
INSERT INTO public.dependant VALUES (62, '2005-07-24', 'SS Atalugamage', NULL);
INSERT INTO public.dependant VALUES (63, '1968-12-10', 'AP Atalugamage', '683450510V');
INSERT INTO public.dependant VALUES (64, '1966-02-24', 'MDY Cooray', '19660550402');
INSERT INTO public.dependant VALUES (65, '2015-07-03', 'YB Disanayake', NULL);
INSERT INTO public.dependant VALUES (66, '1985-08-14', 'HM Kathriarachchi', '857271270V');
INSERT INTO public.dependant VALUES (67, '2019-01-14', 'LM Dissanayake', NULL);
INSERT INTO public.dependant VALUES (68, '2021-09-13', 'JL Dissanayake', NULL);
INSERT INTO public.dependant VALUES (69, '1973-07-29', 'WGS Priyadarshani', '737112250V');
INSERT INTO public.dependant VALUES (70, '2016-09-09', 'KSP Jayakody', NULL);
INSERT INTO public.dependant VALUES (71, '2010-08-23', 'KJT Jayakodi', NULL);
INSERT INTO public.dependant VALUES (72, '2012-11-02', 'RHI Sandaruwan', NULL);
INSERT INTO public.dependant VALUES (73, '2017-04-11', 'RSN Sadaruwan', NULL);
INSERT INTO public.dependant VALUES (74, '1992-01-09', 'IPWC Darmadasa', '925094641V');
INSERT INTO public.dependant VALUES (75, '1975-08-14', 'BHNR Perera', '752270139V');
INSERT INTO public.dependant VALUES (76, '2012-01-31', 'BHLL Perera', NULL);
INSERT INTO public.dependant VALUES (77, '2007-07-12', 'BHVK Perera', NULL);
INSERT INTO public.dependant VALUES (78, '1990-07-18', 'MHL Mihirani', '907002853v');
INSERT INTO public.dependant VALUES (79, '1962-09-02', 'PM Pillai', '627462069V');
INSERT INTO public.dependant VALUES (80, '2022-09-08', 'OJ Gunamunige', NULL);
INSERT INTO public.dependant VALUES (81, '1960-02-07', 'PAA Panditharathne', '600384392V');
INSERT INTO public.dependant VALUES (82, '1981-05-28', 'TD Gunamunige', '811491616V');
INSERT INTO public.dependant VALUES (83, '1999-01-25', 'LS Panditharathne', '199902511579');
INSERT INTO public.dependant VALUES (84, '2012-09-03', 'DR Gunamunige', NULL);
INSERT INTO public.dependant VALUES (85, '2000-10-10', 'SS Panditharathne', '200078404676');
INSERT INTO public.dependant VALUES (86, '2016-05-14', 'MM Gunamunige', NULL);
INSERT INTO public.dependant VALUES (87, '1986-08-31', 'BBKI Vidanage', '862440501V');
INSERT INTO public.dependant VALUES (88, '1975-01-23', 'KGPWK Kaleekotuwa', '197502300520');
INSERT INTO public.dependant VALUES (89, '2000-01-29', 'RAMP Perera', '200052900290');
INSERT INTO public.dependant VALUES (90, '2019-04-28', 'BSSI Vidanage', NULL);
INSERT INTO public.dependant VALUES (91, '2006-07-26', 'KGKN Kaleekotuwa', NULL);
INSERT INTO public.dependant VALUES (92, '1961-10-25', 'RAP Perera', '612991758V');
INSERT INTO public.dependant VALUES (93, '2017-10-26', 'RGDN Kalugala', NULL);
INSERT INTO public.dependant VALUES (94, '2000-01-29', 'RAMM Perera', '200052903184');
INSERT INTO public.dependant VALUES (95, '2015-11-29', 'BVHU Vidanage', NULL);
INSERT INTO public.dependant VALUES (96, '2003-04-01', 'MAVK Amandi', '200359211921');
INSERT INTO public.dependant VALUES (97, '1970-02-15', 'MAV Amarasiri', '700460320V');
INSERT INTO public.dependant VALUES (98, '2021-01-21', 'RGSV Kalugala', NULL);
INSERT INTO public.dependant VALUES (99, '1979-03-27', 'MKK Chandrawasana', '795870520V');
INSERT INTO public.dependant VALUES (100, '1990-09-21', 'TCK Almeda', '907651444V');
INSERT INTO public.dependant VALUES (101, '2018-06-21', 'HKAP Ravanawansha', NULL);
INSERT INTO public.dependant VALUES (102, '2022-09-21', 'HOD Ravanawansha', NULL);
INSERT INTO public.dependant VALUES (103, '2005-04-25', 'TS Rajapaksha', NULL);
INSERT INTO public.dependant VALUES (104, '2012-09-15', 'MM Rajapaksha', NULL);
INSERT INTO public.dependant VALUES (105, '1982-09-29', 'LDGTS Rajapaksha', '198277303164');
INSERT INTO public.dependant VALUES (106, '1972-08-12', 'KP Manawadu', '722251032V');
INSERT INTO public.dependant VALUES (107, '2017-03-08', 'DS Premarathne', NULL);
INSERT INTO public.dependant VALUES (108, '1971-03-12', 'WAPJ Premarathne', '710720720V');
INSERT INTO public.dependant VALUES (109, '2012-05-31', 'IP Manawadu', NULL);
INSERT INTO public.dependant VALUES (111, '2015-08-13', 'SD Premarathne', NULL);
INSERT INTO public.dependant VALUES (110, '2014-11-08', 'SM Manawadu', NULL);
INSERT INTO public.dependant VALUES (112, '1968-10-17', 'DGLS Bandara', '196829101115');
INSERT INTO public.dependant VALUES (113, '2005-02-25', 'DGUA Bandara', NULL);
INSERT INTO public.dependant VALUES (114, '2008-10-24', 'DGMS Banadara', NULL);
INSERT INTO public.dependant VALUES (115, '1987-04-17', 'KGN Subhashini', '876081202V');
INSERT INTO public.dependant VALUES (116, '2010-06-15', 'LVL Hesanya', NULL);
INSERT INTO public.dependant VALUES (117, '2013-03-25', 'LVR Tiranya', NULL);
INSERT INTO public.dependant VALUES (118, '1966-04-13', 'JS Liyanage', '666042620V');
INSERT INTO public.dependant VALUES (119, '2014-04-12', 'RG Darshani', NULL);
INSERT INTO public.dependant VALUES (120, '1980-10-04', 'S Parimaladevi', '198077804242');
INSERT INTO public.dependant VALUES (121, '1974-03-22', 'KLSI Jayasena', '745822428V');
INSERT INTO public.dependant VALUES (122, '2011-03-04', 'KVDS Chathumina', NULL);
INSERT INTO public.dependant VALUES (123, '2018-02-24', 'KCN De Silva', NULL);
INSERT INTO public.dependant VALUES (124, '1991-04-15', 'MACP Marasinghe', '916061137V');
INSERT INTO public.dependant VALUES (125, '1963-03-29', 'DAP Weerasiri', '630890454V');
INSERT INTO public.dependant VALUES (126, '1963-12-01', 'RAMK Herath', '638364663V');
INSERT INTO public.dependant VALUES (127, '2023-09-01', 'PGAU  Rajamanthri', NULL);
INSERT INTO public.dependant VALUES (128, '1996-12-06', 'KAPP Kuruppuarachchi', '963410875V');
INSERT INTO public.dependant VALUES (129, '1993-12-07', 'AMS Wekada', '938423563V');
INSERT INTO public.dependant VALUES (130, '1986-12-12', 'GAS Priyadarshani', '868472839V');
INSERT INTO public.dependant VALUES (131, '1995-04-28', 'KASU Kuruppuarachchi', '956190274V');
INSERT INTO public.dependant VALUES (132, '2020-12-16', 'HAN Vihansa', NULL);
INSERT INTO public.dependant VALUES (133, '2018-05-07', 'PGJW Rajamanthri', NULL);
INSERT INTO public.dependant VALUES (134, '2015-07-23', 'PGUGP Rajamanthri', NULL);
INSERT INTO public.dependant VALUES (135, '1994-07-01', 'KGBKGatugampola', '199471401678');
INSERT INTO public.dependant VALUES (136, '1991-05-14', 'MMPM Medawala', '916350490V');
INSERT INTO public.dependant VALUES (137, '1982-12-21', 'KWGSA Gunathilaka', '828560808V');
INSERT INTO public.dependant VALUES (138, '2017-10-14', 'WDA Dahamdi', NULL);
INSERT INTO public.dependant VALUES (146, '1977-04-04', 'AAS.Perera', '775953595V');
INSERT INTO public.dependant VALUES (148, '2008-11-02', 'RNT.Arachchi', NULL);
INSERT INTO public.dependant VALUES (162, '1977-06-29', 'PMB Neelaka Awantha', '197718102953');
INSERT INTO public.dependant VALUES (163, '2016-04-16', 'PMB Devin Mandiv', NULL);
INSERT INTO public.dependant VALUES (164, '2018-11-17', 'PMB Demdini Senelya', NULL);
INSERT INTO public.dependant VALUES (177, '1972-11-18', 'PLH Gunarathne', '728232412V');
INSERT INTO public.dependant VALUES (178, '2006-08-15', 'KLL Wickramarathne', NULL);
INSERT INTO public.dependant VALUES (192, '1973-01-01', 'KJ Suramya', '735015230V');
INSERT INTO public.dependant VALUES (1623, '1994-07-07', 'GRTB Abeyrathne', '941892620V');
INSERT INTO public.dependant VALUES (139, '1971-07-09', 'NG Priyadarshani', '716911012V');
INSERT INTO public.dependant VALUES (153, '1955-01-13', 'D.N.De Silva', '550132672V');
INSERT INTO public.dependant VALUES (155, '1999-03-19', 'C.S.De Silva', '995792168V');
INSERT INTO public.dependant VALUES (169, '2004-11-24', 'kA Sandeepana', '200432900750');
INSERT INTO public.dependant VALUES (170, '1976-11-30', 'KMHNK Perera', '768350698V');
INSERT INTO public.dependant VALUES (171, '2000-06-27', 'KK Virajini', '200067900343');
INSERT INTO public.dependant VALUES (180, '1989-01-01', 'MKM Dilhani', '895011754V');
INSERT INTO public.dependant VALUES (198, '1984-01-18', 'BKK Perera', '840180395V');
INSERT INTO public.dependant VALUES (199, '2021-11-27', 'BHS Perera', NULL);
INSERT INTO public.dependant VALUES (200, '2016-04-25', 'BNS Perera', NULL);
INSERT INTO public.dependant VALUES (209, '1984-05-03', 'RGV Jinasena', '846243836V');
INSERT INTO public.dependant VALUES (211, '2015-08-06', 'NTA Jayawickrama', NULL);
INSERT INTO public.dependant VALUES (212, '2023-03-09', 'SNA Jayawickrama', NULL);
INSERT INTO public.dependant VALUES (140, '2008-12-29', 'LHJ Liyanage', NULL);
INSERT INTO public.dependant VALUES (141, '2011-10-29', 'LNT Liyanage', NULL);
INSERT INTO public.dependant VALUES (142, '2015-01-10', 'LTM Liyanage', NULL);
INSERT INTO public.dependant VALUES (159, '2017-07-08', 'KYS Kurupita', NULL);
INSERT INTO public.dependant VALUES (161, '1986-11-07', 'KJG Kurupita', '863121736V');
INSERT INTO public.dependant VALUES (174, '2012-05-03', 'JKDYP Jayanetti', NULL);
INSERT INTO public.dependant VALUES (175, '1977-10-06', 'JKDHG Jayanetti', '772802170V');
INSERT INTO public.dependant VALUES (176, '2020-09-26', 'JKDVM Jayanetti', NULL);
INSERT INTO public.dependant VALUES (188, '2006-01-09', 'WGR Lakshan', NULL);
INSERT INTO public.dependant VALUES (190, '1964-10-28', 'WGK Vijitha', '643020076V');
INSERT INTO public.dependant VALUES (191, '2001-05-26', 'WGH Piyumali', '200164701092');
INSERT INTO public.dependant VALUES (201, '2008-09-04', 'MDTB Wimalawickrama', NULL);
INSERT INTO public.dependant VALUES (202, '1971-06-21', 'MDW Wimalawickrama', '711730028V');
INSERT INTO public.dependant VALUES (203, '2002-11-13', 'MDDR Wimalawickrama', '200231800338');
INSERT INTO public.dependant VALUES (143, '2014-03-29', 'DHNS Purinima', NULL);
INSERT INTO public.dependant VALUES (144, '2004-11-13', 'DHNS Nathsilu', '200431800423');
INSERT INTO public.dependant VALUES (145, '2007-10-10', 'DHNS Nathmini', NULL);
INSERT INTO public.dependant VALUES (147, '1978-09-01', 'MND Perera', '7874502418V');
INSERT INTO public.dependant VALUES (158, '2021-11-07', 'ORYW Ranasinghe', NULL);
INSERT INTO public.dependant VALUES (160, '1990-08-01', 'ORNN Ranasingha', '902140689V');
INSERT INTO public.dependant VALUES (186, '1998-11-25', 'RA Shashikala', '988301574V');
INSERT INTO public.dependant VALUES (187, '2023-08-16', 'UVDN Oneily', NULL);
INSERT INTO public.dependant VALUES (189, '2016-11-09', 'UVRN Yasasmi', NULL);
INSERT INTO public.dependant VALUES (204, '2008-06-12', 'WKRJ Dinsara', NULL);
INSERT INTO public.dependant VALUES (205, '2010-11-18', 'WKRT Hansilu', NULL);
INSERT INTO public.dependant VALUES (206, '1981-06-21', 'LKPS Perera', '816730597V');
INSERT INTO public.dependant VALUES (149, '2004-05-28', 'WACS Weerakody', NULL);
INSERT INTO public.dependant VALUES (150, '2005-03-01', 'WATR Weerakody', NULL);
INSERT INTO public.dependant VALUES (151, '2012-08-28', 'WADS Weerakody', NULL);
INSERT INTO public.dependant VALUES (152, '1973-01-16', 'WAKD Weerakkody', '730162298V');
INSERT INTO public.dependant VALUES (165, '2007-12-10', 'S Sithsarani Geenanage', NULL);
INSERT INTO public.dependant VALUES (166, '2011-04-22', 'S Sandini Geenanage', NULL);
INSERT INTO public.dependant VALUES (167, '2003-11-05', 'DN Geenanage', '200331001029');
INSERT INTO public.dependant VALUES (168, '1971-06-10', 'PAA Priyanthi', '716622348V');
INSERT INTO public.dependant VALUES (179, '1952-11-23', 'AH Kandamby', '528271278V');
INSERT INTO public.dependant VALUES (193, '1999-03-18', 'HHO Nethmali', '995780771V');
INSERT INTO public.dependant VALUES (194, '1977-01-16', 'BTD Cooray', '775162783V');
INSERT INTO public.dependant VALUES (195, '2007-10-17', 'HHB Sehansha', NULL);
INSERT INTO public.dependant VALUES (207, '1989-08-01', 'RMKS Chadana', '892144477V');
INSERT INTO public.dependant VALUES (154, '2016-03-09', 'SHJ.Ama', NULL);
INSERT INTO public.dependant VALUES (156, '2014-09-27', 'SS Thirsha', NULL);
INSERT INTO public.dependant VALUES (157, '2018-08-17', 'SME Jonathan', NULL);
INSERT INTO public.dependant VALUES (172, '1991-10-29', 'BAGN Thilakarathne', '913031466V');
INSERT INTO public.dependant VALUES (173, '2020-09-07', 'BABD Thilakarathna', NULL);
INSERT INTO public.dependant VALUES (181, '1958-04-30', 'L Pathmananda', '195862100181');
INSERT INTO public.dependant VALUES (182, '2025-03-21', 'GGAS Dharmarathne', NULL);
INSERT INTO public.dependant VALUES (183, '1956-10-30', 'V Pathmananda', '563041200V');
INSERT INTO public.dependant VALUES (184, '2011-01-26', 'AGAS Dharmarathne', NULL);
INSERT INTO public.dependant VALUES (185, '2014-08-02', 'AGRD Dharmarathne', NULL);
INSERT INTO public.dependant VALUES (196, '1969-10-12', 'R Abeysekara', '196928602520');
INSERT INTO public.dependant VALUES (197, '2010-04-07', 'A Abeysekara', NULL);
INSERT INTO public.dependant VALUES (208, '2019-02-02', 'DTD Wijemanna', NULL);
INSERT INTO public.dependant VALUES (210, '1984-09-23', 'DTM Wijemanna', '842670632V');
INSERT INTO public.dependant VALUES (213, '1975-01-23', 'TAAC Perera', '197502301926');
INSERT INTO public.dependant VALUES (214, '2017-11-22', 'MVV Siriwardena', NULL);
INSERT INTO public.dependant VALUES (215, '1999-05-10', 'DGSS Dassanayaka', '991312498V');
INSERT INTO public.dependant VALUES (216, '2015-04-11', 'TAOP Perera', NULL);
INSERT INTO public.dependant VALUES (217, '2004-09-17', 'BSCR Mendis', NULL);
INSERT INTO public.dependant VALUES (218, '1974-06-28', 'SASS Perera', '746800916V');
INSERT INTO public.dependant VALUES (219, '1987-11-28', 'MSPM Siriwardena', '873331380V');
INSERT INTO public.dependant VALUES (220, '2008-09-05', 'TATI Perera', NULL);
INSERT INTO public.dependant VALUES (221, '2010-10-23', 'SNRDS Jeewakarathne', '200029701815');
INSERT INTO public.dependant VALUES (222, '1991-08-23', 'EMGCJ Bandara', '199123600407');
INSERT INTO public.dependant VALUES (223, '2001-12-16', 'BNMS Mendis', NULL);
INSERT INTO public.dependant VALUES (224, '2007-08-23', 'DGTD Dasanayaka', NULL);
INSERT INTO public.dependant VALUES (225, '1965-06-02', 'SKNDS Jeewakarathne', '651540623V');
INSERT INTO public.dependant VALUES (226, '2020-03-29', 'EMOA Bandara', NULL);
INSERT INTO public.dependant VALUES (227, '1975-12-06', 'PKDCK Parapitiya', '758411486V');
INSERT INTO public.dependant VALUES (228, '2002-12-07', 'DGTD Dassanayaka', '200234200703V');
INSERT INTO public.dependant VALUES (229, '1999-06-17', 'SDNDS Jeewakarathne', '991692495V');
INSERT INTO public.dependant VALUES (230, '2009-08-13', 'DL Sirisena', NULL);
INSERT INTO public.dependant VALUES (231, '2025-03-21', 'MG Sirisena', NULL);
INSERT INTO public.dependant VALUES (232, '1974-01-12', 'GANL Wijayasena', '740121723V');
INSERT INTO public.dependant VALUES (233, '1998-07-22', 'AK Senadeera', '982040124V');
INSERT INTO public.dependant VALUES (234, '1967-04-13', 'LA Senadeera', '671040520V');
INSERT INTO public.dependant VALUES (235, '2005-06-12', 'MDSenadeera', NULL);
INSERT INTO public.dependant VALUES (236, '2010-08-27', 'WNDN Weerakoon', NULL);
INSERT INTO public.dependant VALUES (237, '1980-10-07', 'KANS Alexander', '807812599V');
INSERT INTO public.dependant VALUES (238, '2016-09-02', 'WMTD Weerakoon', NULL);
INSERT INTO public.dependant VALUES (239, '2012-06-06', 'MLAR Liyanage', NULL);
INSERT INTO public.dependant VALUES (240, '2021-02-13', 'WMSK Weerakoon', NULL);
INSERT INTO public.dependant VALUES (241, '2009-12-18', 'MLND Liyanage', NULL);
INSERT INTO public.dependant VALUES (242, '1980-08-10', 'A.Denagama', '807233548V');
INSERT INTO public.dependant VALUES (243, '1972-07-10', 'MNF Nawaisa', '726920290V');
INSERT INTO public.dependant VALUES (244, '1972-01-04', 'KMMP Chandrasekara', '197250403201');
INSERT INTO public.dependant VALUES (245, '2009-09-14', 'TPGP Sanudi Duhara', NULL);
INSERT INTO public.dependant VALUES (246, '1980-09-14', 'TPGN Guruge', '802584113V');
INSERT INTO public.dependant VALUES (247, '2021-11-30', 'VR Sudasinghe', NULL);
INSERT INTO public.dependant VALUES (248, '1974-12-23', 'MD Sudasinghe', '743581342V');
INSERT INTO public.dependant VALUES (249, '1956-01-12', 'BMCM Kumarihamy', '565120417V');
INSERT INTO public.dependant VALUES (250, '1960-11-14', 'VGG Gunarathna', '603191137V');
INSERT INTO public.dependant VALUES (251, '1988-12-13', 'MMK Indurangi', '888480994V');
INSERT INTO public.dependant VALUES (252, '2020-08-11', 'LAK Mahagamage', NULL);
INSERT INTO public.dependant VALUES (253, '2011-05-16', 'HDS Henadeera', NULL);
INSERT INTO public.dependant VALUES (254, '2015-06-11', 'HDM Henadeera', NULL);
INSERT INTO public.dependant VALUES (255, '1999-03-31', 'BMHS Basnayake', '995910624V');
INSERT INTO public.dependant VALUES (256, '1967-08-01', 'VB Basnayake', '672140498V');
INSERT INTO public.dependant VALUES (257, '2001-08-23', 'RS Kulathunge', '200173601053');
INSERT INTO public.dependant VALUES (258, '2003-05-08', 'BMTN Basnayake', '200362913338');
INSERT INTO public.dependant VALUES (259, '1965-07-07', 'BRC Wijayasinghe', '656892013');
INSERT INTO public.dependant VALUES (260, '1961-03-10', 'SP Ranasinghe', NULL);
INSERT INTO public.dependant VALUES (261, '1991-03-22', 'AM Udayangani', '915821090V');
INSERT INTO public.dependant VALUES (262, '2012-08-23', 'GS Dahamsa', NULL);
INSERT INTO public.dependant VALUES (263, '2006-08-22', 'CT Igalawithana', NULL);
INSERT INTO public.dependant VALUES (264, '1971-02-28', 'CI Igalawithana', '710590516V');
INSERT INTO public.dependant VALUES (265, '2000-11-21', 'WK Thathsarani', '200082604240');
INSERT INTO public.dependant VALUES (266, '1979-05-19', 'MKC Priyadarshani', '796401290V');
INSERT INTO public.dependant VALUES (267, '1976-08-29', 'GDSAA Kavishka', '767422075V');
INSERT INTO public.dependant VALUES (268, '1998-08-18', 'WPS Senarathna', '987311495V');
INSERT INTO public.dependant VALUES (269, '2006-11-03', 'AAJ Gayanath', NULL);
INSERT INTO public.dependant VALUES (270, '2001-08-01', 'AAKG Adikari', '200121403198');
INSERT INTO public.dependant VALUES (271, '2009-08-17', 'RMKY Weerasiri', NULL);
INSERT INTO public.dependant VALUES (272, '1973-04-14', 'LKTM Perera', '197360502300');
INSERT INTO public.dependant VALUES (273, '2001-04-02', 'RMSH Weerasiri', '200159301812');
INSERT INTO public.dependant VALUES (274, '2002-08-15', 'WDSV Goonarathne', '200251502587');
INSERT INTO public.dependant VALUES (275, '1968-08-27', 'M Indrani', '687401170V');
INSERT INTO public.dependant VALUES (276, '1978-07-13', 'RMCS Kumari', '786954568V');
INSERT INTO public.dependant VALUES (277, '2004-06-12', 'KDMM Kaluarachchi', NULL);
INSERT INTO public.dependant VALUES (278, '2012-12-01', 'KJD Kaluarachchi', NULL);
INSERT INTO public.dependant VALUES (279, '2007-06-13', 'GKIS Senadeera', NULL);
INSERT INTO public.dependant VALUES (280, '2005-02-15', 'GKSD Senadeera', NULL);
INSERT INTO public.dependant VALUES (281, '1958-07-23', 'MSD Ransiri', '582050260V');
INSERT INTO public.dependant VALUES (282, '1996-03-04', 'GKAT Senadeera', '965640207V');
INSERT INTO public.dependant VALUES (283, '1965-12-13', 'HMV Senadeera', '658480979V');
INSERT INTO public.dependant VALUES (284, '2019-02-12', 'SMMDT Manamperi', NULL);
INSERT INTO public.dependant VALUES (285, '2017-03-02', 'SMMVC Manamperi', NULL);
INSERT INTO public.dependant VALUES (286, '2014-09-09', 'SMMLK Manamperi', NULL);
INSERT INTO public.dependant VALUES (287, '2025-03-21', 'DDN Manamperi', '790112818V');
INSERT INTO public.dependant VALUES (288, '2025-03-21', 'G M Mendis', '646342066 V');
INSERT INTO public.dependant VALUES (289, '1992-08-24', 'NHL Abeysinghe', '927371227V');
INSERT INTO public.dependant VALUES (290, '2025-03-21', 'GM Mendis', NULL);
INSERT INTO public.dependant VALUES (291, '1963-03-29', 'AA Pushpa', '635890509V');
INSERT INTO public.dependant VALUES (292, '2014-01-13', 'GDS Sithumsa', NULL);
INSERT INTO public.dependant VALUES (293, '1977-03-06', 'GDRA Kumara', '770660165V');
INSERT INTO public.dependant VALUES (294, '2009-08-07', 'GDK Malkini', NULL);
INSERT INTO public.dependant VALUES (295, '2012-03-01', 'GDV Senodya', NULL);
INSERT INTO public.dependant VALUES (296, '2008-04-21', 'TD Binduhewa', NULL);
INSERT INTO public.dependant VALUES (297, '2005-01-10', 'ER Binduhewa', '200551001359');
INSERT INTO public.dependant VALUES (298, '2002-11-12', 'G Binduhewa', '200231700073');
INSERT INTO public.dependant VALUES (299, '1972-02-23', 'ND Kaluthara', '197255400965');
INSERT INTO public.dependant VALUES (300, '1981-01-23', 'WC Iroshani', '198152304545');
INSERT INTO public.dependant VALUES (301, '2007-11-11', 'GN Nawanga', NULL);
INSERT INTO public.dependant VALUES (302, '1973-02-16', 'PH Jayathilaka', '735473379V');
INSERT INTO public.dependant VALUES (303, '2014-03-14', 'GD Duranga', NULL);
INSERT INTO public.dependant VALUES (304, '2000-04-05', 'KJL Perera', '200059600938');
INSERT INTO public.dependant VALUES (305, '2003-08-26', 'KAD Perera', '200373900475');
INSERT INTO public.dependant VALUES (306, '1963-11-20', 'KAW Perera', '633251738V');
INSERT INTO public.dependant VALUES (307, '1967-01-10', 'MHM Jayawardena', '675101922V');
INSERT INTO public.dependant VALUES (308, '1998-09-17', 'MHDK Jayawardena', '982611571V');
INSERT INTO public.dependant VALUES (309, '1973-11-24', 'KPN Indika', '738293363V');
INSERT INTO public.dependant VALUES (310, '2009-01-07', 'MTS Pathirana', NULL);
INSERT INTO public.dependant VALUES (311, '2013-06-01', 'RM Wickramaarachchi', NULL);
INSERT INTO public.dependant VALUES (312, '2003-12-17', 'PTS Pathirana', '200335200609');
INSERT INTO public.dependant VALUES (313, '1983-07-10', 'MAG Nisansala', '836921305V');
INSERT INTO public.dependant VALUES (314, '2013-02-11', 'BDDS Damsith', NULL);
INSERT INTO public.dependant VALUES (315, '2022-01-03', 'BDM Methara', NULL);
INSERT INTO public.dependant VALUES (316, '1979-01-31', 'MLP Cooray', '795312625V');
INSERT INTO public.dependant VALUES (317, '2007-03-17', 'IGS Dinal', NULL);
INSERT INTO public.dependant VALUES (318, '2015-03-16', 'IDC Chanudhi', NULL);
INSERT INTO public.dependant VALUES (319, '1987-12-16', 'TGTL Saumyasiri', '873514418V');
INSERT INTO public.dependant VALUES (320, '2018-12-09', 'KAD Kalupahana', NULL);
INSERT INTO public.dependant VALUES (321, '2016-06-30', 'KTL Kalupahana', NULL);
INSERT INTO public.dependant VALUES (322, '1983-02-08', 'KB Vinoj', '830391568V');
INSERT INTO public.dependant VALUES (323, '2006-01-12', 'GAMD Perera', NULL);
INSERT INTO public.dependant VALUES (324, '1979-02-08', 'MDSU Perera', '795422951V');
INSERT INTO public.dependant VALUES (325, '2002-04-02', 'GNUD Perera', '200259302590');
INSERT INTO public.dependant VALUES (326, '2013-08-14', 'SWSC Werakoon', '20037581261');
INSERT INTO public.dependant VALUES (327, '2007-01-04', 'SWGM Werakon', NULL);
INSERT INTO public.dependant VALUES (328, '1996-07-06', 'WDM Weligamage', '966881780V');
INSERT INTO public.dependant VALUES (329, '1968-03-29', 'LL Kusuma', '685891204V');
INSERT INTO public.dependant VALUES (330, '2021-11-14', 'RSK Samarasinghe', NULL);
INSERT INTO public.dependant VALUES (331, '1989-07-29', 'RSK Samarasinghe', '892110212V');
INSERT INTO public.dependant VALUES (332, '1989-08-21', 'PGA Viraj', '892342016V');
INSERT INTO public.dependant VALUES (333, '1992-07-27', 'LM David', '922090084V');
INSERT INTO public.dependant VALUES (334, '1972-03-22', 'SKN Priyanthi', '725823606V');
INSERT INTO public.dependant VALUES (335, '1956-12-21', 'KAC Perera', '195635601289');
INSERT INTO public.dependant VALUES (347, '2002-01-30', 'YA Colombage', '200253000284');
INSERT INTO public.dependant VALUES (348, '1969-08-19', 'NC Colombage', '196923201057');
INSERT INTO public.dependant VALUES (349, '2004-11-01', 'YT Colombage', '200430602390');
INSERT INTO public.dependant VALUES (359, '2001-06-06', 'HS Ferdinand', '200115803356');
INSERT INTO public.dependant VALUES (360, '1966-09-09', 'PU Ferdinand', NULL);
INSERT INTO public.dependant VALUES (362, '2003-10-27', 'KG Ferdinand', '200330101020');
INSERT INTO public.dependant VALUES (371, '1972-10-30', 'NGR Jayalath', '728044624V');
INSERT INTO public.dependant VALUES (372, '1950-11-11', 'JA Wijelal', '503184464V');
INSERT INTO public.dependant VALUES (383, '2010-07-17', 'DK Liyanagamage', NULL);
INSERT INTO public.dependant VALUES (386, '1973-03-29', 'SP Liyanagamage', '730890621V');
INSERT INTO public.dependant VALUES (388, '2005-05-25', 'EN Liyanagamage', NULL);
INSERT INTO public.dependant VALUES (395, '2018-03-26', 'WHSD Senevirathne', NULL);
INSERT INTO public.dependant VALUES (396, '1981-10-15', 'HMCWDNK Senevirathne', '817894224V');
INSERT INTO public.dependant VALUES (397, '2014-05-03', 'WVKU Senevirathne', NULL);
INSERT INTO public.dependant VALUES (409, '2001-01-31', 'TIB Ramanayaka', '200103103282');
INSERT INTO public.dependant VALUES (411, '1969-11-28', 'RR Rathnasekara', '693334160V');
INSERT INTO public.dependant VALUES (413, '1999-11-12', 'AS Ramanayaka', '199981711698');
INSERT INTO public.dependant VALUES (414, '2003-03-24', 'YC Ramanayaka', '200358400694');
INSERT INTO public.dependant VALUES (427, '1991-05-14', 'ALTM Perera', '916351593V');
INSERT INTO public.dependant VALUES (441, '1959-11-25', 'WADB Samaraweera', '593100407V');
INSERT INTO public.dependant VALUES (468, '1964-12-14', 'PHMRL Abeyarathne', '196434901435');
INSERT INTO public.dependant VALUES (469, '2002-02-20', 'PHMIU Abeyrathne', '200255101846');
INSERT INTO public.dependant VALUES (470, '2004-10-25', 'PHMDSB Abeyrathne', '200429902378');
INSERT INTO public.dependant VALUES (482, '1964-03-13', 'HAS Jayarathne', '640730013V');
INSERT INTO public.dependant VALUES (483, '2007-01-19', 'HAJ Pasanjish', NULL);
INSERT INTO public.dependant VALUES (491, '2000-07-08', 'OMH Ovidigala', '200069003091');
INSERT INTO public.dependant VALUES (495, '1961-12-30', 'OP Arunasiri', '613653147V');
INSERT INTO public.dependant VALUES (499, '1998-04-08', 'OMH Ovidigala', '199859902967');
INSERT INTO public.dependant VALUES (508, '1994-04-14', 'PVLD Perera', '941052398V');
INSERT INTO public.dependant VALUES (520, '2003-04-02', 'JART Jayakode', '200359312931');
INSERT INTO public.dependant VALUES (521, '1998-08-02', 'JAHT Jayakodi', '987152621V');
INSERT INTO public.dependant VALUES (528, '2017-01-03', 'KMSG Karunarathna', NULL);
INSERT INTO public.dependant VALUES (531, '2018-09-21', 'KMJSD Karunarathna', NULL);
INSERT INTO public.dependant VALUES (534, '1986-10-14', 'WPG Perera', '867781595V');
INSERT INTO public.dependant VALUES (550, '1957-10-11', 'R Gnarathnam', '195778510022');
INSERT INTO public.dependant VALUES (552, '1996-08-05', 'G anusheison', '962182860V');
INSERT INTO public.dependant VALUES (561, '1955-06-01', 'SH Liyanarachchi', '551533069V');
INSERT INTO public.dependant VALUES (562, '1999-03-25', 'HT Liyanarachchi', '995853345V');
INSERT INTO public.dependant VALUES (573, '1965-03-27', 'PSKJ Fernando', '196558703767');
INSERT INTO public.dependant VALUES (576, '2004-02-02', 'SL Gunasekara', NULL);
INSERT INTO public.dependant VALUES (594, '1973-04-04', 'HKCLK Kodippili', NULL);
INSERT INTO public.dependant VALUES (595, '2004-10-14', 'KCOD Fernando', '200478801183');
INSERT INTO public.dependant VALUES (597, '2001-09-26', 'KDCD Fernando', '200127000216');
INSERT INTO public.dependant VALUES (600, '2007-07-16', 'KMDO Fernando', NULL);
INSERT INTO public.dependant VALUES (611, '1978-09-13', 'SN Warnabarana', '787570798V');
INSERT INTO public.dependant VALUES (613, '2006-11-20', 'APTP Abeysundara', NULL);
INSERT INTO public.dependant VALUES (615, '2002-06-20', 'APNS Abeysundara', '200217202869');
INSERT INTO public.dependant VALUES (622, '1964-06-17', 'Nalaka S.Devendra', '641690767V');
INSERT INTO public.dependant VALUES (624, '2003-08-19', 'Leehana D.Devendra', '200373211930');
INSERT INTO public.dependant VALUES (636, '1994-02-24', 'DAT Dilrukshi', '199455501224');
INSERT INTO public.dependant VALUES (637, '1963-05-24', 'J.Weerahewa', '636450014V');
INSERT INTO public.dependant VALUES (650, '2007-11-29', 'PAID Bandara', NULL);
INSERT INTO public.dependant VALUES (651, '2013-10-31', 'PAWY Bandara', NULL);
INSERT INTO public.dependant VALUES (652, '1977-04-03', 'YMP Priyadarshani', '197759401790');
INSERT INTO public.dependant VALUES (669, '2016-11-21', 'SADOW Gunasekara', NULL);
INSERT INTO public.dependant VALUES (672, '2013-11-03', 'SASR Gunasekara', NULL);
INSERT INTO public.dependant VALUES (673, '1993-06-15', 'WKIK Jayathilake', '936682804V');
INSERT INTO public.dependant VALUES (675, '2021-03-19', 'SADO Wehan', NULL);
INSERT INTO public.dependant VALUES (681, '1941-09-18', 'AAD Leelarathne', '412621441V');
INSERT INTO public.dependant VALUES (692, '2019-04-11', 'KD Nuwaragedara', NULL);
INSERT INTO public.dependant VALUES (693, '2022-02-06', 'CS Nuwaragedara', NULL);
INSERT INTO public.dependant VALUES (694, '1993-07-18', 'WAND Weerasuriya', '937003234V');
INSERT INTO public.dependant VALUES (711, '2008-11-14', 'LTP Liyanage', NULL);
INSERT INTO public.dependant VALUES (712, '2013-12-17', 'LSN Liyanage', NULL);
INSERT INTO public.dependant VALUES (713, '1973-09-05', 'LYP Liyanage', '732491724V');
INSERT INTO public.dependant VALUES (714, '2005-11-28', 'LPS Liyanage', NULL);
INSERT INTO public.dependant VALUES (724, '1988-06-26', 'RNAW Damayanthi', '886780818V');
INSERT INTO public.dependant VALUES (730, '1995-11-17', 'IDL Kodagoda', '19953220849');
INSERT INTO public.dependant VALUES (731, '1960-06-20', 'MARR Kodagoda', '601721228V');
INSERT INTO public.dependant VALUES (750, '1982-10-24', 'KTJ Priyadarshani', '827980641V');
INSERT INTO public.dependant VALUES (751, '2010-07-19', 'VGT Navodya', NULL);
INSERT INTO public.dependant VALUES (752, '2017-05-29', 'VGH Nethsara', NULL);
INSERT INTO public.dependant VALUES (753, '2007-06-13', 'VGE Nethumal', NULL);
INSERT INTO public.dependant VALUES (768, '1992-09-01', 'P Ketheeswaran', '927452030V');
INSERT INTO public.dependant VALUES (769, '2016-10-14', 'K Ojaashwiny', NULL);
INSERT INTO public.dependant VALUES (776, '2020-05-06', 'DRS Fernando', NULL);
INSERT INTO public.dependant VALUES (777, '1987-11-10', 'SN Tharangani', '198781500244');
INSERT INTO public.dependant VALUES (778, '2018-03-27', 'DSH Fernando', NULL);
INSERT INTO public.dependant VALUES (786, '2001-07-06', 'MDM Ashen', '200118802779');
INSERT INTO public.dependant VALUES (789, '1975-08-03', 'MS Kumari', '757160866V');
INSERT INTO public.dependant VALUES (792, '2009-03-02', 'MDL Sasanya', NULL);
INSERT INTO public.dependant VALUES (801, '1992-04-22', 'WMDSK wanigasekara', '925930166V');
INSERT INTO public.dependant VALUES (819, '2010-04-29', 'RMTS Rathnayaka', NULL);
INSERT INTO public.dependant VALUES (821, '1982-12-20', 'RMSM Rathnayaka', '823554214V');
INSERT INTO public.dependant VALUES (823, '2014-06-04', 'RMMS Rathnayaka', NULL);
INSERT INTO public.dependant VALUES (841, '1983-07-11', 'HCJ Jayasekara', '836933478V');
INSERT INTO public.dependant VALUES (843, '2008-10-24', 'MRNT Vipulasena', NULL);
INSERT INTO public.dependant VALUES (845, '2019-08-23', 'MRIS Vipulasena', NULL);
INSERT INTO public.dependant VALUES (846, '2014-02-15', 'MRMN Vipulasena', NULL);
INSERT INTO public.dependant VALUES (855, '1992-04-04', 'R Kopithas', '199209502712');
INSERT INTO public.dependant VALUES (856, '2023-07-21', 'K.Akshara', NULL);
INSERT INTO public.dependant VALUES (864, '2018-05-25', 'DST Sesathna', NULL);
INSERT INTO public.dependant VALUES (865, '1984-01-02', 'CN Kavirathne', '845022160V');
INSERT INTO public.dependant VALUES (871, '2010-09-14', 'YA Ranmunige', NULL);
INSERT INTO public.dependant VALUES (872, '2018-03-02', 'DM Ranmunige', NULL);
INSERT INTO public.dependant VALUES (873, '1985-07-19', 'AP Ranmunige', '852010380V');
INSERT INTO public.dependant VALUES (888, '2020-06-25', 'TS Ekanayaka', NULL);
INSERT INTO public.dependant VALUES (889, '1984-04-12', 'RAU Kumara', '841031733V');
INSERT INTO public.dependant VALUES (890, '2016-09-24', 'HC Ekanayaka', NULL);
INSERT INTO public.dependant VALUES (909, '1979-01-28', 'DMAD Dissanayaka', '795280405V');
INSERT INTO public.dependant VALUES (912, '2011-09-05', 'MMSH Meegassooriya', NULL);
INSERT INTO public.dependant VALUES (913, '2014-07-19', 'MMODB Meegassooriya', NULL);
INSERT INTO public.dependant VALUES (927, '1971-08-19', 'NAWMRRP Dehigama', '717320522V');
INSERT INTO public.dependant VALUES (929, '2001-07-22', 'DND Angammana', '200120403495');
INSERT INTO public.dependant VALUES (931, '2004-07-17', 'HKD Angammana', '200469900787');
INSERT INTO public.dependant VALUES (942, '2013-12-12', 'HMDN Bandara', NULL);
INSERT INTO public.dependant VALUES (943, '1984-06-11', 'HMRS Bandara', '198416301072');
INSERT INTO public.dependant VALUES (944, '2021-02-10', 'HMDN Bandara', NULL);
INSERT INTO public.dependant VALUES (336, '1991-04-08', 'HL Hettiarachchi', '915993761V');
INSERT INTO public.dependant VALUES (337, '2017-04-18', 'KR Palpola', NULL);
INSERT INTO public.dependant VALUES (350, '1993-06-08', 'WD Ishara', '936602738V');
INSERT INTO public.dependant VALUES (351, '2020-11-20', 'MADD Muthukuda', NULL);
INSERT INTO public.dependant VALUES (373, '2021-02-06', 'SR Weerasekara', NULL);
INSERT INTO public.dependant VALUES (374, '1989-02-24', 'VH Samarasinghe', '895550256V');
INSERT INTO public.dependant VALUES (380, '2003-07-24', 'VL Jayasundara', '200320600779');
INSERT INTO public.dependant VALUES (382, '1971-10-06', 'PS Jayasundara', '712803053V');
INSERT INTO public.dependant VALUES (385, '2006-08-31', 'VD Jayasundara', NULL);
INSERT INTO public.dependant VALUES (425, '2013-12-12', 'CJ Hadirampela', NULL);
INSERT INTO public.dependant VALUES (426, '1982-02-16', 'NKN Hadirampela', '198204701857');
INSERT INTO public.dependant VALUES (428, '2010-05-24', 'OJ Hadirampela', NULL);
INSERT INTO public.dependant VALUES (439, '1980-06-06', 'JCK Ekanayaka', '806584150V');
INSERT INTO public.dependant VALUES (440, '2009-12-22', 'DMDN Warigajeshta', NULL);
INSERT INTO public.dependant VALUES (449, '1991-05-04', 'UGM Bandaranayaka', '911251426V');
INSERT INTO public.dependant VALUES (450, '2022-03-01', 'UGYS Bandaranayaka', NULL);
INSERT INTO public.dependant VALUES (456, '1983-04-04', 'MMCP Edirisinghe', '830951466V');
INSERT INTO public.dependant VALUES (457, '2018-03-16', 'MMSI Edirisinghe', NULL);
INSERT INTO public.dependant VALUES (458, '2016-12-08', 'MMSD Edirisinghe', NULL);
INSERT INTO public.dependant VALUES (459, '2013-01-19', 'MMTN Edirisinghe', NULL);
INSERT INTO public.dependant VALUES (467, '1985-09-21', 'RD Mahaganiarachchi', '852650893V');
INSERT INTO public.dependant VALUES (477, '1973-10-08', 'NDE Fernando', '737822788V');
INSERT INTO public.dependant VALUES (478, '1999-11-02', 'TGMW Deumini', '199980710387');
INSERT INTO public.dependant VALUES (479, '2002-12-17', 'TGI Madushan', '200235200791');
INSERT INTO public.dependant VALUES (488, '2018-01-04', 'JMVT Jayasundara', NULL);
INSERT INTO public.dependant VALUES (494, '2020-04-25', 'JMUV Jayasundara', NULL);
INSERT INTO public.dependant VALUES (498, '1984-05-19', 'JMMB Jayasundara', '841401042V');
INSERT INTO public.dependant VALUES (501, '2015-05-10', 'JMJP Jayasundara', NULL);
INSERT INTO public.dependant VALUES (506, '1983-06-06', 'MHMS Kumari', '836583515V');
INSERT INTO public.dependant VALUES (510, '2011-07-18', 'GRSG Gamage', NULL);
INSERT INTO public.dependant VALUES (512, '1979-10-23', 'GRT Anurudda', '197929703434');
INSERT INTO public.dependant VALUES (514, '2018-03-11', 'GRDD Gamage', NULL);
INSERT INTO public.dependant VALUES (530, '2006-11-25', 'HDM Methdunu', NULL);
INSERT INTO public.dependant VALUES (533, '1983-11-06', 'PM Darshani', '838113990V');
INSERT INTO public.dependant VALUES (541, '1947-07-01', 'SP Jemes', '471835188V');
INSERT INTO public.dependant VALUES (554, '2011-11-01', 'SSS Gunasekara', NULL);
INSERT INTO public.dependant VALUES (555, '2013-11-12', 'SDS Gunasekara', NULL);
INSERT INTO public.dependant VALUES (564, '1970-01-05', 'KAB Jayathissa', '197031003529');
INSERT INTO public.dependant VALUES (565, '2015-01-15', 'KABSB Jayathissa', NULL);
INSERT INTO public.dependant VALUES (578, '1976-01-16', 'NMK Senanayake', '765162912V');
INSERT INTO public.dependant VALUES (580, '2013-11-14', 'KPDM Pathirana', NULL);
INSERT INTO public.dependant VALUES (582, '2009-05-09', 'KPTT Pathirana', NULL);
INSERT INTO public.dependant VALUES (584, '2011-09-06', 'UBY Ukwatta', NULL);
INSERT INTO public.dependant VALUES (585, '2025-03-21', 'Dr.V Ukwatta', '795880488V');
INSERT INTO public.dependant VALUES (596, '1981-03-11', 'SC Priyadarshani', '815710258V');
INSERT INTO public.dependant VALUES (598, '2019-09-23', 'PDK Sasdula', NULL);
INSERT INTO public.dependant VALUES (601, '2011-08-12', 'PDJ Sansilu', NULL);
INSERT INTO public.dependant VALUES (625, '2004-08-09', 'C.Akshayani', NULL);
INSERT INTO public.dependant VALUES (626, '1972-07-17', 'K .Chandramohan', '721990265V');
INSERT INTO public.dependant VALUES (638, '1986-11-12', 'ISW De Silva', '863173752V');
INSERT INTO public.dependant VALUES (639, '2018-12-08', 'WMS Wijethunga', NULL);
INSERT INTO public.dependant VALUES (665, '1973-12-21', 'EAT Epitawala', '738562216V');
INSERT INTO public.dependant VALUES (666, '2012-12-19', 'SD Wickramasinghe', NULL);
INSERT INTO public.dependant VALUES (667, '2021-12-19', 'SD Wickramasinghe', NULL);
INSERT INTO public.dependant VALUES (668, '2010-11-24', 'KDTH Wickramasinghe', NULL);
INSERT INTO public.dependant VALUES (679, '1992-01-17', 'MPKK Jayathilaka', '925173495V');
INSERT INTO public.dependant VALUES (695, '1969-02-03', 'S Maniwannan', '196903400810');
INSERT INTO public.dependant VALUES (696, '2009-05-20', 'MRAH Randew', NULL);
INSERT INTO public.dependant VALUES (709, '2012-07-07', 'KMKB Kariyawasm', NULL);
INSERT INTO public.dependant VALUES (710, '1988-05-11', 'KMSN Kumara', '881324342V');
INSERT INTO public.dependant VALUES (728, '2023-08-10', 'JAOD Jayasooriya', NULL);
INSERT INTO public.dependant VALUES (729, '1992-12-29', 'HKWGM Jayasooriya', '923641777V');
INSERT INTO public.dependant VALUES (741, '2021-06-26', 'AJD Perera', NULL);
INSERT INTO public.dependant VALUES (743, '1991-06-29', 'KASP Kumari', '916813210V');
INSERT INTO public.dependant VALUES (757, '1999-02-17', 'RPSU Senarathna', '199904803493');
INSERT INTO public.dependant VALUES (759, '2003-04-28', 'RPED Senarathna', '200361912915');
INSERT INTO public.dependant VALUES (761, '2007-05-10', 'RPTI Senarathna', NULL);
INSERT INTO public.dependant VALUES (762, '1975-03-26', 'GDS Chandrarakanthi', '755863181V');
INSERT INTO public.dependant VALUES (775, '1994-05-30', 'HRD Senarathna', '946511188V');
INSERT INTO public.dependant VALUES (784, '1982-02-28', 'BG. Chithranga', '820594657V');
INSERT INTO public.dependant VALUES (798, '2005-05-01', 'WPD Premarathna', NULL);
INSERT INTO public.dependant VALUES (800, '1972-02-28', 'PG Chandra', '197255900580');
INSERT INTO public.dependant VALUES (802, '2002-01-20', 'WDC Premarathna', '200252002622');
INSERT INTO public.dependant VALUES (817, '1975-08-18', 'RASB Ranawaka', '752311161V');
INSERT INTO public.dependant VALUES (818, '2021-06-08', 'MA Ranawaka', NULL);
INSERT INTO public.dependant VALUES (829, '1979-09-11', 'MNF Zimliya', '797550604V');
INSERT INTO public.dependant VALUES (832, '2006-01-01', 'MAM Sadaqath', NULL);
INSERT INTO public.dependant VALUES (834, '2014-04-30', 'MAM Safwath', NULL);
INSERT INTO public.dependant VALUES (836, '2017-07-04', 'MAM Rahamaan', NULL);
INSERT INTO public.dependant VALUES (838, '2007-04-17', 'MAM Salmaan', NULL);
INSERT INTO public.dependant VALUES (860, '1993-08-09', 'KWA Dhanethra', '932220466V');
INSERT INTO public.dependant VALUES (866, '2022-07-22', 'SO Malwaththage', NULL);
INSERT INTO public.dependant VALUES (867, '1994-03-06', 'HA Thamara', NULL);
INSERT INTO public.dependant VALUES (877, '2015-07-13', 'WASM Weerakkody', NULL);
INSERT INTO public.dependant VALUES (879, '2011-11-06', 'WAID Weerakkoday', NULL);
INSERT INTO public.dependant VALUES (881, '1982-04-24', 'WASA Ranmal', '821151490V');
INSERT INTO public.dependant VALUES (897, '2002-04-23', 'KADHB Katupulla', '200211402919');
INSERT INTO public.dependant VALUES (899, '1969-07-02', 'KGDB Katupulla', '691840204V');
INSERT INTO public.dependant VALUES (901, '2009-04-11', 'KADHB Katupulla', NULL);
INSERT INTO public.dependant VALUES (902, '2010-07-02', 'KADS Katupulla', NULL);
INSERT INTO public.dependant VALUES (916, '1986-07-25', 'UAS Senevirathna', '867070028V');
INSERT INTO public.dependant VALUES (919, '2021-07-24', 'KVA Thisaranga', NULL);
INSERT INTO public.dependant VALUES (923, '2012-08-16', 'KVT Tharindya', NULL);
INSERT INTO public.dependant VALUES (933, '1981-04-13', 'TADS Thambugala', '198160400396');
INSERT INTO public.dependant VALUES (935, '2014-11-21', 'WSR Bandara', NULL);
INSERT INTO public.dependant VALUES (937, '2014-11-21', 'WDS Bandara', NULL);
INSERT INTO public.dependant VALUES (939, '2012-02-19', 'WJO Bandara', NULL);
INSERT INTO public.dependant VALUES (338, '1951-06-20', 'CAWASamaranayaka', '511722012V');
INSERT INTO public.dependant VALUES (339, '1957-03-27', 'K Samaranayaka', '195758702948');
INSERT INTO public.dependant VALUES (356, '1996-05-11', 'GMSTG Makkalage', '199663202020');
INSERT INTO public.dependant VALUES (366, '1986-09-02', 'PDDK Perera', '905751565V');
INSERT INTO public.dependant VALUES (377, '1959-07-27', 'MAC Perera', '597090390V');
INSERT INTO public.dependant VALUES (392, '2015-07-15', 'KV Kandage', NULL);
INSERT INTO public.dependant VALUES (393, '2017-09-18', 'MYM Kandage', NULL);
INSERT INTO public.dependant VALUES (403, '1970-10-23', 'NK Thennakoon', '707670843V');
INSERT INTO public.dependant VALUES (404, '1998-10-01', 'UGPB Thennakoon', '980103986V');
INSERT INTO public.dependant VALUES (405, '2001-06-05', 'UGIU Thennakoon', '200465701296');
INSERT INTO public.dependant VALUES (416, '2007-02-19', 'HMDI Herath', NULL);
INSERT INTO public.dependant VALUES (418, '1976-04-09', 'HMN Herath', '761001876V');
INSERT INTO public.dependant VALUES (419, '2009-05-16', 'HMJM Herath', NULL);
INSERT INTO public.dependant VALUES (430, '1974-04-25', 'DV Nanayakkara', '746162766V');
INSERT INTO public.dependant VALUES (431, '2000-12-21', 'RVB Abeysinghe', '20035602706');
INSERT INTO public.dependant VALUES (433, '2007-06-30', 'AK Abeysinghe', NULL);
INSERT INTO public.dependant VALUES (442, '1964-12-31', 'NG Doolwala', '643662760V');
INSERT INTO public.dependant VALUES (444, '2009-11-29', 'DD Doolwala', NULL);
INSERT INTO public.dependant VALUES (445, '2001-08-27', 'YK Doolwala', '2001400097');
INSERT INTO public.dependant VALUES (452, '1997-03-31', 'KWGPH Thilakarathne', '975912230V');
INSERT INTO public.dependant VALUES (461, '2018-06-21', 'WAYN Kasthurirathna', NULL);
INSERT INTO public.dependant VALUES (463, '2021-02-06', 'WANS Kasthurirathna', NULL);
INSERT INTO public.dependant VALUES (464, '1983-07-08', 'KG Gayani', '198369002190');
INSERT INTO public.dependant VALUES (471, '2009-01-28', 'MG Rajakaruna', NULL);
INSERT INTO public.dependant VALUES (480, '1972-02-29', 'MS Abeywardana', '725603320V');
INSERT INTO public.dependant VALUES (481, '2000-04-28', 'DPGK Liyanage', '200011900321');
INSERT INTO public.dependant VALUES (484, '2002-01-27', 'DPKD Liyanage', '200202701332');
INSERT INTO public.dependant VALUES (490, '2003-09-22', 'KPSM Wijayawardena', '200326600989');
INSERT INTO public.dependant VALUES (492, '1969-04-29', 'BSP Abeywickrema', '696200416V');
INSERT INTO public.dependant VALUES (503, '1981-12-25', 'IN Suriyaarachchi', '818605498V');
INSERT INTO public.dependant VALUES (504, '2015-08-10', 'VSS De Mel', NULL);
INSERT INTO public.dependant VALUES (511, '2009-01-28', 'REMG Rajakaruna', NULL);
INSERT INTO public.dependant VALUES (513, '1970-10-05', 'ESSAR Martin', '707793007V');
INSERT INTO public.dependant VALUES (523, '1973-04-07', 'MRMUDK Meegasthenna', '197359803989');
INSERT INTO public.dependant VALUES (524, '2005-09-17', 'WPSS de Silva', NULL);
INSERT INTO public.dependant VALUES (525, '1998-02-07', 'WPKK de Silva', '985383405V');
INSERT INTO public.dependant VALUES (538, '1989-11-16', 'HSP Perera', '893210789V');
INSERT INTO public.dependant VALUES (542, '2023-06-08', 'HSV Perera', NULL);
INSERT INTO public.dependant VALUES (556, '1967-03-28', 'VAS Ruparani', '675882096V');
INSERT INTO public.dependant VALUES (557, '2004-07-31', 'R-Janarthana', NULL);
INSERT INTO public.dependant VALUES (574, '2012-05-03', 'HPP Weerasinghe', NULL);
INSERT INTO public.dependant VALUES (575, '2017-07-19', 'HPI Weerasinghe', NULL);
INSERT INTO public.dependant VALUES (577, '1980-03-25', 'JPGP   Weerasinghe', '805853728V');
INSERT INTO public.dependant VALUES (591, '1954-11-03', 'RB Sunil', '543112038V');
INSERT INTO public.dependant VALUES (592, '1948-07-12', 'TWPW De. Silva', '486942185V');
INSERT INTO public.dependant VALUES (608, '2012-04-20', 'HPSP Omindi', NULL);
INSERT INTO public.dependant VALUES (610, '2013-10-06', 'HPDT Aroshani', NULL);
INSERT INTO public.dependant VALUES (612, '2020-07-10', 'HPAR Ananda', NULL);
INSERT INTO public.dependant VALUES (614, '2008-04-14', 'HPPR Thathsarani', NULL);
INSERT INTO public.dependant VALUES (616, '2018-11-13', 'HPAS Ananda', NULL);
INSERT INTO public.dependant VALUES (617, '1984-08-13', 'EPNC Senavirathna', '847262559V');
INSERT INTO public.dependant VALUES (632, '1967-07-17', 'MAP Perera', '196719900480');
INSERT INTO public.dependant VALUES (634, '2003-11-14', 'MKO Perera', '200331913457');
INSERT INTO public.dependant VALUES (635, '2000-01-02', 'MDN Perera', '200001200850');
INSERT INTO public.dependant VALUES (644, '1987-07-30', 'HKH Wijesooriya', '872121684V');
INSERT INTO public.dependant VALUES (645, '2021-11-01', 'HMM Wijesooriya', NULL);
INSERT INTO public.dependant VALUES (655, '1969-03-25', 'D Pallewatta', '695850530V');
INSERT INTO public.dependant VALUES (656, '1998-02-06', 'WP Pallewatta', '980372146V');
INSERT INTO public.dependant VALUES (657, '2001-05-07', 'DTS Pallewatta', '200162800890');
INSERT INTO public.dependant VALUES (658, '2004-05-30', 'PKN Pallewatta', '200465100360');
INSERT INTO public.dependant VALUES (683, '1958-11-14', 'PD Chandralatha', '195881903500');
INSERT INTO public.dependant VALUES (684, '1955-06-05', 'PAN Perera', '551573028V');
INSERT INTO public.dependant VALUES (698, '1961-10-02', 'A Stanly', '612762066V');
INSERT INTO public.dependant VALUES (700, '1999-09-02', 'AH Jatunarachchi', '992466741V');
INSERT INTO public.dependant VALUES (703, '2002-05-03', 'NJ Jathunarachchi', '200262402164');
INSERT INTO public.dependant VALUES (718, '1979-08-22', 'WMD Nilmini', '797350842V');
INSERT INTO public.dependant VALUES (727, '1954-10-17', 'UDKR Karunanayaka', '542912529V');
INSERT INTO public.dependant VALUES (738, '2009-08-12', 'HCH perera', NULL);
INSERT INTO public.dependant VALUES (739, '1980-03-10', 'MHYC Jayaweera', '805701242V');
INSERT INTO public.dependant VALUES (740, '2006-05-04', 'HTP perera', NULL);
INSERT INTO public.dependant VALUES (756, '1994-04-06', 'TGA Fernando', '945972823V');
INSERT INTO public.dependant VALUES (772, '2020-06-09', 'N Liyana', NULL);
INSERT INTO public.dependant VALUES (774, '1995-11-08', 'MRF Ishra', '958132840V');
INSERT INTO public.dependant VALUES (782, '2019-03-31', 'RN Herath', NULL);
INSERT INTO public.dependant VALUES (783, '1988-06-03', 'HGAR Sameera', '198815503830');
INSERT INTO public.dependant VALUES (787, '1971-05-15', 'KP Malkanthi', '716362019V');
INSERT INTO public.dependant VALUES (791, '2006-03-10', 'BCSH De silva', NULL);
INSERT INTO public.dependant VALUES (794, '2001-10-25', 'BTSN De Silva', NULL);
INSERT INTO public.dependant VALUES (806, '2011-08-07', 'RMJ Chinthaka', NULL);
INSERT INTO public.dependant VALUES (810, '2005-06-26', 'RMJ Supathum', NULL);
INSERT INTO public.dependant VALUES (814, '2001-10-12', 'RMD Charuka', NULL);
INSERT INTO public.dependant VALUES (816, '1973-01-16', 'KRT Kariyawasam', '735161180V');
INSERT INTO public.dependant VALUES (828, '2003-12-31', 'TGCD Kariyawasam', '200386612358');
INSERT INTO public.dependant VALUES (830, '2001-06-12', 'TGST Kariyawasam', '200166401559');
INSERT INTO public.dependant VALUES (835, '1972-10-20', 'GLASP Kumari', '197279401703');
INSERT INTO public.dependant VALUES (837, '2009-04-17', 'TGDH kariyawasam', NULL);
INSERT INTO public.dependant VALUES (849, '1968-09-14', 'MAK Namalee', '687581393V');
INSERT INTO public.dependant VALUES (850, '2002-11-08', 'DLTC Jayathilaka', '200281302137');
INSERT INTO public.dependant VALUES (851, '1997-09-06', 'DLTA Jayathilaka', '977500559V');
INSERT INTO public.dependant VALUES (858, '1961-08-31', 'WAPTP Premachandra', '612440751V');
INSERT INTO public.dependant VALUES (859, '2001-01-15', 'WAPP Lakthilna', '200101501614');
INSERT INTO public.dependant VALUES (868, '1994-06-14', 'KD Malwattage', '941661629V');
INSERT INTO public.dependant VALUES (869, '2022-07-22', 'SO  Malwattage', NULL);
INSERT INTO public.dependant VALUES (878, '2005-03-21', 'TD Sooriyabandara', NULL);
INSERT INTO public.dependant VALUES (880, '1966-07-09', 'S.Sooriyabandara', '661912189V');
INSERT INTO public.dependant VALUES (882, '2008-06-25', 'NS Sooriyabandara', NULL);
INSERT INTO public.dependant VALUES (883, '2002-11-30', 'MP Mallika Sooriyabandara', '200283501289');
INSERT INTO public.dependant VALUES (898, '1966-01-13', 'MPJ Niyarapola', '660130713V');
INSERT INTO public.dependant VALUES (900, '2003-01-13', 'MPI Niyarapola', '200351303009');
INSERT INTO public.dependant VALUES (917, '1975-12-31', 'EPH De Silva', '753663690V');
INSERT INTO public.dependant VALUES (934, '2010-09-01', 'RMUA Rathnayaka', NULL);
INSERT INTO public.dependant VALUES (936, '1979-02-19', 'RMSK Rathnayaka', '790500709V');
INSERT INTO public.dependant VALUES (938, '2015-01-28', 'RMNA Rathnayaka', NULL);
INSERT INTO public.dependant VALUES (340, '1972-01-17', 'KPJM Pathirana', '720172399V');
INSERT INTO public.dependant VALUES (341, '2013-11-14', 'KPDM Pathirana', NULL);
INSERT INTO public.dependant VALUES (342, '2009-05-09', 'KPTT Pathirana', NULL);
INSERT INTO public.dependant VALUES (352, '1997-12-09', 'AS Dissanayaka', '973444069V');
INSERT INTO public.dependant VALUES (353, '2002-05-24', 'TP Dissanayaka', '200214500281');
INSERT INTO public.dependant VALUES (354, '1976-11-06', 'KKI Kodithuwakku', '768112371V');
INSERT INTO public.dependant VALUES (355, '2012-12-26', 'PV Dissanayaka', NULL);
INSERT INTO public.dependant VALUES (363, '1980-08-22', 'ATC Dinusha', '807353500V');
INSERT INTO public.dependant VALUES (364, '2010-02-04', 'SM Gajamange', NULL);
INSERT INTO public.dependant VALUES (365, '2016-06-02', 'MJ Gajamange', NULL);
INSERT INTO public.dependant VALUES (375, '2002-05-28', 'RY Manjitha', '200214902413');
INSERT INTO public.dependant VALUES (376, '1971-11-24', 'PNP Perera', '718291011V');
INSERT INTO public.dependant VALUES (389, '1971-10-01', 'DD Dhanthanarayana', '717750217V');
INSERT INTO public.dependant VALUES (390, '1999-05-12', 'LPSN Devindi', '996332624V');
INSERT INTO public.dependant VALUES (391, '2009-12-14', 'LPSN Sandilu', NULL);
INSERT INTO public.dependant VALUES (401, '1973-10-21', 'PACK Perera', '737952851V');
INSERT INTO public.dependant VALUES (402, '1997-10-09', 'AR Weragala', '972832138V');
INSERT INTO public.dependant VALUES (417, '1991-04-30', 'HAT Udari', '916210833V');
INSERT INTO public.dependant VALUES (420, '2019-10-29', 'MTS Perera', NULL);
INSERT INTO public.dependant VALUES (429, '2016-07-04', 'IPDR Wijethunga', NULL);
INSERT INTO public.dependant VALUES (432, '2012-09-05', 'IPTP Wijethunga', NULL);
INSERT INTO public.dependant VALUES (443, '2005-10-02', 'DMPS Dissanayaka', '200527601358');
INSERT INTO public.dependant VALUES (465, '1985-02-22', 'NSA Nakandala', '198505300912');
INSERT INTO public.dependant VALUES (466, '2018-05-04', 'NCM Nakandala', NULL);
INSERT INTO public.dependant VALUES (472, '1941-01-09', 'VA Manamperi', '194150900188');
INSERT INTO public.dependant VALUES (489, '2014-09-29', 'UNS Rodrigo', NULL);
INSERT INTO public.dependant VALUES (493, '1983-09-24', 'C Samarakkody', '837683297V');
INSERT INTO public.dependant VALUES (497, '2011-12-09', 'UCR Rodrigo', NULL);
INSERT INTO public.dependant VALUES (515, '1965-04-12', 'KLMUK Perera', '6510322960V');
INSERT INTO public.dependant VALUES (518, '1998-02-19', 'KLTS Perera', '985501017V');
INSERT INTO public.dependant VALUES (519, '2002-11-07', 'KLRM Perera', '200231210192');
INSERT INTO public.dependant VALUES (529, '1957-09-25', 'WMP Kumari', '195776901185');
INSERT INTO public.dependant VALUES (532, '1958-01-02', 'Sk Wijemanna', '195800200593');
INSERT INTO public.dependant VALUES (546, '1985-11-02', 'KGWW Bandara', '858073189V');
INSERT INTO public.dependant VALUES (547, '2015-01-25', 'DK Illeperuma', NULL);
INSERT INTO public.dependant VALUES (548, '2017-04-29', 'KK Illeperuma', NULL);
INSERT INTO public.dependant VALUES (558, '2006-04-06', 'BGUU kumari', NULL);
INSERT INTO public.dependant VALUES (559, '1984-07-04', 'JMM Samanmali', '846864610V');
INSERT INTO public.dependant VALUES (560, '2014-06-14', 'BGHT Kumari', NULL);
INSERT INTO public.dependant VALUES (569, '2001-01-05', 'NDMB Narasinghe', '200100501270');
INSERT INTO public.dependant VALUES (570, '2003-09-08', 'NDHI Narasinghe', '200325201164');
INSERT INTO public.dependant VALUES (572, '1964-07-02', 'NDR Dharmapala', '196418403512');
INSERT INTO public.dependant VALUES (579, '2004-08-27', 'MRAV Visvara', '200424004085');
INSERT INTO public.dependant VALUES (581, '2009-05-20', 'MRAH Randev', NULL);
INSERT INTO public.dependant VALUES (583, '1969-07-17', 'RA Sriyani', '196969902185');
INSERT INTO public.dependant VALUES (589, '1963-10-21', 'TK Ariyawansha', '632950403V');
INSERT INTO public.dependant VALUES (590, '2001-06-07', 'TBC Ariyawansha', '200165904046');
INSERT INTO public.dependant VALUES (593, '2009-06-03', 'TVN Ariyawansha', NULL);
INSERT INTO public.dependant VALUES (606, '2018-06-24', 'MPSC Perera', NULL);
INSERT INTO public.dependant VALUES (607, '2012-06-16', 'MPMS Perera', NULL);
INSERT INTO public.dependant VALUES (609, '1987-01-07', 'GMS Rathnayake', '875070657V');
INSERT INTO public.dependant VALUES (630, '2014-05-31', 'ERBS Rajapaksa', NULL);
INSERT INTO public.dependant VALUES (633, '1976-11-02', 'G.Pathma', '197680702850');
INSERT INTO public.dependant VALUES (648, '2013-10-18', 'CSRS Gunasekara', NULL);
INSERT INTO public.dependant VALUES (649, '1977-08-02', 'WMA Damayanthi', NULL);
INSERT INTO public.dependant VALUES (663, '1974-12-14', 'GDKG Jayasinghe', '748493760v');
INSERT INTO public.dependant VALUES (664, '2016-10-23', 'DPOC Weerarathna', NULL);
INSERT INTO public.dependant VALUES (676, '1992-08-26', 'PANS Praba', '927390280V');
INSERT INTO public.dependant VALUES (685, '1938-09-02', 'BLG Piyadasa', '382460138V');
INSERT INTO public.dependant VALUES (699, '1994-08-08', 'PAS Mushmika', '942211325V');
INSERT INTO public.dependant VALUES (701, '1970-11-14', 'SDS Kalyani', '70811921147V');
INSERT INTO public.dependant VALUES (702, '2001-06-24', 'PAA Indudunu', '200117601866');
INSERT INTO public.dependant VALUES (715, '1979-02-04', 'DSS Nanayakkara', '7953500420V');
INSERT INTO public.dependant VALUES (716, '2006-02-14', 'KGM Madushani', NULL);
INSERT INTO public.dependant VALUES (717, '2016-08-30', 'KGD Methseluni', NULL);
INSERT INTO public.dependant VALUES (722, '2002-10-16', 'RK Cedric', '200279000000');
INSERT INTO public.dependant VALUES (725, '1973-09-27', 'JR Cedric', '737710998V');
INSERT INTO public.dependant VALUES (726, '2006-05-22', 'SR cedric', NULL);
INSERT INTO public.dependant VALUES (732, '2016-01-11', 'JE Thanthrige', NULL);
INSERT INTO public.dependant VALUES (734, '1979-08-01', 'SKK Subasinghe', '197971403057V');
INSERT INTO public.dependant VALUES (735, '2017-05-29', 'JN Thanthrige', NULL);
INSERT INTO public.dependant VALUES (748, '2000-08-02', 'LLWM Damith', '200021502598');
INSERT INTO public.dependant VALUES (749, '1966-10-19', 'KTN Rupika', '667930634V');
INSERT INTO public.dependant VALUES (763, '2011-07-02', 'Mahimi Sirimalwala', NULL);
INSERT INTO public.dependant VALUES (764, '1969-03-20', 'Thusith Prasanna Sirimalwala', '690803348V');
INSERT INTO public.dependant VALUES (765, '2000-03-01', 'Dilumi Sirimalwala', '200056102948');
INSERT INTO public.dependant VALUES (766, '2003-01-21', 'Sasindu Iduwara Sirimalwala', '200302101060');
INSERT INTO public.dependant VALUES (767, '2004-11-06', 'Rasini Sirimalwala', '200481101250');
INSERT INTO public.dependant VALUES (788, '2018-11-19', 'DKH De Zoysa', NULL);
INSERT INTO public.dependant VALUES (793, '2018-11-19', 'DKS De Zoysa', NULL);
INSERT INTO public.dependant VALUES (795, '1973-03-28', 'DJ De Zoysa', '730883706V');
INSERT INTO public.dependant VALUES (804, '1985-03-27', 'KAVM Kuruvila', '855870517V');
INSERT INTO public.dependant VALUES (807, '2016-03-25', 'WMSR Senevirathna', NULL);
INSERT INTO public.dependant VALUES (811, '2018-01-25', 'WMSM Senevirathna', NULL);
INSERT INTO public.dependant VALUES (824, '2011-05-31', 'KLSS Smarajeewa', NULL);
INSERT INTO public.dependant VALUES (825, '2008-01-05', 'KLYN Samarajeewa', NULL);
INSERT INTO public.dependant VALUES (826, '1976-04-05', 'KLA Samarajeewa', '760960616V');
INSERT INTO public.dependant VALUES (840, '1972-08-11', 'DMPMK Dassanayaka', '197222402882');
INSERT INTO public.dependant VALUES (852, '1963-04-26', 'P.Wijesooriya', '636170208V');
INSERT INTO public.dependant VALUES (863, '1962-11-03', 'AMATP Alagiyawanna', '623132188V');
INSERT INTO public.dependant VALUES (874, '1968-06-25', 'MINDMP Madurasinghe', '686770079V');
INSERT INTO public.dependant VALUES (875, '2005-03-15', 'MARS Madurasinghe', NULL);
INSERT INTO public.dependant VALUES (876, '1999-11-22', 'MASL Madurasinghe', '998270053V');
INSERT INTO public.dependant VALUES (891, '2002-07-30', 'PDD Sandachaya', '200271201000');
INSERT INTO public.dependant VALUES (892, '1971-03-10', 'PDN Priyashantha', '197107001172');
INSERT INTO public.dependant VALUES (893, '2004-05-10', 'PDY Sithumina', NULL);
INSERT INTO public.dependant VALUES (906, '2007-07-10', 'CS Wijewickrama', NULL);
INSERT INTO public.dependant VALUES (907, '2004-05-30', 'TS Wijewickrama', '200415204613');
INSERT INTO public.dependant VALUES (911, '1981-03-28', 'CJ Wijewickrama', '198108802018');
INSERT INTO public.dependant VALUES (914, '2002-09-26', 'UCM Kumara', '200227000885');
INSERT INTO public.dependant VALUES (918, '2008-12-19', 'UPS Kumari', NULL);
INSERT INTO public.dependant VALUES (921, '1976-02-06', 'K Chandralatha', '197663701350');
INSERT INTO public.dependant VALUES (924, '2015-05-24', 'UKA Kumara', NULL);
INSERT INTO public.dependant VALUES (940, '1967-04-09', 'AAA Wimalasurendra', '971000099V');
INSERT INTO public.dependant VALUES (941, '2001-02-21', 'AAVS Athapaththu', '200155201215');
INSERT INTO public.dependant VALUES (343, '2016-10-14', 'NPRW Pandithage', NULL);
INSERT INTO public.dependant VALUES (344, '1987-05-25', 'NPS Udayakumara', '871361681V');
INSERT INTO public.dependant VALUES (357, '1958-06-10', 'GP Somawathie', '586620924V');
INSERT INTO public.dependant VALUES (358, '1956-05-11', 'PP Sandeshan', '561320055V');
INSERT INTO public.dependant VALUES (367, '2016-01-18', 'L Gamage', NULL);
INSERT INTO public.dependant VALUES (368, '1976-10-01', 'MGC Rangana', '197627500139');
INSERT INTO public.dependant VALUES (378, '1985-11-14', 'NH Kodippili', '198531901477');
INSERT INTO public.dependant VALUES (379, '2019-07-26', 'ILH Kodippili', NULL);
INSERT INTO public.dependant VALUES (398, '2005-12-11', 'JKIA Jayanetti', NULL);
INSERT INTO public.dependant VALUES (399, '1972-08-15', 'WAARD Athukorala', '727281894V');
INSERT INTO public.dependant VALUES (400, '2004-05-11', 'JKIG Jayanetti', NULL);
INSERT INTO public.dependant VALUES (410, '1959-01-10', 'BA Kumara', '590100994V');
INSERT INTO public.dependant VALUES (412, '1964-01-30', 'W Chandani', '645303474V');
INSERT INTO public.dependant VALUES (434, '1986-04-15', 'UKC Udatiyawela', '866061807V');
INSERT INTO public.dependant VALUES (435, '2020-03-13', 'PT Punchimudiyanse', NULL);
INSERT INTO public.dependant VALUES (446, '1968-05-01', 'DMWS Senarathne', '681220984V');
INSERT INTO public.dependant VALUES (451, '2012-11-17', 'MD Dahamneth', NULL);
INSERT INTO public.dependant VALUES (453, '1981-09-27', 'MSP Kumara', '198127100788');
INSERT INTO public.dependant VALUES (460, '2020-12-16', 'HAN Vihansa', NULL);
INSERT INTO public.dependant VALUES (462, '1993-01-21', 'HAN Dhanushka', '930210455V');
INSERT INTO public.dependant VALUES (485, '2005-07-07', 'GDKD Senevirathne', NULL);
INSERT INTO public.dependant VALUES (486, '1966-11-20', 'GDAND Senevirathne', '663250395V');
INSERT INTO public.dependant VALUES (487, '2001-04-27', 'GDNP Senevirathne', '200161803356');
INSERT INTO public.dependant VALUES (505, '1995-06-22', 'PKAT Panapitiya', '951741671V');
INSERT INTO public.dependant VALUES (507, '2023-02-27', 'PKVA Panatitiya', NULL);
INSERT INTO public.dependant VALUES (516, '1949-01-21', 'C Rajasingham', '490210415V');
INSERT INTO public.dependant VALUES (517, '1958-01-21', 'T Rajasingham', '195852102431');
INSERT INTO public.dependant VALUES (526, '1972-05-18', 'KDH Kumara', '721393895V');
INSERT INTO public.dependant VALUES (527, '2016-10-09', 'ST Gamage', NULL);
INSERT INTO public.dependant VALUES (539, '2016-02-21', 'LASN Liyanage', NULL);
INSERT INTO public.dependant VALUES (543, '2021-05-01', 'LAAR Liyanage', NULL);
INSERT INTO public.dependant VALUES (544, '2013-04-27', 'LATS Luiyanage', NULL);
INSERT INTO public.dependant VALUES (545, '1990-05-14', 'MGN Dilrukshi', '906352605V');
INSERT INTO public.dependant VALUES (566, '2008-04-03', 'BMSR Basnayaka', NULL);
INSERT INTO public.dependant VALUES (567, '1999-04-07', 'BMYL Basnayaka', '995982781V');
INSERT INTO public.dependant VALUES (568, '1964-11-05', 'BMAV Basnayaka', '196431001130');
INSERT INTO public.dependant VALUES (586, '1964-02-19', 'DGI Dehedeniya', '645501861V');
INSERT INTO public.dependant VALUES (588, '1962-05-30', 'PG Weerasinghe', '621512196V');
INSERT INTO public.dependant VALUES (603, '2000-01-26', 'BDK Deraniyagala', '200000600165');
INSERT INTO public.dependant VALUES (604, '2002-09-05', 'KG K Deraniyagala', '200224900759');
INSERT INTO public.dependant VALUES (605, '1970-10-26', 'HKMS Jenadasa', '708000434V');
INSERT INTO public.dependant VALUES (621, '1998-01-11', 'AD Abeysekera', '985110794V');
INSERT INTO public.dependant VALUES (623, '1965-09-19', 'UA Abeysekera', '652631320V');
INSERT INTO public.dependant VALUES (628, '1964-02-25', 'RSK Ranasundara', '196405600088');
INSERT INTO public.dependant VALUES (646, '2021-10-23', 'TAA Ehansa', NULL);
INSERT INTO public.dependant VALUES (647, '1995-02-14', 'DDSS Sewwandika', '955452488V');
INSERT INTO public.dependant VALUES (659, '2004-01-13', 'SS Samarawickrama', '200451313123');
INSERT INTO public.dependant VALUES (660, '2005-09-04', 'ST Samarawickrama', '200524800987');
INSERT INTO public.dependant VALUES (661, '2014-08-05', 'TS Samarawickrama', NULL);
INSERT INTO public.dependant VALUES (662, '1978-09-30', 'MD Warusamanna', '787740316V');
INSERT INTO public.dependant VALUES (677, '1984-06-22', 'ALU Madhubashini', '846741429V');
INSERT INTO public.dependant VALUES (678, '2013-01-14', 'SMSS Siriwardena', NULL);
INSERT INTO public.dependant VALUES (686, '1969-08-13', 'MMBMKS Dasanayaka', '697261966V');
INSERT INTO public.dependant VALUES (687, '1999-08-19', 'JAN Nawodani', '997321561V');
INSERT INTO public.dependant VALUES (697, '1982-08-26', 'SDS Hemachandra', '198277110027');
INSERT INTO public.dependant VALUES (721, '1961-01-05', 'HM Thilakarathna', '610050409V');
INSERT INTO public.dependant VALUES (723, '1960-09-09', 'RDL Ranasinghe', '607530653V');
INSERT INTO public.dependant VALUES (733, '1980-07-08', 'AE Rajapaksha', '806903760V');
INSERT INTO public.dependant VALUES (736, '2016-08-05', 'IMPA Illangakoon', NULL);
INSERT INTO public.dependant VALUES (737, '2011-02-04', 'IMGU Illangakoon', NULL);
INSERT INTO public.dependant VALUES (754, '1960-08-04', 'WD Somaseeli', '607171203V');
INSERT INTO public.dependant VALUES (755, '2025-03-21', 'NG Karunathilake', '573432975V');
INSERT INTO public.dependant VALUES (771, '2021-09-20', 'HGSD Thilakarathna', NULL);
INSERT INTO public.dependant VALUES (773, '1987-06-14', 'WCP Fernando', '876661764V');
INSERT INTO public.dependant VALUES (781, '1964-09-10', 'MM Gunasinghe', '642542109V');
INSERT INTO public.dependant VALUES (785, '1965-08-11', 'MAW Sarath Kumara', '652240739V');
INSERT INTO public.dependant VALUES (790, '2003-05-13', 'MAH Ravihan Kumara', NULL);
INSERT INTO public.dependant VALUES (799, '1989-02-11', 'YSM Peiris', '198980702746');
INSERT INTO public.dependant VALUES (805, '2018-08-17', 'SAJT Abeyweera', NULL);
INSERT INTO public.dependant VALUES (809, '2015-04-05', 'SAG Oshan abeyweera', NULL);
INSERT INTO public.dependant VALUES (813, '2020-06-15', 'SASC Abeywera', NULL);
INSERT INTO public.dependant VALUES (815, '1984-07-08', 'DMYL Dissanayaka', '846900969V');
INSERT INTO public.dependant VALUES (827, '2020-07-27', 'ARS Mapalagama', NULL);
INSERT INTO public.dependant VALUES (831, '2020-07-26', 'ARS Mapalagama', NULL);
INSERT INTO public.dependant VALUES (833, '1984-03-27', 'AS Mapalagama', '840873765V');
INSERT INTO public.dependant VALUES (847, '1972-06-03', 'WPGDDN Jayawardena', '197215502837');
INSERT INTO public.dependant VALUES (848, '2008-04-24', 'RS Jayawardena', NULL);
INSERT INTO public.dependant VALUES (861, '1962-08-24', 'CP Wijesekara', '6225371197');
INSERT INTO public.dependant VALUES (862, '1998-03-23', 'JCP Wijesekara', '980832902');
INSERT INTO public.dependant VALUES (884, '2011-11-28', 'MMk Udugame', NULL);
INSERT INTO public.dependant VALUES (885, '1969-02-04', 'MRG Udugame', '695350090V');
INSERT INTO public.dependant VALUES (886, '2002-07-22', 'LBK Udugame', '2002220403973');
INSERT INTO public.dependant VALUES (887, '2004-05-24', 'SDK Udugame', NULL);
INSERT INTO public.dependant VALUES (903, '1991-06-05', 'MFM Zaheen', '911571331V');
INSERT INTO public.dependant VALUES (904, '2016-12-29', 'MZ Ayaan', NULL);
INSERT INTO public.dependant VALUES (905, '2022-07-16', 'MZA Lidha', NULL);
INSERT INTO public.dependant VALUES (915, '1980-07-15', 'WGC Kumari', '806971634V');
INSERT INTO public.dependant VALUES (920, '2015-04-20', 'TMIH Thennakoon', NULL);
INSERT INTO public.dependant VALUES (922, '2009-03-29', 'TMCEB Thennakoon', NULL);
INSERT INTO public.dependant VALUES (925, '2004-11-21', 'TMDN Thennakoon', NULL);
INSERT INTO public.dependant VALUES (932, '1959-10-26', 'RS Wijesekera', '593000478V');
INSERT INTO public.dependant VALUES (345, '1959-01-09', 'BJ Ramanayaka', '195900910096');
INSERT INTO public.dependant VALUES (346, '1965-08-07', 'KAPK Perera', '657200328V');
INSERT INTO public.dependant VALUES (361, '1963-07-30', 'SWAB Daulagala', '632120877V');
INSERT INTO public.dependant VALUES (369, '1985-04-07', 'KAI Chandrasekara', '855980983V');
INSERT INTO public.dependant VALUES (370, '2016-03-08', 'BL Chandrasekara', NULL);
INSERT INTO public.dependant VALUES (381, '1996-08-06', 'HSK Silva', '967190667V');
INSERT INTO public.dependant VALUES (384, '1963-08-22', 'HPP Silva', '19632350287');
INSERT INTO public.dependant VALUES (387, '2002-06-22', 'HTE Silva', '200267400709');
INSERT INTO public.dependant VALUES (394, '1999-06-08', 'WMM Jayarathna', '996601722V');
INSERT INTO public.dependant VALUES (406, '2005-11-19', 'DHKD Jayalath', NULL);
INSERT INTO public.dependant VALUES (407, '2002-04-16', 'DHLN Jayalath', '200210700136');
INSERT INTO public.dependant VALUES (408, '1973-06-28', 'UAN Gunarathne', '7368000740V');
INSERT INTO public.dependant VALUES (421, '1996-05-21', 'LAG Lindamulage', '961421640V');
INSERT INTO public.dependant VALUES (422, '2003-02-17', 'MD Lindamulage', '200354810160');
INSERT INTO public.dependant VALUES (423, '1966-06-22', 'LL Silva', '661740442V');
INSERT INTO public.dependant VALUES (424, '1998-07-12', 'JM Lindamulsage', '986960473V');
INSERT INTO public.dependant VALUES (436, '2009-09-17', 'RMMD Rathnakara', NULL);
INSERT INTO public.dependant VALUES (437, '2004-08-30', 'RMCS Rathnakara', '200424300663');
INSERT INTO public.dependant VALUES (438, '1972-04-18', 'RMCK Rathnakara', '721094545V');
INSERT INTO public.dependant VALUES (447, '1947-01-18', 'PN Manthilake', '475181077V');
INSERT INTO public.dependant VALUES (448, '1947-10-21', 'YG Wijeratne', '194729510048');
INSERT INTO public.dependant VALUES (454, '1945-03-28', 'A Godagama', '19450882267');
INSERT INTO public.dependant VALUES (455, '1947-01-19', 'PN Nanayakkara', '475190904V');
INSERT INTO public.dependant VALUES (473, '2011-10-10', 'ODDM Dissanayake', NULL);
INSERT INTO public.dependant VALUES (474, '2003-11-13', 'ODKT Dissanayake', '200381812895');
INSERT INTO public.dependant VALUES (475, '2012-10-09', 'ODSS Dissanayake', NULL);
INSERT INTO public.dependant VALUES (476, '1973-06-07', 'MHTNP Thisera', '736592304V');
INSERT INTO public.dependant VALUES (496, '1995-12-13', 'BGMD Hirunpriya', '953484021V');
INSERT INTO public.dependant VALUES (500, '1967-04-01', 'RC Patterson', '675920443V');
INSERT INTO public.dependant VALUES (502, '1997-03-06', 'BGMD Hirunpriya', '975662691V');
INSERT INTO public.dependant VALUES (509, '1993-10-16', 'WTMK Gayan', '932900521V');
INSERT INTO public.dependant VALUES (522, '1958-12-29', 'D Ekanayaka', '583642617V');
INSERT INTO public.dependant VALUES (535, '2007-06-18', 'KAUA Perera', NULL);
INSERT INTO public.dependant VALUES (536, '1997-03-15', 'KW Sewwandi', '975751791V');
INSERT INTO public.dependant VALUES (537, '2011-01-10', 'KST Perera', NULL);
INSERT INTO public.dependant VALUES (540, '2018-03-24', 'KWP', NULL);
INSERT INTO public.dependant VALUES (549, '2001-11-12', 'WMVSB Weerakoon', '200131703325');
INSERT INTO public.dependant VALUES (551, '1996-03-15', 'WMJC Weerakoon', '965751068V');
INSERT INTO public.dependant VALUES (553, '1964-03-14', 'WMVKB Weerakoon', '640740043V');
INSERT INTO public.dependant VALUES (563, '2015-10-15', 'SPT SolangaArachchi', NULL);
INSERT INTO public.dependant VALUES (571, '1981-11-30', 'KRK Munasinghe', '198183502263');
INSERT INTO public.dependant VALUES (587, '1953-06-03', 'DC Dewaperuma', NULL);
INSERT INTO public.dependant VALUES (599, '2018-08-01', 'YD Bandulahewa', NULL);
INSERT INTO public.dependant VALUES (602, '1983-03-17', 'CDB Hewa', '198307700372');
INSERT INTO public.dependant VALUES (618, '2008-08-24', 'PAC Perera', NULL);
INSERT INTO public.dependant VALUES (619, '2012-12-19', 'PTA Perera', NULL);
INSERT INTO public.dependant VALUES (620, '1969-11-18', 'PRC Perera', '693230257V');
INSERT INTO public.dependant VALUES (627, '1945-03-21', 'KA Karunasena Kodithuwakku', '450813087V');
INSERT INTO public.dependant VALUES (629, '2009-09-29', 'AGK Gayeshi', NULL);
INSERT INTO public.dependant VALUES (631, '2014-02-21', 'AGRS Himansana', NULL);
INSERT INTO public.dependant VALUES (640, '2004-09-03', 'RAHMC Ayesha', NULL);
INSERT INTO public.dependant VALUES (641, '2041-03-05', 'RAHMN Poorna', NULL);
INSERT INTO public.dependant VALUES (642, '1975-06-15', 'HMR Menika', '756671200V');
INSERT INTO public.dependant VALUES (643, '2008-12-19', 'RAHMS Imeshi', NULL);
INSERT INTO public.dependant VALUES (653, '2000-02-08', 'NNW Goonewardena', '200003900580');
INSERT INTO public.dependant VALUES (654, '1998-10-31', 'IMW Goonewardena', '199830510223');
INSERT INTO public.dependant VALUES (670, '2004-09-06', 'DSV Arandara', NULL);
INSERT INTO public.dependant VALUES (671, '1975-03-02', 'BVSP Bandaragama', '755625714V');
INSERT INTO public.dependant VALUES (674, '2008-12-24', 'DTN Arandar', NULL);
INSERT INTO public.dependant VALUES (680, '1966-03-14', 'AW Weerasekara', '665741257V');
INSERT INTO public.dependant VALUES (682, '1998-05-09', 'BDU Rashmi', '986302743V');
INSERT INTO public.dependant VALUES (688, '2013-06-19', 'BPPT Karunarathna', NULL);
INSERT INTO public.dependant VALUES (689, '1981-10-13', 'DMDD Alwis', '817873715V');
INSERT INTO public.dependant VALUES (690, '2012-01-16', 'BPND Karunarathna', NULL);
INSERT INTO public.dependant VALUES (691, '2016-06-19', 'BPLN Karunarathna', NULL);
INSERT INTO public.dependant VALUES (704, '2016-09-22', 'VS Wimalasiri', NULL);
INSERT INTO public.dependant VALUES (705, '2007-08-17', 'OP Wimalasiri', NULL);
INSERT INTO public.dependant VALUES (706, '2009-03-31', 'VS Wimalasiri', NULL);
INSERT INTO public.dependant VALUES (707, '1975-11-17', 'SP Samarakoon', '758221113V');
INSERT INTO public.dependant VALUES (708, '2013-11-25', 'SM Wimalasiri', NULL);
INSERT INTO public.dependant VALUES (719, '1990-11-21', 'IU Deavasinghe', '908260198V');
INSERT INTO public.dependant VALUES (720, '2017-09-04', 'TMSG Thennakoon', NULL);
INSERT INTO public.dependant VALUES (742, '2006-03-17', 'WDV Sandeena', NULL);
INSERT INTO public.dependant VALUES (744, '1980-08-24', 'BHAN Tharangani', '807376144V');
INSERT INTO public.dependant VALUES (745, '2012-01-27', 'WDS Sithumsa', NULL);
INSERT INTO public.dependant VALUES (746, '2018-03-16', 'WDH Sehansa', NULL);
INSERT INTO public.dependant VALUES (747, '2018-03-16', 'WDS Sanulya', NULL);
INSERT INTO public.dependant VALUES (758, '1957-09-09', 'N Karunathunga', '195725301791');
INSERT INTO public.dependant VALUES (760, '1958-09-26', 'RA Indrani', '587700948V');
INSERT INTO public.dependant VALUES (770, '1969-01-19', 'DMEM Dissanayaka', '695191111V');
INSERT INTO public.dependant VALUES (779, '2010-06-07', 'H Rishni Akarsha Perera', NULL);
INSERT INTO public.dependant VALUES (780, '1969-01-20', 'ASN Pigera', '695200137V');
INSERT INTO public.dependant VALUES (796, '1964-01-29', 'AGC Thilak', '196402900692');
INSERT INTO public.dependant VALUES (797, '1973-09-04', 'KHS Latha', '737482189V');
INSERT INTO public.dependant VALUES (803, '1999-07-13', 'Erica Morais', '996952827V');
INSERT INTO public.dependant VALUES (808, '1970-02-23', 'MN Morais', '705542171V');
INSERT INTO public.dependant VALUES (812, '2002-06-21', 'Alex Flavian Morais', '200217300179');
INSERT INTO public.dependant VALUES (820, '2014-01-21', 'WKS Nenuka', NULL);
INSERT INTO public.dependant VALUES (822, '1985-01-21', 'LP Munasinghe', '855212641V');
INSERT INTO public.dependant VALUES (839, '2018-05-02', 'Awso Adikari', NULL);
INSERT INTO public.dependant VALUES (842, '2010-08-09', 'AWSN Adikari', NULL);
INSERT INTO public.dependant VALUES (844, '1980-06-12', 'ULEI Sumathipala', '806631221V');
INSERT INTO public.dependant VALUES (853, '2009-12-17', 'OG Liyanage', NULL);
INSERT INTO public.dependant VALUES (854, '1977-11-13', 'WNM Cooray', '778182688V');
INSERT INTO public.dependant VALUES (857, '2007-11-04', 'DG Liyanage', NULL);
INSERT INTO public.dependant VALUES (870, '1970-06-08', 'PN Preethika', '706602160V');
INSERT INTO public.dependant VALUES (894, '2014-10-04', 'WMRDB Thilakarathna', NULL);
INSERT INTO public.dependant VALUES (895, '2020-01-28', 'WMSTB Thilakarathna', NULL);
INSERT INTO public.dependant VALUES (896, '1986-03-24', 'WMLBB Thilakarathna', '860842475V');
INSERT INTO public.dependant VALUES (908, '2001-12-25', 'KRBL Kodithuwakku', '200136002960');
INSERT INTO public.dependant VALUES (910, '1965-05-12', 'KRA Kodithuwakku', '651330955V');
INSERT INTO public.dependant VALUES (926, '2002-10-22', 'TD Thennage', '200209602375V');
INSERT INTO public.dependant VALUES (928, '1971-11-18', 'RAK Sumanasinghe', '715232341V');
INSERT INTO public.dependant VALUES (930, '2009-09-05', 'MD Thennage', NULL);
INSERT INTO public.dependant VALUES (945, '2010-06-06', 'MKTI Gunawaardena', NULL);
INSERT INTO public.dependant VALUES (946, '2000-11-20', 'MKLS Gunawardena', '200082504520');
INSERT INTO public.dependant VALUES (947, '2002-04-07', 'MTKUI Gunawardena', '20029800449');
INSERT INTO public.dependant VALUES (948, '2003-12-23', 'MTKBT Gunawardena', NULL);
INSERT INTO public.dependant VALUES (949, '2007-07-19', 'MKPM Gunawardena', NULL);
INSERT INTO public.dependant VALUES (950, '1967-04-27', 'MKS Kalyani', '196761804007');
INSERT INTO public.dependant VALUES (951, '2008-09-20', 'UMA Jayawardena', NULL);
INSERT INTO public.dependant VALUES (952, '1975-05-12', 'RGU Jayalal', '751332351V');
INSERT INTO public.dependant VALUES (953, '1973-05-08', 'KACS Senarathna', '731290539V');
INSERT INTO public.dependant VALUES (954, '1984-02-05', 'DDI Kaluaratchi', '845362408V');
INSERT INTO public.dependant VALUES (955, '2015-02-19', 'WADS Wickramasinghe', NULL);
INSERT INTO public.dependant VALUES (956, '2007-05-15', 'KANM Senarathna', NULL);
INSERT INTO public.dependant VALUES (957, '2015-09-03', 'AGAA Gunasekara', NULL);
INSERT INTO public.dependant VALUES (958, '2012-08-01', 'AGOJ Gunasekara', NULL);
INSERT INTO public.dependant VALUES (959, '1977-08-11', 'AGDD Gunasekara', '772242654V');
INSERT INTO public.dependant VALUES (960, '2021-01-26', 'AGDS Gunasekara', NULL);
INSERT INTO public.dependant VALUES (961, '2015-11-02', 'AMSK Adhikari', NULL);
INSERT INTO public.dependant VALUES (962, '1984-10-07', 'GSD Kumari', '846923179V');
INSERT INTO public.dependant VALUES (963, '1983-12-23', 'CN Hettiarachchi', '838583512V');
INSERT INTO public.dependant VALUES (964, '2014-04-18', 'TN Harischndra', NULL);
INSERT INTO public.dependant VALUES (965, '2010-06-10', 'HA Harischandra', NULL);
INSERT INTO public.dependant VALUES (966, '1961-11-06', 'PR Rathnaweera', '618110613V');
INSERT INTO public.dependant VALUES (967, '1978-11-02', 'VN Priyadarshani', '788072813V');
INSERT INTO public.dependant VALUES (968, '2008-11-10', 'WAV Savidula', NULL);
INSERT INTO public.dependant VALUES (969, '1991-12-14', 'NK Wijayarathna', '918491031V');
INSERT INTO public.dependant VALUES (970, '2015-06-20', 'WAM Nethumsa', NULL);
INSERT INTO public.dependant VALUES (971, '2021-05-14', 'UDAK Wijayarathna', NULL);
INSERT INTO public.dependant VALUES (972, '2002-01-11', 'GAS Chathuranga', '200251100817');
INSERT INTO public.dependant VALUES (973, '1970-06-30', 'KDS Renuka', '706823158V');
INSERT INTO public.dependant VALUES (974, '1997-07-03', 'GADS Mihiranga', '971851902V');
INSERT INTO public.dependant VALUES (975, '1971-04-17', 'SM Pathiraja', '716083004V');
INSERT INTO public.dependant VALUES (976, '1997-12-17', 'SNA Premarathna', '978520677V');
INSERT INTO public.dependant VALUES (977, '2003-05-08', 'ST Avishka', '200312912164');
INSERT INTO public.dependant VALUES (1003, '2008-06-27', 'GM Yohansa', NULL);
INSERT INTO public.dependant VALUES (1021, '1979-10-16', 'DLCM Wishwakularathna', '197979004597');
INSERT INTO public.dependant VALUES (1022, '2015-09-03', 'WS Akenya', NULL);
INSERT INTO public.dependant VALUES (1023, '2020-10-02', 'WD Thevmin', NULL);
INSERT INTO public.dependant VALUES (1035, '1980-09-15', 'PNU de Silva', '802593953V');
INSERT INTO public.dependant VALUES (1036, '2013-09-05', 'PCS De Silva', NULL);
INSERT INTO public.dependant VALUES (1053, '1991-09-03', 'SASG Subasinghe', '912470962V');
INSERT INTO public.dependant VALUES (1054, '2019-10-15', 'SAGD Subasinghe', NULL);
INSERT INTO public.dependant VALUES (1062, '1991-01-25', 'DC Gunawardana', '910252046V');
INSERT INTO public.dependant VALUES (1063, '2022-05-10', 'DMJSR Gunawardana', NULL);
INSERT INTO public.dependant VALUES (1073, '2010-06-16', 'M Deshani', NULL);
INSERT INTO public.dependant VALUES (1075, '2013-11-27', 'M Pavinya', NULL);
INSERT INTO public.dependant VALUES (1078, '1976-09-21', 'K Mukunthan', '762651130V');
INSERT INTO public.dependant VALUES (1081, '2019-03-06', 'M Sakish', NULL);
INSERT INTO public.dependant VALUES (1092, '1986-12-28', 'GPK Gunathunga', '868633492V');
INSERT INTO public.dependant VALUES (1094, '2014-01-16', 'MHD Malanayake', NULL);
INSERT INTO public.dependant VALUES (1095, '2017-11-22', 'MDH Malanayake', NULL);
INSERT INTO public.dependant VALUES (1107, '2021-05-02', 'ARPDJ Amarasinghe', NULL);
INSERT INTO public.dependant VALUES (1108, '2015-01-16', 'ARPNT Amarasinghe', NULL);
INSERT INTO public.dependant VALUES (1109, '2011-04-12', 'ARRKJ Amarasinghe', NULL);
INSERT INTO public.dependant VALUES (1110, '2019-10-23', 'ARPMB Amarasinghe', NULL);
INSERT INTO public.dependant VALUES (1111, '1986-03-02', 'AGN Rajapaksha', '865620217V');
INSERT INTO public.dependant VALUES (1116, '2019-06-20', 'SB Wickramage', NULL);
INSERT INTO public.dependant VALUES (1118, '1982-08-09', 'HKD Samantha', '198272203751');
INSERT INTO public.dependant VALUES (1130, '2019-06-15', 'GGCS Jayabandara', NULL);
INSERT INTO public.dependant VALUES (1132, '1991-11-04', 'GGPSK Jayapola', '913090756V');
INSERT INTO public.dependant VALUES (1148, '1966-10-26', 'KV Nimali', '668001157V');
INSERT INTO public.dependant VALUES (1158, '1981-06-15', 'JHA Fernando', '816670489V');
INSERT INTO public.dependant VALUES (1159, '2008-01-01', 'SM Abeysekara', NULL);
INSERT INTO public.dependant VALUES (1177, '1991-02-10', 'PSA Weerasuriya', '910410717 V');
INSERT INTO public.dependant VALUES (1178, '2023-05-12', 'PTO Weerasuriya', NULL);
INSERT INTO public.dependant VALUES (1191, '1964-05-19', 'HV Premachandra', '196414002311');
INSERT INTO public.dependant VALUES (1192, '1961-10-01', 'P Karunawathi', '617750988V');
INSERT INTO public.dependant VALUES (1203, '1993-08-23', 'DDMA Gunarathne', '937360061V');
INSERT INTO public.dependant VALUES (1226, '1988-01-29', 'WMSK Weerakoon', '198852902437');
INSERT INTO public.dependant VALUES (1235, '1970-09-19', 'WMRK Wijesooriya', '197076301171');
INSERT INTO public.dependant VALUES (1246, '2014-04-20', 'RMDY Yowinma', NULL);
INSERT INTO public.dependant VALUES (1247, '1980-10-18', 'DH Rasangi', '807923927V');
INSERT INTO public.dependant VALUES (1256, '1993-09-07', 'MGN Perera', '937711832V');
INSERT INTO public.dependant VALUES (1257, '2023-06-17', 'MA Owen', NULL);
INSERT INTO public.dependant VALUES (1267, '1996-04-05', 'NS Fenando', '960962990V');
INSERT INTO public.dependant VALUES (1275, '1995-10-14', 'WSR Athukorala', '952881876V');
INSERT INTO public.dependant VALUES (1276, '2025-03-21', 'WYR  Athukorala', NULL);
INSERT INTO public.dependant VALUES (1287, '1997-08-01', 'PKH Bhagya', '977142466V');
INSERT INTO public.dependant VALUES (1295, '1994-10-10', 'AUI Perera', '942840136V');
INSERT INTO public.dependant VALUES (1308, '1991-12-31', 'MKS Karunarathne', '913661710V');
INSERT INTO public.dependant VALUES (1317, '2020-01-18', 'J Ananya', NULL);
INSERT INTO public.dependant VALUES (1319, '1907-05-29', 'J Abinesh', NULL);
INSERT INTO public.dependant VALUES (1320, '1978-12-26', 'K Jeyakanthan', '783610191V');
INSERT INTO public.dependant VALUES (1322, '2017-06-27', 'J Aadesh', NULL);
INSERT INTO public.dependant VALUES (1324, '2014-09-01', 'J Akshitha', NULL);
INSERT INTO public.dependant VALUES (1333, '1994-01-10', 'GKAL Lakshika', '945102004V');
INSERT INTO public.dependant VALUES (1341, '1949-11-12', 'H Irangani', '498170757v');
INSERT INTO public.dependant VALUES (1342, '1949-01-07', 'MHP Appuhami', '490070915v');
INSERT INTO public.dependant VALUES (1351, '1960-03-26', 'JM Kusumlatha', '196058601610');
INSERT INTO public.dependant VALUES (1364, '1988-07-07', 'Dolewatte Appuhamilage Shanika Anuradhi Wimaladarma', '886893191');
INSERT INTO public.dependant VALUES (1366, '2021-12-27', 'Sithara Rivinath Premerathne', NULL);
INSERT INTO public.dependant VALUES (1374, '1992-04-16', 'Dilin Nisansala Amarasinghe Archchi', '926070380');
INSERT INTO public.dependant VALUES (1375, '2021-12-30', 'Uruvitiya Gamage Thisas Hsnsilu', NULL);
INSERT INTO public.dependant VALUES (1389, '1955-01-19', 'Athuraliya Badalge Dayananda', '550190877');
INSERT INTO public.dependant VALUES (1397, '1996-05-20', 'DN Karunasinghe', '966412151 V');
INSERT INTO public.dependant VALUES (1408, '2025-03-21', 'BPGTK', NULL);
INSERT INTO public.dependant VALUES (1419, '1952-11-02', 'WACS Fernando', '523071343V');
INSERT INTO public.dependant VALUES (1437, '2009-10-27', 'JAPJ Abeyrathne', NULL);
INSERT INTO public.dependant VALUES (1438, '2014-01-16', 'JAHA Abeyrathna', NULL);
INSERT INTO public.dependant VALUES (1439, '2025-03-21', 'EM Chandrakanthi', '197380000099');
INSERT INTO public.dependant VALUES (1445, '1968-10-30', 'KDS Priyahgahee', '688041473V');
INSERT INTO public.dependant VALUES (1455, '2025-03-21', 'AAS perera', '726922004V');
INSERT INTO public.dependant VALUES (1456, '2025-03-21', 'MDS Anuththara', '200377810489');
INSERT INTO public.dependant VALUES (1459, '2015-06-19', 'TBS Senaratne', NULL);
INSERT INTO public.dependant VALUES (1460, '2025-03-21', 'T Aruna Senarathne', '750433999V');
INSERT INTO public.dependant VALUES (1468, '1960-08-22', 'TGNJ  Wickramasinghe', '607354132V');
INSERT INTO public.dependant VALUES (1469, '1958-01-19', 'BAR Ranasinghe', '195801902700');
INSERT INTO public.dependant VALUES (1479, '1991-03-10', 'BRAS Thilakarathna', '910701185V');
INSERT INTO public.dependant VALUES (1504, '1993-05-28', 'DMT Lakshan', '931493043V');
INSERT INTO public.dependant VALUES (1505, '2022-09-21', 'DMHD Dissanayake', NULL);
INSERT INTO public.dependant VALUES (1517, '2004-04-22', 'WMCJ Wickramasinghe', '795722092V');
INSERT INTO public.dependant VALUES (1518, '1900-01-11', 'RGSD Rajapaksha', '722142195 V');
INSERT INTO public.dependant VALUES (1519, '2008-08-04', 'WMLG Wickramasinghe', '2004113005118');
INSERT INTO public.dependant VALUES (1525, '1945-03-09', 'ADWF Senarathne', '455690560V');
INSERT INTO public.dependant VALUES (1533, '1987-05-02', 'MMA Sriyani', '876231190V');
INSERT INTO public.dependant VALUES (1536, '2017-04-11', 'PRS Ranmina', NULL);
INSERT INTO public.dependant VALUES (1537, '2009-10-02', 'PRT Esandu', NULL);
INSERT INTO public.dependant VALUES (1552, '1979-06-26', 'JASP Eooriyasena', '197967800568');
INSERT INTO public.dependant VALUES (1553, '2011-01-30', 'AMMS Gunathilaka', NULL);
INSERT INTO public.dependant VALUES (1554, '2011-01-30', 'AMMV Gunathilaka', NULL);
INSERT INTO public.dependant VALUES (1566, '1962-04-25', 'NS Abeysinghe', '621152661V');
INSERT INTO public.dependant VALUES (1570, '2022-03-26', 'AMV Perera ', NULL);
INSERT INTO public.dependant VALUES (1571, '1988-03-15', 'AMNK Perera', '881522098V');
INSERT INTO public.dependant VALUES (1572, '2016-10-05', 'AVN Perera', NULL);
INSERT INTO public.dependant VALUES (1579, '1994-02-10', 'EMSS Balasooriya', '199404102102');
INSERT INTO public.dependant VALUES (1580, '1972-03-02', 'TD De Silva', '197256201540');
INSERT INTO public.dependant VALUES (1581, '2008-01-06', 'EMSN Balasooriya', '200800700034191');
INSERT INTO public.dependant VALUES (1582, '1992-12-02', 'EMJM Balasooriya', '988370797V');
INSERT INTO public.dependant VALUES (1594, '1978-06-08', 'ND Samarawickrama', '786601614V');
INSERT INTO public.dependant VALUES (1595, '1970-12-07', 'AVS Wasantha', '197034203612');
INSERT INTO public.dependant VALUES (1612, '1992-02-18', 'KRH Karunathilake', '920494250V');
INSERT INTO public.dependant VALUES (978, '1975-04-10', 'HBG Rakumthala', '756020862V');
INSERT INTO public.dependant VALUES (979, '2008-03-30', 'YGS Mehansa', NULL);
INSERT INTO public.dependant VALUES (980, '2011-04-20', 'YGN Ruhansa', NULL);
INSERT INTO public.dependant VALUES (997, '2008-03-14', 'KLE Kawithma', NULL);
INSERT INTO public.dependant VALUES (999, '1981-10-04', 'AI Gamage', '817783724V');
INSERT INTO public.dependant VALUES (1001, '2005-05-10', 'KLV Gaurawa', '200513101200');
INSERT INTO public.dependant VALUES (1009, '2019-10-27', 'MSR Wijewardena', NULL);
INSERT INTO public.dependant VALUES (1010, '2019-10-27', 'MSR Wijewardena', NULL);
INSERT INTO public.dependant VALUES (1011, '2015-04-24', 'DTR Wijewardena', NULL);
INSERT INTO public.dependant VALUES (1012, '1983-04-11', 'DSR Wijewardena', '831021039V');
INSERT INTO public.dependant VALUES (1024, '2001-08-16', 'GHMSI Herath', '200172902930');
INSERT INTO public.dependant VALUES (1025, '1972-08-15', 'LGK Liyanage', '787282288V');
INSERT INTO public.dependant VALUES (1043, '2004-05-18', 'MKI Costa', NULL);
INSERT INTO public.dependant VALUES (1044, '2009-05-09', 'MSR de Costa', NULL);
INSERT INTO public.dependant VALUES (1045, '1979-10-24', 'DD Kumari', '19797980050');
INSERT INTO public.dependant VALUES (1056, '1963-12-02', 'DM Wijesinghe', '633372683V');
INSERT INTO public.dependant VALUES (1057, '2000-09-03', 'DMTI Dilshan', '200024701278');
INSERT INTO public.dependant VALUES (1059, '2005-12-23', 'DMAS Lakshan', '200535801043');
INSERT INTO public.dependant VALUES (1067, '2014-03-28', 'M Kishorthika', NULL);
INSERT INTO public.dependant VALUES (1068, '2006-08-25', 'M Mathushiya', NULL);
INSERT INTO public.dependant VALUES (1070, '2017-06-10', 'M Jerushan', NULL);
INSERT INTO public.dependant VALUES (1072, '1983-11-02', 'M Jeyamalini', '838073352V');
INSERT INTO public.dependant VALUES (1084, '2002-08-23', 'SD Pasqual', '2002273601477');
INSERT INTO public.dependant VALUES (1086, '2000-06-16', 'AC Pasqual', '200066802753');
INSERT INTO public.dependant VALUES (1090, '1966-05-26', 'AA Pasqual', '661470313V');
INSERT INTO public.dependant VALUES (1102, '1981-06-30', 'NKSSK Nanayakkara', '816821088V');
INSERT INTO public.dependant VALUES (1103, '2010-04-20', 'AGSC Gamage', NULL);
INSERT INTO public.dependant VALUES (1104, '2015-01-06', 'AGDT Gamage', NULL);
INSERT INTO public.dependant VALUES (1123, '1978-03-06', 'RIRA Karunathilake', '780664967V');
INSERT INTO public.dependant VALUES (1135, '1971-11-08', 'DRSR Bandara', '713133299V');
INSERT INTO public.dependant VALUES (1136, '2003-08-08', 'DRBY Bandara', '200322113624');
INSERT INTO public.dependant VALUES (1144, '1986-06-07', 'PSC Fernando', '861594009V');
INSERT INTO public.dependant VALUES (1145, '2022-11-14', 'PSR Fernando', NULL);
INSERT INTO public.dependant VALUES (1149, '2009-10-12', 'K Hesiga', NULL);
INSERT INTO public.dependant VALUES (1150, '2015-04-28', 'K Mideesha', NULL);
INSERT INTO public.dependant VALUES (1152, '1977-08-18', 'K Anushapillai', '197773100577');
INSERT INTO public.dependant VALUES (1169, '2021-11-01', 'HMM Wijesooriya', NULL);
INSERT INTO public.dependant VALUES (1171, '1988-04-10', 'HKA Dilrukshi', '198860102853');
INSERT INTO public.dependant VALUES (1184, '2009-10-06', 'B Akjileshan', NULL);
INSERT INTO public.dependant VALUES (1186, '2011-10-30', 'B Atheheshan', NULL);
INSERT INTO public.dependant VALUES (1187, '1978-09-18', 'S Balamurali', '787620707V');
INSERT INTO public.dependant VALUES (1198, '1957-04-09', 'PRG Karunathilake', '571001632V');
INSERT INTO public.dependant VALUES (1199, '1966-09-27', 'MMY Wimaladharma', '667710073V');
INSERT INTO public.dependant VALUES (1213, '2011-08-16', 'KPND Jayarathna', NULL);
INSERT INTO public.dependant VALUES (1214, '1974-05-30', 'MG Gunadikari', '747430306V');
INSERT INTO public.dependant VALUES (1215, '2015-05-02', 'KPMS Jayarathna', NULL);
INSERT INTO public.dependant VALUES (1216, '2008-11-02', 'KPTP Jayarathna', NULL);
INSERT INTO public.dependant VALUES (1236, '1965-02-17', 'MH Jeewani', '655481540V');
INSERT INTO public.dependant VALUES (1237, '1965-01-07', 'RABC Perera', '650073231V');
INSERT INTO public.dependant VALUES (1243, '1963-08-25', 'WWA Malanie', '196373803752');
INSERT INTO public.dependant VALUES (1245, '1960-02-02', 'SACR Sooriyapperuma', '600331442V');
INSERT INTO public.dependant VALUES (1253, '1988-01-04', 'SM Vidanapathirana', '885040241V');
INSERT INTO public.dependant VALUES (1255, '2017-04-19', 'WAJJ Perera', NULL);
INSERT INTO public.dependant VALUES (1263, '1974-09-24', 'WAC Irangani', '747680183v');
INSERT INTO public.dependant VALUES (1264, '1974-08-04', 'KAD Sillva', '742172236v');
INSERT INTO public.dependant VALUES (1270, '2020-04-01', 'WANS Rochana', NULL);
INSERT INTO public.dependant VALUES (1280, '1975-09-29', 'Ashmal Marikkar', '757731584V');
INSERT INTO public.dependant VALUES (1282, '1967-12-01', 'Afsal Marikkar', '673362761V');
INSERT INTO public.dependant VALUES (1290, '2023-07-19', 'WDC Vidaswin', NULL);
INSERT INTO public.dependant VALUES (1291, '1992-10-16', 'WP Pandipperuma', '927903210V');
INSERT INTO public.dependant VALUES (1301, '2022-12-06', 'HVRY Vithana', NULL);
INSERT INTO public.dependant VALUES (1303, '1989-03-23', 'DDT Piumalie', '895834980V');
INSERT INTO public.dependant VALUES (1304, '2020-02-13', 'HVMP Vitana', NULL);
INSERT INTO public.dependant VALUES (1314, '2021-09-27', 'DMS Abdullah', NULL);
INSERT INTO public.dependant VALUES (1315, '2022-11-01', 'DMS Abdullah', NULL);
INSERT INTO public.dependant VALUES (1316, '2018-09-18', 'DMU Abdullah', NULL);
INSERT INTO public.dependant VALUES (1318, '1998-08-04', 'MAN Begam', '987173505V');
INSERT INTO public.dependant VALUES (1328, '2020-10-16', 'JHS Thehansa', NULL);
INSERT INTO public.dependant VALUES (1330, '1984-07-20', 'BWDA Samanmalie', '198470200881');
INSERT INTO public.dependant VALUES (1331, '2015-11-01', 'JHS Vihansa', NULL);
INSERT INTO public.dependant VALUES (1336, '1992-05-19', 'HMBK Herath', '926401220V');
INSERT INTO public.dependant VALUES (1337, '2019-05-15', 'WMOB Weerasooriya', NULL);
INSERT INTO public.dependant VALUES (1346, '1960-10-16', 'SMA Dasanayake', '602901548V');
INSERT INTO public.dependant VALUES (1347, '1959-02-06', 'BR Leelawathi', '595371198V');
INSERT INTO public.dependant VALUES (1356, '1989-02-17', 'Indiketi Hewage Nadeesha Dilhani', '198954800541');
INSERT INTO public.dependant VALUES (1370, '1984-06-16', 'Sedari Mudiyanselage Migara Lakshitha Karunarathne', '198416801967');
INSERT INTO public.dependant VALUES (1379, '2007-08-07', 'A Senthilnithy', NULL);
INSERT INTO public.dependant VALUES (1380, '1968-11-08', 'T Senthilnithy', '688230551');
INSERT INTO public.dependant VALUES (1391, '1954-11-02', 'Doremure Badalge Amarasena', '480962419');
INSERT INTO public.dependant VALUES (1392, '2025-03-21', 'Arachchige Kanthi Jayasriya', '548072344');
INSERT INTO public.dependant VALUES (1403, '1967-06-25', 'TGN Kariyawasam', '671770072V');
INSERT INTO public.dependant VALUES (1404, '2009-04-17', 'TGDH Kariyawasam', NULL);
INSERT INTO public.dependant VALUES (1416, '1986-07-11', 'UKDR Priyankara', '861933806V');
INSERT INTO public.dependant VALUES (1417, '2021-02-18', 'UKDT Manudissa', NULL);
INSERT INTO public.dependant VALUES (1423, '1996-06-06', 'MTD Gunasekara', '199665800470');
INSERT INTO public.dependant VALUES (1429, '2025-03-21', 'PMKS Gumunadee', '675452717V');
INSERT INTO public.dependant VALUES (1430, '2025-03-21', 'PMKI Hemnada', NULL);
INSERT INTO public.dependant VALUES (1431, '1995-06-01', 'BHS Kumari', '926492950V');
INSERT INTO public.dependant VALUES (1465, '2004-05-20', 'RMSH Sewwandi', '2004644300781');
INSERT INTO public.dependant VALUES (1466, '1978-11-14', 'JA Gangani', '197881901901');
INSERT INTO public.dependant VALUES (1467, '1999-06-27', 'RMC Dulakshana', '991790127V');
INSERT INTO public.dependant VALUES (1475, '2022-11-10', 'WMN Thathsandi', NULL);
INSERT INTO public.dependant VALUES (1476, '2018-05-21', 'WMA Damsadhi', NULL);
INSERT INTO public.dependant VALUES (1477, '1982-11-01', 'WMM Chanaka', '823064012V');
INSERT INTO public.dependant VALUES (1478, '2016-02-20', 'WMP Mansadhi', NULL);
INSERT INTO public.dependant VALUES (1497, '1986-06-04', 'DCSA Wickramasinghe', '866561010V');
INSERT INTO public.dependant VALUES (1498, '2018-04-21', 'AGH Yasiru', NULL);
INSERT INTO public.dependant VALUES (1499, '2015-07-23', 'AN Yasiru', NULL);
INSERT INTO public.dependant VALUES (1502, '1950-11-23', 'DN Wanigasuriya', '503280612V');
INSERT INTO public.dependant VALUES (1503, '1952-02-04', 'RP Wanigasuriya', '525350061V');
INSERT INTO public.dependant VALUES (1509, '1957-04-02', 'BCL Amarasekera', '575932290V');
INSERT INTO public.dependant VALUES (1520, '1967-02-13', 'PMTS  Peiris', '675441553V');
INSERT INTO public.dependant VALUES (1528, '1961-12-28', 'DD Upananda ', '196136301143');
INSERT INTO public.dependant VALUES (1529, '1961-07-11', 'RHK Jayasinghe', '196169300869');
INSERT INTO public.dependant VALUES (1539, '1989-04-24', 'IC Wayoma', '198961502050');
INSERT INTO public.dependant VALUES (1541, '2022-03-23', 'GS Gayansha', NULL);
INSERT INTO public.dependant VALUES (1548, '1981-02-23', 'NRV Jayathissa', '198105401652');
INSERT INTO public.dependant VALUES (1549, '2007-06-24', 'GJN Vihas', '200776802274');
INSERT INTO public.dependant VALUES (1550, '2014-04-23', 'NGO Jayatissa', NULL);
INSERT INTO public.dependant VALUES (1551, '2011-04-17', 'DJN Ganuli', NULL);
INSERT INTO public.dependant VALUES (1564, '2007-10-24', 'A Sriyasvin', NULL);
INSERT INTO public.dependant VALUES (1565, '2016-04-16', 'Autheysvin', NULL);
INSERT INTO public.dependant VALUES (1567, '1978-03-30', 'K Arivalagan', '197809002884');
INSERT INTO public.dependant VALUES (1578, '1996-12-25', 'DS Warusamanna', '968602373V');
INSERT INTO public.dependant VALUES (1590, '1955-01-10', 'D Jayarathne', '550102315V');
INSERT INTO public.dependant VALUES (1591, '1952-11-29', 'W Sriyawathi', '528342418V');
INSERT INTO public.dependant VALUES (1597, '2018-10-28', 'SLMDV Imayuru', NULL);
INSERT INTO public.dependant VALUES (1598, '1981-11-23', 'SMLD Ranajeewa', '813280604V');
INSERT INTO public.dependant VALUES (1614, '2025-03-21', 'IPS Priyadarshani', '657131865V');
INSERT INTO public.dependant VALUES (1616, '1958-11-18', 'RAMJB Athapaththu', '195832304446');
INSERT INTO public.dependant VALUES (981, '1982-05-01', 'HD Wickramasinghe', '826221623V');
INSERT INTO public.dependant VALUES (982, '2025-03-21', 'NMPD Nanayakkara', NULL);
INSERT INTO public.dependant VALUES (992, '1973-09-25', 'RAD Ranasinghe', '737692701V');
INSERT INTO public.dependant VALUES (993, '2001-06-21', 'MGN Pahasarani', '200167301370');
INSERT INTO public.dependant VALUES (1007, '1976-01-04', 'AMP Edirisinge', '765041333V');
INSERT INTO public.dependant VALUES (1008, '2015-07-20', 'LA Edirisinghe', NULL);
INSERT INTO public.dependant VALUES (1019, '1965-06-25', 'USK Gunarathna', '656771119V');
INSERT INTO public.dependant VALUES (1020, '2003-04-28', 'HRD Perera', NULL);
INSERT INTO public.dependant VALUES (1034, '1994-06-03', 'JL Jeroshan', '941553192v');
INSERT INTO public.dependant VALUES (1049, '2017-10-25', 'YB Denegama', NULL);
INSERT INTO public.dependant VALUES (1050, '2020-01-30', 'SD Denagama', NULL);
INSERT INTO public.dependant VALUES (1051, '1986-11-08', 'J Denegama', '198631301812');
INSERT INTO public.dependant VALUES (1052, '2021-03-11', 'PS Denagama', NULL);
INSERT INTO public.dependant VALUES (1065, '1984-07-13', 'ELUB Priyalaxmi', '846950095V');
INSERT INTO public.dependant VALUES (1074, '1994-08-15', 'EWGNM Abeywickrama', '942283105V');
INSERT INTO public.dependant VALUES (1076, '1972-07-14', 'AGDKKK De Wilbet', '726961395V');
INSERT INTO public.dependant VALUES (1079, '1998-09-11', 'EWGCN Abeywickrama', '987553561V');
INSERT INTO public.dependant VALUES (1082, '2001-06-15', 'EWGCN Abeywickrama', '200116703479');
INSERT INTO public.dependant VALUES (1096, '2007-06-18', 'S Humshana', NULL);
INSERT INTO public.dependant VALUES (1097, '2004-03-19', 'S Sadur', NULL);
INSERT INTO public.dependant VALUES (1098, '2013-06-18', 'S Ruthvana', NULL);
INSERT INTO public.dependant VALUES (1099, '1983-11-18', 'S Shoba', '838230253V');
INSERT INTO public.dependant VALUES (1106, '2001-10-04', 'MNF Nifla', NULL);
INSERT INTO public.dependant VALUES (1115, '1977-11-16', 'JW Deepika', '778211289V');
INSERT INTO public.dependant VALUES (1117, '2011-09-26', 'HA Senushi', NULL);
INSERT INTO public.dependant VALUES (1119, '2014-08-04', 'HA Sanju', NULL);
INSERT INTO public.dependant VALUES (1120, '2009-02-07', 'HA Nethmi', NULL);
INSERT INTO public.dependant VALUES (1129, '2007-10-19', 'EMJC Jayamanna', NULL);
INSERT INTO public.dependant VALUES (1131, '2012-06-15', 'EMLM Jayamanna', NULL);
INSERT INTO public.dependant VALUES (1133, '1973-09-17', 'EMIR Jayamanna', '732611525V');
INSERT INTO public.dependant VALUES (1140, '1991-07-05', 'P Arunshankar', '916872380V');
INSERT INTO public.dependant VALUES (1160, '2015-04-06', 'T pathmanesan', NULL);
INSERT INTO public.dependant VALUES (1161, '1980-07-24', 'Y Pathmanesan', '807062840V');
INSERT INTO public.dependant VALUES (1165, '1978-11-22', 'CS Siriwardena', '788273436V');
INSERT INTO public.dependant VALUES (1166, '2004-12-25', 'MGCK Wijesingha', NULL);
INSERT INTO public.dependant VALUES (1167, '2013-04-07', 'MGSA', NULL);
INSERT INTO public.dependant VALUES (1168, '2014-06-17', 'MGDG', NULL);
INSERT INTO public.dependant VALUES (1170, '2006-04-18', 'MGKM Wijesingha', NULL);
INSERT INTO public.dependant VALUES (1179, '1980-07-23', 'WTC Roshan', '198020503762');
INSERT INTO public.dependant VALUES (1180, '2019-09-10', 'WTS Rashmitha', NULL);
INSERT INTO public.dependant VALUES (1194, '1994-01-29', 'MGWMM Dilrukshi', '945291532V');
INSERT INTO public.dependant VALUES (1208, '1998-05-16', 'DM De Mel', NULL);
INSERT INTO public.dependant VALUES (1210, '1967-09-08', 'D Shiranthi', '677520027V');
INSERT INTO public.dependant VALUES (1212, '2003-04-25', 'SM De Mel', '200311610535');
INSERT INTO public.dependant VALUES (1227, '1999-09-16', 'KKDS Wijesinghe', '997600207V');
INSERT INTO public.dependant VALUES (1228, '2007-12-29', 'KKDBM Wijesinghe', NULL);
INSERT INTO public.dependant VALUES (1229, '1973-01-14', 'WS Silva', '735143565V');
INSERT INTO public.dependant VALUES (1238, '1962-02-21', 'NS Thayaparam', '196205203020');
INSERT INTO public.dependant VALUES (1240, '2000-07-10', 'T Thayaparam', '200069203556');
INSERT INTO public.dependant VALUES (1248, '1952-10-15', 'WA Pemadasa', '522896993V');
INSERT INTO public.dependant VALUES (1249, '1966-08-24', 'EK Sumanawathi', '196679701643V');
INSERT INTO public.dependant VALUES (1260, '1969-11-27', 'KPPD Silva', '196983201733');
INSERT INTO public.dependant VALUES (1262, '1965-12-21', 'NP Hettiarachchi', '653564821V');
INSERT INTO public.dependant VALUES (1277, '1992-07-12', 'WAAM Silva', '901941050V');
INSERT INTO public.dependant VALUES (1286, '1987-05-04', 'NR Madurapperuma', '876353270V');
INSERT INTO public.dependant VALUES (1292, '1968-09-07', 'MWM Swarnalatha', '687511450V');
INSERT INTO public.dependant VALUES (1296, '2023-06-29', 'VG  Alcois', NULL);
INSERT INTO public.dependant VALUES (1299, '1987-12-15', 'MKPG Alcois', '873504455V');
INSERT INTO public.dependant VALUES (1306, '1966-12-07', 'EI Mendis', '668421385V');
INSERT INTO public.dependant VALUES (1309, '1954-03-13', 'IB Soyza', '540730377V');
INSERT INTO public.dependant VALUES (1321, '2019-02-09', 'SOL Pathiraja', NULL);
INSERT INTO public.dependant VALUES (1323, '1984-03-08', 'SRP Bandula', '198406801726');
INSERT INTO public.dependant VALUES (1325, '2021-08-03', 'SOT Pathiraja', NULL);
INSERT INTO public.dependant VALUES (1329, '1989-12-21', 'KD Premakumara', '893562591V');
INSERT INTO public.dependant VALUES (1345, '1991-04-17', 'SMUK Samarakoon', '916081740v');
INSERT INTO public.dependant VALUES (1353, '2022-10-20', 'KA Thisendi Mandara', NULL);
INSERT INTO public.dependant VALUES (1354, '1982-08-30', 'LG Buddika Uduyangani', '827432288');
INSERT INTO public.dependant VALUES (1355, '2019-04-21', 'KA Saumm Adithya Bandara', NULL);
INSERT INTO public.dependant VALUES (1368, '2024-12-11', 'WMDM Weerakoon', NULL);
INSERT INTO public.dependant VALUES (1369, '1994-11-12', 'Thalawela Aedara Nirosha Wirajani Kumari', '948170450');
INSERT INTO public.dependant VALUES (1376, '2019-02-26', 'Walallawita Kankanamge Yumeth Methsilu kankanamage', NULL);
INSERT INTO public.dependant VALUES (1377, '1983-05-13', 'Walallawita Kankanamge Chaminda Darshana', '831341033');
INSERT INTO public.dependant VALUES (1378, '2016-03-18', 'Walallawita Kankanamge Nethumi Sithumsa Kankanamage', NULL);
INSERT INTO public.dependant VALUES (1390, '2018-04-17', 'Herath Mudiyanselage Thisali Movindi Herath', NULL);
INSERT INTO public.dependant VALUES (1401, '1956-10-11', 'KA Gunarathna Menike', '567853950');
INSERT INTO public.dependant VALUES (1402, '1948-08-25', 'WA Jinadasa', '194823810010');
INSERT INTO public.dependant VALUES (1411, '2021-02-09', 'YPBD  Kulatunga', NULL);
INSERT INTO public.dependant VALUES (1412, '2022-03-31', 'YPAS  Kulatunga', NULL);
INSERT INTO public.dependant VALUES (1413, '1993-09-28', 'YPCP Kulatunga', '932722135V');
INSERT INTO public.dependant VALUES (1422, '1996-04-25', 'MZ Weerabanysa', '966163631V');
INSERT INTO public.dependant VALUES (1434, '2088-08-02', 'PH Wijesekara', NULL);
INSERT INTO public.dependant VALUES (1435, '2013-11-07', 'PJ Wijesekara', NULL);
INSERT INTO public.dependant VALUES (1436, '1976-05-30', 'KPW Wijesekara', '761510487V');
INSERT INTO public.dependant VALUES (1442, '2010-07-02', 'KADB Katupulla', NULL);
INSERT INTO public.dependant VALUES (1443, '1970-04-15', 'AGH Priyangika', '706060863V');
INSERT INTO public.dependant VALUES (1444, '2009-04-11', 'KADHB Katupulla', NULL);
INSERT INTO public.dependant VALUES (1452, '2015-09-18', 'SD  Angammana', NULL);
INSERT INTO public.dependant VALUES (1453, '2013-02-04', 'HS  Angammana', NULL);
INSERT INTO public.dependant VALUES (1454, '1985-08-08', 'EWWMMWLV  Mediwake', '857211731V');
INSERT INTO public.dependant VALUES (1458, '1963-09-24', 'NCS Herath', '196376800641');
INSERT INTO public.dependant VALUES (1510, '1955-12-29', 'KN Ranaseeli', '558640723V');
INSERT INTO public.dependant VALUES (1511, '1954-04-26', 'MD Karunasena', '541191917V');
INSERT INTO public.dependant VALUES (1522, '2025-03-21', 'HTM Caldera', NULL);
INSERT INTO public.dependant VALUES (1531, '2025-03-21', 'DMPS De Silva', '198726602650');
INSERT INTO public.dependant VALUES (1557, '2013-02-06', 'HDYT Taniya', NULL);
INSERT INTO public.dependant VALUES (1558, '1982-03-12', 'UDC Nimanthi', '825721991V');
INSERT INTO public.dependant VALUES (1559, '2010-09-20', 'HDGK Shehani', NULL);
INSERT INTO public.dependant VALUES (1560, '2015-11-11', 'HDTI Shamal', NULL);
INSERT INTO public.dependant VALUES (1568, '1956-03-17', 'NUC Kanthi', '565770306V');
INSERT INTO public.dependant VALUES (1569, '1953-11-15', 'MA Siriwardane', '533201440V');
INSERT INTO public.dependant VALUES (1583, '2025-03-21', 'Y Nethmili', NULL);
INSERT INTO public.dependant VALUES (1585, '1983-04-29', 'WALNS Waliwita', '198362001345');
INSERT INTO public.dependant VALUES (1587, '2025-03-21', 'M Senesh', NULL);
INSERT INTO public.dependant VALUES (1600, '1999-10-04', 'JAS Pemakumari', '997780884V');
INSERT INTO public.dependant VALUES (1606, '2008-04-12', 'BHK Perera', '200810302535');
INSERT INTO public.dependant VALUES (1607, '1978-06-02', 'BCS Perera', '7815400501V');
INSERT INTO public.dependant VALUES (1608, '2013-04-02', 'BSR Perera', NULL);
INSERT INTO public.dependant VALUES (1609, '2010-11-01', 'BMH Perera', '200810302535');
INSERT INTO public.dependant VALUES (984, '2000-04-08', 'UVM Madusanka', '20009903013');
INSERT INTO public.dependant VALUES (985, '1975-04-02', 'ADA Athukorala', '197559302256');
INSERT INTO public.dependant VALUES (994, '2003-09-06', 'JC Hettige', '200375000000');
INSERT INTO public.dependant VALUES (995, '1981-09-17', 'BGN Nandani', '817613128V');
INSERT INTO public.dependant VALUES (996, '2011-03-11', 'NN Hettige', NULL);
INSERT INTO public.dependant VALUES (1013, '2021-05-09', 'KAMD Kannangara', NULL);
INSERT INTO public.dependant VALUES (1014, '1977-01-07', 'KAHP Kannangara', '770070953V');
INSERT INTO public.dependant VALUES (1032, '2002-10-26', 'RMP Subhashini', '200280003760');
INSERT INTO public.dependant VALUES (1033, '1978-10-23', 'MAN Kumari', '787974961V');
INSERT INTO public.dependant VALUES (1046, '2015-04-05', 'ST Weeramanthree', NULL);
INSERT INTO public.dependant VALUES (1047, '1976-11-09', 'TAO  Lasanthi', '197681402084');
INSERT INTO public.dependant VALUES (1048, '2009-08-07', 'RH Weeramanthree', NULL);
INSERT INTO public.dependant VALUES (1061, '1979-07-02', 'AJMAK Bandara', '790382994V');
INSERT INTO public.dependant VALUES (1069, '2013-12-20', 'V Harshavardhan', NULL);
INSERT INTO public.dependant VALUES (1071, '1984-09-12', 'K Vishnuruban', '842564921V');
INSERT INTO public.dependant VALUES (1085, '2016-04-07', 'RDCD Weerarathne', NULL);
INSERT INTO public.dependant VALUES (1087, '1979-08-31', 'RDCA Weerarathne', '197924400304');
INSERT INTO public.dependant VALUES (1088, '2019-10-26', 'RDRP Weerarathne', NULL);
INSERT INTO public.dependant VALUES (1100, '2008-06-12', 'TST De Silva', NULL);
INSERT INTO public.dependant VALUES (1101, '1962-03-29', 'TJJ De Silva', '620890820V');
INSERT INTO public.dependant VALUES (1113, '1979-01-19', 'P Samarakoon', '795192549V');
INSERT INTO public.dependant VALUES (1114, '2008-05-17', 'S Tilakawardane', NULL);
INSERT INTO public.dependant VALUES (1127, '2011-09-11', 'AMSS Adikari', NULL);
INSERT INTO public.dependant VALUES (1128, '1982-09-16', 'KADHEM Rathnasekara', '827600083V');
INSERT INTO public.dependant VALUES (1137, '1960-05-02', 'AGN Ruwani', '601232510V');
INSERT INTO public.dependant VALUES (1146, '1965-08-18', 'CP Weerasekara', '652310966V');
INSERT INTO public.dependant VALUES (1155, '1984-07-23', 'AAS Kumari', '847050772V');
INSERT INTO public.dependant VALUES (1156, '2016-02-23', 'AKGGP Bandara', NULL);
INSERT INTO public.dependant VALUES (1157, '2011-08-02', 'AKGOT Bandara', NULL);
INSERT INTO public.dependant VALUES (1172, '1998-03-26', 'BMNJ Kumara', '880860771 V');
INSERT INTO public.dependant VALUES (1181, '1978-12-25', 'SU Hadapangoda', '788603541V');
INSERT INTO public.dependant VALUES (1182, '2011-12-01', 'WMGDSD Weerasinghe', '197805404490');
INSERT INTO public.dependant VALUES (1195, '2021-10-16', 'DMTB Dissanayaka', NULL);
INSERT INTO public.dependant VALUES (1196, '1987-07-05', 'JMAKE Thilakarathne', '198768700843');
INSERT INTO public.dependant VALUES (1197, '2016-11-23', 'DMTR Dissanayake', NULL);
INSERT INTO public.dependant VALUES (1204, '1973-08-19', 'WADCIP Wickramasinghe', '197373200014');
INSERT INTO public.dependant VALUES (1205, '2005-10-12', 'KAIR Perera', NULL);
INSERT INTO public.dependant VALUES (1206, '2003-01-27', 'KANR Perera', '200303000000');
INSERT INTO public.dependant VALUES (1219, '1980-08-19', 'AJB Ranasinghe', '802322453V');
INSERT INTO public.dependant VALUES (1220, '2009-11-19', 'ASC Ranasinghe', NULL);
INSERT INTO public.dependant VALUES (1222, '2013-08-10', 'ASS Ranasinghe', NULL);
INSERT INTO public.dependant VALUES (1224, '2015-04-28', 'ANS Ranasinghe', NULL);
INSERT INTO public.dependant VALUES (1239, '2025-03-21', 'HAP Madushani', '977930480V');
INSERT INTO public.dependant VALUES (1250, '2022-08-01', 'AN Dalawatta', NULL);
INSERT INTO public.dependant VALUES (1251, '1991-09-28', 'AVH Lakchani', '917720169V');
INSERT INTO public.dependant VALUES (1261, '1993-05-16', 'PP Aravinda', '931371541V');
INSERT INTO public.dependant VALUES (1268, '2009-04-17', 'SRJN Samarakoon', NULL);
INSERT INTO public.dependant VALUES (1269, '1972-08-20', 'SRKS Samarakoon', '722640608V');
INSERT INTO public.dependant VALUES (1278, '1958-04-16', 'AHMR Bandara', '195810704123V');
INSERT INTO public.dependant VALUES (1284, '1952-12-15', 'TH Wilson', '533500293V');
INSERT INTO public.dependant VALUES (1285, '1962-04-13', 'RG Gunaseeli', '626042112V');
INSERT INTO public.dependant VALUES (1293, '1991-09-20', 'CKA Siriwardhana', '917644616V');
INSERT INTO public.dependant VALUES (1297, '1996-12-08', 'WBWMRUNN Aluvihare', '968433741V');
INSERT INTO public.dependant VALUES (1300, '2023-06-14', 'BLM Wickramasinghe', NULL);
INSERT INTO public.dependant VALUES (1307, '2010-09-05', 'MAMA Premarathne', NULL);
INSERT INTO public.dependant VALUES (1310, '1981-03-30', 'MAUK Premarathne', '198109003643');
INSERT INTO public.dependant VALUES (1311, '2012-05-31', 'MAMN Premarathne', NULL);
INSERT INTO public.dependant VALUES (1312, '2018-09-17', 'MAMD Premarathne', NULL);
INSERT INTO public.dependant VALUES (1338, '1965-10-31', 'DDA Gamini', '653050054V');
INSERT INTO public.dependant VALUES (1339, '1996-07-18', 'SL Dehigaspitiya', '962003117V');
INSERT INTO public.dependant VALUES (1348, '2025-03-21', 'KWSE Fernando', NULL);
INSERT INTO public.dependant VALUES (1349, '1988-02-01', 'KWNC Fernando', '880321102v');
INSERT INTO public.dependant VALUES (1357, '1981-09-23', 'Amarakoon Arachchige Kamala Kumari Edirimanna.', '817671314');
INSERT INTO public.dependant VALUES (1358, '2018-12-22', 'Eriyagama Hewage Sayl vindiw', NULL);
INSERT INTO public.dependant VALUES (1359, '2010-06-15', 'Eriyagama Hewage Sanadee Sunera', NULL);
INSERT INTO public.dependant VALUES (1371, '1991-09-25', 'Bandugodage Janith Maduranga Nanayakkara', '912690059');
INSERT INTO public.dependant VALUES (1381, '2019-10-17', 'VR Wijewarnadana', NULL);
INSERT INTO public.dependant VALUES (1383, '1984-06-22', 'MASS De Silva', '846741852');
INSERT INTO public.dependant VALUES (1385, '2016-11-05', 'SD Wijewarnadana', NULL);
INSERT INTO public.dependant VALUES (1393, '2012-10-24', 'TD Vihansa Kushalka Chandrarathne', NULL);
INSERT INTO public.dependant VALUES (1394, '1986-05-12', 'Jayalath Munasinghage Kanthi Chandrika', '866331189');
INSERT INTO public.dependant VALUES (1405, '2020-09-22', 'SPNN Perera', '_');
INSERT INTO public.dependant VALUES (1406, '1991-01-31', 'RWVWS Samarasinghe', '915313337v');
INSERT INTO public.dependant VALUES (1414, '2024-07-30', 'AE Arthanage', NULL);
INSERT INTO public.dependant VALUES (1415, '1993-03-31', 'DK Sundareka', '935911044V');
INSERT INTO public.dependant VALUES (1421, '1956-11-26', 'MM Vithanage', '568311647V');
INSERT INTO public.dependant VALUES (1424, '1942-02-09', 'S.Selladurai', '420401892V');
INSERT INTO public.dependant VALUES (1432, '1963-06-14', 'WL Weerakkodi', '631664601V');
INSERT INTO public.dependant VALUES (1433, '1968-06-13', 'WC Wijesinghe', '686653463V');
INSERT INTO public.dependant VALUES (1481, '1971-03-28', 'JA Priyanjane', '197158800768');
INSERT INTO public.dependant VALUES (1482, '1962-07-20', 'HAD Sinno', NULL);
INSERT INTO public.dependant VALUES (1488, '2005-01-19', 'I Kulasuriya', '200551904055');
INSERT INTO public.dependant VALUES (1489, '1972-08-03', 'ADW Kulasuriya', '727161155V');
INSERT INTO public.dependant VALUES (1494, '2016-02-14', 'SKC Sandaruwan', '841750357V');
INSERT INTO public.dependant VALUES (1495, '2025-03-21', 'SKS  Randaara', NULL);
INSERT INTO public.dependant VALUES (1496, '2020-02-24', 'SKA  Mandaara', NULL);
INSERT INTO public.dependant VALUES (1512, '2019-05-22', 'Dushanan Dhakashesh', NULL);
INSERT INTO public.dependant VALUES (1513, '1990-10-21', 'Karunaraj Nithanthi', '907950158V');
INSERT INTO public.dependant VALUES (1523, '1991-02-02', 'SACS Jayasooriya', '910332236V');
INSERT INTO public.dependant VALUES (1524, '2022-07-10', 'SATD Jayasooriya', NULL);
INSERT INTO public.dependant VALUES (1532, '1975-02-14', 'S Selvanatharajah', '755451789V');
INSERT INTO public.dependant VALUES (1534, '2006-08-07', 'B Selvanathajah', '200672000999');
INSERT INTO public.dependant VALUES (1535, '2008-04-25', 'P Selvanantharajah', '200811600436');
INSERT INTO public.dependant VALUES (1546, '2014-04-04', 'GDSD Perera', NULL);
INSERT INTO public.dependant VALUES (1547, '1981-09-09', 'KABN Chandrasena', '817530320V');
INSERT INTO public.dependant VALUES (1561, '1978-10-26', 'BADS Wimalasena', '197830035');
INSERT INTO public.dependant VALUES (1562, '2016-04-09', 'AS Wimalasena', NULL);
INSERT INTO public.dependant VALUES (1563, '2009-05-29', 'CP Wimalasena', NULL);
INSERT INTO public.dependant VALUES (1577, '1993-05-05', 'ERKT Perera', '931260944V');
INSERT INTO public.dependant VALUES (1584, '2021-06-23', 'N Thantrigoda ', NULL);
INSERT INTO public.dependant VALUES (1586, '1989-12-13', 'M Kumarasinghe', '898481581V');
INSERT INTO public.dependant VALUES (1592, '1984-06-20', 'KD Sriyalatha', '198467204192');
INSERT INTO public.dependant VALUES (1593, '1973-02-10', 'ADDSG Karunasena', '197304102126');
INSERT INTO public.dependant VALUES (1602, '1992-12-14', 'NWMC Nawarathne', '928490360V');
INSERT INTO public.dependant VALUES (1610, '2018-11-15', 'GS Atthanayake', NULL);
INSERT INTO public.dependant VALUES (1611, '1981-01-01', 'TPB Attanayake', '198100101998');
INSERT INTO public.dependant VALUES (1621, '2004-09-19', 'AI USHI', '200476303155V');
INSERT INTO public.dependant VALUES (1622, '1960-08-30', 'DW Wijesiri', '602432050V');
INSERT INTO public.dependant VALUES (983, '1987-08-27', 'P Ganeshalingam', '877402126V');
INSERT INTO public.dependant VALUES (986, '2012-03-27', 'G Aksheethanan', NULL);
INSERT INTO public.dependant VALUES (987, '2006-05-30', 'G Kanishalinny', NULL);
INSERT INTO public.dependant VALUES (988, '2007-12-24', 'G Gaveeshan', NULL);
INSERT INTO public.dependant VALUES (998, '2016-01-28', 'KKMT Sandula', NULL);
INSERT INTO public.dependant VALUES (1000, '1985-11-07', 'PKAT Nadeeshani', '858122830V');
INSERT INTO public.dependant VALUES (1002, '2019-07-08', 'KKMV Lenadee', NULL);
INSERT INTO public.dependant VALUES (1015, '2016-09-01', 'GKSB Amarasinghe', NULL);
INSERT INTO public.dependant VALUES (1016, '1984-09-01', 'WPTW Weerasinghe', '847450207V');
INSERT INTO public.dependant VALUES (1026, '2006-11-15', 'U Manimaran', NULL);
INSERT INTO public.dependant VALUES (1027, '1975-03-10', 'S Umasivam', '750703720V');
INSERT INTO public.dependant VALUES (1028, '2011-07-28', 'U Sajenthan', NULL);
INSERT INTO public.dependant VALUES (1029, '1968-07-13', 'MRN Perera', '686950166V');
INSERT INTO public.dependant VALUES (1030, '2009-05-27', 'U Keerthigan', NULL);
INSERT INTO public.dependant VALUES (1031, '2002-05-29', 'PNT Madushanka', '200215002079');
INSERT INTO public.dependant VALUES (1039, '2017-12-27', 'PCSD Perera', NULL);
INSERT INTO public.dependant VALUES (1040, '2012-01-22', 'PBTU Perera', NULL);
INSERT INTO public.dependant VALUES (1041, '2009-10-19', 'PTD Perera', NULL);
INSERT INTO public.dependant VALUES (1042, '1987-08-21', 'WMA Nisansala', '877341445V');
INSERT INTO public.dependant VALUES (1058, '2006-03-20', 'HMN Viranja Hennayaka', NULL);
INSERT INTO public.dependant VALUES (1060, '2004-02-06', 'HMLG Hennayaka', '200453713477');
INSERT INTO public.dependant VALUES (1083, '2010-05-22', 'AAHN Adhikari', NULL);
INSERT INTO public.dependant VALUES (1112, '1992-06-11', 'RMASLankathilaka', '199216301430V');
INSERT INTO public.dependant VALUES (1124, '2020-08-04', 'DMSN Dissanayake', NULL);
INSERT INTO public.dependant VALUES (1125, '1988-02-12', 'PBD Dilrukshi', '885431232V');
INSERT INTO public.dependant VALUES (1126, '2019-05-31', 'DMSS Dissanayake', NULL);
INSERT INTO public.dependant VALUES (1138, '1942-11-27', 'D.Sumathipala', '423321105V');
INSERT INTO public.dependant VALUES (1139, '1943-07-19', 'A.Gunawathi', '437010811V');
INSERT INTO public.dependant VALUES (1147, '1991-02-20', 'SAL Danushka', '910514504V');
INSERT INTO public.dependant VALUES (1151, '2007-05-25', 'LM Rajapaksha', NULL);
INSERT INTO public.dependant VALUES (1153, '2011-02-25', 'YS Rajapaksha', NULL);
INSERT INTO public.dependant VALUES (1154, '1970-12-05', 'AN rajapaksha', '197034003212');
INSERT INTO public.dependant VALUES (1173, '2021-06-17', 'DGDS Hennayaka', NULL);
INSERT INTO public.dependant VALUES (1174, '1981-01-16', 'DGJS Hennayake', '810163682V');
INSERT INTO public.dependant VALUES (1188, '2016-11-08', 'JJM Paul', NULL);
INSERT INTO public.dependant VALUES (1189, '1978-09-06', 'JJ Edna', '787500595 V');
INSERT INTO public.dependant VALUES (1190, '2007-07-25', 'JJM Paul', NULL);
INSERT INTO public.dependant VALUES (1200, '2011-05-19', 'MKMR Mawella', NULL);
INSERT INTO public.dependant VALUES (1201, '2012-08-10', 'MKDL Mawella', NULL);
INSERT INTO public.dependant VALUES (1202, '1977-11-28', 'MKKJ Mawella', '773331103V');
INSERT INTO public.dependant VALUES (1221, '2006-04-15', 'RL Gajanayaka', '200660601529');
INSERT INTO public.dependant VALUES (1223, '1965-06-08', 'W Gajanayaka', '651602679V');
INSERT INTO public.dependant VALUES (1225, '1998-03-04', 'KM Gajanayaka', '9856402222V');
INSERT INTO public.dependant VALUES (1233, '2020-08-22', 'RAPA Randunu', NULL);
INSERT INTO public.dependant VALUES (1234, '1987-10-11', 'WADA Withanaarachchi', '877850056V');
INSERT INTO public.dependant VALUES (1244, '1995-09-26', 'KM Abeysundara', '957701272V');
INSERT INTO public.dependant VALUES (1258, '2010-01-11', 'WMDB Navaratna', NULL);
INSERT INTO public.dependant VALUES (1259, '1959-02-10', 'WMND Navaratna', '195904100993');
INSERT INTO public.dependant VALUES (1266, '1955-08-19', 'KMT Senarathne', '552321863V');
INSERT INTO public.dependant VALUES (1273, '1965-02-06', 'BKS Deshapriya', '650371127V');
INSERT INTO public.dependant VALUES (1274, '1961-08-04', 'NU Suvineetha', '617170493V');
INSERT INTO public.dependant VALUES (1283, '1996-03-14', 'EKS Sithara', '965741038V');
INSERT INTO public.dependant VALUES (1294, '1953-08-11', 'P.Samarawickrama', '537242809V');
INSERT INTO public.dependant VALUES (1305, '1993-04-10', 'HMMD Jayasinghe', '199360101330');
INSERT INTO public.dependant VALUES (1326, '1990-07-11', 'SR Priyadarshana', '901931291V');
INSERT INTO public.dependant VALUES (1327, '2022-04-08', 'SKS Arachchi', NULL);
INSERT INTO public.dependant VALUES (1334, '2019-12-26', 'YYKP Thilakawardana', NULL);
INSERT INTO public.dependant VALUES (1335, '1992-03-07', 'PGD Prabodani', '925672394V');
INSERT INTO public.dependant VALUES (1343, '2017-12-08', 'BM Induwara', NULL);
INSERT INTO public.dependant VALUES (1344, '1984-05-30', 'RDC Priyadarshani', '846512462v');
INSERT INTO public.dependant VALUES (1352, '1948-03-28', 'Samarakkoon Mudiyanselage Swarnalatha Gonawardana', '495881610');
INSERT INTO public.dependant VALUES (1363, '2021-01-16', 'Thevan Sasdinu Piris', NULL);
INSERT INTO public.dependant VALUES (1365, '2018-12-31', 'Rayon Sasvidu Piris', NULL);
INSERT INTO public.dependant VALUES (1367, '2016-03-29', 'Nevan Sasnidu Piris', NULL);
INSERT INTO public.dependant VALUES (1373, '1992-10-08', 'REK Peiris', '927823063');
INSERT INTO public.dependant VALUES (1386, '1992-08-02', 'Shahul Hameed Amnas', '927152193');
INSERT INTO public.dependant VALUES (1387, '2019-11-04', 'IZ Fatimah', NULL);
INSERT INTO public.dependant VALUES (1388, '2023-03-22', 'IZ Fathin', NULL);
INSERT INTO public.dependant VALUES (1398, '2016-05-07', 'Sinhara Mudalige Linusha Induwara Perera', NULL);
INSERT INTO public.dependant VALUES (1399, '2010-08-20', 'Sinhara Mudalige Binuka Mavinda Perera', NULL);
INSERT INTO public.dependant VALUES (1400, '1990-08-11', 'Kariyawasam Manage Chathurika Maduwanthi', '907241165');
INSERT INTO public.dependant VALUES (1410, '1969-12-09', 'NS Thalagune', '693441994');
INSERT INTO public.dependant VALUES (1420, '1960-09-05', 'J.Thilakeswary', '607493766V');
INSERT INTO public.dependant VALUES (1426, '2023-10-25', 'RWWMVS Senanayake', NULL);
INSERT INTO public.dependant VALUES (1427, '1992-07-19', 'RWWMD Senanayake', '199220100463');
INSERT INTO public.dependant VALUES (1428, '2023-10-25', 'RWWAYAD Senanayake', NULL);
INSERT INTO public.dependant VALUES (1440, '1948-11-17', 'R. Seneviratne', '483222475V');
INSERT INTO public.dependant VALUES (1441, '1957-05-28', 'TMSK Puliyadda', '576492308V');
INSERT INTO public.dependant VALUES (1450, '2016-08-01', 'KWickramasooriya', NULL);
INSERT INTO public.dependant VALUES (1451, '1981-09-18', 'RMMK Rajaguru', '8176235506V');
INSERT INTO public.dependant VALUES (1457, '1984-09-17', 'KGD Priyangani', '198476100204');
INSERT INTO public.dependant VALUES (1464, '1967-02-14', 'WD Renuka', '675452717V');
INSERT INTO public.dependant VALUES (1473, '1960-09-22', 'GGP Weerasinghe', '196035704630');
INSERT INTO public.dependant VALUES (1474, '1966-09-04', 'OS Gamage', '667480353V');
INSERT INTO public.dependant VALUES (1480, '1981-08-15', 'SD Marasinghe', '855282682V');
INSERT INTO public.dependant VALUES (1486, '1958-01-21', 'R Wanasinghe', '195852102695V');
INSERT INTO public.dependant VALUES (1487, '1953-07-21', 'T  Anthony', '532033632V');
INSERT INTO public.dependant VALUES (1492, '1973-01-21', 'KN DAmmika', '735210637V');
INSERT INTO public.dependant VALUES (1493, '2025-03-21', 'WPN Nethmal', '200231101018');
INSERT INTO public.dependant VALUES (1501, '1982-06-28', 'WDK Illangasinghe', '198268002111');
INSERT INTO public.dependant VALUES (1507, '2018-06-08', 'AMA Amunethanna', NULL);
INSERT INTO public.dependant VALUES (1508, '1987-12-12', 'HGGE Harshani', NULL);
INSERT INTO public.dependant VALUES (1521, '2025-03-21', 'WM Perera', '566140284V');
INSERT INTO public.dependant VALUES (1530, '1967-10-24', 'T Manohar', '196729801794');
INSERT INTO public.dependant VALUES (1542, '2013-01-26', 'J Harisharan', NULL);
INSERT INTO public.dependant VALUES (1543, '2009-08-11', 'J Sinthuri', NULL);
INSERT INTO public.dependant VALUES (1544, '1976-04-18', 'K Jothikaran', '761093487V');
INSERT INTO public.dependant VALUES (1545, '2015-01-18', 'J Jugeesharn', NULL);
INSERT INTO public.dependant VALUES (1555, '1964-01-14', 'AM Rathnayake', '640142642V');
INSERT INTO public.dependant VALUES (1556, '1972-04-21', 'AMS Manike', '726120684V');
INSERT INTO public.dependant VALUES (1576, '1965-01-06', 'RAJ Perera', '650061950V');
INSERT INTO public.dependant VALUES (1588, '1964-10-18', 'D Abeyrathne', '196429202424');
INSERT INTO public.dependant VALUES (1589, '2001-06-01', 'DPC Abeyratne', '200165302482');
INSERT INTO public.dependant VALUES (1599, '2024-08-19', 'RMGM Bandara Rathnayake', NULL);
INSERT INTO public.dependant VALUES (1601, '1994-01-25', 'DGNK Gamage', '945251212');
INSERT INTO public.dependant VALUES (1603, '1960-03-26', 'JM Kusumalatha', '196058601610');
INSERT INTO public.dependant VALUES (1604, '1993-01-15', 'IJ Welikumbura', '930151408V');
INSERT INTO public.dependant VALUES (1605, '1992-08-06', 'Lecturer', '926601083V');
INSERT INTO public.dependant VALUES (1619, '1975-12-25', 'S Ruby', '758600386V');
INSERT INTO public.dependant VALUES (1620, '1966-08-20', 'K Elango', '662332615V');
INSERT INTO public.dependant VALUES (989, '1975-03-08', 'CD kamalanathan', '197556802446');
INSERT INTO public.dependant VALUES (990, '2002-08-13', 'TD Devanambi', '200272600263');
INSERT INTO public.dependant VALUES (991, '2007-06-22', 'TP Devanambi', NULL);
INSERT INTO public.dependant VALUES (1004, '2009-11-23', 'SMSC Sakalasooriya', NULL);
INSERT INTO public.dependant VALUES (1005, '2012-12-16', 'SMABB Sakalasooriya', NULL);
INSERT INTO public.dependant VALUES (1006, '1976-03-24', 'AB Abeysekara', '765842409V');
INSERT INTO public.dependant VALUES (1017, '2012-11-14', 'RATN Rathnayaka', NULL);
INSERT INTO public.dependant VALUES (1018, '1976-08-25', 'HMUSN Hettiarachchi', '767382359V');
INSERT INTO public.dependant VALUES (1037, '1946-01-11', 'BL Fernando', '46511191v');
INSERT INTO public.dependant VALUES (1038, '1944-01-18', 'KS De Silva', '440181929v');
INSERT INTO public.dependant VALUES (1055, '1996-04-12', 'Lahiru Karunarathna', NULL);
INSERT INTO public.dependant VALUES (1064, '1968-12-08', 'S Premawathi', '688432421V');
INSERT INTO public.dependant VALUES (1066, '1965-02-09', 'SHNW De Silva', '650401840V');
INSERT INTO public.dependant VALUES (1077, '1981-03-08', 'DMCIK Dissanayaka', '815682696V');
INSERT INTO public.dependant VALUES (1080, '2018-06-29', 'SDCB Siriwardhana', NULL);
INSERT INTO public.dependant VALUES (1089, '1982-07-03', 'HMKNH Koralegedara', '826851309V');
INSERT INTO public.dependant VALUES (1091, '2017-10-04', 'DA Rodrigo', NULL);
INSERT INTO public.dependant VALUES (1093, '2009-10-19', 'TU Rodrigo', NULL);
INSERT INTO public.dependant VALUES (1105, '1990-03-15', 'MKCC Morawaka', '905751565V');
INSERT INTO public.dependant VALUES (1121, '2021-02-18', 'MAAUB Manthilake', NULL);
INSERT INTO public.dependant VALUES (1122, '1992-04-26', 'RMHU Ranaweera', '926171860V');
INSERT INTO public.dependant VALUES (1134, '1998-01-24', 'KGHN Danapala', '985241848V');
INSERT INTO public.dependant VALUES (1141, '1969-10-18', 'R Hanwella', '196929202174');
INSERT INTO public.dependant VALUES (1142, '2007-10-18', 'LL Hanwella', NULL);
INSERT INTO public.dependant VALUES (1143, '2009-07-23', 'DT Hanwella', NULL);
INSERT INTO public.dependant VALUES (1162, '2014-11-26', 'MDS Pieris', NULL);
INSERT INTO public.dependant VALUES (1163, '1979-04-21', 'MP Pieris', '791122570V');
INSERT INTO public.dependant VALUES (1164, '2011-03-14', 'MDW Peiris', NULL);
INSERT INTO public.dependant VALUES (1175, '1968-06-18', 'HS Udayanga', '681702105 V');
INSERT INTO public.dependant VALUES (1176, '1968-10-14', 'LH Kanthi', '687880455 V');
INSERT INTO public.dependant VALUES (1183, '1986-01-09', 'HA Dharmasena', '865093004V');
INSERT INTO public.dependant VALUES (1185, '2015-06-07', 'HMJS Heenkenda', NULL);
INSERT INTO public.dependant VALUES (1193, '1990-09-15', 'RMTNB Rathnayake', '199026000000');
INSERT INTO public.dependant VALUES (1207, '1991-04-07', 'IGDA Srimali', '915981950V');
INSERT INTO public.dependant VALUES (1209, '2021-10-10', 'HKAN Kekanadura', NULL);
INSERT INTO public.dependant VALUES (1211, '2023-01-04', 'HKOA Kekanadura', NULL);
INSERT INTO public.dependant VALUES (1217, '1979-03-26', 'JMAKP Gunarathna', '795861033V');
INSERT INTO public.dependant VALUES (1218, '2014-08-18', 'WWOW Kumarasinghe', NULL);
INSERT INTO public.dependant VALUES (1230, '2018-11-01', 'DDI Wickramasooriya', NULL);
INSERT INTO public.dependant VALUES (1231, '1994-04-16', 'PPRS Fernando', '946071765V');
INSERT INTO public.dependant VALUES (1232, '2023-01-24', 'GSA Wickramasooriya', NULL);
INSERT INTO public.dependant VALUES (1241, '1994-05-25', 'KOA NAdiranga', '941462405V');
INSERT INTO public.dependant VALUES (1242, '1997-10-19', 'HAP Madhushani', '977630480V');
INSERT INTO public.dependant VALUES (1252, '1986-01-09', 'PNK Senevirathna', '860094142V');
INSERT INTO public.dependant VALUES (1254, '2021-10-03', 'SLS Senevirathna', NULL);
INSERT INTO public.dependant VALUES (1265, '1963-10-23', 'J Irangani', '637971530V');
INSERT INTO public.dependant VALUES (1271, '1970-03-05', 'KG Ranjani', '705653046V');
INSERT INTO public.dependant VALUES (1272, '1966-03-22', 'HV Subasena', '196608204561');
INSERT INTO public.dependant VALUES (1279, '1956-12-08', 'WAJ Indrani', '568432711V');
INSERT INTO public.dependant VALUES (1281, '1957-07-13', 'SAJP Subasinghe', '571951932V');
INSERT INTO public.dependant VALUES (1288, '1956-05-02', 'PMP Ranjani', '566230437V');
INSERT INTO public.dependant VALUES (1289, '1949-03-13', 'WP Dayarathna', '490731407V');
INSERT INTO public.dependant VALUES (1298, '2022-06-04', 'RLADM Rathnayake', NULL);
INSERT INTO public.dependant VALUES (1302, '1984-08-27', 'YLAM Gayani', '847401230V');
INSERT INTO public.dependant VALUES (1313, '1991-09-27', 'RNPT Rajapaksha', '917611670V');
INSERT INTO public.dependant VALUES (1332, '1994-10-28', 'KPG Nirmani', '947720538V');
INSERT INTO public.dependant VALUES (1340, '1987-06-15', 'WWP Samantha', '198716701613');
INSERT INTO public.dependant VALUES (1350, '1970-09-16', 'WMMD Rathnayake', '702600219V');
INSERT INTO public.dependant VALUES (1360, '2008-01-25', 'M Vithanachchi', NULL);
INSERT INTO public.dependant VALUES (1361, '1970-05-24', 'MB Vithanachchi', NULL);
INSERT INTO public.dependant VALUES (1362, '2019-11-02', 'MM Vithanachchi', NULL);
INSERT INTO public.dependant VALUES (1372, '1945-01-20', 'PA Wimala', '455300460V');
INSERT INTO public.dependant VALUES (1382, '1978-04-04', 'Hewa Jayaweera Kankanamge Gaya Nadeeka Kumari', NULL);
INSERT INTO public.dependant VALUES (1384, '2021-03-21', 'Reose Fernando', NULL);
INSERT INTO public.dependant VALUES (1395, '1961-02-04', 'AM Thilakarathna Banda', '196103501387');
INSERT INTO public.dependant VALUES (1396, '1968-06-29', 'WG Nelum Dhammika', '686810950');
INSERT INTO public.dependant VALUES (1407, '1984-03-29', 'TC Wickramaarachchi', '845890129V');
INSERT INTO public.dependant VALUES (1409, '2017-08-18', 'RALH Ranasinghearachchi', NULL);
INSERT INTO public.dependant VALUES (1418, '1948-02-04', 'PA Premawathi', '485354964V');
INSERT INTO public.dependant VALUES (1425, '1994-05-19', 'RASD Sanaweera', '941403026V');
INSERT INTO public.dependant VALUES (1446, '2022-10-24', 'MI  Dhiyan', NULL);
INSERT INTO public.dependant VALUES (1447, '1990-12-01', 'MFM Irshad', '199033600720');
INSERT INTO public.dependant VALUES (1448, '2017-08-12', 'MI Iman', NULL);
INSERT INTO public.dependant VALUES (1449, '2016-05-25', 'MI Salman', NULL);
INSERT INTO public.dependant VALUES (1461, '2003-12-26', 'KMGND Kulathunga', '200336100896');
INSERT INTO public.dependant VALUES (1462, '2009-11-29', 'KMRD Kulathunga', NULL);
INSERT INTO public.dependant VALUES (1463, '1984-09-04', 'RMSCB Rajanayaka', '847482982V');
INSERT INTO public.dependant VALUES (1470, '2001-06-04', 'MACT Madapola', NULL);
INSERT INTO public.dependant VALUES (1471, '2004-09-10', 'MAS Madapola', NULL);
INSERT INTO public.dependant VALUES (1472, '1969-11-25', 'MA Nandathilake', '196933003036');
INSERT INTO public.dependant VALUES (1483, '2014-02-12', 'KVSO Sandashaka', NULL);
INSERT INTO public.dependant VALUES (1484, '1983-11-20', 'KPWGCN Wijewardhane', '838252648V');
INSERT INTO public.dependant VALUES (1485, '2012-12-10', 'KVVT   Kavinhara', NULL);
INSERT INTO public.dependant VALUES (1490, '1964-01-28', 'R.Rajendran', '645280407V');
INSERT INTO public.dependant VALUES (1491, '1962-02-19', 'T. Rajendran', '620503479V');
INSERT INTO public.dependant VALUES (1500, '1988-06-01', 'LK Jayasinghe', '881533030V');
INSERT INTO public.dependant VALUES (1506, '1991-12-28', 'TWMDPM Weerasundara', '913633288V');
INSERT INTO public.dependant VALUES (1514, '2017-03-17', 'DGYT Gamage', NULL);
INSERT INTO public.dependant VALUES (1515, '1980-02-13', 'DGBU Gamage', '800441552V');
INSERT INTO public.dependant VALUES (1516, '2020-01-13', 'DGVA Gamage', NULL);
INSERT INTO public.dependant VALUES (1526, '1969-09-01', 'AMS Hemalatha', '697450351V');
INSERT INTO public.dependant VALUES (1527, '1963-03-13', 'ASS Shantha', '630731925V');
INSERT INTO public.dependant VALUES (1538, '1973-06-05', 'DRCL Perera', '731572437V');
INSERT INTO public.dependant VALUES (1540, '2015-07-27', 'DGRA Perera', NULL);
INSERT INTO public.dependant VALUES (1573, '1990-04-07', 'GHCS Madushani', '905981005V');
INSERT INTO public.dependant VALUES (1574, '2022-09-27', 'ON Lokuliyana', NULL);
INSERT INTO public.dependant VALUES (1575, '2019-11-22', 'OH Lokuliyana', NULL);
INSERT INTO public.dependant VALUES (1596, '1951-12-23', 'RM Muthumanika', '518581805V');
INSERT INTO public.dependant VALUES (1613, '1983-01-15', 'A Pushparani', '835154320V');
INSERT INTO public.dependant VALUES (1615, '2012-03-12', 'K Thinojan', NULL);
INSERT INTO public.dependant VALUES (1617, '2013-09-30', 'K Vdivyan', NULL);
INSERT INTO public.dependant VALUES (1618, '2020-03-18', 'K Pradeeshan', NULL);


--
-- Data for Name: dependant_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dependant_data VALUES (1, false, '2025-03-21', 2025, 'Daughter', 1, 1);
INSERT INTO public.dependant_data VALUES (2, false, '2025-03-21', 2025, 'Husband', 2, 1);
INSERT INTO public.dependant_data VALUES (3, false, '2025-03-21', 2025, 'Daughter', 3, 2);
INSERT INTO public.dependant_data VALUES (4, false, '2025-03-21', 2025, 'Husband', 4, 2);
INSERT INTO public.dependant_data VALUES (5, false, '2025-03-21', 2025, 'Daughter', 5, 2);
INSERT INTO public.dependant_data VALUES (6, false, '2025-03-21', 2025, 'Mother', 6, 3);
INSERT INTO public.dependant_data VALUES (7, false, '2025-03-21', 2025, 'Father', 7, 3);
INSERT INTO public.dependant_data VALUES (8, false, '2025-03-21', 2025, 'Husband', 9, 4);
INSERT INTO public.dependant_data VALUES (9, false, '2025-03-21', 2025, 'Wife', 8, 5);
INSERT INTO public.dependant_data VALUES (10, false, '2025-03-21', 2025, 'Daughter', 11, 5);
INSERT INTO public.dependant_data VALUES (11, false, '2025-03-21', 2025, 'Son', 10, 4);
INSERT INTO public.dependant_data VALUES (12, false, '2025-03-21', 2025, 'Husband', 12, 6);
INSERT INTO public.dependant_data VALUES (13, false, '2025-03-21', 2025, 'Daughter', 14, 4);
INSERT INTO public.dependant_data VALUES (14, false, '2025-03-21', 2025, 'Daughter', 13, 5);
INSERT INTO public.dependant_data VALUES (15, false, '2025-03-21', 2025, 'Husband', 15, 7);
INSERT INTO public.dependant_data VALUES (16, false, '2025-03-21', 2025, 'Son', 16, 6);
INSERT INTO public.dependant_data VALUES (17, false, '2025-03-21', 2025, 'Son', 17, 7);
INSERT INTO public.dependant_data VALUES (18, false, '2025-03-21', 2025, 'Husband', 18, 8);
INSERT INTO public.dependant_data VALUES (19, false, '2025-03-21', 2025, 'Daughter', 19, 8);
INSERT INTO public.dependant_data VALUES (20, false, '2025-03-21', 2025, 'Husband', 20, 9);
INSERT INTO public.dependant_data VALUES (21, false, '2025-03-21', 2025, 'Daughter', 21, 9);
INSERT INTO public.dependant_data VALUES (22, false, '2025-03-21', 2025, 'Son', 22, 9);
INSERT INTO public.dependant_data VALUES (23, false, '2025-03-21', 2025, 'Wife', 23, 10);
INSERT INTO public.dependant_data VALUES (24, false, '2025-03-21', 2025, 'Daughter', 24, 10);
INSERT INTO public.dependant_data VALUES (25, false, '2025-03-21', 2025, 'Wife', 25, 11);
INSERT INTO public.dependant_data VALUES (26, false, '2025-03-21', 2025, 'Husband', 26, 12);
INSERT INTO public.dependant_data VALUES (27, false, '2025-03-21', 2025, 'Wife', 27, 13);
INSERT INTO public.dependant_data VALUES (28, false, '2025-03-21', 2025, 'Son', 28, 12);
INSERT INTO public.dependant_data VALUES (29, false, '2025-03-21', 2025, 'Son', 29, 13);
INSERT INTO public.dependant_data VALUES (30, false, '2025-03-21', 2025, 'Son', 30, 13);
INSERT INTO public.dependant_data VALUES (31, false, '2025-03-21', 2025, 'Son', 31, 14);
INSERT INTO public.dependant_data VALUES (32, false, '2025-03-21', 2025, 'Husband', 32, 15);
INSERT INTO public.dependant_data VALUES (33, false, '2025-03-21', 2025, 'Son', 33, 15);
INSERT INTO public.dependant_data VALUES (34, false, '2025-03-21', 2025, 'Son', 34, 14);
INSERT INTO public.dependant_data VALUES (35, false, '2025-03-21', 2025, 'Husband', 35, 14);
INSERT INTO public.dependant_data VALUES (36, false, '2025-03-21', 2025, 'Mother', 36, 16);
INSERT INTO public.dependant_data VALUES (37, false, '2025-03-21', 2025, 'Father', 37, 16);
INSERT INTO public.dependant_data VALUES (38, false, '2025-03-21', 2025, 'Daughter', 38, 17);
INSERT INTO public.dependant_data VALUES (39, false, '2025-03-21', 2025, 'Wife', 39, 17);
INSERT INTO public.dependant_data VALUES (40, false, '2025-03-21', 2025, 'Daughter', 40, 17);
INSERT INTO public.dependant_data VALUES (41, false, '2025-03-21', 2025, 'Wife', 41, 18);
INSERT INTO public.dependant_data VALUES (42, false, '2025-03-21', 2025, 'Son', 42, 18);
INSERT INTO public.dependant_data VALUES (43, false, '2025-03-21', 2025, 'Daughter', 43, 18);
INSERT INTO public.dependant_data VALUES (44, false, '2025-03-21', 2025, 'Wife', 44, 19);
INSERT INTO public.dependant_data VALUES (45, false, '2025-03-21', 2025, 'Daughter', 45, 19);
INSERT INTO public.dependant_data VALUES (46, false, '2025-03-21', 2025, 'Daughter', 46, 20);
INSERT INTO public.dependant_data VALUES (47, false, '2025-03-21', 2025, 'Wife', 47, 20);
INSERT INTO public.dependant_data VALUES (48, false, '2025-03-21', 2025, 'Daughter', 48, 20);
INSERT INTO public.dependant_data VALUES (49, false, '2025-03-21', 2025, 'Daughter', 49, 20);
INSERT INTO public.dependant_data VALUES (50, false, '2025-03-21', 2025, 'Husband', 50, 22);
INSERT INTO public.dependant_data VALUES (52, false, '2025-03-21', 2025, 'Husband', 51, 23);
INSERT INTO public.dependant_data VALUES (51, false, '2025-03-21', 2025, 'Son', 52, 22);
INSERT INTO public.dependant_data VALUES (53, false, '2025-03-21', 2025, 'Daughter', 54, 23);
INSERT INTO public.dependant_data VALUES (54, false, '2025-03-21', 2025, 'Daughter', 53, 22);
INSERT INTO public.dependant_data VALUES (55, false, '2025-03-21', 2025, 'Daughter', 55, 23);
INSERT INTO public.dependant_data VALUES (56, false, '2025-03-21', 2025, 'Son', 56, 24);
INSERT INTO public.dependant_data VALUES (57, false, '2025-03-21', 2025, 'Husband', 57, 24);
INSERT INTO public.dependant_data VALUES (58, false, '2025-03-21', 2025, 'Son', 58, 24);
INSERT INTO public.dependant_data VALUES (59, false, '2025-03-21', 2025, 'Daughter', 59, 25);
INSERT INTO public.dependant_data VALUES (60, false, '2025-03-21', 2025, 'Daughter', 60, 26);
INSERT INTO public.dependant_data VALUES (61, false, '2025-03-21', 2025, 'Wife', 61, 25);
INSERT INTO public.dependant_data VALUES (62, false, '2025-03-21', 2025, 'Son', 62, 26);
INSERT INTO public.dependant_data VALUES (63, false, '2025-03-21', 2025, 'Husband', 63, 26);
INSERT INTO public.dependant_data VALUES (64, false, '2025-03-21', 2025, 'Husband', 64, 27);
INSERT INTO public.dependant_data VALUES (65, false, '2025-03-21', 2025, 'Daughter', 65, 29);
INSERT INTO public.dependant_data VALUES (66, false, '2025-03-21', 2025, 'Wife', 66, 29);
INSERT INTO public.dependant_data VALUES (67, false, '2025-03-21', 2025, 'Daughter', 67, 29);
INSERT INTO public.dependant_data VALUES (68, false, '2025-03-21', 2025, 'Daughter', 68, 29);
INSERT INTO public.dependant_data VALUES (69, false, '2025-03-21', 2025, 'Wife', 69, 30);
INSERT INTO public.dependant_data VALUES (70, false, '2025-03-21', 2025, 'Daughter', 70, 30);
INSERT INTO public.dependant_data VALUES (71, false, '2025-03-21', 2025, 'Daughter', 71, 30);
INSERT INTO public.dependant_data VALUES (72, false, '2025-03-21', 2025, 'Daughter', 72, 31);
INSERT INTO public.dependant_data VALUES (73, false, '2025-03-21', 2025, 'Daughter', 73, 31);
INSERT INTO public.dependant_data VALUES (74, false, '2025-03-21', 2025, 'Wife', 74, 31);
INSERT INTO public.dependant_data VALUES (75, false, '2025-03-21', 2025, 'Husband', 75, 33);
INSERT INTO public.dependant_data VALUES (76, false, '2025-03-21', 2025, 'Son', 76, 33);
INSERT INTO public.dependant_data VALUES (77, false, '2025-03-21', 2025, 'Daughter', 77, 33);
INSERT INTO public.dependant_data VALUES (78, false, '2025-03-21', 2025, NULL, 78, 34);
INSERT INTO public.dependant_data VALUES (79, false, '2025-03-21', 2025, 'Mother', 79, 36);
INSERT INTO public.dependant_data VALUES (80, false, '2025-03-21', 2025, 'Daughter', 80, 38);
INSERT INTO public.dependant_data VALUES (81, false, '2025-03-21', 2025, 'Husband', 81, 39);
INSERT INTO public.dependant_data VALUES (82, false, '2025-03-21', 2025, 'Husband', 82, 38);
INSERT INTO public.dependant_data VALUES (83, false, '2025-03-21', 2025, 'Son', 83, 39);
INSERT INTO public.dependant_data VALUES (84, false, '2025-03-21', 2025, 'Son', 84, 38);
INSERT INTO public.dependant_data VALUES (85, false, '2025-03-21', 2025, 'Daughter', 85, 39);
INSERT INTO public.dependant_data VALUES (86, false, '2025-03-21', 2025, 'Daughter', 86, 38);
INSERT INTO public.dependant_data VALUES (87, false, '2025-03-21', 2025, 'Husband', 87, 41);
INSERT INTO public.dependant_data VALUES (88, false, '2025-03-21', 2025, 'Daughter', 89, 43);
INSERT INTO public.dependant_data VALUES (89, false, '2025-03-21', 2025, 'Husband', 88, 42);
INSERT INTO public.dependant_data VALUES (90, false, '2025-03-21', 2025, 'Husband', 92, 43);
INSERT INTO public.dependant_data VALUES (91, false, '2025-03-21', 2025, 'Daughter', 90, 41);
INSERT INTO public.dependant_data VALUES (92, false, '2025-03-21', 2025, 'Son', 91, 42);
INSERT INTO public.dependant_data VALUES (93, false, '2025-03-21', 2025, 'Son', 93, 44);
INSERT INTO public.dependant_data VALUES (95, false, '2025-03-21', 2025, 'Daughter', 95, 41);
INSERT INTO public.dependant_data VALUES (94, false, '2025-03-21', 2025, 'Daughter', 94, 43);
INSERT INTO public.dependant_data VALUES (96, false, '2025-03-21', 2025, 'Daughter', 96, 40);
INSERT INTO public.dependant_data VALUES (97, false, '2025-03-21', 2025, 'Husband', 97, 40);
INSERT INTO public.dependant_data VALUES (98, false, '2025-03-21', 2025, 'Son', 98, 44);
INSERT INTO public.dependant_data VALUES (99, false, '2025-03-21', 2025, 'Wife', 99, 44);
INSERT INTO public.dependant_data VALUES (100, false, '2025-03-21', 2025, 'Wife', 100, 45);
INSERT INTO public.dependant_data VALUES (101, false, '2025-03-21', 2025, 'Son', 101, 45);
INSERT INTO public.dependant_data VALUES (102, false, '2025-03-21', 2025, 'Son', 102, 45);
INSERT INTO public.dependant_data VALUES (103, false, '2025-03-21', 2025, 'Son', 103, 46);
INSERT INTO public.dependant_data VALUES (104, false, '2025-03-21', 2025, 'Son', 104, 46);
INSERT INTO public.dependant_data VALUES (105, false, '2025-03-21', 2025, 'Wife', 105, 46);
INSERT INTO public.dependant_data VALUES (107, false, '2025-03-21', 2025, 'Husband', 106, 48);
INSERT INTO public.dependant_data VALUES (106, false, '2025-03-21', 2025, 'Daughter', 107, 47);
INSERT INTO public.dependant_data VALUES (108, false, '2025-03-21', 2025, 'Husband', 108, 47);
INSERT INTO public.dependant_data VALUES (109, false, '2025-03-21', 2025, 'Daughter', 109, 48);
INSERT INTO public.dependant_data VALUES (110, false, '2025-03-21', 2025, 'Daughter', 110, 48);
INSERT INTO public.dependant_data VALUES (111, false, '2025-03-21', 2025, 'Daughter', 111, 47);
INSERT INTO public.dependant_data VALUES (112, false, '2025-03-21', 2025, 'Husband', 112, 49);
INSERT INTO public.dependant_data VALUES (113, false, '2025-03-21', 2025, 'Daughter', 113, 49);
INSERT INTO public.dependant_data VALUES (114, false, '2025-03-21', 2025, 'Daughter', 114, 49);
INSERT INTO public.dependant_data VALUES (115, false, '2025-03-21', 2025, 'Wife', 115, 50);
INSERT INTO public.dependant_data VALUES (116, false, '2025-03-21', 2025, 'Daughter', 116, 50);
INSERT INTO public.dependant_data VALUES (117, false, '2025-03-21', 2025, 'Daughter', 117, 50);
INSERT INTO public.dependant_data VALUES (118, false, '2025-03-21', 2025, 'Wife', 118, 51);
INSERT INTO public.dependant_data VALUES (119, false, '2025-03-21', 2025, 'Son', 119, 53);
INSERT INTO public.dependant_data VALUES (120, false, '2025-03-21', 2025, 'Wife', 120, 53);
INSERT INTO public.dependant_data VALUES (121, false, '2025-03-21', 2025, 'Wife', 121, 54);
INSERT INTO public.dependant_data VALUES (122, false, '2025-03-21', 2025, 'Son', 122, 54);
INSERT INTO public.dependant_data VALUES (123, false, '2025-03-21', 2025, 'Daughter', 123, 55);
INSERT INTO public.dependant_data VALUES (124, false, '2025-03-21', 2025, 'Wife', 124, 55);
INSERT INTO public.dependant_data VALUES (125, false, '2025-03-21', 2025, 'Husband', 125, 57);
INSERT INTO public.dependant_data VALUES (126, false, '2025-03-21', 2025, 'Wife', 126, 58);
INSERT INTO public.dependant_data VALUES (127, false, '2025-03-21', 2025, 'Daughter', 127, 59);
INSERT INTO public.dependant_data VALUES (128, false, '2025-03-21', 2025, 'Son', 128, 58);
INSERT INTO public.dependant_data VALUES (129, false, '2025-03-21', 2025, 'Wife', 129, 60);
INSERT INTO public.dependant_data VALUES (130, false, '2025-03-21', 2025, 'Wife', 130, 59);
INSERT INTO public.dependant_data VALUES (131, false, '2025-03-21', 2025, 'Daughter', 132, 60);
INSERT INTO public.dependant_data VALUES (142, false, '2025-03-21', 2025, 'Daughter', 143, 65);
INSERT INTO public.dependant_data VALUES (143, false, '2025-03-21', 2025, 'Son', 144, 65);
INSERT INTO public.dependant_data VALUES (144, false, '2025-03-21', 2025, 'Daughter', 145, 65);
INSERT INTO public.dependant_data VALUES (147, false, '2025-03-21', 2025, 'Wife', 147, 65);
INSERT INTO public.dependant_data VALUES (158, false, '2025-03-21', 2025, 'Daughter', 158, 70);
INSERT INTO public.dependant_data VALUES (160, false, '2025-03-21', 2025, 'Husband', 160, 70);
INSERT INTO public.dependant_data VALUES (186, false, '2025-03-21', 2025, 'Wife', 186, 82);
INSERT INTO public.dependant_data VALUES (187, false, '2025-03-21', 2025, 'Daughter', 187, 82);
INSERT INTO public.dependant_data VALUES (189, false, '2025-03-21', 2025, 'Daughter', 189, 82);
INSERT INTO public.dependant_data VALUES (204, false, '2025-03-21', 2025, 'Son', 204, 89);
INSERT INTO public.dependant_data VALUES (205, false, '2025-03-21', 2025, 'Son', 205, 89);
INSERT INTO public.dependant_data VALUES (206, false, '2025-03-21', 2025, 'spouce', 206, 89);
INSERT INTO public.dependant_data VALUES (1627, false, '2025-03-21', 2025, 'Husband', 1623, 769);
INSERT INTO public.dependant_data VALUES (133, false, '2025-03-21', 2025, 'Daughter', 133, 59);
INSERT INTO public.dependant_data VALUES (134, false, '2025-03-21', 2025, 'Daughter', 134, 59);
INSERT INTO public.dependant_data VALUES (136, false, '2025-03-21', 2025, 'Wife', 136, 62);
INSERT INTO public.dependant_data VALUES (138, false, '2025-03-21', 2025, 'Daughter', 138, 62);
INSERT INTO public.dependant_data VALUES (146, false, '2025-03-21', 2025, 'Wife', 146, 66);
INSERT INTO public.dependant_data VALUES (148, false, '2025-03-21', 2025, 'Son', 148, 66);
INSERT INTO public.dependant_data VALUES (154, false, '2025-03-21', 2025, 'Daughter', 154, 69);
INSERT INTO public.dependant_data VALUES (156, false, '2025-03-21', 2025, 'Daughter', 156, 69);
INSERT INTO public.dependant_data VALUES (157, false, '2025-03-21', 2025, 'Son', 157, 69);
INSERT INTO public.dependant_data VALUES (162, false, '2025-03-21', 2025, 'Husband', 162, 72);
INSERT INTO public.dependant_data VALUES (163, false, '2025-03-21', 2025, 'Son', 163, 72);
INSERT INTO public.dependant_data VALUES (164, false, '2025-03-21', 2025, 'Daughter', 164, 72);
INSERT INTO public.dependant_data VALUES (172, false, '2025-03-21', 2025, 'Husband', 172, 75);
INSERT INTO public.dependant_data VALUES (173, false, '2025-03-21', 2025, 'Son', 173, 75);
INSERT INTO public.dependant_data VALUES (177, false, '2025-03-21', 2025, 'Wife', 177, 78);
INSERT INTO public.dependant_data VALUES (178, false, '2025-03-21', 2025, 'Son', 178, 78);
INSERT INTO public.dependant_data VALUES (181, false, '2025-03-21', 2025, 'Mother', 181, 81);
INSERT INTO public.dependant_data VALUES (182, false, '2025-03-21', 2025, 'Husband', 182, 81);
INSERT INTO public.dependant_data VALUES (183, false, '2025-03-21', 2025, 'Father', 183, 81);
INSERT INTO public.dependant_data VALUES (184, false, '2025-03-21', 2025, 'Son', 184, 81);
INSERT INTO public.dependant_data VALUES (185, false, '2025-03-21', 2025, 'Son', 185, 81);
INSERT INTO public.dependant_data VALUES (192, false, '2025-03-21', 2025, 'Wife', 192, 84);
INSERT INTO public.dependant_data VALUES (196, false, '2025-03-21', 2025, 'Husband', 196, 86);
INSERT INTO public.dependant_data VALUES (197, false, '2025-03-21', 2025, 'Daughter', 197, 86);
INSERT INTO public.dependant_data VALUES (208, false, '2025-03-21', 2025, 'Daughter', 208, 92);
INSERT INTO public.dependant_data VALUES (210, false, '2025-03-21', 2025, 'Husband', 210, 92);
INSERT INTO public.dependant_data VALUES (314, false, '2025-03-21', 2025, 'Son', 314, 137);
INSERT INTO public.dependant_data VALUES (315, false, '2025-03-21', 2025, 'Daughter', 315, 137);
INSERT INTO public.dependant_data VALUES (316, false, '2025-03-21', 2025, 'Wife', 316, 138);
INSERT INTO public.dependant_data VALUES (317, false, '2025-03-21', 2025, 'Son', 317, 138);
INSERT INTO public.dependant_data VALUES (318, false, '2025-03-21', 2025, 'Daughter', 318, 138);
INSERT INTO public.dependant_data VALUES (319, false, '2025-03-21', 2025, 'Husband', 319, 139);
INSERT INTO public.dependant_data VALUES (320, false, '2025-03-21', 2025, 'Son', 320, 140);
INSERT INTO public.dependant_data VALUES (321, false, '2025-03-21', 2025, 'Daughter', 321, 140);
INSERT INTO public.dependant_data VALUES (322, false, '2025-03-21', 2025, 'Spouce', 322, 140);
INSERT INTO public.dependant_data VALUES (323, false, '2025-03-21', 2025, 'Son', 323, 141);
INSERT INTO public.dependant_data VALUES (324, false, '2025-03-21', 2025, 'Wife', 324, 141);
INSERT INTO public.dependant_data VALUES (325, false, '2025-03-21', 2025, 'Daughter', 325, 141);
INSERT INTO public.dependant_data VALUES (326, false, '2025-03-21', 2025, 'Daughter', 326, 142);
INSERT INTO public.dependant_data VALUES (327, false, '2025-03-21', 2025, 'Son', 327, 142);
INSERT INTO public.dependant_data VALUES (328, false, '2025-03-21', 2025, 'Wife', 328, 143);
INSERT INTO public.dependant_data VALUES (329, false, '2025-03-21', 2025, 'Wife', 329, 144);
INSERT INTO public.dependant_data VALUES (330, false, '2025-03-21', 2025, 'Daughter', 330, 145);
INSERT INTO public.dependant_data VALUES (331, false, '2025-03-21', 2025, 'Huband', 331, 145);
INSERT INTO public.dependant_data VALUES (332, false, '2025-03-21', 2025, 'Husband', 332, 146);
INSERT INTO public.dependant_data VALUES (333, false, '2025-03-21', 2025, 'Husband', 333, 147);
INSERT INTO public.dependant_data VALUES (334, false, '2025-03-21', 2025, 'Mother', 334, 148);
INSERT INTO public.dependant_data VALUES (335, false, '2025-03-21', 2025, 'Father', 335, 148);
INSERT INTO public.dependant_data VALUES (336, false, '2025-03-21', 2025, 'Wife', 336, 149);
INSERT INTO public.dependant_data VALUES (337, false, '2025-03-21', 2025, 'Son', 337, 149);
INSERT INTO public.dependant_data VALUES (338, false, '2025-03-21', 2025, 'Father', 338, 150);
INSERT INTO public.dependant_data VALUES (339, false, '2025-03-21', 2025, 'Mother', 339, 150);
INSERT INTO public.dependant_data VALUES (340, false, '2025-03-21', 2025, 'Spouce', 340, 151);
INSERT INTO public.dependant_data VALUES (341, false, '2025-03-21', 2025, 'Son', 341, 151);
INSERT INTO public.dependant_data VALUES (342, false, '2025-03-21', 2025, 'Son', 342, 151);
INSERT INTO public.dependant_data VALUES (343, false, '2025-03-21', 2025, 'Son', 343, 152);
INSERT INTO public.dependant_data VALUES (344, false, '2025-03-21', 2025, 'Husband', 344, 152);
INSERT INTO public.dependant_data VALUES (345, false, '2025-03-21', 2025, 'Father', 345, 153);
INSERT INTO public.dependant_data VALUES (346, false, '2025-03-21', 2025, 'Mother', 346, 153);
INSERT INTO public.dependant_data VALUES (347, false, '2025-03-21', 2025, 'Daughter', 347, 154);
INSERT INTO public.dependant_data VALUES (348, false, '2025-03-21', 2025, 'Husband', 348, 154);
INSERT INTO public.dependant_data VALUES (349, false, '2025-03-21', 2025, 'Son', 349, 154);
INSERT INTO public.dependant_data VALUES (350, false, '2025-03-21', 2025, 'Wife', 350, 155);
INSERT INTO public.dependant_data VALUES (351, false, '2025-03-21', 2025, 'Son', 351, 155);
INSERT INTO public.dependant_data VALUES (352, false, '2025-03-21', 2025, 'Son', 352, 156);
INSERT INTO public.dependant_data VALUES (353, false, '2025-03-21', 2025, 'Son', 353, 156);
INSERT INTO public.dependant_data VALUES (354, false, '2025-03-21', 2025, 'Wife', 354, 156);
INSERT INTO public.dependant_data VALUES (355, false, '2025-03-21', 2025, 'Daughter', 355, 156);
INSERT INTO public.dependant_data VALUES (356, false, '2025-03-21', 2025, 'Wife', 356, 157);
INSERT INTO public.dependant_data VALUES (357, false, '2025-03-21', 2025, 'Mother', 357, 158);
INSERT INTO public.dependant_data VALUES (358, false, '2025-03-21', 2025, 'Father', 358, 158);
INSERT INTO public.dependant_data VALUES (359, false, '2025-03-21', 2025, 'Son', 359, 159);
INSERT INTO public.dependant_data VALUES (360, false, '2025-03-21', 2025, 'Husband', 360, 159);
INSERT INTO public.dependant_data VALUES (361, false, '2025-03-21', 2025, 'Husband', 361, 160);
INSERT INTO public.dependant_data VALUES (362, false, '2025-03-21', 2025, 'Son', 362, 159);
INSERT INTO public.dependant_data VALUES (363, false, '2025-03-21', 2025, 'Wife', 363, 162);
INSERT INTO public.dependant_data VALUES (364, false, '2025-03-21', 2025, 'Daughter', 364, 162);
INSERT INTO public.dependant_data VALUES (365, false, '2025-03-21', 2025, 'Daughter', 365, 162);
INSERT INTO public.dependant_data VALUES (366, false, '2025-03-21', 2025, 'Husband', 366, 163);
INSERT INTO public.dependant_data VALUES (367, false, '2025-03-21', 2025, 'Son', 367, 164);
INSERT INTO public.dependant_data VALUES (368, false, '2025-03-21', 2025, 'Husband', 368, 164);
INSERT INTO public.dependant_data VALUES (369, false, '2025-03-21', 2025, 'Wife', 369, 165);
INSERT INTO public.dependant_data VALUES (370, false, '2025-03-21', 2025, 'Daughter', 370, 165);
INSERT INTO public.dependant_data VALUES (371, false, '2025-03-21', 2025, 'Mother', 371, 166);
INSERT INTO public.dependant_data VALUES (372, false, '2025-03-21', 2025, 'Father', 372, 166);
INSERT INTO public.dependant_data VALUES (373, false, '2025-03-21', 2025, 'Daughter', 373, 167);
INSERT INTO public.dependant_data VALUES (374, false, '2025-03-21', 2025, 'Spouce', 374, 167);
INSERT INTO public.dependant_data VALUES (375, false, '2025-03-21', 2025, 'Son', 375, 168);
INSERT INTO public.dependant_data VALUES (376, false, '2025-03-21', 2025, 'Wife', 376, 168);
INSERT INTO public.dependant_data VALUES (377, false, '2025-03-21', 2025, 'Mother', 377, 169);
INSERT INTO public.dependant_data VALUES (378, false, '2025-03-21', 2025, 'Husband', 378, 170);
INSERT INTO public.dependant_data VALUES (379, false, '2025-03-21', 2025, 'Daughter', 379, 170);
INSERT INTO public.dependant_data VALUES (380, false, '2025-03-21', 2025, 'Son', 380, 171);
INSERT INTO public.dependant_data VALUES (381, false, '2025-03-21', 2025, 'Daughter', 381, 172);
INSERT INTO public.dependant_data VALUES (382, false, '2025-03-21', 2025, 'Spouce', 382, 171);
INSERT INTO public.dependant_data VALUES (383, false, '2025-03-21', 2025, 'Spouce', 384, 172);
INSERT INTO public.dependant_data VALUES (384, false, '2025-03-21', 2025, 'Son', 383, 173);
INSERT INTO public.dependant_data VALUES (385, false, '2025-03-21', 2025, 'Daughter', 385, 171);
INSERT INTO public.dependant_data VALUES (386, false, '2025-03-21', 2025, 'Spouce', 386, 173);
INSERT INTO public.dependant_data VALUES (387, false, '2025-03-21', 2025, 'Daughter', 387, 172);
INSERT INTO public.dependant_data VALUES (388, false, '2025-03-21', 2025, 'Daughter', 388, 173);
INSERT INTO public.dependant_data VALUES (389, false, '2025-03-21', 2025, 'Wife', 389, 174);
INSERT INTO public.dependant_data VALUES (390, false, '2025-03-21', 2025, 'Daughter', 390, 174);
INSERT INTO public.dependant_data VALUES (391, false, '2025-03-21', 2025, 'Son', 391, 174);
INSERT INTO public.dependant_data VALUES (392, false, '2025-03-21', 2025, 'Daughter', 392, 175);
INSERT INTO public.dependant_data VALUES (393, false, '2025-03-21', 2025, 'Daughter', 393, 175);
INSERT INTO public.dependant_data VALUES (394, false, '2025-03-21', 2025, 'Daughter', 394, 176);
INSERT INTO public.dependant_data VALUES (395, false, '2025-03-21', 2025, 'Daughter', 395, 177);
INSERT INTO public.dependant_data VALUES (396, false, '2025-03-21', 2025, 'Wife', 396, 177);
INSERT INTO public.dependant_data VALUES (397, false, '2025-03-21', 2025, 'Daughter', 397, 177);
INSERT INTO public.dependant_data VALUES (398, false, '2025-03-21', 2025, 'Son', 398, 178);
INSERT INTO public.dependant_data VALUES (399, false, '2025-03-21', 2025, 'Wife ', 399, 178);
INSERT INTO public.dependant_data VALUES (400, false, '2025-03-21', 2025, 'Daughter', 400, 178);
INSERT INTO public.dependant_data VALUES (401, false, '2025-03-21', 2025, 'Wife', 401, 180);
INSERT INTO public.dependant_data VALUES (402, false, '2025-03-21', 2025, 'Son', 402, 180);
INSERT INTO public.dependant_data VALUES (403, false, '2025-03-21', 2025, 'Wife', 403, 181);
INSERT INTO public.dependant_data VALUES (404, false, '2025-03-21', 2025, 'Son', 404, 181);
INSERT INTO public.dependant_data VALUES (405, false, '2025-03-21', 2025, 'Daughter', 405, 181);
INSERT INTO public.dependant_data VALUES (406, false, '2025-03-21', 2025, 'Son', 406, 182);
INSERT INTO public.dependant_data VALUES (407, false, '2025-03-21', 2025, 'Son', 407, 182);
INSERT INTO public.dependant_data VALUES (408, false, '2025-03-21', 2025, 'Wife', 408, 182);
INSERT INTO public.dependant_data VALUES (409, false, '2025-03-21', 2025, 'Father', 410, 183);
INSERT INTO public.dependant_data VALUES (410, false, '2025-03-21', 2025, 'Son', 409, 184);
INSERT INTO public.dependant_data VALUES (411, false, '2025-03-21', 2025, 'Husband', 411, 184);
INSERT INTO public.dependant_data VALUES (412, false, '2025-03-21', 2025, 'Mother', 412, 183);
INSERT INTO public.dependant_data VALUES (413, false, '2025-03-21', 2025, 'Daughter', 413, 184);
INSERT INTO public.dependant_data VALUES (414, false, '2025-03-21', 2025, 'Daughter', 414, 184);
INSERT INTO public.dependant_data VALUES (415, false, '2025-03-21', 2025, 'Dsughter', 416, 186);
INSERT INTO public.dependant_data VALUES (416, false, '2025-03-21', 2025, 'Wife', 417, 187);
INSERT INTO public.dependant_data VALUES (417, false, '2025-03-21', 2025, 'Husband', 418, 186);
INSERT INTO public.dependant_data VALUES (418, false, '2025-03-21', 2025, 'Daughter', 420, 187);
INSERT INTO public.dependant_data VALUES (132, false, '2025-03-21', 2025, 'Daughter', 131, 58);
INSERT INTO public.dependant_data VALUES (140, false, '2025-03-21', 2025, 'Wife', 139, 64);
INSERT INTO public.dependant_data VALUES (153, false, '2025-03-21', 2025, 'Husband', 153, 68);
INSERT INTO public.dependant_data VALUES (155, false, '2025-03-21', 2025, 'Daughter', 155, 68);
INSERT INTO public.dependant_data VALUES (169, false, '2025-03-21', 2025, 'Son', 169, 74);
INSERT INTO public.dependant_data VALUES (170, false, '2025-03-21', 2025, 'Wife', 170, 74);
INSERT INTO public.dependant_data VALUES (171, false, '2025-03-21', 2025, 'Daughter', 171, 74);
INSERT INTO public.dependant_data VALUES (180, false, '2025-03-21', 2025, 'Wife', 180, 80);
INSERT INTO public.dependant_data VALUES (198, false, '2025-03-21', 2025, 'spouce', 198, 87);
INSERT INTO public.dependant_data VALUES (199, false, '2025-03-21', 2025, 'Daughter', 199, 87);
INSERT INTO public.dependant_data VALUES (200, false, '2025-03-21', 2025, 'Daughter', 200, 87);
INSERT INTO public.dependant_data VALUES (209, false, '2025-03-21', 2025, 'Wife', 209, 93);
INSERT INTO public.dependant_data VALUES (211, false, '2025-03-21', 2025, 'Son', 211, 93);
INSERT INTO public.dependant_data VALUES (212, false, '2025-03-21', 2025, 'Son', 212, 93);
INSERT INTO public.dependant_data VALUES (135, false, '2025-03-21', 2025, 'Wife', 135, 61);
INSERT INTO public.dependant_data VALUES (137, false, '2025-03-21', 2025, 'Wife', 137, 63);
INSERT INTO public.dependant_data VALUES (139, false, '2025-03-21', 2025, 'Daughter', 140, 63);
INSERT INTO public.dependant_data VALUES (141, false, '2025-03-21', 2025, 'Daughter', 141, 63);
INSERT INTO public.dependant_data VALUES (145, false, '2025-03-21', 2025, 'Son', 142, 63);
INSERT INTO public.dependant_data VALUES (149, false, '2025-03-21', 2025, 'Son', 149, 67);
INSERT INTO public.dependant_data VALUES (150, false, '2025-03-21', 2025, 'Daughter', 150, 67);
INSERT INTO public.dependant_data VALUES (151, false, '2025-03-21', 2025, 'Daughter', 151, 67);
INSERT INTO public.dependant_data VALUES (152, false, '2025-03-21', 2025, 'Spouse', 152, 67);
INSERT INTO public.dependant_data VALUES (159, false, '2025-03-21', 2025, 'Daughter', 159, 71);
INSERT INTO public.dependant_data VALUES (161, false, '2025-03-21', 2025, 'Husband', 161, 71);
INSERT INTO public.dependant_data VALUES (165, false, '2025-03-21', 2025, 'Daughter', 165, 73);
INSERT INTO public.dependant_data VALUES (166, false, '2025-03-21', 2025, 'Daughter', 166, 73);
INSERT INTO public.dependant_data VALUES (167, false, '2025-03-21', 2025, 'Son', 167, 73);
INSERT INTO public.dependant_data VALUES (168, false, '2025-03-21', 2025, 'Wife', 168, 73);
INSERT INTO public.dependant_data VALUES (174, false, '2025-03-21', 2025, 'Daughter', 174, 77);
INSERT INTO public.dependant_data VALUES (175, false, '2025-03-21', 2025, 'Husband', 175, 77);
INSERT INTO public.dependant_data VALUES (176, false, '2025-03-21', 2025, 'Son', 176, 77);
INSERT INTO public.dependant_data VALUES (179, false, '2025-03-21', 2025, 'Mother', 179, 79);
INSERT INTO public.dependant_data VALUES (188, false, '2025-03-21', 2025, 'Son', 188, 83);
INSERT INTO public.dependant_data VALUES (190, false, '2025-03-21', 2025, 'Husband', 190, 83);
INSERT INTO public.dependant_data VALUES (191, false, '2025-03-21', 2025, 'Daughter', 191, 83);
INSERT INTO public.dependant_data VALUES (193, false, '2025-03-21', 2025, 'Daughter', 193, 85);
INSERT INTO public.dependant_data VALUES (194, false, '2025-03-21', 2025, 'Wife', 194, 85);
INSERT INTO public.dependant_data VALUES (195, false, '2025-03-21', 2025, 'Daughter', 195, 85);
INSERT INTO public.dependant_data VALUES (201, false, '2025-03-21', 2025, 'Son', 201, 88);
INSERT INTO public.dependant_data VALUES (202, false, '2025-03-21', 2025, 'Husband', 202, 88);
INSERT INTO public.dependant_data VALUES (203, false, '2025-03-21', 2025, 'Son', 203, 88);
INSERT INTO public.dependant_data VALUES (207, false, '2025-03-21', 2025, 'Husband', 207, 91);
INSERT INTO public.dependant_data VALUES (213, false, '2025-03-21', 2025, 'Husband', 213, 94);
INSERT INTO public.dependant_data VALUES (214, false, '2025-03-21', 2025, 'Son', 215, 95);
INSERT INTO public.dependant_data VALUES (215, false, '2025-03-21', 2025, 'Daughter', 214, 96);
INSERT INTO public.dependant_data VALUES (216, false, '2025-03-21', 2025, 'Son', 216, 94);
INSERT INTO public.dependant_data VALUES (217, false, '2025-03-21', 2025, 'Daughter', 217, 97);
INSERT INTO public.dependant_data VALUES (218, false, '2025-03-21', 2025, 'Wife', 218, 95);
INSERT INTO public.dependant_data VALUES (219, false, '2025-03-21', 2025, 'Husband', 219, 96);
INSERT INTO public.dependant_data VALUES (220, false, '2025-03-21', 2025, 'Daughter', 220, 94);
INSERT INTO public.dependant_data VALUES (221, false, '2025-03-21', 2025, 'Son', 221, 98);
INSERT INTO public.dependant_data VALUES (222, false, '2025-03-21', 2025, 'Huband', 222, 99);
INSERT INTO public.dependant_data VALUES (223, false, '2025-03-21', 2025, 'Daughter', 223, 97);
INSERT INTO public.dependant_data VALUES (224, false, '2025-03-21', 2025, 'Daughter', 224, 95);
INSERT INTO public.dependant_data VALUES (225, false, '2025-03-21', 2025, 'Daughter', 226, 99);
INSERT INTO public.dependant_data VALUES (226, false, '2025-03-21', 2025, 'Husband', 225, 98);
INSERT INTO public.dependant_data VALUES (227, false, '2025-03-21', 2025, 'Wife', 227, 97);
INSERT INTO public.dependant_data VALUES (228, false, '2025-03-21', 2025, 'Son', 228, 95);
INSERT INTO public.dependant_data VALUES (229, false, '2025-03-21', 2025, 'Son', 229, 98);
INSERT INTO public.dependant_data VALUES (230, false, '2025-03-21', 2025, 'Daughter', 230, 100);
INSERT INTO public.dependant_data VALUES (231, false, '2025-03-21', 2025, 'Husband', 231, 100);
INSERT INTO public.dependant_data VALUES (232, false, '2025-03-21', 2025, 'Husband', 232, 102);
INSERT INTO public.dependant_data VALUES (233, false, '2025-03-21', 2025, 'Son', 233, 103);
INSERT INTO public.dependant_data VALUES (234, false, '2025-03-21', 2025, 'Husband', 234, 103);
INSERT INTO public.dependant_data VALUES (235, false, '2025-03-21', 2025, 'Son', 235, 103);
INSERT INTO public.dependant_data VALUES (236, false, '2025-03-21', 2025, 'Daughter', 236, 104);
INSERT INTO public.dependant_data VALUES (237, false, '2025-03-21', 2025, 'Wife', 237, 105);
INSERT INTO public.dependant_data VALUES (238, false, '2025-03-21', 2025, 'Son', 238, 104);
INSERT INTO public.dependant_data VALUES (239, false, '2025-03-21', 2025, 'Son', 239, 105);
INSERT INTO public.dependant_data VALUES (240, false, '2025-03-21', 2025, 'Son', 240, 104);
INSERT INTO public.dependant_data VALUES (241, false, '2025-03-21', 2025, 'Daughter', 241, 105);
INSERT INTO public.dependant_data VALUES (242, false, '2025-03-21', 2025, 'Wife', 242, 104);
INSERT INTO public.dependant_data VALUES (243, false, '2025-03-21', 2025, NULL, 243, 106);
INSERT INTO public.dependant_data VALUES (244, false, '2025-03-21', 2025, 'Wife', 244, 107);
INSERT INTO public.dependant_data VALUES (245, false, '2025-03-21', 2025, 'Daughter', 245, 108);
INSERT INTO public.dependant_data VALUES (246, false, '2025-03-21', 2025, 'Husband', 246, 108);
INSERT INTO public.dependant_data VALUES (247, false, '2025-03-21', 2025, 'Son', 247, 109);
INSERT INTO public.dependant_data VALUES (248, false, '2025-03-21', 2025, 'Husband', 248, 109);
INSERT INTO public.dependant_data VALUES (249, false, '2025-03-21', 2025, 'Mother', 249, 110);
INSERT INTO public.dependant_data VALUES (250, false, '2025-03-21', 2025, 'Father', 250, 110);
INSERT INTO public.dependant_data VALUES (251, false, '2025-03-21', 2025, 'Wife', 251, 111);
INSERT INTO public.dependant_data VALUES (252, false, '2025-03-21', 2025, 'Daughter', 252, 111);
INSERT INTO public.dependant_data VALUES (253, false, '2025-03-21', 2025, 'Son', 253, 112);
INSERT INTO public.dependant_data VALUES (254, false, '2025-03-21', 2025, 'Son', 254, 112);
INSERT INTO public.dependant_data VALUES (255, false, '2025-03-21', 2025, 'Daughter', 255, 113);
INSERT INTO public.dependant_data VALUES (256, false, '2025-03-21', 2025, 'Spouse', 256, 113);
INSERT INTO public.dependant_data VALUES (257, false, '2025-03-21', 2025, 'Daughter', 257, 114);
INSERT INTO public.dependant_data VALUES (258, false, '2025-03-21', 2025, 'Daughter', 258, 113);
INSERT INTO public.dependant_data VALUES (259, false, '2025-03-21', 2025, 'Wife', 259, 114);
INSERT INTO public.dependant_data VALUES (260, false, '2025-03-21', 2025, 'Husband', 260, 115);
INSERT INTO public.dependant_data VALUES (261, false, '2025-03-21', 2025, 'Wife', 261, 116);
INSERT INTO public.dependant_data VALUES (262, false, '2025-03-21', 2025, 'Daughter', 262, 116);
INSERT INTO public.dependant_data VALUES (263, false, '2025-03-21', 2025, 'Son', 263, 118);
INSERT INTO public.dependant_data VALUES (264, false, '2025-03-21', 2025, 'Husband', 264, 118);
INSERT INTO public.dependant_data VALUES (265, false, '2025-03-21', 2025, 'Daughter', 265, 119);
INSERT INTO public.dependant_data VALUES (266, false, '2025-03-21', 2025, 'Wife', 266, 119);
INSERT INTO public.dependant_data VALUES (267, false, '2025-03-21', 2025, 'Daughter', 268, 119);
INSERT INTO public.dependant_data VALUES (268, false, '2025-03-21', 2025, 'Wife', 267, 120);
INSERT INTO public.dependant_data VALUES (269, false, '2025-03-21', 2025, 'Son', 269, 120);
INSERT INTO public.dependant_data VALUES (270, false, '2025-03-21', 2025, 'Son', 270, 120);
INSERT INTO public.dependant_data VALUES (271, false, '2025-03-21', 2025, 'Son', 271, 121);
INSERT INTO public.dependant_data VALUES (272, false, '2025-03-21', 2025, 'Wife', 272, 121);
INSERT INTO public.dependant_data VALUES (273, false, '2025-03-21', 2025, 'Daughter', 273, 121);
INSERT INTO public.dependant_data VALUES (274, false, '2025-03-21', 2025, 'Daughter', 274, 122);
INSERT INTO public.dependant_data VALUES (275, false, '2025-03-21', 2025, 'Wife', 275, 122);
INSERT INTO public.dependant_data VALUES (276, false, '2025-03-21', 2025, 'Wife', 276, 123);
INSERT INTO public.dependant_data VALUES (277, false, '2025-03-21', 2025, 'Daughter', 277, 123);
INSERT INTO public.dependant_data VALUES (278, false, '2025-03-21', 2025, 'Son', 278, 123);
INSERT INTO public.dependant_data VALUES (279, false, '2025-03-21', 2025, 'Daughter', 279, 124);
INSERT INTO public.dependant_data VALUES (280, false, '2025-03-21', 2025, 'Daughter', 280, 124);
INSERT INTO public.dependant_data VALUES (281, false, '2025-03-21', 2025, 'Huband', 281, 125);
INSERT INTO public.dependant_data VALUES (282, false, '2025-03-21', 2025, 'Daughter', 282, 124);
INSERT INTO public.dependant_data VALUES (283, false, '2025-03-21', 2025, 'Child', 284, 126);
INSERT INTO public.dependant_data VALUES (284, false, '2025-03-21', 2025, 'Spouce', 283, 124);
INSERT INTO public.dependant_data VALUES (285, false, '2025-03-21', 2025, 'Child', 285, 126);
INSERT INTO public.dependant_data VALUES (286, false, '2025-03-21', 2025, 'Child', 286, 126);
INSERT INTO public.dependant_data VALUES (287, false, '2025-03-21', 2025, 'Spouce', 287, 126);
INSERT INTO public.dependant_data VALUES (288, false, '2025-03-21', 2025, 'Wife', 288, 127);
INSERT INTO public.dependant_data VALUES (289, false, '2025-03-21', 2025, 'Daughter', 289, 128);
INSERT INTO public.dependant_data VALUES (290, false, '2025-03-21', 2025, 'Wife', 290, 128);
INSERT INTO public.dependant_data VALUES (291, false, '2025-03-21', 2025, 'Wife', 291, 128);
INSERT INTO public.dependant_data VALUES (292, false, '2025-03-21', 2025, 'Daughter', 292, 129);
INSERT INTO public.dependant_data VALUES (293, false, '2025-03-21', 2025, 'Spouce', 293, 129);
INSERT INTO public.dependant_data VALUES (294, false, '2025-03-21', 2025, 'Daughter', 294, 129);
INSERT INTO public.dependant_data VALUES (295, false, '2025-03-21', 2025, 'Daughter', 295, 129);
INSERT INTO public.dependant_data VALUES (296, false, '2025-03-21', 2025, 'Son', 296, 130);
INSERT INTO public.dependant_data VALUES (297, false, '2025-03-21', 2025, 'Daughter', 297, 130);
INSERT INTO public.dependant_data VALUES (298, false, '2025-03-21', 2025, 'Son', 298, 130);
INSERT INTO public.dependant_data VALUES (299, false, '2025-03-21', 2025, 'Spouce', 299, 130);
INSERT INTO public.dependant_data VALUES (300, false, '2025-03-21', 2025, 'Spouce', 300, 131);
INSERT INTO public.dependant_data VALUES (301, false, '2025-03-21', 2025, 'Daughter', 301, 132);
INSERT INTO public.dependant_data VALUES (302, false, '2025-03-21', 2025, 'Wife', 302, 132);
INSERT INTO public.dependant_data VALUES (303, false, '2025-03-21', 2025, 'Daughter', 303, 132);
INSERT INTO public.dependant_data VALUES (304, false, '2025-03-21', 2025, 'Daughter', 304, 133);
INSERT INTO public.dependant_data VALUES (305, false, '2025-03-21', 2025, 'Daughter', 305, 133);
INSERT INTO public.dependant_data VALUES (306, false, '2025-03-21', 2025, 'Husband', 306, 133);
INSERT INTO public.dependant_data VALUES (307, false, '2025-03-21', 2025, 'Wife', 307, 134);
INSERT INTO public.dependant_data VALUES (308, false, '2025-03-21', 2025, 'Son', 308, 134);
INSERT INTO public.dependant_data VALUES (309, false, '2025-03-21', 2025, 'Wife', 309, 135);
INSERT INTO public.dependant_data VALUES (310, false, '2025-03-21', 2025, 'Son', 310, 135);
INSERT INTO public.dependant_data VALUES (311, false, '2025-03-21', 2025, 'Son', 311, 136);
INSERT INTO public.dependant_data VALUES (312, false, '2025-03-21', 2025, 'Son', 312, 135);
INSERT INTO public.dependant_data VALUES (313, false, '2025-03-21', 2025, 'Wife', 313, 137);
INSERT INTO public.dependant_data VALUES (419, false, '2025-03-21', 2025, 'Son', 419, 186);
INSERT INTO public.dependant_data VALUES (429, false, '2025-03-21', 2025, 'Wife', 430, 193);
INSERT INTO public.dependant_data VALUES (430, false, '2025-03-21', 2025, 'Son', 431, 193);
INSERT INTO public.dependant_data VALUES (432, false, '2025-03-21', 2025, 'Daughter', 433, 193);
INSERT INTO public.dependant_data VALUES (441, false, '2025-03-21', 2025, 'Husband', 442, 199);
INSERT INTO public.dependant_data VALUES (443, false, '2025-03-21', 2025, 'Daughter', 444, 199);
INSERT INTO public.dependant_data VALUES (444, false, '2025-03-21', 2025, 'Daughter', 445, 199);
INSERT INTO public.dependant_data VALUES (451, false, '2025-03-21', 2025, 'Wife', 452, 206);
INSERT INTO public.dependant_data VALUES (460, false, '2025-03-21', 2025, 'Son', 461, 210);
INSERT INTO public.dependant_data VALUES (462, false, '2025-03-21', 2025, 'Son', 463, 210);
INSERT INTO public.dependant_data VALUES (463, false, '2025-03-21', 2025, 'Wife', 464, 210);
INSERT INTO public.dependant_data VALUES (470, false, '2025-03-21', 2025, 'Son', 471, 217);
INSERT INTO public.dependant_data VALUES (479, false, '2025-03-21', 2025, 'Wife', 480, 221);
INSERT INTO public.dependant_data VALUES (480, false, '2025-03-21', 2025, 'Son', 481, 221);
INSERT INTO public.dependant_data VALUES (482, false, '2025-03-21', 2025, 'Son', 484, 221);
INSERT INTO public.dependant_data VALUES (488, false, '2025-03-21', 2025, 'Son', 490, 225);
INSERT INTO public.dependant_data VALUES (490, false, '2025-03-21', 2025, 'Wife', 492, 225);
INSERT INTO public.dependant_data VALUES (502, false, '2025-03-21', 2025, 'Wife', 503, 230);
INSERT INTO public.dependant_data VALUES (503, false, '2025-03-21', 2025, 'Daughter', 504, 230);
INSERT INTO public.dependant_data VALUES (510, false, '2025-03-21', 2025, 'Son', 511, 236);
INSERT INTO public.dependant_data VALUES (512, false, '2025-03-21', 2025, 'Wfe', 513, 236);
INSERT INTO public.dependant_data VALUES (522, false, '2025-03-21', 2025, 'Wife', 523, 242);
INSERT INTO public.dependant_data VALUES (523, false, '2025-03-21', 2025, 'Daughter', 524, 242);
INSERT INTO public.dependant_data VALUES (524, false, '2025-03-21', 2025, 'Daughter', 525, 242);
INSERT INTO public.dependant_data VALUES (538, false, '2025-03-21', 2025, 'Husband', 538, 248);
INSERT INTO public.dependant_data VALUES (541, false, '2025-03-21', 2025, 'Son', 542, 248);
INSERT INTO public.dependant_data VALUES (555, false, '2025-03-21', 2025, 'Wife', 556, 256);
INSERT INTO public.dependant_data VALUES (556, false, '2025-03-21', 2025, 'Son', 557, 256);
INSERT INTO public.dependant_data VALUES (572, false, '2025-03-21', 2025, 'Son', 574, 265);
INSERT INTO public.dependant_data VALUES (575, false, '2025-03-21', 2025, 'Son', 575, 265);
INSERT INTO public.dependant_data VALUES (576, false, '2025-03-21', 2025, 'Spouse', 577, 265);
INSERT INTO public.dependant_data VALUES (590, false, '2025-03-21', 2025, 'Father', 591, 276);
INSERT INTO public.dependant_data VALUES (592, false, '2025-03-21', 2025, 'Mother', 592, 276);
INSERT INTO public.dependant_data VALUES (607, false, '2025-03-21', 2025, 'Daughter', 608, 282);
INSERT INTO public.dependant_data VALUES (609, false, '2025-03-21', 2025, 'Daughter', 610, 282);
INSERT INTO public.dependant_data VALUES (611, false, '2025-03-21', 2025, 'Son', 612, 282);
INSERT INTO public.dependant_data VALUES (613, false, '2025-03-21', 2025, 'Daughter', 614, 282);
INSERT INTO public.dependant_data VALUES (615, false, '2025-03-21', 2025, 'Son', 616, 282);
INSERT INTO public.dependant_data VALUES (616, false, '2025-03-21', 2025, 'Wife', 617, 282);
INSERT INTO public.dependant_data VALUES (631, false, '2025-03-21', 2025, 'Husband', 632, 296);
INSERT INTO public.dependant_data VALUES (633, false, '2025-03-21', 2025, 'Son', 634, 296);
INSERT INTO public.dependant_data VALUES (634, false, '2025-03-21', 2025, 'Son', 635, 296);
INSERT INTO public.dependant_data VALUES (643, false, '2025-03-21', 2025, 'Husband', 644, 301);
INSERT INTO public.dependant_data VALUES (644, false, '2025-03-21', 2025, 'Daughter', 645, 301);
INSERT INTO public.dependant_data VALUES (654, false, '2025-03-21', 2025, 'Wife', 655, 307);
INSERT INTO public.dependant_data VALUES (655, false, '2025-03-21', 2025, 'Son', 656, 307);
INSERT INTO public.dependant_data VALUES (656, false, '2025-03-21', 2025, 'Daughter', 657, 307);
INSERT INTO public.dependant_data VALUES (657, false, '2025-03-21', 2025, 'Daughter', 658, 307);
INSERT INTO public.dependant_data VALUES (682, false, '2025-03-21', 2025, 'Mother', 683, 319);
INSERT INTO public.dependant_data VALUES (683, false, '2025-03-21', 2025, 'Father', 684, 319);
INSERT INTO public.dependant_data VALUES (698, false, '2025-03-21', 2025, 'Husband', 698, 326);
INSERT INTO public.dependant_data VALUES (701, false, '2025-03-21', 2025, 'Son', 700, 326);
INSERT INTO public.dependant_data VALUES (702, false, '2025-03-21', 2025, 'Daughter', 703, 326);
INSERT INTO public.dependant_data VALUES (718, false, '2025-03-21', 2025, 'Wife', 718, 333);
INSERT INTO public.dependant_data VALUES (727, false, '2025-03-21', 2025, 'Husband', 727, 339);
INSERT INTO public.dependant_data VALUES (738, false, '2025-03-21', 2025, 'Daughter', 738, 345);
INSERT INTO public.dependant_data VALUES (739, false, '2025-03-21', 2025, 'Wife', 739, 345);
INSERT INTO public.dependant_data VALUES (740, false, '2025-03-21', 2025, 'Son', 740, 345);
INSERT INTO public.dependant_data VALUES (756, false, '2025-03-21', 2025, 'Wife', 756, 351);
INSERT INTO public.dependant_data VALUES (772, false, '2025-03-21', 2025, 'Daughter', 772, 358);
INSERT INTO public.dependant_data VALUES (774, false, '2025-03-21', 2025, 'Wife', 774, 358);
INSERT INTO public.dependant_data VALUES (782, false, '2025-03-21', 2025, 'Daughter', 782, 364);
INSERT INTO public.dependant_data VALUES (783, false, '2025-03-21', 2025, 'Spouse', 783, 364);
INSERT INTO public.dependant_data VALUES (787, false, '2025-03-21', 2025, 'Wife', 787, 368);
INSERT INTO public.dependant_data VALUES (791, false, '2025-03-21', 2025, 'Son', 791, 368);
INSERT INTO public.dependant_data VALUES (794, false, '2025-03-21', 2025, 'Son', 794, 368);
INSERT INTO public.dependant_data VALUES (806, false, '2025-03-21', 2025, 'Son', 806, 377);
INSERT INTO public.dependant_data VALUES (810, false, '2025-03-21', 2025, 'Son', 810, 377);
INSERT INTO public.dependant_data VALUES (814, false, '2025-03-21', 2025, 'Son', 814, 377);
INSERT INTO public.dependant_data VALUES (816, false, '2025-03-21', 2025, 'Wife', 816, 377);
INSERT INTO public.dependant_data VALUES (828, false, '2025-03-21', 2025, 'Daughter', 828, 383);
INSERT INTO public.dependant_data VALUES (830, false, '2025-03-21', 2025, 'Daughter', 830, 383);
INSERT INTO public.dependant_data VALUES (835, false, '2025-03-21', 2025, 'Wife', 835, 383);
INSERT INTO public.dependant_data VALUES (837, false, '2025-03-21', 2025, 'Son', 837, 383);
INSERT INTO public.dependant_data VALUES (849, false, '2025-03-21', 2025, 'Wife', 849, 390);
INSERT INTO public.dependant_data VALUES (850, false, '2025-03-21', 2025, 'Daughter', 850, 390);
INSERT INTO public.dependant_data VALUES (851, false, '2025-03-21', 2025, 'Daughter', 851, 390);
INSERT INTO public.dependant_data VALUES (858, false, '2025-03-21', 2025, 'Husband', 858, 394);
INSERT INTO public.dependant_data VALUES (860, false, '2025-03-21', 2025, 'Son', 859, 394);
INSERT INTO public.dependant_data VALUES (868, false, '2025-03-21', 2025, 'Husband', 868, 401);
INSERT INTO public.dependant_data VALUES (869, false, '2025-03-21', 2025, 'Daughter', 869, 401);
INSERT INTO public.dependant_data VALUES (878, false, '2025-03-21', 2025, 'Daughter', 878, 407);
INSERT INTO public.dependant_data VALUES (880, false, '2025-03-21', 2025, 'Husband', 880, 407);
INSERT INTO public.dependant_data VALUES (882, false, '2025-03-21', 2025, 'Son', 882, 407);
INSERT INTO public.dependant_data VALUES (883, false, '2025-03-21', 2025, 'Daughter', 883, 407);
INSERT INTO public.dependant_data VALUES (897, false, '2025-03-21', 2025, 'Husband', 898, 412);
INSERT INTO public.dependant_data VALUES (900, false, '2025-03-21', 2025, 'Daughter', 900, 412);
INSERT INTO public.dependant_data VALUES (917, false, '2025-03-21', 2025, 'Husband', 917, 421);
INSERT INTO public.dependant_data VALUES (934, false, '2025-03-21', 2025, 'Daughter', 934, 426);
INSERT INTO public.dependant_data VALUES (936, false, '2025-03-21', 2025, 'Husband', 936, 426);
INSERT INTO public.dependant_data VALUES (938, false, '2025-03-21', 2025, 'Son', 938, 426);
INSERT INTO public.dependant_data VALUES (420, false, '2025-03-21', 2025, 'Son', 421, 189);
INSERT INTO public.dependant_data VALUES (421, false, '2025-03-21', 2025, 'Daughter', 422, 189);
INSERT INTO public.dependant_data VALUES (422, false, '2025-03-21', 2025, 'Huband', 423, 189);
INSERT INTO public.dependant_data VALUES (423, false, '2025-03-21', 2025, 'Daughter', 424, 189);
INSERT INTO public.dependant_data VALUES (435, false, '2025-03-21', 2025, 'Daughter', 436, 195);
INSERT INTO public.dependant_data VALUES (436, false, '2025-03-21', 2025, 'Son', 437, 195);
INSERT INTO public.dependant_data VALUES (437, false, '2025-03-21', 2025, 'Huband', 438, 195);
INSERT INTO public.dependant_data VALUES (446, false, '2025-03-21', 2025, 'Mother', 447, 201);
INSERT INTO public.dependant_data VALUES (447, false, '2025-03-21', 2025, 'Father', 448, 201);
INSERT INTO public.dependant_data VALUES (453, false, '2025-03-21', 2025, 'Father', 454, 207);
INSERT INTO public.dependant_data VALUES (454, false, '2025-03-21', 2025, 'Mother', 455, 207);
INSERT INTO public.dependant_data VALUES (472, false, '2025-03-21', 2025, 'Son', 473, 219);
INSERT INTO public.dependant_data VALUES (473, false, '2025-03-21', 2025, 'Daughter', 474, 219);
INSERT INTO public.dependant_data VALUES (474, false, '2025-03-21', 2025, 'Daughter', 475, 219);
INSERT INTO public.dependant_data VALUES (475, false, '2025-03-21', 2025, 'Wife', 476, 219);
INSERT INTO public.dependant_data VALUES (494, false, '2025-03-21', 2025, 'Son', 496, 228);
INSERT INTO public.dependant_data VALUES (499, false, '2025-03-21', 2025, 'Wife', 500, 228);
INSERT INTO public.dependant_data VALUES (501, false, '2025-03-21', 2025, 'Daughter', 502, 228);
INSERT INTO public.dependant_data VALUES (508, false, '2025-03-21', 2025, 'Husband', 509, 234);
INSERT INTO public.dependant_data VALUES (521, false, '2025-03-21', 2025, 'Husband', 522, 240);
INSERT INTO public.dependant_data VALUES (534, false, '2025-03-21', 2025, 'Daughter', 535, 247);
INSERT INTO public.dependant_data VALUES (535, false, '2025-03-21', 2025, 'Wife', 536, 247);
INSERT INTO public.dependant_data VALUES (536, false, '2025-03-21', 2025, 'Son', 537, 247);
INSERT INTO public.dependant_data VALUES (539, false, '2025-03-21', 2025, 'Daughter', 540, 247);
INSERT INTO public.dependant_data VALUES (548, false, '2025-03-21', 2025, 'Son', 549, 252);
INSERT INTO public.dependant_data VALUES (550, false, '2025-03-21', 2025, 'Daughter', 551, 252);
INSERT INTO public.dependant_data VALUES (552, false, '2025-03-21', 2025, 'Husband', 553, 252);
INSERT INTO public.dependant_data VALUES (562, false, '2025-03-21', 2025, 'Son', 563, 259);
INSERT INTO public.dependant_data VALUES (570, false, '2025-03-21', 2025, 'Wife', 571, 264);
INSERT INTO public.dependant_data VALUES (586, false, '2025-03-21', 2025, 'Mother', 587, 274);
INSERT INTO public.dependant_data VALUES (599, false, '2025-03-21', 2025, 'Daughter', 599, 279);
INSERT INTO public.dependant_data VALUES (601, false, '2025-03-21', 2025, 'Husband', 602, 279);
INSERT INTO public.dependant_data VALUES (617, false, '2025-03-21', 2025, 'Son', 618, 284);
INSERT INTO public.dependant_data VALUES (618, false, '2025-03-21', 2025, 'Daughter', 619, 284);
INSERT INTO public.dependant_data VALUES (619, false, '2025-03-21', 2025, 'Spause', 620, 284);
INSERT INTO public.dependant_data VALUES (626, false, '2025-03-21', 2025, 'Father', 627, 291);
INSERT INTO public.dependant_data VALUES (628, false, '2025-03-21', 2025, 'Daughter', 629, 293);
INSERT INTO public.dependant_data VALUES (630, false, '2025-03-21', 2025, 'Son', 631, 293);
INSERT INTO public.dependant_data VALUES (639, false, '2025-03-21', 2025, 'Daughter', 640, 300);
INSERT INTO public.dependant_data VALUES (640, false, '2025-03-21', 2025, 'Son', 641, 300);
INSERT INTO public.dependant_data VALUES (641, false, '2025-03-21', 2025, 'Wife', 642, 300);
INSERT INTO public.dependant_data VALUES (642, false, '2025-03-21', 2025, 'Daughter', 643, 300);
INSERT INTO public.dependant_data VALUES (652, false, '2025-03-21', 2025, 'Son', 653, 306);
INSERT INTO public.dependant_data VALUES (653, false, '2025-03-21', 2025, 'Son', 654, 306);
INSERT INTO public.dependant_data VALUES (668, false, '2025-03-21', 2025, 'Daughter', 670, 311);
INSERT INTO public.dependant_data VALUES (670, false, '2025-03-21', 2025, 'Wife', 671, 311);
INSERT INTO public.dependant_data VALUES (673, false, '2025-03-21', 2025, 'Daughter', 674, 311);
INSERT INTO public.dependant_data VALUES (679, false, '2025-03-21', 2025, 'Wife', 680, 317);
INSERT INTO public.dependant_data VALUES (681, false, '2025-03-21', 2025, 'Daughter', 682, 317);
INSERT INTO public.dependant_data VALUES (687, false, '2025-03-21', 2025, 'Son', 688, 322);
INSERT INTO public.dependant_data VALUES (688, false, '2025-03-21', 2025, 'Wife', 689, 322);
INSERT INTO public.dependant_data VALUES (689, false, '2025-03-21', 2025, 'Daughter', 690, 322);
INSERT INTO public.dependant_data VALUES (690, false, '2025-03-21', 2025, 'Daughter', 691, 322);
INSERT INTO public.dependant_data VALUES (704, false, '2025-03-21', 2025, 'Son', 704, 328);
INSERT INTO public.dependant_data VALUES (705, false, '2025-03-21', 2025, 'Daughter', 705, 328);
INSERT INTO public.dependant_data VALUES (706, false, '2025-03-21', 2025, 'Daughter', 706, 328);
INSERT INTO public.dependant_data VALUES (707, false, '2025-03-21', 2025, 'Wife', 707, 328);
INSERT INTO public.dependant_data VALUES (708, false, '2025-03-21', 2025, 'Son', 708, 328);
INSERT INTO public.dependant_data VALUES (719, false, '2025-03-21', 2025, 'Wife', 719, 335);
INSERT INTO public.dependant_data VALUES (720, false, '2025-03-21', 2025, 'Son', 720, 335);
INSERT INTO public.dependant_data VALUES (742, false, '2025-03-21', 2025, 'Daughter', 742, 347);
INSERT INTO public.dependant_data VALUES (744, false, '2025-03-21', 2025, 'Wife', 744, 347);
INSERT INTO public.dependant_data VALUES (745, false, '2025-03-21', 2025, 'Daughter', 745, 347);
INSERT INTO public.dependant_data VALUES (746, false, '2025-03-21', 2025, 'Daughter', 746, 347);
INSERT INTO public.dependant_data VALUES (747, false, '2025-03-21', 2025, 'Daughter', 747, 347);
INSERT INTO public.dependant_data VALUES (758, false, '2025-03-21', 2025, 'Father', 758, 353);
INSERT INTO public.dependant_data VALUES (760, false, '2025-03-21', 2025, 'Mother', 760, 353);
INSERT INTO public.dependant_data VALUES (770, false, '2025-03-21', 2025, 'Mother', 770, 356);
INSERT INTO public.dependant_data VALUES (779, false, '2025-03-21', 2025, 'Daughter', 779, 362);
INSERT INTO public.dependant_data VALUES (780, false, '2025-03-21', 2025, 'Wife', 780, 362);
INSERT INTO public.dependant_data VALUES (796, false, '2025-03-21', 2025, 'Father', 796, 370);
INSERT INTO public.dependant_data VALUES (797, false, '2025-03-21', 2025, 'Mother', 797, 370);
INSERT INTO public.dependant_data VALUES (803, false, '2025-03-21', 2025, 'Daughter', 803, 375);
INSERT INTO public.dependant_data VALUES (807, false, '2025-03-21', 2025, 'Spouse', 808, 375);
INSERT INTO public.dependant_data VALUES (812, false, '2025-03-21', 2025, 'Son', 812, 375);
INSERT INTO public.dependant_data VALUES (820, false, '2025-03-21', 2025, 'Son', 820, 380);
INSERT INTO public.dependant_data VALUES (822, false, '2025-03-21', 2025, 'Wife', 822, 380);
INSERT INTO public.dependant_data VALUES (839, false, '2025-03-21', 2025, 'Daughter', 839, 386);
INSERT INTO public.dependant_data VALUES (842, false, '2025-03-21', 2025, 'Son', 842, 386);
INSERT INTO public.dependant_data VALUES (844, false, '2025-03-21', 2025, 'Wife', 844, 386);
INSERT INTO public.dependant_data VALUES (853, false, '2025-03-21', 2025, 'Daughter', 853, 392);
INSERT INTO public.dependant_data VALUES (854, false, '2025-03-21', 2025, 'Wife', 854, 392);
INSERT INTO public.dependant_data VALUES (857, false, '2025-03-21', 2025, 'Son', 857, 392);
INSERT INTO public.dependant_data VALUES (870, false, '2025-03-21', 2025, 'Wife', 870, 403);
INSERT INTO public.dependant_data VALUES (894, false, '2025-03-21', 2025, 'Son', 894, 411);
INSERT INTO public.dependant_data VALUES (895, false, '2025-03-21', 2025, 'Son', 895, 411);
INSERT INTO public.dependant_data VALUES (896, false, '2025-03-21', 2025, 'Husband', 896, 411);
INSERT INTO public.dependant_data VALUES (908, false, '2025-03-21', 2025, 'Son', 908, 416);
INSERT INTO public.dependant_data VALUES (911, false, '2025-03-21', 2025, 'Husband', 910, 416);
INSERT INTO public.dependant_data VALUES (926, false, '2025-03-21', 2025, 'Son', 926, 422);
INSERT INTO public.dependant_data VALUES (928, false, '2025-03-21', 2025, 'Wife', 928, 422);
INSERT INTO public.dependant_data VALUES (930, false, '2025-03-21', 2025, 'Daughter', 930, 422);
INSERT INTO public.dependant_data VALUES (945, false, '2025-03-21', 2025, 'Daughter', 945, 429);
INSERT INTO public.dependant_data VALUES (946, false, '2025-03-21', 2025, 'Daughter', 946, 429);
INSERT INTO public.dependant_data VALUES (947, false, '2025-03-21', 2025, 'Son', 947, 429);
INSERT INTO public.dependant_data VALUES (948, false, '2025-03-21', 2025, 'Daughter', 948, 429);
INSERT INTO public.dependant_data VALUES (949, false, '2025-03-21', 2025, 'Daughter', 949, 429);
INSERT INTO public.dependant_data VALUES (950, false, '2025-03-21', 2025, 'Wife', 950, 429);
INSERT INTO public.dependant_data VALUES (424, false, '2025-03-21', 2025, 'Son', 425, 190);
INSERT INTO public.dependant_data VALUES (425, false, '2025-03-21', 2025, 'Huband', 426, 190);
INSERT INTO public.dependant_data VALUES (427, false, '2025-03-21', 2025, 'Son', 428, 190);
INSERT INTO public.dependant_data VALUES (438, false, '2025-03-21', 2025, 'Wife', 439, 196);
INSERT INTO public.dependant_data VALUES (439, false, '2025-03-21', 2025, 'Son', 440, 196);
INSERT INTO public.dependant_data VALUES (448, false, '2025-03-21', 2025, 'Husband', 449, 202);
INSERT INTO public.dependant_data VALUES (449, false, '2025-03-21', 2025, 'Son', 450, 202);
INSERT INTO public.dependant_data VALUES (455, false, '2025-03-21', 2025, 'Husband', 456, 208);
INSERT INTO public.dependant_data VALUES (456, false, '2025-03-21', 2025, 'Son', 457, 208);
INSERT INTO public.dependant_data VALUES (457, false, '2025-03-21', 2025, 'Son', 458, 208);
INSERT INTO public.dependant_data VALUES (458, false, '2025-03-21', 2025, 'Son', 459, 208);
INSERT INTO public.dependant_data VALUES (466, false, '2025-03-21', 2025, 'Husband', 467, 214);
INSERT INTO public.dependant_data VALUES (476, false, '2025-03-21', 2025, 'Wife', 477, 220);
INSERT INTO public.dependant_data VALUES (477, false, '2025-03-21', 2025, 'Daughter', 478, 220);
INSERT INTO public.dependant_data VALUES (478, false, '2025-03-21', 2025, 'Son', 479, 220);
INSERT INTO public.dependant_data VALUES (487, false, '2025-03-21', 2025, 'Daughter', 488, 224);
INSERT INTO public.dependant_data VALUES (493, false, '2025-03-21', 2025, 'Son', 494, 224);
INSERT INTO public.dependant_data VALUES (497, false, '2025-03-21', 2025, 'Husband', 498, 224);
INSERT INTO public.dependant_data VALUES (500, false, '2025-03-21', 2025, 'Daughter', 501, 224);
INSERT INTO public.dependant_data VALUES (505, false, '2025-03-21', 2025, 'Wife', 506, 232);
INSERT INTO public.dependant_data VALUES (509, false, '2025-03-21', 2025, 'Son', 510, 235);
INSERT INTO public.dependant_data VALUES (511, false, '2025-03-21', 2025, 'Husband', 512, 235);
INSERT INTO public.dependant_data VALUES (513, false, '2025-03-21', 2025, 'Daughter', 514, 235);
INSERT INTO public.dependant_data VALUES (529, false, '2025-03-21', 2025, 'Son', 530, 246);
INSERT INTO public.dependant_data VALUES (532, false, '2025-03-21', 2025, 'Wife', 533, 246);
INSERT INTO public.dependant_data VALUES (540, false, '2025-03-21', 2025, 'Father', 541, 250);
INSERT INTO public.dependant_data VALUES (553, false, '2025-03-21', 2025, 'Daughter', 554, 254);
INSERT INTO public.dependant_data VALUES (554, false, '2025-03-21', 2025, 'Son', 555, 254);
INSERT INTO public.dependant_data VALUES (563, false, '2025-03-21', 2025, 'Wife', 564, 260);
INSERT INTO public.dependant_data VALUES (564, false, '2025-03-21', 2025, 'Son', 565, 260);
INSERT INTO public.dependant_data VALUES (577, false, '2025-03-21', 2025, 'Spouse', 578, 268);
INSERT INTO public.dependant_data VALUES (579, false, '2025-03-21', 2025, 'Son', 580, 268);
INSERT INTO public.dependant_data VALUES (581, false, '2025-03-21', 2025, 'Son', 582, 268);
INSERT INTO public.dependant_data VALUES (583, false, '2025-03-21', 2025, 'Daughter', 584, 272);
INSERT INTO public.dependant_data VALUES (584, false, '2025-03-21', 2025, 'Husband', 585, 272);
INSERT INTO public.dependant_data VALUES (595, false, '2025-03-21', 2025, 'Wife', 596, 278);
INSERT INTO public.dependant_data VALUES (597, false, '2025-03-21', 2025, 'Son', 598, 278);
INSERT INTO public.dependant_data VALUES (600, false, '2025-03-21', 2025, 'Son', 601, 278);
INSERT INTO public.dependant_data VALUES (623, false, '2025-03-21', 2025, 'Daughter', 625, 289);
INSERT INTO public.dependant_data VALUES (625, false, '2025-03-21', 2025, 'Husband', 626, 289);
INSERT INTO public.dependant_data VALUES (636, false, '2025-03-21', 2025, 'Spause', 638, 299);
INSERT INTO public.dependant_data VALUES (638, false, '2025-03-21', 2025, 'Daughter', 639, 299);
INSERT INTO public.dependant_data VALUES (664, false, '2025-03-21', 2025, 'Wife', 665, 310);
INSERT INTO public.dependant_data VALUES (665, false, '2025-03-21', 2025, 'Daughter', 666, 310);
INSERT INTO public.dependant_data VALUES (666, false, '2025-03-21', 2025, 'Daughter', 667, 310);
INSERT INTO public.dependant_data VALUES (667, false, '2025-03-21', 2025, 'Son', 668, 310);
INSERT INTO public.dependant_data VALUES (678, false, '2025-03-21', 2025, 'Wife', 679, 316);
INSERT INTO public.dependant_data VALUES (694, false, '2025-03-21', 2025, 'Husband', 695, 324);
INSERT INTO public.dependant_data VALUES (695, false, '2025-03-21', 2025, 'Son', 579, 324);
INSERT INTO public.dependant_data VALUES (696, false, '2025-03-21', 2025, 'Son', 696, 324);
INSERT INTO public.dependant_data VALUES (709, false, '2025-03-21', 2025, 'Son', 709, 329);
INSERT INTO public.dependant_data VALUES (710, false, '2025-03-21', 2025, 'Husband', 710, 329);
INSERT INTO public.dependant_data VALUES (728, false, '2025-03-21', 2025, 'Son', 728, 340);
INSERT INTO public.dependant_data VALUES (729, false, '2025-03-21', 2025, 'Husband', 729, 340);
INSERT INTO public.dependant_data VALUES (741, false, '2025-03-21', 2025, 'Son', 741, 346);
INSERT INTO public.dependant_data VALUES (743, false, '2025-03-21', 2025, 'Wife', 743, 346);
INSERT INTO public.dependant_data VALUES (757, false, '2025-03-21', 2025, 'Son', 757, 352);
INSERT INTO public.dependant_data VALUES (759, false, '2025-03-21', 2025, 'Daughter', 759, 352);
INSERT INTO public.dependant_data VALUES (761, false, '2025-03-21', 2025, 'Son', 761, 352);
INSERT INTO public.dependant_data VALUES (762, false, '2025-03-21', 2025, 'Wife', 762, 352);
INSERT INTO public.dependant_data VALUES (775, false, '2025-03-21', 2025, 'Wife', 775, 359);
INSERT INTO public.dependant_data VALUES (784, false, '2025-03-21', 2025, 'Husband', 784, 365);
INSERT INTO public.dependant_data VALUES (798, false, '2025-03-21', 2025, 'Son', 798, 371);
INSERT INTO public.dependant_data VALUES (800, false, '2025-03-21', 2025, 'Wife', 800, 371);
INSERT INTO public.dependant_data VALUES (802, false, '2025-03-21', 2025, 'Daughter', 802, 371);
INSERT INTO public.dependant_data VALUES (817, false, '2025-03-21', 2025, 'Spouse', 817, 378);
INSERT INTO public.dependant_data VALUES (818, false, '2025-03-21', 2025, 'Daughter', 818, 378);
INSERT INTO public.dependant_data VALUES (829, false, '2025-03-21', 2025, 'Wife', 829, 384);
INSERT INTO public.dependant_data VALUES (832, false, '2025-03-21', 2025, 'Son', 832, 384);
INSERT INTO public.dependant_data VALUES (833, false, '2025-03-21', 2025, 'Son', 834, 384);
INSERT INTO public.dependant_data VALUES (836, false, '2025-03-21', 2025, 'Son', 836, 384);
INSERT INTO public.dependant_data VALUES (838, false, '2025-03-21', 2025, 'Son', 838, 384);
INSERT INTO public.dependant_data VALUES (859, false, '2025-03-21', 2025, 'Husband', 860, 395);
INSERT INTO public.dependant_data VALUES (866, false, '2025-03-21', 2025, 'Daughter', 866, 400);
INSERT INTO public.dependant_data VALUES (867, false, '2025-03-21', 2025, 'Wife', 867, 400);
INSERT INTO public.dependant_data VALUES (877, false, '2025-03-21', 2025, 'Son', 877, 406);
INSERT INTO public.dependant_data VALUES (879, false, '2025-03-21', 2025, 'Son', 879, 406);
INSERT INTO public.dependant_data VALUES (881, false, '2025-03-21', 2025, 'Husband', 881, 406);
INSERT INTO public.dependant_data VALUES (898, false, '2025-03-21', 2025, 'Son', 897, 413);
INSERT INTO public.dependant_data VALUES (899, false, '2025-03-21', 2025, 'Husband', 899, 413);
INSERT INTO public.dependant_data VALUES (901, false, '2025-03-21', 2025, 'Son', 901, 413);
INSERT INTO public.dependant_data VALUES (902, false, '2025-03-21', 2025, 'Daughter', 902, 413);
INSERT INTO public.dependant_data VALUES (915, false, '2025-03-21', 2025, 'Wife', 916, 419);
INSERT INTO public.dependant_data VALUES (919, false, '2025-03-21', 2025, 'Son', 919, 419);
INSERT INTO public.dependant_data VALUES (923, false, '2025-03-21', 2025, 'Daughter', 923, 419);
INSERT INTO public.dependant_data VALUES (933, false, '2025-03-21', 2025, 'Wife', 933, 425);
INSERT INTO public.dependant_data VALUES (935, false, '2025-03-21', 2025, 'Daughter', 935, 425);
INSERT INTO public.dependant_data VALUES (937, false, '2025-03-21', 2025, 'Daughter', 937, 425);
INSERT INTO public.dependant_data VALUES (939, false, '2025-03-21', 2025, 'Daughter', 939, 425);
INSERT INTO public.dependant_data VALUES (426, false, '2025-03-21', 2025, 'Wife', 427, 191);
INSERT INTO public.dependant_data VALUES (440, false, '2025-03-21', 2025, 'Huband', 441, 197);
INSERT INTO public.dependant_data VALUES (467, false, '2025-03-21', 2025, 'Husband', 468, 215);
INSERT INTO public.dependant_data VALUES (468, false, '2025-03-21', 2025, 'Daughter', 469, 215);
INSERT INTO public.dependant_data VALUES (469, false, '2025-03-21', 2025, 'Son', 470, 215);
INSERT INTO public.dependant_data VALUES (481, false, '2025-03-21', 2025, 'Husband', 482, 222);
INSERT INTO public.dependant_data VALUES (483, false, '2025-03-21', 2025, 'Son', 483, 222);
INSERT INTO public.dependant_data VALUES (492, false, '2025-03-21', 2025, 'Daughter', 491, 227);
INSERT INTO public.dependant_data VALUES (496, false, '2025-03-21', 2025, 'Husband', 495, 227);
INSERT INTO public.dependant_data VALUES (498, false, '2025-03-21', 2025, 'Daughter', 499, 227);
INSERT INTO public.dependant_data VALUES (507, false, '2025-03-21', 2025, 'Husband', 508, 233);
INSERT INTO public.dependant_data VALUES (519, false, '2025-03-21', 2025, 'Daughter', 520, 239);
INSERT INTO public.dependant_data VALUES (520, false, '2025-03-21', 2025, 'Daughter', 521, 239);
INSERT INTO public.dependant_data VALUES (528, false, '2025-03-21', 2025, 'Daughter', 528, 244);
INSERT INTO public.dependant_data VALUES (531, false, '2025-03-21', 2025, 'Son', 531, 244);
INSERT INTO public.dependant_data VALUES (533, false, '2025-03-21', 2025, 'Wife', 534, 244);
INSERT INTO public.dependant_data VALUES (549, false, '2025-03-21', 2025, 'Wife', 550, 253);
INSERT INTO public.dependant_data VALUES (551, false, '2025-03-21', 2025, 'Son', 552, 253);
INSERT INTO public.dependant_data VALUES (560, false, '2025-03-21', 2025, 'Husband', 561, 258);
INSERT INTO public.dependant_data VALUES (561, false, '2025-03-21', 2025, 'Daughter', 562, 258);
INSERT INTO public.dependant_data VALUES (573, false, '2025-03-21', 2025, 'Wife', 573, 263);
INSERT INTO public.dependant_data VALUES (574, false, '2025-03-21', 2025, 'Son', 576, 263);
INSERT INTO public.dependant_data VALUES (593, false, '2025-03-21', 2025, 'Spouse', 594, 277);
INSERT INTO public.dependant_data VALUES (594, false, '2025-03-21', 2025, 'Daughter', 595, 277);
INSERT INTO public.dependant_data VALUES (596, false, '2025-03-21', 2025, 'Son', 597, 277);
INSERT INTO public.dependant_data VALUES (598, false, '2025-03-21', 2025, 'Son', 600, 277);
INSERT INTO public.dependant_data VALUES (610, false, '2025-03-21', 2025, 'Wife', 611, 283);
INSERT INTO public.dependant_data VALUES (612, false, '2025-03-21', 2025, 'Daughter', 613, 283);
INSERT INTO public.dependant_data VALUES (614, false, '2025-03-21', 2025, 'Son', 615, 283);
INSERT INTO public.dependant_data VALUES (621, false, '2025-03-21', 2025, 'Husband', 622, 288);
INSERT INTO public.dependant_data VALUES (624, false, '2025-03-21', 2025, 'Daughter', 624, 288);
INSERT INTO public.dependant_data VALUES (635, false, '2025-03-21', 2025, 'Wife', 636, 297);
INSERT INTO public.dependant_data VALUES (637, false, '2025-03-21', 2025, 'Wife', 637, 298);
INSERT INTO public.dependant_data VALUES (649, false, '2025-03-21', 2025, 'Son', 650, 304);
INSERT INTO public.dependant_data VALUES (650, false, '2025-03-21', 2025, 'Son', 651, 304);
INSERT INTO public.dependant_data VALUES (651, false, '2025-03-21', 2025, 'Wife', 652, 304);
INSERT INTO public.dependant_data VALUES (669, false, '2025-03-21', 2025, 'Son', 669, 312);
INSERT INTO public.dependant_data VALUES (671, false, '2025-03-21', 2025, 'Daughter', 672, 312);
INSERT INTO public.dependant_data VALUES (672, false, '2025-03-21', 2025, 'Wife', 673, 312);
INSERT INTO public.dependant_data VALUES (674, false, '2025-03-21', 2025, 'Son', 675, 312);
INSERT INTO public.dependant_data VALUES (680, false, '2025-03-21', 2025, 'Father', 681, 318);
INSERT INTO public.dependant_data VALUES (691, false, '2025-03-21', 2025, 'Daughter', 692, 323);
INSERT INTO public.dependant_data VALUES (692, false, '2025-03-21', 2025, 'Daughter', 693, 323);
INSERT INTO public.dependant_data VALUES (693, false, '2025-03-21', 2025, 'Wife', 694, 323);
INSERT INTO public.dependant_data VALUES (711, false, '2025-03-21', 2025, 'Son', 711, 330);
INSERT INTO public.dependant_data VALUES (712, false, '2025-03-21', 2025, 'Daughter', 712, 330);
INSERT INTO public.dependant_data VALUES (713, false, '2025-03-21', 2025, 'Husband', 713, 330);
INSERT INTO public.dependant_data VALUES (714, false, '2025-03-21', 2025, 'Daughter', 714, 330);
INSERT INTO public.dependant_data VALUES (724, false, '2025-03-21', 2025, 'Spouse', 724, 338);
INSERT INTO public.dependant_data VALUES (730, false, '2025-03-21', 2025, 'Son', 730, 342);
INSERT INTO public.dependant_data VALUES (731, false, '2025-03-21', 2025, 'Spouse', 731, 342);
INSERT INTO public.dependant_data VALUES (750, false, '2025-03-21', 2025, 'Wife', 750, 349);
INSERT INTO public.dependant_data VALUES (751, false, '2025-03-21', 2025, 'Daughter', 751, 349);
INSERT INTO public.dependant_data VALUES (752, false, '2025-03-21', 2025, 'Son', 752, 349);
INSERT INTO public.dependant_data VALUES (753, false, '2025-03-21', 2025, 'Son', 753, 349);
INSERT INTO public.dependant_data VALUES (768, false, '2025-03-21', 2025, 'Wife', 768, 355);
INSERT INTO public.dependant_data VALUES (769, false, '2025-03-21', 2025, 'Daughter', 769, 355);
INSERT INTO public.dependant_data VALUES (776, false, '2025-03-21', 2025, 'daughter', 776, 361);
INSERT INTO public.dependant_data VALUES (777, false, '2025-03-21', 2025, 'Wife', 777, 361);
INSERT INTO public.dependant_data VALUES (778, false, '2025-03-21', 2025, 'Son', 778, 361);
INSERT INTO public.dependant_data VALUES (786, false, '2025-03-21', 2025, 'Son', 786, 367);
INSERT INTO public.dependant_data VALUES (789, false, '2025-03-21', 2025, 'Wife', 789, 367);
INSERT INTO public.dependant_data VALUES (793, false, '2025-03-21', 2025, 'Daughter', 792, 367);
INSERT INTO public.dependant_data VALUES (801, false, '2025-03-21', 2025, 'Wife', 801, 373);
INSERT INTO public.dependant_data VALUES (819, false, '2025-03-21', 2025, 'Son', 819, 379);
INSERT INTO public.dependant_data VALUES (821, false, '2025-03-21', 2025, 'Husband', 821, 379);
INSERT INTO public.dependant_data VALUES (823, false, '2025-03-21', 2025, 'Son', 823, 379);
INSERT INTO public.dependant_data VALUES (841, false, '2025-03-21', 2025, 'Wife', 841, 387);
INSERT INTO public.dependant_data VALUES (843, false, '2025-03-21', 2025, 'Daughter', 843, 387);
INSERT INTO public.dependant_data VALUES (845, false, '2025-03-21', 2025, 'Son', 845, 387);
INSERT INTO public.dependant_data VALUES (846, false, '2025-03-21', 2025, 'Daughter', 846, 387);
INSERT INTO public.dependant_data VALUES (855, false, '2025-03-21', 2025, 'Husband', 855, 393);
INSERT INTO public.dependant_data VALUES (856, false, '2025-03-21', 2025, 'Daughter', 856, 393);
INSERT INTO public.dependant_data VALUES (864, false, '2025-03-21', 2025, 'Daughter', 864, 398);
INSERT INTO public.dependant_data VALUES (865, false, '2025-03-21', 2025, 'Spouse', 865, 398);
INSERT INTO public.dependant_data VALUES (871, false, '2025-03-21', 2025, 'Daughter', 871, 404);
INSERT INTO public.dependant_data VALUES (872, false, '2025-03-21', 2025, 'Son', 872, 404);
INSERT INTO public.dependant_data VALUES (873, false, '2025-03-21', 2025, 'Husband', 873, 404);
INSERT INTO public.dependant_data VALUES (888, false, '2025-03-21', 2025, 'Daughter', 888, 409);
INSERT INTO public.dependant_data VALUES (889, false, '2025-03-21', 2025, 'Husband', 889, 409);
INSERT INTO public.dependant_data VALUES (890, false, '2025-03-21', 2025, 'Daughter', 890, 409);
INSERT INTO public.dependant_data VALUES (909, false, '2025-03-21', 2025, 'Spouse', 909, 417);
INSERT INTO public.dependant_data VALUES (912, false, '2025-03-21', 2025, 'Daughter', 912, 417);
INSERT INTO public.dependant_data VALUES (913, false, '2025-03-21', 2025, 'Son', 913, 417);
INSERT INTO public.dependant_data VALUES (927, false, '2025-03-21', 2025, 'Wife', 927, 423);
INSERT INTO public.dependant_data VALUES (929, false, '2025-03-21', 2025, 'Son', 929, 423);
INSERT INTO public.dependant_data VALUES (931, false, '2025-03-21', 2025, 'Daughter', 931, 423);
INSERT INTO public.dependant_data VALUES (942, false, '2025-03-21', 2025, 'Daughter', 942, 428);
INSERT INTO public.dependant_data VALUES (943, false, '2025-03-21', 2025, 'Husband', 943, 428);
INSERT INTO public.dependant_data VALUES (944, false, '2025-03-21', 2025, 'Daughter', 944, 428);
INSERT INTO public.dependant_data VALUES (428, false, '2025-03-21', 2025, 'Daughter', 429, 192);
INSERT INTO public.dependant_data VALUES (431, false, '2025-03-21', 2025, 'Son', 432, 192);
INSERT INTO public.dependant_data VALUES (442, false, '2025-03-21', 2025, 'Son', 443, 198);
INSERT INTO public.dependant_data VALUES (464, false, '2025-03-21', 2025, 'Husband', 465, 212);
INSERT INTO public.dependant_data VALUES (465, false, '2025-03-21', 2025, 'Son', 466, 212);
INSERT INTO public.dependant_data VALUES (471, false, '2025-03-21', 2025, 'Mother', 472, 218);
INSERT INTO public.dependant_data VALUES (489, false, '2025-03-21', 2025, 'Son', 489, 226);
INSERT INTO public.dependant_data VALUES (491, false, '2025-03-21', 2025, 'Wife', 493, 226);
INSERT INTO public.dependant_data VALUES (495, false, '2025-03-21', 2025, 'Daughter', 497, 226);
INSERT INTO public.dependant_data VALUES (515, false, '2025-03-21', 2025, 'Husband', 515, 237);
INSERT INTO public.dependant_data VALUES (517, false, '2025-03-21', 2025, 'Daughter', 518, 237);
INSERT INTO public.dependant_data VALUES (518, false, '2025-03-21', 2025, 'Son', 519, 237);
INSERT INTO public.dependant_data VALUES (527, false, '2025-03-21', 2025, 'Mother', 529, 245);
INSERT INTO public.dependant_data VALUES (530, false, '2025-03-21', 2025, 'Father', 532, 245);
INSERT INTO public.dependant_data VALUES (545, false, '2025-03-21', 2025, 'Wife', 546, 251);
INSERT INTO public.dependant_data VALUES (546, false, '2025-03-21', 2025, 'Son', 547, 251);
INSERT INTO public.dependant_data VALUES (547, false, '2025-03-21', 2025, 'Daughter', 548, 251);
INSERT INTO public.dependant_data VALUES (557, false, '2025-03-21', 2025, 'Daughter', 558, 257);
INSERT INTO public.dependant_data VALUES (558, false, '2025-03-21', 2025, 'Wife', 559, 257);
INSERT INTO public.dependant_data VALUES (559, false, '2025-03-21', 2025, 'Daughter', 560, 257);
INSERT INTO public.dependant_data VALUES (568, false, '2025-03-21', 2025, 'Son', 569, 262);
INSERT INTO public.dependant_data VALUES (569, false, '2025-03-21', 2025, 'Son', 570, 262);
INSERT INTO public.dependant_data VALUES (571, false, '2025-03-21', 2025, 'Husband', 572, 262);
INSERT INTO public.dependant_data VALUES (578, false, '2025-03-21', 2025, 'Son', 579, 267);
INSERT INTO public.dependant_data VALUES (580, false, '2025-03-21', 2025, 'Son', 581, 267);
INSERT INTO public.dependant_data VALUES (582, false, '2025-03-21', 2025, 'Wfe', 583, 267);
INSERT INTO public.dependant_data VALUES (588, false, '2025-03-21', 2025, 'Husband', 589, 275);
INSERT INTO public.dependant_data VALUES (589, false, '2025-03-21', 2025, 'Daughter', 590, 275);
INSERT INTO public.dependant_data VALUES (591, false, '2025-03-21', 2025, 'Daughter', 593, 275);
INSERT INTO public.dependant_data VALUES (605, false, '2025-03-21', 2025, 'Son', 606, 281);
INSERT INTO public.dependant_data VALUES (606, false, '2025-03-21', 2025, 'Son', 607, 281);
INSERT INTO public.dependant_data VALUES (608, false, '2025-03-21', 2025, 'Wife', 609, 281);
INSERT INTO public.dependant_data VALUES (629, false, '2025-03-21', 2025, 'Daughter', 630, 294);
INSERT INTO public.dependant_data VALUES (632, false, '2025-03-21', 2025, 'Wife', 633, 294);
INSERT INTO public.dependant_data VALUES (647, false, '2025-03-21', 2025, 'Son', 648, 303);
INSERT INTO public.dependant_data VALUES (648, false, '2025-03-21', 2025, 'Wife', 649, 303);
INSERT INTO public.dependant_data VALUES (662, false, '2025-03-21', 2025, 'Wife', 663, 309);
INSERT INTO public.dependant_data VALUES (663, false, '2025-03-21', 2025, 'Son', 664, 309);
INSERT INTO public.dependant_data VALUES (675, false, '2025-03-21', 2025, 'Wife', 676, 314);
INSERT INTO public.dependant_data VALUES (684, false, '2025-03-21', 2025, 'Father', 685, 320);
INSERT INTO public.dependant_data VALUES (699, false, '2025-03-21', 2025, 'Son', 699, 327);
INSERT INTO public.dependant_data VALUES (700, false, '2025-03-21', 2025, 'Wife', 701, 327);
INSERT INTO public.dependant_data VALUES (703, false, '2025-03-21', 2025, 'Son', 702, 327);
INSERT INTO public.dependant_data VALUES (715, false, '2025-03-21', 2025, 'Wife', 715, 331);
INSERT INTO public.dependant_data VALUES (716, false, '2025-03-21', 2025, 'Daughter', 716, 331);
INSERT INTO public.dependant_data VALUES (717, false, '2025-03-21', 2025, 'Daughter', 717, 331);
INSERT INTO public.dependant_data VALUES (722, false, '2025-03-21', 2025, 'Daughter', 722, 337);
INSERT INTO public.dependant_data VALUES (725, false, '2025-03-21', 2025, 'Wife', 725, 337);
INSERT INTO public.dependant_data VALUES (726, false, '2025-03-21', 2025, 'Son', 726, 337);
INSERT INTO public.dependant_data VALUES (732, false, '2025-03-21', 2025, 'Daughter', 732, 343);
INSERT INTO public.dependant_data VALUES (733, false, '2025-03-21', 2025, 'Wife', 734, 343);
INSERT INTO public.dependant_data VALUES (735, false, '2025-03-21', 2025, 'Daughter', 735, 343);
INSERT INTO public.dependant_data VALUES (748, false, '2025-03-21', 2025, 'Son', 748, 348);
INSERT INTO public.dependant_data VALUES (749, false, '2025-03-21', 2025, 'Wife', 749, 348);
INSERT INTO public.dependant_data VALUES (763, false, '2025-03-21', 2025, 'Daughter', 763, 354);
INSERT INTO public.dependant_data VALUES (764, false, '2025-03-21', 2025, 'Husband', 764, 354);
INSERT INTO public.dependant_data VALUES (765, false, '2025-03-21', 2025, 'Daughter', 765, 354);
INSERT INTO public.dependant_data VALUES (766, false, '2025-03-21', 2025, 'Son', 766, 354);
INSERT INTO public.dependant_data VALUES (767, false, '2025-03-21', 2025, 'Daughter', 767, 354);
INSERT INTO public.dependant_data VALUES (790, false, '2025-03-21', 2025, 'Daughter', 788, 369);
INSERT INTO public.dependant_data VALUES (792, false, '2025-03-21', 2025, 'Daughter', 793, 369);
INSERT INTO public.dependant_data VALUES (795, false, '2025-03-21', 2025, 'Husband', 795, 369);
INSERT INTO public.dependant_data VALUES (804, false, '2025-03-21', 2025, 'Wife', 804, 374);
INSERT INTO public.dependant_data VALUES (808, false, '2025-03-21', 2025, 'Son', 807, 374);
INSERT INTO public.dependant_data VALUES (811, false, '2025-03-21', 2025, 'Daughter', 811, 374);
INSERT INTO public.dependant_data VALUES (824, false, '2025-03-21', 2025, 'Daughter', 824, 381);
INSERT INTO public.dependant_data VALUES (825, false, '2025-03-21', 2025, 'Daughter', 825, 381);
INSERT INTO public.dependant_data VALUES (826, false, '2025-03-21', 2025, 'Husband', 826, 381);
INSERT INTO public.dependant_data VALUES (840, false, '2025-03-21', 2025, 'Husband', 840, 385);
INSERT INTO public.dependant_data VALUES (852, false, '2025-03-21', 2025, 'Wife', 852, 391);
INSERT INTO public.dependant_data VALUES (863, false, '2025-03-21', 2025, 'Husband', 863, 397);
INSERT INTO public.dependant_data VALUES (874, false, '2025-03-21', 2025, 'Wife', 874, 405);
INSERT INTO public.dependant_data VALUES (875, false, '2025-03-21', 2025, 'Daughter', 875, 405);
INSERT INTO public.dependant_data VALUES (876, false, '2025-03-21', 2025, 'Daughter', 876, 405);
INSERT INTO public.dependant_data VALUES (891, false, '2025-03-21', 2025, 'Daughter', 891, 410);
INSERT INTO public.dependant_data VALUES (892, false, '2025-03-21', 2025, 'Husband', 892, 410);
INSERT INTO public.dependant_data VALUES (893, false, '2025-03-21', 2025, 'Son', 893, 410);
INSERT INTO public.dependant_data VALUES (906, false, '2025-03-21', 2025, 'Daughter', 906, 415);
INSERT INTO public.dependant_data VALUES (907, false, '2025-03-21', 2025, 'Son', 907, 415);
INSERT INTO public.dependant_data VALUES (910, false, '2025-03-21', 2025, 'Husband', 911, 415);
INSERT INTO public.dependant_data VALUES (914, false, '2025-03-21', 2025, 'Son', 914, 418);
INSERT INTO public.dependant_data VALUES (918, false, '2025-03-21', 2025, 'Daughter', 918, 418);
INSERT INTO public.dependant_data VALUES (921, false, '2025-03-21', 2025, 'Wife', 921, 418);
INSERT INTO public.dependant_data VALUES (924, false, '2025-03-21', 2025, 'Son', 924, 418);
INSERT INTO public.dependant_data VALUES (940, false, '2025-03-21', 2025, 'Husband', 940, 427);
INSERT INTO public.dependant_data VALUES (941, false, '2025-03-21', 2025, 'Daughter', 941, 427);
INSERT INTO public.dependant_data VALUES (433, false, '2025-03-21', 2025, 'Wife', 434, 194);
INSERT INTO public.dependant_data VALUES (434, false, '2025-03-21', 2025, 'Son', 435, 194);
INSERT INTO public.dependant_data VALUES (445, false, '2025-03-21', 2025, 'Husband', 446, 200);
INSERT INTO public.dependant_data VALUES (450, false, '2025-03-21', 2025, 'Son', 451, 205);
INSERT INTO public.dependant_data VALUES (452, false, '2025-03-21', 2025, 'Husband', 453, 205);
INSERT INTO public.dependant_data VALUES (459, false, '2025-03-21', 2025, 'Daughter', 460, 211);
INSERT INTO public.dependant_data VALUES (461, false, '2025-03-21', 2025, 'Husband', 462, 211);
INSERT INTO public.dependant_data VALUES (484, false, '2025-03-21', 2025, 'Son', 485, 223);
INSERT INTO public.dependant_data VALUES (485, false, '2025-03-21', 2025, 'Husband', 486, 223);
INSERT INTO public.dependant_data VALUES (486, false, '2025-03-21', 2025, 'Daughter', 487, 223);
INSERT INTO public.dependant_data VALUES (504, false, '2025-03-21', 2025, 'Husband', 505, 231);
INSERT INTO public.dependant_data VALUES (506, false, '2025-03-21', 2025, 'Daughter', 507, 231);
INSERT INTO public.dependant_data VALUES (514, false, '2025-03-21', 2025, 'Father', 516, 238);
INSERT INTO public.dependant_data VALUES (516, false, '2025-03-21', 2025, 'Mother', 517, 238);
INSERT INTO public.dependant_data VALUES (525, false, '2025-03-21', 2025, 'Husband', 526, 243);
INSERT INTO public.dependant_data VALUES (526, false, '2025-03-21', 2025, 'Son', 527, 243);
INSERT INTO public.dependant_data VALUES (537, false, '2025-03-21', 2025, 'Son', 539, 249);
INSERT INTO public.dependant_data VALUES (542, false, '2025-03-21', 2025, 'Son', 543, 249);
INSERT INTO public.dependant_data VALUES (543, false, '2025-03-21', 2025, 'Son', 544, 249);
INSERT INTO public.dependant_data VALUES (544, false, '2025-03-21', 2025, 'Wife', 545, 249);
INSERT INTO public.dependant_data VALUES (565, false, '2025-03-21', 2025, 'Daughter', 566, 261);
INSERT INTO public.dependant_data VALUES (566, false, '2025-03-21', 2025, 'Daughter', 567, 261);
INSERT INTO public.dependant_data VALUES (567, false, '2025-03-21', 2025, 'Spouse', 568, 261);
INSERT INTO public.dependant_data VALUES (585, false, '2025-03-21', 2025, 'Mother', 586, 273);
INSERT INTO public.dependant_data VALUES (587, false, '2025-03-21', 2025, 'Father', 588, 273);
INSERT INTO public.dependant_data VALUES (602, false, '2025-03-21', 2025, 'Son', 603, 280);
INSERT INTO public.dependant_data VALUES (603, false, '2025-03-21', 2025, 'Son', 604, 280);
INSERT INTO public.dependant_data VALUES (604, false, '2025-03-21', 2025, 'Wife', 605, 280);
INSERT INTO public.dependant_data VALUES (620, false, '2025-03-21', 2025, 'Daughter', 621, 287);
INSERT INTO public.dependant_data VALUES (622, false, '2025-03-21', 2025, 'Husband', 623, 287);
INSERT INTO public.dependant_data VALUES (627, false, '2025-03-21', 2025, 'Husband', 628, 292);
INSERT INTO public.dependant_data VALUES (645, false, '2025-03-21', 2025, 'Daughter', 646, 302);
INSERT INTO public.dependant_data VALUES (646, false, '2025-03-21', 2025, 'Wife', 647, 302);
INSERT INTO public.dependant_data VALUES (658, false, '2025-03-21', 2025, 'Daughter', 659, 308);
INSERT INTO public.dependant_data VALUES (659, false, '2025-03-21', 2025, 'Son', 660, 308);
INSERT INTO public.dependant_data VALUES (660, false, '2025-03-21', 2025, 'Son', 661, 308);
INSERT INTO public.dependant_data VALUES (661, false, '2025-03-21', 2025, 'Wife', 662, 308);
INSERT INTO public.dependant_data VALUES (676, false, '2025-03-21', 2025, 'Wife', 677, 315);
INSERT INTO public.dependant_data VALUES (677, false, '2025-03-21', 2025, 'Daughter', 678, 315);
INSERT INTO public.dependant_data VALUES (685, false, '2025-03-21', 2025, 'Wife', 686, 321);
INSERT INTO public.dependant_data VALUES (686, false, '2025-03-21', 2025, 'Daughter', 687, 321);
INSERT INTO public.dependant_data VALUES (697, false, '2025-03-21', 2025, 'Spouse', 697, 325);
INSERT INTO public.dependant_data VALUES (721, false, '2025-03-21', 2025, 'Father', 721, 336);
INSERT INTO public.dependant_data VALUES (723, false, '2025-03-21', 2025, 'Mother', 723, 336);
INSERT INTO public.dependant_data VALUES (734, false, '2025-03-21', 2025, 'Wife', 733, 344);
INSERT INTO public.dependant_data VALUES (736, false, '2025-03-21', 2025, 'Daughter', 736, 344);
INSERT INTO public.dependant_data VALUES (737, false, '2025-03-21', 2025, 'Son', 737, 344);
INSERT INTO public.dependant_data VALUES (754, false, '2025-03-21', 2025, 'Mother', 754, 350);
INSERT INTO public.dependant_data VALUES (755, false, '2025-03-21', 2025, 'Father', 755, 350);
INSERT INTO public.dependant_data VALUES (771, false, '2025-03-21', 2025, 'Son', 771, 357);
INSERT INTO public.dependant_data VALUES (773, false, '2025-03-21', 2025, 'Wife', 773, 357);
INSERT INTO public.dependant_data VALUES (781, false, '2025-03-21', 2025, 'Husband', 781, 363);
INSERT INTO public.dependant_data VALUES (785, false, '2025-03-21', 2025, 'Husband', 785, 366);
INSERT INTO public.dependant_data VALUES (788, false, '2025-03-21', 2025, 'Son', 790, 366);
INSERT INTO public.dependant_data VALUES (799, false, '2025-03-21', 2025, 'Wife', 799, 372);
INSERT INTO public.dependant_data VALUES (805, false, '2025-03-21', 2025, 'Daughter', 805, 376);
INSERT INTO public.dependant_data VALUES (809, false, '2025-03-21', 2025, 'Son', 809, 376);
INSERT INTO public.dependant_data VALUES (813, false, '2025-03-21', 2025, 'Son', 813, 376);
INSERT INTO public.dependant_data VALUES (815, false, '2025-03-21', 2025, 'Wife', 815, 376);
INSERT INTO public.dependant_data VALUES (827, false, '2025-03-21', 2025, 'Son', 827, 382);
INSERT INTO public.dependant_data VALUES (831, false, '2025-03-21', 2025, 'Son', 831, 382);
INSERT INTO public.dependant_data VALUES (834, false, '2025-03-21', 2025, 'Husband', 833, 382);
INSERT INTO public.dependant_data VALUES (847, false, '2025-03-21', 2025, 'Spouse', 847, 389);
INSERT INTO public.dependant_data VALUES (848, false, '2025-03-21', 2025, 'Daughter', 848, 389);
INSERT INTO public.dependant_data VALUES (861, false, '2025-03-21', 2025, 'Husband', 861, 396);
INSERT INTO public.dependant_data VALUES (862, false, '2025-03-21', 2025, 'Son', 862, 396);
INSERT INTO public.dependant_data VALUES (884, false, '2025-03-21', 2025, 'Daughter', 884, 408);
INSERT INTO public.dependant_data VALUES (885, false, '2025-03-21', 2025, 'Wife', 885, 408);
INSERT INTO public.dependant_data VALUES (886, false, '2025-03-21', 2025, 'Son', 886, 408);
INSERT INTO public.dependant_data VALUES (887, false, '2025-03-21', 2025, 'Son', 887, 408);
INSERT INTO public.dependant_data VALUES (903, false, '2025-03-21', 2025, 'Husband', 903, 414);
INSERT INTO public.dependant_data VALUES (904, false, '2025-03-21', 2025, 'Son', 904, 414);
INSERT INTO public.dependant_data VALUES (905, false, '2025-03-21', 2025, 'Daughter', 905, 414);
INSERT INTO public.dependant_data VALUES (916, false, '2025-03-21', 2025, 'Spouse', 915, 420);
INSERT INTO public.dependant_data VALUES (920, false, '2025-03-21', 2025, 'Son', 920, 420);
INSERT INTO public.dependant_data VALUES (922, false, '2025-03-21', 2025, 'Son', 922, 420);
INSERT INTO public.dependant_data VALUES (925, false, '2025-03-21', 2025, 'Daughter', 925, 420);
INSERT INTO public.dependant_data VALUES (932, false, '2025-03-21', 2025, 'Husband', 932, 424);
INSERT INTO public.dependant_data VALUES (951, false, '2025-03-21', 2025, 'Daughter', 951, 430);
INSERT INTO public.dependant_data VALUES (952, false, '2025-03-21', 2025, 'Husband', 952, 430);
INSERT INTO public.dependant_data VALUES (953, false, '2025-03-21', 2025, 'Husband', 953, 431);
INSERT INTO public.dependant_data VALUES (954, false, '2025-03-21', 2025, 'Wife', 954, 432);
INSERT INTO public.dependant_data VALUES (955, false, '2025-03-21', 2025, 'Daughter', 956, 431);
INSERT INTO public.dependant_data VALUES (956, false, '2025-03-21', 2025, 'Daughter', 955, 432);
INSERT INTO public.dependant_data VALUES (957, false, '2025-03-21', 2025, 'Son', 957, 433);
INSERT INTO public.dependant_data VALUES (958, false, '2025-03-21', 2025, 'Son', 958, 433);
INSERT INTO public.dependant_data VALUES (959, false, '2025-03-21', 2025, 'Husband', 959, 433);
INSERT INTO public.dependant_data VALUES (960, false, '2025-03-21', 2025, 'Daughter', 960, 433);
INSERT INTO public.dependant_data VALUES (961, false, '2025-03-21', 2025, 'Daughter', 961, 434);
INSERT INTO public.dependant_data VALUES (962, false, '2025-03-21', 2025, 'Wife', 962, 434);
INSERT INTO public.dependant_data VALUES (963, false, '2025-03-21', 2025, 'Wife', 963, 435);
INSERT INTO public.dependant_data VALUES (964, false, '2025-03-21', 2025, 'Son', 964, 435);
INSERT INTO public.dependant_data VALUES (965, false, '2025-03-21', 2025, 'Daughter', 965, 435);
INSERT INTO public.dependant_data VALUES (966, false, '2025-03-21', 2025, 'Wife', 966, 436);
INSERT INTO public.dependant_data VALUES (967, false, '2025-03-21', 2025, 'Wife', 967, 437);
INSERT INTO public.dependant_data VALUES (968, false, '2025-03-21', 2025, 'Daughter', 968, 437);
INSERT INTO public.dependant_data VALUES (969, false, '2025-03-21', 2025, 'Wife', 969, 438);
INSERT INTO public.dependant_data VALUES (970, false, '2025-03-21', 2025, 'Daughter', 970, 437);
INSERT INTO public.dependant_data VALUES (971, false, '2025-03-21', 2025, 'Daughter', 971, 438);
INSERT INTO public.dependant_data VALUES (972, false, '2025-03-21', 2025, 'Daughter', 972, 439);
INSERT INTO public.dependant_data VALUES (973, false, '2025-03-21', 2025, 'Wife', 973, 439);
INSERT INTO public.dependant_data VALUES (974, false, '2025-03-21', 2025, 'Son', 974, 439);
INSERT INTO public.dependant_data VALUES (975, false, '2025-03-21', 2025, 'Wife', 975, 440);
INSERT INTO public.dependant_data VALUES (976, false, '2025-03-21', 2025, 'Daughter', 976, 440);
INSERT INTO public.dependant_data VALUES (977, false, '2025-03-21', 2025, 'Son', 977, 440);
INSERT INTO public.dependant_data VALUES (978, false, '2025-03-21', 2025, 'Wife', 978, 441);
INSERT INTO public.dependant_data VALUES (979, false, '2025-03-21', 2025, 'Daughter', 979, 441);
INSERT INTO public.dependant_data VALUES (980, false, '2025-03-21', 2025, 'Daughter', 980, 441);
INSERT INTO public.dependant_data VALUES (981, false, '2025-03-21', 2025, 'Wife', 981, 442);
INSERT INTO public.dependant_data VALUES (982, false, '2025-03-21', 2025, 'Son', 982, 442);
INSERT INTO public.dependant_data VALUES (983, false, '2025-03-21', 2025, 'Son', 984, 443);
INSERT INTO public.dependant_data VALUES (984, false, '2025-03-21', 2025, 'Wife', 983, 444);
INSERT INTO public.dependant_data VALUES (986, false, '2025-03-21', 2025, 'Son', 986, 444);
INSERT INTO public.dependant_data VALUES (985, false, '2025-03-21', 2025, 'Wife', 985, 443);
INSERT INTO public.dependant_data VALUES (987, false, '2025-03-21', 2025, 'Daughter', 987, 444);
INSERT INTO public.dependant_data VALUES (988, false, '2025-03-21', 2025, 'Son', 988, 444);
INSERT INTO public.dependant_data VALUES (989, false, '2025-03-21', 2025, 'Wife', 989, 445);
INSERT INTO public.dependant_data VALUES (990, false, '2025-03-21', 2025, 'Daughter', 990, 445);
INSERT INTO public.dependant_data VALUES (991, false, '2025-03-21', 2025, 'Son', 991, 445);
INSERT INTO public.dependant_data VALUES (992, false, '2025-03-21', 2025, 'Wife', 992, 447);
INSERT INTO public.dependant_data VALUES (993, false, '2025-03-21', 2025, 'Daughter', 993, 447);
INSERT INTO public.dependant_data VALUES (994, false, '2025-03-21', 2025, 'Daughter', 994, 448);
INSERT INTO public.dependant_data VALUES (995, false, '2025-03-21', 2025, 'Wife', 995, 448);
INSERT INTO public.dependant_data VALUES (996, false, '2025-03-21', 2025, 'Daughter', 996, 448);
INSERT INTO public.dependant_data VALUES (997, false, '2025-03-21', 2025, 'Daughter', 997, 449);
INSERT INTO public.dependant_data VALUES (998, false, '2025-03-21', 2025, 'Son', 998, 450);
INSERT INTO public.dependant_data VALUES (999, false, '2025-03-21', 2025, 'Wife', 999, 449);
INSERT INTO public.dependant_data VALUES (1000, false, '2025-03-21', 2025, 'Wife', 1000, 450);
INSERT INTO public.dependant_data VALUES (1001, false, '2025-03-21', 2025, 'Son', 1001, 449);
INSERT INTO public.dependant_data VALUES (1002, false, '2025-03-21', 2025, 'Daughter', 1002, 450);
INSERT INTO public.dependant_data VALUES (1003, false, '2025-03-21', 2025, 'Son', 1003, 451);
INSERT INTO public.dependant_data VALUES (1004, false, '2025-03-21', 2025, 'Daughter', 1004, 452);
INSERT INTO public.dependant_data VALUES (1005, false, '2025-03-21', 2025, 'Son', 1005, 452);
INSERT INTO public.dependant_data VALUES (1006, false, '2025-03-21', 2025, 'Wife', 1006, 452);
INSERT INTO public.dependant_data VALUES (1017, false, '2025-03-21', 2025, 'Daughter', 1017, 457);
INSERT INTO public.dependant_data VALUES (1018, false, '2025-03-21', 2025, 'Wife', 1018, 457);
INSERT INTO public.dependant_data VALUES (1037, false, '2025-03-21', 2025, 'Mother', 1037, 465);
INSERT INTO public.dependant_data VALUES (1038, false, '2025-03-21', 2025, 'Father', 1038, 465);
INSERT INTO public.dependant_data VALUES (1055, false, '2025-03-21', 2025, 'Son', 1055, 471);
INSERT INTO public.dependant_data VALUES (1064, false, '2025-03-21', 2025, 'Mother', 1064, 476);
INSERT INTO public.dependant_data VALUES (1066, false, '2025-03-21', 2025, 'Father', 1066, 476);
INSERT INTO public.dependant_data VALUES (1077, false, '2025-03-21', 2025, 'Wife', 1077, 483);
INSERT INTO public.dependant_data VALUES (1080, false, '2025-03-21', 2025, 'Daughter', 1080, 483);
INSERT INTO public.dependant_data VALUES (1090, false, '2025-03-21', 2025, 'Spouse', 1089, 487);
INSERT INTO public.dependant_data VALUES (1091, false, '2025-03-21', 2025, 'Daughter', 1091, 487);
INSERT INTO public.dependant_data VALUES (1093, false, '2025-03-21', 2025, 'Daughter', 1093, 487);
INSERT INTO public.dependant_data VALUES (1105, false, '2025-03-21', 2025, 'Wife', 1105, 493);
INSERT INTO public.dependant_data VALUES (1121, false, '2025-03-21', 2025, 'Son', 1121, 500);
INSERT INTO public.dependant_data VALUES (1122, false, '2025-03-21', 2025, 'Wife', 1122, 500);
INSERT INTO public.dependant_data VALUES (1134, false, '2025-03-21', 2025, 'Wife', 1134, 506);
INSERT INTO public.dependant_data VALUES (1141, false, '2025-03-21', 2025, 'Husband', 1141, 512);
INSERT INTO public.dependant_data VALUES (1142, false, '2025-03-21', 2025, 'Son', 1142, 512);
INSERT INTO public.dependant_data VALUES (1143, false, '2025-03-21', 2025, 'Daughter', 1143, 512);
INSERT INTO public.dependant_data VALUES (1162, false, '2025-03-21', 2025, 'Son', 1162, 522);
INSERT INTO public.dependant_data VALUES (1163, false, '2025-03-21', 2025, 'Husband', 1163, 522);
INSERT INTO public.dependant_data VALUES (1164, false, '2025-03-21', 2025, 'Son', 1164, 522);
INSERT INTO public.dependant_data VALUES (1175, false, '2025-03-21', 2025, 'Father', 1175, 527);
INSERT INTO public.dependant_data VALUES (1176, false, '2025-03-21', 2025, 'Mother', 1176, 527);
INSERT INTO public.dependant_data VALUES (1183, false, '2025-03-21', 2025, 'Wife', 1183, 531);
INSERT INTO public.dependant_data VALUES (1185, false, '2025-03-21', 2025, 'Daughter', 1185, 531);
INSERT INTO public.dependant_data VALUES (1193, false, '2025-03-21', 2025, 'Husband', 1193, 535);
INSERT INTO public.dependant_data VALUES (1207, false, '2025-03-21', 2025, 'Wife', 1207, 542);
INSERT INTO public.dependant_data VALUES (1209, false, '2025-03-21', 2025, 'Son', 1209, 542);
INSERT INTO public.dependant_data VALUES (1211, false, '2025-03-21', 2025, 'Daughter', 1211, 542);
INSERT INTO public.dependant_data VALUES (1217, false, '2025-03-21', 2025, 'Wife', 1217, 545);
INSERT INTO public.dependant_data VALUES (1218, false, '2025-03-21', 2025, 'Daughter', 1218, 545);
INSERT INTO public.dependant_data VALUES (1230, false, '2025-03-21', 2025, 'Son', 1230, 550);
INSERT INTO public.dependant_data VALUES (1231, false, '2025-03-21', 2025, 'Wife', 1231, 550);
INSERT INTO public.dependant_data VALUES (1232, false, '2025-03-21', 2025, 'Son', 1232, 550);
INSERT INTO public.dependant_data VALUES (1241, false, '2025-03-21', 2025, 'Husband', 1241, 556);
INSERT INTO public.dependant_data VALUES (1242, false, '2025-03-21', 2025, 'Wife', 1242, 556);
INSERT INTO public.dependant_data VALUES (1252, false, '2025-03-21', 2025, 'Husband', 1252, 562);
INSERT INTO public.dependant_data VALUES (1254, false, '2025-03-21', 2025, 'Son', 1254, 562);
INSERT INTO public.dependant_data VALUES (1265, false, '2025-03-21', 2025, 'Mother', 1265, 569);
INSERT INTO public.dependant_data VALUES (1271, false, '2025-03-21', 2025, 'Mother', 1271, 575);
INSERT INTO public.dependant_data VALUES (1272, false, '2025-03-21', 2025, 'Father', 1272, 575);
INSERT INTO public.dependant_data VALUES (1279, false, '2025-03-21', 2025, 'Mother', 1279, 580);
INSERT INTO public.dependant_data VALUES (1281, false, '2025-03-21', 2025, 'Father', 1281, 580);
INSERT INTO public.dependant_data VALUES (1288, false, '2025-03-21', 2025, 'Mother', 1288, 586);
INSERT INTO public.dependant_data VALUES (1289, false, '2025-03-21', 2025, 'Father', 1289, 586);
INSERT INTO public.dependant_data VALUES (1298, false, '2025-03-21', 2025, 'Son', 1298, 594);
INSERT INTO public.dependant_data VALUES (1302, false, '2025-03-21', 2025, 'Wife', 1302, 594);
INSERT INTO public.dependant_data VALUES (1313, false, '2025-03-21', 2025, 'Wife', 1313, 600);
INSERT INTO public.dependant_data VALUES (1332, false, '2025-03-21', 2025, 'Wife', 1332, 608);
INSERT INTO public.dependant_data VALUES (1340, false, '2025-03-21', 2025, 'Spouse', 1340, 614);
INSERT INTO public.dependant_data VALUES (1350, false, '2025-03-21', 2025, 'Husband', 1350, 620);
INSERT INTO public.dependant_data VALUES (1360, false, '2025-03-21', 2025, 'Daughter', 1360, 626);
INSERT INTO public.dependant_data VALUES (1361, false, '2025-03-21', 2025, 'Husband', 1361, 626);
INSERT INTO public.dependant_data VALUES (1362, false, '2025-03-21', 2025, 'Son', 1362, 626);
INSERT INTO public.dependant_data VALUES (1372, false, '2025-03-21', 2025, 'Mother', 1372, 632);
INSERT INTO public.dependant_data VALUES (1382, false, '2025-03-21', 2025, 'Wife', 1382, 637);
INSERT INTO public.dependant_data VALUES (1384, false, '2025-03-21', 2025, 'Daughter', 1384, 637);
INSERT INTO public.dependant_data VALUES (1395, false, '2025-03-21', 2025, 'Father', 1395, 644);
INSERT INTO public.dependant_data VALUES (1396, false, '2025-03-21', 2025, 'Mother', 1396, 644);
INSERT INTO public.dependant_data VALUES (1409, false, '2025-03-21', 2025, 'Wife', 1407, 650);
INSERT INTO public.dependant_data VALUES (1411, false, '2025-03-21', 2025, 'Son', 1409, 650);
INSERT INTO public.dependant_data VALUES (1420, false, '2025-03-21', 2025, 'Mother', 1418, 656);
INSERT INTO public.dependant_data VALUES (1427, false, '2025-03-21', 2025, 'Husband', 1425, 662);
INSERT INTO public.dependant_data VALUES (1449, false, '2025-03-21', 2025, 'Son', 1446, 675);
INSERT INTO public.dependant_data VALUES (1450, false, '2025-03-21', 2025, 'Husband', 1447, 675);
INSERT INTO public.dependant_data VALUES (1451, false, '2025-03-21', 2025, 'Son', 1448, 675);
INSERT INTO public.dependant_data VALUES (1452, false, '2025-03-21', 2025, 'Son', 1449, 675);
INSERT INTO public.dependant_data VALUES (1464, false, '2025-03-21', 2025, 'Son', 1461, 683);
INSERT INTO public.dependant_data VALUES (1465, false, '2025-03-21', 2025, 'Daughter', 1462, 683);
INSERT INTO public.dependant_data VALUES (1466, false, '2025-03-21', 2025, 'Wife', 1463, 683);
INSERT INTO public.dependant_data VALUES (1473, false, '2025-03-21', 2025, 'Son', 1470, 688);
INSERT INTO public.dependant_data VALUES (1474, false, '2025-03-21', 2025, 'son', 1471, 688);
INSERT INTO public.dependant_data VALUES (1475, false, '2025-03-21', 2025, 'Husband', 1472, 688);
INSERT INTO public.dependant_data VALUES (1486, false, '2025-03-21', 2025, 'Daughter', 1483, 697);
INSERT INTO public.dependant_data VALUES (1487, false, '2025-03-21', 2025, 'Wife', 1484, 697);
INSERT INTO public.dependant_data VALUES (1488, false, '2025-03-21', 2025, 'Daughter', 1485, 697);
INSERT INTO public.dependant_data VALUES (1493, false, '2025-03-21', 2025, 'Mother', 1490, 700);
INSERT INTO public.dependant_data VALUES (1494, false, '2025-03-21', 2025, 'Father', 1491, 700);
INSERT INTO public.dependant_data VALUES (1503, false, '2025-03-21', 2025, 'Husband', 1500, 704);
INSERT INTO public.dependant_data VALUES (1509, false, '2025-03-21', 2025, 'Husband', 1506, 709);
INSERT INTO public.dependant_data VALUES (1517, false, '2025-03-21', 2025, 'Son', 1514, 714);
INSERT INTO public.dependant_data VALUES (1518, false, '2025-03-21', 2025, 'Husban', 1515, 714);
INSERT INTO public.dependant_data VALUES (1519, false, '2025-03-21', 2025, 'Son', 1516, 714);
INSERT INTO public.dependant_data VALUES (1529, false, '2025-03-21', 2025, 'Mother', 1526, 721);
INSERT INTO public.dependant_data VALUES (1530, false, '2025-03-21', 2025, 'Father', 1527, 721);
INSERT INTO public.dependant_data VALUES (1541, false, '2025-03-21', 2025, 'Husband', 1538, 727);
INSERT INTO public.dependant_data VALUES (1543, false, '2025-03-21', 2025, 'Son', 1540, 727);
INSERT INTO public.dependant_data VALUES (1577, false, '2025-03-21', 2025, 'Wife', 1573, 742);
INSERT INTO public.dependant_data VALUES (1578, false, '2025-03-21', 2025, 'Son', 1574, 742);
INSERT INTO public.dependant_data VALUES (1579, false, '2025-03-21', 2025, 'Daughter', 1575, 742);
INSERT INTO public.dependant_data VALUES (1600, false, '2025-03-21', 2025, 'Mother', 1596, 753);
INSERT INTO public.dependant_data VALUES (1617, false, '2025-03-21', 2025, 'Wife', 1613, 764);
INSERT INTO public.dependant_data VALUES (1619, false, '2025-03-21', 2025, 'Son', 1615, 764);
INSERT INTO public.dependant_data VALUES (1621, false, '2025-03-21', 2025, 'Son', 1617, 764);
INSERT INTO public.dependant_data VALUES (1622, false, '2025-03-21', 2025, 'Son', 1618, 764);
INSERT INTO public.dependant_data VALUES (1007, false, '2025-03-21', 2025, 'Wife', 1007, 453);
INSERT INTO public.dependant_data VALUES (1008, false, '2025-03-21', 2025, 'Daughter', 1008, 453);
INSERT INTO public.dependant_data VALUES (1019, false, '2025-03-21', 2025, 'Wife', 1019, 458);
INSERT INTO public.dependant_data VALUES (1020, false, '2025-03-21', 2025, 'Son', 1020, 458);
INSERT INTO public.dependant_data VALUES (1034, false, '2025-03-21', 2025, 'Husband', 1034, 463);
INSERT INTO public.dependant_data VALUES (1049, false, '2025-03-21', 2025, 'Daughter', 1049, 469);
INSERT INTO public.dependant_data VALUES (1050, false, '2025-03-21', 2025, 'Daughter', 1050, 469);
INSERT INTO public.dependant_data VALUES (1051, false, '2025-03-21', 2025, 'Husband', 1051, 469);
INSERT INTO public.dependant_data VALUES (1052, false, '2025-03-21', 2025, 'Daughter', 1052, 469);
INSERT INTO public.dependant_data VALUES (1065, false, '2025-03-21', 2025, 'Wife', 1065, 477);
INSERT INTO public.dependant_data VALUES (1074, false, '2025-03-21', 2025, 'Son', 1074, 482);
INSERT INTO public.dependant_data VALUES (1076, false, '2025-03-21', 2025, 'Wife', 1076, 482);
INSERT INTO public.dependant_data VALUES (1079, false, '2025-03-21', 2025, 'Daughter', 1079, 482);
INSERT INTO public.dependant_data VALUES (1082, false, '2025-03-21', 2025, 'Son', 1082, 482);
INSERT INTO public.dependant_data VALUES (1095, false, '2025-03-21', 2025, 'Daughter', 1096, 489);
INSERT INTO public.dependant_data VALUES (1097, false, '2025-03-21', 2025, 'Son', 1097, 489);
INSERT INTO public.dependant_data VALUES (1098, false, '2025-03-21', 2025, 'Daughter', 1098, 489);
INSERT INTO public.dependant_data VALUES (1099, false, '2025-03-21', 2025, 'Wife', 1099, 489);
INSERT INTO public.dependant_data VALUES (1106, false, '2025-03-21', 2025, 'Wife', 1106, 494);
INSERT INTO public.dependant_data VALUES (1115, false, '2025-03-21', 2025, 'Wife', 1115, 498);
INSERT INTO public.dependant_data VALUES (1117, false, '2025-03-21', 2025, 'Daughter', 1117, 498);
INSERT INTO public.dependant_data VALUES (1119, false, '2025-03-21', 2025, 'Son', 1119, 498);
INSERT INTO public.dependant_data VALUES (1120, false, '2025-03-21', 2025, 'Daughter', 1120, 498);
INSERT INTO public.dependant_data VALUES (1130, false, '2025-03-21', 2025, 'Son', 1129, 505);
INSERT INTO public.dependant_data VALUES (1132, false, '2025-03-21', 2025, 'Daughter', 1131, 505);
INSERT INTO public.dependant_data VALUES (1133, false, '2025-03-21', 2025, 'Husband', 1133, 505);
INSERT INTO public.dependant_data VALUES (1140, false, '2025-03-21', 2025, 'Wife', 1140, 511);
INSERT INTO public.dependant_data VALUES (1160, false, '2025-03-21', 2025, 'Daughter', 1160, 521);
INSERT INTO public.dependant_data VALUES (1161, false, '2025-03-21', 2025, 'Wife', 1161, 521);
INSERT INTO public.dependant_data VALUES (1165, false, '2025-03-21', 2025, 'Wife', 1165, 523);
INSERT INTO public.dependant_data VALUES (1166, false, '2025-03-21', 2025, 'Son', 1166, 523);
INSERT INTO public.dependant_data VALUES (1167, false, '2025-03-21', 2025, 'Daughter', 1167, 523);
INSERT INTO public.dependant_data VALUES (1168, false, '2025-03-21', 2025, 'Daughter', 1168, 523);
INSERT INTO public.dependant_data VALUES (1170, false, '2025-03-21', 2025, 'Son', 1170, 523);
INSERT INTO public.dependant_data VALUES (1179, false, '2025-03-21', 2025, 'Husband', 1179, 529);
INSERT INTO public.dependant_data VALUES (1180, false, '2025-03-21', 2025, 'Son', 1180, 529);
INSERT INTO public.dependant_data VALUES (1194, false, '2025-03-21', 2025, 'Wife', 1194, 536);
INSERT INTO public.dependant_data VALUES (1208, false, '2025-03-21', 2025, 'Daughter', 1208, 543);
INSERT INTO public.dependant_data VALUES (1210, false, '2025-03-21', 2025, 'Wife', 1210, 543);
INSERT INTO public.dependant_data VALUES (1212, false, '2025-03-21', 2025, 'Son', 1212, 543);
INSERT INTO public.dependant_data VALUES (1227, false, '2025-03-21', 2025, 'Daughter', 1227, 549);
INSERT INTO public.dependant_data VALUES (1228, false, '2025-03-21', 2025, 'Daughter', 1228, 549);
INSERT INTO public.dependant_data VALUES (1229, false, '2025-03-21', 2025, 'Wife', 1229, 549);
INSERT INTO public.dependant_data VALUES (1238, false, '2025-03-21', 2025, 'Husband', 1238, 554);
INSERT INTO public.dependant_data VALUES (1240, false, '2025-03-21', 2025, 'Daughter', 1240, 554);
INSERT INTO public.dependant_data VALUES (1248, false, '2025-03-21', 2025, 'Father', 1248, 560);
INSERT INTO public.dependant_data VALUES (1249, false, '2025-03-21', 2025, 'Mother', 1249, 560);
INSERT INTO public.dependant_data VALUES (1260, false, '2025-03-21', 2025, 'Mother', 1260, 566);
INSERT INTO public.dependant_data VALUES (1262, false, '2025-03-21', 2025, 'Father', 1262, 566);
INSERT INTO public.dependant_data VALUES (1277, false, '2025-03-21', 2025, 'Husband', 1277, 578);
INSERT INTO public.dependant_data VALUES (1286, false, '2025-03-21', 2025, 'Wife', 1286, 584);
INSERT INTO public.dependant_data VALUES (1292, false, '2025-03-21', 2025, 'Mother', 1292, 588);
INSERT INTO public.dependant_data VALUES (1296, false, '2025-03-21', 2025, 'Daughter', 1296, 592);
INSERT INTO public.dependant_data VALUES (1299, false, '2025-03-21', 2025, 'Husband', 1299, 592);
INSERT INTO public.dependant_data VALUES (1306, false, '2025-03-21', 2025, 'Mother', 1306, 597);
INSERT INTO public.dependant_data VALUES (1309, false, '2025-03-21', 2025, 'Father', 1309, 597);
INSERT INTO public.dependant_data VALUES (1321, false, '2025-03-21', 2025, 'Daughter', 1321, 603);
INSERT INTO public.dependant_data VALUES (1323, false, '2025-03-21', 2025, 'Husband', 1323, 603);
INSERT INTO public.dependant_data VALUES (1325, false, '2025-03-21', 2025, 'Son', 1325, 603);
INSERT INTO public.dependant_data VALUES (1330, false, '2025-03-21', 2025, 'Husband', 1329, 607);
INSERT INTO public.dependant_data VALUES (1345, false, '2025-03-21', 2025, 'Wife', 1345, 617);
INSERT INTO public.dependant_data VALUES (1353, false, '2025-03-21', 2025, 'Daughter', 1353, 623);
INSERT INTO public.dependant_data VALUES (1354, false, '2025-03-21', 2025, 'Wife', 1354, 623);
INSERT INTO public.dependant_data VALUES (1355, false, '2025-03-21', 2025, 'Son', 1355, 623);
INSERT INTO public.dependant_data VALUES (1368, false, '2025-03-21', 2025, NULL, 1368, 629);
INSERT INTO public.dependant_data VALUES (1369, false, '2025-03-21', 2025, 'Wife', 1369, 629);
INSERT INTO public.dependant_data VALUES (1376, false, '2025-03-21', 2025, 'Son', 1376, 635);
INSERT INTO public.dependant_data VALUES (1377, false, '2025-03-21', 2025, 'Husband', 1377, 635);
INSERT INTO public.dependant_data VALUES (1378, false, '2025-03-21', 2025, 'Daughter', 1378, 635);
INSERT INTO public.dependant_data VALUES (1390, false, '2025-03-21', 2025, 'Daughter', 1390, 641);
INSERT INTO public.dependant_data VALUES (1401, false, '2025-03-21', 2025, 'Mother', 1401, 647);
INSERT INTO public.dependant_data VALUES (1402, false, '2025-03-21', 2025, 'Father', 1402, 647);
INSERT INTO public.dependant_data VALUES (1413, false, '2025-03-21', 2025, 'Son', 1411, 653);
INSERT INTO public.dependant_data VALUES (1414, false, '2025-03-21', 2025, 'Son', 1412, 653);
INSERT INTO public.dependant_data VALUES (1415, false, '2025-03-21', 2025, 'Husband', 1413, 653);
INSERT INTO public.dependant_data VALUES (1424, false, '2025-03-21', 2025, 'Wife', 1422, 660);
INSERT INTO public.dependant_data VALUES (1436, false, '2025-03-21', 2025, 'Daughter', 1434, 667);
INSERT INTO public.dependant_data VALUES (1437, false, '2025-03-21', 2025, 'Daughter', 1435, 667);
INSERT INTO public.dependant_data VALUES (1438, false, '2025-03-21', 2025, 'Spouse', 1436, 667);
INSERT INTO public.dependant_data VALUES (1444, false, '2025-03-21', 2025, 'Daughter', 1442, 673);
INSERT INTO public.dependant_data VALUES (1445, false, '2025-03-21', 2025, 'Son', 897, 673);
INSERT INTO public.dependant_data VALUES (1446, false, '2025-03-21', 2025, 'Wife', 1443, 673);
INSERT INTO public.dependant_data VALUES (1447, false, '2025-03-21', 2025, 'Son', 1444, 673);
INSERT INTO public.dependant_data VALUES (1455, false, '2025-03-21', 2025, 'Son', 1452, 677);
INSERT INTO public.dependant_data VALUES (1456, false, '2025-03-21', 2025, 'Son', 1453, 677);
INSERT INTO public.dependant_data VALUES (1457, false, '2025-03-21', 2025, 'Wife', 1454, 677);
INSERT INTO public.dependant_data VALUES (1461, false, '2025-03-21', 2025, 'Wife', 1458, 681);
INSERT INTO public.dependant_data VALUES (1513, false, '2025-03-21', 2025, 'Mother', 1510, 712);
INSERT INTO public.dependant_data VALUES (1514, false, '2025-03-21', 2025, 'Father', 1511, 712);
INSERT INTO public.dependant_data VALUES (1525, false, '2025-03-21', 2025, 'Son', 1522, 718);
INSERT INTO public.dependant_data VALUES (1534, false, '2025-03-21', 2025, 'Husband', 1531, 724);
INSERT INTO public.dependant_data VALUES (1560, false, '2025-03-21', 2025, 'Daughter', 1557, 736);
INSERT INTO public.dependant_data VALUES (1561, false, '2025-03-21', 2025, 'Wife', 1558, 736);
INSERT INTO public.dependant_data VALUES (1562, false, '2025-03-21', 2025, 'Daughter', 1559, 736);
INSERT INTO public.dependant_data VALUES (1563, false, '2025-03-21', 2025, 'Son', 1560, 736);
INSERT INTO public.dependant_data VALUES (1572, false, '2025-03-21', 2025, 'Mother', 1568, 740);
INSERT INTO public.dependant_data VALUES (1573, false, '2025-03-21', 2025, 'Father', 1569, 740);
INSERT INTO public.dependant_data VALUES (1587, false, '2025-03-21', 2025, 'Daughter', 1583, 745);
INSERT INTO public.dependant_data VALUES (1589, false, '2025-03-21', 2025, 'Wife', 1585, 745);
INSERT INTO public.dependant_data VALUES (1591, false, '2025-03-21', 2025, 'Son', 1587, 745);
INSERT INTO public.dependant_data VALUES (1603, false, '2025-03-21', 2025, 'Wife', 1600, 755);
INSERT INTO public.dependant_data VALUES (1610, false, '2025-03-21', 2025, 'Son', 1606, 761);
INSERT INTO public.dependant_data VALUES (1611, false, '2025-03-21', 2025, 'Husband', 1607, 761);
INSERT INTO public.dependant_data VALUES (1612, false, '2025-03-21', 2025, 'Son', 1608, 761);
INSERT INTO public.dependant_data VALUES (1613, false, '2025-03-21', 2025, 'Son', 1609, 761);
INSERT INTO public.dependant_data VALUES (1009, false, '2025-03-21', 2025, 'Doughter', 1009, 454);
INSERT INTO public.dependant_data VALUES (1010, false, '2025-03-21', 2025, 'Son', 1010, 454);
INSERT INTO public.dependant_data VALUES (1011, false, '2025-03-21', 2025, 'Doughter', 1011, 454);
INSERT INTO public.dependant_data VALUES (1012, false, '2025-03-21', 2025, 'Husband', 1012, 454);
INSERT INTO public.dependant_data VALUES (1024, false, '2025-03-21', 2025, 'Daughter', 1024, 460);
INSERT INTO public.dependant_data VALUES (1025, false, '2025-03-21', 2025, 'Wife', 1025, 460);
INSERT INTO public.dependant_data VALUES (1043, false, '2025-03-21', 2025, 'Daughter', 1043, 467);
INSERT INTO public.dependant_data VALUES (1044, false, '2025-03-21', 2025, 'Son', 1044, 467);
INSERT INTO public.dependant_data VALUES (1045, false, '2025-03-21', 2025, 'Wife', 1045, 467);
INSERT INTO public.dependant_data VALUES (1056, false, '2025-03-21', 2025, 'Husband', 1056, 472);
INSERT INTO public.dependant_data VALUES (1057, false, '2025-03-21', 2025, 'Son', 1057, 472);
INSERT INTO public.dependant_data VALUES (1059, false, '2025-03-21', 2025, 'Son', 1059, 472);
INSERT INTO public.dependant_data VALUES (1067, false, '2025-03-21', 2025, 'Daughter', 1067, 478);
INSERT INTO public.dependant_data VALUES (1068, false, '2025-03-21', 2025, 'Daughter', 1068, 478);
INSERT INTO public.dependant_data VALUES (1070, false, '2025-03-21', 2025, 'Son', 1070, 478);
INSERT INTO public.dependant_data VALUES (1072, false, '2025-03-21', 2025, 'Wife', 1072, 478);
INSERT INTO public.dependant_data VALUES (1085, false, '2025-03-21', 2025, 'Daughter', 1084, 485);
INSERT INTO public.dependant_data VALUES (1087, false, '2025-03-21', 2025, 'Daughter', 1086, 485);
INSERT INTO public.dependant_data VALUES (1088, false, '2025-03-21', 2025, 'Husband', 1090, 485);
INSERT INTO public.dependant_data VALUES (1102, false, '2025-03-21', 2025, 'Wife', 1102, 492);
INSERT INTO public.dependant_data VALUES (1103, false, '2025-03-21', 2025, 'Daughter', 1103, 492);
INSERT INTO public.dependant_data VALUES (1104, false, '2025-03-21', 2025, 'Son', 1104, 492);
INSERT INTO public.dependant_data VALUES (1123, false, '2025-03-21', 2025, 'Husband', 1123, 501);
INSERT INTO public.dependant_data VALUES (1135, false, '2025-03-21', 2025, 'Husband', 1135, 507);
INSERT INTO public.dependant_data VALUES (1136, false, '2025-03-21', 2025, 'Son', 1136, 507);
INSERT INTO public.dependant_data VALUES (1144, false, '2025-03-21', 2025, 'Husband', 1144, 513);
INSERT INTO public.dependant_data VALUES (1145, false, '2025-03-21', 2025, 'Daughter', 1145, 513);
INSERT INTO public.dependant_data VALUES (1149, false, '2025-03-21', 2025, 'Daughter', 1149, 517);
INSERT INTO public.dependant_data VALUES (1150, false, '2025-03-21', 2025, 'Daughter', 1150, 517);
INSERT INTO public.dependant_data VALUES (1152, false, '2025-03-21', 2025, 'Wife', 1152, 517);
INSERT INTO public.dependant_data VALUES (1169, false, '2025-03-21', 2025, 'Daughter', 1169, 524);
INSERT INTO public.dependant_data VALUES (1171, false, '2025-03-21', 2025, 'Wife', 1171, 524);
INSERT INTO public.dependant_data VALUES (1184, false, '2025-03-21', 2025, 'Son', 1184, 532);
INSERT INTO public.dependant_data VALUES (1186, false, '2025-03-21', 2025, 'Son', 1186, 532);
INSERT INTO public.dependant_data VALUES (1187, false, '2025-03-21', 2025, 'Wife', 1187, 532);
INSERT INTO public.dependant_data VALUES (1198, false, '2025-03-21', 2025, 'Father', 1198, 538);
INSERT INTO public.dependant_data VALUES (1199, false, '2025-03-21', 2025, 'Mother', 1199, 538);
INSERT INTO public.dependant_data VALUES (1213, false, '2025-03-21', 2025, 'Son', 1213, 544);
INSERT INTO public.dependant_data VALUES (1214, false, '2025-03-21', 2025, 'Wife', 1214, 544);
INSERT INTO public.dependant_data VALUES (1215, false, '2025-03-21', 2025, 'Son', 1215, 544);
INSERT INTO public.dependant_data VALUES (1216, false, '2025-03-21', 2025, 'Son', 1216, 544);
INSERT INTO public.dependant_data VALUES (1236, false, '2025-03-21', 2025, 'Mother', 1236, 553);
INSERT INTO public.dependant_data VALUES (1237, false, '2025-03-21', 2025, 'Father', 1237, 553);
INSERT INTO public.dependant_data VALUES (1243, false, '2025-03-21', 2025, 'Mother', 1243, 557);
INSERT INTO public.dependant_data VALUES (1245, false, '2025-03-21', 2025, 'Father', 1245, 557);
INSERT INTO public.dependant_data VALUES (1253, false, '2025-03-21', 2025, 'Wife', 1253, 563);
INSERT INTO public.dependant_data VALUES (1255, false, '2025-03-21', 2025, 'Daughter', 1255, 563);
INSERT INTO public.dependant_data VALUES (1263, false, '2025-03-21', 2025, 'Mother', 1263, 568);
INSERT INTO public.dependant_data VALUES (1264, false, '2025-03-21', 2025, 'Father', 1264, 568);
INSERT INTO public.dependant_data VALUES (1270, false, '2025-03-21', 2025, 'Son', 1270, 574);
INSERT INTO public.dependant_data VALUES (1280, false, '2025-03-21', 2025, 'Son', 1280, 581);
INSERT INTO public.dependant_data VALUES (1282, false, '2025-03-21', 2025, 'Husband', 1282, 581);
INSERT INTO public.dependant_data VALUES (1290, false, '2025-03-21', 2025, 'Son', 1290, 587);
INSERT INTO public.dependant_data VALUES (1291, false, '2025-03-21', 2025, 'Wife', 1291, 587);
INSERT INTO public.dependant_data VALUES (1301, false, '2025-03-21', 2025, 'Son', 1301, 595);
INSERT INTO public.dependant_data VALUES (1303, false, '2025-03-21', 2025, 'Wife', 1303, 595);
INSERT INTO public.dependant_data VALUES (1304, false, '2025-03-21', 2025, 'Daughter', 1304, 595);
INSERT INTO public.dependant_data VALUES (1314, false, '2025-03-21', 2025, 'Son', 1314, 601);
INSERT INTO public.dependant_data VALUES (1315, false, '2025-03-21', 2025, 'Son', 1315, 601);
INSERT INTO public.dependant_data VALUES (1316, false, '2025-03-21', 2025, 'Son', 1316, 601);
INSERT INTO public.dependant_data VALUES (1318, false, '2025-03-21', 2025, 'Wife', 1318, 601);
INSERT INTO public.dependant_data VALUES (1328, false, '2025-03-21', 2025, 'Daughter', 1328, 606);
INSERT INTO public.dependant_data VALUES (1329, false, '2025-03-21', 2025, 'Wife', 1330, 606);
INSERT INTO public.dependant_data VALUES (1331, false, '2025-03-21', 2025, 'Daughter', 1331, 606);
INSERT INTO public.dependant_data VALUES (1336, false, '2025-03-21', 2025, 'Wife', 1336, 612);
INSERT INTO public.dependant_data VALUES (1337, false, '2025-03-21', 2025, 'Son', 1337, 612);
INSERT INTO public.dependant_data VALUES (1346, false, '2025-03-21', 2025, 'Father', 1346, 618);
INSERT INTO public.dependant_data VALUES (1347, false, '2025-03-21', 2025, 'Mother', 1347, 618);
INSERT INTO public.dependant_data VALUES (1356, false, '2025-03-21', 2025, 'Wife', 1356, 624);
INSERT INTO public.dependant_data VALUES (1370, false, '2025-03-21', 2025, 'Husband', 1370, 630);
INSERT INTO public.dependant_data VALUES (1379, false, '2025-03-21', 2025, 'Son', 1379, 636);
INSERT INTO public.dependant_data VALUES (1380, false, '2025-03-21', 2025, 'Wife', 1380, 636);
INSERT INTO public.dependant_data VALUES (1391, false, '2025-03-21', 2025, 'Father', 1391, 642);
INSERT INTO public.dependant_data VALUES (1392, false, '2025-03-21', 2025, 'Mother', 1392, 642);
INSERT INTO public.dependant_data VALUES (1403, false, '2025-03-21', 2025, 'Daughter', 828, 648);
INSERT INTO public.dependant_data VALUES (1404, false, '2025-03-21', 2025, 'Husband', 1403, 648);
INSERT INTO public.dependant_data VALUES (1405, false, '2025-03-21', 2025, 'Daughter', 830, 648);
INSERT INTO public.dependant_data VALUES (1406, false, '2025-03-21', 2025, 'Son', 1404, 648);
INSERT INTO public.dependant_data VALUES (1418, false, '2025-03-21', 2025, 'Wife', 1416, 655);
INSERT INTO public.dependant_data VALUES (1419, false, '2025-03-21', 2025, 'Son', 1417, 655);
INSERT INTO public.dependant_data VALUES (1426, false, '2025-03-21', 2025, 'Wife', 1423, 661);
INSERT INTO public.dependant_data VALUES (1431, false, '2025-03-21', 2025, 'Daughter', 1429, 665);
INSERT INTO public.dependant_data VALUES (1432, false, '2025-03-21', 2025, 'Son', 1430, 665);
INSERT INTO public.dependant_data VALUES (1433, false, '2025-03-21', 2025, 'Wife', 1431, 665);
INSERT INTO public.dependant_data VALUES (1468, false, '2025-03-21', 2025, 'Daughter', 1465, 686);
INSERT INTO public.dependant_data VALUES (1469, false, '2025-03-21', 2025, 'Wife', 1466, 686);
INSERT INTO public.dependant_data VALUES (1470, false, '2025-03-21', 2025, 'Son', 1467, 686);
INSERT INTO public.dependant_data VALUES (1478, false, '2025-03-21', 2025, 'Daughter', 1475, 690);
INSERT INTO public.dependant_data VALUES (1479, false, '2025-03-21', 2025, 'Daughter', 1476, 690);
INSERT INTO public.dependant_data VALUES (1480, false, '2025-03-21', 2025, 'Husband', 1477, 690);
INSERT INTO public.dependant_data VALUES (1481, false, '2025-03-21', 2025, 'Daughter', 1478, 690);
INSERT INTO public.dependant_data VALUES (1500, false, '2025-03-21', 2025, 'Wife', 1497, 703);
INSERT INTO public.dependant_data VALUES (1501, false, '2025-03-21', 2025, 'Son', 1498, 703);
INSERT INTO public.dependant_data VALUES (1502, false, '2025-03-21', 2025, 'Son', 1499, 703);
INSERT INTO public.dependant_data VALUES (1505, false, '2025-03-21', 2025, 'Father', 1502, 707);
INSERT INTO public.dependant_data VALUES (1506, false, '2025-03-21', 2025, 'Mother', 1503, 707);
INSERT INTO public.dependant_data VALUES (1512, false, '2025-03-21', 2025, 'Mother', 1509, 711);
INSERT INTO public.dependant_data VALUES (1523, false, '2025-03-21', 2025, 'Mother', 1520, 716);
INSERT INTO public.dependant_data VALUES (1531, false, '2025-03-21', 2025, 'Father', 1528, 722);
INSERT INTO public.dependant_data VALUES (1532, false, '2025-03-21', 2025, 'Mother', 1529, 722);
INSERT INTO public.dependant_data VALUES (1542, false, '2025-03-21', 2025, 'Wife', 1539, 728);
INSERT INTO public.dependant_data VALUES (1544, false, '2025-03-21', 2025, 'Daughter', 1541, 728);
INSERT INTO public.dependant_data VALUES (1551, false, '2025-03-21', 2025, 'Husband', 1548, 733);
INSERT INTO public.dependant_data VALUES (1552, false, '2025-03-21', 2025, 'Daughter', 1549, 733);
INSERT INTO public.dependant_data VALUES (1553, false, '2025-03-21', 2025, 'Daughter', 1550, 733);
INSERT INTO public.dependant_data VALUES (1554, false, '2025-03-21', 2025, 'Son', 1551, 733);
INSERT INTO public.dependant_data VALUES (1567, false, '2025-03-21', 2025, 'Son', 1564, 738);
INSERT INTO public.dependant_data VALUES (1569, false, '2025-03-21', 2025, 'Son', 1565, 738);
INSERT INTO public.dependant_data VALUES (1571, false, '2025-03-21', 2025, 'Husband', 1567, 738);
INSERT INTO public.dependant_data VALUES (1582, false, '2025-03-21', 2025, 'Wife', 1578, 744);
INSERT INTO public.dependant_data VALUES (1594, false, '2025-03-21', 2025, 'Father', 1590, 749);
INSERT INTO public.dependant_data VALUES (1595, false, '2025-03-21', 2025, 'Mother', 1591, 749);
INSERT INTO public.dependant_data VALUES (1601, false, '2025-03-21', 2025, 'Son', 1597, 754);
INSERT INTO public.dependant_data VALUES (1602, false, '2025-03-21', 2025, 'Husband', 1598, 754);
INSERT INTO public.dependant_data VALUES (1618, false, '2025-03-21', 2025, 'Mother', 1614, 765);
INSERT INTO public.dependant_data VALUES (1620, false, '2025-03-21', 2025, 'Father', 1616, 765);
INSERT INTO public.dependant_data VALUES (1013, false, '2025-03-21', 2025, 'Daughter', 1013, 455);
INSERT INTO public.dependant_data VALUES (1014, false, '2025-03-21', 2025, 'Husband', 1014, 455);
INSERT INTO public.dependant_data VALUES (1032, false, '2025-03-21', 2025, 'Daughter', 1032, 462);
INSERT INTO public.dependant_data VALUES (1033, false, '2025-03-21', 2025, 'Wife', 1033, 462);
INSERT INTO public.dependant_data VALUES (1046, false, '2025-03-21', 2025, 'Son', 1046, 468);
INSERT INTO public.dependant_data VALUES (1047, false, '2025-03-21', 2025, 'Wife', 1047, 468);
INSERT INTO public.dependant_data VALUES (1048, false, '2025-03-21', 2025, 'Son', 1048, 468);
INSERT INTO public.dependant_data VALUES (1061, false, '2025-03-21', 2025, 'Husband', 1061, 474);
INSERT INTO public.dependant_data VALUES (1069, false, '2025-03-21', 2025, 'Son', 1069, 480);
INSERT INTO public.dependant_data VALUES (1071, false, '2025-03-21', 2025, 'Husband', 1071, 480);
INSERT INTO public.dependant_data VALUES (1084, false, '2025-03-21', 2025, 'Son', 1085, 486);
INSERT INTO public.dependant_data VALUES (1086, false, '2025-03-21', 2025, 'Husband', 1087, 486);
INSERT INTO public.dependant_data VALUES (1089, false, '2025-03-21', 2025, 'Daughter', 1088, 486);
INSERT INTO public.dependant_data VALUES (1100, false, '2025-03-21', 2025, 'Daughter', 1100, 491);
INSERT INTO public.dependant_data VALUES (1101, false, '2025-03-21', 2025, 'Husband', 1101, 491);
INSERT INTO public.dependant_data VALUES (1113, false, '2025-03-21', 2025, 'Wife', 1113, 497);
INSERT INTO public.dependant_data VALUES (1114, false, '2025-03-21', 2025, 'Son', 1114, 497);
INSERT INTO public.dependant_data VALUES (1127, false, '2025-03-21', 2025, 'Son', 1127, 503);
INSERT INTO public.dependant_data VALUES (1128, false, '2025-03-21', 2025, 'Wife', 1128, 503);
INSERT INTO public.dependant_data VALUES (1137, false, '2025-03-21', 2025, 'Wife', 1137, 508);
INSERT INTO public.dependant_data VALUES (1146, false, '2025-03-21', 2025, 'Husband', 1146, 514);
INSERT INTO public.dependant_data VALUES (1155, false, '2025-03-21', 2025, 'Wife', 1155, 519);
INSERT INTO public.dependant_data VALUES (1156, false, '2025-03-21', 2025, 'Daughter', 1156, 519);
INSERT INTO public.dependant_data VALUES (1157, false, '2025-03-21', 2025, 'Daughter', 1157, 519);
INSERT INTO public.dependant_data VALUES (1172, false, '2025-03-21', 2025, 'Husband', 1172, 525);
INSERT INTO public.dependant_data VALUES (1181, false, '2025-03-21', 2025, 'Spouse', 1181, 530);
INSERT INTO public.dependant_data VALUES (1182, false, '2025-03-21', 2025, 'Daughter', 1182, 530);
INSERT INTO public.dependant_data VALUES (1195, false, '2025-03-21', 2025, 'Son', 1195, 537);
INSERT INTO public.dependant_data VALUES (1196, false, '2025-03-21', 2025, 'Wife', 1196, 537);
INSERT INTO public.dependant_data VALUES (1197, false, '2025-03-21', 2025, 'Son', 1197, 537);
INSERT INTO public.dependant_data VALUES (1204, false, '2025-03-21', 2025, 'Wife', 1204, 541);
INSERT INTO public.dependant_data VALUES (1205, false, '2025-03-21', 2025, 'Daughter', 1205, 541);
INSERT INTO public.dependant_data VALUES (1206, false, '2025-03-21', 2025, 'Son', 1206, 541);
INSERT INTO public.dependant_data VALUES (1219, false, '2025-03-21', 2025, 'Husband', 1219, 546);
INSERT INTO public.dependant_data VALUES (1220, false, '2025-03-21', 2025, 'Daughter', 1220, 546);
INSERT INTO public.dependant_data VALUES (1222, false, '2025-03-21', 2025, 'Daughter', 1222, 546);
INSERT INTO public.dependant_data VALUES (1224, false, '2025-03-21', 2025, 'Daughter', 1224, 546);
INSERT INTO public.dependant_data VALUES (1239, false, '2025-03-21', 2025, 'wife ', 1239, 555);
INSERT INTO public.dependant_data VALUES (1250, false, '2025-03-21', 2025, 'Daughter', 1250, 561);
INSERT INTO public.dependant_data VALUES (1251, false, '2025-03-21', 2025, 'Wife', 1251, 561);
INSERT INTO public.dependant_data VALUES (1261, false, '2025-03-21', 2025, 'Husband', 1261, 567);
INSERT INTO public.dependant_data VALUES (1268, false, '2025-03-21', 2025, 'Son', 1268, 573);
INSERT INTO public.dependant_data VALUES (1269, false, '2025-03-21', 2025, 'Husband', 1269, 573);
INSERT INTO public.dependant_data VALUES (1278, false, '2025-03-21', 2025, 'Husband', 1278, 579);
INSERT INTO public.dependant_data VALUES (1284, false, '2025-03-21', 2025, 'Father', 1284, 583);
INSERT INTO public.dependant_data VALUES (1285, false, '2025-03-21', 2025, 'Mother', 1285, 583);
INSERT INTO public.dependant_data VALUES (1293, false, '2025-03-21', 2025, 'Wife', 1293, 589);
INSERT INTO public.dependant_data VALUES (1297, false, '2025-03-21', 2025, 'Wife', 1297, 593);
INSERT INTO public.dependant_data VALUES (1300, false, '2025-03-21', 2025, 'Son', 1300, 593);
INSERT INTO public.dependant_data VALUES (1307, false, '2025-03-21', 2025, 'Son', 1307, 598);
INSERT INTO public.dependant_data VALUES (1310, false, '2025-03-21', 2025, 'Husband', 1310, 598);
INSERT INTO public.dependant_data VALUES (1311, false, '2025-03-21', 2025, 'Daughter', 1311, 598);
INSERT INTO public.dependant_data VALUES (1312, false, '2025-03-21', 2025, 'Son', 1312, 598);
INSERT INTO public.dependant_data VALUES (1338, false, '2025-03-21', 2025, 'Husband', 1338, 613);
INSERT INTO public.dependant_data VALUES (1339, false, '2025-03-21', 2025, 'Son', 1339, 613);
INSERT INTO public.dependant_data VALUES (1348, false, '2025-03-21', 2025, 'Son', 1348, 619);
INSERT INTO public.dependant_data VALUES (1349, false, '2025-03-21', 2025, 'Husband', 1349, 619);
INSERT INTO public.dependant_data VALUES (1357, false, '2025-03-21', 2025, 'Wife', 1357, 625);
INSERT INTO public.dependant_data VALUES (1358, false, '2025-03-21', 2025, 'Son', 1358, 625);
INSERT INTO public.dependant_data VALUES (1359, false, '2025-03-21', 2025, 'Daughter', 1359, 625);
INSERT INTO public.dependant_data VALUES (1371, false, '2025-03-21', 2025, 'Spouse', 1371, 631);
INSERT INTO public.dependant_data VALUES (1381, false, '2025-03-21', 2025, 'Daughter', 1381, 638);
INSERT INTO public.dependant_data VALUES (1383, false, '2025-03-21', 2025, 'Wife', 1383, 638);
INSERT INTO public.dependant_data VALUES (1385, false, '2025-03-21', 2025, 'Son', 1385, 638);
INSERT INTO public.dependant_data VALUES (1393, false, '2025-03-21', 2025, 'Son', 1393, 643);
INSERT INTO public.dependant_data VALUES (1394, false, '2025-03-21', 2025, 'Wife', 1394, 643);
INSERT INTO public.dependant_data VALUES (1407, false, '2025-03-21', 2025, 'Son', 1405, 649);
INSERT INTO public.dependant_data VALUES (1408, false, '2025-03-21', 2025, 'Wife', 1406, 649);
INSERT INTO public.dependant_data VALUES (1416, false, '2025-03-21', 2025, 'Daughter', 1414, 654);
INSERT INTO public.dependant_data VALUES (1417, false, '2025-03-21', 2025, 'Wife', 1415, 654);
INSERT INTO public.dependant_data VALUES (1423, false, '2025-03-21', 2025, 'Mother', 1421, 659);
INSERT INTO public.dependant_data VALUES (1425, false, '2025-03-21', 2025, 'Father', 1424, 659);
INSERT INTO public.dependant_data VALUES (1434, false, '2025-03-21', 2025, 'Father', 1432, 666);
INSERT INTO public.dependant_data VALUES (1435, false, '2025-03-21', 2025, 'Mother', 1433, 666);
INSERT INTO public.dependant_data VALUES (1484, false, '2025-03-21', 2025, 'Mother', 1481, 696);
INSERT INTO public.dependant_data VALUES (1485, false, '2025-03-21', 2025, 'Father', 1482, 696);
INSERT INTO public.dependant_data VALUES (1491, false, '2025-03-21', 2025, NULL, 1488, 699);
INSERT INTO public.dependant_data VALUES (1492, false, '2025-03-21', 2025, NULL, 1489, 699);
INSERT INTO public.dependant_data VALUES (1497, false, '2025-03-21', 2025, 'Husband', 1494, 702);
INSERT INTO public.dependant_data VALUES (1498, false, '2025-03-21', 2025, 'Son', 1495, 702);
INSERT INTO public.dependant_data VALUES (1499, false, '2025-03-21', 2025, 'Son', 1496, 702);
INSERT INTO public.dependant_data VALUES (1515, false, '2025-03-21', 2025, 'Son', 1512, 713);
INSERT INTO public.dependant_data VALUES (1516, false, '2025-03-21', 2025, 'Wife', 1513, 713);
INSERT INTO public.dependant_data VALUES (1526, false, '2025-03-21', 2025, 'Husband', 1523, 719);
INSERT INTO public.dependant_data VALUES (1527, false, '2025-03-21', 2025, NULL, 1524, 719);
INSERT INTO public.dependant_data VALUES (1535, false, '2025-03-21', 2025, 'Wife', 1532, 725);
INSERT INTO public.dependant_data VALUES (1536, false, '2025-03-21', 2025, 'Daughter', 1534, 725);
INSERT INTO public.dependant_data VALUES (1538, false, '2025-03-21', 2025, 'Son', 1535, 725);
INSERT INTO public.dependant_data VALUES (1549, false, '2025-03-21', 2025, 'Son', 1546, 732);
INSERT INTO public.dependant_data VALUES (1550, false, '2025-03-21', 2025, 'Wife', 1547, 732);
INSERT INTO public.dependant_data VALUES (1564, false, '2025-03-21', 2025, 'Husband', 1561, 737);
INSERT INTO public.dependant_data VALUES (1565, false, '2025-03-21', 2025, NULL, 1562, 737);
INSERT INTO public.dependant_data VALUES (1566, false, '2025-03-21', 2025, NULL, 1563, 737);
INSERT INTO public.dependant_data VALUES (1581, false, '2025-03-21', 2025, 'Husband', 1577, 743);
INSERT INTO public.dependant_data VALUES (1588, false, '2025-03-21', 2025, 'Daughter', 1584, 746);
INSERT INTO public.dependant_data VALUES (1590, false, '2025-03-21', 2025, 'Wife', 1586, 746);
INSERT INTO public.dependant_data VALUES (1596, false, '2025-03-21', 2025, 'Mother', 1592, 750);
INSERT INTO public.dependant_data VALUES (1597, false, '2025-03-21', 2025, 'Father', 1593, 750);
INSERT INTO public.dependant_data VALUES (1606, false, '2025-03-21', 2025, 'Wife', 1602, 757);
INSERT INTO public.dependant_data VALUES (1614, false, '2025-03-21', 2025, 'Daughter', 1610, 762);
INSERT INTO public.dependant_data VALUES (1615, false, '2025-03-21', 2025, 'Husband', 1611, 762);
INSERT INTO public.dependant_data VALUES (1625, false, '2025-03-21', 2025, 'Daughter', 1621, 768);
INSERT INTO public.dependant_data VALUES (1626, false, '2025-03-21', 2025, 'Husband', 1622, 768);
INSERT INTO public.dependant_data VALUES (1015, false, '2025-03-21', 2025, 'Son', 1015, 456);
INSERT INTO public.dependant_data VALUES (1016, false, '2025-03-21', 2025, 'Wife', 1016, 456);
INSERT INTO public.dependant_data VALUES (1026, false, '2025-03-21', 2025, 'Son', 1026, 461);
INSERT INTO public.dependant_data VALUES (1027, false, '2025-03-21', 2025, 'Husband', 1027, 461);
INSERT INTO public.dependant_data VALUES (1028, false, '2025-03-21', 2025, 'Son', 1028, 461);
INSERT INTO public.dependant_data VALUES (1029, false, '2025-03-21', 2025, 'Wife', 1029, 461);
INSERT INTO public.dependant_data VALUES (1030, false, '2025-03-21', 2025, 'Son', 1030, 461);
INSERT INTO public.dependant_data VALUES (1031, false, '2025-03-21', 2025, 'Son', 1031, 461);
INSERT INTO public.dependant_data VALUES (1039, false, '2025-03-21', 2025, 'Daughter', 1039, 466);
INSERT INTO public.dependant_data VALUES (1040, false, '2025-03-21', 2025, 'Daughter', 1040, 466);
INSERT INTO public.dependant_data VALUES (1041, false, '2025-03-21', 2025, 'Son', 1041, 466);
INSERT INTO public.dependant_data VALUES (1042, false, '2025-03-21', 2025, 'Wife', 1042, 466);
INSERT INTO public.dependant_data VALUES (1058, false, '2025-03-21', 2025, 'Daughter', 1058, 473);
INSERT INTO public.dependant_data VALUES (1060, false, '2025-03-21', 2025, 'Daughter', 1060, 473);
INSERT INTO public.dependant_data VALUES (1083, false, '2025-03-21', 2025, 'Son', 1083, 484);
INSERT INTO public.dependant_data VALUES (1112, false, '2025-03-21', 2025, NULL, 1112, 496);
INSERT INTO public.dependant_data VALUES (1124, false, '2025-03-21', 2025, 'Son', 1124, 502);
INSERT INTO public.dependant_data VALUES (1125, false, '2025-03-21', 2025, 'Wife', 1125, 502);
INSERT INTO public.dependant_data VALUES (1126, false, '2025-03-21', 2025, 'Daughter', 1126, 502);
INSERT INTO public.dependant_data VALUES (1138, false, '2025-03-21', 2025, 'Father', 1138, 510);
INSERT INTO public.dependant_data VALUES (1139, false, '2025-03-21', 2025, 'Mother', 1139, 510);
INSERT INTO public.dependant_data VALUES (1147, false, '2025-03-21', 2025, 'Husband', 1147, 515);
INSERT INTO public.dependant_data VALUES (1151, false, '2025-03-21', 2025, 'Daughter', 1151, 518);
INSERT INTO public.dependant_data VALUES (1153, false, '2025-03-21', 2025, 'Son', 1153, 518);
INSERT INTO public.dependant_data VALUES (1154, false, '2025-03-21', 2025, 'Husband', 1154, 518);
INSERT INTO public.dependant_data VALUES (1173, false, '2025-03-21', 2025, 'Daughter', 1173, 526);
INSERT INTO public.dependant_data VALUES (1174, false, '2025-03-21', 2025, 'Husband', 1174, 526);
INSERT INTO public.dependant_data VALUES (1188, false, '2025-03-21', 2025, 'Son', 1188, 533);
INSERT INTO public.dependant_data VALUES (1189, false, '2025-03-21', 2025, 'Wife', 1189, 533);
INSERT INTO public.dependant_data VALUES (1190, false, '2025-03-21', 2025, 'Son', 1190, 533);
INSERT INTO public.dependant_data VALUES (1200, false, '2025-03-21', 2025, 'Son', 1200, 539);
INSERT INTO public.dependant_data VALUES (1201, false, '2025-03-21', 2025, 'Son', 1201, 539);
INSERT INTO public.dependant_data VALUES (1202, false, '2025-03-21', 2025, 'Husband', 1202, 539);
INSERT INTO public.dependant_data VALUES (1221, false, '2025-03-21', 2025, 'Daughter', 1221, 547);
INSERT INTO public.dependant_data VALUES (1223, false, '2025-03-21', 2025, 'Husband', 1223, 547);
INSERT INTO public.dependant_data VALUES (1225, false, '2025-03-21', 2025, 'Daughter', 1225, 547);
INSERT INTO public.dependant_data VALUES (1233, false, '2025-03-21', 2025, 'Daughter', 1233, 551);
INSERT INTO public.dependant_data VALUES (1234, false, '2025-03-21', 2025, 'Wife', 1234, 551);
INSERT INTO public.dependant_data VALUES (1244, false, '2025-03-21', 2025, 'Wife', 1244, 558);
INSERT INTO public.dependant_data VALUES (1258, false, '2025-03-21', 2025, 'Son', 1258, 565);
INSERT INTO public.dependant_data VALUES (1259, false, '2025-03-21', 2025, 'Husband', 1259, 565);
INSERT INTO public.dependant_data VALUES (1266, false, '2025-03-21', 2025, 'Father', 1266, 570);
INSERT INTO public.dependant_data VALUES (1273, false, '2025-03-21', 2025, 'Father', 1273, 576);
INSERT INTO public.dependant_data VALUES (1274, false, '2025-03-21', 2025, 'Mother', 1274, 576);
INSERT INTO public.dependant_data VALUES (1283, false, '2025-03-21', 2025, 'Wife', 1283, 582);
INSERT INTO public.dependant_data VALUES (1294, false, '2025-03-21', 2025, 'Mother', 1294, 590);
INSERT INTO public.dependant_data VALUES (1305, false, '2025-03-21', 2025, 'Wife', 1305, 596);
INSERT INTO public.dependant_data VALUES (1326, false, '2025-03-21', 2025, 'Husband', 1326, 604);
INSERT INTO public.dependant_data VALUES (1327, false, '2025-03-21', 2025, 'Son', 1327, 604);
INSERT INTO public.dependant_data VALUES (1334, false, '2025-03-21', 2025, 'Daughter', 1334, 610);
INSERT INTO public.dependant_data VALUES (1335, false, '2025-03-21', 2025, 'Wife', 1335, 610);
INSERT INTO public.dependant_data VALUES (1343, false, '2025-03-21', 2025, 'Son', 1343, 616);
INSERT INTO public.dependant_data VALUES (1344, false, '2025-03-21', 2025, 'Wife', 1344, 616);
INSERT INTO public.dependant_data VALUES (1352, false, '2025-03-21', 2025, 'Mother', 1352, 622);
INSERT INTO public.dependant_data VALUES (1363, false, '2025-03-21', 2025, 'Son', 1363, 627);
INSERT INTO public.dependant_data VALUES (1365, false, '2025-03-21', 2025, 'Son', 1365, 627);
INSERT INTO public.dependant_data VALUES (1367, false, '2025-03-21', 2025, 'Son', 1367, 627);
INSERT INTO public.dependant_data VALUES (1373, false, '2025-03-21', 2025, 'Wife', 1373, 633);
INSERT INTO public.dependant_data VALUES (1386, false, '2025-03-21', 2025, 'Wife', 1386, 639);
INSERT INTO public.dependant_data VALUES (1387, false, '2025-03-21', 2025, 'Daughter', 1387, 639);
INSERT INTO public.dependant_data VALUES (1388, false, '2025-03-21', 2025, 'Daughter', 1388, 639);
INSERT INTO public.dependant_data VALUES (1398, false, '2025-03-21', 2025, 'Son', 1398, 646);
INSERT INTO public.dependant_data VALUES (1399, false, '2025-03-21', 2025, 'Son', 1399, 646);
INSERT INTO public.dependant_data VALUES (1400, false, '2025-03-21', 2025, 'Wife', 1400, 646);
INSERT INTO public.dependant_data VALUES (1412, false, '2025-03-21', 2025, 'Husband', 1410, 652);
INSERT INTO public.dependant_data VALUES (1422, false, '2025-03-21', 2025, 'Mother', 1420, 658);
INSERT INTO public.dependant_data VALUES (1428, false, '2025-03-21', 2025, 'Son', 1426, 664);
INSERT INTO public.dependant_data VALUES (1429, false, '2025-03-21', 2025, 'Husband', 1427, 664);
INSERT INTO public.dependant_data VALUES (1430, false, '2025-03-21', 2025, 'Son', 1428, 664);
INSERT INTO public.dependant_data VALUES (1442, false, '2025-03-21', 2025, 'Father', 1440, 672);
INSERT INTO public.dependant_data VALUES (1443, false, '2025-03-21', 2025, 'Mother', 1441, 672);
INSERT INTO public.dependant_data VALUES (1453, false, '2025-03-21', 2025, 'Son', 1450, 676);
INSERT INTO public.dependant_data VALUES (1454, false, '2025-03-21', 2025, 'Wife', 1451, 676);
INSERT INTO public.dependant_data VALUES (1460, false, '2025-03-21', 2025, 'Wife', 1457, 680);
INSERT INTO public.dependant_data VALUES (1467, false, '2025-03-21', 2025, 'Mother', 1464, 684);
INSERT INTO public.dependant_data VALUES (1476, false, '2025-03-21', 2025, 'Father', 1473, 689);
INSERT INTO public.dependant_data VALUES (1477, false, '2025-03-21', 2025, 'Mother', 1474, 689);
INSERT INTO public.dependant_data VALUES (1483, false, '2025-03-21', 2025, 'Husband', 1480, 693);
INSERT INTO public.dependant_data VALUES (1489, false, '2025-03-21', 2025, 'Mother', 1486, 698);
INSERT INTO public.dependant_data VALUES (1490, false, '2025-03-21', 2025, 'Father', 1487, 698);
INSERT INTO public.dependant_data VALUES (1495, false, '2025-03-21', 2025, 'Wife', 1492, 701);
INSERT INTO public.dependant_data VALUES (1496, false, '2025-03-21', 2025, 'Son', 1493, 701);
INSERT INTO public.dependant_data VALUES (1504, false, '2025-03-21', 2025, NULL, 1501, 705);
INSERT INTO public.dependant_data VALUES (1510, false, '2025-03-21', 2025, 'Daughter', 1507, 710);
INSERT INTO public.dependant_data VALUES (1511, false, '2025-03-21', 2025, 'Wife', 1508, 710);
INSERT INTO public.dependant_data VALUES (1524, false, '2025-03-21', 2025, 'Mother', 1521, 717);
INSERT INTO public.dependant_data VALUES (1533, false, '2025-03-21', 2025, 'Husband', 1530, 723);
INSERT INTO public.dependant_data VALUES (1545, false, '2025-03-21', 2025, 'son', 1542, 729);
INSERT INTO public.dependant_data VALUES (1546, false, '2025-03-21', 2025, 'Daughter', 1543, 729);
INSERT INTO public.dependant_data VALUES (1547, false, '2025-03-21', 2025, 'Husband', 1544, 729);
INSERT INTO public.dependant_data VALUES (1548, false, '2025-03-21', 2025, 'Son', 1545, 729);
INSERT INTO public.dependant_data VALUES (1558, false, '2025-03-21', 2025, 'Father', 1555, 735);
INSERT INTO public.dependant_data VALUES (1559, false, '2025-03-21', 2025, 'Mother', 1556, 735);
INSERT INTO public.dependant_data VALUES (1580, false, '2025-03-21', 2025, 'Father', 1576, 684);
INSERT INTO public.dependant_data VALUES (1592, false, '2025-03-21', 2025, 'Husband', 1588, 748);
INSERT INTO public.dependant_data VALUES (1593, false, '2025-03-21', 2025, 'Daughter', 1589, 748);
INSERT INTO public.dependant_data VALUES (1604, false, '2025-03-21', 2025, 'Son', 1599, 756);
INSERT INTO public.dependant_data VALUES (1605, false, '2025-03-21', 2025, 'Wife', 1601, 756);
INSERT INTO public.dependant_data VALUES (1607, false, '2025-03-21', 2025, 'Mother', 1603, 621);
INSERT INTO public.dependant_data VALUES (1608, false, '2025-03-21', 2025, 'Hisband', 1604, 621);
INSERT INTO public.dependant_data VALUES (1609, false, '2025-03-21', 2025, NULL, 1605, 621);
INSERT INTO public.dependant_data VALUES (1623, false, '2025-03-21', 2025, 'Mother', 1619, 766);
INSERT INTO public.dependant_data VALUES (1624, false, '2025-03-21', 2025, 'Father', 1620, 766);
INSERT INTO public.dependant_data VALUES (1021, false, '2025-03-21', 2025, 'Wife', 1021, 459);
INSERT INTO public.dependant_data VALUES (1022, false, '2025-03-21', 2025, 'Daughter', 1022, 459);
INSERT INTO public.dependant_data VALUES (1023, false, '2025-03-21', 2025, 'Son', 1023, 459);
INSERT INTO public.dependant_data VALUES (1035, false, '2025-03-21', 2025, 'Husband', 1035, 464);
INSERT INTO public.dependant_data VALUES (1036, false, '2025-03-21', 2025, 'Daughter', 1036, 464);
INSERT INTO public.dependant_data VALUES (1053, false, '2025-03-21', 2025, 'Husband', 1053, 470);
INSERT INTO public.dependant_data VALUES (1054, false, '2025-03-21', 2025, 'Son', 1054, 470);
INSERT INTO public.dependant_data VALUES (1062, false, '2025-03-21', 2025, 'Husband', 1062, 475);
INSERT INTO public.dependant_data VALUES (1063, false, '2025-03-21', 2025, 'Son', 1063, 475);
INSERT INTO public.dependant_data VALUES (1073, false, '2025-03-21', 2025, 'Daughter', 1073, 481);
INSERT INTO public.dependant_data VALUES (1075, false, '2025-03-21', 2025, 'Daughter', 1075, 481);
INSERT INTO public.dependant_data VALUES (1078, false, '2025-03-21', 2025, 'Husband', 1078, 481);
INSERT INTO public.dependant_data VALUES (1081, false, '2025-03-21', 2025, 'Son', 1081, 481);
INSERT INTO public.dependant_data VALUES (1092, false, '2025-03-21', 2025, 'Wife', 1092, 488);
INSERT INTO public.dependant_data VALUES (1094, false, '2025-03-21', 2025, 'Daughter', 1094, 488);
INSERT INTO public.dependant_data VALUES (1096, false, '2025-03-21', 2025, 'Son', 1095, 488);
INSERT INTO public.dependant_data VALUES (1107, false, '2025-03-21', 2025, 'Daughter', 1107, 495);
INSERT INTO public.dependant_data VALUES (1108, false, '2025-03-21', 2025, 'Son', 1108, 495);
INSERT INTO public.dependant_data VALUES (1109, false, '2025-03-21', 2025, 'Son', 1109, 495);
INSERT INTO public.dependant_data VALUES (1110, false, '2025-03-21', 2025, 'Son', 1110, 495);
INSERT INTO public.dependant_data VALUES (1111, false, '2025-03-21', 2025, 'Wife', 1111, 495);
INSERT INTO public.dependant_data VALUES (1116, false, '2025-03-21', 2025, 'Son', 1116, 499);
INSERT INTO public.dependant_data VALUES (1118, false, '2025-03-21', 2025, 'Wife', 1118, 499);
INSERT INTO public.dependant_data VALUES (1129, false, '2025-03-21', 2025, 'Son', 1130, 504);
INSERT INTO public.dependant_data VALUES (1131, false, '2025-03-21', 2025, 'Husband', 1132, 504);
INSERT INTO public.dependant_data VALUES (1148, false, '2025-03-21', 2025, 'Mother', 1148, 516);
INSERT INTO public.dependant_data VALUES (1158, false, '2025-03-21', 2025, 'Wife', 1158, 520);
INSERT INTO public.dependant_data VALUES (1159, false, '2025-03-21', 2025, 'Son', 1159, 520);
INSERT INTO public.dependant_data VALUES (1177, false, '2025-03-21', 2025, 'Husband', 1177, 528);
INSERT INTO public.dependant_data VALUES (1178, false, '2025-03-21', 2025, 'Daughter', 1178, 528);
INSERT INTO public.dependant_data VALUES (1191, false, '2025-03-21', 2025, 'Father', 1191, 534);
INSERT INTO public.dependant_data VALUES (1192, false, '2025-03-21', 2025, 'Mother', 1192, 534);
INSERT INTO public.dependant_data VALUES (1203, false, '2025-03-21', 2025, 'Wife', 1203, 540);
INSERT INTO public.dependant_data VALUES (1226, false, '2025-03-21', 2025, 'Spouse', 1226, 548);
INSERT INTO public.dependant_data VALUES (1235, false, '2025-03-21', 2025, 'Mother', 1235, 552);
INSERT INTO public.dependant_data VALUES (1246, false, '2025-03-21', 2025, 'Daughter', 1246, 559);
INSERT INTO public.dependant_data VALUES (1247, false, '2025-03-21', 2025, 'Wife', 1247, 559);
INSERT INTO public.dependant_data VALUES (1256, false, '2025-03-21', 2025, 'Wife', 1256, 564);
INSERT INTO public.dependant_data VALUES (1257, false, '2025-03-21', 2025, 'son', 1257, 564);
INSERT INTO public.dependant_data VALUES (1267, false, '2025-03-21', 2025, 'Husband', 1267, 571);
INSERT INTO public.dependant_data VALUES (1275, false, '2025-03-21', 2025, 'Husband', 1275, 577);
INSERT INTO public.dependant_data VALUES (1276, false, '2025-03-21', 2025, 'Daughter', 1276, 577);
INSERT INTO public.dependant_data VALUES (1287, false, '2025-03-21', 2025, 'Wife', 1287, 585);
INSERT INTO public.dependant_data VALUES (1295, false, '2025-03-21', 2025, 'Husband', 1295, 591);
INSERT INTO public.dependant_data VALUES (1308, false, '2025-03-21', 2025, 'Husband', 1308, 599);
INSERT INTO public.dependant_data VALUES (1317, false, '2025-03-21', 2025, 'Daughter', 1317, 602);
INSERT INTO public.dependant_data VALUES (1319, false, '2025-03-21', 2025, 'son', 1319, 602);
INSERT INTO public.dependant_data VALUES (1320, false, '2025-03-21', 2025, 'Husband', 1320, 602);
INSERT INTO public.dependant_data VALUES (1322, false, '2025-03-21', 2025, 'son', 1322, 602);
INSERT INTO public.dependant_data VALUES (1324, false, '2025-03-21', 2025, 'Daughter', 1324, 602);
INSERT INTO public.dependant_data VALUES (1333, false, '2025-03-21', 2025, 'Wife', 1333, 609);
INSERT INTO public.dependant_data VALUES (1341, false, '2025-03-21', 2025, 'Mother', 1341, 615);
INSERT INTO public.dependant_data VALUES (1342, false, '2025-03-21', 2025, 'Father', 1342, 615);
INSERT INTO public.dependant_data VALUES (1351, false, '2025-03-21', 2025, 'Mother', 1351, 621);
INSERT INTO public.dependant_data VALUES (1364, false, '2025-03-21', 2025, 'Wife', 1364, 628);
INSERT INTO public.dependant_data VALUES (1366, false, '2025-03-21', 2025, 'Son', 1366, 628);
INSERT INTO public.dependant_data VALUES (1374, false, '2025-03-21', 2025, 'Wife', 1374, 634);
INSERT INTO public.dependant_data VALUES (1375, false, '2025-03-21', 2025, 'Son', 1375, 634);
INSERT INTO public.dependant_data VALUES (1389, false, '2025-03-21', 2025, 'Husband', 1389, 640);
INSERT INTO public.dependant_data VALUES (1397, false, '2025-03-21', 2025, 'Wife', 1397, 645);
INSERT INTO public.dependant_data VALUES (1410, false, '2025-03-21', 2025, NULL, 1408, 651);
INSERT INTO public.dependant_data VALUES (1421, false, '2025-03-21', 2025, 'Father', 1419, 657);
INSERT INTO public.dependant_data VALUES (1439, false, '2025-03-21', 2025, 'Daughter', 1437, 668);
INSERT INTO public.dependant_data VALUES (1440, false, '2025-03-21', 2025, 'Son', 1438, 668);
INSERT INTO public.dependant_data VALUES (1441, false, '2025-03-21', 2025, 'Wife', 1439, 668);
INSERT INTO public.dependant_data VALUES (1448, false, '2025-03-21', 2025, 'Mother', 1445, 674);
INSERT INTO public.dependant_data VALUES (1458, false, '2025-03-21', 2025, 'Wife', 1455, 678);
INSERT INTO public.dependant_data VALUES (1459, false, '2025-03-21', 2025, 'Daughter', 1456, 678);
INSERT INTO public.dependant_data VALUES (1462, false, '2025-03-21', 2025, 'Son', 1459, 682);
INSERT INTO public.dependant_data VALUES (1463, false, '2025-03-21', 2025, 'Spose', 1460, 682);
INSERT INTO public.dependant_data VALUES (1471, false, '2025-03-21', 2025, 'Mother', 1468, 687);
INSERT INTO public.dependant_data VALUES (1472, false, '2025-03-21', 2025, 'Father', 1469, 687);
INSERT INTO public.dependant_data VALUES (1482, false, '2025-03-21', 2025, 'Husband ', 1479, 691);
INSERT INTO public.dependant_data VALUES (1507, false, '2025-03-21', 2025, 'Husband', 1504, 708);
INSERT INTO public.dependant_data VALUES (1508, false, '2025-03-21', 2025, 'Son', 1505, 708);
INSERT INTO public.dependant_data VALUES (1520, false, '2025-03-21', 2025, 'Son', 1517, 715);
INSERT INTO public.dependant_data VALUES (1521, false, '2025-03-21', 2025, 'Wife', 1518, 715);
INSERT INTO public.dependant_data VALUES (1522, false, '2025-03-21', 2025, 'Son', 1519, 715);
INSERT INTO public.dependant_data VALUES (1528, false, '2025-03-21', 2025, 'Mother', 1525, 720);
INSERT INTO public.dependant_data VALUES (1537, false, '2025-03-21', 2025, 'Wife', 1533, 726);
INSERT INTO public.dependant_data VALUES (1539, false, '2025-03-21', 2025, 'Son', 1536, 726);
INSERT INTO public.dependant_data VALUES (1540, false, '2025-03-21', 2025, 'Son', 1537, 726);
INSERT INTO public.dependant_data VALUES (1555, false, '2025-03-21', 2025, 'Wife', 1552, 734);
INSERT INTO public.dependant_data VALUES (1556, false, '2025-03-21', 2025, 'Son', 1553, 734);
INSERT INTO public.dependant_data VALUES (1557, false, '2025-03-21', 2025, 'Son', 1554, 734);
INSERT INTO public.dependant_data VALUES (1568, false, '2025-03-21', 2025, 'Mother', 291, 739);
INSERT INTO public.dependant_data VALUES (1570, false, '2025-03-21', 2025, 'Fathner', 1566, 739);
INSERT INTO public.dependant_data VALUES (1574, false, '2025-03-21', 2025, 'Daughter', 1570, 741);
INSERT INTO public.dependant_data VALUES (1575, false, '2025-03-21', 2025, 'Husband', 1571, 741);
INSERT INTO public.dependant_data VALUES (1576, false, '2025-03-21', 2025, 'Son', 1572, 741);
INSERT INTO public.dependant_data VALUES (1583, false, '2025-03-21', 2025, 'Son', 1579, 103);
INSERT INTO public.dependant_data VALUES (1584, false, '2025-03-21', 2025, 'Wife', 1580, 103);
INSERT INTO public.dependant_data VALUES (1585, false, '2025-03-21', 2025, 'Son', 1581, 103);
INSERT INTO public.dependant_data VALUES (1586, false, '2025-03-21', 2025, 'Daughter', 1582, 103);
INSERT INTO public.dependant_data VALUES (1598, false, '2025-03-21', 2025, 'Mother', 1594, 752);
INSERT INTO public.dependant_data VALUES (1599, false, '2025-03-21', 2025, 'Father', 1595, 752);
INSERT INTO public.dependant_data VALUES (1616, false, '2025-03-21', 2025, 'Husband', 1612, 763);


--
-- Data for Name: hr; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member VALUES (1, '', 'Married', '', false, 'General Administration Division', 'SSMA', '1966-11-18', '', '339', NULL, 'DAL Perera', '196682300490', 'user339', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (2, '', 'Married', '', false, 'Department of Botany', 'Professor', '1968-08-11', '', '1009', NULL, 'Dr. HLD Weerahewa', '687240553V', 'user1009', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (3, '', 'Unmarried', '', false, 'Maintenance Division', 'Painter II', '1985-06-28', '', '3885', NULL, 'GS Maduranga', '198518004315', 'user3885', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (4, '', 'Married', '', false, 'Colombo Regional Centre', 'Management Assistant', '1988-04-08', '', '1696', NULL, 'SJK Kodithuwakku', '1988599000282', 'user1696', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (5, '', 'Married', '', false, 'Maintenance Division', 'Supervisor ', '1992-08-17', '', '2604', NULL, 'BSR Balasooriya', '922300615V', 'user2604', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (6, '', 'Married', '', false, 'Colombo Regional Centre', 'Management Assistant', '1984-03-29', '', '1695', NULL, 'TC Wickramaarachchi', '845890129V', 'user1695', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (7, '', 'Married', '', false, 'Finance Division', 'Management Assistant', '1992-07-29', '', '2570', NULL, 'CS Wanniarachchi', '927111241V', 'user2570', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (8, '', 'Married', '', false, 'Finance Division (CRC)', 'Management Assistant', '1990-09-13', '', '1976', NULL, 'BGRU Wimalarathna', '907571670V', 'user1976', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (9, '', 'Married', '', false, 'Finance Division', 'Senior Staff Management Assistant', '1965-06-20', '', '421', NULL, 'KS Karunanayake', '656723599V', 'user421', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (10, '', 'Married', '', false, 'Department of Computer Science', 'Assistant Network Manager', '1980-11-21', '', '786', NULL, 'JPP Tharanga', '803261024V', 'user786', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (11, '', 'Married', '', false, 'Department of Zoology', 'Works Aide', '1980-08-26', '', '3386', NULL, 'BGI Cooray', '802394705V', 'user3386', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (12, '', 'Married', '', false, 'Operations Division', 'Senior Staff Management Assistant', '1966-07-27', '', '473', NULL, 'LHNP De Silva', '667090768V', 'user473', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (13, '', 'Married', '', false, 'Operations Division', 'Director/ Operations', '1975-01-29', '', '3158', NULL, 'BMP Somarathna', '750291686V', 'user3158', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (14, '', 'Married', '', false, 'Academic Establishment', 'Srnior Assistant Registrar', '1973-01-30', '', '1477', NULL, 'GS Amarathunga', '197353001713', 'user1477', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (15, '', 'Married', '', false, 'Supplies Division', 'Senior Staff Management Assistant', '1971-03-29', '', '345', NULL, 'AGKLS Jayarathna', '715890020V', 'user345', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (16, '', 'Unmarried', '', false, 'Supplies Division', 'Management Assistant', '1988-08-13', '', '2198', NULL, 'BMGA Dilrukshini', '887262977V', 'user2198', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (17, '', 'Married', '', false, 'Maintenance Division', 'Works Aide', '1978-02-18', '', '3608', NULL, 'RADJ Mahesh', '780492732V', 'user3608', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (18, '', 'Married', '', false, 'Examination Division', 'Management Assistant', '1985-02-18', '', '1279', NULL, 'HAM Sameera', '850930355V', 'user1279', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (19, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', 'Lab Assistant', '1982-10-28', '', '1922', NULL, 'AMGAM Sisirasena', '823024274V', 'user1922', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (20, '', 'Married', '', false, 'Department of Zoology', 'Senior Lecturer', '1978-09-15', '', '2717', NULL, 'Dr. DDGL Dahanayaka', '782593536V', 'user2717', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (21, '', 'Unmarried', '', false, 'Department of Zoology', 'Senior Professor', '1963-05-17', '', '88', NULL, 'Prof. GRR Ranawaka', '196363801217', 'user88', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (22, '', 'Married', '', false, 'Kaluthara Study Centre', 'Assistant Director', '1985-07-05', '', '2035', NULL, 'YMC Nisansala', '856870952V', 'user2035', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (23, '', 'Married', '', false, 'Kaluthara Study Centre', 'Management Assistant', '1988-05-06', '', '2793', NULL, 'KKDK Indrarathna', '886273134V', 'user2793', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (24, '', 'Married', '', false, 'Kaluthara Study Centre', 'Management Assistant', '1992-12-08', '', '2791', NULL, 'LPG Hansanee', '927252783V', 'user2791', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (25, '', 'Married', '', false, 'Vice Chancellor''s Office', 'Works Aide', '1988-10-17', '', '1067', NULL, 'WAML Wijesinghe', '198829102019', 'user1067', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (26, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Senior Lecturer', '1970-07-23', '', '1341', NULL, 'DDM Ranasinghe', '707052139V', 'user1341', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (27, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Senior Staff Management Assistant', '1967-09-11', '', '491', NULL, 'THY Samanmalee', '677550848V', 'user491', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (28, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Senior Staff Assistant', '1965-03-03', '', '412', NULL, 'DN Lokuge', '196556300872', 'user412', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (29, '', 'Married', '', false, 'Department of Physics', 'Technical Officer', '1979-02-10', '', '2889', NULL, 'MN Dissanayake', '1979041101170', 'user2889', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (30, '', 'Married', '', false, 'Transort & Postal Division', 'Cycle Orderaly', '1974-03-03', '', '433', NULL, 'KSJ Jayakody', '740630989V', 'user433', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (31, '', 'Married', '', false, 'Maintenance Division', 'Works Aide', '1989-09-24', '', '1933', NULL, 'RCS Karunasena', '892680060v', 'user1933', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (32, '', 'Unmarried', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1977-11-30', '', '180', NULL, 'HND Gamlath', '778351617V', 'user180', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (33, '', 'Married', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1978-02-27', '', '191', NULL, 'S Hewameealla', '785581628V', 'user191', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (34, '', 'Unmarried', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1987-12-12', '', '2050', NULL, 'WD Manoj', '198734702740', 'user2050', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (35, '', 'Unmarried', '', false, 'Department Of Legal Studies', 'Lecturer (P)', '1990-12-24', '', '3476', NULL, 'WGTY Thilakarathna', '908590791V', 'user3476', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (36, '', 'Unmarried', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1986-06-23', '', '1759', NULL, 'S Janaka', '866751781V', 'user1759', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (37, '', 'Unmarried', '', false, 'Department Of Legal Studies', 'Lecturer (P)', '1989-01-23', '', '2589', NULL, 'RL Perera', '19890230184', 'user2589', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (39, '', 'Married', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1969-11-04', '', '804', NULL, 'WNG Panditharathne', '698092157V', 'user804', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (38, '', 'Married', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1984-01-26', '', '1512', NULL, 'MKG Jeewanthi', '845260770V', 'user1512', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (40, '', 'Married', '', false, 'Department Of Legal Studies', 'Senior Management Assistant', '1969-11-17', '', '416', NULL, 'PMA Subhashini', '196982200082', 'user416', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (41, '', 'Married', '', false, 'Department Of Legal Studies', 'Lecturer (Grade II)', '1988-08-19', '', '2043', NULL, 'BARR Ariyarathna', '887320837V', 'user2043', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (42, '', 'Married', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1978-10-09', '', '768', NULL, 'HN Damayanthi', '197878302415V', 'user768', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (43, '', 'Married', '', false, 'Dean''s Office - Faculty of HHS', 'Senior Staff Management Assistant', '1966-04-11', '', '951', NULL, 'RAA Deepthi', '666022335V', 'user951', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (44, '', 'Married', '', false, 'Department Of Legal Studies', 'Works Aide', '1978-10-20', '', '1975', NULL, 'RGRU Kumara', '782941208V', 'user1975', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (45, '', 'Married', '', false, 'Information Technology Division', 'Computer Operator II', '1986-06-28', '', '778', NULL, 'HKJNK Perera', '861802736V', 'user778', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (46, '', 'Married', '', false, 'Colombo Regional Centre', 'Driver', '1977-03-04', '', '2981', NULL, 'SN Rajapaksha', '197706401535', 'user2981', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (47, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '1978-09-24', '', '2466', NULL, 'DT Abeysinghe', '787680747V', 'user2466', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (48, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', 'Lecturer', '1973-01-30', '', '552', NULL, 'TPGNT Alwis', '735301519V', 'user552', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (49, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', 'Management Assistant', '1974-07-22', '', '576', NULL, 'BVK Perera', '747041873V', 'user576', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (54, '', 'Married', '', false, 'Maintenance Division', 'Management Assistant', '1972-11-21', '', '1281', NULL, 'KVDN Pushpakumara', '723263484V', 'user1281', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (59, '', 'Married', '', false, 'Supplies Division', 'Works Aide', '1982-03-19', '', '2640', NULL, 'PGSC Rajamanthri', '820792459V', 'user2640', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (69, '', 'Unmarried', '', false, 'Transort & Postal Division', 'Driver', '1985-09-01', '', '2842', NULL, 'SC Sampath', '852451882V', 'user2842', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (75, '', 'Married', '', false, 'Library', 'Library Information Assistant', '1994-08-04', '', '2956', NULL, 'GRMTNK Rathnayake', '947171372V', 'user2956', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (81, '', 'Married', '', false, 'Library', 'Lib. Inf. Assistant', '1991-09-13', '', '2954', NULL, 'P Roshanth', '912570410V', 'user2954', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (86, '', 'Married', '', false, 'Library ', 'Senior Assistant Librarian', '1970-09-23', '', '3085', NULL, 'KHT Abeysekara', '707672323V', 'user3085', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (92, '', 'Married', '', false, 'Internal Audit Division', 'Senior Assistant Internal Audit', '1984-07-10', '', '1725', NULL, 'HKRU Ranasinghe', '19846920803V', 'user1725', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (50, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', 'Technical Officer', '1987-04-12', '', '208', NULL, 'NVP Madushan', '871032254V', 'user208', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (56, '', 'Unmarried', '', false, 'Department of Zoology', 'Senior Lecturer', '1962-07-19', '', '82', NULL, 'N Nilakarawasam', '627010958 V', 'user82', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (62, '', 'Married', '', false, 'Management Assistant', 'Management Assistant', '1988-12-24', '', '1283', NULL, 'WDK Hirantha', '883591798V', 'user1283', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (66, '', 'Married', '', false, 'Dep.of Agricultural and Plantation Engineering', 'Technical Officer', '1975-11-24', '', '270', NULL, 'HT Arachchi', '753291857V', 'user270', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (72, '', 'Married', '', false, 'Information Technology Division', 'Deputy Information System Manager', '1978-04-08', '', '2952', NULL, 'KWKBPLM KelaniBandara', '785992051V', 'user2952', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (78, '', 'Married', '', false, 'Library', 'Senior Assistant Registrar', '1971-11-26', '', '2881', NULL, 'KD Wickramarathne', '713310956V', 'user2881', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (84, '', 'Married', '', false, 'Transort & Postal Division', 'Lorry Cleaner', '1970-09-24', '', '285', NULL, 'RMG Kumara', '702684226V', 'user285', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (90, '', 'Unmarried', '', false, 'Library', 'Senior Asst. Laibrariyan', '1970-05-09', '', '43', NULL, 'AHK Balasooriya', '701300122V', 'user43', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (51, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', 'Professor', '1965-08-27', '', '319', NULL, 'CN Herath', '652401880V', 'user319', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (57, '', 'Married', '', false, 'Department of Botany', 'SSMA', '1966-11-29', '', '604', NULL, 'CK Senevirathna', '668342370V', 'user604', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (63, '', 'Married', '', false, 'Transort & Postal Division', 'Driver', '1983-01-07', '', '2979', NULL, 'LI Sooriyakumara', '830071997V', 'user2979', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (71, '', 'Married', '', false, 'Information Technology Division', 'Program Cum Systems Analyst', '1987-04-11', '', '3624', NULL, 'NWAK Shabeena', '876021102V', 'user3624', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (77, '', 'Married', '', false, 'Library', 'Library Information Assistant', '1987-12-13', '', '1958', NULL, 'PGNA Dharmasena', '878481720V', 'user1958', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (83, '', 'Married', '', false, 'Library', 'Library Attendant', '1971-05-09', '', '509', NULL, 'SAI Shyamalee', '716301770V', 'user509', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (88, '', 'Married', '', false, 'Library', 'Senior Staff Assistant', '1974-12-27', '', '414', NULL, 'VSC Mahantheareachchi', '748621628V', 'user414', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (61, '', 'Married', '', false, 'Supplies Division', 'Management Assistant', '1990-01-12', '', '2275', NULL, 'MGVS Dayarathna', '900121091V', 'user2275', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (67, '', 'Unmarried', '', false, 'Dep.of Agricultural and Plantation Engineering', 'Senior Lecturer', '1973-01-17', '', '145', NULL, 'NS Weerakkody', '197301602278', 'user145', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (73, '', 'Married', '', false, 'Information Technology Division', 'Senior Computer Operator', '1968-06-19', '', '702', NULL, 'KG Geeganage', '681710159V', 'user702', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (79, '', 'Unmarried', '', false, 'Library', 'Library Information Assistant', '1989-04-03', '', '2958', NULL, 'Sahan Amarasinghe', '890942725V', 'user2958', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (85, '', 'Married', '', false, 'Library', 'Book Binder', '1969-06-24', '', '281', NULL, 'HHRS Priyantha', '691761983V', 'user281', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (91, '', 'Married', '', false, 'Library', 'Assistant Librarian', '1989-01-24', '', '2652', NULL, 'MMIK Marasinghe', '895242110V', 'user2652', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (53, '', 'Married', '', false, 'Department of Mathematics', 'Senior Lecturer', '1980-02-12', '', '1070', NULL, 'SR Gnanaprayasam', '198004301247', 'user1070', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (60, '', 'Married', '', false, 'Supplies Division', 'Management Assistant', '1993-01-21', '', '2611', NULL, 'HAN Dhanushka', '930210455V', 'user2611', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (65, '', 'Married', '', false, 'Agriculture & Plantation Engineering', 'Lab Attendant', '1977-03-16', '', '564', NULL, 'DHNJ Kumara', '771371159V', 'user564', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (70, '', 'Married', '', false, 'Department of Computer Science', 'Lecturer', '1990-06-24', '', '3555', NULL, 'SAAH Samaraweera', '906761424V', 'user3555', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (76, '', 'Unmarried', '', false, 'Library', 'Library Information Assistant', '1988-01-01', '', '2123', NULL, 'KAV De Costa', '198850103376', 'user2123', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (82, '', 'Married', '', false, 'Library', 'Library Attendant', '1995-05-09', '', '3694', NULL, 'UVUP Madhushanka', '951303259V', 'user3694', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (89, '', 'Unmarried', '', false, 'Press', 'Book Binder', '1977-07-08', '', '2085', NULL, 'WKRD Chandrawansha', '197719003347', 'user2085', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (55, '', 'Married', '', false, 'Department of Zoology', 'Technical Officer', '1981-10-08', '', '1239', NULL, 'KDC Silva', '812824813V', 'user1239', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (58, '', 'Married', '', false, 'Department of Botany', 'Senior Lecturer', '1963-11-28', '', '101', NULL, 'KAJM Kuruppuarachchi', '633330166V', 'user101', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (64, '', 'Married', '', false, 'Transort & Postal Division', 'Lorry Cleaner', '1969-11-07', '', '239', NULL, 'WKPP De Silva', '693121850V', 'user239', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (68, '', 'Married', '', false, 'Dep.of Agricultural and Plantation Engineering', 'Senior Professor', '1960-11-06', '', '823', NULL, 'CS De Silva', '608110437V', 'user823', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (74, '', 'Married', '', false, 'Library', 'Library Attendant', '1968-12-06', '', '286', NULL, 'K Vipula', '683411299V', 'user286', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (80, '', 'Married', '', false, 'Library', 'Book Binder', '1985-07-17', '', '1080', NULL, 'AHGP Wasantha', '851992111V', 'user1080', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (87, '', 'Unmarried', '', false, 'Library', 'Lib. Inf. Assistant', '1992-01-04', '', '2959', NULL, 'WML Feranando', '925043427V', 'user2959', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (93, '', 'Married', '', false, 'Internal Audit Division', 'Audit Assistant', '1982-01-26', '', '1222', NULL, 'KTA Jayawickrama', '820263502V', 'user1222', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (94, '', 'Married', '', false, 'Non Academic Establishment', 'Management Assistant', '1977-02-06', '', '366', NULL, 'KIA Kottage', '775373202V', 'user366', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (95, '', 'Married', '', false, 'Kandy Regional Centre', 'Works Aide', '1970-06-11', '', '1930', NULL, 'DGU Dasanayaka', '701630050V', 'user1930', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (96, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Lecturer (Probationary)', '1986-06-25', '', '3569', NULL, 'RNP Rathnayaka', '866771111V', 'user3569', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (97, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Staff Management Assistant', '1971-03-25', '', '1349', NULL, 'BSM Mendis', '710850151V', 'user1349', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (98, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer Grade I', '1971-01-09', '', '1305', NULL, 'DVM De Silva', '715091267V', 'user1305', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (99, '', 'Unmarried', '', false, 'Department of Secoundary & Tertiary Education', 'Lecturer', '1991-11-18', '', '4012', NULL, 'KAD Sadamali', '918230254V', 'user4012', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (100, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer Grade II', '1978-01-13', '', '165', NULL, 'Sasheeka Karunanayake', '19785132408V', 'user165', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (101, '', 'Unmarried', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer Grade II', '1961-04-22', '', '1326', NULL, 'KGC Kandangama', '616133217V', 'user1326', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (102, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer Grade II', '1974-06-10', '', '189', NULL, 'NMRK Nawarathna', '746622422V', 'user189', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (104, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer', '1978-02-03', '', '1678', NULL, 'WMS Weerakoon', '780343028V', 'user1678', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (105, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer', '1978-02-13', '', '1219', NULL, 'ML Sudarshana', '780441852V', 'user1219', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (106, '', 'Unmarried', '', false, 'Department of Secoundary & Tertiary Education', 'Professor', '1971-03-08', '', '167', NULL, 'FM Nawastheen', '197106801864', 'user167', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (107, '', 'Married', '', false, 'Maintenance Division', 'Works Aide', '1970-04-15', '', '257', NULL, 'RLMN Priyasantha', '701064429V', 'user257', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (108, '', 'Married', '', false, 'Colombo Regional Centre', 'Management Assistant', '1972-05-26', '', '819', NULL, 'HP Tharangani', '726471681V', 'user819', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (109, '', 'Married', '', false, 'Department Of Legal Studies', 'Management Assistant', '1973-03-28', '', '706', NULL, 'LS Perera', '735880870V', 'user706', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (110, '', 'Unmarried', '', false, 'Centre For Environmental Studies and Sustainable Development', 'Management Assistant', '1993-03-11', '', '2991', NULL, 'VGRP Gunarathna', '199357101053', 'user2991', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (111, '', 'Married', '', false, 'Centre For Environmental Studies and Sustainable Development', 'Senior Lecturer', '1986-08-07', '', '3839', NULL, 'MGYL Mahagamage', '862200985V', 'user3839', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (112, '', 'Unmarried', '', false, 'Centre For Environmental Studies and Sustainable Development', 'Senior Lecturer', '1981-05-23', '', '3889', NULL, 'SNCM Dias', '816440106V', 'user3889', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (113, '', 'Unmarried', '', false, 'Department of Chemistry', 'Senior Staff Management Assistant', '1966-07-24', '', '404', NULL, 'ANSP Kurukulasuriya', '667060150V', 'user404', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (114, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '1960-04-29', '', '57', NULL, 'DR Kulathunga', '601201216V', 'user57', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (115, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '1963-08-06', '', '102', NULL, 'C Ranasinghe', '196371900563', 'user102', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (116, '', 'Married', '', false, 'Department of Chemistry', 'Works Aide', '1989-04-20', '', '3613', NULL, 'G.Sahan Aloka', '891113692V', 'user3613', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (117, '', 'Unmarried', '', false, 'Department of Chemistry', 'Staff Technical Officer', '1966-02-14', '', '249', NULL, 'PAW Perera', '196604500882', 'user249', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (118, '', 'Married', '', false, 'Deparment of Legal and Documentation', 'Senoir Assistant Registrar', '1975-05-20', '', '1235', NULL, 'RLW Rajapakse', '197564100121', 'user1235', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (119, '', 'Married', '', false, 'Maintenance Division', 'Carpenter Grade I', '1968-02-21', '', '503', NULL, 'W Ranjith', '196805202154', 'user503', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (120, '', 'Married', '', false, 'Maintenance Division', 'Electrician Grade II', '1976-04-10', '', '194', NULL, 'AAN Adikari', '761070231V', 'user194', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (121, '', 'Married', '', false, 'Transort & Postal Division', 'Driver', '1969-03-04', '', '513', NULL, 'RMA Weerasiri', '690640384V', 'user513', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (122, '', 'Married', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1965-11-05', '', '1000', NULL, 'WDRD Goonarathne', '653204086V', 'user1000', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (123, '', 'Married', '', false, 'Transort & Postal Division', 'Driver Grade II', '1973-04-24', '', '3017', NULL, 'KJS Perera', '731153671V', 'user3017', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (124, '', 'Unmarried', '', false, 'Department of Physics', 'Professor', '1963-07-29', '', '1352', NULL, 'GKR Senadeera', '632110391V', 'user1352', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (125, '', 'Unmarried', '', false, 'Department of Physics', 'Lecturer', '1963-01-21', '', '61', NULL, 'KR Dissanayaka', '635211199V', 'user61', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (126, '', 'Unmarried', '', false, 'Department of Social Studies', 'Lecturer', '1983-08-26', '', '1490', NULL, 'DD Liyanahetti', '198373900796', 'user1490', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (127, '', 'Married', '', false, 'Department of Social Studies', 'Senior Lecturer', '1963-03-24', '', '942', NULL, 'BMP Mendis', '196308400198', 'user942', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (128, '', 'Married', '', false, 'Department of Social Studies', 'Senior Lecturer', '1962-04-25', '', '867', NULL, 'NS Abeysinghe', '621152661V', 'user867', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (129, '', 'Unmarried', '', false, 'Department of Social Studies', 'Lecturer', '1980-10-21', '', '906', NULL, 'GDT Dhamayanthi', '807950010V', 'user906', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (130, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Electrical Engineer', '1970-07-25', '', '15', NULL, 'C Binduhewa', '702070414V', 'user15', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (131, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lab Attendant', '1979-01-16', '', '206', NULL, 'RADS Ranathunga', '197901600770', 'user206', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (132, '', 'Married', '', false, 'Department of Mathematics', 'Senior Lecturer', '1966-01-01', '', '1152', NULL, 'G Nandasena', '660013660V', 'user1152', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (133, '', 'Married', '', false, 'Department of Mathematics', 'Senior Staff Management Assistant', '1968-08-28', '', '402', NULL, 'P Liyanage', '196874100068', 'user402', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (139, '', 'Married', '', false, 'Faculty of Natural Science', 'Management Assistant', '1989-11-02', '', '1700', NULL, 'YSM Pieris', '898072746V', 'user1700', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (145, '', 'Unmarried', '', false, 'Establishment Division', 'Management Assistant', '1994-03-14', '', '4064', NULL, 'GEGDD Karunadasa', '945741384V', 'user4064', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (151, '', 'Unmarried', '', false, 'Establishment Division', 'Senior Staff Management Assistant', '1976-01-16', '', '320', NULL, 'NMK Senanayaka', '765162912V', 'user320', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (156, '', 'Married', '', false, 'Transort & Postal Division', 'Driver', '1970-07-24', '', '701', NULL, 'S Dissanayaka', '197020603990', 'user701', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (162, '', 'Married', '', false, 'Matara Regional Center', 'Assistant Director', '1975-05-06', '', '2038', NULL, 'D Gajamange', '751270364V', 'user2038', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (168, '', 'Married', '', false, 'Transort & Postal Division', 'driver', '1966-07-24', '', '808', NULL, 'R Jagath', '662060909V', 'user808', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (174, '', 'Married', '', false, 'Department of Accounting & Finance', 'Senior Lecturer Grade I', '1964-06-01', '', '763', NULL, 'LPS Gamini', '641532983V', 'user763', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (180, '', 'Married', '', false, 'CETMe', 'Karyala Karya Sahayaka', '1969-04-11', '', '595', NULL, 'UP Weragala', '691020444V', 'user595', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (187, '', 'Married', '', false, 'General Administration Division', 'Works Aide', '1990-08-24', '', '3006', NULL, 'MNI Perera', '199023700161', 'user3006', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (192, '', 'Unmarried', '', false, 'Department of Computer Science', 'Senior Lecturer', '1982-04-04', '', '1189', NULL, 'IDID Ariyasinghe', '825950320V', 'user1189', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (198, '', 'Unmarried', '', false, 'Public Information Division', 'Telephone Operator', '1979-12-25', '', '464', NULL, 'WS Kodithuwakku', '197986003140', 'user464', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (204, '', 'Unmarried', '', false, 'Faculty of Health Science', 'Management Assistant', '1969-06-16', '', '2926', NULL, 'KSA Rajapakse', '196966800612', 'user2926', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (212, '', 'Married', '', false, 'Finance Division', 'Management Assistant', '1986-01-30', '', '1273', NULL, 'WNS Perera', '865300980V', 'user1273', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (218, '', 'Unmarried', '', false, 'Finance Division', 'Senior Staff Management Assistant', '1975-04-02', '', '322', NULL, 'DI Manamperi', '755932930V', 'user322', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (226, '', 'Married', '', false, 'Examination Division', 'Labourer', '1981-07-14', '', '1075', NULL, 'URL Rodrigo', '811960845V', 'user1075', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (229, '', 'Unmarried', '', false, 'Examination Division', 'Staff Management Assistant', '1973-09-23', '', '466', NULL, 'P Sarukasan', '197376701046', 'user466', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (237, '', 'Married', '', false, 'CETMe', 'SSMA', '1968-02-14', '', '699', NULL, 'GDRL Jayathilaka', '685450216V', 'user699', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (245, '', 'Unmarried', '', false, 'Medical Laboratory Sciences', 'Management Assistant', '1995-05-22', '', '3516', NULL, 'SN Wijemanna', '199564300372', 'user3516', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (251, '', 'Married', '', false, 'Department of Physics', 'Senior Lecturer', '1984-09-26', '', '2051', NULL, 'GD illeperuma', '198427000086', 'user2051', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (257, '', 'Married', '', false, 'Transort & Postal Division', 'Driver', '1985-08-12', '', '2975', NULL, 'BGSK Bandara', '852252995V', 'user2975', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (262, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Staff Technical Officer', '1966-07-10', '', '372', NULL, 'P Samarasekara', '666920910V', 'user372', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (267, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Staff Technical Officer', '1969-02-03', '', '395', NULL, 'S Manivannan ', '196903400810', 'user395', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (275, '', 'Married', '', false, 'Department Of Nursing', 'Senior Lecturer Grade I', '1966-09-15', '', '515', NULL, 'PWGDP Samarasekera', '667590027V', 'user515', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (281, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Laboratary Attendant', '1983-12-21', '', '1083', NULL, 'MPKH Perera', '833562975V', 'user1083', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (286, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', 'Senior Lecturer Grade II', '1969-05-12', '', '138', NULL, 'DC Wijewaddena', '691332756V', 'user138', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (294, '', 'Married', '', false, 'Department of Language Studies', 'Works Aide', '1976-06-18', '', '1917', NULL, 'ERGSJ Kumara', '761701096V', 'user1917', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (303, '', 'Married', '', false, 'Non Academic Establishment (Leave)', 'SAR', '1974-10-23', '', '4075', NULL, 'JSRS Gunasekara', '742973174V', 'user4075', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (309, '', 'Married', '', false, 'Mechanical Engineering Workshop', 'Craft Demonstrator', '1971-04-25', '', '2016', NULL, 'DPSA Weerarathna', '711161740V', 'user2016', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (314, '', 'Married', '', false, 'Mechanical Engineering Workshop', 'Craft Demonstrator', '1990-07-02', '', '3816', NULL, 'LCV Senarathna', '199018401268', 'user3816', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (320, '', 'Unmarried', '', false, 'Engineering Workshop', 'Welder ii', '1985-02-06', '', '3886', NULL, 'BLGM Sanjeewa', '850370540V', 'user3886', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (327, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Staff Technical Officer', '1966-05-21', '', '356', NULL, 'PAJS Kumara', '661420464V', 'user356', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (331, '', 'Married', '', false, 'HSS', 'Works Aide', '1975-10-30', '', '263', NULL, 'KGP Nishantha', '753041230V', 'user263', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (337, '', 'Married', '', false, 'IT Division', 'IT Work Manager', '1968-05-25', '', '956', NULL, 'N Cedric', '681460772V', 'user956', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (343, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Laboratary Attendant', '1977-03-25', '', '1584', NULL, 'KTSP De Silva', '770864100V', 'user1584', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (348, '', 'Married', '', false, 'Printing Press ', 'Litho Machine Operator', '1965-02-27', '', '658', NULL, 'LLWP Kumara', '650580052V', 'user658', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (354, '', 'Married', '', false, 'Department of Language Studies', 'Lecturer', '1979-11-08', '', '3056', NULL, 'KGSA Wijesinghe', '708132209V', 'user3056', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (360, '', 'Unmarried', '', false, 'Career Guidence Unit', 'Management Assistant', '1980-05-18', '', '920', NULL, 'MG Niluka', '198063900640', 'user920', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (369, '', 'Married', '', false, 'Department Of Nursing', 'Senior Lecturer Grade II', '1973-12-28', '', '1132', NULL, 'KGPK Munidasa', '738631803V', 'user1132', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (374, '', 'Married', '', false, 'Puttalam Study Centre', 'Assistant Director', '1985-11-21', '', '2377', NULL, 'WM Senevirathna', '853264008V', 'user2377', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (381, '', 'Married', '', false, 'Galle Study Centre', 'Management Assistant', '1979-02-15', '', '878', NULL, 'PM Kumarage', '795464069V', 'user878', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (385, '', 'Married', '', false, 'Puttalam Study Centre', 'Works Aide Grade III', '1977-02-24', '', '2098', NULL, 'KGSP Senevirathna', '775553855V', 'user2098', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (391, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer Grade I', '1963-02-25', '', '179', NULL, 'WMS Wanasinghe', '630560675V', 'user179', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (397, '', 'Married', '', false, 'Registrar''s Office', 'SSMA', '1967-11-27', '', '930', NULL, 'K.Sujatha', '678321389V', 'user930', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (405, '', 'Married', '', false, 'Gampaha Study Centre', 'Lecturer', '1964-07-25', '', '340', NULL, 'MAJR Madurasinghe', '642070053V', 'user340', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (410, '', 'Married', '', false, 'Kandy Regional Centre', 'SMA', '1969-12-13', '', '927', NULL, 'PDS Sripali', '196984802079', 'user927', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (415, '', 'Married', '', false, 'Kandy Regional Centre', 'Preschhol Assistant', '1981-04-05', '', '2761', NULL, 'RC Dunusinghe', '198159601200', 'user2761', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (418, '', 'Married', '', false, 'Kandy Regional Centre', 'Electrician', '1968-04-19', '', '264', NULL, 'UD Udaya Kumara', '680192456V', 'user264', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (427, '', 'Married', '', false, 'Kandy Regional Centre', 'Lecturer', '1964-02-17', '', '342', NULL, 'GMCS Meegassooriya', '645480732V', 'user342', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (134, '', 'Married', '', false, 'Department of Mathematics', 'Works Aide', '1967-05-30', '', '259', NULL, 'MHGK Jayawardena', '671514181V', 'user259', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (140, '', 'Unmarried', '', false, 'Faculty of Natural Science', 'Management Assistant', '1982-09-22', '', '1088', NULL, 'HHNR De Silva', '827663573V', 'user1088', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (147, '', 'Married', '', false, 'Establishment Division', 'Management Assistant', '1992-04-20', '', '4057', NULL, 'TGYN Thalgaswatta', '199261102333', 'user4057', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (153, '', 'Unmarried', '', false, 'Establishment Division', 'Management Assistant', '1997-09-17', '', '3520', NULL, 'DT Ramanayaka', '977610516V', 'user3520', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (160, '', 'Married', '', false, 'Kandy Regional Centre', 'Senior Lecturer', '1966-01-23', '', '94', NULL, 'PWHKP Daulagala', '665230678V', 'user94', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (165, '', 'Married', '', false, 'Faculty of Engineering Technology', 'Works Aide', '1982-11-07', '', '3012', NULL, 'UI Chandrasekara', '823120222V', 'user3012', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (172, '', 'Unmarried', '', false, 'Kaluthara Study Centre', 'Senior Staff Management Assistant', '1967-01-06', '', '562', NULL, 'TD Dharmasiri', '675060932V', 'user562', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (176, '', 'Unmarried', '', false, 'Department of Marketting Management', 'Senior Lecturer Grade II', '1969-01-15', '', '869', NULL, 'S Sapukatanage', '695150334V', 'user869', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (182, '', 'Married', '', false, 'CETMe', 'Illustrationist', '1969-11-02', '', '5', NULL, 'DHS Jayalath', '693071143V', 'user5', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (189, '', 'Unmarried', '', false, 'Department of Computer Science', 'Senior Lecturer', '1966-06-25', '', '301', NULL, 'MJR Perera', '666770277V', 'user301', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (195, '', 'Unmarried', '', false, 'Acadamic Administration', 'Staff Management Assistant', '1974-05-08', '', '950', NULL, 'WLKDP Rathnakara', '746292210V', 'user950', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (201, '', 'Unmarried', '', false, 'Medical Laboratory Sciences', 'Head', '1981-08-18', '', '3407', NULL, 'DT Wijerathne', '817313710V', 'user3407', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (207, '', 'Unmarried', '', false, 'Finance Division', 'Management Assistant', '1984-07-23', '', '289', NULL, 'AY Godagama', '842052084V', 'user289', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (213, '', 'Unmarried', '', false, 'Finance Division', 'Book Keeper', '1972-06-24', '', '561', NULL, 'HADP Perera', '726761531V', 'user561', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (219, '', 'Married', '', false, 'Finance Division', 'Shroff', '1966-06-12', '', '477', NULL, 'ODA Wijesinghe', '661641274V', 'user477', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (228, '', 'Married', '', false, 'Examination Division', 'Senior Staff Management Assistant', '1966-11-18', '', '406', NULL, 'BGJA Kumara', '663230875V', 'user406', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (234, '', 'Married', '', false, 'Examination Division', 'Works Aide', '1995-02-22', '', '3010', NULL, 'RMSP Rathnayaka', '955531744V', 'user3010', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (240, '', 'Married', '', false, 'CETMe', 'Senior Lecturer', '1965-02-02', '', '959', NULL, 'DGU Kulasekara', '655330313V', 'user959', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (247, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Motor Mechanist', '1982-01-03', '', '2018', NULL, 'KIC Perera', '820033639V', 'user2018', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (252, '', 'Married', '', false, 'Department of Botany', 'Professor', '1962-05-17', '', '92', NULL, 'SR Weerakoon', '626380654V', 'user92', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (259, '', 'Unmarried', '', false, 'Agriculture & Plantation Engineering', 'Senior Lecturer Grade I', '1969-04-09', '', '1117', NULL, 'AGB Aruggoda', '696001006V', 'user1117', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (264, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Laboratary Attendant', '1977-08-22', '', '3354', NULL, 'WMS Senevirathna', '772352654V', 'user3354', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (266, '', 'Unmarried', '', false, 'Department of Marketting Management', 'Lecturer', '1965-01-16', '', '188', NULL, 'GAJ Silva', '655160221V', 'user188', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (274, '', 'Unmarried', '', false, 'Department of Pharmacy', 'Lecturer (Probationary)', '1979-06-22', '', '3499', NULL, 'KAI Priyangika', '796740582V', 'user3499', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (279, '', 'Married', '', false, 'Department of Mathematics', 'Senior Lecturer', '1984-05-30', '', '2155', NULL, 'HOW Peiris', '198465100753', 'user2155', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (284, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', 'Staff Technical Officer Gr II', '1969-10-05', '', '386', NULL, 'KDA Waijayanthi', '196977903232', 'user386', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (291, '', 'Unmarried', '', false, 'Department of Language Studies', 'Senior Lecturer', '1980-03-28', '', '182', NULL, 'MD kodithuwakku', '805881968V', 'user182', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (293, '', 'Unmarried', '', false, 'Department of Language Studies', 'Staff Management Assistant', '1973-12-26', '', '472', NULL, 'NLDTD Krishnaratne', '738611667V', 'user472', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (300, '', 'Married', '', false, 'Transort & Postal Division', 'Driver Grade II', '1971-01-02', '', '1044', NULL, 'RAHM Rajakaruna', '710024146V', 'user1044', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (306, '', 'Unmarried', '', false, 'Dept of Civil Engineering', 'Senior Lecturer Grade II', '1966-08-07', '', '143', NULL, 'KMLA Udamulla', '667203139V', 'user143', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (311, '', 'Married', '', false, 'Engineering Workshop', 'Craft Demonstrator', '1972-11-07', '', '493', NULL, 'DTPK Arandara', '723122627V', 'user493', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (317, '', 'Married', '', false, 'Engineering Workshop', 'Craft Demonstrator', '1965-10-20', '', '1236', NULL, 'BDS Somarathna', '652940960V', 'user1236', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (322, '', 'Married', '', false, 'Engineering Workshop', 'Craft Demonstrator', '1968-07-07', '', '922', NULL, 'BPN Karunarathne', '681890998V', 'user922', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (328, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Senior Lecturer', '1973-08-05', '', '532', NULL, 'DHRJ Wimalasiri', '732182543V', 'user532', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (335, '', 'Married', '', false, 'Information Technology Division', 'Technical Officer', '1990-06-03', '', '2460', NULL, 'TMKI Thennakoon', '901552436V', 'user2460', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (341, '', 'Unmarried', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer', '1973-04-04', '', '874', NULL, 'AI Irugalbandara', '735952218V', 'user874', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (347, '', 'Married', '', false, 'Press', 'Litho Machine Operator', '1977-04-03', '', '2832', NULL, 'WDI Pushpachandra', '770941717V', 'user2832', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (353, '', 'Unmarried', '', false, 'Faculty of Health Science', 'Health Service Laborator', '1996-12-26', '', '2639', NULL, 'NGK Heshan', '963612575V', 'user2639', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (356, '', 'Unmarried', '', false, 'Printing Press', 'Management Assistant', '1991-12-24', '', '2201', NULL, 'WMMK Weerasinghe', '918593764V', 'user2201', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (362, '', 'Married', '', false, 'Transort & Postal Division', 'Driver - Super Grade', '1966-08-27', '', '531', NULL, 'HASR Perera', '662401137V', 'user531', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (370, '', 'Unmarried', '', false, 'Department Of Nursing', 'Works Aide', '1997-12-08', '', '3388', NULL, 'AGD Ransara', '973432354V', 'user3388', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (375, '', 'Unmarried', '', false, 'Department of Social Studies', 'Dean ,HSS / Senior Lecturer', '1968-08-28', '', '781', NULL, 'Dr. SN Morais', '682410060V', 'user781', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (380, '', 'Married', '', false, 'Galle Study Centre', 'Management Assistant', '1976-05-07', '', '2787', NULL, 'WKD Nishantha', '197612800791', 'user2787', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (386, '', 'Married', '', false, 'Supplies Division', 'Assistant Bursar', '1977-02-16', '', '1347', NULL, 'AWSP Dayananda', '770471702V', 'user1347', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (392, '', 'Married', '', false, 'Transort & Postal Division', 'Senior Staff Management Assistant', '1977-04-13', '', '321', NULL, 'SP Liyanage', '771042775V', 'user321', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (399, '', 'Unmarried', '', false, 'Department of Physics', 'Senior Lecturer Grade I', '1967-03-17', '', '62', NULL, 'N Karthikeyan', '670770494V', 'user62', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (403, '', 'Married', '', false, 'Gampaha Study Centre', 'Office Aide', '1968-01-31', '', '368', NULL, 'DAS Palitha', '196803102044', 'user368', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (411, '', 'Married', '', false, 'Kandy Regional Centre', 'Management Assistant', '1986-09-18', '', '1698', NULL, 'WMCLWanninayaka', '867623906V', 'user1698', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (416, '', 'Married', '', false, 'Kandy Regional Centre', 'Preschhol Assistant', '1969-10-26', '', '223', NULL, 'RMDA Jayasinghe', '698000210V', 'user223', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (135, '', 'Married', '', false, 'Department of Mathematics', 'Senior Lecturer', '1973-03-27', '', '676', NULL, 'CPS Pathirana', '730872712V', 'user676', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (141, '', 'Married', '', false, 'Faculty of Natural Science', 'Machine operator', '1976-04-08', '', '262', NULL, 'GTS Perera', '760991449V', 'user262', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (146, '', 'Married', '', false, 'Establishment Division', NULL, '1992-06-10', '', '4067', NULL, 'PE Mannage', '926620240V', 'user4067', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (152, '', 'Married', '', false, 'Academic Establishment', 'Management Assistant', '1987-09-18', '', '2612', NULL, 'GGTIN Gunathilaka', '877622444V', 'user2612', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (158, '', 'Unmarried', '', false, 'Library', 'Library Attendant', '1984-04-26', '', '266', NULL, 'PP Nishantha', '841171896V', 'user266', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (164, '', 'Married', '', false, 'Department of Social Studies', 'Senior Lecturer', '1978-12-20', '', '901', NULL, 'TA Wickramasinghe', '788553439V', 'user901', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (170, '', 'Married', '', false, 'Department of Organizational studies', 'Lecturer (Probationary)', '1988-10-24', '', '2269', NULL, 'JC Hapugoda', '887980381V', 'user2269', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (178, '', 'Unmarried', '', false, 'Maintenance Division', 'Supervisor(Electrical)', '1971-05-21', '', '1169', NULL, 'DDC Jayaneththi', '711420657V', 'user1169', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (183, '', 'Unmarried', '', false, 'CETMe', 'Works Aide', '1991-07-30', '', '3604', NULL, 'BSM Perera', '912120090V', 'user3604', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (188, '', 'Unmarried', '', false, 'Printing Press', 'Litho Machine Operator', '1985-05-03', '', '203', NULL, 'MRC Karunararathna', '198512401370', 'user203', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (194, '', 'Married', '', false, 'Department of Computer Science', 'Senior Lecturer', '1977-12-18', '', '42', NULL, 'M Punchimudiyanse', '773532397V', 'user42', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (200, '', 'Married', '', false, 'Public Information Division', 'Telephone Operator', '1972-10-20', '', '458', NULL, 'LLMM Alwis', '727942599V', 'user458', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (205, '', 'Married', '', false, 'Finance Division', 'Management Assistant', '1985-11-14', '', '1275', NULL, 'GAAA Gurusinghe', '198581904032', 'user1275', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (211, '', 'Married', '', false, 'Finance Division', 'Management Assistant', '1993-12-07', '', '2608', NULL, 'AMS Wekada', '938423563V', 'user2608', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (216, '', 'Unmarried', '', false, 'Finance Division', 'Staff Management Assistant', '1971-11-29', '', '314', NULL, 'CA Athukorala', '718342520V', 'user314', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (223, '', 'Married', '', false, 'Faculty of Management Studies', 'Management Assistant', '1971-09-29', '', '761', NULL, 'RIG De Silva', '717732995V', 'user761', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (231, '', 'Married', '', false, 'Examination Division', 'Management Assistant', '1997-01-29', '', '3518', NULL, 'WDP Deshani', '975292916V', 'user3518', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (238, '', 'Unmarried', '', false, 'CETMe', 'Lecturer', '1986-06-01', '', '3964', NULL, 'S Rajasingham', '866533628V', 'user3964', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (243, '', 'Married', '', false, 'Early Childhood & Primary Education', 'Day Care Assistant I', '1975-05-04', '', '232', NULL, 'WDGG Vithana', '756252771V', 'user232', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (249, '', 'Married', '', false, 'Maintenance Division', 'Carpenter Grade I', '1987-07-25', '', '1264', NULL, 'LADC Liyanage', '872071733V', 'user1264', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (255, '', 'Unmarried', '', false, 'Department of Secoundary & Tertiary Education', 'Lecturer (Probationary)', '1978-11-25', '', '2682', NULL, 'PART Gunawardena', '197883003297', 'user2682', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (261, '', 'Unmarried', '', false, 'Agriculture & Plantation Engineering', 'Senior Lecturer Grade I', '1968-11-22', '', '123', NULL, 'HMUN Herath', '688271436V', 'user123', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (273, '', 'Unmarried', '', false, 'Psychology and Counselling', 'Management Assistant', '1997-03-14', '', '2987', NULL, 'PGID Weerasinghe', '975743292V', 'user2987', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (280, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'SSTO', '1967-09-19', '', '243', NULL, 'KCK Deraniyagala', '672630312V', 'user243', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (287, '', 'Married', '', false, 'Department of Language Studies', 'Senior Lecturer Grade II', '1970-08-27', '', '905', NULL, 'NK Abeysekera', '707402172V', 'user905', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (292, '', 'Married', '', false, 'Department of Language Studies', 'SSMA', '1966-07-12', '', '820', NULL, 'HPLD Gunawardena', '666942752V', 'user820', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (302, '', 'Married', '', false, 'Registrar''s Office', 'Works Aide', '1994-01-06', '', '3384', NULL, 'TAT Ranga', '940060052V', 'user3384', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (308, '', 'Married', '', false, 'Dept of Civil Engineering', 'Senior Lecturer Grade I', '1974-02-15', '', '146', NULL, 'MNC Samarawickrama', '740462512V', 'user146', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (315, '', 'Married', '', false, 'Mechanical Engineering Workshop', 'Technical Officer', '1984-02-24', '', '2068', NULL, 'SMN Randika', '198405500184', 'user2068', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (321, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Craft Demonstrator', '1969-06-09', '', '1861', NULL, 'JA Prabath', '691611256V', 'user1861', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (325, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', 'Lecturer', '1974-09-09', '', '142', NULL, 'VR Jayasekara', '742531880V', 'user142', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (332, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', 'Laboratary Attendant', '1970-01-25', '', '594', NULL, 'LPAS Jayaweera', '700250610V', 'user594', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (336, '', 'Unmarried', '', false, 'IT Division', 'Management Assistant', '1994-09-27', '', '2984', NULL, 'HMC Chathuranga', '942710950V', 'user2984', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (344, '', 'Married', '', false, 'Faculty of Engineering Technology', 'training engineerig Grade III', '1975-06-21', '', '1557', NULL, 'IMNP Illangakoon', '751730330V', 'user1557', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (350, '', 'Unmarried', '', false, 'Press', 'Typesetter', '1992-04-20', '', '2988', NULL, 'NGMS Karunathilaka', '926110411V', 'user2988', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (357, '', 'Married', '', false, 'Printing press', 'Management Assistant', '1985-04-19', '', '1990', NULL, 'HGSP Thilakarathna', '198511002949', 'user1990', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (363, '', 'Married', '', false, 'Department Of Nursing', 'Senior Lecturer', '1968-02-28', '', '1158', NULL, 'KA Sriyani', '685590514V', 'user1158', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (366, '', 'Married', '', false, 'Department Of Nursing', 'Management Assistant', '1966-11-25', '', '719', NULL, 'SAC Nandaseeli', '668300057V', 'user719', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (372, '', 'Married', '', false, 'Medical Laboratory Sciences', 'Lab Attendant', '1987-12-16', '', '2099', NULL, 'TGTL Saumyasiri', '873514418V', 'user2099', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (376, '', 'Married', '', false, 'Puttalam Study Centre', 'Management Assistant', '1981-07-26', '', '2806', NULL, 'SARE Abeweera', '198120800946', 'user2806', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (382, '', 'Married', '', false, 'Galle Study Centre', 'Management Assistant', '1986-07-19', '', '2786', NULL, 'DGC Kumari', '867010688V', 'user2786', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (389, '', 'Unmarried', '', false, 'Department of Physics', 'Senior Lecturer Grade II', '1973-12-21', '', '2146', NULL, 'HKWI Jayawardena', '738561260V', 'user2146', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (396, '', 'Married', '', false, 'General Administration Division', 'SSMA', '1969-04-02', '', '331', NULL, 'KGP Pushpamali', '695930682V', 'user331', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (402, '', 'Unmarried', '', false, 'RES-Polonnaruwa', 'Assistant Director', '1989-11-29', '', '2739', NULL, 'HMCRK Herath', '198952903911', 'user2739', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (408, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Senior Lecturer Grade I', '1965-02-09', '', '632', NULL, 'LSK Udugama', '650401298V', 'user632', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (414, '', 'Married', '', false, 'Kandy Regional Centre', 'Telephone Operator', '1991-04-12', '', '1514', NULL, 'GEN Munna', '916031416V', 'user1514', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (420, '', 'Unmarried', '', false, 'Kandy Regional Centre', 'Works Aide', '1977-09-23', '', '1939', NULL, 'TMSI Wijerathna', '772671806V', 'user1939', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (424, '', 'Married', '', false, 'Department of Zoology', 'Professor', '1965-04-15', '', '96', NULL, 'SK Wijesekera', 'XX', 'user96', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (136, '', 'Unmarried', '', false, 'Faculty of Natural Science', 'Management Assistant', '1978-01-20', '', '892', NULL, 'HWSC Chandrasena', '197852002503', 'user892', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (143, '', 'Married', '', false, 'Establishment Division', 'Works Aide', '1996-11-27', '', '3389', NULL, 'SA Udayanga', '963322054V', 'user3389', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (149, '', 'Married', '', false, 'Establishment Division', 'Works Aide', '1984-03-26', '', '204', NULL, 'RR Palpola', '198408602909', 'user204', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (155, '', 'Married', '', false, NULL, 'Management Assistant', '1989-12-29', '', '2960', NULL, 'MAC Eranda', '893642668V', 'user2960', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (161, '', 'Unmarried', '', false, 'Department of Botany', 'Lecturer', '1960-10-20', '', '66', NULL, 'PPDC Perera', '607941025V', 'user66', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (167, '', 'Unmarried', '', false, 'Department of Accounting & Finance', 'Senior Lecturer', '1986-01-29', '', '1841', NULL, 'CP Weerasekara', '860292149V', 'user1841', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (171, '', 'Unmarried', '', false, 'Fac of Managemnet Studies', 'Senior Management Assistant', '1971-11-23', '', '411', NULL, 'TS Rathnasinghe', '718282861V', 'user411', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (179, '', 'Unmarried', '', false, 'Maintenance Division', 'Works Superintendent', '1967-03-17', '', '483', NULL, 'DWP De Silva', '675770603V', 'user483', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (190, '', 'Unmarried', '', false, 'Department of Computer Science', 'Senior Lecturer', '1982-09-14', '', '1187', NULL, 'CS Weliwita', '198275800996', 'user1187', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (196, '', 'Married', '', false, 'Landscape Division', 'Curator', '1977-10-21', '', '4021', NULL, 'WMDN Warigajeshta', '772951078V', 'user4021', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (202, '', 'Married', '', false, 'Faculty of Health Science', 'Management Assistant III', '1991-08-18', '', '4047', NULL, 'KGNN Kumburegedara', '917310335V', 'user4047', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (208, '', 'Married', '', false, 'Finance Division', 'Assistant Bursar', '1983-11-16', '', '2240', NULL, 'TT Udayangani', '838210449V', 'user2240', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (214, '', 'Married', '', false, 'Finance Division', 'Management Assistant', '1985-01-27', '', '860', NULL, 'CS Withanage', '855270188V', 'user860', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (220, '', 'Married', '', false, 'Security Division', 'Security Guard', '1967-09-27', '', '1652', NULL, 'TGLP Kumara', '196727102394', 'user1652', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (224, '', 'Married', '', false, 'Faculty of Management Studies', 'Management Assistant', '1985-05-26', '', '1171', NULL, 'WASL Weerasiri', '856473180V', 'user1171', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (232, '', 'Married', '', false, 'Kandy Regional Centre', 'Works Aide', '1978-03-05', '', '1919', NULL, 'NWMMNB Abeykoon', '780652462V', 'user1919', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (235, '', 'Married', '', false, 'Examination Division', 'Management Assistant', '1981-02-23', '', '2760', NULL, 'NID Senanayaka', '815544072V', 'user2760', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (241, '', 'Unmarried', '', false, 'Faculty of Natural Science', 'Senior Staff Management Assistant', '1966-07-31', '', '474', NULL, 'JM Gamage', '667134064V', 'user474', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (246, '', 'Married', '', false, 'Department of Chemistry', 'Laboratory Attendant', '1975-10-17', '', '510', NULL, 'HDL Sadara', '752911568V', 'user510', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (250, '', 'Unmarried', '', false, 'Maintenance Division', 'Carpenter', '1981-01-06', '', '1266', NULL, 'SPAD Samarasinghe', '198100603165', 'user1266', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (254, '', 'Unmarried', '', false, 'Department of Botany', 'Senior Lecturer', '1980-03-02', '', '1131', NULL, 'YAS Samithri', '198056203640', 'user1131', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (260, '', 'Married', '', false, 'Agriculture & Plantation Engineering', 'Senior Lecturer Grade I', '1970-12-02', '', '131', NULL, 'HKLK Gunasekara', '197054302619', 'user131', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (268, '', 'Unmarried', '', false, 'Department of Human Resource  Managent', 'Senior Lecturer Grade II', '1972-01-17', '', '1012', NULL, 'KPJM Pathirana', '720172366V', 'user1012', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (272, '', 'Married', '', false, 'Psychology and Counselling', 'Senior Lecturer Grade II', '1979-03-28', '', '3393', NULL, 'HMCJ Herath', '795880488V', 'user3393', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (278, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Laboratary Attendant', '1981-12-21', '', '967', NULL, 'PDD Tharanga', '813562510V', 'user967', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (285, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', 'Management Assistant', '1987-08-30', '', '2772', NULL, 'RGH Jayawickrama', '877430456V', 'user2772', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (289, '', 'Married', '', false, 'Department of Language Studies', 'Senior Lecturer', '1972-07-05', '', '861', NULL, 'Dr.K.Chandramohan', '726871159V', 'user861', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (295, '', 'Unmarried', '', false, 'Department of Language Studies', 'Senior Lecturer Grade I', '1967-08-14', '', '915', NULL, 'VV Madawattagedera', '677270691V', 'user915', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (299, '', 'Unmarried', '', false, 'Dept.of Medical Laborarory sciences', 'Lecturer (Probationary)', '1988-11-11', '', '3398', NULL, 'RSR Rajakulasooriya', '888162348V', 'user3398', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (305, '', 'Unmarried', '', false, 'Dept of Civil Engineering', 'Laboratary Attendant', '1971-04-05', '', '207', NULL, 'GKL Dayawansha', '710960038V', 'user207', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (310, '', 'Married', '', false, 'Engineering Workshop', 'Craft Demonstrator', '1966-08-21', '', '495', NULL, 'KDR Wickramasinghe', '662340596V', 'user495', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (316, '', 'Married', '', false, 'Engineering Workshop', 'Foundryman', '1987-01-05', '', '2153', NULL, 'UGNS Bandara', '870050240V', 'user2153', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (324, '', 'Married', '', false, 'Faculty of Education', 'SSMA', '1969-07-17', '', '885', NULL, 'RA Sriyani', '196969902185', 'user885', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (329, '', 'Married', '', false, 'Finance Division', 'Management Assistant Grade I', '1991-08-07', '', '4056', NULL, 'WHMMS Dilrukshi', '199172001579', 'user4056', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (334, '', 'Unmarried', '', false, 'Central Dispatch Unit', 'Management Assistant', '1991-03-05', '', '2983', NULL, 'MKM Fernando', '199106501730', 'user2983', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (340, '', 'Married', '', false, 'IT Division', 'Management Assistant', '1992-02-06', '', '2609', NULL, 'WMSTK Ethulgama', '925371203V', 'user2609', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (346, '', 'Married', '', false, 'Press', 'Works Aide', '1986-11-21', '', '3447', NULL, 'APS Perera', '863261570V', 'user3447', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (352, '', 'Married', '', false, 'Kaluthara Study Centre', 'Work Assistant Grade I', '1972-06-27', '', '196', NULL, 'RPIC Senarathna', '721790266V', 'user196', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (359, '', 'Married', '', false, 'Career Guidence Unit', 'Works Aide', '1993-05-31', '', '3603', NULL, 'AAS Priyadarshana', '931524748V', 'user3603', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (365, '', 'Married', '', false, 'Department Of Nursing', 'Lecturer', '1987-07-24', '', '3396', NULL, 'HUC Nuwansala', '198770610058', 'user3396', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (371, '', 'Married', '', false, 'Marshal Division', 'Marshal Grade II', '1970-06-25', '', '3526', NULL, 'WS Premarathna', '197017703110', 'user3526', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (378, '', 'Unmarried', '', false, 'Badulla Regional Centre', 'Assistant Director', '1985-05-27', '', '2037', NULL, 'HNK Galahitiyawa', '856483649V', 'user2037', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (384, '', 'Married', '', false, 'Galle Study Centre', 'Labourer Grade I', '1975-02-08', '', '667', NULL, 'ASM Anwar', '750391249V', 'user667', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (388, '', 'Unmarried', '', false, 'Finance Branch', 'Senior Assistant Bursar ', '1970-03-14', '', '1491', NULL, 'KK Chetiyamali', '197057402164', 'user1491', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (395, '', 'Married', '', false, 'General Administration Division', 'Management Assistant', '1997-11-28', '', '4037', NULL, 'PGMP Jayathunga', '978333974V', 'user4037', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (400, '', 'Married', '', false, 'Department of Botany', 'Lab Attendent', '1994-06-14', '', '3883', NULL, 'KD Malwaththage', '199416601629', 'user3883', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (406, '', 'Married', '', false, 'Gampaha Study Centre', 'Management Assistant', '1982-09-28', '', '2795', NULL, 'WASA Ranmal', '827723711V', 'user2795', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (413, '', 'Married', '', false, 'Kandy Regional Centre', 'SSMA', '1970-04-15', '', '333', NULL, 'AGH Priyangika', '706060863V', 'user333', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (419, '', 'Married', '', false, 'Kandy Regional Centre', 'Laboratory Assistant', '1976-06-05', '', '202', NULL, 'KVN Rohana', '761571222V', 'user202', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (137, '', 'Married', '', false, 'Faculty of Engineering Technology', 'Management Assistant', '1981-07-04', '', '1284', NULL, 'BDL Mahilal', '198118600034', 'user1284', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (142, '', 'Unmarried', '', false, 'Security Division', 'Security Guard', '1965-04-18', '', '205', NULL, 'SWR Weerakoon', '651090989V', 'user205', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (148, '', 'Unmarried', '', false, 'Establishment Division', 'Management Assistant', '1993-01-22', '', '4041', NULL, 'KACN Perera', '935221706V', 'user4041', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (154, '', 'Married', '', false, 'Establishment Division', 'Management Assistant', '1974-10-20', '', '2605', NULL, 'NKVM Dinusha', '197479402064', 'user2605', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (159, '', 'Married', '', false, 'Library', 'Library Inf. Assistant', '1975-07-29', '', '1324', NULL, 'WMWPS Kumari', '757112493V', 'user1324', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (166, '', 'Unmarried', '', false, 'Faculty of Engineering Technology', 'Works Aide', '1991-02-02', '', '3606', NULL, 'JA Dayaraja', '910330080V', 'user3606', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (173, '', 'Unmarried', '', false, 'Department of Accounting & Finance', 'Senior Lecturer', '1976-12-24', '', '187', NULL, 'HDDC Liyanagamage', '768592004V', 'user187', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (177, '', 'Married', '', false, 'Department of Accounting & Finance', 'Senior Lecturer', '1981-03-05', '', '1843', NULL, 'WAR Senevirathne', '810650982V', 'user1843', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (184, '', 'Married', '', false, 'CETMe', 'SSMA', '1969-02-26', '', '349', NULL, 'DMCP Dissanayaka', '695570724V', 'user349', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (191, '', 'Married', '', false, 'Department of Computer Science', 'Management Assistant', '1990-11-04', '', '2998', NULL, 'RMIMU Bandara', '903091045V', 'user2998', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (197, '', 'Unmarried', '', false, 'Registrar''s Office', 'Registrar', '1969-11-29', '', '1621', NULL, 'WLV Jayasena', '698342234V', 'user1621', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (203, '', 'Unmarried', '', false, 'Faculty of Health Science', 'Management Assistant', '1982-01-12', '', '2837', NULL, 'PKD Narmadie', '825124675V', 'user2837', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (209, '', 'Unmarried', '', false, 'Finance Division', 'Management Assistant', '1991-11-16', '', '2978', NULL, 'PHGPE Weerasekara', '918212825V', 'user2978', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (215, '', 'Married', '', false, 'Finance Division', 'Staff Management Assistant', '1969-05-19', '', '348', NULL, 'AAS Rohini', '1969640022469', 'user348', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (222, '', 'Married', '', false, 'Examination Division', 'Senior Staff Management Assistant', '1968-01-04', '', '720', NULL, 'RKS Priyadarshani', '685043343V', 'user720', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (227, '', 'Married', '', false, 'Examination Division', 'Senoir Staff Management Asssitant', '1969-02-22', '', '953', NULL, 'TAN Priyadarshani', '695530463V', 'user953', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (233, '', 'Married', '', false, 'Examination Division', 'Management Assistant', '1995-05-07', '', '3521', NULL, 'KLD Dilrukshi', '199562800486', 'user3521', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (239, '', 'Unmarried', '', false, 'CETMe', 'Lecturer', '1975-04-02', '', '3921', NULL, 'TMK Jayakodi', '755930709V', 'user3921', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (244, '', 'Married', '', false, 'Department of Chemistry', 'Laboratory Attendant', '1985-02-18', '', '3510', NULL, 'KMSK Karunarathna', '850491330V', 'user3510', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (253, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer', '1960-07-29', '', '1436', NULL, 'K Gnanarathnam', '602112110V', 'user1436', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (258, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '1964-02-06', '', '994', NULL, 'MDJS Saparamadu', '196453701224', 'user994', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (263, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Electrical Engineer', '1967-11-24', '', '1020', NULL, 'KJ Gunasekara', '196732900663', 'user1020', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (277, '', 'Unmarried', '', false, 'Department of Mathematics', 'Lecturer', '1964-06-15', '', '63', NULL, 'KASN Fernando', '641670731V', 'user63', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (283, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Laboratary Attendant', '1973-07-03', '', '1256', NULL, 'AAL Abeysundara', '197318502316', 'user1256', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (288, '', 'Married', '', false, 'Department of Language Studies', 'Senior Lecturer Grade I', '1968-04-08', '', '871', NULL, 'DE Devendra', '685990474V', 'user871', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (297, '', 'Married', '', false, 'Department of Physics', 'Lab Attendent', '1987-02-27', '', '1253', NULL, 'UGPK Meedeniya', '198705800045', 'user1253', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (298, '', 'Married', '', false, 'Agriculture & Plantation Engineering', 'Senior Lecturer Grade II', '1960-03-29', '', '1676', NULL, 'H Thrikawela', '600890670V', 'user1676', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (304, '', 'Married', '', false, 'Dept of Civil Engineering', 'Senior Lecturer Grade I', '1976-12-21', '', '1849', NULL, 'PAK Karunananda', '763562239V', 'user1849', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (312, '', 'Married', '', false, 'Mechanical Engineering Workshop', 'Management Assistant', '1988-02-01', '', '1085', NULL, 'SADJ Gunasekara', '880320041V', 'user1085', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (318, '', 'Unmarried', '', false, 'Mechanical Engineering Workshop', 'Blacksmith', '1983-09-30', '', '1889', NULL, 'AADS Shantha', '832742023V', 'user1889', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (323, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Lab Attendent', '1991-06-22', '', '1934', NULL, 'NGT Madushanka', '911740915V', 'user1934', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (330, '', 'Married', '', false, 'Dean''s office HSS', 'Staff Management Assistant', '1974-04-20', '', '365', NULL, 'RMW Dissanayaka', '746112793V', 'user365', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (338, '', 'Unmarried', '', false, 'IT Division', 'System Analyst', '1979-04-22', '', '1091', NULL, 'SKC Kithsiri', '790931157V', 'user1091', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (342, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Staff Technical Officer Grade I', '1965-08-08', '', '217', NULL, 'ED Liyanarachchi', '657211907V', 'user217', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (349, '', 'Married', '', false, 'Printing Press', 'Book Binder', '1980-11-22', '', '271', NULL, 'VGP Sanjeewa', '803271070V', 'user271', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (355, '', 'Married', '', false, 'Department of Special Needs Education', 'Lecturer', '1985-03-19', '', '2005', NULL, 'K Ketheeswaran', '850791937V', 'user2005', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (361, '', 'Married', '', false, 'Dept of Civil Engineering', 'Laboratory Attendant', '1988-05-17', '', '2207', NULL, 'DCG Fernando', '881382180V', 'user2207', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (367, '', 'Married', '', false, 'Department Of Nursing', 'Lab Attendant', '1975-07-11', '', '274', NULL, 'MDD Kumarasiri', '751931786V', 'user274', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (373, '', 'Married', '', false, 'Medical Laboratory Sciences', 'Technical Officer Grade II', '1991-06-05', '', '2179', NULL, 'KLS Dilshan', '911572613V', 'user2179', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (379, '', 'Married', '', false, 'Badulla Regional Centre', 'Works Aide Grade III', '1986-05-01', '', '2800', NULL, 'JWPAN Jayawardana', '866223882V', 'user2800', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (387, '', 'Married', '', false, 'Dept of Civil Engineering', 'Laboratory Attendant', '1978-11-08', '', '267', NULL, 'MRSK Vipulasena', '783131048V', 'user267', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (393, '', 'Married', '', false, 'General Administration Division', 'Graduate Transaltor Gr.iI', '1992-04-25', '', '3568', NULL, 'S Jamila', '926163795V', 'user3568', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (398, '', 'Unmarried', '', false, 'Examination Division', 'AR', '1984-06-22', '', '1746', NULL, 'DSD Kasun', '841740840V', 'user1746', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (404, '', 'Married', '', false, 'Gampaha Study Centre', 'Management Assistant', '1985-02-19', '', '2785', NULL, 'PMK Hewa', '855501643V', 'user2785', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (409, '', 'Married', '', false, 'Kandy Regional Centre', 'Management Assistant', '1990-01-10', '', '1705', NULL, 'DGRA Ekanayake', '905104420V', 'user1705', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (417, '', 'Unmarried', '', false, 'Kandy Regional Centre', 'Management Assistant', '1977-02-05', '', '2217', NULL, 'MMLT Bandara', '770360455V', 'user2217', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (423, '', 'Married', '', false, 'Kandy Regional Centre', 'Lecturer', '1965-09-14', '', '52', NULL, 'U Angammana', '652585124V', 'user52', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (428, '', 'Married', '', false, 'Faculty of Education', 'Management Assistant', '1985-01-01', '', '1277', NULL, 'DAS Sandamali', '855015048V', 'user1277', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (138, '', 'Married', '', false, 'Faculty of Natural Science', 'Management Assistant', '1976-03-07', '', '2862', NULL, 'IN Shantha', '760671940V', 'user2862', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (144, '', 'Married', '', false, 'Establishment Division', 'Senior Staff Management Assistant', '1968-02-29', '', '725', NULL, 'SASP Samarasinghe', '680600449V', 'user725', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (150, '', 'Unmarried', '', false, 'Establishment Division', 'Management Assistant', '1990-07-06', '', '2977', NULL, 'WAYC Samaranayaka', '901881375V', 'user2977', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (157, '', 'Married', '', false, 'Library', 'Library Attendant', '1995-06-24', '', '3692', NULL, 'RK Sameera', '951762415V', 'user3692', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (163, '', 'Married', '', false, 'Director office, RES', 'Management Assistant', '1990-03-15', '', '2879', NULL, 'MKCC Morawaka', '905751565V', 'user2879', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (169, '', 'Unmarried', '', false, 'Department of Human Resource  Managent', 'Lecturer (Probationary)', '1991-07-11', '', '3383', NULL, 'AHU Perera', '199169301182', 'user3383', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (175, '', 'Unmarried', '', false, 'Department of Marketting Management', 'Lecturer (Probationary)', '1984-12-09', '', '3381', NULL, 'AAI Lakmali', '198484400345', 'user3381', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (181, '', 'Married', '', false, 'CETMe', 'AVTO', '1967-01-13', '', '25', NULL, 'UGCGB Thennakoon', '670130282V', 'user25', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (186, '', 'Married', '', false, 'Center For Educational Tec. Division', 'Management Assistant', '1976-09-08', '', '407', NULL, 'KND Herath', '767522657V', 'user407', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (193, '', 'Married', '', false, 'Department of Computer Science', 'Senior Lecturer', '1963-02-14', '', '125', NULL, 'AMPB Abeysinghe', '630450152V', 'user125', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (199, '', 'Married', '', false, 'Public Information Division', 'Telephone Operator', '1968-04-24', '', '456', NULL, 'DD Doolwala', '196861501476V', 'user456', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (206, '', 'Married', '', false, 'Finance Division', 'Management Assistant', '1993-12-05', '', '4055', NULL, 'DBS Dahanayake', '199334000956', 'user4055', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (210, '', 'Married', '', false, 'Finance Division', 'Worksaide', '1981-06-08', '', '1931', NULL, 'WAMK Kasthurirathna', '19811604038V', 'user1931', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (217, '', 'Unmarried', '', false, 'Finance Division', 'Senior Staff Management Assistant', '1970-10-05', '', '785', NULL, 'ESSAR Martin', '707793007V', 'user785', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (221, '', 'Married', '', false, 'Department of Zoology', 'Staff Technical Officer', '1966-09-09', '', '3962', NULL, 'DPCJ Liyanage', '662530034V', 'user3962', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (225, '', 'Married', '', false, 'Examination Division', 'Works Aide', '1968-09-25', '', '240', NULL, 'KPJ Wijayawardena', '682692138V', 'user240', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (230, '', 'Married', '', false, 'Non Academic Establishment', 'Management Assistant', '1981-09-03', '', '255', NULL, 'VAM De Mel', '198124700353', 'user255', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (236, '', 'Unmarried', '', false, 'Examination Division', 'SSMA', '1971-09-29', '', '715', NULL, 'REID Rajakaruna', '712733250V', 'user715', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (242, '', 'Married', '', false, 'Department of Computer Science', 'Senior Lecturer Grade I', '1965-12-03', '', '77', NULL, 'WPCD De Silva', '653381220V', 'user77', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (248, '', 'Married', '', false, 'Non Academic Establishment', 'Management Assistant', '1989-07-06', '', '2996', NULL, 'NLMM Narangoda', '896880543V', 'user2996', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (256, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Lecturer', '1967-01-26', '', '2403', NULL, 'P Ramathas', '670267156V', 'user2403', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (265, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Laboratary  Attendant', '1983-05-29', '', '2187', NULL, 'HPD Wijekumara', '198315000972', 'user2187', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (270, '', 'Unmarried', '', false, 'Psychology and Counselling', 'Senior Lecturer Grade II', '1986-05-02', '', '3394', NULL, 'BGR De Silva', '866230145V', 'user3394', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (276, '', 'Unmarried', '', false, 'Department of Pharmacy', 'Lecturer (Probationary)', '1985-07-25', '', '1709', NULL, 'RBJ Buddhika', '857071654V', 'user1709', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (282, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Craft Demonstrator', '1981-02-15', '', '1364', NULL, 'HPPT Ananda', '810461187V', 'user1364', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (290, '', 'Unmarried', '', false, 'Department of Language Studies', 'Senior Lecturer Grade II', '1969-04-15', '', '177', NULL, 'SAAK Satharasinghe', '696062463V', 'user177', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (296, '', 'Married', '', false, 'Department Of Nursing', 'Senior Lecturer', '1968-10-16', '', '1005', NULL, 'WN Priyanthi', '196879000120', 'user1005', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (301, '', 'Married', '', false, 'Deparment of Legal and Documentation', 'Management Assistant', '1988-04-10', '', '2719', NULL, 'HKA Dilrukshi', '198860102853', 'user2719', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (307, '', 'Married', '', false, 'Dept of Civil Engineering', 'Senior Professor', '1962-04-16', '', '151', NULL, 'TM Pallewatta', '621070240V', 'user151', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (313, '', 'Unmarried', '', false, 'Mechanical Engineering Workshop', 'Craft Demonstrator', '1969-10-07', '', '1888', NULL, 'KAAD Gunasekara', '691923665V', 'user1888', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (319, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', NULL, '1980-02-16', '', '1237', NULL, 'PAGM Perera', '800471893V', 'user1237', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (326, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Senior Lecturer', '1965-02-18', '', '135', NULL, ' TSS Jatunarachchi', '655491929V', 'user135', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (333, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Motor Mechanic', '1974-11-27', '', '409', NULL, 'RLS Perera', '743320778V', 'user409', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (339, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Senior Professor', '1962-01-10', '', '827', NULL, 'SP Karunanayaka', '625101670V', 'user827', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (345, '', 'Married', '', false, 'Press', 'Litho Machine Operator', '1977-08-28', '', '2877', NULL, 'HAS Perera', '772411510V', 'user2877', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (351, '', 'Married', '', false, 'Press', 'Works Aide', '1990-08-17', '', '3867', NULL, 'BDD Premalal', '902300554V', 'user3867', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (358, '', 'Married', '', false, 'General Administration Division', 'Graduate Translator', '1991-02-22', '', '3567', NULL, 'NM Nifran', '910530160V', 'user3567', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (364, '', 'Unmarried', '', false, 'Department Of Nursing', 'Lecturer', '1989-08-12', '', '3397', NULL, 'NR Kuruppu', '897250187V', 'user3397', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (368, '', 'Married', '', false, 'Department Of Nursing', 'Senior Lecturer Grade I', '1971-11-01', '', '518', NULL, 'BSS De silva', '713062049V', 'user518', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (377, '', 'Married', '', false, 'Badulla Regional Centre', 'Carpenter Special Grade', '1966-01-04', '', '505', NULL, 'RM Abeyrathna', '660040730V', 'user505', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (383, '', 'Married', '', false, 'Galle Study Centre', 'Senior Educational Assistant', '1967-06-25', '', '116', NULL, 'TGN Kariyawasam', '671770072V', 'user116', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (390, '', 'Married', '', false, 'Department of Physics', 'Lecturer', '1963-03-21', '', '54', NULL, 'DLN Jayathilaka', '630810531V', 'user54', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (394, '', 'Married', '', false, 'General Administration Division', 'SSMA', '1967-10-30', '', '729', NULL, 'SBR Priyadarshani', '196780401017', 'user729', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (401, '', 'Married', '', false, 'Health Centre', 'Health Attendant', '1994-03-06', '', '3621', NULL, 'HA Thamara', '945660147V', 'user3621', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (407, '', 'Married', '', false, 'Deans Office Faculty of Engineering Technology', 'SSMA', '1968-07-08', '', '987', NULL, 'RLD Nagahawatte', '686900800V', 'user987', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (412, '', 'Married', '', false, 'Kandy Regional Centre', 'SSMA', '1967-11-11', '', '327', NULL, 'DMHDR Dissanayaka', '678170151V', 'user327', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (421, '', 'Married', '', false, 'Kandy Regional Centre', 'Works Aide', '1975-03-20', '', '2151', NULL, 'RMMPK Rathnayaka', '197558000244', 'user2151', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (426, '', 'Married', '', false, 'Kandy Regional Centre', 'Senior Lecturer', '1983-01-05', '', '1194', NULL, 'SD Dissanayaka', '835053474V', 'user1194', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (430, '', 'Married', '', false, 'Rathnapura RC', 'Assistant Director', '1977-05-18', '', '2379', NULL, 'UWNP Wanigasekara', '197763901832', 'user2379', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (422, '', 'Married', '', false, 'Kandy Regional Centre', 'Driver', '1965-02-20', '', '807', NULL, 'TGR Rupasiri', '650513223V', 'user807', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (429, '', 'Married', '', false, 'Gampaha Study Centre', 'Senior Staff Management Assistant', '1965-11-03', '', '334', NULL, 'MKLK Gunawardena', '196530800930', 'user334', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (425, '', 'Married', '', false, 'Kandy Regional Centre', 'Senior Lecturer', '1978-12-07', '', '1738', NULL, 'WDSS Bandara', '197834201836', 'user1738', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (431, '', 'Married', '', false, 'Rathnapura RC', 'Management Assistant', '1977-07-08', '', '363', NULL, 'UVNS Kumari', '197769002675', 'user363', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (432, '', 'Married', '', false, 'Kandy Regional Centre', 'Management Assistant', '1980-12-10', '', '2794', NULL, 'WASB Wickramasinghe', '803453497V', 'user2794', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (433, '', 'Married', '', false, 'Ampara Study Centre', 'Management Assistant', '1984-01-07', '', '1174', NULL, 'KHGP Kalpani', '845074011V', 'user1174', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (434, '', 'Married', '', false, 'Faculty of HSS', 'Works Aide', '1980-04-04', '', '3864', NULL, 'AMS Adhikari', '800954673V', 'user3864', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (435, '', 'Married', '', false, 'Maintenance Division', 'Works Engineer', '1981-02-02', '', '2257', NULL, 'LA Harischandra', '810531487V', 'user2257', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (436, '', 'Married', '', false, 'Dept of Civil Engineering', 'Senior Lecturer Grade II', '1961-09-10', '', '691', NULL, 'HGPA Rathnaweera', '612540225V', 'user691', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (437, '', 'Married', '', false, 'Printing Press', 'Litho Machine Operator', '1975-02-03', '', '2015', NULL, 'WAH Pradeep', '750342175V', 'user2015', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (438, '', 'Married', '', false, 'Transort & Postal Division', 'Management Assistant', '1991-03-27', '', '2770', NULL, 'UDMD Madhubashana', '910870785V', 'user2770', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (439, '', 'Married', '', false, 'CETMe', 'Storekeeper', '1967-10-13', '', '585', NULL, 'GAM Sudamsiri', '672870550V', 'user585', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (440, '', 'Married', '', false, 'Finance Division', 'SSMA', '1966-04-24', '', '986', NULL, 'S Premarathna', '661150556V', 'user986', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (441, '', 'Married', '', false, 'Security Division', 'Security', '1969-11-21', '', '256', NULL, 'YGC Kumara', '693261686V', 'user256', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (442, '', 'Married', '', false, 'Transort & Postal Division', 'Driver', '1980-11-12', '', '2986', NULL, 'NMKP Nanayakkara', '803172064V', 'user2986', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (443, '', 'Married', '', false, 'Transort & Postal Division', 'Driver', '1971-05-15', '', '526', NULL, 'UT Nalin', '711361014V', 'user526', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (444, '', 'Married', '', false, 'Batticaloa Regional Center', 'Caretaker', '1977-11-02', '', '1267', NULL, 'R Ganeshalingam', '773071616V', 'user1267', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (445, '', 'Married', '', false, 'Batticaloa Regional Center', 'Senior Assistant Director', '1972-07-04', '', '112', NULL, 'AD Kamalanathan', '197218602259', 'user112', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (446, '', 'Unmarried', '', false, 'Establishment Division', 'SSMA', '1965-05-22', '', '949', NULL, 'AADD Abeysinghe', '656431040V', 'user949', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (447, '', 'Married', '', false, 'Transort & Postal Division', 'Driver', '1966-07-08', '', '539', NULL, 'MG Siriwardena', '662100749V', 'user539', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (448, '', 'Married', '', false, 'Matara Regional Center', 'Works Aide', '1976-04-05', '', '2765', NULL, 'W Hettige', '760963020V', 'user2765', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (449, '', 'Married', '', false, 'Matara Regional Center', 'Management Assistant', '1979-02-24', '', '2788', NULL, 'KLU Janithpriya', '790550870V', 'user2788', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (450, '', 'Married', '', false, 'Matara Regional Center', 'Management Assistant', '1984-03-05', '', '276', NULL, 'KKMD Rangana', '840651738V', 'user276', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (451, '', 'Unmarried', '', false, 'Matara Regional Center', 'Management Assistant', '1985-07-30', '', '2789', NULL, 'AGA Wijayangani', '857120310V', 'user2789', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (452, '', 'Married', '', false, 'RES', 'AD', '1970-05-30', '', '2033', NULL, 'MB Sakalasooriya', '701512359V', 'user2033', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (453, '', 'Married', '', false, 'Printing Press', 'Management Assistant', '1972-11-18', '', '258', NULL, 'DC Edirisinghe', '723233798V', 'user258', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (454, '', 'Married', '', false, 'Faculty of Health Science', 'Assistant Registrar', '1984-01-10', '', '2272', NULL, 'SADDN Samarasinghe', '845103100V', 'user2272', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (455, '', 'Married', '', false, 'Maintenance Division', 'Works Aide', '1980-09-29', '', '1935', NULL, 'PHMCK Herath', '807733001V', 'user1935', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (456, '', 'Married', '', false, 'Maintenance Division', 'Drougftsman', '1983-05-31', '', '1170', NULL, 'GKJN Amarasinghe', '831520019V', 'user1170', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (457, '', 'Married', '', false, 'Maintenance Division', 'Works Engineer', '1969-04-06', '', '1585', NULL, 'RADIC Rathnayaka', '690972883V', 'user1585', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (458, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', 'Laboratory Attendant', '1965-11-09', '', '641', NULL, 'HAPK Perera', '653142617V', 'user641', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (459, '', 'Married', '', false, 'Department of Pharmacy', 'Laboratory Attendant', '1978-09-22', '', '1920', NULL, 'WV Pushpakumara', '782663984V', 'user1920', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (460, '', 'Married', '', false, 'Security Division', 'Security Guard', '1970-05-23', '', '2185', NULL, 'GHMU Babaradeniya', '197114403487', 'user2185', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (461, '', 'Married', '', false, 'Vavuniya SC', 'Management Assistant', '1977-07-19', '', '2001', NULL, 'U Umathevi', '777011723V', 'user2001', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (462, '', 'Married', '', false, 'Press', 'Works Aide', '1966-12-30', '', '657', NULL, 'RMG Bandara', '663653687V', 'user657', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (463, '', 'Married', '', false, 'Faculty of Education', 'Lecturer (Probationary)', '1991-11-02', '', '3570', NULL, 'D Jesuiya', '918073817V', 'user3570', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (464, '', 'Married', '', false, 'Special Needs Education', 'Lecturer (Probationary)', '1983-09-24', '', '3965', NULL, 'HDC Priyadarshani', '198376802657', 'user3965', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (465, '', 'Unmarried', '', false, 'Department of Social Studies', 'Management Assistant', '1982-01-05', '', '482', NULL, 'KM De Silva', '825051619V', 'user482', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (466, '', 'Married', '', false, 'Faculty of Education', 'Labourer', '1981-11-19', '', '307', NULL, 'PDP Perera', '813241625V', 'user307', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (467, '', 'Married', '', false, 'Transort & Postal Division', 'Management Assistant', '1978-11-14', '', '1499', NULL, 'MDS De Costa', '783190052V', 'user1499', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (468, '', 'Married', '', false, 'Dept of Civil Engineering', 'Technical Officer', '1973-07-19', '', '1887', NULL, 'WAC Weeramanthree', '732012915V', 'user1887', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (469, '', 'Married', '', false, 'Department of Mathematics', 'Lecturer (Probationary)', '1987-06-09', '', '4094', NULL, 'BAU Dedunu', '198766000000', 'user4094', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (470, '', 'Married', '', false, 'Finance Division', 'Management Assistant', '1991-02-18', '', '2231', NULL, 'VL Ranathunga', '915491189V', 'user2231', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (471, '', 'Unmarried', '', false, 'RES', 'SE', '2025-03-21', '', '58', NULL, 'DGSK Doluweera', '608331077V', 'user58', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (472, '', 'Married', '', false, 'Monaragala SC', 'SSMA', '1972-10-17', '', '1591', NULL, 'SS Sudusinghe', '727910328V', 'user1591', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (473, '', 'Unmarried', '', false, 'Monaragala SC', 'SSMA', '1970-03-13', '', '3439', NULL, 'HM Amaranath', '700732649V', 'user3439', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (474, '', 'Married', '', false, 'Monaragala SC', 'Management Assistant', '1987-10-16', '', '2790', NULL, 'KMA Jeewanthi', '877903311V', 'user2790', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (475, '', 'Married', '', false, 'Department Of Nursing', 'Lecturer', '1989-04-15', '', '4050', NULL, 'ASPL Senadeera', '896060783V', 'user4050', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (476, '', 'Unmarried', '', false, 'Deparment of Legal and Documentation', 'Works Aide', '1994-01-14', '', '4018', NULL, 'SHNMC De Silva', '945142928V', 'user4018', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (477, '', 'Married', '', false, 'Maintenance Division', 'Works Supervisor', '1975-08-25', '', '209', NULL, 'AWK Vithanage', '752382387V', 'user209', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (478, '', 'Married', '', false, 'Batticaloa Regional Center', 'Works Aide', '1978-09-25', '', '1953', NULL, 'K Marimuthu', '782692666V', 'user1953', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (479, '', 'Unmarried', '', false, 'Press', 'Management Assistant', '1980-10-20', '', '1065', NULL, 'HL Samanthi', '198079400791', 'user1065', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (480, '', 'Married', '', false, 'Batticaloa Regional Center', 'Management Assistant', '1989-03-09', '', '2267', NULL, 'D Vishnuruban', '895691372V', 'user2267', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (484, '', 'Unmarried', '', false, 'Finance Division', 'Works Aide', '1983-12-14', '', '4133', NULL, 'PCD Perera', '838492762V', 'user4133', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (481, '', 'Married', '', false, 'Batticaloa Regional Center', 'Management Assistant', '1986-07-12', '', '2784', NULL, 'M Mukunthan', '866941564V', 'user2784', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (488, '', 'Married', '', false, 'Health Centre', 'Health Service Laborator', '1983-10-26', '', '2939', NULL, 'MKP Malalanayake', '833001434V', 'user2939', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (495, '', 'Married', '', false, 'RES - Badulla', 'Management Assistant', '1986-05-13', '', '2808', NULL, 'ARPJ Kumara', '861340473V', 'user2808', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (499, '', 'Married', '', false, 'RES - Matara', 'Management Assistant', '1977-12-29', '', '570', NULL, 'W Chameera', '773643172V', 'user570', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (504, '', 'Married', '', false, 'Hatton Study Centre', 'Works Aide', '1993-11-25', '', '2803', NULL, 'PPGDTK Bandara', '938303479V', 'user2803', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (516, '', 'Unmarried', '', false, 'Landscape Division', 'Gardner', '1995-07-21', '', '2890', NULL, 'RGC Maduranga', '199520301740', 'user2890', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (520, '', 'Married', '', false, 'Department of Marketting Management', 'Professor', '1975-04-19', '', '862', NULL, 'N Abeysekara', '751100396V', 'user862', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (528, '', 'Married', '', false, 'Registrar''s Office', 'Graduate Translator', '1993-11-16', '', '3566', NULL, 'UDL Udukumbura', '938210632V', 'user3566', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (534, '', 'Unmarried', '', false, 'Centre For Environmental Studies and Sustainable Development', 'Works Aide', '1993-06-05', '', '3605', NULL, 'HVM Madushanka', '931571400V', 'user3605', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (540, '', 'Married', '', false, 'Transort & Postal Division', 'Management Assistant', '1994-06-15', '', '4505', NULL, 'HHD Sameera', '941672620V', 'user4505', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (548, '', 'Unmarried', '', false, 'Library ', 'Library Information Assistant', '1985-12-09', '', '2957', NULL, 'YMIUB Amarasena', '853443298V', 'user2957', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (552, '', 'Unmarried', '', false, 'Faculty of Education', 'Management Assistant', '1995-10-08', '', '4513', NULL, 'HJN Hewawasam', '957821626V', 'user4513', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (559, '', 'Married', '', false, 'CETMe', 'Technical Officer', '1983-05-01', '', '4808', NULL, 'RMDYU Kumara', '831220635V', 'user4808', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (564, '', 'Married', '', false, 'CETMe', 'Technical Officer', '1991-12-07', '', '4809', NULL, 'MJ Lakshitha ', '913423542V', 'user4809', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (571, '', 'Married', '', false, 'Department of Language Studies', 'Management Assistant', '1993-06-12', '', '4531', NULL, 'PGSA Gunasena', '936640150V', 'user4531', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (577, '', 'Married', '', false, 'Dpt of Early Childhood & Tertiary Education', 'Management Assistant', '1995-03-28', '', '4539', NULL, 'PKSS Perera', '955883306V', 'user4539', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (585, '', 'Married', '', false, 'IT Division', 'Technical Officer', '1994-12-05', '', '4820', NULL, 'MPRB Nimalarathna', '943404410V', 'user4820', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (591, '', 'Married', '', false, 'IT Division', 'Technical Officer', '1993-04-14', '', '4825', NULL, 'ACSA De Silva', '936050867V', 'user4825', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (599, '', 'Married', '', false, 'Non Academic Establishment', 'Management Assistant', '1993-03-26', '', '4517', NULL, 'MLN Cooray', '935860202V', 'user4517', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (602, '', 'Married', '', false, 'RES/BRC', 'Management Assistant', '1980-02-05', '', '4640', NULL, 'J Birinthika', '805361433V', 'user4640', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (609, '', 'Married', '', false, 'Maintenance Division', 'Supervisor (Civil)', '1991-04-19', '', '4796', NULL, 'WMC Kumara', '199111001505', 'user4796', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (615, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', 'Technical Officer', '1982-09-15', '', '4876', NULL, 'MHLC Hettiarachchi', '198225904670', 'user4876', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (628, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer (Probationary)', '2025-03-21', '', '3412', NULL, 'Isuru Asanga Premarathne', 'XX', 'user3412', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (634, '', 'Married', '', false, 'Department of Physics', 'Lecturer (Probationary)', '2025-03-21', '', '4970', NULL, 'Dr. UDG Maduranga', 'XX', 'user4970', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (640, '', 'Married', '', false, 'Department of Mathematics', 'Senior Lecturer', '2025-03-21', '', '106', NULL, 'MAP De Silva', 'XX', 'user106', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (645, '', 'Married', '', false, 'Information Technology Division', 'Technical Officer', '1996-08-20', '', '4828', NULL, 'KLRM Siwasinghe', '962332331 V', 'user4828', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (651, '', 'Unmarried', '', false, 'Supplies Division', 'Management Assistant', '2025-03-21', '', '5374', NULL, 'DMAB Dissanayake', 'XX', 'user5374', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (657, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1993-11-25', '', '5790', NULL, 'WALP Fernando', '933301192V', 'user5790', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (663, '', 'Unmarried', '', false, 'Early Childhood & Primary Education', 'Lecturer', '1991-03-26', '', '5949', NULL, 'R.Devendran', '199108603363', 'user5949', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (668, '', 'Married', '', false, 'RES', 'Management Assistant', '2025-03-21', '', '269', NULL, 'JAA Jayakody', '710981256V', 'user269', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (674, '', 'Unmarried', '', false, 'Dept of Civil Engineering', 'Technical Officer', '1989-10-31', '', '4805', NULL, 'IDD Lal', '893050272V', 'user4805', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (678, '', 'Married', '', false, 'FMS', 'WorksAide', '1970-02-10', '', '280', NULL, 'MDP Lakshman', '700413411V', 'user280', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (682, '', 'Unmarried', '', false, 'Department of Social Studies', 'Senior Lecturer', '1979-12-29', '', '163', NULL, 'KLE Karunadasa', '798643223V', 'user163', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (687, '', 'Unmarried', '', false, 'Landscape Division', 'Works Aide', '1986-06-14', '', '3014', NULL, 'BPD Ranasinghe', '861660850V', 'user3014', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (691, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', 'Lecturer', '1992-06-24', '', '4943', NULL, 'RMPMD Rathnayake', '926760890V', 'user4943', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (708, '', 'Married', '', false, 'Examination Division', 'Management Assistant', '1993-12-23', '', '4043', NULL, 'RMCW Senavirathna', '938584419V', 'user4043', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (715, '', 'Married', '', false, 'Finance Division', 'Bursar', '2025-03-21', '', '2073', NULL, 'WMKGA Wickramasing', 'XX', 'user2073', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (720, '', 'Unmarried', '', false, 'Department of Accounting & Finance', 'Lecturer', '1979-12-15', '', '6175', NULL, 'SMDCW Senarathne', '793502605V', 'user6175', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (726, '', 'Married', '', false, 'Press', 'Forman', '1987-11-27', '', '2416', NULL, 'PRASS Gamage', '813323850V', 'user2416', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (734, '', 'Married', '', false, 'Dept of Civil Engineering', 'Lecturer', '1979-05-24', '', '4874', NULL, 'AMLN Gunathilaka', '791452007V', 'user4874', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (739, '', 'Unmarried', '', false, 'Department of Language Studies', 'Lecturer', '1992-08-24', '', '6008', NULL, 'NHL Abeysinghe', '927371227V', 'user6008', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (741, '', 'Married', '', false, 'Dept. of Psychology and Counselling ', 'Lecturer', '1989-11-11', '', '6037', NULL, 'EDC Dilhani', '898160025V', 'user6037', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (103, '', 'Married', '', false, 'Examination Division', 'Works Aide', '1969-07-15', '', '174', NULL, 'EMN Balasooriya', '691972046V', 'user174', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (752, '', 'Unmarried', '', false, 'Department of Computer Science', 'Lecturer', '1997-10-30', '', '5998', NULL, 'AVSP Pabasarani', '199780403259', 'user5998', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (758, '', 'Unmarried', '', false, 'STE', 'Management Assistant', '1971-09-04', '', '5368', NULL, 'CA Gunarathne', '717480627V', 'user5368', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (621, '', 'Unmarried', '', false, 'STE', 'Lecturer', '1992-03-10', '', '4877', NULL, 'WMAPS Fernando', '199257000495', 'user4877', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (763, '', 'Married', '', false, 'MLS', 'Lecturer', '1992-06-14', '', '6069', NULL, 'HJRL Silva', '926663054V', 'user6069', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (482, '', 'Married', '', false, 'Anuradhapura Regional Center', 'Staff Management Assistant', '1965-05-31', '', '360', NULL, 'EWGS Abeywickrama', '651522285V', 'user360', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (489, '', 'Married', '', false, 'Faculty of Management Studies', 'Dean', '1972-06-05', '', '173', NULL, 'V Sivalogathasan', '721570517V', 'user173', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (494, '', 'Married', '', false, 'IT Division', 'Assistant Network Manager', '1983-10-09', '', '3690', NULL, 'MMZ Hussain', '832830720V', 'user3690', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (498, '', 'Married', '', false, 'RES', 'Technical Officer', '1973-10-08', '', '1218', NULL, 'HA Sanjeewa', '732820868V', 'user1218', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (505, '', 'Married', '', false, 'RES - Bandarawela', 'Senior Staff Management Assistant', '1974-01-22', '', '324', NULL, 'BASNC Bulathsinghala', '745221394V', 'user324', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (511, '', 'Married', '', false, 'Capital works & Planning', 'Senior Assistant Registrar', '1986-04-28', '', '4383', NULL, 'M Arunshankar', '861193713V', 'user4383', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (521, '', 'Married', '', false, 'Department of Social Studies', 'Senior Lecturer', '1976-08-27', '', '1113', NULL, 'S Pathmanesan', '762401746', 'user1113', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (523, '', 'Married', '', false, 'Matale Study Center', 'Works Aide', '1978-09-15', '', '2522', NULL, 'MGS Wijesingha', 'XX', 'user2522', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (529, '', 'Married', '', false, 'Matara Regional Center', NULL, '1985-05-25', '', '2743', NULL, 'WGS Sandamalie', '856461114V', 'user2743', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (536, '', 'Married', '', false, 'General Administration Division', 'Management Assistant', '1994-01-17', '', '4512', NULL, 'PMDC Henepolawaththa', '940173981V', 'user4512', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (543, '', 'Married', '', false, 'Agriculture & Plantation Engineering', 'Senior Lecturer', '1964-12-13', '', '122', NULL, 'PKJ De Mel (Original)', '643480808V', 'user122', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (549, '', 'Married', '', false, 'Department of Botany', 'Lab Assistant', '1973-02-05', '', '592', NULL, 'KKDT Wijesinghe', '730361807V', 'user592', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (554, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '1963-07-04', '', '99', NULL, 'M Thayaparam', '636861731V', 'user99', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (560, '', 'Unmarried', '', false, 'CETMe', NULL, '1993-10-21', '', '4810', NULL, 'WAD Lakshan', '932953226V', 'user4810', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (566, '', 'Unmarried', '', false, 'Examination Division', 'Management Assistant', '1996-12-23', '', '4528', NULL, 'NM Hettiarachchi', '968582500V', 'user4528', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (578, '', 'Married', '', false, 'Capital Works & Planning', 'Management Assistant', '1996-08-20', '', '2995', NULL, 'DSM Hapuarachchi', '967331899V', 'user2995', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (584, '', 'Married', '', false, 'IT Division', 'Technical Officer', '1989-01-23', '', '4823', NULL, 'DS Vidusanka', '890233716V', 'user4823', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (588, '', 'Unmarried', '', false, 'IT Division', 'Technical Officer', '1997-09-27', '', '4834', NULL, 'MAAK Manthilaka', '972713856V', 'user4834', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (592, '', 'Married', '', false, 'Audit', 'Technical Officer', '1989-12-12', '', '4790', NULL, 'AV Perera', '898470229V', 'user4790', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (597, '', 'Unmarried', '', false, 'Non Academic Establishment', 'Management Assistant', '1999-06-21', '', '4529', NULL, 'EUL Soyza', '996730263V', 'user4529', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (603, '', 'Married', '', false, 'Library', 'Library Information Assistant', '2025-03-21', '', '4816', NULL, 'AKC Perera', '198483202326', 'user4816', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (607, '', 'Married', '', false, 'Central Dispatch Unit', 'Management Assistant', '1991-02-19', '', '4534', NULL, 'MRL Mapatuna', '915501028V', 'user4534', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (617, '', 'Married', '', false, 'Kandy Regional Centre', 'Technical Officer', '1992-11-16', '', '4875', NULL, 'HMSM Bandara', '916081740v', 'user4875', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (623, '', 'Married', '', false, 'Examination Division', 'Office Machine Oparator', '2025-03-21', '', '2030', NULL, 'NK Arachchige', 'XX', 'user2030', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (629, '', 'Married', '', false, 'Dean,s office Faculty of Natural Sciences', 'Works Aide', '2025-03-21', '', '3013', NULL, 'WMJB Weerakoon', 'XX', 'user3013', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (635, '', 'Married', '', false, 'RES-Kegalle sc.', 'Assistant Director', '2025-03-21', '', '2047', NULL, 'RTS Fernando', 'XX', 'user2047', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (641, '', 'Unmarried', '', false, 'Department of Physics', 'Senior Lecturer', '1986-03-29', '', '4871', NULL, 'HMPS Herath', '865890338', 'user4871', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (647, '', 'Unmarried', '', false, 'RES-Polonnaruwa', 'Management Assistant', '2025-03-21', '', '1084', NULL, 'WAP Wijekoon', 'XX', 'user1084', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (653, '', 'Married', '', false, 'Academic Establishment', 'Management Assistant', '1993-06-30', '', '4042', NULL, 'SMN Samarasinghe', '936822002V', 'user4042', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (660, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1992-12-25', '', '5793', NULL, 'NM Siyad', '923600060V', 'user5793', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (667, '', 'Unmarried', '', false, 'Department of Physics', 'Senior Lecturer Grade II', '1979-08-07', '', '5327', NULL, 'NUS Yapa', '797200328V', 'user5327', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (673, '', 'Married', '', false, 'KRC', 'Senior Assistant Bursar ', '2025-03-21', '', '1002', NULL, 'KGDB Katupulla', 'XX', 'user1002', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (677, '', 'Married', '', false, 'SSD', 'Senior Lecturer', '1983-04-04', '', '1529', NULL, 'ARDSSMRBH Angammana', '830950737V', 'user1529', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (681, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1964-01-09', '', '110', NULL, 'MHMND Herath', '196400901355', 'user110', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (712, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1992-07-08', '', '5987', NULL, 'MD Ruwanthi Nayomi', '926900110', 'user5987', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (718, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '2025-03-21', '', '6141', NULL, 'HMM Caldera', '886770162V', 'user6141', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (724, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '2025-03-21', '', '6001', NULL, 'PK Adhihetty', 'XX', 'user6001', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (730, '', 'Unmarried', '', false, 'Department of Language Studies', NULL, '1981-02-27', '', '4650', NULL, 'HNNN Menike', '198155802063', 'user4650', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (736, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Lecturer', '1975-04-01', '', '1143', NULL, 'HDNS Priyankara', '750923070V', 'user1143', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (740, '', 'Unmarried', '', false, 'IT Division', 'TO', '1990-01-05', '', '2700', NULL, 'MALC Siriwardane', '900054300V', 'user2700', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (745, '', 'Married', '', false, 'Press', 'Asst. Printer', '1982-06-23', '', '4692', NULL, 'WADS Kumara', '198217503228', 'user4692', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (751, '', 'Unmarried', '', false, 'Finance Division', 'Deputy Bursar', '1975-02-01', '', '27', NULL, 'NTA Weerasinghe', '755320234V', 'user27', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (755, '', 'Married', '', false, 'Vice Chancellor''s Office', 'Works Aide', '1993-02-21', '', '3611', NULL, 'GP Bogahawatta', '930520462V', 'user3611', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (761, '', 'Married', '', false, 'Faculty of Natural Science', 'Management Assistant', '1981-07-10', '', '752', NULL, 'NWC Kularathne', '816921252V', 'user752', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (767, '', 'Unmarried', '', false, 'Dpt of Early Childhood & Tertiary Education', 'Management Assistant', '1988-05-05', '', 'New', NULL, 'JAD Nilwala', '886261861V', 'userNew', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (483, '', 'Married', '', false, 'Matale Study Center', 'Management Assistant', '1978-12-16', '', '2214', NULL, 'SDMPK Siriwardhana', '783511037V', 'user2214', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (487, '', 'Unmarried', '', false, 'Department of Chemistry', 'Senior Lecturer', '1981-08-16', '', '4328', NULL, 'SK Rodrigo', '812293362V', 'user4328', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (493, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', 'Technical Officer', '1986-09-02', '', '2211', NULL, 'PDDK Perera', '862461916V', 'user2211', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (500, '', 'Married', '', false, 'Faculty of Natural Science', 'Technical Officer', '1987-08-30', '', '3884', NULL, 'MANVB Manthilake', '198724303180', 'user3884', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (506, '', 'Married', '', false, 'Maintenance Division', 'Works Aide', '1992-04-30', '', '4020', NULL, 'SGM Manoj', '921212909V', 'user4020', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (512, '', 'Married', '', false, 'Student affaires & Administration', 'Senior Staff Management Assistant', '1975-02-21', '', '329', NULL, 'MKW Sahabandu', '755522805V', 'user329', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (522, '', 'Married', '', false, 'General Administration Division', 'Assistant Registrar', '1983-09-26', '', '4409', NULL, 'HKIP Abeysinghe', '837703344V', 'user4409', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (527, '', 'Unmarried', '', false, 'Finance Division', 'Management Assistant', '1993-10-05', '', '3938', NULL, 'HI Dhananjaya', '199327901340', 'user3938', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (531, '', 'Married', '', false, 'Department of Organizational studies', 'Senior Lecturer', '1980-06-29', '', '1842', NULL, 'HMJCB Heenkenda', '801814751V', 'user1842', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (535, '', 'Married', '', false, 'Department of Zoology', 'Technical Officer', '1990-11-14', '', '4422', NULL, 'AMPEK Atapattu', '908190696 V', 'user4422', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (542, '', 'Married', '', false, 'Maintenance Division', 'Draughtmen', '1991-06-16', '', '4869', NULL, 'HKSR Kelum', '911681986V', 'user4869', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (545, '', 'Married', '', false, 'Security Division', NULL, '1979-02-21', '', '2121', NULL, 'WWSB Kumarasinghe', '790524438V', 'user2121', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (550, '', 'Married', '', false, 'Colombo Regional Centre', 'Management Assistant', '1983-04-13', '', '566', NULL, 'CD Wickramasooriya', '198310401706', 'user566', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (556, '', 'Married', '', false, 'Faculty of Health Science', 'Management Assistant', '1997-08-14', '', '4538', NULL, 'NS Jayaweera', '977273420V', 'user4538', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (562, '', 'Married', '', false, 'CETMe', 'Illustrationist', '1984-06-10', '', '4445', NULL, 'NK Alahendra', '846623680V', 'user4445', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (569, '', 'Unmarried', '', false, 'Maintenance Division', 'Draughtmen', '1992-03-19', '', '4868', NULL, 'KMAU Jayasundara', '920792413V', 'user4868', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (575, '', 'Unmarried', '', false, 'Finance Division', 'Management Assistant', '1995-09-26', '', '4511', NULL, 'HVT Prabath', '199527000049', 'user4511', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (580, '', 'Unmarried', '', false, 'Faculty of Engineering Technology', 'Management Assistant', '1992-04-09', '', '4523', NULL, 'SAHR Subasinghe', '926000071V', 'user4523', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (586, '', 'Unmarried', '', false, 'IT Division', 'Technical Officer', '1993-01-18', '', '4826', NULL, 'WPE Dayarathna', '930180106V', 'user4826', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (594, '', 'Married', '', false, 'Internal Audit Division', 'Audit Assistant', '1982-10-13', '', '4792', NULL, 'RLACI Rathnayake', '198228702514', 'user4792', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (600, '', 'Married', '', false, 'Security Division', 'Security Inspector', '1989-06-25', '', '4772', NULL, 'M Alahakoon', '198917701460', 'user4772', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (608, '', 'Married', '', false, 'Finance Division', 'Works Aide', '1993-12-25', '', '3011', NULL, 'HMDK Herath', '933604691V', 'user3011', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (614, '', 'Unmarried', '', false, 'Department Of Textile & Apparel Technology', 'Technical Officer', '1988-06-26', '', '4807', NULL, 'KVC Kehelpannala', '198867801156', 'user4807', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (620, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Professor', '2025-03-21', '', '677', NULL, 'HUW Rathnayake', 'XX', 'user677', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (626, '', 'Married', '', false, 'Central Dispatch Unit', 'Management Assistant', '2025-03-21', '', '357', NULL, 'KHG Kanthimala', 'XX', 'user357', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (632, '', 'Unmarried', '', false, 'Department Of Nursing', 'Lecturer', '1967-05-20', '', '100', NULL, 'AVP Madhviu', '676410767V', 'user100', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (637, '', 'Married', '', false, 'Dept of Civil Engineering', NULL, '2025-03-21', '', '549', NULL, 'Dilruk Indika Fernando', 'XX', 'user549', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (644, '', 'Unmarried', '', false, 'Information Technology Division', 'Technical Officer', '2025-03-21', '', '4536', NULL, 'AMLT Bandara', 'XX', 'user4536', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (650, '', 'Married', '', false, 'Colombo Regional Centre', 'Management Assistant', '1984-08-17', '', '5369', NULL, 'RDN Karunasena', '842300665V', 'user5369', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (656, '', 'Unmarried', '', false, 'Department of Botany', 'Senior Lecturer', '1972-11-25', '', '6005', NULL, 'MAPB Dilhan', '723302552V', 'user6005', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (662, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1994-11-18', '', '5944', NULL, 'WUM  Welikanna', '948230623V', 'user5944', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (669, '', 'Unmarried', '', false, 'Deans office Education', 'Assistant Registrar', '1990-04-13', '', '3513', NULL, 'NP Wickramasuriya', '199060400360', 'user3513', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (675, '', 'Married', '', false, 'Department of Secoundary & Tertiary Education', 'Lecturer', '1991-01-19', '', '4945', NULL, 'NGLSJ Liyanage', '199151900650', 'user4945', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (679, '', 'Unmarried', '', false, 'Department Of Legal Studies', 'Senior Lecturer Grade II', '1988-11-05', '', '2042', NULL, 'WASS Wijeshighe', '883100484V', 'user2042', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (683, '', 'Married', '', false, 'Security Division', 'Security Guard', '1977-01-29', '', '5047', NULL, 'KMG Kulathunga', '197702900619', 'user5047', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (688, '', 'Married', '', false, 'Special Needs Education', 'Lecturer', '1976-10-17', '', '5992', NULL, 'DMG Ranasinghe', '767911254 V', 'user5992', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (692, '', 'Unmarried', '', false, 'Library', 'Librarian', '1964-05-29', '', '2081', NULL, 'HPSD Gunasekara', '196465000826', 'user2081', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (697, '', 'Married', '', false, 'Department of Accounting & Finance', 'Senior Lecturer', '1983-01-09', '', '5928', NULL, 'KVA  Shantha', '830091718V', 'user5928', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (700, '', 'Unmarried', '', false, 'Department of Human Resource  Managent', 'Lecturer', '1995-05-03', '', '5885', NULL, 'R.Vinothra', '956241057V', 'user5885', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (704, '', 'Married', '', false, 'Department of Social Studies', 'Senior Lecturer Grade II', '1990-01-22', '', '5726', NULL, 'KAS Hasangani', '905223453V', 'user5726', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (709, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1991-11-14', '', '3631', NULL, 'KMGY Sewwandi', '918191720V', 'user3631', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (714, '', 'Unmarried', '', false, 'Special Needs Education', 'Lecturer', '1986-10-31', '', '5950', NULL, 'WAWGPN Weerasinghe', '198680502180', 'user5950', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (721, '', 'Unmarried', '', false, 'Department of Organizational studies', 'Lecturer', '1997-10-06', '', '5994', NULL, 'AND Ashoka', '977802008V', 'user5994', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (727, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Lecturer', '1981-05-22', '', '1710', NULL, 'PTR Dabare', 'XX', 'user1710', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (742, '', 'Married', '', false, 'Department Of Mechanical Engineering', NULL, '1990-11-11', '', '2619', NULL, 'RLK Lokuliyana', '903163623V', 'user2619', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (747, '', 'Unmarried', '', false, 'Faculty of Engineering Technology', 'TO', '1995-09-18', '', '6006', NULL, 'KGSKS Wijethunga', '957623220V', 'user6006', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (753, '', 'Unmarried', '', false, 'Department of Pharmacy', NULL, '1991-04-20', '', '6095', NULL, 'SBHP Kumari', '916112637V', 'user6095', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (764, '', 'Married', '', false, 'KRC', 'Management Assistant', '1979-02-10', '', '2783', NULL, 'M Karunakaran', '790410149V', 'user2783', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (485, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Senior Lecturer', '1966-03-04', '', '117', NULL, 'H Pasqual', '665640140V', 'user117', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (492, '', 'Married', '', false, 'RES - Ambalantota Study Center', 'Assistant Director', '1981-04-27', '', '2046', NULL, 'AGA Sampath', '198111801161', 'user2046', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (501, '', 'Married', '', false, 'Maintenance Division', 'Management Assistant III', '1978-09-12', '', '2581', NULL, 'LJD Premadasa', '197875603074', 'user2581', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (507, '', 'Married', '', false, 'Faculty of Natural Science', 'Senior Lecturer', '1972-06-11', '', '669', NULL, 'KC Weerakoon', '726630119V', 'user669', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (513, '', 'Married', '', false, 'Department of Pharmacy', 'Management Assistant', '1993-09-28', '', '2980', NULL, 'WGPL Wedagedara', '937722370V', 'user2980', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (517, '', 'Married', '', false, 'RES', 'Ass Director', '1976-08-31', '', '2036', NULL, 'K Kanthawel', '197624402582', 'user2036', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (524, '', 'Married', '', false, 'Library', 'Library Information Assistant', '1987-07-30', '', '2087', NULL, 'HKH Wijesooriya', '872121684V', 'user2087', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (532, '', 'Married', '', false, 'Department of Social Studies', 'Senior Lecturer Grade I', '1975-05-20', '', '1510', NULL, 'N Balamurali', '751411243V', 'user1510', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (538, '', 'Unmarried', '', false, 'General Administration Division', 'Management Assistant', '1992-07-22', '', '4515', NULL, 'PRKM Karunathilake', '927041600V', 'user4515', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (544, '', 'Married', '', false, 'Kandy Regional Centre', 'Shroff', '1974-05-28', '', '579', NULL, 'KPSI Jayaratna', '741490196V', 'user579', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (553, '', 'Unmarried', '', false, 'Faculty of Education', 'Management Assistant', '1996-11-06', '', '4504', NULL, 'RAMS Perera', '199681101485', 'user4504', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (557, '', 'Unmarried', '', false, 'CETMe', 'Technical Officer', '1990-06-20', '', '4811', NULL, 'SAKS Sooriyapperuma', '901720797V', 'user4811', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (563, '', 'Married', '', false, 'CETMe', NULL, '1987-10-06', '', '4813', NULL, 'WAKC Perera', '872801340V', 'user4813', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (568, '', 'Unmarried', '', false, 'Examination Division', 'Management Assistant', '1997-06-23', '', '4541', NULL, 'KLU Silva', '976753658V', 'user4541', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (574, '', 'Unmarried', '', false, 'Faculty of Natural Science', NULL, '1995-12-04', '', '4533', NULL, 'KGC Nuwanthi', '958393784V', 'user4533', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (581, '', 'Married', '', false, 'Director office, RES', 'Management Assistant', '1997-07-11', '', '4065', NULL, 'MAF Asheefa', '976930185V', 'user4065', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (587, '', 'Married', '', false, 'IT Division', NULL, '1989-02-10', '', '4827', NULL, 'WDR Viduranga', '198904100162', 'user4827', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (595, '', 'Married', '', false, 'Internal Audit Division', 'Audit Assistant', '1989-09-29', '', '4793', NULL, 'HVCV Vithana', '892734305V', 'user4793', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (601, '', 'Married', '', false, 'Batticaloa Regional Center', 'Management Assistant', '1988-09-16', '', '2809', NULL, 'MBD Mohamed', '885600092V', 'user2809', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (606, '', 'Married', '', false, 'Maintenance Division', 'Civil Supervisor', '1982-12-04', '', '4818', NULL, 'JHM Buddika', '198233900459', 'user4818', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (612, '', 'Married', '', false, 'Maintenance Division', 'Civil Supervisor', '1988-05-06', '', '4795', NULL, 'WMEB Weerasooriya', '881270323V', 'user4795', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (618, '', 'Unmarried', '', false, 'IT Division', 'Technical Officer', '1992-04-13', '', '4863', NULL, 'SMLS Dasanayaka', 'XX', 'user4863', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (624, '', 'Married', '', false, 'Landscape Division', 'Works Aide', '2025-03-21', '', '1924', NULL, 'MS Perera', 'XX', 'user1924', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (630, '', 'Married', '', false, 'Department of Mathematics', 'Lecturer (Probationary)', '2025-03-21', '', '4873', NULL, 'SMNSK Seneviratne', 'XX', 'user4873', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (636, '', 'Married', '', false, 'Department of Chemistry', 'Professor', '2025-03-21', '', '2322', NULL, 'Prof.R Senthilnithy', 'XX', 'user2322', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (642, '', 'Unmarried', '', false, 'Department of Mathematics', 'Lecturer (Probationary)', '1948-04-05', '', '4880', NULL, 'DBD Chamaleen', '915490824V', 'user4880', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (648, '', 'Married', '', false, 'RES- Ambalangoda Study Centre', 'Management Assistant', '2025-03-21', '', '2780', NULL, 'GLASP Kumari', 'XX', 'user2780', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (655, '', 'Married', '', false, 'Ampara Study Centre', 'Management Assistant', '1991-09-11', '', '5497', NULL, 'AGNP  Alpitiya', '917551014V', 'user5497', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (661, '', 'Married', '', false, 'Dispatch Unit', 'Works Aide', '1995-08-24', '', '3617', NULL, 'GDN Perera', '952372149V', 'user3617', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (665, '', 'Married', '', false, 'Colombo Regional Centre', 'Works Aide', '1990-12-09', '', '2764', NULL, 'PMKP Dhanushka', '903440023', 'user2764', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (686, '', 'Married', '', false, 'Security Division', 'Security', '1976-05-11', '', '3563', NULL, 'RM Bandara', '761323555V', 'user3563', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (690, '', 'Married', '', false, 'IRU', 'Assistant Director', '1982-12-17', '', '2378', NULL, 'KCC Perera', '828521802V', 'user2378', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (703, '', 'Married', '', false, 'Department of Social Studies', 'Management Assistant', '1981-10-04', '', '5370', NULL, 'AGNP Kumara', 'XX', 'user5370', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (707, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1978-05-05', '', '5946', NULL, 'NC Wanigasuriya', '781261009V', 'user5946', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (711, '', 'Unmarried', '', false, 'RES', 'AD', '2025-03-21', '', '4404', NULL, 'LMSS Bandara', 'XX', 'user4404', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (716, '', 'Unmarried', '', false, 'Department of Marketting Management', 'Lecturer', '1991-06-30', '', '5855', NULL, 'RHAT Perera', '916820437V', 'user5855', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (722, '', 'Unmarried', '', false, 'Department of Organizational studies', 'Lecturer', '1995-12-18', '', '5995', NULL, 'DRP Upananda', '958533241V', 'user5995', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (728, '', 'Married', '', false, 'Maintenance Division', 'Electrician', '1985-10-30', '', '2990', NULL, 'GN Priyadarshana', '198530405276', 'user2990', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (733, '', 'Married', '', false, 'NODES', 'Assistant Director', '1981-12-17', '', '6197', NULL, 'A Madushi', '818523416V', 'user6197', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (738, '', 'Married', '', false, 'Department of Language Studies', 'Lecturer', '1979-05-22', '', '2423', NULL, 'A Vinothani', '197964300109', 'user2423', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (744, '', 'Married', '', false, 'Examination Division', 'Management Assistant', '1995-07-17', '', '3000', NULL, 'EGHM Abeyrathne', '951990868V', 'user3000', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (749, '', 'Unmarried', '', false, 'Department of Chemistry', NULL, '1982-05-10', '', '1469', NULL, 'Asela Dikkumbura', '821310326V', 'user1469', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (754, '', 'Married', '', false, 'Department of Pharmacy', 'Lecturer', '1987-11-03', '', '6094', NULL, 'JAL Anjalee', '878083091v', 'user6094', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (759, '', 'Unmarried', '', false, 'Faculty of Bna. Sc.', NULL, '2025-03-21', '', '3002', NULL, 'WMM Weththamuni', 'XX', 'user3002', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (765, '', 'Unmarried', '', false, 'Department Of Nursing', 'Lecturer', '1994-09-28', '', '6068', NULL, 'RAMSDL Jayathilake', '947724495V', 'user6068', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (486, '', 'Married', '', false, 'Colombo Regional Centre', 'Management Assistant', '1988-08-11', '', '2210', NULL, 'RWMISR Rajakaruna', '887242640V', 'user2210', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (491, '', 'Married', '', false, 'Ambalangoda Study Center', 'Staff Management Assistant', '1965-12-23', '', '966', NULL, 'KS Perera', '658580680V', 'user966', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (497, '', 'Married', '', false, 'CETMe', 'Lecturer (Probationary)', '1973-05-12', '', '2384', NULL, 'S Tilakawardane', '731333017V', 'user2384', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (503, '', 'Married', '', false, 'RES - Bandarawela', 'Assistant Director', '1981-08-02', '', '2049', NULL, 'AMSD Adikari', '812150898V', 'user2049', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (508, '', 'Married', '', false, 'Supplies Division', 'Management Assistant', '1995-02-26', '', '4048', NULL, 'VKDM Karunarathne', '950572280V', 'user4048', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (514, '', 'Married', '', false, 'Matara Regional Center', 'SSMA', '1966-06-09', '', '226', NULL, 'DS Liyanagunawardane', '666610334V', 'user226', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (519, '', 'Married', '', false, 'Landscape Division', 'Works Aide', '1979-11-26', '', '2530', NULL, 'AKGRB Aththanakumbura', '793313772V', 'user2530', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (525, '', 'Married', '', false, 'Department of Organizational studies', 'Lecturer (Probationary)', '1988-09-23', '', '4141', NULL, 'DK Sewwandi', '887670692V', 'user4141', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (530, '', 'Unmarried', '', false, 'Transort & Postal Division', 'Management Assistant', '1978-02-23', '', '5372', NULL, 'WMDRB Weerasinghe', '197805404490', 'user5372', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (537, '', 'Married', '', false, 'Kandy Regional Centre', 'Lab Attendant', '1987-12-09', '', '1862', NULL, 'DMM Dissanayake', '873440198V', 'user1862', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (541, '', 'Married', '', false, 'Department of Botany', 'Senior Lecturer', '1967-11-08', '', '129', NULL, 'KARS Perera', '196737300607V', 'user129', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (546, '', 'Married', '', false, 'Kandy Regional Centre', 'Library Information Assistant', '1984-09-19', '', '954', NULL, 'DGC Priyadarshani', '847632887V', 'user954', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (555, '', 'Unmarried', '', false, 'Finance Division', 'Works Aide', '1996-03-02', '', '3615', NULL, 'MWY Sadaruwan', '960621018V', 'user3615', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (561, '', 'Married', '', false, 'CETMe', 'Illustrationist', '1990-07-23', '', '4444', NULL, 'SH Daladawatta', '199020500094', 'user4444', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (567, '', 'Married', '', false, 'Maintenance Division', 'Draughtmen', '1993-12-02', '', '4870', NULL, 'DK Dhanukshika', '938370109V', 'user4870', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (573, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer Grade II', '1977-12-18', '', '849', NULL, 'DDDH Alwis', '778532174V', 'user849', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (579, '', 'Married', '', false, 'Department of Physics', 'Senior Lecturer', '1961-12-24', '', '59', NULL, 'KND Bandara', '618591727V', 'user59', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (583, '', 'Unmarried', '', false, 'IT Division', 'Technical Officer', '1992-12-07', '', '4833', NULL, 'THM Anuruddhika', '928423158V', 'user4833', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (589, '', 'Married', '', false, 'PI  Division', 'Web Admin', '1991-01-22', '', '4830', NULL, 'MGMP Kalhara', '910220802V', 'user4830', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (593, '', 'Married', '', false, 'Internal Audit Division', 'Audit Assistant', '1996-10-11', '', '4791', NULL, 'BTM Wickramasinghe', '962851878V', 'user4791', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (598, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Senior Lecturer', '1984-07-13', '', '2597', NULL, 'US Premarathne', '846950010V', 'user2597', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (605, '', 'Unmarried', '', false, 'Faculty of Health Science', 'Management Assistant', '1975-12-04', '', '4089', NULL, 'DLC Mallika', '197583902503', 'user4089', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (613, '', 'Married', '', false, 'Department of Mathematics', 'Senior Lecturer', '1966-10-03', '', '740', NULL, 'KDVF Siriwardana', '667770114V', 'user740', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (619, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '2025-03-21', '', '5002', NULL, 'TLD Fernando', 'XX', 'user5002', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (625, '', 'Married', '', false, 'CETMe', 'Technical officer', '2025-03-21', '', '4814', NULL, 'EH Chamila Nilan', 'XX', 'user4814', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (631, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer (Probationary)', '1983-11-23', '', '2472', NULL, 'GSN Meedin', '198382802130', 'user2472', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (638, '', 'Married', '', false, 'Dept of Civil Engineering', 'Senior Lecturer', '2025-03-21', '', '4575', NULL, 'Isuru Sanjaya Kumara Wijewarnadana', 'XX', 'user4575', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (643, '', 'Married', '', false, 'RES-CRC', 'Management Assistant', '2025-03-21', '', '1184', NULL, 'TDCP Chandrarathne', 'XX', 'user1184', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (654, '', 'Married', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1990-12-13', '', '5791', NULL, 'KDB Aratthanage', '903483490V', 'user5791', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (659, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1983-10-11', '', '5948', NULL, 'NI Vithanage', '832853801V', 'user5948', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (666, '', 'Unmarried', '', false, 'Faculty of Education', 'Works Aide', '1994-05-15', '', '3390', NULL, 'MTK Weerakkodi', '941362435V', 'user3390', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (696, '', 'Unmarried', '', false, 'Maintenance Division', 'Works Aide', '1988-02-06', '', '3872', NULL, 'HAKT Priyadarshana', '980373983V', 'user3872', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (699, '', 'Unmarried', '', false, 'Dept of Civil Engineering', 'Senior Lecturer', '1965-06-01', '', '5433', NULL, 'C.Kulasuriya', '651531284V', 'user5433', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (702, '', 'Married', '', false, 'Department Of Nursing', 'Lecturer', '1984-04-24', '', '5943', NULL, 'GAGS  Yasarathne', '846150200V', 'user5943', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (713, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '1990-07-23', '', '5993', NULL, 'Dr.R. Rushanan', '902051899V', 'user5993', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (719, '', 'Married', '', false, 'Statistical Unit', 'Management Assistant', '2025-03-21', '', '3519', NULL, 'HN Guruge', 'XX', 'user3519', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (725, '', 'Married', '', false, 'Department of Chemistry', 'Lecturer', '1975-05-30', '', '5997', NULL, 'N Selvanantharajah', '751511515V', 'user5997', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (732, '', 'Married', '', false, 'Student affaires & Administration', 'SMA', '1983-02-17', '', '2385', NULL, 'GDMP Perera', '821991412V', 'user2385', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (737, '', 'Married', '', false, 'Dept of Civil Engineering', 'Lecturer', '1978-03-21', '', '6198', NULL, 'AG Jayasinghe ', '785813189V', 'user6198', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (649, '', 'Unmarried', '', false, 'Dept of Civil Engineering', 'Management Assistant', '1974-02-12', '', '5371', NULL, 'AHTNS Wijenayake', '725451296V', 'user5371', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (743, '', 'Married', '', false, 'Department Of Textile & Apparel Technology', NULL, '1993-09-06', '', '6514', NULL, 'MADS Priyakumari', '937500084V', 'user6514', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (746, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Lecturer', '1988-10-28', '', '4971', NULL, 'NC Tanthirigoda', '883020146V', 'user4971', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (750, '', 'Unmarried', '', false, 'Badulla Regional Centre', NULL, '2001-01-05', '', '6053', NULL, 'MDDL Karunasena', '200100503302', 'user6053', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (757, '', 'Married', '', false, 'STE', 'Works Aide', '1986-03-02', '', '2763', NULL, 'PKNS Thilakarathyne', '860621428V', 'user2763', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (762, '', 'Married', '', false, 'MLS', 'Lecturer', '1985-12-24', '', '5999', NULL, 'RMIU Rathnayake', '19858592402', 'user5999', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (768, '', 'Married', '', false, 'SDC', 'Works Aide', '1971-05-12', '', '2705', NULL, 'HYK Sirimali', '197163302578V', 'user2705', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (490, '', 'Unmarried', '', false, 'Department of Physics', 'Senior Professor', '1960-05-08', '', '1124', NULL, 'JCN Rajendra', '601291215V', 'user1124', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (496, '', 'Unmarried', '', false, 'Agriculture & Plantation Engineering', 'Management Assistant', '1993-12-24', '', '4046', NULL, 'HKMRS Wickramasinghe', '938592918V', 'user4046', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (502, '', 'Married', '', false, 'Maintenance Division', 'Works Aide', '1987-12-04', '', '2528', NULL, 'DMAS Dissanayaka', '873391731V', 'user2528', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (510, '', 'Unmarried', '', false, 'Dpt of Psycology & Counselling', 'Senior Lecturer', '1974-10-11', '', '4138', NULL, 'MP Dissanayake', '197478501263', 'user4138', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (515, '', 'Married', '', false, 'Landscape Division', 'Worksaide', '1999-05-17', '', '3876', NULL, 'GWS Perera', '996380025V', 'user3876', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (518, '', 'Married', '', false, 'Kandy Regional Centre', 'Technical Officer', '1982-12-19', '', '2447', NULL, 'IP Kongahakotuwa', '198285400203', 'user2447', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (526, '', 'Married', '', false, 'Department of Chemistry', 'Senior Lecturer', '1984-11-13', '', '4251', NULL, 'JIKG Jayalath', '848183172V', 'user4251', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (533, '', 'Married', '', false, 'Department of Zoology', 'Senior Lecturer', '1975-02-19', '', '2432', NULL, 'PJ Jude', '750502245V', 'user2432', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (539, '', 'Married', '', false, 'Department of Zoology', 'Senior Lecturer', '1978-12-05', '', '4643', NULL, 'WWP Rodigro', '788402023V', 'user4643', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (547, '', 'Married', '', false, 'Kandy Regional Centre', 'Library Information Assistant', '1972-09-11', '', '1212', NULL, 'TMPS Thennakoon', '727551417V', 'user1212', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (551, '', 'Married', '', false, 'Colombo Regional Centre', 'Management Assistant', '1983-08-25', '', '2254', NULL, 'RASS Kulathunga', '198323803864', 'user2254', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (558, '', 'Married', '', false, 'CETMe', 'Technical Officer', '1991-10-05', '', '4815', NULL, 'HHMP Kumara', '912792064V', 'user4815', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (565, '', 'Married', '', false, 'Department of Mathematics', 'Senior Lecturer', '1961-05-18', '', '90', NULL, 'WCW Nawaratna', '616390058V', 'user90', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (570, '', 'Unmarried', '', false, 'Anuradhapura Regional Center', 'Library Attendent', '1989-11-16', '', '2280', NULL, 'KMKN Senarathne', '893214291V', 'user2280', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (576, '', 'Unmarried', '', false, 'Finance Division', 'Management Assistant', '1990-04-24', '', '1978', NULL, 'BKC Deshapriya', '906150328V', 'user1978', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (582, '', 'Married', '', false, 'IT Division', 'Technical Officer', '1996-09-04', '', '4824', NULL, 'APP Udayanga', '962483810V', 'user4824', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (590, '', 'Unmarried', '', false, 'IT Division', 'Technical Officer', '1993-08-19', '', '4829', NULL, 'TP Ranasinghe', '937321252V', 'user4829', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (596, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Technical Officer', '1987-06-04', '', '4817', NULL, 'DPMR Pieris', '871562164V', 'user4817', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (604, '', 'Married', '', false, 'Department of Pharmacy', 'Technical Officer', '1993-12-09', '', '4474', NULL, 'PI Helanka', '938441154V', 'user4474', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (610, '', 'Married', '', false, 'Maintenance Division', 'Supervisor (Civil)', '1989-10-03', '', '4797', NULL, 'KGKP Thhilakawardana', '198927701154', 'user4797', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (616, '', 'Married', '', false, 'Press', 'Litho Artist', '1980-06-06', '', '4881', NULL, 'BS Deepa Kumara', '801580254v', 'user4881', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (622, '', 'Unmarried', '', false, 'Kurunegala Regional Educational Services', 'Management Assistant', '2025-03-21', '', '2796', NULL, 'RMRP Gunawardhana', 'XX', 'user2796', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (627, '', 'Unmarried', '', false, 'Transort & Postal Division', 'Assistant Registrar', '2025-03-21', '', '4408', NULL, 'MPG Silva', 'XX', 'user4408', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (633, '', 'Married', '', false, 'Printing Press', 'Works Aide', '2025-03-21', '', '3871', NULL, 'HSM Mendis', 'XX', 'user3871', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (639, '', 'Married', '', false, 'Department of Mathematics', 'Lecturer (Probationary)', '2025-03-21', '', '4882', NULL, 'MI Irshad', 'XX', 'user4882', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (646, '', 'Married', '', false, 'Department of Mathematics', 'Works Aide', '2025-03-21', '', '3391', NULL, 'SMUD Perera', 'XX', 'user3391', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (652, '', 'Married', '', false, 'Department Of Legal Studies', 'Lecturer', '1971-03-27', '', '181', NULL, 'RMMSME Goonethilake', '715871009V', 'user181', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (658, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Lecturer', '1995-07-13', '', '5800', NULL, 'K. Jeyachandran', '956951305V', 'user5800', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (664, '', 'Married', '', false, 'Health Education and Research', 'Lecturer', '1993-07-09', '', '4799', NULL, 'SDSR Karunarathne', '199369100920', 'user4799', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (672, '', 'Unmarried', '', false, 'Department of Botany', 'Senior Lecturer', '1984-01-21', '', '2459', NULL, 'Dr.S.M.M.P.K Seneviratne', '845212384V', 'user2459', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (676, '', 'Married', '', false, 'Department Of Mechanical Engineering', 'Lecturer', '1980-04-25', '', '3411', NULL, 'IPTS Wickramasooriya', '801161545V', 'user3411', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (680, '', 'Married', '', false, 'Department of Physics', 'Senior Lecturer', '1982-03-21', '', '5977', NULL, 'HVUA Abeywickrema', '198208101160', 'user5977', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (689, '', 'Unmarried', '', false, 'Medical Laboratory Sciences', 'Lecturer', '1994-02-07', '', '5912', NULL, 'GGYH Weerasinghe', '199453801230', 'user5912', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (693, '', 'Married', '', false, 'Department of Botany', 'Senior Lecturer', '2025-03-21', '', '1506', NULL, 'LDK Marasinghe', 'XX', 'user1506', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (698, '', 'Unmarried', '', false, 'Department Of Electrical & Comupter Engineering', 'Senior Lecturer', '2025-03-21', '', '128', NULL, 'Gehan Anthonys', 'XX', 'user128', '', 0, 'Not Set', 'accepted');
INSERT INTO public.member VALUES (701, '', 'Married', '', false, 'Security Division', 'Security', '1971-01-10', '', '260', NULL, 'WPK Priyantha', '197101002880', 'user260', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (705, '', 'Unmarried', '', false, 'Dept of Civil Engineering', 'Senior Lecturer', '2441-04-20', '', '3376', NULL, 'GN Paranawithana', '197721300040', 'user3376', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (710, '', 'Married', '', false, 'Bandarawela SC', 'Caretaker', '1979-06-21', '', '2222', NULL, 'AMLJ Somaratna', '791732743V', 'user2222', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (717, '', 'Unmarried', '', false, 'Department of Marketting Management', 'Lecturer', '2025-03-21', '', '5854', NULL, 'TH Rathnayake', '912210960V', 'user5854', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (723, '', 'Married', '', false, 'Department Of Legal Studies', 'Senior Lecturer', '1973-05-17', '', '161', NULL, 'Y Kathirgamathamhy', '197363800080', 'user161', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (729, '', 'Married', '', false, 'RES', 'Works Aide', '1983-06-03', '', '2799', NULL, 'S Joihikaran', '836553780V', 'user2799', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (735, '', 'Unmarried', '', false, 'Dept of Civil Engineering', 'Lecturer', '1997-05-17', '', '6056', NULL, 'AMD Rathnayake', '971381540V', 'user6056', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (684, '', 'Unmarried', '', false, 'Department Of Mechanical Engineering', NULL, '1995-06-01', '', '5751', NULL, 'RAKK Perera', '951530239V', 'user5751', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (748, '', 'Married', '', false, 'Faculty of Engineering Technology', 'SSMA', '1969-09-30', '', '326', NULL, 'BWMSC Jayarathne', '697742476V', 'user326', '', 0, 'Female', 'accepted');
INSERT INTO public.member VALUES (756, '', 'Married', '', false, 'RES-Polonnaruwa', 'Works Aide', '1987-02-16', '', '6388', NULL, 'RMRSB Rathnayake', '198704701173', 'user6388', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (766, '', 'Unmarried', '', false, 'Department Of Nursing', 'Lecturer', '1997-03-12', '', '6067', NULL, 'S Elango', '970722874V', 'user6067', '', 0, 'Male', 'accepted');
INSERT INTO public.member VALUES (769, '', 'Married', '', false, 'Department of Mathematics', 'Lecturer', '1954-07-28', '', '4872', NULL, 'CW Sahabandu ', '957101240V', 'user4872', '', 0, 'Female', 'accepted');


--
-- Data for Name: member_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member_registration VALUES (1, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 1);
INSERT INTO public.member_registration VALUES (2, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 2);
INSERT INTO public.member_registration VALUES (3, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 3);
INSERT INTO public.member_registration VALUES (4, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 4);
INSERT INTO public.member_registration VALUES (5, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 5);
INSERT INTO public.member_registration VALUES (6, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 6);
INSERT INTO public.member_registration VALUES (7, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 7);
INSERT INTO public.member_registration VALUES (8, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 8);
INSERT INTO public.member_registration VALUES (9, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 9);
INSERT INTO public.member_registration VALUES (10, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 10);
INSERT INTO public.member_registration VALUES (11, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 11);
INSERT INTO public.member_registration VALUES (12, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 12);
INSERT INTO public.member_registration VALUES (13, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 13);
INSERT INTO public.member_registration VALUES (14, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 15);
INSERT INTO public.member_registration VALUES (15, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 14);
INSERT INTO public.member_registration VALUES (16, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 16);
INSERT INTO public.member_registration VALUES (17, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 17);
INSERT INTO public.member_registration VALUES (18, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 18);
INSERT INTO public.member_registration VALUES (19, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 19);
INSERT INTO public.member_registration VALUES (20, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 20);
INSERT INTO public.member_registration VALUES (21, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 21);
INSERT INTO public.member_registration VALUES (22, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 22);
INSERT INTO public.member_registration VALUES (23, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 23);
INSERT INTO public.member_registration VALUES (24, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 24);
INSERT INTO public.member_registration VALUES (25, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 25);
INSERT INTO public.member_registration VALUES (26, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 26);
INSERT INTO public.member_registration VALUES (27, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 27);
INSERT INTO public.member_registration VALUES (28, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 28);
INSERT INTO public.member_registration VALUES (29, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 29);
INSERT INTO public.member_registration VALUES (30, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 30);
INSERT INTO public.member_registration VALUES (31, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 31);
INSERT INTO public.member_registration VALUES (32, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 32);
INSERT INTO public.member_registration VALUES (33, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 33);
INSERT INTO public.member_registration VALUES (34, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 34);
INSERT INTO public.member_registration VALUES (35, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 35);
INSERT INTO public.member_registration VALUES (36, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 36);
INSERT INTO public.member_registration VALUES (37, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 37);
INSERT INTO public.member_registration VALUES (39, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 38);
INSERT INTO public.member_registration VALUES (38, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 39);
INSERT INTO public.member_registration VALUES (40, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 41);
INSERT INTO public.member_registration VALUES (41, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 42);
INSERT INTO public.member_registration VALUES (42, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 43);
INSERT INTO public.member_registration VALUES (43, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 44);
INSERT INTO public.member_registration VALUES (44, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 45);
INSERT INTO public.member_registration VALUES (45, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 40);
INSERT INTO public.member_registration VALUES (46, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 46);
INSERT INTO public.member_registration VALUES (47, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 48);
INSERT INTO public.member_registration VALUES (48, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 47);
INSERT INTO public.member_registration VALUES (49, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 49);
INSERT INTO public.member_registration VALUES (50, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 50);
INSERT INTO public.member_registration VALUES (51, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 51);
INSERT INTO public.member_registration VALUES (52, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 53);
INSERT INTO public.member_registration VALUES (53, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 54);
INSERT INTO public.member_registration VALUES (54, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 55);
INSERT INTO public.member_registration VALUES (55, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 56);
INSERT INTO public.member_registration VALUES (56, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 57);
INSERT INTO public.member_registration VALUES (57, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 58);
INSERT INTO public.member_registration VALUES (58, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 59);
INSERT INTO public.member_registration VALUES (59, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 60);
INSERT INTO public.member_registration VALUES (60, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 61);
INSERT INTO public.member_registration VALUES (61, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 62);
INSERT INTO public.member_registration VALUES (62, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 63);
INSERT INTO public.member_registration VALUES (63, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 64);
INSERT INTO public.member_registration VALUES (64, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 65);
INSERT INTO public.member_registration VALUES (65, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 66);
INSERT INTO public.member_registration VALUES (66, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 67);
INSERT INTO public.member_registration VALUES (67, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 68);
INSERT INTO public.member_registration VALUES (68, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 69);
INSERT INTO public.member_registration VALUES (69, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 70);
INSERT INTO public.member_registration VALUES (70, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 71);
INSERT INTO public.member_registration VALUES (71, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 72);
INSERT INTO public.member_registration VALUES (72, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 73);
INSERT INTO public.member_registration VALUES (73, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 74);
INSERT INTO public.member_registration VALUES (74, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 75);
INSERT INTO public.member_registration VALUES (75, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 76);
INSERT INTO public.member_registration VALUES (76, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 77);
INSERT INTO public.member_registration VALUES (77, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 78);
INSERT INTO public.member_registration VALUES (78, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 79);
INSERT INTO public.member_registration VALUES (79, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 80);
INSERT INTO public.member_registration VALUES (80, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 81);
INSERT INTO public.member_registration VALUES (81, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 82);
INSERT INTO public.member_registration VALUES (82, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 83);
INSERT INTO public.member_registration VALUES (83, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 84);
INSERT INTO public.member_registration VALUES (84, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 85);
INSERT INTO public.member_registration VALUES (85, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 86);
INSERT INTO public.member_registration VALUES (86, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 87);
INSERT INTO public.member_registration VALUES (87, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 88);
INSERT INTO public.member_registration VALUES (88, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 89);
INSERT INTO public.member_registration VALUES (89, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 90);
INSERT INTO public.member_registration VALUES (90, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 91);
INSERT INTO public.member_registration VALUES (91, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 92);
INSERT INTO public.member_registration VALUES (92, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 93);
INSERT INTO public.member_registration VALUES (93, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 94);
INSERT INTO public.member_registration VALUES (94, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 95);
INSERT INTO public.member_registration VALUES (95, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 96);
INSERT INTO public.member_registration VALUES (96, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 97);
INSERT INTO public.member_registration VALUES (97, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 98);
INSERT INTO public.member_registration VALUES (98, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 99);
INSERT INTO public.member_registration VALUES (99, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 100);
INSERT INTO public.member_registration VALUES (100, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 101);
INSERT INTO public.member_registration VALUES (101, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 102);
INSERT INTO public.member_registration VALUES (102, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 103);
INSERT INTO public.member_registration VALUES (103, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 104);
INSERT INTO public.member_registration VALUES (104, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 105);
INSERT INTO public.member_registration VALUES (105, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 106);
INSERT INTO public.member_registration VALUES (106, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 107);
INSERT INTO public.member_registration VALUES (107, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 108);
INSERT INTO public.member_registration VALUES (108, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 109);
INSERT INTO public.member_registration VALUES (109, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 110);
INSERT INTO public.member_registration VALUES (110, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 111);
INSERT INTO public.member_registration VALUES (111, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 112);
INSERT INTO public.member_registration VALUES (112, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 113);
INSERT INTO public.member_registration VALUES (113, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 114);
INSERT INTO public.member_registration VALUES (114, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 115);
INSERT INTO public.member_registration VALUES (115, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 116);
INSERT INTO public.member_registration VALUES (116, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 117);
INSERT INTO public.member_registration VALUES (117, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 118);
INSERT INTO public.member_registration VALUES (118, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 119);
INSERT INTO public.member_registration VALUES (119, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 120);
INSERT INTO public.member_registration VALUES (120, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 121);
INSERT INTO public.member_registration VALUES (121, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 122);
INSERT INTO public.member_registration VALUES (122, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 123);
INSERT INTO public.member_registration VALUES (123, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 124);
INSERT INTO public.member_registration VALUES (124, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 125);
INSERT INTO public.member_registration VALUES (125, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 126);
INSERT INTO public.member_registration VALUES (126, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 127);
INSERT INTO public.member_registration VALUES (127, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 128);
INSERT INTO public.member_registration VALUES (128, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 129);
INSERT INTO public.member_registration VALUES (129, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 130);
INSERT INTO public.member_registration VALUES (130, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 131);
INSERT INTO public.member_registration VALUES (131, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 132);
INSERT INTO public.member_registration VALUES (132, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 133);
INSERT INTO public.member_registration VALUES (133, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 134);
INSERT INTO public.member_registration VALUES (134, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 135);
INSERT INTO public.member_registration VALUES (135, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 136);
INSERT INTO public.member_registration VALUES (136, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 137);
INSERT INTO public.member_registration VALUES (141, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 142);
INSERT INTO public.member_registration VALUES (147, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 148);
INSERT INTO public.member_registration VALUES (153, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 154);
INSERT INTO public.member_registration VALUES (158, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 159);
INSERT INTO public.member_registration VALUES (165, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 166);
INSERT INTO public.member_registration VALUES (172, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 173);
INSERT INTO public.member_registration VALUES (176, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 177);
INSERT INTO public.member_registration VALUES (182, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 184);
INSERT INTO public.member_registration VALUES (190, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 191);
INSERT INTO public.member_registration VALUES (196, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 197);
INSERT INTO public.member_registration VALUES (202, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 203);
INSERT INTO public.member_registration VALUES (208, 1, '2025-03-21', '2025-03-21', 'Individual ', 2025, 209);
INSERT INTO public.member_registration VALUES (214, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 215);
INSERT INTO public.member_registration VALUES (221, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 222);
INSERT INTO public.member_registration VALUES (226, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 227);
INSERT INTO public.member_registration VALUES (232, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 233);
INSERT INTO public.member_registration VALUES (238, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 239);
INSERT INTO public.member_registration VALUES (243, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 244);
INSERT INTO public.member_registration VALUES (252, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 253);
INSERT INTO public.member_registration VALUES (257, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 258);
INSERT INTO public.member_registration VALUES (263, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 263);
INSERT INTO public.member_registration VALUES (274, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 277);
INSERT INTO public.member_registration VALUES (280, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 283);
INSERT INTO public.member_registration VALUES (285, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 288);
INSERT INTO public.member_registration VALUES (294, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 297);
INSERT INTO public.member_registration VALUES (295, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 298);
INSERT INTO public.member_registration VALUES (301, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 304);
INSERT INTO public.member_registration VALUES (309, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 312);
INSERT INTO public.member_registration VALUES (315, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 318);
INSERT INTO public.member_registration VALUES (320, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 323);
INSERT INTO public.member_registration VALUES (327, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 330);
INSERT INTO public.member_registration VALUES (335, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 338);
INSERT INTO public.member_registration VALUES (339, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 342);
INSERT INTO public.member_registration VALUES (346, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 349);
INSERT INTO public.member_registration VALUES (352, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 355);
INSERT INTO public.member_registration VALUES (358, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 361);
INSERT INTO public.member_registration VALUES (364, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 367);
INSERT INTO public.member_registration VALUES (370, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 373);
INSERT INTO public.member_registration VALUES (376, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 379);
INSERT INTO public.member_registration VALUES (384, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 387);
INSERT INTO public.member_registration VALUES (390, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 393);
INSERT INTO public.member_registration VALUES (395, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 398);
INSERT INTO public.member_registration VALUES (401, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 404);
INSERT INTO public.member_registration VALUES (406, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 409);
INSERT INTO public.member_registration VALUES (414, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 417);
INSERT INTO public.member_registration VALUES (420, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 423);
INSERT INTO public.member_registration VALUES (425, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 428);
INSERT INTO public.member_registration VALUES (137, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 138);
INSERT INTO public.member_registration VALUES (143, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 144);
INSERT INTO public.member_registration VALUES (149, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 150);
INSERT INTO public.member_registration VALUES (156, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 157);
INSERT INTO public.member_registration VALUES (162, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 163);
INSERT INTO public.member_registration VALUES (168, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 169);
INSERT INTO public.member_registration VALUES (174, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 175);
INSERT INTO public.member_registration VALUES (180, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 181);
INSERT INTO public.member_registration VALUES (185, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 186);
INSERT INTO public.member_registration VALUES (192, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 193);
INSERT INTO public.member_registration VALUES (197, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 199);
INSERT INTO public.member_registration VALUES (205, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 206);
INSERT INTO public.member_registration VALUES (210, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 210);
INSERT INTO public.member_registration VALUES (216, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 217);
INSERT INTO public.member_registration VALUES (220, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 221);
INSERT INTO public.member_registration VALUES (223, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 225);
INSERT INTO public.member_registration VALUES (229, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 230);
INSERT INTO public.member_registration VALUES (235, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 236);
INSERT INTO public.member_registration VALUES (241, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 242);
INSERT INTO public.member_registration VALUES (248, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 248);
INSERT INTO public.member_registration VALUES (255, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 256);
INSERT INTO public.member_registration VALUES (264, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 265);
INSERT INTO public.member_registration VALUES (268, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 270);
INSERT INTO public.member_registration VALUES (273, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 276);
INSERT INTO public.member_registration VALUES (279, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 282);
INSERT INTO public.member_registration VALUES (287, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 290);
INSERT INTO public.member_registration VALUES (293, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 296);
INSERT INTO public.member_registration VALUES (298, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 301);
INSERT INTO public.member_registration VALUES (304, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 307);
INSERT INTO public.member_registration VALUES (310, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 313);
INSERT INTO public.member_registration VALUES (316, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 319);
INSERT INTO public.member_registration VALUES (323, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 326);
INSERT INTO public.member_registration VALUES (330, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 333);
INSERT INTO public.member_registration VALUES (336, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 339);
INSERT INTO public.member_registration VALUES (342, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 345);
INSERT INTO public.member_registration VALUES (348, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 351);
INSERT INTO public.member_registration VALUES (355, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 358);
INSERT INTO public.member_registration VALUES (361, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 364);
INSERT INTO public.member_registration VALUES (365, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 368);
INSERT INTO public.member_registration VALUES (374, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 377);
INSERT INTO public.member_registration VALUES (380, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 383);
INSERT INTO public.member_registration VALUES (387, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 390);
INSERT INTO public.member_registration VALUES (391, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 394);
INSERT INTO public.member_registration VALUES (398, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 401);
INSERT INTO public.member_registration VALUES (404, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 407);
INSERT INTO public.member_registration VALUES (409, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 412);
INSERT INTO public.member_registration VALUES (418, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 421);
INSERT INTO public.member_registration VALUES (423, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 426);
INSERT INTO public.member_registration VALUES (427, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 430);
INSERT INTO public.member_registration VALUES (138, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 139);
INSERT INTO public.member_registration VALUES (144, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 145);
INSERT INTO public.member_registration VALUES (150, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 151);
INSERT INTO public.member_registration VALUES (155, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 156);
INSERT INTO public.member_registration VALUES (161, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 162);
INSERT INTO public.member_registration VALUES (167, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 168);
INSERT INTO public.member_registration VALUES (173, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 174);
INSERT INTO public.member_registration VALUES (179, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 180);
INSERT INTO public.member_registration VALUES (186, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 187);
INSERT INTO public.member_registration VALUES (191, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 192);
INSERT INTO public.member_registration VALUES (198, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 198);
INSERT INTO public.member_registration VALUES (203, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 204);
INSERT INTO public.member_registration VALUES (211, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 212);
INSERT INTO public.member_registration VALUES (217, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 218);
INSERT INTO public.member_registration VALUES (225, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 226);
INSERT INTO public.member_registration VALUES (228, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 229);
INSERT INTO public.member_registration VALUES (236, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 237);
INSERT INTO public.member_registration VALUES (244, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 245);
INSERT INTO public.member_registration VALUES (250, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 251);
INSERT INTO public.member_registration VALUES (256, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 257);
INSERT INTO public.member_registration VALUES (261, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 262);
INSERT INTO public.member_registration VALUES (266, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 267);
INSERT INTO public.member_registration VALUES (272, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 275);
INSERT INTO public.member_registration VALUES (278, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 281);
INSERT INTO public.member_registration VALUES (283, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 286);
INSERT INTO public.member_registration VALUES (291, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 294);
INSERT INTO public.member_registration VALUES (300, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 303);
INSERT INTO public.member_registration VALUES (306, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 309);
INSERT INTO public.member_registration VALUES (311, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 314);
INSERT INTO public.member_registration VALUES (317, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 320);
INSERT INTO public.member_registration VALUES (324, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 327);
INSERT INTO public.member_registration VALUES (328, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 331);
INSERT INTO public.member_registration VALUES (334, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 337);
INSERT INTO public.member_registration VALUES (340, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 343);
INSERT INTO public.member_registration VALUES (345, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 348);
INSERT INTO public.member_registration VALUES (351, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 354);
INSERT INTO public.member_registration VALUES (357, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 360);
INSERT INTO public.member_registration VALUES (366, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 369);
INSERT INTO public.member_registration VALUES (371, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 374);
INSERT INTO public.member_registration VALUES (378, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 381);
INSERT INTO public.member_registration VALUES (382, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 385);
INSERT INTO public.member_registration VALUES (388, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 391);
INSERT INTO public.member_registration VALUES (394, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 397);
INSERT INTO public.member_registration VALUES (402, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 405);
INSERT INTO public.member_registration VALUES (407, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 410);
INSERT INTO public.member_registration VALUES (412, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 415);
INSERT INTO public.member_registration VALUES (415, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 418);
INSERT INTO public.member_registration VALUES (424, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 427);
INSERT INTO public.member_registration VALUES (139, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 140);
INSERT INTO public.member_registration VALUES (146, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 147);
INSERT INTO public.member_registration VALUES (152, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 153);
INSERT INTO public.member_registration VALUES (159, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 160);
INSERT INTO public.member_registration VALUES (164, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 165);
INSERT INTO public.member_registration VALUES (171, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 172);
INSERT INTO public.member_registration VALUES (175, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 176);
INSERT INTO public.member_registration VALUES (181, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 182);
INSERT INTO public.member_registration VALUES (188, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 189);
INSERT INTO public.member_registration VALUES (194, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 195);
INSERT INTO public.member_registration VALUES (200, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 201);
INSERT INTO public.member_registration VALUES (206, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 207);
INSERT INTO public.member_registration VALUES (212, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 213);
INSERT INTO public.member_registration VALUES (218, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 219);
INSERT INTO public.member_registration VALUES (227, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 228);
INSERT INTO public.member_registration VALUES (233, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 234);
INSERT INTO public.member_registration VALUES (239, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 240);
INSERT INTO public.member_registration VALUES (246, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 247);
INSERT INTO public.member_registration VALUES (251, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 252);
INSERT INTO public.member_registration VALUES (258, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 259);
INSERT INTO public.member_registration VALUES (262, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 264);
INSERT INTO public.member_registration VALUES (265, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 266);
INSERT INTO public.member_registration VALUES (271, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 274);
INSERT INTO public.member_registration VALUES (276, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 279);
INSERT INTO public.member_registration VALUES (281, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 284);
INSERT INTO public.member_registration VALUES (288, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 291);
INSERT INTO public.member_registration VALUES (290, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 293);
INSERT INTO public.member_registration VALUES (297, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 300);
INSERT INTO public.member_registration VALUES (303, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 306);
INSERT INTO public.member_registration VALUES (308, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 311);
INSERT INTO public.member_registration VALUES (314, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 317);
INSERT INTO public.member_registration VALUES (319, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 322);
INSERT INTO public.member_registration VALUES (325, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 328);
INSERT INTO public.member_registration VALUES (332, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 335);
INSERT INTO public.member_registration VALUES (338, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 341);
INSERT INTO public.member_registration VALUES (344, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 347);
INSERT INTO public.member_registration VALUES (350, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 353);
INSERT INTO public.member_registration VALUES (353, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 356);
INSERT INTO public.member_registration VALUES (359, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 362);
INSERT INTO public.member_registration VALUES (367, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 370);
INSERT INTO public.member_registration VALUES (372, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 375);
INSERT INTO public.member_registration VALUES (377, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 380);
INSERT INTO public.member_registration VALUES (383, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 386);
INSERT INTO public.member_registration VALUES (389, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 392);
INSERT INTO public.member_registration VALUES (396, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 399);
INSERT INTO public.member_registration VALUES (400, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 403);
INSERT INTO public.member_registration VALUES (408, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 411);
INSERT INTO public.member_registration VALUES (413, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 416);
INSERT INTO public.member_registration VALUES (419, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 422);
INSERT INTO public.member_registration VALUES (426, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 429);
INSERT INTO public.member_registration VALUES (140, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 141);
INSERT INTO public.member_registration VALUES (145, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 146);
INSERT INTO public.member_registration VALUES (151, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 152);
INSERT INTO public.member_registration VALUES (157, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 158);
INSERT INTO public.member_registration VALUES (163, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 164);
INSERT INTO public.member_registration VALUES (169, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 170);
INSERT INTO public.member_registration VALUES (177, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 178);
INSERT INTO public.member_registration VALUES (183, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 183);
INSERT INTO public.member_registration VALUES (187, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 188);
INSERT INTO public.member_registration VALUES (193, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 194);
INSERT INTO public.member_registration VALUES (199, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 200);
INSERT INTO public.member_registration VALUES (204, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 205);
INSERT INTO public.member_registration VALUES (209, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 211);
INSERT INTO public.member_registration VALUES (215, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 216);
INSERT INTO public.member_registration VALUES (222, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 223);
INSERT INTO public.member_registration VALUES (230, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 231);
INSERT INTO public.member_registration VALUES (237, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 238);
INSERT INTO public.member_registration VALUES (242, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 243);
INSERT INTO public.member_registration VALUES (247, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 249);
INSERT INTO public.member_registration VALUES (254, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 255);
INSERT INTO public.member_registration VALUES (260, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 261);
INSERT INTO public.member_registration VALUES (270, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 273);
INSERT INTO public.member_registration VALUES (277, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 280);
INSERT INTO public.member_registration VALUES (284, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 287);
INSERT INTO public.member_registration VALUES (289, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 292);
INSERT INTO public.member_registration VALUES (299, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 302);
INSERT INTO public.member_registration VALUES (305, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 308);
INSERT INTO public.member_registration VALUES (312, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 315);
INSERT INTO public.member_registration VALUES (318, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 321);
INSERT INTO public.member_registration VALUES (322, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 325);
INSERT INTO public.member_registration VALUES (329, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 332);
INSERT INTO public.member_registration VALUES (333, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 336);
INSERT INTO public.member_registration VALUES (341, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 344);
INSERT INTO public.member_registration VALUES (347, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 350);
INSERT INTO public.member_registration VALUES (354, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 357);
INSERT INTO public.member_registration VALUES (360, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 363);
INSERT INTO public.member_registration VALUES (363, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 366);
INSERT INTO public.member_registration VALUES (369, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 372);
INSERT INTO public.member_registration VALUES (373, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 376);
INSERT INTO public.member_registration VALUES (379, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 382);
INSERT INTO public.member_registration VALUES (386, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 389);
INSERT INTO public.member_registration VALUES (393, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 396);
INSERT INTO public.member_registration VALUES (399, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 402);
INSERT INTO public.member_registration VALUES (405, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 408);
INSERT INTO public.member_registration VALUES (411, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 414);
INSERT INTO public.member_registration VALUES (416, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 420);
INSERT INTO public.member_registration VALUES (421, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 424);
INSERT INTO public.member_registration VALUES (142, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 143);
INSERT INTO public.member_registration VALUES (148, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 149);
INSERT INTO public.member_registration VALUES (154, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 155);
INSERT INTO public.member_registration VALUES (160, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 161);
INSERT INTO public.member_registration VALUES (166, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 167);
INSERT INTO public.member_registration VALUES (170, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 171);
INSERT INTO public.member_registration VALUES (178, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 179);
INSERT INTO public.member_registration VALUES (189, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 190);
INSERT INTO public.member_registration VALUES (195, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 196);
INSERT INTO public.member_registration VALUES (201, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 202);
INSERT INTO public.member_registration VALUES (207, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 208);
INSERT INTO public.member_registration VALUES (213, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 214);
INSERT INTO public.member_registration VALUES (219, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 220);
INSERT INTO public.member_registration VALUES (224, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 224);
INSERT INTO public.member_registration VALUES (231, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 232);
INSERT INTO public.member_registration VALUES (234, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 235);
INSERT INTO public.member_registration VALUES (240, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 241);
INSERT INTO public.member_registration VALUES (245, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 246);
INSERT INTO public.member_registration VALUES (249, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 250);
INSERT INTO public.member_registration VALUES (253, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 254);
INSERT INTO public.member_registration VALUES (259, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 260);
INSERT INTO public.member_registration VALUES (267, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 268);
INSERT INTO public.member_registration VALUES (269, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 272);
INSERT INTO public.member_registration VALUES (275, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 278);
INSERT INTO public.member_registration VALUES (282, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 285);
INSERT INTO public.member_registration VALUES (286, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 289);
INSERT INTO public.member_registration VALUES (292, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 295);
INSERT INTO public.member_registration VALUES (296, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 299);
INSERT INTO public.member_registration VALUES (302, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 305);
INSERT INTO public.member_registration VALUES (307, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 310);
INSERT INTO public.member_registration VALUES (313, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 316);
INSERT INTO public.member_registration VALUES (321, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 324);
INSERT INTO public.member_registration VALUES (326, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 329);
INSERT INTO public.member_registration VALUES (331, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 334);
INSERT INTO public.member_registration VALUES (337, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 340);
INSERT INTO public.member_registration VALUES (343, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 346);
INSERT INTO public.member_registration VALUES (349, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 352);
INSERT INTO public.member_registration VALUES (356, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 359);
INSERT INTO public.member_registration VALUES (362, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 365);
INSERT INTO public.member_registration VALUES (368, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 371);
INSERT INTO public.member_registration VALUES (375, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 378);
INSERT INTO public.member_registration VALUES (381, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 384);
INSERT INTO public.member_registration VALUES (385, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 388);
INSERT INTO public.member_registration VALUES (392, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 395);
INSERT INTO public.member_registration VALUES (397, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 400);
INSERT INTO public.member_registration VALUES (403, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 406);
INSERT INTO public.member_registration VALUES (410, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 413);
INSERT INTO public.member_registration VALUES (417, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 419);
INSERT INTO public.member_registration VALUES (422, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 425);
INSERT INTO public.member_registration VALUES (428, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 431);
INSERT INTO public.member_registration VALUES (429, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 432);
INSERT INTO public.member_registration VALUES (430, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 433);
INSERT INTO public.member_registration VALUES (431, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 434);
INSERT INTO public.member_registration VALUES (432, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 435);
INSERT INTO public.member_registration VALUES (433, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 436);
INSERT INTO public.member_registration VALUES (434, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 437);
INSERT INTO public.member_registration VALUES (435, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 438);
INSERT INTO public.member_registration VALUES (436, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 439);
INSERT INTO public.member_registration VALUES (437, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 440);
INSERT INTO public.member_registration VALUES (438, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 441);
INSERT INTO public.member_registration VALUES (439, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 442);
INSERT INTO public.member_registration VALUES (440, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 443);
INSERT INTO public.member_registration VALUES (441, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 444);
INSERT INTO public.member_registration VALUES (442, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 445);
INSERT INTO public.member_registration VALUES (443, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 446);
INSERT INTO public.member_registration VALUES (444, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 447);
INSERT INTO public.member_registration VALUES (445, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 448);
INSERT INTO public.member_registration VALUES (446, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 449);
INSERT INTO public.member_registration VALUES (447, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 450);
INSERT INTO public.member_registration VALUES (448, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 451);
INSERT INTO public.member_registration VALUES (449, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 452);
INSERT INTO public.member_registration VALUES (450, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 453);
INSERT INTO public.member_registration VALUES (451, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 454);
INSERT INTO public.member_registration VALUES (452, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 455);
INSERT INTO public.member_registration VALUES (453, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 456);
INSERT INTO public.member_registration VALUES (454, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 457);
INSERT INTO public.member_registration VALUES (455, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 458);
INSERT INTO public.member_registration VALUES (456, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 459);
INSERT INTO public.member_registration VALUES (457, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 460);
INSERT INTO public.member_registration VALUES (458, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 461);
INSERT INTO public.member_registration VALUES (459, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 462);
INSERT INTO public.member_registration VALUES (460, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 463);
INSERT INTO public.member_registration VALUES (461, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 464);
INSERT INTO public.member_registration VALUES (462, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 465);
INSERT INTO public.member_registration VALUES (463, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 466);
INSERT INTO public.member_registration VALUES (464, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 467);
INSERT INTO public.member_registration VALUES (465, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 468);
INSERT INTO public.member_registration VALUES (466, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 469);
INSERT INTO public.member_registration VALUES (467, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 470);
INSERT INTO public.member_registration VALUES (468, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 471);
INSERT INTO public.member_registration VALUES (469, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 472);
INSERT INTO public.member_registration VALUES (470, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 473);
INSERT INTO public.member_registration VALUES (471, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 474);
INSERT INTO public.member_registration VALUES (472, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 475);
INSERT INTO public.member_registration VALUES (473, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 476);
INSERT INTO public.member_registration VALUES (474, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 477);
INSERT INTO public.member_registration VALUES (475, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 478);
INSERT INTO public.member_registration VALUES (476, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 479);
INSERT INTO public.member_registration VALUES (477, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 480);
INSERT INTO public.member_registration VALUES (478, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 481);
INSERT INTO public.member_registration VALUES (479, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 482);
INSERT INTO public.member_registration VALUES (480, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 483);
INSERT INTO public.member_registration VALUES (481, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 484);
INSERT INTO public.member_registration VALUES (482, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 486);
INSERT INTO public.member_registration VALUES (483, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 485);
INSERT INTO public.member_registration VALUES (484, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 487);
INSERT INTO public.member_registration VALUES (485, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 488);
INSERT INTO public.member_registration VALUES (486, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 489);
INSERT INTO public.member_registration VALUES (487, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 490);
INSERT INTO public.member_registration VALUES (488, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 491);
INSERT INTO public.member_registration VALUES (489, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 492);
INSERT INTO public.member_registration VALUES (490, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 493);
INSERT INTO public.member_registration VALUES (491, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 494);
INSERT INTO public.member_registration VALUES (492, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 495);
INSERT INTO public.member_registration VALUES (493, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 496);
INSERT INTO public.member_registration VALUES (494, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 497);
INSERT INTO public.member_registration VALUES (495, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 498);
INSERT INTO public.member_registration VALUES (496, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 499);
INSERT INTO public.member_registration VALUES (497, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 500);
INSERT INTO public.member_registration VALUES (498, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 501);
INSERT INTO public.member_registration VALUES (499, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 502);
INSERT INTO public.member_registration VALUES (500, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 503);
INSERT INTO public.member_registration VALUES (501, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 504);
INSERT INTO public.member_registration VALUES (502, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 505);
INSERT INTO public.member_registration VALUES (503, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 506);
INSERT INTO public.member_registration VALUES (504, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 507);
INSERT INTO public.member_registration VALUES (505, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 508);
INSERT INTO public.member_registration VALUES (506, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 510);
INSERT INTO public.member_registration VALUES (507, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 511);
INSERT INTO public.member_registration VALUES (508, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 512);
INSERT INTO public.member_registration VALUES (509, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 513);
INSERT INTO public.member_registration VALUES (510, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 514);
INSERT INTO public.member_registration VALUES (511, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 515);
INSERT INTO public.member_registration VALUES (512, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 516);
INSERT INTO public.member_registration VALUES (516, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 520);
INSERT INTO public.member_registration VALUES (524, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 528);
INSERT INTO public.member_registration VALUES (530, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 534);
INSERT INTO public.member_registration VALUES (536, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 540);
INSERT INTO public.member_registration VALUES (544, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 548);
INSERT INTO public.member_registration VALUES (548, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 552);
INSERT INTO public.member_registration VALUES (555, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 559);
INSERT INTO public.member_registration VALUES (560, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 564);
INSERT INTO public.member_registration VALUES (567, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 571);
INSERT INTO public.member_registration VALUES (572, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 577);
INSERT INTO public.member_registration VALUES (580, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 585);
INSERT INTO public.member_registration VALUES (586, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 591);
INSERT INTO public.member_registration VALUES (594, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 599);
INSERT INTO public.member_registration VALUES (597, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 602);
INSERT INTO public.member_registration VALUES (604, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 609);
INSERT INTO public.member_registration VALUES (609, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 615);
INSERT INTO public.member_registration VALUES (615, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 621);
INSERT INTO public.member_registration VALUES (622, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 628);
INSERT INTO public.member_registration VALUES (628, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 634);
INSERT INTO public.member_registration VALUES (634, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 640);
INSERT INTO public.member_registration VALUES (639, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 645);
INSERT INTO public.member_registration VALUES (645, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 651);
INSERT INTO public.member_registration VALUES (651, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 657);
INSERT INTO public.member_registration VALUES (657, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 663);
INSERT INTO public.member_registration VALUES (662, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 668);
INSERT INTO public.member_registration VALUES (666, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 674);
INSERT INTO public.member_registration VALUES (670, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 678);
INSERT INTO public.member_registration VALUES (674, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 682);
INSERT INTO public.member_registration VALUES (678, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 687);
INSERT INTO public.member_registration VALUES (682, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 691);
INSERT INTO public.member_registration VALUES (696, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 708);
INSERT INTO public.member_registration VALUES (703, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 715);
INSERT INTO public.member_registration VALUES (708, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 720);
INSERT INTO public.member_registration VALUES (714, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 726);
INSERT INTO public.member_registration VALUES (721, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 734);
INSERT INTO public.member_registration VALUES (727, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 739);
INSERT INTO public.member_registration VALUES (729, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 741);
INSERT INTO public.member_registration VALUES (734, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 103);
INSERT INTO public.member_registration VALUES (742, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 752);
INSERT INTO public.member_registration VALUES (748, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 758);
INSERT INTO public.member_registration VALUES (753, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 763);
INSERT INTO public.member_registration VALUES (513, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 517);
INSERT INTO public.member_registration VALUES (520, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 524);
INSERT INTO public.member_registration VALUES (528, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 532);
INSERT INTO public.member_registration VALUES (534, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 538);
INSERT INTO public.member_registration VALUES (540, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 544);
INSERT INTO public.member_registration VALUES (549, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 553);
INSERT INTO public.member_registration VALUES (553, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 557);
INSERT INTO public.member_registration VALUES (558, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 563);
INSERT INTO public.member_registration VALUES (564, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 568);
INSERT INTO public.member_registration VALUES (569, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 574);
INSERT INTO public.member_registration VALUES (576, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 581);
INSERT INTO public.member_registration VALUES (582, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 587);
INSERT INTO public.member_registration VALUES (590, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 595);
INSERT INTO public.member_registration VALUES (596, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 601);
INSERT INTO public.member_registration VALUES (601, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 606);
INSERT INTO public.member_registration VALUES (606, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 612);
INSERT INTO public.member_registration VALUES (612, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 618);
INSERT INTO public.member_registration VALUES (618, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 624);
INSERT INTO public.member_registration VALUES (624, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 630);
INSERT INTO public.member_registration VALUES (630, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 636);
INSERT INTO public.member_registration VALUES (636, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 642);
INSERT INTO public.member_registration VALUES (642, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 648);
INSERT INTO public.member_registration VALUES (649, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 655);
INSERT INTO public.member_registration VALUES (655, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 661);
INSERT INTO public.member_registration VALUES (659, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 665);
INSERT INTO public.member_registration VALUES (677, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 686);
INSERT INTO public.member_registration VALUES (681, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 690);
INSERT INTO public.member_registration VALUES (692, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 703);
INSERT INTO public.member_registration VALUES (695, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 707);
INSERT INTO public.member_registration VALUES (699, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 711);
INSERT INTO public.member_registration VALUES (704, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 716);
INSERT INTO public.member_registration VALUES (710, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 722);
INSERT INTO public.member_registration VALUES (716, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 728);
INSERT INTO public.member_registration VALUES (720, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 733);
INSERT INTO public.member_registration VALUES (726, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 738);
INSERT INTO public.member_registration VALUES (733, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 744);
INSERT INTO public.member_registration VALUES (739, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 749);
INSERT INTO public.member_registration VALUES (744, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 754);
INSERT INTO public.member_registration VALUES (750, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 759);
INSERT INTO public.member_registration VALUES (755, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 765);
INSERT INTO public.member_registration VALUES (514, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 518);
INSERT INTO public.member_registration VALUES (522, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 526);
INSERT INTO public.member_registration VALUES (529, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 533);
INSERT INTO public.member_registration VALUES (535, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 539);
INSERT INTO public.member_registration VALUES (543, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 547);
INSERT INTO public.member_registration VALUES (547, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 551);
INSERT INTO public.member_registration VALUES (554, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 558);
INSERT INTO public.member_registration VALUES (561, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 565);
INSERT INTO public.member_registration VALUES (566, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 570);
INSERT INTO public.member_registration VALUES (571, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 576);
INSERT INTO public.member_registration VALUES (577, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 582);
INSERT INTO public.member_registration VALUES (585, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 590);
INSERT INTO public.member_registration VALUES (591, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 596);
INSERT INTO public.member_registration VALUES (599, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 604);
INSERT INTO public.member_registration VALUES (605, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 610);
INSERT INTO public.member_registration VALUES (610, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 616);
INSERT INTO public.member_registration VALUES (616, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 622);
INSERT INTO public.member_registration VALUES (621, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 627);
INSERT INTO public.member_registration VALUES (627, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 633);
INSERT INTO public.member_registration VALUES (633, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 639);
INSERT INTO public.member_registration VALUES (640, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 646);
INSERT INTO public.member_registration VALUES (646, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 652);
INSERT INTO public.member_registration VALUES (652, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 658);
INSERT INTO public.member_registration VALUES (658, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 664);
INSERT INTO public.member_registration VALUES (664, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 672);
INSERT INTO public.member_registration VALUES (668, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 676);
INSERT INTO public.member_registration VALUES (672, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 680);
INSERT INTO public.member_registration VALUES (676, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 684);
INSERT INTO public.member_registration VALUES (680, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 689);
INSERT INTO public.member_registration VALUES (684, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 693);
INSERT INTO public.member_registration VALUES (687, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 698);
INSERT INTO public.member_registration VALUES (690, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 701);
INSERT INTO public.member_registration VALUES (694, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 705);
INSERT INTO public.member_registration VALUES (698, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 710);
INSERT INTO public.member_registration VALUES (705, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 717);
INSERT INTO public.member_registration VALUES (711, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 723);
INSERT INTO public.member_registration VALUES (717, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 729);
INSERT INTO public.member_registration VALUES (722, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 735);
INSERT INTO public.member_registration VALUES (731, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 684);
INSERT INTO public.member_registration VALUES (738, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 748);
INSERT INTO public.member_registration VALUES (746, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 756);
INSERT INTO public.member_registration VALUES (749, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 621);
INSERT INTO public.member_registration VALUES (756, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 766);
INSERT INTO public.member_registration VALUES (515, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 519);
INSERT INTO public.member_registration VALUES (521, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 525);
INSERT INTO public.member_registration VALUES (526, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 530);
INSERT INTO public.member_registration VALUES (533, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 537);
INSERT INTO public.member_registration VALUES (537, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 541);
INSERT INTO public.member_registration VALUES (542, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 546);
INSERT INTO public.member_registration VALUES (551, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 555);
INSERT INTO public.member_registration VALUES (557, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 561);
INSERT INTO public.member_registration VALUES (563, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 567);
INSERT INTO public.member_registration VALUES (568, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 573);
INSERT INTO public.member_registration VALUES (574, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 579);
INSERT INTO public.member_registration VALUES (578, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 583);
INSERT INTO public.member_registration VALUES (584, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 589);
INSERT INTO public.member_registration VALUES (588, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 593);
INSERT INTO public.member_registration VALUES (593, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 598);
INSERT INTO public.member_registration VALUES (600, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 605);
INSERT INTO public.member_registration VALUES (607, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 613);
INSERT INTO public.member_registration VALUES (613, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 619);
INSERT INTO public.member_registration VALUES (619, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 625);
INSERT INTO public.member_registration VALUES (625, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 631);
INSERT INTO public.member_registration VALUES (631, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 638);
INSERT INTO public.member_registration VALUES (637, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 643);
INSERT INTO public.member_registration VALUES (643, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 649);
INSERT INTO public.member_registration VALUES (648, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 654);
INSERT INTO public.member_registration VALUES (653, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 659);
INSERT INTO public.member_registration VALUES (660, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 666);
INSERT INTO public.member_registration VALUES (685, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 696);
INSERT INTO public.member_registration VALUES (688, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 699);
INSERT INTO public.member_registration VALUES (691, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 702);
INSERT INTO public.member_registration VALUES (701, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 713);
INSERT INTO public.member_registration VALUES (707, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 719);
INSERT INTO public.member_registration VALUES (713, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 725);
INSERT INTO public.member_registration VALUES (719, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 732);
INSERT INTO public.member_registration VALUES (725, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 737);
INSERT INTO public.member_registration VALUES (732, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 743);
INSERT INTO public.member_registration VALUES (736, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 746);
INSERT INTO public.member_registration VALUES (740, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 750);
INSERT INTO public.member_registration VALUES (747, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 757);
INSERT INTO public.member_registration VALUES (752, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 762);
INSERT INTO public.member_registration VALUES (758, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 768);
INSERT INTO public.member_registration VALUES (517, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 521);
INSERT INTO public.member_registration VALUES (519, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 523);
INSERT INTO public.member_registration VALUES (525, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 529);
INSERT INTO public.member_registration VALUES (532, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 536);
INSERT INTO public.member_registration VALUES (539, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 543);
INSERT INTO public.member_registration VALUES (545, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 549);
INSERT INTO public.member_registration VALUES (550, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 554);
INSERT INTO public.member_registration VALUES (556, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 560);
INSERT INTO public.member_registration VALUES (562, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 566);
INSERT INTO public.member_registration VALUES (573, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 578);
INSERT INTO public.member_registration VALUES (579, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 584);
INSERT INTO public.member_registration VALUES (583, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 588);
INSERT INTO public.member_registration VALUES (587, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 592);
INSERT INTO public.member_registration VALUES (592, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 597);
INSERT INTO public.member_registration VALUES (598, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 603);
INSERT INTO public.member_registration VALUES (602, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 607);
INSERT INTO public.member_registration VALUES (611, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 617);
INSERT INTO public.member_registration VALUES (617, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 623);
INSERT INTO public.member_registration VALUES (623, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 629);
INSERT INTO public.member_registration VALUES (629, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 635);
INSERT INTO public.member_registration VALUES (635, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 641);
INSERT INTO public.member_registration VALUES (641, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 647);
INSERT INTO public.member_registration VALUES (647, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 653);
INSERT INTO public.member_registration VALUES (654, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 660);
INSERT INTO public.member_registration VALUES (661, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 667);
INSERT INTO public.member_registration VALUES (665, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 673);
INSERT INTO public.member_registration VALUES (669, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 677);
INSERT INTO public.member_registration VALUES (673, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 681);
INSERT INTO public.member_registration VALUES (700, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 712);
INSERT INTO public.member_registration VALUES (706, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 718);
INSERT INTO public.member_registration VALUES (712, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 724);
INSERT INTO public.member_registration VALUES (718, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 730);
INSERT INTO public.member_registration VALUES (723, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 736);
INSERT INTO public.member_registration VALUES (728, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 740);
INSERT INTO public.member_registration VALUES (735, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 745);
INSERT INTO public.member_registration VALUES (741, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 751);
INSERT INTO public.member_registration VALUES (745, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 755);
INSERT INTO public.member_registration VALUES (751, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 761);
INSERT INTO public.member_registration VALUES (757, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 767);
INSERT INTO public.member_registration VALUES (518, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 522);
INSERT INTO public.member_registration VALUES (523, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 527);
INSERT INTO public.member_registration VALUES (527, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 531);
INSERT INTO public.member_registration VALUES (531, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 535);
INSERT INTO public.member_registration VALUES (538, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 542);
INSERT INTO public.member_registration VALUES (541, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 545);
INSERT INTO public.member_registration VALUES (546, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 550);
INSERT INTO public.member_registration VALUES (552, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 556);
INSERT INTO public.member_registration VALUES (559, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 562);
INSERT INTO public.member_registration VALUES (565, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 569);
INSERT INTO public.member_registration VALUES (570, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 575);
INSERT INTO public.member_registration VALUES (575, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 580);
INSERT INTO public.member_registration VALUES (581, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 586);
INSERT INTO public.member_registration VALUES (589, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 594);
INSERT INTO public.member_registration VALUES (595, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 600);
INSERT INTO public.member_registration VALUES (603, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 608);
INSERT INTO public.member_registration VALUES (608, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 614);
INSERT INTO public.member_registration VALUES (614, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 620);
INSERT INTO public.member_registration VALUES (620, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 626);
INSERT INTO public.member_registration VALUES (626, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 632);
INSERT INTO public.member_registration VALUES (632, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 637);
INSERT INTO public.member_registration VALUES (638, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 644);
INSERT INTO public.member_registration VALUES (644, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 650);
INSERT INTO public.member_registration VALUES (650, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 656);
INSERT INTO public.member_registration VALUES (656, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 662);
INSERT INTO public.member_registration VALUES (663, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 669);
INSERT INTO public.member_registration VALUES (667, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 675);
INSERT INTO public.member_registration VALUES (671, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 679);
INSERT INTO public.member_registration VALUES (675, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 683);
INSERT INTO public.member_registration VALUES (679, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 688);
INSERT INTO public.member_registration VALUES (683, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 692);
INSERT INTO public.member_registration VALUES (686, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 697);
INSERT INTO public.member_registration VALUES (689, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 700);
INSERT INTO public.member_registration VALUES (693, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 704);
INSERT INTO public.member_registration VALUES (697, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 709);
INSERT INTO public.member_registration VALUES (702, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 714);
INSERT INTO public.member_registration VALUES (709, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 721);
INSERT INTO public.member_registration VALUES (715, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 727);
INSERT INTO public.member_registration VALUES (724, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 649);
INSERT INTO public.member_registration VALUES (730, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 742);
INSERT INTO public.member_registration VALUES (737, 1, '2025-03-21', '2025-03-21', 'Individual', 2025, 747);
INSERT INTO public.member_registration VALUES (743, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 753);
INSERT INTO public.member_registration VALUES (754, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 764);
INSERT INTO public.member_registration VALUES (759, 1, '2025-03-21', '2025-03-21', 'Family', 2025, 769);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'user');
INSERT INTO public.roles VALUES (2, 'admin');
INSERT INTO public.roles VALUES (3, 'GADHead');
INSERT INTO public.roles VALUES (4, 'DepHead');
INSERT INTO public.roles VALUES (5, 'mo');
INSERT INTO public.roles VALUES (6, 'mec');
INSERT INTO public.roles VALUES (7, 'superAdmin');


--
-- Data for Name: schemeplan; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schemeplan VALUES (1, 'none', 'Monthly installment for individuals', '', '', '0', 13716, 1143, '', 'month');
INSERT INTO public.schemeplan VALUES (2, 'none', 'Monthly installment for Family', '', '', '00', 16116, 1343, '', 'month');
INSERT INTO public.schemeplan VALUES (3, 'Surgical & Hospital Expenses', 'Annual Limit', '', '', '1', 250000, 250000, '', 'unit');
INSERT INTO public.schemeplan VALUES (4, 'Surgical & Hospital Expenses', 'Private hospital charges', '', '', '1.1', 100000, 10000, '', '');
INSERT INTO public.schemeplan VALUES (5, 'Surgical & Hospital Expenses', 'Private hospital charges', '', '', '1.1.1', 100000, 10000, 'Room Charge Private Hospital', 'day');
INSERT INTO public.schemeplan VALUES (6, 'Surgical & Hospital Expenses', 'Operations', '', '', '1.1.2', 0, 150000, 'Operation', 'unit');
INSERT INTO public.schemeplan VALUES (7, 'Surgical & Hospital Expenses', 'Specialist services including X-Ray, Radiological and Nuclear Isotope Examination and Treatment, Ultrasound Examination Pathology, or laboratory examinations. (Routine medical checkups are not included)', '', '', '1.1.3', 0, 15000, 'Specialist Services', 'unit');
INSERT INTO public.schemeplan VALUES (8, 'Surgical & Hospital Expenses', 'Additional Benefits only for family Membership', '', '', '1.1.4', 0, 0, '', '');
INSERT INTO public.schemeplan VALUES (9, 'Surgical & Hospital Expenses', 'Birth Normal', '', '', '1.1.4.1', 0, 1000000, 'Normal Birth', 'unit');
INSERT INTO public.schemeplan VALUES (10, 'Surgical & Hospital Expenses', 'Cesarean Birth', '', '', '1.1.4.2', 0, 2000000, 'Birth Cesarean', 'unit');
INSERT INTO public.schemeplan VALUES (11, 'Surgical & Hospital Expenses', 'Utensil Birth', '', '', '1.1.4.3', 0, 2000000, 'Birth Utensil', 'unit');
INSERT INTO public.schemeplan VALUES (12, 'Surgical & Hospital Expenses', 'Government Hospital Payments', '', '', '1.2', 0, 0, '', '');
INSERT INTO public.schemeplan VALUES (13, 'Surgical & Hospital Expenses', 'Government Hospital nonpaying wards per day (Only for Maximum of 30 days per one event One day is interpreted as staying at one overnight)', '', '', '1.2.1', 0, 30, 'Room Charge Government Hospital', 'day');
INSERT INTO public.schemeplan VALUES (14, 'Surgical & Hospital Expenses', 'Expenses incurred on Drugs purchased & Test Scan & X Rays undergone whilst being an inpatient in non-paying ward of a Government Hospital. (Subject to bills being produced)', '', '', '1.2.2', 0, 75000, 'Laboratory Test Government Hospital', 'unit');
INSERT INTO public.schemeplan VALUES (15, 'Surgical & Hospital Expenses', 'Other Benefits', '', '', '1.3', 0, 0, '', '');
INSERT INTO public.schemeplan VALUES (16, 'Surgical & Hospital Expenses', 'Birth of twin within indoor limits', '', '', '1.3.1', 0, 10000, 'Birth Twins', 'unit');
INSERT INTO public.schemeplan VALUES (17, 'Surgical & Hospital Expenses', 'Cost of Lens kit for Cataract Surgery(Maximum Limit)', '', '', '1.3.2', 0, 30000, 'Cataract Surgery', 'unit');
INSERT INTO public.schemeplan VALUES (18, 'OPD', 'Out Patient Benefits', '', '', '2', 0, 0, '', '');
INSERT INTO public.schemeplan VALUES (19, 'OPD', 'Cost of drugs, (excluding Vitamins, Food Supplements, Warm Treatment and Routine Vaccination except Tetanus Toxoid Vaccination) (Vitamins can be reimbursed under the recommendation of UMO If the prescribed vitamins are essential to recover or control the medical condition of the patient.)', '', '', '2.1', 15000, 15000, 'Cost Of Drugs', 'opd_1');
INSERT INTO public.schemeplan VALUES (20, 'OPD', 'Cost of investigations under the recommendation of a medical officer registered in Sri Lanka Medical Council or Sri Lanka Ayurvedic Medical Council.', '', '', '2.2', 0, 15000, 'Investigation Fees', 'opd_1');
INSERT INTO public.schemeplan VALUES (21, 'OPD', 'Consultation fees (Including e-channeling) only for Specialist or Medical Officers Registered in Sri Lanka Medical Council or Ayurvedic Doctors registered in Ayurvedic Medical Council.', '', '', '2.3', 0, 15000, 'Consultation Fees', 'opd_1');
INSERT INTO public.schemeplan VALUES (22, 'OPD', 'Filling & Exaction only', '', '', '2.4', 0, 15000, 'Dental Cover', 'opd_1');
INSERT INTO public.schemeplan VALUES (23, 'OPD', 'Cost of Cervical Collar under the recommendation of an Orthopedic Surgeon (once in 2 years)', '', '', '2.5', 0, 15000, 'Cost Of Cervical Collar', 'opd_1');
INSERT INTO public.schemeplan VALUES (24, 'OPD', 'Unani & Acupancher treatment under the recommendation of a Medical Officer registered under Medical Council of Unani & Acupancher.', '', '', '2.6', 10000, 10000, 'Cost Of Unani, Acupancher', 'opd_2');
INSERT INTO public.schemeplan VALUES (25, 'OPD', 'Cost of Lumber Corset under the recommendation of a Specialist Consultations (once in two years)', '', '', '2.7', 10000, 10000, 'Cost Of Lumber Corset', 'opd_2');
INSERT INTO public.schemeplan VALUES (26, 'OPD', 'Additional benefit for the COVID-19 Test (PCR, Rapid Antigen Test etc) under the recommendation of MOH, MBBS qualified Doctor or PHI Open University with the certification signature of the UMO.', '', '', '2.8', 10000, 10000, 'Covid Test', 'opd_2');
INSERT INTO public.schemeplan VALUES (27, 'Surgical & Hospital Expenses', 'Personal Accident Cover Members only ', '', '', '3', 0, 0, '', '');
INSERT INTO public.schemeplan VALUES (28, 'Surgical & Hospital Expenses', 'Personal Accident cover', '', '', '3.1', 0, 750000, 'Personal Accident', 'unit');
INSERT INTO public.schemeplan VALUES (29, 'Surgical & Hospital Expenses', 'Natural Death cover', '', '', '3.2', 0, 300000, 'Death Natural', 'unit');
INSERT INTO public.schemeplan VALUES (30, 'Surgical & Hospital Expenses', 'Death', '', '', '3.2.a', 750000, 750000, 'Death', 'unit');
INSERT INTO public.schemeplan VALUES (31, 'Surgical & Hospital Expenses', 'Total and permanent loss of all sight in both eyes', '', '', '3.2.b', 750000, 750000, 'Loss of all sight in both eyes', 'unit');
INSERT INTO public.schemeplan VALUES (32, 'Surgical & Hospital Expenses', 'Total loss by physical severance of both hands or both feet or one hand or one foot', '', '', '3.2.c', 750000, 750000, 'Loss of both hands or both feet or one hand & one foot', 'unit');
INSERT INTO public.schemeplan VALUES (33, 'Surgical & Hospital Expenses', 'Total loss by physical severance of one hand or one foot together with the total and permanent loss of all sight in one eye.', '', '', '3.2.d', 750000, 750000, 'Loss of one hand or one foot together with all sight in one eye', 'unit');
INSERT INTO public.schemeplan VALUES (34, 'Surgical & Hospital Expenses', 'Total and permanent loss of all sight in one eye', '', '', '3.2.e', 375000, 375000, 'Loss of all sight in one eye', 'unit');
INSERT INTO public.schemeplan VALUES (35, 'Surgical & Hospital Expenses', 'Total loss by physical severance on one hand or one foot', '', '', '3.2.f', 375000, 375000, 'Loss of one hand or one foot', 'unit');
INSERT INTO public.schemeplan VALUES (36, 'OPD', 'Spectacle Cover Members Only', '', '', '4', 0, 0, '', '');
INSERT INTO public.schemeplan VALUES (37, 'OPD', 'Once in 2 years Members Only', '', '', '4.1', 15000, 15000, 'Spectacle Cover', 'opd_3');
INSERT INTO public.schemeplan VALUES (38, 'Surgical & Hospital Expenses', 'Under the recommendation of an Eye Surgeon, Ophthalmologist- Once in 2 years Members Only', '', '', '4.2', 2000, 2000, 'Optometrical Testing, Consulting fees', 'unit');
INSERT INTO public.schemeplan VALUES (39, 'Surgical & Hospital Expenses', 'Critical Illness Cover Members Only', '', '', '5', 0, 0, '', '');
INSERT INTO public.schemeplan VALUES (40, 'Surgical & Hospital Expenses', '1.Myocardial Infarction
2.Coronary Artery Surgery
3.Stroke
4.Cardiac Pacemaker
5.Cancer(Radio & Chemotherapy treatment will be paid up to 50% from the CIC limit)
6.Renal Failure
7.Major organ transplant (The actual undergoing of transplantation as the recipient of a heart, lung, liver pancreas, small bowel, kidney, or bone marrow)
8.Paralysis
9.Multiple Sclerosis
10.Pulmonary Arterial Hypertension
11.Fulminant Viral Hepatitis
12.Heart Valve surgery
13.Surgery for a Disease of the Aorta
14.Chronic Liver disease
15.Major burns
16.Blindness
17.Deafness(Sickness-related)
18.Muscular Dystrophy
19.Loss of speech
20.Chronic lung disease
21.Apallic syndrome
22.Angioplasty Cover
23.Benign Brain Tumor
24.Coma
25.Motor Neuron Disease
26.Chronic Bone Disease', '', '', '5.1', 600000, 600000, 'Any illness per year', 'year');


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_roles VALUES (1, 1);
INSERT INTO public.user_roles VALUES (1, 2);
INSERT INTO public.user_roles VALUES (2, 1);
INSERT INTO public.user_roles VALUES (3, 1);
INSERT INTO public.user_roles VALUES (6, 1);
INSERT INTO public.user_roles VALUES (7, 1);
INSERT INTO public.user_roles VALUES (4, 1);
INSERT INTO public.user_roles VALUES (5, 1);
INSERT INTO public.user_roles VALUES (8, 1);
INSERT INTO public.user_roles VALUES (9, 1);
INSERT INTO public.user_roles VALUES (10, 1);
INSERT INTO public.user_roles VALUES (11, 1);
INSERT INTO public.user_roles VALUES (12, 1);
INSERT INTO public.user_roles VALUES (13, 1);
INSERT INTO public.user_roles VALUES (15, 1);
INSERT INTO public.user_roles VALUES (14, 1);
INSERT INTO public.user_roles VALUES (16, 1);
INSERT INTO public.user_roles VALUES (17, 1);
INSERT INTO public.user_roles VALUES (18, 1);
INSERT INTO public.user_roles VALUES (19, 1);
INSERT INTO public.user_roles VALUES (20, 1);
INSERT INTO public.user_roles VALUES (21, 1);
INSERT INTO public.user_roles VALUES (22, 1);
INSERT INTO public.user_roles VALUES (23, 1);
INSERT INTO public.user_roles VALUES (24, 1);
INSERT INTO public.user_roles VALUES (25, 1);
INSERT INTO public.user_roles VALUES (26, 1);
INSERT INTO public.user_roles VALUES (28, 1);
INSERT INTO public.user_roles VALUES (27, 1);
INSERT INTO public.user_roles VALUES (29, 1);
INSERT INTO public.user_roles VALUES (30, 1);
INSERT INTO public.user_roles VALUES (31, 1);
INSERT INTO public.user_roles VALUES (32, 1);
INSERT INTO public.user_roles VALUES (33, 1);
INSERT INTO public.user_roles VALUES (34, 1);
INSERT INTO public.user_roles VALUES (35, 1);
INSERT INTO public.user_roles VALUES (36, 1);
INSERT INTO public.user_roles VALUES (37, 1);
INSERT INTO public.user_roles VALUES (39, 1);
INSERT INTO public.user_roles VALUES (38, 1);
INSERT INTO public.user_roles VALUES (43, 1);
INSERT INTO public.user_roles VALUES (42, 1);
INSERT INTO public.user_roles VALUES (44, 1);
INSERT INTO public.user_roles VALUES (41, 1);
INSERT INTO public.user_roles VALUES (45, 1);
INSERT INTO public.user_roles VALUES (40, 1);
INSERT INTO public.user_roles VALUES (46, 1);
INSERT INTO public.user_roles VALUES (48, 1);
INSERT INTO public.user_roles VALUES (47, 1);
INSERT INTO public.user_roles VALUES (49, 1);
INSERT INTO public.user_roles VALUES (50, 1);
INSERT INTO public.user_roles VALUES (51, 1);
INSERT INTO public.user_roles VALUES (53, 1);
INSERT INTO public.user_roles VALUES (54, 1);
INSERT INTO public.user_roles VALUES (55, 1);
INSERT INTO public.user_roles VALUES (56, 1);
INSERT INTO public.user_roles VALUES (57, 1);
INSERT INTO public.user_roles VALUES (58, 1);
INSERT INTO public.user_roles VALUES (60, 1);
INSERT INTO public.user_roles VALUES (59, 1);
INSERT INTO public.user_roles VALUES (61, 1);
INSERT INTO public.user_roles VALUES (62, 1);
INSERT INTO public.user_roles VALUES (64, 1);
INSERT INTO public.user_roles VALUES (63, 1);
INSERT INTO public.user_roles VALUES (65, 1);
INSERT INTO public.user_roles VALUES (66, 1);
INSERT INTO public.user_roles VALUES (67, 1);
INSERT INTO public.user_roles VALUES (68, 1);
INSERT INTO public.user_roles VALUES (69, 1);
INSERT INTO public.user_roles VALUES (70, 1);
INSERT INTO public.user_roles VALUES (71, 1);
INSERT INTO public.user_roles VALUES (72, 1);
INSERT INTO public.user_roles VALUES (73, 1);
INSERT INTO public.user_roles VALUES (74, 1);
INSERT INTO public.user_roles VALUES (75, 1);
INSERT INTO public.user_roles VALUES (76, 1);
INSERT INTO public.user_roles VALUES (77, 1);
INSERT INTO public.user_roles VALUES (78, 1);
INSERT INTO public.user_roles VALUES (79, 1);
INSERT INTO public.user_roles VALUES (80, 1);
INSERT INTO public.user_roles VALUES (81, 1);
INSERT INTO public.user_roles VALUES (82, 1);
INSERT INTO public.user_roles VALUES (83, 1);
INSERT INTO public.user_roles VALUES (84, 1);
INSERT INTO public.user_roles VALUES (85, 1);
INSERT INTO public.user_roles VALUES (86, 1);
INSERT INTO public.user_roles VALUES (87, 1);
INSERT INTO public.user_roles VALUES (88, 1);
INSERT INTO public.user_roles VALUES (89, 1);
INSERT INTO public.user_roles VALUES (90, 1);
INSERT INTO public.user_roles VALUES (91, 1);
INSERT INTO public.user_roles VALUES (92, 1);
INSERT INTO public.user_roles VALUES (93, 1);
INSERT INTO public.user_roles VALUES (96, 1);
INSERT INTO public.user_roles VALUES (94, 1);
INSERT INTO public.user_roles VALUES (97, 1);
INSERT INTO public.user_roles VALUES (99, 1);
INSERT INTO public.user_roles VALUES (95, 1);
INSERT INTO public.user_roles VALUES (98, 1);
INSERT INTO public.user_roles VALUES (101, 1);
INSERT INTO public.user_roles VALUES (100, 1);
INSERT INTO public.user_roles VALUES (102, 1);
INSERT INTO public.user_roles VALUES (105, 1);
INSERT INTO public.user_roles VALUES (104, 1);
INSERT INTO public.user_roles VALUES (106, 1);
INSERT INTO public.user_roles VALUES (107, 1);
INSERT INTO public.user_roles VALUES (108, 1);
INSERT INTO public.user_roles VALUES (109, 1);
INSERT INTO public.user_roles VALUES (110, 1);
INSERT INTO public.user_roles VALUES (111, 1);
INSERT INTO public.user_roles VALUES (112, 1);
INSERT INTO public.user_roles VALUES (113, 1);
INSERT INTO public.user_roles VALUES (114, 1);
INSERT INTO public.user_roles VALUES (115, 1);
INSERT INTO public.user_roles VALUES (117, 1);
INSERT INTO public.user_roles VALUES (116, 1);
INSERT INTO public.user_roles VALUES (118, 1);
INSERT INTO public.user_roles VALUES (119, 1);
INSERT INTO public.user_roles VALUES (120, 1);
INSERT INTO public.user_roles VALUES (121, 1);
INSERT INTO public.user_roles VALUES (122, 1);
INSERT INTO public.user_roles VALUES (123, 1);
INSERT INTO public.user_roles VALUES (125, 1);
INSERT INTO public.user_roles VALUES (124, 1);
INSERT INTO public.user_roles VALUES (126, 1);
INSERT INTO public.user_roles VALUES (127, 1);
INSERT INTO public.user_roles VALUES (128, 1);
INSERT INTO public.user_roles VALUES (129, 1);
INSERT INTO public.user_roles VALUES (130, 1);
INSERT INTO public.user_roles VALUES (131, 1);
INSERT INTO public.user_roles VALUES (132, 1);
INSERT INTO public.user_roles VALUES (133, 1);
INSERT INTO public.user_roles VALUES (134, 1);
INSERT INTO public.user_roles VALUES (136, 1);
INSERT INTO public.user_roles VALUES (135, 1);
INSERT INTO public.user_roles VALUES (137, 1);
INSERT INTO public.user_roles VALUES (138, 1);
INSERT INTO public.user_roles VALUES (139, 1);
INSERT INTO public.user_roles VALUES (140, 1);
INSERT INTO public.user_roles VALUES (141, 1);
INSERT INTO public.user_roles VALUES (142, 1);
INSERT INTO public.user_roles VALUES (143, 1);
INSERT INTO public.user_roles VALUES (144, 1);
INSERT INTO public.user_roles VALUES (145, 1);
INSERT INTO public.user_roles VALUES (146, 1);
INSERT INTO public.user_roles VALUES (147, 1);
INSERT INTO public.user_roles VALUES (148, 1);
INSERT INTO public.user_roles VALUES (149, 1);
INSERT INTO public.user_roles VALUES (150, 1);
INSERT INTO public.user_roles VALUES (151, 1);
INSERT INTO public.user_roles VALUES (152, 1);
INSERT INTO public.user_roles VALUES (153, 1);
INSERT INTO public.user_roles VALUES (154, 1);
INSERT INTO public.user_roles VALUES (155, 1);
INSERT INTO public.user_roles VALUES (156, 1);
INSERT INTO public.user_roles VALUES (157, 1);
INSERT INTO public.user_roles VALUES (158, 1);
INSERT INTO public.user_roles VALUES (160, 1);
INSERT INTO public.user_roles VALUES (159, 1);
INSERT INTO public.user_roles VALUES (161, 1);
INSERT INTO public.user_roles VALUES (162, 1);
INSERT INTO public.user_roles VALUES (163, 1);
INSERT INTO public.user_roles VALUES (164, 1);
INSERT INTO public.user_roles VALUES (165, 1);
INSERT INTO public.user_roles VALUES (166, 1);
INSERT INTO public.user_roles VALUES (167, 1);
INSERT INTO public.user_roles VALUES (168, 1);
INSERT INTO public.user_roles VALUES (169, 1);
INSERT INTO public.user_roles VALUES (170, 1);
INSERT INTO public.user_roles VALUES (171, 1);
INSERT INTO public.user_roles VALUES (172, 1);
INSERT INTO public.user_roles VALUES (173, 1);
INSERT INTO public.user_roles VALUES (174, 1);
INSERT INTO public.user_roles VALUES (175, 1);
INSERT INTO public.user_roles VALUES (176, 1);
INSERT INTO public.user_roles VALUES (177, 1);
INSERT INTO public.user_roles VALUES (178, 1);
INSERT INTO public.user_roles VALUES (179, 1);
INSERT INTO public.user_roles VALUES (180, 1);
INSERT INTO public.user_roles VALUES (181, 1);
INSERT INTO public.user_roles VALUES (182, 1);
INSERT INTO public.user_roles VALUES (183, 1);
INSERT INTO public.user_roles VALUES (184, 1);
INSERT INTO public.user_roles VALUES (186, 1);
INSERT INTO public.user_roles VALUES (187, 1);
INSERT INTO public.user_roles VALUES (188, 1);
INSERT INTO public.user_roles VALUES (189, 1);
INSERT INTO public.user_roles VALUES (191, 1);
INSERT INTO public.user_roles VALUES (190, 1);
INSERT INTO public.user_roles VALUES (192, 1);
INSERT INTO public.user_roles VALUES (193, 1);
INSERT INTO public.user_roles VALUES (194, 1);
INSERT INTO public.user_roles VALUES (195, 1);
INSERT INTO public.user_roles VALUES (196, 1);
INSERT INTO public.user_roles VALUES (197, 1);
INSERT INTO public.user_roles VALUES (198, 1);
INSERT INTO public.user_roles VALUES (199, 1);
INSERT INTO public.user_roles VALUES (200, 1);
INSERT INTO public.user_roles VALUES (201, 1);
INSERT INTO public.user_roles VALUES (202, 1);
INSERT INTO public.user_roles VALUES (203, 1);
INSERT INTO public.user_roles VALUES (204, 1);
INSERT INTO public.user_roles VALUES (206, 1);
INSERT INTO public.user_roles VALUES (205, 1);
INSERT INTO public.user_roles VALUES (207, 1);
INSERT INTO public.user_roles VALUES (208, 1);
INSERT INTO public.user_roles VALUES (209, 1);
INSERT INTO public.user_roles VALUES (211, 1);
INSERT INTO public.user_roles VALUES (210, 1);
INSERT INTO public.user_roles VALUES (212, 1);
INSERT INTO public.user_roles VALUES (213, 1);
INSERT INTO public.user_roles VALUES (214, 1);
INSERT INTO public.user_roles VALUES (215, 1);
INSERT INTO public.user_roles VALUES (216, 1);
INSERT INTO public.user_roles VALUES (217, 1);
INSERT INTO public.user_roles VALUES (218, 1);
INSERT INTO public.user_roles VALUES (219, 1);
INSERT INTO public.user_roles VALUES (220, 1);
INSERT INTO public.user_roles VALUES (222, 1);
INSERT INTO public.user_roles VALUES (221, 1);
INSERT INTO public.user_roles VALUES (223, 1);
INSERT INTO public.user_roles VALUES (225, 1);
INSERT INTO public.user_roles VALUES (226, 1);
INSERT INTO public.user_roles VALUES (227, 1);
INSERT INTO public.user_roles VALUES (224, 1);
INSERT INTO public.user_roles VALUES (228, 1);
INSERT INTO public.user_roles VALUES (234, 1);
INSERT INTO public.user_roles VALUES (240, 1);
INSERT INTO public.user_roles VALUES (247, 1);
INSERT INTO public.user_roles VALUES (252, 1);
INSERT INTO public.user_roles VALUES (259, 1);
INSERT INTO public.user_roles VALUES (264, 1);
INSERT INTO public.user_roles VALUES (266, 1);
INSERT INTO public.user_roles VALUES (274, 1);
INSERT INTO public.user_roles VALUES (279, 1);
INSERT INTO public.user_roles VALUES (284, 1);
INSERT INTO public.user_roles VALUES (291, 1);
INSERT INTO public.user_roles VALUES (293, 1);
INSERT INTO public.user_roles VALUES (300, 1);
INSERT INTO public.user_roles VALUES (306, 1);
INSERT INTO public.user_roles VALUES (311, 1);
INSERT INTO public.user_roles VALUES (317, 1);
INSERT INTO public.user_roles VALUES (322, 1);
INSERT INTO public.user_roles VALUES (328, 1);
INSERT INTO public.user_roles VALUES (335, 1);
INSERT INTO public.user_roles VALUES (341, 1);
INSERT INTO public.user_roles VALUES (347, 1);
INSERT INTO public.user_roles VALUES (353, 1);
INSERT INTO public.user_roles VALUES (356, 1);
INSERT INTO public.user_roles VALUES (362, 1);
INSERT INTO public.user_roles VALUES (370, 1);
INSERT INTO public.user_roles VALUES (375, 1);
INSERT INTO public.user_roles VALUES (380, 1);
INSERT INTO public.user_roles VALUES (386, 1);
INSERT INTO public.user_roles VALUES (392, 1);
INSERT INTO public.user_roles VALUES (399, 1);
INSERT INTO public.user_roles VALUES (403, 1);
INSERT INTO public.user_roles VALUES (411, 1);
INSERT INTO public.user_roles VALUES (416, 1);
INSERT INTO public.user_roles VALUES (422, 1);
INSERT INTO public.user_roles VALUES (429, 1);
INSERT INTO public.user_roles VALUES (229, 1);
INSERT INTO public.user_roles VALUES (237, 1);
INSERT INTO public.user_roles VALUES (245, 1);
INSERT INTO public.user_roles VALUES (251, 1);
INSERT INTO public.user_roles VALUES (257, 1);
INSERT INTO public.user_roles VALUES (262, 1);
INSERT INTO public.user_roles VALUES (267, 1);
INSERT INTO public.user_roles VALUES (275, 1);
INSERT INTO public.user_roles VALUES (281, 1);
INSERT INTO public.user_roles VALUES (286, 1);
INSERT INTO public.user_roles VALUES (294, 1);
INSERT INTO public.user_roles VALUES (303, 1);
INSERT INTO public.user_roles VALUES (309, 1);
INSERT INTO public.user_roles VALUES (314, 1);
INSERT INTO public.user_roles VALUES (320, 1);
INSERT INTO public.user_roles VALUES (327, 1);
INSERT INTO public.user_roles VALUES (331, 1);
INSERT INTO public.user_roles VALUES (337, 1);
INSERT INTO public.user_roles VALUES (343, 1);
INSERT INTO public.user_roles VALUES (348, 1);
INSERT INTO public.user_roles VALUES (354, 1);
INSERT INTO public.user_roles VALUES (360, 1);
INSERT INTO public.user_roles VALUES (369, 1);
INSERT INTO public.user_roles VALUES (374, 1);
INSERT INTO public.user_roles VALUES (381, 1);
INSERT INTO public.user_roles VALUES (385, 1);
INSERT INTO public.user_roles VALUES (391, 1);
INSERT INTO public.user_roles VALUES (397, 1);
INSERT INTO public.user_roles VALUES (405, 1);
INSERT INTO public.user_roles VALUES (410, 1);
INSERT INTO public.user_roles VALUES (415, 1);
INSERT INTO public.user_roles VALUES (418, 1);
INSERT INTO public.user_roles VALUES (427, 1);
INSERT INTO public.user_roles VALUES (230, 1);
INSERT INTO public.user_roles VALUES (236, 1);
INSERT INTO public.user_roles VALUES (242, 1);
INSERT INTO public.user_roles VALUES (248, 1);
INSERT INTO public.user_roles VALUES (256, 1);
INSERT INTO public.user_roles VALUES (265, 1);
INSERT INTO public.user_roles VALUES (270, 1);
INSERT INTO public.user_roles VALUES (276, 1);
INSERT INTO public.user_roles VALUES (282, 1);
INSERT INTO public.user_roles VALUES (290, 1);
INSERT INTO public.user_roles VALUES (296, 1);
INSERT INTO public.user_roles VALUES (301, 1);
INSERT INTO public.user_roles VALUES (307, 1);
INSERT INTO public.user_roles VALUES (313, 1);
INSERT INTO public.user_roles VALUES (319, 1);
INSERT INTO public.user_roles VALUES (326, 1);
INSERT INTO public.user_roles VALUES (333, 1);
INSERT INTO public.user_roles VALUES (339, 1);
INSERT INTO public.user_roles VALUES (345, 1);
INSERT INTO public.user_roles VALUES (351, 1);
INSERT INTO public.user_roles VALUES (358, 1);
INSERT INTO public.user_roles VALUES (364, 1);
INSERT INTO public.user_roles VALUES (368, 1);
INSERT INTO public.user_roles VALUES (377, 1);
INSERT INTO public.user_roles VALUES (383, 1);
INSERT INTO public.user_roles VALUES (390, 1);
INSERT INTO public.user_roles VALUES (394, 1);
INSERT INTO public.user_roles VALUES (401, 1);
INSERT INTO public.user_roles VALUES (407, 1);
INSERT INTO public.user_roles VALUES (412, 1);
INSERT INTO public.user_roles VALUES (421, 1);
INSERT INTO public.user_roles VALUES (426, 1);
INSERT INTO public.user_roles VALUES (232, 1);
INSERT INTO public.user_roles VALUES (235, 1);
INSERT INTO public.user_roles VALUES (241, 1);
INSERT INTO public.user_roles VALUES (246, 1);
INSERT INTO public.user_roles VALUES (250, 1);
INSERT INTO public.user_roles VALUES (254, 1);
INSERT INTO public.user_roles VALUES (260, 1);
INSERT INTO public.user_roles VALUES (268, 1);
INSERT INTO public.user_roles VALUES (272, 1);
INSERT INTO public.user_roles VALUES (278, 1);
INSERT INTO public.user_roles VALUES (285, 1);
INSERT INTO public.user_roles VALUES (289, 1);
INSERT INTO public.user_roles VALUES (295, 1);
INSERT INTO public.user_roles VALUES (299, 1);
INSERT INTO public.user_roles VALUES (305, 1);
INSERT INTO public.user_roles VALUES (310, 1);
INSERT INTO public.user_roles VALUES (316, 1);
INSERT INTO public.user_roles VALUES (324, 1);
INSERT INTO public.user_roles VALUES (329, 1);
INSERT INTO public.user_roles VALUES (334, 1);
INSERT INTO public.user_roles VALUES (340, 1);
INSERT INTO public.user_roles VALUES (346, 1);
INSERT INTO public.user_roles VALUES (352, 1);
INSERT INTO public.user_roles VALUES (359, 1);
INSERT INTO public.user_roles VALUES (365, 1);
INSERT INTO public.user_roles VALUES (371, 1);
INSERT INTO public.user_roles VALUES (378, 1);
INSERT INTO public.user_roles VALUES (384, 1);
INSERT INTO public.user_roles VALUES (388, 1);
INSERT INTO public.user_roles VALUES (395, 1);
INSERT INTO public.user_roles VALUES (400, 1);
INSERT INTO public.user_roles VALUES (406, 1);
INSERT INTO public.user_roles VALUES (413, 1);
INSERT INTO public.user_roles VALUES (419, 1);
INSERT INTO public.user_roles VALUES (425, 1);
INSERT INTO public.user_roles VALUES (231, 1);
INSERT INTO public.user_roles VALUES (238, 1);
INSERT INTO public.user_roles VALUES (243, 1);
INSERT INTO public.user_roles VALUES (249, 1);
INSERT INTO public.user_roles VALUES (255, 1);
INSERT INTO public.user_roles VALUES (261, 1);
INSERT INTO public.user_roles VALUES (273, 1);
INSERT INTO public.user_roles VALUES (280, 1);
INSERT INTO public.user_roles VALUES (287, 1);
INSERT INTO public.user_roles VALUES (292, 1);
INSERT INTO public.user_roles VALUES (302, 1);
INSERT INTO public.user_roles VALUES (308, 1);
INSERT INTO public.user_roles VALUES (315, 1);
INSERT INTO public.user_roles VALUES (321, 1);
INSERT INTO public.user_roles VALUES (325, 1);
INSERT INTO public.user_roles VALUES (332, 1);
INSERT INTO public.user_roles VALUES (336, 1);
INSERT INTO public.user_roles VALUES (344, 1);
INSERT INTO public.user_roles VALUES (350, 1);
INSERT INTO public.user_roles VALUES (357, 1);
INSERT INTO public.user_roles VALUES (363, 1);
INSERT INTO public.user_roles VALUES (366, 1);
INSERT INTO public.user_roles VALUES (372, 1);
INSERT INTO public.user_roles VALUES (376, 1);
INSERT INTO public.user_roles VALUES (382, 1);
INSERT INTO public.user_roles VALUES (389, 1);
INSERT INTO public.user_roles VALUES (396, 1);
INSERT INTO public.user_roles VALUES (402, 1);
INSERT INTO public.user_roles VALUES (408, 1);
INSERT INTO public.user_roles VALUES (414, 1);
INSERT INTO public.user_roles VALUES (420, 1);
INSERT INTO public.user_roles VALUES (424, 1);
INSERT INTO public.user_roles VALUES (233, 1);
INSERT INTO public.user_roles VALUES (239, 1);
INSERT INTO public.user_roles VALUES (244, 1);
INSERT INTO public.user_roles VALUES (253, 1);
INSERT INTO public.user_roles VALUES (258, 1);
INSERT INTO public.user_roles VALUES (263, 1);
INSERT INTO public.user_roles VALUES (277, 1);
INSERT INTO public.user_roles VALUES (283, 1);
INSERT INTO public.user_roles VALUES (288, 1);
INSERT INTO public.user_roles VALUES (297, 1);
INSERT INTO public.user_roles VALUES (298, 1);
INSERT INTO public.user_roles VALUES (304, 1);
INSERT INTO public.user_roles VALUES (312, 1);
INSERT INTO public.user_roles VALUES (318, 1);
INSERT INTO public.user_roles VALUES (323, 1);
INSERT INTO public.user_roles VALUES (330, 1);
INSERT INTO public.user_roles VALUES (338, 1);
INSERT INTO public.user_roles VALUES (342, 1);
INSERT INTO public.user_roles VALUES (349, 1);
INSERT INTO public.user_roles VALUES (355, 1);
INSERT INTO public.user_roles VALUES (361, 1);
INSERT INTO public.user_roles VALUES (367, 1);
INSERT INTO public.user_roles VALUES (373, 1);
INSERT INTO public.user_roles VALUES (379, 1);
INSERT INTO public.user_roles VALUES (387, 1);
INSERT INTO public.user_roles VALUES (393, 1);
INSERT INTO public.user_roles VALUES (398, 1);
INSERT INTO public.user_roles VALUES (404, 1);
INSERT INTO public.user_roles VALUES (409, 1);
INSERT INTO public.user_roles VALUES (417, 1);
INSERT INTO public.user_roles VALUES (423, 1);
INSERT INTO public.user_roles VALUES (428, 1);
INSERT INTO public.user_roles VALUES (430, 1);
INSERT INTO public.user_roles VALUES (431, 1);
INSERT INTO public.user_roles VALUES (432, 1);
INSERT INTO public.user_roles VALUES (433, 1);
INSERT INTO public.user_roles VALUES (434, 1);
INSERT INTO public.user_roles VALUES (435, 1);
INSERT INTO public.user_roles VALUES (436, 1);
INSERT INTO public.user_roles VALUES (437, 1);
INSERT INTO public.user_roles VALUES (438, 1);
INSERT INTO public.user_roles VALUES (439, 1);
INSERT INTO public.user_roles VALUES (440, 1);
INSERT INTO public.user_roles VALUES (441, 1);
INSERT INTO public.user_roles VALUES (442, 1);
INSERT INTO public.user_roles VALUES (443, 1);
INSERT INTO public.user_roles VALUES (444, 1);
INSERT INTO public.user_roles VALUES (445, 1);
INSERT INTO public.user_roles VALUES (446, 1);
INSERT INTO public.user_roles VALUES (447, 1);
INSERT INTO public.user_roles VALUES (448, 1);
INSERT INTO public.user_roles VALUES (449, 1);
INSERT INTO public.user_roles VALUES (450, 1);
INSERT INTO public.user_roles VALUES (451, 1);
INSERT INTO public.user_roles VALUES (452, 1);
INSERT INTO public.user_roles VALUES (453, 1);
INSERT INTO public.user_roles VALUES (454, 1);
INSERT INTO public.user_roles VALUES (455, 1);
INSERT INTO public.user_roles VALUES (456, 1);
INSERT INTO public.user_roles VALUES (457, 1);
INSERT INTO public.user_roles VALUES (458, 1);
INSERT INTO public.user_roles VALUES (459, 1);
INSERT INTO public.user_roles VALUES (460, 1);
INSERT INTO public.user_roles VALUES (461, 1);
INSERT INTO public.user_roles VALUES (462, 1);
INSERT INTO public.user_roles VALUES (463, 1);
INSERT INTO public.user_roles VALUES (464, 1);
INSERT INTO public.user_roles VALUES (465, 1);
INSERT INTO public.user_roles VALUES (466, 1);
INSERT INTO public.user_roles VALUES (467, 1);
INSERT INTO public.user_roles VALUES (468, 1);
INSERT INTO public.user_roles VALUES (469, 1);
INSERT INTO public.user_roles VALUES (470, 1);
INSERT INTO public.user_roles VALUES (471, 1);
INSERT INTO public.user_roles VALUES (472, 1);
INSERT INTO public.user_roles VALUES (473, 1);
INSERT INTO public.user_roles VALUES (474, 1);
INSERT INTO public.user_roles VALUES (475, 1);
INSERT INTO public.user_roles VALUES (477, 1);
INSERT INTO public.user_roles VALUES (476, 1);
INSERT INTO public.user_roles VALUES (479, 1);
INSERT INTO public.user_roles VALUES (480, 1);
INSERT INTO public.user_roles VALUES (478, 1);
INSERT INTO public.user_roles VALUES (483, 1);
INSERT INTO public.user_roles VALUES (481, 1);
INSERT INTO public.user_roles VALUES (482, 1);
INSERT INTO public.user_roles VALUES (484, 1);
INSERT INTO public.user_roles VALUES (485, 1);
INSERT INTO public.user_roles VALUES (486, 1);
INSERT INTO public.user_roles VALUES (487, 1);
INSERT INTO public.user_roles VALUES (488, 1);
INSERT INTO public.user_roles VALUES (489, 1);
INSERT INTO public.user_roles VALUES (490, 1);
INSERT INTO public.user_roles VALUES (491, 1);
INSERT INTO public.user_roles VALUES (492, 1);
INSERT INTO public.user_roles VALUES (493, 1);
INSERT INTO public.user_roles VALUES (494, 1);
INSERT INTO public.user_roles VALUES (495, 1);
INSERT INTO public.user_roles VALUES (496, 1);
INSERT INTO public.user_roles VALUES (497, 1);
INSERT INTO public.user_roles VALUES (499, 1);
INSERT INTO public.user_roles VALUES (498, 1);
INSERT INTO public.user_roles VALUES (500, 1);
INSERT INTO public.user_roles VALUES (501, 1);
INSERT INTO public.user_roles VALUES (502, 1);
INSERT INTO public.user_roles VALUES (503, 1);
INSERT INTO public.user_roles VALUES (504, 1);
INSERT INTO public.user_roles VALUES (505, 1);
INSERT INTO public.user_roles VALUES (506, 1);
INSERT INTO public.user_roles VALUES (507, 1);
INSERT INTO public.user_roles VALUES (508, 1);
INSERT INTO public.user_roles VALUES (510, 1);
INSERT INTO public.user_roles VALUES (511, 1);
INSERT INTO public.user_roles VALUES (512, 1);
INSERT INTO public.user_roles VALUES (513, 1);
INSERT INTO public.user_roles VALUES (514, 1);
INSERT INTO public.user_roles VALUES (515, 1);
INSERT INTO public.user_roles VALUES (516, 1);
INSERT INTO public.user_roles VALUES (517, 1);
INSERT INTO public.user_roles VALUES (518, 1);
INSERT INTO public.user_roles VALUES (519, 1);
INSERT INTO public.user_roles VALUES (520, 1);
INSERT INTO public.user_roles VALUES (521, 1);
INSERT INTO public.user_roles VALUES (522, 1);
INSERT INTO public.user_roles VALUES (523, 1);
INSERT INTO public.user_roles VALUES (525, 1);
INSERT INTO public.user_roles VALUES (524, 1);
INSERT INTO public.user_roles VALUES (526, 1);
INSERT INTO public.user_roles VALUES (527, 1);
INSERT INTO public.user_roles VALUES (528, 1);
INSERT INTO public.user_roles VALUES (529, 1);
INSERT INTO public.user_roles VALUES (530, 1);
INSERT INTO public.user_roles VALUES (531, 1);
INSERT INTO public.user_roles VALUES (532, 1);
INSERT INTO public.user_roles VALUES (533, 1);
INSERT INTO public.user_roles VALUES (534, 1);
INSERT INTO public.user_roles VALUES (535, 1);
INSERT INTO public.user_roles VALUES (536, 1);
INSERT INTO public.user_roles VALUES (537, 1);
INSERT INTO public.user_roles VALUES (538, 1);
INSERT INTO public.user_roles VALUES (539, 1);
INSERT INTO public.user_roles VALUES (540, 1);
INSERT INTO public.user_roles VALUES (541, 1);
INSERT INTO public.user_roles VALUES (542, 1);
INSERT INTO public.user_roles VALUES (543, 1);
INSERT INTO public.user_roles VALUES (544, 1);
INSERT INTO public.user_roles VALUES (545, 1);
INSERT INTO public.user_roles VALUES (546, 1);
INSERT INTO public.user_roles VALUES (547, 1);
INSERT INTO public.user_roles VALUES (548, 1);
INSERT INTO public.user_roles VALUES (549, 1);
INSERT INTO public.user_roles VALUES (550, 1);
INSERT INTO public.user_roles VALUES (551, 1);
INSERT INTO public.user_roles VALUES (552, 1);
INSERT INTO public.user_roles VALUES (553, 1);
INSERT INTO public.user_roles VALUES (555, 1);
INSERT INTO public.user_roles VALUES (554, 1);
INSERT INTO public.user_roles VALUES (556, 1);
INSERT INTO public.user_roles VALUES (558, 1);
INSERT INTO public.user_roles VALUES (557, 1);
INSERT INTO public.user_roles VALUES (559, 1);
INSERT INTO public.user_roles VALUES (560, 1);
INSERT INTO public.user_roles VALUES (561, 1);
INSERT INTO public.user_roles VALUES (563, 1);
INSERT INTO public.user_roles VALUES (562, 1);
INSERT INTO public.user_roles VALUES (564, 1);
INSERT INTO public.user_roles VALUES (565, 1);
INSERT INTO public.user_roles VALUES (567, 1);
INSERT INTO public.user_roles VALUES (566, 1);
INSERT INTO public.user_roles VALUES (568, 1);
INSERT INTO public.user_roles VALUES (569, 1);
INSERT INTO public.user_roles VALUES (570, 1);
INSERT INTO public.user_roles VALUES (571, 1);
INSERT INTO public.user_roles VALUES (573, 1);
INSERT INTO public.user_roles VALUES (574, 1);
INSERT INTO public.user_roles VALUES (575, 1);
INSERT INTO public.user_roles VALUES (576, 1);
INSERT INTO public.user_roles VALUES (577, 1);
INSERT INTO public.user_roles VALUES (578, 1);
INSERT INTO public.user_roles VALUES (579, 1);
INSERT INTO public.user_roles VALUES (580, 1);
INSERT INTO public.user_roles VALUES (581, 1);
INSERT INTO public.user_roles VALUES (582, 1);
INSERT INTO public.user_roles VALUES (584, 1);
INSERT INTO public.user_roles VALUES (583, 1);
INSERT INTO public.user_roles VALUES (585, 1);
INSERT INTO public.user_roles VALUES (586, 1);
INSERT INTO public.user_roles VALUES (587, 1);
INSERT INTO public.user_roles VALUES (588, 1);
INSERT INTO public.user_roles VALUES (589, 1);
INSERT INTO public.user_roles VALUES (590, 1);
INSERT INTO public.user_roles VALUES (591, 1);
INSERT INTO public.user_roles VALUES (592, 1);
INSERT INTO public.user_roles VALUES (593, 1);
INSERT INTO public.user_roles VALUES (594, 1);
INSERT INTO public.user_roles VALUES (595, 1);
INSERT INTO public.user_roles VALUES (596, 1);
INSERT INTO public.user_roles VALUES (599, 1);
INSERT INTO public.user_roles VALUES (597, 1);
INSERT INTO public.user_roles VALUES (598, 1);
INSERT INTO public.user_roles VALUES (600, 1);
INSERT INTO public.user_roles VALUES (601, 1);
INSERT INTO public.user_roles VALUES (602, 1);
INSERT INTO public.user_roles VALUES (603, 1);
INSERT INTO public.user_roles VALUES (604, 1);
INSERT INTO public.user_roles VALUES (605, 1);
INSERT INTO public.user_roles VALUES (607, 1);
INSERT INTO public.user_roles VALUES (606, 1);
INSERT INTO public.user_roles VALUES (608, 1);
INSERT INTO public.user_roles VALUES (609, 1);
INSERT INTO public.user_roles VALUES (610, 1);
INSERT INTO public.user_roles VALUES (612, 1);
INSERT INTO public.user_roles VALUES (613, 1);
INSERT INTO public.user_roles VALUES (614, 1);
INSERT INTO public.user_roles VALUES (615, 1);
INSERT INTO public.user_roles VALUES (616, 1);
INSERT INTO public.user_roles VALUES (617, 1);
INSERT INTO public.user_roles VALUES (618, 1);
INSERT INTO public.user_roles VALUES (619, 1);
INSERT INTO public.user_roles VALUES (620, 1);
INSERT INTO public.user_roles VALUES (622, 1);
INSERT INTO public.user_roles VALUES (623, 1);
INSERT INTO public.user_roles VALUES (624, 1);
INSERT INTO public.user_roles VALUES (625, 1);
INSERT INTO public.user_roles VALUES (626, 1);
INSERT INTO public.user_roles VALUES (628, 1);
INSERT INTO public.user_roles VALUES (634, 1);
INSERT INTO public.user_roles VALUES (640, 1);
INSERT INTO public.user_roles VALUES (645, 1);
INSERT INTO public.user_roles VALUES (651, 1);
INSERT INTO public.user_roles VALUES (657, 1);
INSERT INTO public.user_roles VALUES (663, 1);
INSERT INTO public.user_roles VALUES (668, 1);
INSERT INTO public.user_roles VALUES (674, 1);
INSERT INTO public.user_roles VALUES (678, 1);
INSERT INTO public.user_roles VALUES (682, 1);
INSERT INTO public.user_roles VALUES (687, 1);
INSERT INTO public.user_roles VALUES (691, 1);
INSERT INTO public.user_roles VALUES (708, 1);
INSERT INTO public.user_roles VALUES (715, 1);
INSERT INTO public.user_roles VALUES (720, 1);
INSERT INTO public.user_roles VALUES (726, 1);
INSERT INTO public.user_roles VALUES (734, 1);
INSERT INTO public.user_roles VALUES (739, 1);
INSERT INTO public.user_roles VALUES (741, 1);
INSERT INTO public.user_roles VALUES (103, 1);
INSERT INTO public.user_roles VALUES (752, 1);
INSERT INTO public.user_roles VALUES (758, 1);
INSERT INTO public.user_roles VALUES (763, 1);
INSERT INTO public.user_roles VALUES (627, 1);
INSERT INTO public.user_roles VALUES (633, 1);
INSERT INTO public.user_roles VALUES (639, 1);
INSERT INTO public.user_roles VALUES (646, 1);
INSERT INTO public.user_roles VALUES (652, 1);
INSERT INTO public.user_roles VALUES (658, 1);
INSERT INTO public.user_roles VALUES (664, 1);
INSERT INTO public.user_roles VALUES (672, 1);
INSERT INTO public.user_roles VALUES (676, 1);
INSERT INTO public.user_roles VALUES (680, 1);
INSERT INTO public.user_roles VALUES (689, 1);
INSERT INTO public.user_roles VALUES (693, 1);
INSERT INTO public.user_roles VALUES (698, 1);
INSERT INTO public.user_roles VALUES (701, 1);
INSERT INTO public.user_roles VALUES (705, 1);
INSERT INTO public.user_roles VALUES (710, 1);
INSERT INTO public.user_roles VALUES (717, 1);
INSERT INTO public.user_roles VALUES (723, 1);
INSERT INTO public.user_roles VALUES (729, 1);
INSERT INTO public.user_roles VALUES (735, 1);
INSERT INTO public.user_roles VALUES (684, 1);
INSERT INTO public.user_roles VALUES (748, 1);
INSERT INTO public.user_roles VALUES (756, 1);
INSERT INTO public.user_roles VALUES (621, 1);
INSERT INTO public.user_roles VALUES (766, 1);
INSERT INTO public.user_roles VALUES (629, 1);
INSERT INTO public.user_roles VALUES (635, 1);
INSERT INTO public.user_roles VALUES (641, 1);
INSERT INTO public.user_roles VALUES (647, 1);
INSERT INTO public.user_roles VALUES (653, 1);
INSERT INTO public.user_roles VALUES (660, 1);
INSERT INTO public.user_roles VALUES (667, 1);
INSERT INTO public.user_roles VALUES (673, 1);
INSERT INTO public.user_roles VALUES (677, 1);
INSERT INTO public.user_roles VALUES (681, 1);
INSERT INTO public.user_roles VALUES (712, 1);
INSERT INTO public.user_roles VALUES (718, 1);
INSERT INTO public.user_roles VALUES (724, 1);
INSERT INTO public.user_roles VALUES (730, 1);
INSERT INTO public.user_roles VALUES (736, 1);
INSERT INTO public.user_roles VALUES (740, 1);
INSERT INTO public.user_roles VALUES (745, 1);
INSERT INTO public.user_roles VALUES (751, 1);
INSERT INTO public.user_roles VALUES (755, 1);
INSERT INTO public.user_roles VALUES (761, 1);
INSERT INTO public.user_roles VALUES (767, 1);
INSERT INTO public.user_roles VALUES (630, 1);
INSERT INTO public.user_roles VALUES (636, 1);
INSERT INTO public.user_roles VALUES (642, 1);
INSERT INTO public.user_roles VALUES (648, 1);
INSERT INTO public.user_roles VALUES (655, 1);
INSERT INTO public.user_roles VALUES (661, 1);
INSERT INTO public.user_roles VALUES (665, 1);
INSERT INTO public.user_roles VALUES (686, 1);
INSERT INTO public.user_roles VALUES (690, 1);
INSERT INTO public.user_roles VALUES (703, 1);
INSERT INTO public.user_roles VALUES (707, 1);
INSERT INTO public.user_roles VALUES (711, 1);
INSERT INTO public.user_roles VALUES (716, 1);
INSERT INTO public.user_roles VALUES (722, 1);
INSERT INTO public.user_roles VALUES (728, 1);
INSERT INTO public.user_roles VALUES (733, 1);
INSERT INTO public.user_roles VALUES (738, 1);
INSERT INTO public.user_roles VALUES (744, 1);
INSERT INTO public.user_roles VALUES (749, 1);
INSERT INTO public.user_roles VALUES (754, 1);
INSERT INTO public.user_roles VALUES (759, 1);
INSERT INTO public.user_roles VALUES (765, 1);
INSERT INTO public.user_roles VALUES (631, 1);
INSERT INTO public.user_roles VALUES (638, 1);
INSERT INTO public.user_roles VALUES (643, 1);
INSERT INTO public.user_roles VALUES (654, 1);
INSERT INTO public.user_roles VALUES (659, 1);
INSERT INTO public.user_roles VALUES (666, 1);
INSERT INTO public.user_roles VALUES (696, 1);
INSERT INTO public.user_roles VALUES (699, 1);
INSERT INTO public.user_roles VALUES (702, 1);
INSERT INTO public.user_roles VALUES (713, 1);
INSERT INTO public.user_roles VALUES (719, 1);
INSERT INTO public.user_roles VALUES (725, 1);
INSERT INTO public.user_roles VALUES (732, 1);
INSERT INTO public.user_roles VALUES (737, 1);
INSERT INTO public.user_roles VALUES (743, 1);
INSERT INTO public.user_roles VALUES (746, 1);
INSERT INTO public.user_roles VALUES (750, 1);
INSERT INTO public.user_roles VALUES (757, 1);
INSERT INTO public.user_roles VALUES (762, 1);
INSERT INTO public.user_roles VALUES (768, 1);
INSERT INTO public.user_roles VALUES (632, 1);
INSERT INTO public.user_roles VALUES (637, 1);
INSERT INTO public.user_roles VALUES (644, 1);
INSERT INTO public.user_roles VALUES (650, 1);
INSERT INTO public.user_roles VALUES (656, 1);
INSERT INTO public.user_roles VALUES (662, 1);
INSERT INTO public.user_roles VALUES (669, 1);
INSERT INTO public.user_roles VALUES (675, 1);
INSERT INTO public.user_roles VALUES (679, 1);
INSERT INTO public.user_roles VALUES (683, 1);
INSERT INTO public.user_roles VALUES (688, 1);
INSERT INTO public.user_roles VALUES (692, 1);
INSERT INTO public.user_roles VALUES (697, 1);
INSERT INTO public.user_roles VALUES (700, 1);
INSERT INTO public.user_roles VALUES (704, 1);
INSERT INTO public.user_roles VALUES (709, 1);
INSERT INTO public.user_roles VALUES (714, 1);
INSERT INTO public.user_roles VALUES (721, 1);
INSERT INTO public.user_roles VALUES (727, 1);
INSERT INTO public.user_roles VALUES (649, 1);
INSERT INTO public.user_roles VALUES (742, 1);
INSERT INTO public.user_roles VALUES (747, 1);
INSERT INTO public.user_roles VALUES (753, 1);
INSERT INTO public.user_roles VALUES (764, 1);
INSERT INTO public.user_roles VALUES (769, 1);


--
-- Name: beneficiary_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beneficiary_data_id_seq', 1, false);


--
-- Name: beneficiary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beneficiary_id_seq', 1, false);


--
-- Name: claim_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_data_id_seq', 1, false);


--
-- Name: claim_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_id_seq', 1, false);


--
-- Name: dependant_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dependant_data_id_seq', 1627, true);


--
-- Name: dependant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dependant_id_seq', 1623, true);


--
-- Name: hr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hr_id_seq', 1, false);


--
-- Name: member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_id_seq', 769, true);


--
-- Name: member_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_registration_id_seq', 759, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: schemeplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schemeplan_id_seq', 40, true);


--
-- Name: beneficiary_data beneficiary_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary_data
    ADD CONSTRAINT beneficiary_data_pkey PRIMARY KEY (id);


--
-- Name: beneficiary beneficiary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary
    ADD CONSTRAINT beneficiary_pkey PRIMARY KEY (id);


--
-- Name: claim_data claim_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_data
    ADD CONSTRAINT claim_data_pkey PRIMARY KEY (id);


--
-- Name: claim claim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim
    ADD CONSTRAINT claim_pkey PRIMARY KEY (id);


--
-- Name: dependant_data dependant_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependant_data
    ADD CONSTRAINT dependant_data_pkey PRIMARY KEY (id);


--
-- Name: dependant dependant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependant
    ADD CONSTRAINT dependant_pkey PRIMARY KEY (id);


--
-- Name: hr hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT hr_pkey PRIMARY KEY (id);


--
-- Name: dependant member_nic_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependant
    ADD CONSTRAINT member_nic_unique UNIQUE (name, nic, dob);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: member_registration member_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_registration
    ADD CONSTRAINT member_registration_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schemeplan schemeplan_idtext_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemeplan
    ADD CONSTRAINT schemeplan_idtext_unique UNIQUE (idtext);


--
-- Name: schemeplan schemeplan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemeplan
    ADD CONSTRAINT schemeplan_pkey PRIMARY KEY (id);


--
-- Name: hr uk_bgv9bct2d25avdwp90t2uhv1m; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT uk_bgv9bct2d25avdwp90t2uhv1m UNIQUE (emp_no);


--
-- Name: member uk_fs2dmbrh2ged8td1sypwldctn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT uk_fs2dmbrh2ged8td1sypwldctn UNIQUE (empno);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (member_id, role_id);


--
-- Name: idx_claim_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_claim_category ON public.claim USING btree (category);


--
-- Name: idx_claim_claimdate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_claim_claimdate ON public.claim USING btree (claimdate);


--
-- Name: idx_claim_claimstatus; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_claim_claimstatus ON public.claim USING btree (claimstatus);


--
-- Name: idx_dep_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dep_name ON public.dependant USING btree (name);


--
-- Name: idx_member_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_member_name ON public.member USING btree (name);


--
-- Name: beneficiary_data fk6obb2l432g14w283cq9ne4evj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary_data
    ADD CONSTRAINT fk6obb2l432g14w283cq9ne4evj FOREIGN KEY (member_id) REFERENCES public.member(id);


--
-- Name: dependant_data fk6y9aai8vn2xrypvgkc93ggx3c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependant_data
    ADD CONSTRAINT fk6y9aai8vn2xrypvgkc93ggx3c FOREIGN KEY (member_id) REFERENCES public.member(id);


--
-- Name: dependant_data fk7vohpkmndp2eh2b1v4u3hhjnr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependant_data
    ADD CONSTRAINT fk7vohpkmndp2eh2b1v4u3hhjnr FOREIGN KEY (dependant_id) REFERENCES public.dependant(id);


--
-- Name: claim fkb1f4qnsth2py6jn2ufqp2wqb6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim
    ADD CONSTRAINT fkb1f4qnsth2py6jn2ufqp2wqb6 FOREIGN KEY (member_id) REFERENCES public.member(id);


--
-- Name: user_roles fkb66gjl7kcgiamuyhg7ttaf7f6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkb66gjl7kcgiamuyhg7ttaf7f6 FOREIGN KEY (member_id) REFERENCES public.member(id);


--
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: claim fkhjt7aq6c12xtajicm0q4lmq04; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim
    ADD CONSTRAINT fkhjt7aq6c12xtajicm0q4lmq04 FOREIGN KEY (dependant_id) REFERENCES public.dependant(id);


--
-- Name: member_registration fkhx3k3mjcnwhrxx8dvxf70vfo3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_registration
    ADD CONSTRAINT fkhx3k3mjcnwhrxx8dvxf70vfo3 FOREIGN KEY (member_id) REFERENCES public.member(id);


--
-- Name: claim_data fkirluylyrns7yxwjc77g2x94uw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_data
    ADD CONSTRAINT fkirluylyrns7yxwjc77g2x94uw FOREIGN KEY (scheme_data_id) REFERENCES public.schemeplan(id);


--
-- Name: claim_data fkljadg4d760ts3nngfaaiepoqf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_data
    ADD CONSTRAINT fkljadg4d760ts3nngfaaiepoqf FOREIGN KEY (claim_id) REFERENCES public.claim(id);


--
-- Name: beneficiary_data fkqf7b3mh19l30voxyf422okcc6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary_data
    ADD CONSTRAINT fkqf7b3mh19l30voxyf422okcc6 FOREIGN KEY (beneficiary_id) REFERENCES public.beneficiary(id);


--
-- PostgreSQL database dump complete
--

