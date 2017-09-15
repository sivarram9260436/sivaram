--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    document_name character varying(255),
    document_path character varying(255),
    status boolean DEFAULT true
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: employee_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee_details (
    id integer NOT NULL,
    title character varying(255),
    emp_name character varying(255),
    last_name character varying(255),
    middle_name character varying(255),
    pan_number character varying(255),
    pf_number character varying(255),
    gender character varying(255),
    martial_status character varying(255),
    dob date,
    date_of_join date,
    role_id integer,
    contact_no character varying(255),
    official_mailid character varying(255),
    password character varying(255),
    manager_mailid character varying(255),
    empl_id character varying(255),
    tl_mailid character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    reset_password_code character varying,
    active_resetcode character varying DEFAULT 'false'::character varying NOT NULL,
    active character varying(255) DEFAULT 'Active'::character varying,
    office_type_id integer,
    office_contact_no character varying(255),
    pf_uan_no character varying(255),
    actual_dob date,
    aadhar_number character varying(255)
);


ALTER TABLE public.employee_details OWNER TO postgres;

--
-- Name: employee_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employee_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_details_id_seq OWNER TO postgres;

--
-- Name: employee_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employee_details_id_seq OWNED BY employee_details.id;


--
-- Name: leave_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE leave_details (
    id integer NOT NULL,
    employee_detail_id integer,
    leave_type_id integer,
    total_leaves double precision,
    balance double precision,
    availed double precision,
    carry_forward double precision,
    year integer,
    total_leave_balance double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.leave_details OWNER TO postgres;

--
-- Name: leave_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE leave_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_details_id_seq OWNER TO postgres;

--
-- Name: leave_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE leave_details_id_seq OWNED BY leave_details.id;


--
-- Name: leave_records; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE leave_records (
    id integer NOT NULL,
    leave_type_id integer,
    no_of_days double precision,
    employee_detail_id integer,
    year integer,
    from_date date,
    to_date date,
    reason character varying(255),
    status character varying(255) DEFAULT 'Pending'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.leave_records OWNER TO postgres;

--
-- Name: leave_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE leave_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_records_id_seq OWNER TO postgres;

--
-- Name: leave_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE leave_records_id_seq OWNED BY leave_records.id;


--
-- Name: leave_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE leave_types (
    id integer NOT NULL,
    leave_types character varying(255),
    total_leaves double precision
);


ALTER TABLE public.leave_types OWNER TO postgres;

--
-- Name: leave_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE leave_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_types_id_seq OWNER TO postgres;

--
-- Name: leave_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE leave_types_id_seq OWNED BY leave_types.id;


--
-- Name: office_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE office_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.office_types OWNER TO postgres;

--
-- Name: office_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE office_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_types_id_seq OWNER TO postgres;

--
-- Name: office_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE office_types_id_seq OWNED BY office_types.id;


--
-- Name: personal_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personal_details (
    id integer NOT NULL,
    employee_detail_id integer,
    pg_year integer,
    ug_year integer,
    diploma_year integer,
    puc_year integer,
    tenth_year integer,
    anniversary_date date,
    p_dob date,
    local_address character varying(255),
    permanent_address character varying(255),
    changeof_address character varying(255),
    personalmail_id character varying(255),
    emergency_contact character varying(255),
    blood_group character varying(255),
    father_name character varying(255),
    mother_name character varying(255),
    company_name character varying(255),
    designation character varying(255),
    experience character varying(255),
    pg character varying(255),
    ug character varying(255),
    diploma character varying(255),
    puc character varying(255),
    tenth character varying(255),
    guardian character varying(255),
    relationship character varying(255),
    company_name2 character varying(255),
    designation2 character varying(255),
    experience2 character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    passport_number character varying(255),
    linkedin_url character varying(255),
    facebook_url character varying(255),
    twitter_url character varying(255)
);


ALTER TABLE public.personal_details OWNER TO postgres;

--
-- Name: personal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personal_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_details_id_seq OWNER TO postgres;

--
-- Name: personal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personal_details_id_seq OWNED BY personal_details.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee_details ALTER COLUMN id SET DEFAULT nextval('employee_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leave_details ALTER COLUMN id SET DEFAULT nextval('leave_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leave_records ALTER COLUMN id SET DEFAULT nextval('leave_records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY leave_types ALTER COLUMN id SET DEFAULT nextval('leave_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY office_types ALTER COLUMN id SET DEFAULT nextval('office_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal_details ALTER COLUMN id SET DEFAULT nextval('personal_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documents (id, document_name, document_path, status) FROM stdin;
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documents_id_seq', 1, false);


--
-- Data for Name: employee_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee_details (id, title, emp_name, last_name, middle_name, pan_number, pf_number, gender, martial_status, dob, date_of_join, role_id, contact_no, official_mailid, password, manager_mailid, empl_id, tl_mailid, created_at, updated_at, reset_password_code, active_resetcode, active, office_type_id, office_contact_no, pf_uan_no, actual_dob, aadhar_number) FROM stdin;
45	Mr	Ramkumar	P		AWOPP8668H		Male	Married	1982-06-25	2012-04-02	3	9845577115	ramkumar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	kkkg@kreatio.com	12054		2012-09-18 10:24:38.84823	2017-03-28 09:28:37.539814	f06e4fd0	false	Active	1	9900089703	100301436777	\N	716237366193
73	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	abhinayc@kreatio.com	36d4ecf5ab9139daa0308a9f92f69253	\N	\N	\N	2012-09-21 09:27:08.301696	2013-04-24 08:45:07.911129	\N	false	Deactivated	1	\N	\N	\N	\N
43	Mr	Ramesh	P				Male	Married	1981-09-14	2010-10-20	3	8147211726	rameshp@kreatio.com	77975e33d2088571de01e8f32d7b7a3a	bala@kreatio.com	KR11042		2012-09-18 10:20:31.426579	2013-04-24 08:46:12.888766	6f960d09	false	Deactivated	1	\N	\N	\N	\N
83	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	niteshnayan@kreatio.com	284d4038bcc67dc18ce0b3c26ce56dc1	\N	\N	\N	2012-09-26 06:54:34.616953	2013-04-24 08:47:35.99948	\N	false	Deactivated	1	\N	\N	\N	\N
62	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	akasha@kreatio.com	e344b69ebd9557a6fe9fa81350b7fc2d	\N	\N	\N	2012-09-18 10:45:37.167856	2014-03-26 06:45:16.14795	\N	false	Deactivated	1	\N	\N	\N	\N
38	Mr	Praveen 	Pasala	Reddy			Male	Married	1981-03-20	\N	3	9986737436	praveen@kreatio.com	7ee604dcda94ec2f89ab6d99627ed81b	ramkumar@kreatio.com			2012-09-18 10:07:35.773916	2014-01-16 09:25:53.684267	\N	false	Deactivated	1	\N	\N	\N	\N
30	Mr	Kavin	Murugesan	Kumar	CECPK6530F		Male	Unmarried	1988-09-04	2012-07-23	3	+918880802168	kavinkumar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	ramkumar@kreatio.com	12059	ramkumar@kreatio.com	2012-09-18 09:55:17.236775	2016-01-05 07:36:17.781227	6ba264a4	false	Deactivated	1		\N	\N	\N
42	Mr	Ramesh	Kumar				Male	Unmarried	1989-08-31	2010-12-15	3	8951115696	rameshkumar@kreatio.com	d97604dedda42ea20d6713e253d3baa1	Senthilkumar@kreatio.com	12034	Senthilkumar@kreatio.com	2012-09-18 10:19:49.272885	2014-05-14 05:35:06.063321	ff2e9820	false	Deactivated	1	\N	\N	\N	\N
53	Ms	Sivasankari					Female	Unmarried	1988-02-02	2010-08-25	3	9738233142	sivasankari@kreatio.com	4f9b5a64aec1089cf10f4ef39b13988f	ramkumar@kreatio.com		alamelu@kreatio.com	2012-09-18 10:31:56.263379	2013-09-10 14:26:06.015205	\N	false	Deactivated	1	\N	\N	\N	\N
70	Mrs	Deepa	Adiga	Sukeerthi	BMIPS0745P	PY/BOM/60812/012	Female	Married	1984-10-25	2007-05-14	1	9986356028	deepa@webnish.com	1421172d0f988ce3242e56b985e2c78b	souvik@kreatio.com	12012		2012-09-21 09:17:42.394437	2017-06-09 07:56:20.588498	ac82ae64	false	Active	2			\N	
48	Mr	Senthil	Kumar		AITPJ7332F		Male	Unmarried	1983-04-24	2005-05-23	3	9902183388	senthilkumar@kreatio.com	28f2ee7d5773831deba15a779b6cf518	deepak@kreatio.com	12038		2012-09-18 10:26:53.685288	2015-07-27 10:17:33.05373	7478d284	false	Active	1		\N	\N	\N
10	Mr	Dhanabal	Thangavel				Male	Unmarried	1989-08-09	2011-09-07	3	9986571862	dhanabalt@kreatio.com	827ccb0eea8a706c4c34a16891f84e7b	bala@kreatio.com	KR11014	vijayaprakash@kreatio.com,senthilkumar@kreatio.com	2012-09-18 06:08:12.520257	2013-11-13 12:14:59.421962	61423b6f	true	Deactivated	1	\N	\N	\N	\N
71	Mr	Girish	Krishna		cfxpk7952p		Male	Married	1984-11-10	2012-01-01	3	+919686450946	girishk@kreatio.com	10d8cb123e79540345d54961d95a2980	ramaprasad@kreatio.com	12015	deepak@kreatio.com	2012-09-21 09:18:33.588109	2017-07-25 07:43:09.26211	e7c51e8f	false	Active	1		100153656790	\N	536624256313
75	Mr	Kailash					Male	Unmarried	1988-07-20	2010-12-01	3	9538478119	kailashpatil@kreatio.com	94b9ab429cfe89ee39297f840212a669	ramkumar@kreatio.com			2012-09-21 09:29:24.411456	2013-12-06 10:12:48.695476	\N	false	Deactivated	1	\N	\N	\N	\N
60	Mr	upal	byani		BAXPB4116Q		Male	Unmarried	1989-11-29	2012-08-01	3	9739769114	upalb@kreatio.com	869aa5ce3f59eb8255e6eab17a1d2ee5	ramkumar@kreatio.com	12060	ramkumar@kreatio.com	2012-09-18 10:40:21.26252	2016-01-04 10:23:45.364645	\N	false	Deactivated	1		\N	\N	\N
94	Mr	Mohan Kumar 	C		BNZPM6854P	PY/BOM/60812/073	Male	Unmarried	1989-04-16	2012-11-28	3	8147908780	mohankumarc@kreatio.com	7e6a0547e24e24ee9948a3e869415c69	jagadeeswar@kreatio.com	12075	souvik@kreatio.com	2012-11-29 06:25:15.420828	2016-04-07 06:31:58.45504	\N	false	Deactivated	1		\N	\N	\N
47	Mr	Selva Chezhian					Male	Married	1987-06-30	2010-11-26	3	9535626928	selvachezhian1@kreatio.com	53aac1f589797d36a4bc6e1c84e5a5d9	senthilkumar@kreatio.com		senthilkumar@kreatio.com	2012-09-18 10:26:13.287154	2017-05-12 08:09:52.474831	\N	false	Deactivated	1	\N	\N	\N	\N
81	Mrs	Chandrala 	Albur	Anandrao			Female	Married	1986-09-03	2012-08-09	2	9739103364	chandrala@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	souvik@kreatio.com			2012-09-24 05:53:44.098752	2013-07-24 07:05:21.236743	3a04e0a7	false	Deactivated	1	\N	\N	\N	\N
77	Mr	Arun	M	Kumar	avjpm7144d	PY/BOM/60812/004	Male	Married	1986-06-20	2008-06-23	1	9742479425	arunkumar@webnish.com	80c0c41837230fd10d6900fa3b43db8e	dipti@webnish.com	12003	bharathi@webnish.com	2012-09-21 09:31:32.630534	2017-05-29 08:51:35.216389	984b54ae	false	Active	2			1986-05-24	
44	Mr	RAHUL	M.R		BKQPR2775c 		Male	Unmarried	1986-10-22	2012-04-09	3	8123533534	rahulmr@kreatio.com	4929bc8abeb552be5a427901ae0083dc	arif@webnish.com	12055		2012-09-18 10:21:16.54601	2015-06-12 10:33:06.946888	\N	false	Deactivated	1	\N	\N	\N	\N
40	Mr	Rabindra	Maharana	Kumar	AUXPM2023Q	PYBOM00608120000000032	Male	Married	1984-05-17	2008-11-24	1	9972933684	rabindrak@kreatio.com	a415ffe43a6712aa58dbaa92455af706	kkkg@kreatio.com	12032		2012-09-18 10:18:07.784413	2017-08-17 05:33:27.747424	6f229ed8	true	Active	1		100289194022	1984-03-05	386121779137
57	Mr	Vinod	Naik	D			Male	Married	1987-09-14	2011-01-25	3	9620730461	vinodnaik@kreatio.com	c335cf18bb4e31664a2004b6d6a8330c	vijayaprakash@kreatio.com		senthilkumar@kreatio.com	2012-09-18 10:36:46.288891	2013-09-11 12:29:31.016869	\N	false	Deactivated	1	\N	\N	\N	\N
33	Mr	Michael	Wins		BDRPM7374L		Male	Unmarried	1987-04-27	2012-03-21	1	8050953164	michaelwins@kreatio.com	6c62425e5dcd9db48bca4753991d19e5	dipti@webnish.com	12053	bharathi@webnish.com	2012-09-18 10:00:45.853242	2016-02-29 10:13:39.054282	d0ee4524	true	Deactivated	2		\N	\N	\N
91	Mr	Rajesh	V	Kannan	BIQPR3277M	PY/BOM/60812/068	Male	Unmarried	1989-06-10	2012-11-26	3	9742665400	kannan@kreatio.com	d155f675a9487811096dc87597426f8e	senthilkumar@kreatio.com	12070	senthilkumar@kreatio.com	2012-11-27 06:22:58.728971	2016-07-12 04:43:28.216174	\N	false	Deactivated	1		\N	\N	\N
67	Mr	Bharath					Male	Married	1987-01-24	2010-12-17	3	9980772322	bharathr@kreatio.com	4616affdd46b8fe97e6a87de68667cb0	deepa@kreatio.com		souvik@kreatio.com	2012-09-21 09:14:57.334442	2014-01-16 09:25:53.646625	\N	false	Deactivated	1	\N	\N	\N	\N
2	Mrs	hr	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	hr@kreatio.com	399c1673c32d55a84e09c534f7cee188	\N	\N	\N	\N	2017-08-09 10:08:59.383692	2c570f6a	false	Active	1	\N	\N	\N	\N
41	Mr	Rajeev 	Kumar		CEBPK9561D		Male	Unmarried	1988-11-12	2010-07-05	3	9611544997	rajeevk@kreatio.com	c1e8b3edd8c77fbe26d3655be0823201	Souvik@kreatio.com	12033	Souvik@kreatio.com	2012-09-18 10:18:56.565373	2016-09-30 12:24:46.605699	\N	false	Deactivated	1			\N	\N
76	Mr	Kannan	Doss		BFBPM4099G		Male	Unmarried	1989-05-11	2011-11-09	3	+918197707147	kannan1@kreatio.com	d155f675a9487811096dc87597426f8e	jagadeeswar@kreatio.com	KR11023	souvik@kreatio.com	2012-09-21 09:29:59.615896	2014-08-19 11:22:26.570025	65d4f700	false	Deactivated	1	\N	\N	\N	\N
34	Mr	Nanthakumar					Male	Unmarried	1983-05-09	2011-08-08	3	9379163231	nantha@kreatio.com	77975e33d2088571de01e8f32d7b7a3a	ramkumar@kreatio.com			2012-09-18 10:01:26.858813	2014-01-16 09:25:53.711132	\N	false	Deactivated	1	\N	\N	\N	\N
36	Mr	nitin					Male	Unmarried	1989-04-05	\N	3	9008422668	nitinnayan@kreatio.com	3006d843fceb1599f1b190168ddcd63d	ajaykumar@kreatio.com			2012-09-18 10:04:29.842316	2014-05-14 05:35:06.10538	\N	false	Deactivated	1	\N	\N	\N	\N
55	Mr	Thendralvanan					Male	Unmarried	1987-01-08	2010-10-11	3	8884755007	thendralvanan@kreatio.com	ef4d44352caab8699e9de49a6f0cee81	sumitha@kreatio.com		souvik@kreatio.com	2012-09-18 10:35:07.691929	2015-01-30 10:27:24.606824	9a4faa93	false	Deactivated	1	\N	\N	\N	\N
50	Mr	Srikanth	KR				Male	Unmarried	1987-06-29	2010-12-19	3	9886116318	srikanthkp@kreatio.com	79faf151e99526c9f4bdb215b98a3aa0	pankaj@kreatio.com			2012-09-18 10:29:45.930046	2013-04-24 08:43:41.995981	\N	false	Deactivated	1	\N	\N	\N	\N
51	Mrs	Sumitha		k	BAOPK1938A		Female	Married	1986-02-18	2007-08-06	1	9480580571	sumitha@kreatio.com	304d4e202cc28498cf3492d9eb98baed	kkkg@kreatio.com	12042	souvik@kreatio.com	2012-09-18 10:30:24.048634	2017-08-03 06:05:10.053488	\N	false	Active	1			\N	
32	Mr	Lal 	Sahab		AESPL5197H		Male	Married	1983-12-21	2010-09-27	3	8095202640	lalsahab@kreatio.com	8a098328d943a33ee84e897978f7a3d0	ramkumar@kreatio.com	KR11027	nantha@kreatio.com	2012-09-18 09:59:56.208265	2013-04-24 08:45:08.007464	\N	false	Deactivated	1	\N	\N	\N	\N
97	Ms	Eisha	Sethi				Female	Unmarried	1983-10-21	2012-12-03	3	9538033703	eishasethi@kreatio.com	87ca7962c197ed7c9289b87add396c6f	souvik@kreatio.com			2012-12-03 06:19:09.47287	2013-09-10 14:26:06.149629	af2f17a2	false	Deactivated	1	\N	\N	\N	\N
96	Mr	Vishal	Badave		AOLPB8602G		Male	Unmarried	1986-02-19	2012-11-26	3	8904875554	vishalmbadve@kreatio.com	e304a769d6be2014e9df89abf08cb1ca	javeedb@kreatio.com		souvik@kreatio.com	2012-11-29 08:56:08.23087	2013-04-24 08:45:08.055716	\N	false	Deactivated	1	\N	\N	\N	\N
82	Mr	Bala	Loganathan	Chandran		PY/BOM/60812/007	Male	Married	1984-02-27	2007-03-20	1	9916669979	bala@kreatio.com	f70ce94302908f238959e38ebfe1782e	senthilkumar@kreatio.com	KR11008	senthilkumar@kreatio.com	2012-09-26 05:45:54.709137	2013-11-13 12:14:59.472598	c0d4b40d	false	Deactivated	1	\N	\N	\N	\N
74	Mr	Javeed			ASQPR0693E		Male	Unmarried	1985-06-25	2011-03-01	1	9986884740	javeedb@kreatio.com	6694acd2499e403221897de2c78a7c5c	souvik@kreatio.com			2012-09-21 09:28:41.550078	2013-12-06 10:12:22.608501	6ad756db	false	Deactivated	1	\N	\N	\N	\N
52	Ms	Swapnil	Shilpa		CCDPS0226D		Female	Married	1986-10-03	2009-07-01	1	9916389639	swapnil@kreatio.com	e4300d79073cd38590a3dff045347a69	kkkg@kreatio.com	12043		2012-09-18 10:31:11.854008	2017-08-08 14:15:00.241142	bdbd30aa	false	Active	1			\N	579619915239
64	Mr	Dharmender 	Kumar		CRRPK1048J		Male	Unmarried	1987-03-07	2012-09-11	3	9008422668	dharmender@kreatio.com	213e3b3f95efc938ae842774ce5ce636	ajaykumar@kreatio.com	12065	ajaykumar@kreatio.com	2012-09-18 10:47:02.083314	2016-06-23 09:44:35.759629	3177d364	false	Deactivated	1		\N	\N	\N
102	Mr	MADHAVAN			BBLPM4646P		Male	Unmarried	1986-07-31	2013-01-16	3	7411637638	madhavanr@kreatio.com	6fa235630452932fd60a7d09175b53ee	vishnuprabhakar@kreatio.com	12082	suhana@kreatio.com,gprabhu@kreatio.com	2013-01-17 06:55:03.49907	2016-05-20 09:53:15.575283	\N	false	Deactivated	1		\N	\N	\N
29	Mr	Kingston			BSUPK7271E	PY/BOM/60812/022	Male	Unmarried	1989-05-09	2011-01-13	3	9902454743	kingston@kreatio.com	172ab87e9505db726b1621655bd813ed	arunkumar@kreatio.com	12022	arif@webnish.com	2012-09-18 09:49:34.352532	2015-12-01 10:00:46.226391	153e7f5c	false	Deactivated	2		\N	\N	\N
46	Mr	Samir	Pani	Kumar			Male	Unmarried	1987-01-15	2011-05-12	3	8884917339	samir@kreatio.com	0a240d47e2ff8a2fd770f947b6c724c8	swapnil@kreatio.com		souvik@kreatio.com	2012-09-18 10:25:31.076072	2014-02-20 07:35:21.845944	\N	false	Deactivated	1	\N	\N	\N	\N
28	Mr	Karthikeyan	Siva				Male	Unmarried	1986-11-23	2010-11-24	3	9916839256	karthikeyan@kreatio.com	10b54d87f59230e49bf7b0a821de4db1	ramkumar@kreatio.com		nantha@kreatio.com	2012-09-18 09:48:54.162872	2014-03-11 08:48:51.987228	\N	false	Deactivated	1	\N	\N	\N	\N
68	Mr	Gurudath	BN				Male	Unmarried	1989-03-30	2011-10-19	3	8105213004	gurudath@kreatio.com	533bc93d6feca6d7e6b5ee96158c0f82	suhana@kreatio.com	12009	suhana@kreatio.com	2012-09-21 09:15:53.529927	2015-01-30 10:23:26.917967	a44fbdca	false	Deactivated	1		\N	\N	\N
106	Mrs	priya	darshini.R				Female	Married	2013-06-06	2013-03-13	2	8722699214	priyap@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	 \tsouvik@kreatio.com			2013-03-14 05:54:40.620297	2013-09-10 14:29:05.157416	6aa68259	true	Deactivated	1	\N	\N	\N	\N
100	Mr	venkatesh	chowdary				Male	Unmarried	1988-05-10	2013-01-07	3	9916289808	kvenkatesh@kreatio.com	433e9f75a647687387eb607c821c6fc8	rabindrak@kreatio.com		souvik@kreatio.com	2013-01-07 07:25:25.108863	2013-09-10 14:26:06.11129	b9514af9	false	Deactivated	1	\N	\N	\N	\N
79	Mr	Vijendra	Kargudri	Shashikant	AHOPK8895L		Male	Unmarried	1966-11-18	2012-08-02	3	9538297328	vijendras@kreatio.com	c83ce9c1dd895a8ed6b39bb17f29af35	souvik@kreatio.com			2012-09-21 09:39:22.855522	2013-09-25 05:18:18.893274	\N	false	Deactivated	1	\N	\N	\N	\N
80	Mr	prabu			BXMPP9488H		Male	Married	1989-08-11	2011-11-18	1	8951378379	gprabhu@kreatio.com	f70ce94302908f238959e38ebfe1782e	souvik@kreatio.com	12031		2012-09-21 10:02:54.07806	2015-12-18 10:20:05.595766	76f232ee	false	Deactivated	1		\N	\N	\N
85	Mrs	Alamelu			AHCPN9298A		Female	Married	1984-07-20	2007-08-16	3	9986739669	alamelu@kreatio.com	697e5a62f333214228a2ae5f23dfb345	ramkumar@kreatio.com			2012-10-04 09:59:05.666704	2013-12-19 11:47:29.748222	7ee54f61	false	Deactivated	1	\N	\N	\N	\N
31	Mr	kumar	k		CNTPK2646E		Male	Unmarried	1987-09-19	2012-08-13	3	9742763167	kumark@webnish.com	56713a92586fa877f37384741dcf0e6d	souvik@kreatio.com	12063	 jagadeeswar@kreatio.com	2012-09-18 09:58:23.392262	2017-07-24 11:35:56.594058	8c24001f	false	Active	1			\N	
103	Mr	Manivannan	A		BKAPM1928E		Male	Unmarried	1986-09-03	2013-01-10	3	8050786637	manivannan@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	bala@kreatio.com			2013-01-18 12:00:44.422042	2013-12-06 10:13:43.806607	\N	false	Deactivated	1	\N	\N	\N	\N
95	Mr	vishnu	prabhakar				Male	Unmarried	1990-06-11	2012-11-26	3	9632929186	vishnuprabhakar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	deepa@kreatio.com	12072	souvik@kreatio.com	2012-11-29 06:49:30.39028	2016-12-12 09:22:03.274253	f4a57554	false	Deactivated	1			\N	\N
56	Mr	Vijayaprakash	Balan		AFMPV8729A	PY/BOM/0024445/000/0000268	Male	Married	1981-04-08	2006-07-20	1	9886692957	vijayaprakash@kreatio.com	8235b0c21ca4a96f92238628fd2aca8a	senthilkumar@kreatio.com	KR11054	senthilkumar@kreatio.com	2012-09-18 10:35:55.910239	2013-12-24 11:43:30.7817	\N	false	Deactivated	1	\N	\N	\N	\N
37	Mr	Prakash	Natarajan				Male	Unmarried	1986-07-10	2011-03-16	3	9535200641	prakash@kreatio.com	b3f2f9e72f767faf12c1a017eab991b7	antony@kreatio.com		souvik@kreatio.com	2012-09-18 10:06:53.244054	2014-04-28 07:07:29.956401	\N	false	Deactivated	1	\N	\N	\N	\N
104	Mr	Muniraju	R				Male	Married	1983-07-10	2013-01-16	3	09620204510	munirajur@kreatio.com	e79ba52bad10bf6fe5705800f943a38f	arif@webnish.com		arif@webnish.com	2013-01-23 08:17:28.732791	2014-02-20 07:35:21.812799	c1b430fc	false	Deactivated	1	\N	\N	\N	\N
90	Mr	AJAY	KARN	KUMAR	ASOPK0161E		Male	Married	1976-02-20	2006-08-01	3	+919900089707	ajaykumar@kreatio.com	6c10c5b62232e2af39dbfb39d8914861	souvik@kreatio.com	12001	kdeepak@kreatio.com	2012-11-02 09:54:22.436927	2016-11-03 12:12:52.917205	bdfee960	true	Deactivated	1	+919845949353		\N	\N
49	Mr	Souvik	Mukherjee				Male	Married	1982-06-09	2012-03-01	1	9980755144	souvik@kreatio.com	7be38d2855d25fdeea58e00db0d84922	deepak@kreatio.com	12040		2012-09-18 10:29:03.617962	2015-08-31 09:21:24.505839	\N	false	Active	1		\N	\N	\N
89	Mr	Anudeep	D				Male	Unmarried	1988-05-10	2012-10-03	3	9739806119	anudeepd@kreatio.com	8e1c7a1a0c9217680b46d4c427250b42	pankaj@kreatio.com			2012-10-19 04:36:07.7215	2014-01-16 09:25:53.739325	\N	false	Deactivated	1	\N	\N	\N	\N
72	Mr	Jagadeeswar	Devalla		ASZPD0566F	PY/BOM/60812/017	Male	Married	1988-06-13	2011-01-17	3	8904461344	jagadeeswar@kreatio.com	cfbe7e96741be7f2aa8928e43eae313a	aditya.agrawal@kreatio.com	12017	selvachezhian@kreatio.com	2012-09-21 09:19:33.274221	2017-07-25 10:19:05.451329	7d76d43a	true	Active	1		100169908495	1988-07-28	429567907879
101	Mr	Ragavendaran	N		AKJPR9503Q		Male	Unmarried	1987-04-26	2013-01-17	3	7411466961	ragavendaran@kreatio.com	77a4a48f8d115a0cd69d50d30c5298d7	arunkumar@kreatio.com	12083	arif@webnish.com	2013-01-17 06:53:14.848724	2015-12-08 09:40:53.508322	f2f941a8	false	Deactivated	2		\N	\N	\N
98	Ms	sameena	s		DPOPS2605F	PY/BOM/60812/067	Female	Unmarried	1988-06-22	2012-11-26	3	7411551135	shaiksameena@kreatio.com	5824fb795d721f88e9a6a5ec161525e5	sumitha@kreatio.com	12069		2012-12-04 06:30:12.605344	2016-07-01 04:10:11.649907	\N	false	Deactivated	1		\N	\N	\N
136	Mr	SHARANABASAPPA	NAMANE	SHRIMANTH			Male	Unmarried	1989-06-01	2013-08-26	3	9739616570	sharanabasappa@webnish.com	62763ded5709006ac36c88b552247ab9	chetanac@webnish.com		arif@webnish.com	2013-08-26 08:36:03.180857	2014-01-16 09:25:53.794239	\N	false	Deactivated	2	\N	\N	\N	\N
111	Mr	Manjunath 	H.S				Male	Unmarried	1987-02-22	2013-04-08	3	  9901088112	manjunath@kreatio.com	cf7d1d3861a6e7e20cfe45b35bb68e2b	rabindrak@kreatio.com	12087		2013-04-08 09:10:48.443073	2015-02-06 05:19:58.048991	521fc727	true	Deactivated	1	\N	\N	\N	\N
140	Mrs	N.Bharathi	Devi		BUYPD4431P		Female	Married	1989-05-16	2013-09-16	3	9731897756	bharathi@webnish.com	0ce284d552663331bd8300d8d3cf438c	souvik@kreatio.com	12110	bharathi@webnish.com	2013-10-08 10:20:29.805177	2017-01-05 13:15:57.446475	4cd03000	false	Active	2	9900089710		\N	
35	Mr	Neetin	Kumar				Male	Married	1979-09-17	2007-09-04	1	9686448189	neetinkumar@kreatio.com	1c9e6b9f5f0fb2f87485f87c70b64674	senthilkumar@kreatio.com		souvik@kreatio.com	2012-09-18 10:02:37.157516	2013-04-24 09:24:53.142832	\N	false	Deactivated	1	\N	\N	\N	\N
127	Mr	Manu	Dwivedi		CCFPM5596J		Male	Unmarried	1991-07-29	2013-06-26	3	8147326329	manud@kreatio.com	f3bbd7173a1257fbfe3f297766723afc	giri@kreatio.com	12096	senthilkumar@kreatio.com	2013-06-26 10:13:21.562659	2014-09-26 12:22:55.74888	f1b61b09	false	Deactivated	1		\N	\N	\N
123	Ms	Srisakthi	R				Female	Unmarried	1991-08-30	2013-06-24	3	9003652224	srisakthi@kreatio.com	26588e932c7ccfa1df309280702fe1b5	senthilkumar@kreatio.com			2013-06-24 07:31:19.075977	2014-06-23 11:04:49.904111	\N	false	Deactivated	1	\N	\N	\N	\N
63	Mr	Umesh		Balasubramanyam	AAYPU8129J	PY/BOM/60812/064	Male	Married	1982-12-28	2012-09-07	3	9620204509	umeshb@kreatio.com	8d9d2695d4345cdd3fd11c9078545ade	vishnu@kreatio.com	12064		2012-09-18 10:46:21.061395	2017-02-23 08:10:28.838358	72d31b0d	false	Active	1	08032568466		\N	
118	Mr	Arif	Imam		AAWPI3472Q		Male	Married	1970-10-16	2013-05-27	1	09620204513	arif@webnish.com	0f4c639894a6bbdefd65b7b884b2ed40	dipti@webnish.com	12092		2013-05-30 07:14:42.818522	2015-12-18 06:28:38.299158	\N	false	Deactivated	2		\N	\N	\N
121	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	senthil@kreatio.com	d00c31e00c24466aa156fe7d05181e57	\N	\N	\N	2013-06-19 09:59:20.54319	2013-12-06 10:16:33.346069	\N	false	Deactivated	1	\N	\N	\N	\N
109	Ms	pavan	kadwadkar		DQBPK9818L		Female	Unmarried	1989-12-24	2013-03-26	3	8722477566	pavank@kreatio.com	141bc86dfd5c40e3cc37219c18d471ca	souvik@webnish.com	12090	bharathi@webnish.com	2013-04-03 04:46:58.732283	2016-12-20 11:13:32.622268	\N	false	Deactivated	1			\N	\N
129	Mr	fazuluddin	farook	mohammed			Male	Unmarried	1992-06-12	2013-07-01	3	9900751572	fazuluddin@kreatio.com	dc22027617228a37b1e61a264a40abfa	rameshkumar@kreatio.com			2013-07-02 04:24:24.754694	2013-12-06 10:11:50.257607	\N	false	Deactivated	1	\N	\N	\N	\N
116	Mrs	Anupama	Ankalagi				Male	Married	1983-06-04	2013-04-15	3	9480764214	anupama_old@kreatio.com	77975e33d2088571de01e8f32d7b7a3a	vijendras@kreatio.com		vijendras@kreatio.com	2013-04-15 09:21:40.543686	2013-09-17 10:02:08.182642	6a8cf96e	false	Deactivated	1	\N	\N	\N	\N
119	Mrs	Sujatha					Male	Married	1976-09-10	2013-06-10	3	9845142060	sujatha@kreatio.com	ad4ed9220f5fb220f1fcf64723a90efa	arif@webnish.com		arif@webnish.com	2013-06-11 05:21:56.00172	2013-10-03 06:53:20.703537	\N	false	Deactivated	1	\N	\N	\N	\N
128	Ms	swathi hk			DFEPS5994M		Female	Unmarried	1990-08-21	2013-06-27	3	7411219203	swathi@kreatio.com	ac28b0c8090ca9983ab1fec417fee707	gprabhu@kreatio.com	12097	senthilkumar@kreatio.com	2013-06-27 11:40:50.474097	2015-06-15 10:58:28.893733	8d5117f3	true	Deactivated	1		\N	\N	\N
112	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mallikarjunr@webnish.com	21478d26f6c79ab900d0375d42f4ea02	\N	\N	\N	2013-04-09 10:58:23.567259	2014-01-16 09:25:53.552546	\N	false	Deactivated	2	\N	\N	\N	\N
78	Mrs	Chaya					Female	Married	1987-11-04	2011-01-20	3	9483961534	chaya@kreatio.com	77975e33d2088571de01e8f32d7b7a3a	arif@webnish.com		arif@webnish.com	2012-09-21 09:33:00.442289	2013-10-03 06:53:56.325804	5523124c	false	Deactivated	1	\N	\N	\N	\N
132	Mr	Vinay	HS				Male	Unmarried	1990-05-28	2013-07-15	3	9739946143	vinayhs@kreatio.com	bfa6fd630165dff7ea1cd1969a73fd0c	rabindrak@kreatio.com			2013-07-15 09:49:27.000321	2013-11-04 09:31:53.5508	\N	false	Deactivated	1	\N	\N	\N	\N
134	Mr	KUMAR	MANISH		CJIPK3462P		Male	Married	1988-02-20	2013-08-14	1	+918050970828	manish@webnish.com	f293ddfd2ba2f93dc8676037651de837	arunkumar@webnish.com	12103	bharathi@webnish.com	2013-08-14 06:53:08.479141	2017-08-14 05:09:08.043184	e25fecbb	false	Active	2			1988-02-20	360049255220
135	Mrs	kajal	Bhutoria 		BNBPM7194J		Male	Married	1990-12-20	2013-08-26	3	8029821066	kajal@webnish.com	d9455a622330a5095c7bb5bc5f7372f3	sujatha@webnish.com		arif@webnish.com	2013-08-26 06:46:08.808243	2015-06-29 06:28:18.234521	\N	false	Deactivated	2	\N	\N	\N	\N
130	Mr	Tamil Eniyan D					Male	Unmarried	1992-04-02	2013-07-01	3	+919591893421	tamileniyan@kreatio.com	fb36314dcd153965b031809e252f5e75	vijayaprakash@kreatio.com		Senthilkumar@kreatio.com	2013-07-02 04:27:39.428667	2013-12-06 10:15:18.476097	\N	false	Deactivated	1	\N	\N	\N	\N
137	Ms	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	anita	272cdaf4b3ae8cc0c766c1989ca2aa8e	\N	\N	\N	2013-09-10 06:43:02.778163	2013-09-10 06:47:55.139402	\N	false	Deactivated	1	\N	\N	\N	\N
133	Mr	Tamilarasu	arasu		ARXPT3505F	PY/BOM/60812/101	Male	Unmarried	1992-06-07	2013-08-01	3	8867499695	tamilarasu@kreatio.com	892995fcd67558453b97e9b56611fc25	sumitha@kreatio.com	12104	hr@kreatio.com	2013-08-01 09:37:27.1562	2017-07-24 12:58:37.960867	5752bd62	false	Active	2		100388625607	\N	338339790424
110	Ms	chethana	ht				Female	Unmarried	1989-12-09	2013-04-08	3	7829664550	chethana@kreatio.com	538a0d6740b31353605af99845bc59a2	rabindrak@kreatio.com			2013-04-08 09:10:19.28683	2013-09-10 14:27:40.931247	\N	false	Deactivated	1	\N	\N	\N	\N
122	Mrs	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	manali@kreatio.com	58572dc40ec04534f764b5783e8d3c9d	\N	\N	\N	2013-06-20 13:05:14.587678	2013-10-03 06:56:32.276423	\N	false	Deactivated	1	\N	\N	\N	\N
114	Mr	Saleem	Khan C H				Male	Unmarried	1989-05-03	2013-02-11	3	9880003649	saleemkhan@webnish.com	a91ffb7e326e113ae085e51e17281719	eishasethi@kreatio.com		arif@webnish.com	2013-04-09 10:59:34.371893	2014-01-16 09:25:53.604809	\N	false	Deactivated	2	\N	\N	\N	\N
138	Ms	Anita	Ratha				Female	Unmarried	1989-07-10	2013-09-04	2	7411837929	anita@kreatio.com	788eb80664c558236791b9260d52e2e3	souvik@kreatio.com			2013-09-10 06:43:47.883702	2014-05-16 09:26:49.088926	\N	false	Deactivated	1	\N	\N	\N	\N
108	Mrs	Manjula					Female	Married	1985-11-09	2013-03-14	3	9591881232	manjulak@kreatio.com	62457d6f8cf0e71d686b8f56c63f325f	souvik@kreatio.com	12085		2013-03-28 10:08:17.683535	2015-09-02 10:12:04.340731	\N	false	Deactivated	1	9620204508	\N	\N	\N
120	Mr	Gupta					Male	Unmarried	1987-06-06	2013-07-10	3	9986728620	guptap@kreatio.com	de1a6736858820104d5e5edb3773b2be	rabindrak@kreatio.com			2013-06-11 05:54:47.80983	2014-04-28 07:07:29.871082	c824fc04	false	Deactivated	1	\N	\N	\N	\N
125	Mr	Rituraj			BFAPR8899L		Male	Unmarried	1989-10-29	2013-06-26	3	9449614380	rituraj@kreatio.com	4f2854f62ceeec67194ee9acce3a70c3	giri@kreatio.com	12095	giri@kreatio.com	2013-06-26 09:49:14.357889	2014-09-09 04:46:44.387101	ca2e9db9	false	Deactivated	1		\N	\N	\N
113	Mr	Mallikarjuna	R				Male	Unmarried	1988-12-30	2013-02-11	3	9742143612	mallikarjunar@webnish.com	f5af7150ac26802490d7a25f2d50abf7	eishasethi@kreatio.com		arif@webnish.com	2013-04-09 10:59:07.396564	2014-01-16 09:25:53.767078	85d663d5	false	Deactivated	2	\N	\N	\N	\N
117	Ms	Chetana	C		ASJPC4387P		Female	Married	1990-06-18	2013-05-02	3	9901308914	chetanac@kreatio.com	92d748ffb43efaa04082b51420f2ed21	souvik@webnish.com	12089	 arif@webnish.com	2013-05-02 09:12:37.289794	2016-06-10 11:38:50.4481	\N	false	Deactivated	1		\N	\N	\N
166	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	sharath@kreatio.com	75f30dd28e465e12cf2b3b6f15f91fff	\N	\N	\N	2014-02-17 10:24:24.805894	2014-08-08 06:17:17.006912	\N	false	Deactivated	1	\N	\N	\N	\N
161	Mr	Gopinadha	Reddy		AVFPG1218C		Male	Unmarried	1990-12-08	2013-12-19	3	8095979146	gopinadha@webnish.com	29d43616152a018e7b23b51104d25b0d	arif@webnish.com		arif@webnish.com	2013-12-23 05:30:02.745581	2014-03-26 06:45:16.036854	\N	false	Deactivated	2	\N	\N	\N	\N
58	Mr	Virendra	Mulkeepatil	shiddnagowda	BCEPM604611		Male	Married	1983-06-01	2009-12-17	3	7760228833	virendra@kreatio.com	d1a699089d3fff1d03ce5d134748d07f	rabindrak@kreatio.com	KR11056		2012-09-18 10:37:32.563154	2013-09-11 12:29:07.874908	\N	false	Deactivated	1	\N	\N	\N	\N
105	Mr	Prem	V M	Nath	BVHPP9764P		Male	Unmarried	1990-07-28	2013-02-14	3	8553855247	premnathvm@kreatio.com	b0e0001673557210cb7344e04ef56fe7	arunkumar@kreatio.com	12080	arunkumar@kreatio.com	2013-02-25 07:14:04.119767	2013-12-06 10:14:09.678118	\N	false	Deactivated	1	\N	\N	\N	\N
172	Mr	Vineet	Panicker	Venugopalan	AQOPV0018R		Male	Unmarried	1987-08-10	2014-03-12	3	8147728123	vineet@webnish.com	fe6a01301cdd5b6d1e89ef5df37c9c57	arif@webnish.com			2014-03-13 10:12:56.70637	2014-06-16 07:08:29.930185	\N	false	Deactivated	2	\N	\N	\N	\N
162	Mr	Rakesh		Kumar			Male	Unmarried	1989-11-15	2013-12-26	3	+919742480832	rakeshkumar@kreatio.com	17495678a66d807fff30c2e6f2b3d310	sumitha@kreatio.com	12125		2013-12-26 11:08:22.965076	2015-05-13 06:07:57.776296	\N	false	Deactivated	1	\N	\N	\N	\N
141	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	ashoka@webnish.com	24809280a5b227ed194adcd3f3839658	\N	\N	\N	2013-10-11 10:14:41.170338	2014-01-16 09:25:53.632496	\N	false	Deactivated	2	\N	\N	\N	\N
59	Mr	Vijayakumar	velusamy		ATBPV2441G		Male	Unmarried	1990-09-21	2012-06-22	3	9916761624	vijayakumar@kreatio.com	c029f49ea1024ad6dd9b760ce75b810e	gprabhu@kreatio.com	12058	gprabhu@kreatio.com	2012-09-18 10:39:25.208565	2015-09-10 07:04:18.140072	372501a0	true	Deactivated	1		\N	\N	\N
154	Mr	Vikram	Roy		ASXPR9393J		Male	Unmarried	1988-04-10	2013-11-08	3	9663450587	vikram@webnish.com	abd921b6712c9fe2c95a39d7c050f6e6	hr@webnish.com	12118	arif@webnish.com	2013-11-15 07:13:35.192947	2014-12-02 10:42:34.144949	3f3b8384	false	Deactivated	2	\N	\N	\N	\N
131	Mrs	Priyali	Hooda				Female	Married	1980-02-28	2013-07-15	3	9900089709	priyali@kreatio.com	78434d12d0de52042013ea881c5aea44	kkkg@kreatio.com	12099	souvik@kreatio.com	2013-07-15 09:48:52.701253	2017-07-13 03:20:26.808948	658c76bf	false	Deactivated	1			\N	\N
171	Mr	Raghavendra	V		BIMPR1186H	PY/BOM/60812/126	Male	Unmarried	1991-03-19	2014-03-05	3	8095250130	raghavendrav@kreatio.com	990c12eb7f68cde5a2553d92f22ad23c	aditya.agrawal@kreatio.com	12130	selvachezhian@kreatio.com	2014-03-06 06:09:35.081136	2017-07-19 10:21:46.438649	\N	false	Active	1			\N	\N
158	Mr	YUVARAJA	RAMASAMY		AEXPY0781P	PY/BOM/60812/118	Male	Unmarried	1990-07-02	2013-12-02	3	9743728845	yuvaraja@kreatio.com	8161eb58eba50fc54da4a5a8b0d8eb06	deepa@kreatio.com	12122		2013-12-03 05:42:30.644216	2017-03-31 10:19:33.427052	\N	false	Deactivated	1			\N	\N
151	Ms	Nagaswapna	R	N	ATWPN5429P	PY/BOM/60812/112	Female	Unmarried	1991-07-30	2013-11-05	3	9620106472	nagaswapna@kreatio.com	79d58bb5a1de3c6a2627f1a0696f451d	sumitha@kreatio.com	12116		2013-11-06 05:21:50.423113	2016-04-01 07:24:12.635161	b3ae34a7	false	Deactivated	1		\N	\N	\N
156	Mr	ALBERT	SREEDHARAN	PETTUPARAYIL			Male	Married	1981-05-20	\N	3	09446929171	albert@webnish.com	a034a3d3ad46c0881158319b58a00bd8	arif@webnish.com			2013-11-20 05:28:59.032859	2014-03-26 06:45:16.065493	\N	false	Deactivated	2	\N	\N	\N	\N
157	Mr	Mahesh	Gajendra				Male	Unmarried	1988-09-10	2013-11-25	3	9900909932	maheshg@webnish.com	ed1325e1c8fdf4f3e5609000e44b6c57	arif@webnish.com		arif@webnish.com	2013-11-26 12:09:23.848471	2014-03-26 06:45:16.094121	\N	false	Deactivated	2	\N	\N	\N	\N
234	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	abubakker@webnish.com	4f86ac586dd9d28ddc4e2eef80f58279	\N	\N	\N	2015-04-09 11:07:09.138218	2015-04-13 08:35:36.195775	\N	false	Deactivated	2	\N	\N	\N	\N
169	Mr	HemaKumar	Reddy	kumar	AUTPA2062R		Male	Unmarried	1992-05-29	2014-02-26	3	9886671511	hemakumar@kreatio.com	4bd5ed65712126c0eb9a441881673cda	sumitha@kreatio.com	12128	souvik@kreatio.com	2014-02-28 10:14:37.907985	2016-08-31 09:32:15.453374	4534683e	false	Deactivated	1		\N	\N	\N
173	Ms	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mounishas@kreatio.com	479f5dd617fa803368e1cee7e82443f7	\N	\N	\N	2014-03-26 06:34:23.891754	2015-02-23 07:23:43.02166	\N	false	Deactivated	1	\N	\N	\N	\N
145	Mr	Vinay	Gupta	Kumar	ASGPG8920		Male	Unmarried	1990-06-26	2013-10-30	3	8867165476	vinay@kreatio.com	202cb962ac59075b964b07152d234b70	gprabhu@kreatio.com	12114	vishnuprabhakar@kreatio.com	2013-10-30 11:20:17.321883	2015-07-22 06:23:25.770808	eac16d48	false	Deactivated	1	8867165476	\N	\N	\N
149	Mr	Sudeep	D				Male	Unmarried	1988-05-26	2013-10-10	3	9886376097	sudeep@webnish.com	98ca91e09e1c540a579bb3b5ea394daf	arif@webnish.com			2013-11-05 05:50:00.203971	2014-03-26 06:45:16.132202	\N	false	Deactivated	2	\N	\N	\N	\N
163	Mr	Presith	Prakash		BVZPP4664G	PY/BOM/60812/123	Male	Unmarried	1987-04-12	2014-01-27	1	9482086082	presithprakash@kreatio.com	73c3b0b7441fc14617eb4c14214fa73b	kkkg@kreatio.com	12127	rabindrak@kreatio.com	2014-01-27 06:22:38.353382	2017-07-25 09:27:05.027992	ca17046e	false	Active	1		100280954765	\N	432928040526
165	Mr	Rohit	KUMAR		BTQPK1134B		Male	Unmarried	1989-01-15	2014-01-20	3	8123078952	rohitkumar@webnish.com	69f31c3d4955467802c30dba8df1befe	srikanthvasuraj@webnish.com	12126	arif@webnish.com	2014-02-04 09:51:51.833275	2016-01-22 07:37:50.488784	6f0ebea4	false	Deactivated	2	9591125986	\N	\N	\N
139	Mrs	Sarala Devi					Female	Married	1987-10-11	\N	3	9902817022	sarala@kreatio.com	01d51bdf54a4bd28bba341b3fb7680d3	manjulak@kreatio.com			2013-10-08 10:06:00.709943	2014-11-05 10:16:52.566494	\N	false	Deactivated	1	\N	\N	\N	\N
143	Mr	Nitesh	Nayan		AIIPN5562C		Male	Unmarried	1985-09-26	2013-10-28	3	8880345568	nitesh@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	deepa@kreatio.com	12112		2013-10-28 10:52:39.962352	2016-11-15 12:41:31.380631	bd3560b4	false	Deactivated	1			\N	\N
159	Mr	Rajkumar			BJFPR5242A	PY/BOM/60812/119	Male	Unmarried	1988-09-18	2013-12-02	3	9036163860	rajkumarp@kreatio.com	474f94809b991279fb81d77a45ad1d89	deepa@kreatio.com	12123		2013-12-03 05:42:51.474828	2017-04-28 09:56:00.938365	0e9f7781	false	Deactivated	1			\N	\N
146	Ms	ravali	mulukalla				Female	Married	1991-08-31	2013-10-31	3	9164167897	ravali@kreatio.com	6eb0486a0783f18cd91e6c1d805d589d	rabindrak@kreatio.com		souvik@kreatio.com	2013-11-04 05:28:48.28838	2014-07-28 04:25:12.289822	\N	false	Deactivated	1	\N	\N	\N	\N
155	Mr	Manjunath Surpur	Surpur		BBAPM9955Q		Male	Unmarried	1987-07-20	2013-11-08	3	9916560596	manjunath@webnish.com	49d40c436ec88c54cfa57b275ab1295f	bharathi@webnish.com	 12117	bharathi@webnish.com	2013-11-15 07:14:27.654108	2016-02-17 07:01:30.138232	ccfd3bb5	false	Deactivated	2		\N	\N	\N
160	Mr	K.V.V.Seshagiri Rao			ATJPK8692A	PY/BOM/60812/120	Male	Married	1981-06-02	2013-12-16	3	9945455505	giri@webnish.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	souvik@kreatio.com	12124		2013-12-04 12:00:38.238999	2017-07-31 06:37:56.167485	d954744e	false	Active	1		100182502243	1981-06-02	551402675542
150	Mrs	\N	\N	\N	\N	\N	\N	\N	1973-11-21	\N	1	\N	dipti@webnish.com	ba0a7b33dd9e577aaafc57e9110b7c4e	\N	\N	\N	2013-11-06 05:20:04.063818	2017-06-14 07:30:49.668583	\N	false	Active	1	\N	\N	\N	\N
164	Mr	Abhishek					Male	Unmarried	1991-04-26	2014-02-03	3	8105607595	abhishek@webnish.com	c1511612f0ff50ea6a8db5837414c991	abhishek.webnish@gmail.com			2014-02-04 09:51:16.499967	2014-07-14 07:12:50.300977	\N	false	Deactivated	2	\N	\N	\N	\N
174	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	kpridhvikanth@kreatio.com	ac9e308c9cf18560013d0a69029a9c18	\N	\N	\N	2014-03-26 06:39:10.956111	2014-03-26 07:45:50.777686	\N	false	Deactivated	1	\N	\N	\N	\N
148	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	hr@webnish.com	f3f5e1c9d137ac102531b8cbab47b9ab	\N	\N	\N	2013-11-05 05:19:14.072107	2016-09-16 04:19:19.32552	7de77a61	false	Active	2	\N	\N	\N	\N
147	Ms	sumanjali	N		ATWPN5430G		Female	Unmarried	1992-08-27	2013-10-31	3	9964390198	sumanjali@kreatio.com	70e68dbb3f2fc2fdc87b8e19c6ea24ea	sumitha@kreatio.com	12115	souvik@kreatio.com	2013-11-04 05:31:32.874044	2015-03-04 04:27:28.781781	\N	false	Deactivated	1		\N	\N	\N
142	Mr	Abhishek	Kumar		CJBPK2644E		Male	Married	1990-09-17	2013-10-15	3	8050708104	abhishek@kreatio.com	f9d6fccb8176d5388964f887e3091813	aditya.agrawal@kreatio.com	12111	selvachezhian@kreatio.com	2013-10-21 08:36:17.462659	2017-07-25 07:48:56.735749	\N	false	Active	1			\N	204532616819
126	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mohanvs@kreatio.com	c95c7f0e377aec1b646bdb4dec0e41f9	\N	\N	\N	2013-06-26 10:12:58.41899	2014-03-26 06:45:44.792154	\N	false	Deactivated	1	\N	\N	\N	\N
176	Ms	mounisha	kannapureddy		BJRPR5504F		Female	Unmarried	1992-06-18	2014-03-26	3	8105508882	mounisha@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	swapnil@kreatio.com	12134	souvik@kreatio.com	2014-03-26 10:33:50.875137	2015-02-23 07:27:11.976011	\N	false	Active	1		\N	\N	\N
182	Mr	Krishna	Payazhi	Kumar	BEIPK1729R		Male	Married	1985-11-21	2014-05-05	3	7676754092	krishna@webnish.com	5545cbf6ef51d614c385b44eb6b39ad8	venu@webnish.com	12141	arif@webnish.com	2014-05-05 06:57:31.95708	2014-11-04 10:36:46.638251	\N	false	Deactivated	2	\N	\N	\N	\N
192	Mr	PANKAJ	KUMAR		CNPPK1873H		Male	Unmarried	1987-08-23	2014-07-01	3	7204906310	pankajkumar@kreatio.com	4534e1cf4a4eee03b433704ce2e3b99e	suhana@kreatio.com	12146	suhana@kreatio.com	2014-07-09 05:55:12.248763	2015-01-15 09:46:08.931181	2ab14667	true	Deactivated	1		\N	\N	\N
183	Mr	subbarao	katakam				Male	Unmarried	1986-06-01	2014-05-15	2	9663676251	subbarao@kreatio.com	b8dbaf31ce728e11d67fdebee0b19fcb	souvik@kreatio.com		souvik@kreatio.com	2014-05-16 05:59:51.830157	2014-08-07 09:31:13.017062	\N	false	Deactivated	1	\N	\N	\N	\N
200	Mr	Abhishek	kumar		BFTPK0453E		Male	Unmarried	1981-08-08	2014-06-18	3	9620204514	abhishekp@kreatio.com	dd39b4d05a2e19bb9443c3cd23d3aff1	ajay@kreatio.com	12142		2014-08-08 04:52:24.244253	2015-01-19 07:55:55.10908	\N	false	Deactivated	1	9620204514	\N	\N	\N
204	Mr	Venu	H	Somaiah	CJQPS3231Q		Male	Unmarried	1985-10-05	2014-04-10	2	9964051805	venu2@kreatio.com	399c1673c32d55a84e09c534f7cee188	souvik@kreatio.com	12138	souvik@kreatio.com	2014-09-04 08:42:00.887111	2014-09-04 09:54:05.323999	\N	false	Deactivated	1	9739103364	\N	\N	\N
191	Mr	Akshay	Gondhali	Ramakant	BOCPG9370Q 		Male	Unmarried	1992-09-29	2014-07-01	3	08904670016	akshay@kreatio.com	2de1b2d6a6738df78c5f9733853bd170	gprabhu@kreatio.com	12145		2014-07-09 05:46:02.999242	2015-10-30 09:01:37.562418	\N	false	Deactivated	1		\N	\N	\N
180	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mithun@webnish.com 	475988e4653b5303df3903526599a176	\N	\N	\N	2014-04-24 05:54:39.195545	2014-04-24 06:05:30.721497	\N	false	Deactivated	2	\N	\N	\N	\N
201	Ms	MAHADEVI	KOLAKAR		CAPPK4267G		Female	Unmarried	1989-07-10	2014-08-11	3	8884369938	mahadevi@webnish.com	3d80f62043e5f1d0e9696b18572a6482	souvik@webnish.com	12155	bharathi@webnish.com	2014-08-11 06:54:34.202947	2016-03-23 09:44:35.630923	\N	false	Deactivated	2			\N	\N
190	Mr	Brajesh	Patidar		CDGPP7148P		Male	Unmarried	1991-12-28	2014-07-01	3	08904670042	brajesh@kreatio.com	8fff19c623838375f529557b325c5ce4	giri@kreatio.com	12144	hr@kreatio.com	2014-07-09 05:38:58.839756	2014-09-26 04:20:34.162928	\N	false	Deactivated	1		\N	\N	\N
196	Mr	VINOTHKUMAR			AVOPV6224C		Male	Unmarried	1990-05-28	2014-07-29	3	9738397428	vinoth@kreatio.com	1488b292d29d253136a5ab16586c896e	sumitha@kreatio.com	12152 		2014-07-29 08:56:31.476045	2016-05-27 14:59:00.964055	\N	false	Active	1			\N	\N
184	Mr	Abhishek kumar					Male	Unmarried	1981-08-08	2014-06-18	3	9620204514	abhishekkumarp@kreatio.com	dd39b4d05a2e19bb9443c3cd23d3aff1	-		-	2014-06-30 06:31:34.661385	2014-08-08 04:52:10.307815	\N	false	Deactivated	1	\N	\N	\N	\N
175	Mr	PRIDHVI KANTH	KAVERIPAKAM		CCFPK9304L		Male	Unmarried	1991-09-22	2014-03-27	3	9908750875	pridhvi@kreatio.com	3529da717c5690edb5fbac21eb98afe0	antony@kreatio.com		souvik@kreatio.com	2014-03-26 07:45:17.264456	2014-08-19 12:17:30.055058	\N	false	Deactivated	1	\N	\N	\N	\N
187	Mr	KAMAL	KISHOR		CCKPK9409H		Male	Unmarried	1991-06-10	2014-07-01	3	8867151741	kamal@webnish.com	4d4f5d65180fdbcd4c29e93ee5de73f6	arunkumar@webnish.com	12150	bharathi@webnish.com	2014-07-02 10:19:24.931362	2016-11-03 07:55:03.1282	eb6e954a	true	Active	2		\N	\N	\N
181	Mr	Mithun	J B		BBHPM1822R		Male	Unmarried	1986-10-01	2014-04-17	3	9591124621	mithun@webnish.com	edf478aeff9166d778860bc2693c889e	arif@webnish.com	12139		2014-04-24 06:06:18.575757	2014-08-22 06:00:25.279887	\N	false	Deactivated	2	\N	\N	\N	\N
199	Mr	Sharath	Ramesh				Male	Unmarried	1992-11-02	2014-08-06	3	9035009933	sharathramesh@kreatio.com	6d13ed22fda142adba49bc2ed78d70dd	antony@kreatio.com			2014-08-08 04:41:19.752317	2014-09-09 05:13:56.992893	\N	false	Deactivated	1		\N	\N	\N
170	Mr	Solipuram Sujit	Reddy	Pranav	ENLPS6578B	100011563107	Male	Unmarried	1991-02-06	2014-03-03	3	08792616479	sujitpranav@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	deepa@kreatio.com	12129	souvik@kreatio.com	2014-03-04 11:21:07.679302	2015-06-12 05:10:02.497953	e33ec820	false	Deactivated	1		\N	\N	\N
202	Mr	Mathiyalagan	A		BMKPA9773M		Male	Unmarried	1990-05-15	2014-08-25	3	+918147492634	mathiyalagan@kreatio.com	529006e3094a9449bc80506e34e824d6	sumitha@kreatio.com		souvik@kreatio.com	2014-08-25 07:51:51.633355	2015-01-06 11:37:09.746383	\N	false	Deactivated	1		\N	\N	\N
193	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	krishnap@kreatio.com	fe4d75685ddd5b5a63cd4c615eccc9fe	\N	\N	\N	2014-07-09 06:01:37.920017	2014-08-11 08:06:06.565114	\N	false	Deactivated	1	\N	\N	\N	\N
197	Mr	Sujit	Padhi	Kumar	CNFPP8710G	PY/BOM/60812/150	Male	Unmarried	1991-04-27	2014-08-04	3	8553186648	sujitkumar@kreatio.com	bf419c8405d0bedea6eec7ac2d7d2f32	rabindrak@kreatio.com	12153	rabindrak@kreatio.com	2014-08-04 09:00:08.817532	2016-07-22 10:29:42.416846	\N	false	Deactivated	1		\N	\N	\N
194	Mrs	Suhana	A		ALQPA5269A		Female	Married	1982-04-15	2014-07-01	1	9342414148	suhana@kreatio.com	a356446b79ecda0ad10c339db195262e	senthilkumar@kreatio.com	12147		2014-07-10 08:56:57.803745	2015-09-02 10:11:44.297794	53e71f8f	false	Deactivated	1		\N	\N	\N
189	Mr	KSHITIZ 	RASTOGI		BFDPR5952P		Male	Unmarried	1992-12-28	2014-07-01	3	9791761280	kshitiz@kreatio.com	5fec3b66c0cc9c87049fb55901399426	suhana@kreatio.com	12143	suhana@kreatio.com	2014-07-09 05:22:09.147835	2015-02-03 11:07:51.894444	\N	false	Deactivated	1		\N	\N	\N
203	Mr	P.N.Ravindra			BSYPR4104F	PY/BOM/60812/153	Male	Unmarried	1992-07-04	2014-08-25	3	9964435807	pnravindra@kreatio.com	d1370c35041c3b760c264a751ee92b55	rabindrak@kreatio.com	12156	rabindrak@kreatio.com	2014-08-25 07:52:30.500058	2015-08-19 12:53:45.106372	7e8b11f9	true	Deactivated	1		\N	\N	\N
206	Mr	Jagannatha	K A		AVQPA3995F		Male	Unmarried	1991-05-25	2014-09-24	3	9008021475	jagannatha@webnish.com	b55bd5e64bb6ec9a06c0c1dc19f9386a	arif@webnish.com		arif@webnish.com	2014-09-25 06:18:13.067968	2014-12-16 06:24:52.329341	\N	false	Deactivated	2		\N	\N	\N
188	Mr	VIPUL	GUPTA		BOBPG6254C		Male	Unmarried	1991-03-13	2014-07-01	3	8904670150	vipul@webnish.com	6c62425e5dcd9db48bca4753991d19e5	arunkumar@kreatio.com	12151	 venu@webnish.com	2014-07-02 10:32:31.115065	2016-02-24 10:37:33.606481	0bb57857	false	Deactivated	2		\N	\N	\N
107	Mr	Antony	Prakash	Aloy			Male	Married	1983-06-30	2007-04-02	3	09916711621	antony@kreatio.com	9c4b6521a34c86938cfbe2cfb87e451d	souvik@kreatio.com	12024		2013-03-28 04:50:25.039599	2014-09-02 03:43:45.357083	da687c34	false	Deactivated	1		\N	\N	\N
178	Mr	Venu	H	Somaiah	CJQPS3231Q		Male	Unmarried	1985-10-05	2014-04-10	3	9964051805	venu@kreatio.com	399c1673c32d55a84e09c534f7cee188	kkkg@kreatio.com	12138		2014-04-10 11:25:56.224038	2016-07-26 04:30:17.129962	d8fcb516	false	Active	1	9739103364		\N	\N
195	Mr	BHUBNESHWAR	PASWAN		CODPP3691F	PY/BOM/60812/145	Male	Unmarried	1990-10-05	2014-07-04	3	8867151250	bhubneshwar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	senthilkumar@kreatio.com	12148	souvik@kreatio.com	2014-07-14 06:21:21.693467	2014-09-26 04:20:34.122316	\N	false	Deactivated	1		\N	\N	\N
185	Mr	prashant	P	V	AOZPP4628Q		Male	Married	1967-05-12	2014-07-01	3	 9972706742  	prashant@webnish.com	25d55ad283aa400af464c76d713c07ad	sarunlobo@webnish.com	12149		2014-07-01 07:30:51.227564	2017-04-25 09:03:36.616591	26b661b0	true	Active	2	arif@webnish.com	\N	\N	\N
205	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	jagannatha	3535762ca8095d23e1b985353d16b1ac	\N	\N	\N	2014-09-25 06:17:00.043881	2014-10-09 05:30:06.722344	\N	false	Deactivated	2	\N	\N	\N	\N
179	Mr	Subrat	Sahoo	Kumar	CVHPS2822J	PY/BOM/60812/134	Male	Married	1988-04-03	2014-04-10	3	7829844840	subrat@webnish.com	87ca7962c197ed7c9289b87add396c6f	srikanthvasuraj@webnish.com	12137	arif@webnish.com	2014-04-10 11:26:48.172149	2015-04-13 08:36:59.823921	7e6086da	false	Deactivated	2	9632203654	\N	\N	\N
198	Mr	Vinoth Kumar s			AUSPV0500C	PY/BOM/60812/151	Male	Unmarried	1986-04-01	2014-08-05	3	9916539324	vinoths@kreatio.com	89bf93fbba5bdf134d1056a2b56edbe3	sumitha@kreatio.com	12154		2014-08-05 06:56:09.856154	2017-05-04 16:54:09.913966	\N	false	Active	1			\N	
221	Mr	Jeevan	Gathoo	Prakash	AFGPG6596J		Male	Married	1960-10-26	2012-02-13	3	+919867186457	jeevanp@kreatio.com	408ccd2b8709be0335aa70a73bd053b3	kkkg@kreatio.com	12051	\N	2015-02-02 07:50:58.549871	2017-06-30 11:30:25.531787	136d094a	false	Deactivated	1	+912512354121		\N	\N
230	Mrs	Apoorva	SG		BDGPA0662J		Female	Married	1990-10-08	2015-03-09	3	8970402384	Apoorvasg@kreatio.com	014fab80e3a27fd17b4eaec8b1a9fcd0	kkkg@kreatio.com	12180	\N	2015-03-13 04:51:17.930669	2017-07-05 11:08:33.170095	09559041	false	Active	1	8970402384		\N	220051990915
212	Mr	SALINAN	GAJENDRAN		AZGPG0400R	PY/BOM/60812/162	Male	Married	1985-07-11	2014-11-27	3	9942272288	gsalinan@webnish.com	850e73266a7ea04bac6a01c29064de02	srikanthvasuraj@webnish.com	12165	bharathi@webnish.com	2014-12-01 06:55:40.864561	2016-03-07 07:49:11.160429	f0b4cc01	false	Deactivated	2		\N	\N	\N
207	Mr	Manda	Kumar	Praveen	CEZPM4224H		Male	Unmarried	1988-04-14	2014-10-06	3	8880644445	praveenkumar@webnish.com	87ca7962c197ed7c9289b87add396c6f	hr@webnish.com		arif@webnish.com	2014-10-06 09:34:58.854106	2014-11-17 09:50:13.49237	de3da30f	false	Deactivated	2		\N	\N	\N
208	Mr	Mutra	Reddy	Masthan	CEXPM3542Q		Male	Unmarried	1990-04-28	2014-10-08	3	9620460667	masthanm@webnish.com	498b4ddc9f957eca6473923163dd117f	rahulmr@webnish.com, 		Arif Imam <arif@webnish.com>	2014-10-07 08:41:36.925035	2014-11-26 10:43:07.28492	\N	false	Deactivated	2		\N	\N	\N
217	Mr	Basavana Gowda 	G	K	BNYPB2115H	PY/BOM/60812/166	Male	Unmarried	1987-12-03	2015-01-05	3	9620204513	basavana@webnish.com	87ca7962c197ed7c9289b87add396c6f	swathidasari@webnish.com	12169	\N	2015-01-09 10:30:22.552131	2016-12-02 12:05:39.237345	\N	false	Deactivated	2			\N	\N
228	Mrs	Vemula	Kumar	Santhosh	AGDPV6480E		Male	Married	1980-01-04	2015-03-02	3	9885584769	santhosh@webnish.com	ac6fc401a848ca87e9b51a78d4ae2a9c	sarunlobo@webnish.com		\N	2015-03-04 05:10:39.845252	2017-06-02 09:09:37.055762	7c6ab145	false	Deactivated	2		\N	\N	\N
231	Mr	Dharmendra kumar	Butani		BLNPD7185A		Male	Unmarried	1986-04-28	2015-03-12	3	9916968832	dharmendrak@webnish.com	d9b46cfbbaf7aa700e46d58f76de6c04	srikanthvasuraj@webnish.com	12182	\N	2015-03-13 04:52:04.703868	2015-12-31 08:47:07.715961	\N	false	Deactivated	2		\N	\N	\N
210	Mr	ravishankar	kumar		BRCPK8857M		Male	Unmarried	1991-02-05	2014-11-17	3	8892871216	ravishankar@kreatio.com	931cb4e14b1cb29c47207334f1b19359	souvik@kreatio.com	12162	 senthilkumar@kreatio.com 	2014-11-17 10:45:00.50288	2017-01-27 10:18:06.613011	\N	false	Deactivated	1	9686448189		\N	\N
224	Mr	mohammed	khaleel		cdbpk5279h		Male	Unmarried	1990-08-18	2015-02-10	3	9945752131	khaleel@webnish.com	1b1159564e0e00ba8f2f733ad8d19a70	SRIKANTHVASURAJ@WEBNISH.COM		\N	2015-02-17 06:05:08.704789	2016-01-19 06:03:47.562232	\N	false	Deactivated	2	08041227462/3/4	\N	\N	\N
214	Mr	Srikanth	Vasuraj		ABPV7976R		Male	Married	1955-11-11	2014-12-01	1	9591124316	srikanthvasuraj@webnish.com	b9b4b4d9d835a581b683ee5d30b4aa0f	dipti@webnish.com	12166	dipti@webnish.com	2014-12-02 05:57:38.816608	2016-05-02 07:27:16.862277	d8b6e12f	true	Deactivated	2		\N	\N	\N
209	Ms	T Deepa			BRKPD2281A		Female	Unmarried	1989-12-06	2014-11-10	3	8050091771	deepat@webnish.com	c7114c09b73ba5a22fb0db200d20498c	swathidasari@webnish.com	12161	bharathi@webnish.com	2014-11-10 11:16:49.536363	2017-03-09 12:32:53.0837	\N	false	Deactivated	2			\N	
213	Mr	shaik	taj	hamid	DIOP1203L		Male	Unmarried	1989-08-13	2014-11-26	3	8099010583	hamidtaj@webnish.com	6ac575879ee303eccb176c1de1237acd	srikanthvasuraj@webnish.com	12164	arif@webnish.com	2014-12-01 06:56:06.946701	2015-09-15 11:38:21.377966	7795604b	false	Deactivated	2		\N	\N	\N
54	Ms	Shabrin	Syed		DPOPS3908P	PY/BOM/60812/057	Female	Unmarried	1989-02-16	2012-06-21	3	9035909516	shabrin@kreatio.com	7d38165975ddfafe599569b48e2b27fc	arunkumar@kreatio.com	12057	arif@webnish.com	2012-09-18 10:34:14.137382	2016-08-17 08:39:59.798476	57e21593	true	Deactivated	1		\N	\N	\N
87	Mr	Merlin	C	JeyaKumar	CEOPM3687K	PY/BOM/60812/056	Male	Unmarried	1989-03-15	2012-06-20	3	9686560798	merlinjeya@kreatio.com	5d000b30d9066030e69fa98c9505e7e6	gprabhu@kreatio.com	12056	senthilkumar@kreatio.com	2012-10-08 09:19:55.194012	2015-07-31 08:08:09.972529	\N	false	Deactivated	1	9972703082	\N	\N	\N
99	Mr	Manvendra	Tripathi		AUQPT2974C		Male	Unmarried	1991-01-19	2012-12-29	3	8867766027	manvendra@kreatio.com	c2272a21bcda593b30f085b337d97ea6	souvik@kreatio.com	12073	souvik@kreatio.com	2012-12-04 09:05:21.918952	2015-12-04 07:37:49.52983	\N	false	Deactivated	1	09686448189	\N	\N	\N
226	Ms	Sanober	Sultana				Female	Unmarried	1990-03-25	2015-02-16	3	9739103564	sultana@webnish.com	87ca7962c197ed7c9289b87add396c6f	arif@webnish.com	12177	\N	2015-02-17 06:44:50.99127	2016-05-20 09:42:52.740103	\N	false	Deactivated	2		\N	\N	\N
216	Mr	Dibyajyoti	Nath		AWFPN8411K		Male	Unmarried	1991-06-27	2015-01-05	3	08754500831	dibyajyoti@kreatio.com	a029f664fee3837ad1740e102e2ff5de	gprabhu@kreatio.com	12168	\N	2015-01-05 06:57:43.472042	2015-10-29 04:16:57.472055	\N	false	Deactivated	1		\N	\N	\N
227	Mr	Pavan	Nedium	Kumar	AMBPN0553A	PY/BOM/60812/175	Male	Unmarried	1992-02-12	2015-02-16	3	+919739892527	nediumpavan@kreatio.com	e9876b7e4e0cc1264609e680c974b152	sumitha@kreatio.com	12178	\N	2015-02-19 04:21:28.387508	2017-07-04 09:10:36.129437	\N	false	Active	1		100524941691	1991-02-02	4070-7833-7383
215	Mr	Sathish	Kumar		FCHPS8884Q	PY/BOM/60812/164	Male	Unmarried	1991-10-21	2014-12-17	3	9886524011	sathishp@kreatio.com	aa2e58f670c5b86ebbde9f25f9e5224e	aditya.agrawal@kreatio.com	12167	hr@kreatio.com	2014-12-17 10:53:41.912446	2017-07-19 10:22:20.925862	\N	false	Active	1		100524497986	1991-10-21	639842572487
218	Mr	Chokkappan	Srinivasan		CSFPS 1611 C		Male	Unmarried	1984-07-18	2015-01-19	3	9916213114	chokkappan@kreatio.com	c55635375fe47236f3748a84dbbc0ecf	priyali@kreatio.com	12170	\N	2015-01-19 09:12:43.556416	2016-08-24 11:01:01.91438	\N	false	Deactivated	1			\N	\N
222	Mr	Manjunatha	C				Male	Unmarried	1990-10-14	2015-02-02	3	9738214523	cmanjunath@webnish.com	059d21546cde5f208b96a9d8ec5f4596	srikanthvasuraj@webnish.com	12173	\N	2015-02-02 10:46:12.153897	2015-12-22 10:13:10.001392	97fe052f	false	Deactivated	2		\N	\N	\N
232	Mr	Manoj	Patil	Madhu			Male	Unmarried	1986-05-22	2015-03-12	3	8904590053	manojpatil@webnish.com	8a0643acaf07e4d36e117eed1a629ae7	srikanthvasuraj@webnish.com		\N	2015-03-23 04:23:27.933042	2015-09-15 11:38:21.423904	\N	false	Deactivated	2		\N	\N	\N
211	Mr	Piyush	Raj		ANVPR5036M	PY/BOM/60812/160	Male	Unmarried	1990-02-23	2014-11-17	3	07411839544	piyushraj@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	apoorvasg@kreatio.com	12163		2014-11-17 10:45:14.309252	2017-07-18 10:19:51.755842	0d2fd28c	false	Active	1			\N	\N
219	Mr	samykkannu	azhagu		GEKPS5277D		Male	Unmarried	1991-06-25	2015-01-19	3	9538751710	samykkannu@kreatio.com	b89c360e8f352747cb3afc3c7d7f8b54	sumitha@kreatio.com	12171	\N	2015-01-19 11:04:46.137906	2016-07-05 08:01:21.170659	cbdefd61	false	Active	1	9538751710	\N	\N	\N
220	Mr	Siddhartha	Mani		BQBPM5337A	PY/BOM/60812/169	Male	Unmarried	1991-11-03	2015-01-22	3	9448228857	siddhartha@kreatio.com	5a8451078fb98e820e965d3be71487bd	swapnil@kreatio.com	12172	\N	2015-01-22 06:56:42.294075	2017-03-16 09:55:51.438795	\N	false	Deactivated	1			\N	\N
225	Mr	SATHISH	B				Male	Unmarried	1990-03-26	2015-02-09	3	8553316544	sathish@webnish.com	50e62ffa25b1ce3fd735cfdfec5cb805	sathish@webnish.com		\N	2015-02-17 06:06:15.607933	2015-04-13 08:36:26.448195	\N	false	Deactivated	2		\N	\N	\N
223	Mr	venkata	krishna.T	manoj			Male	Unmarried	1989-04-17	2015-02-11	3	8553063441	manojkrishna@kreatio.com	7957446b21e45c21eb022459fc3657fd	priyali@kreatio.com	12176	\N	2015-02-12 05:21:39.055694	2015-05-11 10:42:33.651194	\N	false	Deactivated	1		\N	\N	\N
144	Mr	Anjaneyulu	Egavinti	Reddy	ABJPE2216J		Male	Unmarried	1992-05-11	2013-10-29	3	8892576065	anjaneyulu@kreatio.com	2e7888a48eb0fa1e219258d08ad8a511	sumitha@kreatio.com	12113		2013-10-30 07:49:19.432647	2015-10-01 10:30:02.9998	eac5f15b	false	Deactivated	1		\N	\N	\N
252	Mr	Dinesh Babu					Male	Unmarried	1990-02-17	2015-07-09	3	9597118777	dinesh@webnish.com	d43e7c966e0fe1ee8eb307fb79b66d03	srikanthvasuraj@webnish.com		\N	2015-07-14 05:28:05.385867	2016-02-11 10:52:21.177889	16b557ce	false	Deactivated	2		\N	\N	\N
243	Ms	Keerthana	C				Female	Unmarried	1993-07-06	2015-06-08	3	8012323961	keerthana@kreatio.com	97bc57fdec6e19a7ffa7ad6fff495931	sumitha@kreatio.com	12196	\N	2015-06-17 10:18:50.308746	2015-10-29 04:16:57.503348	\N	false	Deactivated	1		\N	\N	\N
241	Mr	Melhi 	Daniel	Joshua	BDRPM1655C		Male	Unmarried	1985-12-12	2015-06-01	3	8144653446	joshuadaniel@webnish.com	804579265571c83a15a9408e41b158a5	srikanthvasuraj@webnish.com		\N	2015-06-09 09:46:15.059148	2015-12-31 08:47:07.754529	\N	false	Deactivated	2	8041227462	\N	\N	\N
256	Mr	Vishwanath	Devni		BIRPD3561P	MH/BAN/211273/110575	Male	Married	1989-08-23	2015-08-03	3	8880699909	vishwanath@webnish.com	a43538291b06979cdf6ff3f5ddcc0161	srikanthvasuraj@webnish.com		\N	2015-08-05 09:39:01.766717	2015-12-31 08:47:07.791264	\N	false	Deactivated	2		\N	\N	\N
235	Ms	Apoorva	R				Female	Unmarried	1993-10-23	2015-04-01	3	8867906038	 rapoorva@webnish.com 	d6e63f86a29589f549a7041735a35fbd	arunprasath@webnish.com	12185	\N	2015-04-13 08:34:38.090927	2016-04-29 07:37:41.766371	\N	false	Deactivated	2		\N	\N	\N
239	Mr	Kannan	M		CGVPK5775M		Male	Unmarried	1992-06-28	2015-05-26	3	9042939879	mkannan@webnish.com	193364fc2eba60687ab9394b2293b79c	srikanthvasuraj@webnish.com		\N	2015-06-01 10:40:11.419867	2015-09-15 11:38:21.438161	\N	false	Deactivated	2		\N	\N	\N
237	Mrs	Rachna	Kumari		DYFPK7911A		Female	Married	1991-06-08	2015-04-23	3	9632622366	rachna@kreatio.com	280dd443f81c028f4472d48462953bf1	swapnil@kreatio.com	12188	\N	2015-04-23 06:57:52.687174	2017-03-30 10:33:02.575674	5aac332d	false	Active	1			1991-06-08	772781711866
436	Ms	JAYANTI 	GORAI		BWVPG6236J		Female	Unmarried	1993-05-23	2017-07-13	3	8147003400	jayanti.gorai@kreatio.com	0369b263ae2ecfac26460c01bb83a5f1	sumitha@kreatio.com	12375	\N	2017-07-19 10:35:11.24652	2017-08-10 04:35:12.838668	6daa7f3f	false	Active	1			1993-05-23	727986787848
262	Mr	Kannan	Jeyabal		BSMPK0779F		Male	Unmarried	1988-01-29	\N	3	8124354281	jkannan@webnish.com	63c1d68f3f7bc75a151715e3bdfae479	sriksrikanthvasuraj@webnish.com		\N	2015-08-24 05:07:19.610739	2016-04-06 05:33:27.313042	\N	false	Deactivated	2		\N	\N	\N
246	Mr	Jegan 	R		BBQPJ8840P	PY/BOM/60812/190	Male	Unmarried	1994-05-04	2015-06-08	3	+919789435354	jeganr@kreatio.com	6d94c3713410a3da78fea39b3b13311f	sumitha@kreatio.com	12193	\N	2015-06-17 10:21:32.688593	2017-08-08 12:58:02.215202	5e78ae94	false	Active	1	9066522418		\N	607656272732
236	Mr	danthukallu	srinivas		AUHPD1314M		Male	Married	1988-04-05	2015-04-01	3	8977255510	srinivas@webnish.com	64c61dda744b311b51c064ea7760a968	 srikanthvasuraj@webnish.com		\N	2015-04-20 06:44:13.752257	2016-01-11 09:38:48.239758	6f604a29	false	Deactivated	2		\N	\N	\N
248	Mr	Lokeshwaran			AMPPL6305E		Male	Unmarried	1993-11-27	2015-06-08	3	+918903008023	lokeshwaran@kreatio.com	32f5c35fb999831d7c167000535c9e69	deepa@kreatio.com	12191	\N	2015-06-17 10:22:13.774193	2017-04-24 11:30:37.353555	\N	false	Deactivated	1			\N	\N
244	Ms	vijayalakshmi	m		AMOPV6428K		Female	Unmarried	1991-12-19	2015-06-08	3	9715103684	vijayalakshmi@kreatio.com	3075ea112eb6202388c3373ce0f7830d	giri@kreatio.com		\N	2015-06-17 10:20:46.132442	2015-07-09 06:55:43.392659	ee36df83	false	Deactivated	1	8098298125	\N	\N	\N
240	Mr	Jayasheelan	G		AXJPJ0540Q		Male	Unmarried	1985-07-05	2015-06-01	3	9886706711	jayasheelan@kreatio.com	b89c360e8f352747cb3afc3c7d7f8b54	priyali@kreatio.com		\N	2015-06-02 05:43:42.32319	2015-07-09 06:55:43.417292	\N	false	Deactivated	1		\N	\N	\N
250	Mr	VISHAL	DHARSUN V M		BAEPV9182R	PY/BOM/60812/195	Male	Unmarried	1993-12-23	2015-06-08	3	8940676325	vishal@webnish.com	160968b7d9a143eb0d87dcda530b8fe8	manish@webnish.com	12198	\N	2015-06-23 04:43:36.014112	2017-02-28 10:20:58.525293	\N	false	Active	2	9443031293		\N	
233	Mr	Harshavardhan D			ADZPH5640P		Male	Unmarried	1989-02-02	2015-04-06	3	9740928656	harshavardhan@webnish.com	ab41566ec49f3a16762f296fa5f37928	souvik@webnish.com	12186	\N	2015-04-09 11:06:10.158155	2016-08-25 10:46:27.120279	e0e336f9	false	Deactivated	2			\N	\N
258	Mr	Mohana	ruban				Male	Married	1990-07-11	2015-08-03	3	9790230579	mohanaruban@webnish.com	1f4216733a85b8d118beca818a6f5fb8	bharathi@webnish.com		\N	2015-08-05 09:41:06.253003	2016-02-25 06:21:47.675896	\N	false	Deactivated	2		\N	\N	\N
265	Mr	ARUN	KUMAR		CRXPK6386F		Male	Unmarried	1990-10-24	2015-08-24	3	9620338806	kumararun@kreatio.com	eb8f7f332c4b1b925ae76d27af089e2f	vishnuprabhakar@kreatio.com	1221	\N	2015-08-26 10:34:50.631992	2016-03-15 04:26:04.262907	62a5433e	false	Deactivated	1		\N	\N	\N
254	Mr	Nikhil TP			AIWPN7987P		Male	Unmarried	1989-02-07	2015-07-14	3	9447724791	nikhil@webnish.com	7d400ae45a92f9aaff8fa463cc5e6a92	sriksrikanthvasuraj@webnish.com		\N	2015-07-28 05:08:44.614833	2015-10-06 11:31:47.249467	\N	false	Deactivated	2	9447724791	\N	\N	\N
229	Mr	B Sathish	Kumar		FQXPS8834Q	PY/BOM/60812/180	Male	Unmarried	1992-02-16	2015-03-05	3	+919959092329	bsathish@kreatio.com	000a2cac95b42a49652d66b2f1b14ebc	sumitha@kreatio.com	12183	\N	2015-03-05 08:03:58.479398	2017-07-25 13:09:45.619613	\N	false	Active	1	9959092329	100525047970	\N	903163192655
253	Mrs	Shilpa	T R		BDYPR8671Q	PY/BOM/60812/202	Female	Married	1987-02-09	2015-07-27	3	9900621062	trshilpa@kreatio.com	9b4d96642440765fef488d7f37340acd	presithprakash@kreatio.com	12205	\N	2015-07-27 07:36:57.675015	2017-07-25 04:40:01.135807	\N	false	Active	1		100855328934	\N	359413241838
261	Mr	vyshakh	krishnan		ALTPV3391H		Male	Unmarried	1991-10-30	2015-08-12	3	9526129276	vyshakh@webnish.com	2a92a3c8be396fcd737a7caeab2a8f9d	sreekanthvasuraj@webnish.com		\N	2015-08-18 10:02:58.83652	2015-10-27 09:13:30.696357	\N	false	Deactivated	2		\N	\N	\N
260	Mrs	Husna	Ara		AQKPA7608L	PY/BOM/60812/207	Female	Married	1988-08-20	2015-08-10	3	9742253490	husnaara@webnish.com	85d0fd8fc1d3c8a0be8875aff8b794e7	souvik@kreatio.com	12210	\N	2015-08-12 05:52:47.916468	2016-10-24 09:41:48.500781	\N	false	Deactivated	2	7676302040		\N	\N
257	Mr	Roshan	Naik	Devadatta	AJSPN5965G		Male	Unmarried	1991-12-02	2015-07-22	3	8884184141	roshannaik@webnish.com	8cf0698c5856d817b1645604c62d4bbb	roshannaik@webnish.com		\N	2015-08-05 09:40:22.203834	2016-06-17 10:17:50.457863	\N	false	Deactivated	2		\N	\N	\N
264	Mr	Muralidaran	R		CTVPM5657F		Male	Unmarried	1990-04-11	2015-08-10	3	9043469486	muralidaran@webnish.com	ff685c0d9bb585637f99dd7ca940f612	muralidaran725@gmail.com		\N	2015-08-24 10:44:56.440196	2016-03-15 10:32:31.972677	\N	false	Deactivated	2	9003888722	\N	\N	\N
238	Mr	prasanna					Male	Unmarried	1984-01-25	2015-04-15	3	8884332018	prasanna@webnish.com	f0204cb98ee36579dae4fef0933c8ce2	prasanna@webnish.com	12187	\N	2015-04-24 11:19:40.619757	2016-01-14 11:12:27.359174	\N	false	Deactivated	2	08041227463	\N	\N	\N
259	Mr	Naresh	Gunayathi		AEQPN1788Q		Male	Unmarried	1982-04-06	2015-08-03	3	9945308666	naresh@webnish.com	7bb1be8a78498a9de40098a593199819	srikanthvasuraj@webnish.com		\N	2015-08-06 05:24:35.246214	2016-04-06 04:38:36.971379	\N	false	Deactivated	2		\N	\N	\N
247	Mr	Loganathan	G		AJTPL3409L	PY/BOM/60812/189	Male	Unmarried	1993-06-11	2015-06-08	3	9629493467	loganathan@kreatio.com	f61ac1674162bece5b5934c337b7b79f	sumitha@kreatio.com	12192	\N	2015-06-17 10:21:58.900553	2016-10-12 04:57:58.272542	\N	false	Active	1			\N	\N
330	Ms	NANCY	THOMAS	K			Female	Unmarried	1994-09-24	2016-08-01	3	8147977281	nancyk@kreatio.com	2fa32e00d562122721874b38ca845809	souvik@kreatio.com	 12271	\N	2016-08-09 04:51:50.787972	2017-01-05 12:29:31.814979	\N	false	Active	1			1994-09-24	
266	Mr	Sujith	Seenivasan	Raj	EFQPS4609J		Male	Unmarried	1988-07-28	\N	3	9500570207	sujithraj@webnish.com	1ee6d4a39480ee46881b80b39350facf	sarunlobo@webnish.com	12213	\N	2015-08-27 06:17:21.650498	2017-08-04 10:21:45.095389	81d5eca8	false	Active	2			\N	479240012798
279	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	adarshvl@webnish.com	f7c80dd7c328088ab2bda5d35d01f7a5	\N	\N	\N	2015-11-23 07:25:58.482769	2016-02-11 10:15:42.584872	\N	false	Deactivated	2	\N	\N	\N	\N
272	Mr	SHYAM	SUNDAR		CZHPK0661H		Male	Married	1982-06-06	\N	3	9951242895	koshikas@webnish.com	a6de5743a9be6280ac7943a95c5eb332	vasudeva@webnish.com		\N	2015-11-02 09:30:38.331261	2015-12-31 08:47:07.833927	\N	false	Deactivated	2		\N	\N	\N
271	Mr	VASUDEVA	DODDAMANI	KHIMENDRA	BLNPD5521J		Male	Unmarried	1990-04-24	2015-10-14	3	8088840480	vasudeva@webnish.com	227084baf2534f7a4c94737940e3bbfc	vasudoddamani94@gmail.com		\N	2015-11-02 09:29:59.712937	2016-02-11 10:15:42.621127	\N	false	Deactivated	2		\N	\N	\N
292	Ms	Anupama	K B		BUMPA4821J		Female	Unmarried	1994-04-12	2016-02-18	3	7795590417	anupama@kreatio.com	84d6dd9bbf1b9ad5f6c4fcaa8f6f39bd	sumitha@kreatio.com	12224	\N	2016-02-18 12:32:30.470776	2017-06-06 10:25:40.227375	\N	false	Active	1			\N	
255	Mr	Sudheer	Chinnam	kumar	BDOPC8112P		Male	Unmarried	1991-01-20	0015-07-15	3	7207092252	sudheer@webnish.com	d980d660b929617480ed96fd19f128ee	srikanthvasuraj@webnish.com		\N	2015-07-28 05:09:16.921425	2015-11-23 07:15:30.555259	\N	false	Deactivated	2	080-41227462	\N	\N	\N
267	\N	test	\N	\N	\N	\N	male	\N	1988-07-28	\N	3	9903820246	test@test.com	77975e33d2088571de01e8f32d7b7a3a	dibyajyoti@kreatio.com	\N	\N	2015-09-04 12:25:57.85212	2015-09-15 07:44:14.517756	\N	false	Deactivated	\N	\N	\N	\N	\N
268	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mahmood@webnish.com	44ab1370eb802e0fd277ebf9be94547b	\N	\N	\N	2015-09-24 08:57:57.243014	2016-01-11 09:37:53.657533	\N	false	Deactivated	2	\N	\N	\N	\N
283	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	sumithc@webnish.com	58587dd220646c4e4425f1fa7ee69e63	\N	\N	\N	2016-01-21 10:47:44.799474	2016-02-11 10:15:42.64336	\N	false	Deactivated	2	\N	\N	\N	\N
299	Mr	Amit	Kumar		AQTPK2772N		Male	Married	1981-07-08	2016-03-14	3	9620842920	kumaramit@webnish.com	aa908b1302806c2127f37c80bcca365f	souvik@kreatio.com 		\N	2016-03-14 07:15:44.084068	2016-07-26 09:18:02.329551	\N	false	Deactivated	1		100080270818	\N	\N
277	Mr	Ravikumar	A		BSZPA8145C		Male	Unmarried	1991-03-05	2015-11-16	3	7411251990	ravikumar@kreatio.com	8eecba9238915d713c67d8746e832471	sumitha@kreatio.com	12219	\N	2015-11-17 07:29:22.003272	2017-07-26 04:47:24.824897	\N	false	Active	1			\N	600196231004
242	Mr	X. ARUN	PRASATH		BLPPA6694D		Male	Married	1984-04-19	2015-06-08	1	9066261048	arunprasath@webnish.com	b0496432c8acca87af4474d9e189505e	hr@webnish.com	12197	\N	2015-06-16 09:10:25.358508	2016-05-03 10:44:48.385249	\N	false	Deactivated	2		\N	\N	\N
286	Ms	devi	c s		BIQPD0360M		Female	Unmarried	1988-05-26	2016-02-09	3	9036044570	devic@webnish.com	ab8761c38e9692741f0fd5346133f095	kumaramit@webnish.com	15012	\N	2016-02-11 11:08:23.3637	2016-09-30 13:07:52.278194	fff6c715	false	Deactivated	2			\N	\N
296	Mr	Stanley 	Lobo	Arun	ADIPLO693H	PY/BOM/60812/224	Male	Married	1976-07-09	2016-03-01	3	9886880600	sarunlobo@webnish.com	7a3e9cdbabef58ec57eaf4b6e17afa83	dipti@webnish.com	12227	\N	2016-03-03 07:43:03.326456	2017-01-27 06:22:14.366036	5833f92f	false	Active	2			\N	\N
280	Mr	karthikeyan	p				Male	Unmarried	1987-05-27	2015-11-03	3	9443025442	karthikeyan@webnish.com	f035dbc9fd0f0da2261057133582483a	karthikeyan@webnish.com		\N	2015-11-23 07:26:46.646416	2016-05-04 10:43:56.072173	\N	false	Deactivated	2	9739103364	\N	\N	\N
282	Mr	Atul	Chandra		AOEPC2198H	PY/BOM/60812/217	Male	Unmarried	1990-01-12	2015-12-09	3	+918553225060	atulchandra@kreatio.com	59c984da2520e42a8de295e7353fb5b1	arun.varghese@kreatio.com	12220	\N	2015-12-10 05:00:16.182376	2017-08-07 06:24:54.252903	54424413	false	Active	1	+919620204514	100868750436	\N	537715897477
288	Mr	K Senthil kumar			EFXPS2171Q		Male	Unmarried	1989-03-16	2016-01-27	3	9994965097	ksenthil@webnish.com	9ae5e6c65f3686402bd6692b556573f0	srikanthvasuraj@webnish.com		\N	2016-02-11 11:11:50.683103	2016-06-03 11:50:24.409625	\N	false	Deactivated	2			\N	\N
274	Mr	Jayachandra	Yenkepally				Male	Married	1984-08-16	2015-10-14	3	9949254565	jayachandra@webnish.com	e5e36ae4fe3137092d21bec4e612b642	sriksrikanthvasuraj@webnish.com		\N	2015-11-02 09:32:21.485291	2015-12-31 08:47:07.805661	\N	false	Deactivated	2		\N	\N	\N
293	Mr	Bandi 	naresh		BXSPB3832R		Male	Married	1991-02-14	2016-02-24	3	9986887023	bnaresh@webnish.com	dc6e2c0fde99f66928179f9010dcb945	bnaresh@webnish.com	15015	\N	2016-02-25 10:51:06.921162	2016-10-18 09:34:33.631323	\N	false	Deactivated	2			\N	\N
298	Mr	sanjeev 	kumar		BXHPK3087N		Male	Unmarried	1991-02-03	2016-03-03	3	7829060424	sanjeevkumar@webnish.com.	ed50d75cffb87bdf09258853a12ff08d	swathidasari@webnish.com	15019	\N	2016-03-03 07:44:21.226215	2017-02-02 13:05:31.049062	889a8a0b	false	Deactivated	2		100471341875	\N	
284	Mr	Ankur	Chowdhury		AUGPC1727J		Male	Unmarried	1989-02-24	2016-01-22	3	09993379862	ankur@kreatio.com	3d2440fb4da2aaf55e903b0527d08666	priyali@kreatio.com		\N	2016-01-27 05:29:29.358959	2016-04-29 06:13:26.059787	\N	false	Deactivated	1			\N	\N
278	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	abisonjohn@webnish.com	d5e8990b847e840849da5a40e429bc23	\N	\N	\N	2015-11-23 07:25:35.494869	2016-02-22 06:45:21.957513	\N	false	Deactivated	2	\N	\N	\N	\N
269	Mr	Vaidheeswaran 	D		AOUPV6922N	PY/BOM/60812/213	Male	Unmarried	1992-10-13	2015-10-19	3	8973285001	vaidheeswaran@kreatio.com	1758d78b3862dd259e4101308bd110f0	sumitha@kreatio.com	12216	\N	2015-10-20 05:05:41.961138	2017-06-14 11:07:22.087766	88ea14f9	true	Active	1			\N	
297	Mr	G.Jaya	Reddy	chandra	BGAPG0682H		Male	Unmarried	1994-04-13	2016-02-22	3	9441065691	rjayachandra@webnish.com	d3f37534784bd64e497ca6534269967b	souvik@webnish.com		\N	2016-03-03 07:43:52.38304	2016-05-20 09:42:52.787862	\N	false	Deactivated	2	8088929203		\N	\N
281	Mr	Ragavendaran	N		AKJPR9503Q		Male	Unmarried	1987-04-26	2013-01-17	3	7411466961	ragavendaran@webnish.com	77a4a48f8d115a0cd69d50d30c5298d7	arunkumar@kreatio.com	12083	\N	2015-12-08 09:19:40.519828	2016-07-06 10:09:42.941555	\N	false	Deactivated	2		\N	\N	\N
287	Mr	Raghavendra	Gaikwad	Rao	ALTPG2362B		Male	Married	1982-09-24	2016-02-09	1	9535570683	graghavendra@webnish.com	9fcc38383e47b9ffecfd84f48ec327f3	srikanthvasuraj@webnish.com		\N	2016-02-11 11:09:08.883694	2016-06-17 10:17:50.476463	\N	false	Deactivated	2			\N	\N
294	Mr	jibin	scaria		GPHPS9552F		Male	Unmarried	1989-10-17	2016-02-24	3	9497283682	jibinscaria@webnish.com	6cba85ea0aea31e390bc615d1e4d8fae	arunkumar@webnish.com	15016	\N	2016-02-25 10:51:36.081049	2017-07-26 04:15:19.274643	\N	false	Active	2			\N	509127048442
289	Mr	punoju		chaitanya	CUTPP9772R	MH/94877/22243	Male	Unmarried	1995-12-03	2016-02-07	3	8519974745	chaitanyap@webnish.com	d332443c10624be711e5905572965633	bharati@webnish.com		\N	2016-02-11 11:12:18.916906	2016-05-20 09:42:52.768161	\N	false	Deactivated	2			\N	\N
270	Ms	Sowmya	S		EETPS3230H		Female	Unmarried	1990-04-15	2015-10-26	3	9686301158	sowmya@webnish.com	3e0251920180fb902354adf9af234c56	srikanthvasuraj@webnish.com		\N	2015-11-02 09:29:25.81036	2016-03-07 07:49:11.206956	\N	false	Deactivated	2		\N	\N	\N
276	Ms	Kaveri	Moger	Timmappa	BSDPM9068E	PY/BOM/60812/215	Female	Unmarried	1991-04-19	2015-11-16	3	9632516431	kaverimojer@kreatio.com	4b1920fec8aa5aaded84fedc8a38456c	aditya.agrawal@kreatio.com	12218	\N	2015-11-17 07:29:01.350105	2017-08-16 06:48:58.621373	d88422d6	false	Active	1			1993-04-19	596342420000
290	Mr	Mamidi	Yadav	Suresh	CUMPM7995Q		Male	Unmarried	1988-10-12	2016-02-03	3	9000117182	suresh@webnish.com	c0197951a40aa717cb12b3af84f7a6c0	bharathi@webnish.com		\N	2016-02-11 11:12:48.519994	2016-06-16 12:15:43.730687	\N	false	Deactivated	2			\N	\N
295	Mr	Vijay	Kumar		AVBPV4496K		Male	Unmarried	1995-06-12	2016-02-24	3	7483243962	kumarvijay@kreatio.com	9cafed85c2e4287d8214eca27333ce3d	prithivirajan@kreatio.com	12226	\N	2016-02-25 12:46:13.026862	2016-11-15 09:28:49.324042	e625cd72	true	Deactivated	1	9591124621		\N	\N
275	Mr	Adarsh	singh	kumar	GKVPS3359R	PY/BOM/60812/214	Male	Unmarried	1991-01-10	2015-11-06	3	8618039447	adarshkumar@kreatio.com	48a1a5a2d765edfeac9dfd2f292ddb9a	souvik@kreatio.com	12217	\N	2015-11-09 05:35:53.702195	2017-08-16 09:15:12.301686	\N	false	Deactivated	1	8618039447		\N	
273	Mr	Arunprakash	jeyapal		BCUPA8203N		Male	Unmarried	1989-09-19	2015-10-07	3	9962013988 	arunprakash@webnish.com	a621cbb3d54df7ae1f8e6d278f290d02	sriksrikanthvasuraj@webnish.com		\N	2015-11-02 09:31:00.219509	2016-03-03 08:53:01.014288	\N	false	Deactivated	2		\N	\N	\N
326	Ms	chaitra	k		BHTPC5777P		Female	Unmarried	1994-10-01	2016-08-01	3	9066121441	chaitra@kreatio.com	61c615f1cd8c5c6f40df4a56e5956832	sumitha@kreatio.com	12268	\N	2016-08-08 10:28:30.973631	2017-01-05 11:01:27.617273	\N	false	Active	1			\N	
315	Ms	Tapaswi	Kalapati		CVAPK9576J		Female	Unmarried	1990-11-16	2016-05-26	3	8861257488	tapaswi@webnish.com	22c406876d63546b0028b64e50a84e76	sarunlobo@webnish.com	12260	\N	2016-06-07 09:24:18.93851	2017-02-08 06:18:17.388265	\N	false	Active	2	9590092392		1990-11-16	
304	Mrs	Thanuja	U		AEWPU6538D		Female	Married	1994-03-02	2016-03-28	3	8951894304	thanuja@webnish.com	906178f9d2999c7dd6d407e18cc2f6fa	swathidasari@webnish.com	15027 	\N	2016-03-31 09:15:54.54259	2017-01-31 12:32:15.590369	\N	false	Deactivated	2			\N	\N
285	Mr	Syed	Tousif	Khalander	AZGPT6874L	PY/BOM/60812/219	Male	Unmarried	1989-11-19	2016-02-01	3	7411494917	syedk@kreatio.com	4dc728a3d235704e2ea3b3847c453fc3	 souvik@kreatio.com	12222	\N	2016-02-01 09:53:34.961849	2017-08-16 09:15:12.322578	126933bf	false	Deactivated	1			\N	
318	Mr	Dhevasenapathi	Subramaniyan		AYGPD9743D		Male	Unmarried	1988-02-11	2016-06-10	3	9944380454	dhevasenapathi@kreatio.com	f9642c1ceb58570a00350726459ac326	senthilkumar@kreatio.com	12240	\N	2016-06-10 11:24:02.810267	2017-07-05 12:20:22.049842	14d9e1e0	true	Active	1			\N	\N
302	Ms	Mahathi	Kotakonda		DYCPK7430P		Female	Unmarried	1995-02-27	2016-03-14	3	7204937996	mahathi@webnish.com	a357e5265a78e8b87d6d0f4864648250	chetanac@webnish.com		\N	2016-03-24 04:17:42.221874	2016-05-17 12:08:31.681851	da1fe917	false	Deactivated	2			\N	\N
177	Mr	kumaresan	kesavan		CBWPK9248R	PY/BOM/60812/133	Male	Unmarried	1986-08-03	2014-03-28	3	+917618796723	kumaresan@kreatio.com	a69dd1f7e64c9f8cf63a5feb69745a29	prithivirajan@kreatio.com	12136	\N	2014-04-04 10:30:26.765585	2017-06-14 13:03:32.604867	20f50376	true	Active	1			\N	
301	Ms	Thushara	GN		AYAPT0157F		Female	Unmarried	1993-09-30	2016-03-14	3	9036316691	thushara@kreatio.com	30f6623f724d802e249fdd7443f56e16	aditya.agrawal@kreatio.com	12229	\N	2016-03-16 06:16:22.70614	2017-07-27 13:31:19.784756	02892e50	true	Active	1			\N	469713025833
308	Mr	Uday	das	kumar	BPLPD4354P		Male	Unmarried	1991-01-25	2016-05-04	3	9439196255	udaykumar@kreatio.com	6650416399892ce707fc0ff0c2a96984	deepa@kreatio.com	12234	\N	2016-05-04 11:04:12.732494	2016-09-21 07:50:55.404813	00953658	false	Deactivated	1		100598210050	\N	\N
319	Mr	Manikchand	Mudliyar	Vikram	BRMPM0177J		Male	Unmarried	1993-06-24	2016-06-13	3	8903402548	manikchand@kreatio.com	16b1f8302ef707edd3cc4e34c69a1783	sumitha@kreatio.com	12244	\N	2016-06-15 12:22:17.665447	2017-08-04 06:41:24.540051	\N	false	Deactivated	1			1993-06-24	
305	Mr	Tippu	S	Sultan	EZVPS4608Q		Male	Unmarried	1991-06-17	2016-04-12	3	+919966771230	tippusultan@kreatio.com	4d3f3f233caafe39dd0620764f079008	sumitha@kreatio.com	12233  	\N	2016-04-12 09:41:02.372856	2017-07-25 09:34:45.751862	4f9fec3d	false	Active	1			\N	285254005980
303	Ms	poojitha	A		BMNPA7650Q		Female	Unmarried	1993-08-25	2016-03-21	3	9490767651	poojitha@kreatio.com	bc75cb0570c9e9ca313a8d6303510c6a	sumitha@kreatio.com	12230	\N	2016-03-28 13:43:52.427573	2017-07-24 13:00:06.557848	\N	false	Active	1			1993-11-29	874358059141
313	Mr	\N	\N	\N	\N	\N	\N	\N	1967-05-03	\N	1	\N	kkkg@kreatio.com	098f6bcd4621d373cade4e832627b4f6	\N	\N	\N	2016-06-03 07:53:00.404236	2017-05-10 09:51:38.977369	cca74b5f	true	Active	1	\N	\N	\N	\N
307	Mr	Shashidhar	Mayannavar	G	CVZPM9359N	PY/BOM/60812/250	Male	Unmarried	1993-12-22	2016-04-12	3	8147105504	shashidhar@webnish.com	e32001317f8d8606683545dd102c4e50	arunkumar@webnish.com	15031	\N	2016-04-22 05:09:17.392714	2017-05-16 11:01:09.622984	ce2b2940	false	Active	2		100889665929	\N	
431	Ms	Helma	Cutinha	Maria	BBKPC1983N		Female	Unmarried	1994-02-14	2017-07-11	3	8496925634	helma.maria@kreatio.com	91e61ce70fe3fc1dd0675a3ea62e629c	aditya.agrawal@kreatio.com	12370	\N	2017-07-19 10:33:47.507584	2017-08-01 05:08:56.009707	\N	false	Active	1			1994-02-14	9971 4879 5061
316	Mr	Frank	Infant		ACVPF1719L		Male	Unmarried	1994-12-07	2016-06-07	3	7845726998	frankp@kreatio.com	39e788b38cd27cf8ff1007a39dfa31c9	jagadeeswar@kreatio.com	12238	\N	2016-06-08 05:21:55.520114	2017-01-02 11:49:23.62375	808c0af4	false	Deactivated	1			\N	\N
311	Mr	KARTHIK	T		DPHPK1620H		Male	Unmarried	1994-05-28	2016-05-04	3	9886812279	karthikt@webnish.com	1f32f4787712084cd8f34c47e16f5c69	kumaramit@webnish.com	15039 	\N	2016-05-07 05:27:43.404654	2016-06-22 12:06:50.969056	\N	false	Active	2			\N	\N
300	Mr	Uttam	Pramank	Kumar	BPOPP1048D		Male	Unmarried	1986-10-01	2016-03-14	3	8197989053	uttamkumar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	priyali@kreatio.com	12228	\N	2016-03-14 10:58:15.425449	2016-05-10 04:34:13.332139	\N	false	Active	1	8197989053		\N	\N
312	Mr	Chandan	Jha		ARCPJ9824G		Male	Unmarried	1991-02-02	2016-05-19	3	7829693289	chandanjha@kreatio.com	963e6b2a5250f491b86631495ce8b095	deepa@kreatio.com	12235Chandan Jha	\N	2016-05-20 07:50:55.644772	2016-09-21 03:59:42.672047	\N	false	Deactivated	1			\N	\N
310	Mr	chiranjeevi b J			BFOPC8877H		Male	Unmarried	1991-09-25	2016-05-04	3	8431571980	chiranjeevi@webnish.com	bf52e383ccd63c29e41b46e344ddc2ff	swathidasari@webnish.com	 15038 	\N	2016-05-07 05:27:23.692836	2017-07-24 13:09:09.518173	\N	false	Active	2			\N	
306	Ms	Poonkodi	Thirumoorthi		DEDPP0122L	100896058811	Female	Unmarried	1993-05-25	2016-03-28	3	9715014596	poonkodi@webnish.com	7c583fa391f9886da620876df07f26d6	manish@webnish.com	15028	\N	2016-04-22 05:08:47.467177	2017-08-17 05:05:59.263092	4e1ac389	true	Active	2			1993-05-25	767354739348
314	Mr	Hari	I	Shankar	AEVPI5882F		Male	Unmarried	1995-07-21	2016-06-07	3	9487115686	harishankar@kreatio.com	2d1ed5af6f1473c4982b01699d604c9d	sumitha@kreatio.com	12237	\N	2016-06-07 07:32:28.61747	2016-12-27 05:32:32.660298	089e6247	false	Active	1			\N	\N
323	Mr	Navin		Kumar	EMRPK1435E	PY/BOM/60812/267	Male	Unmarried	1994-08-25	2016-07-28	3	9738677711	navin@kreatio.com	b75e47c127cb588d6425b5a10a855061	sumitha@kreatio.com	12266	\N	2016-07-29 09:43:00.017793	2017-07-24 15:45:38.82615	\N	false	Active	1		100935369471	\N	638991332776
322	Mr	Sathish kumar	V		FBXPS0694M		Male	Unmarried	1995-06-28	2016-06-13	3	9629443987	sathishkumar@kreatio.com	1a1dc91c907325c69271ddf0c944bc72	sumitha@kreatio.com	12243	\N	2016-06-15 12:23:00.097001	2017-05-22 16:34:46.230019	5e8ff766	false	Active	1			1995-06-28	
328	Ms	Aishwarya	k		BWMPA0866P	PY/BOM/60812/273	Female	Unmarried	1994-12-28	2016-08-01	3	9972839005	aishwarya@kreatio.com	be36d18267a512f816f6c77f1a1ce0ed	sumitha@kreatio.com	12272	\N	2016-08-08 10:29:21.21379	2017-08-03 05:32:25.843683	\N	false	Active	1		100918542337	1994-12-28	476181044475
321	Mr	Sivaram	G		DNVPS7429L		Male	Unmarried	1993-05-08	2016-06-13	3	9500657249	sivaram@kreatio.com	6483f991dcd97a8c343f38445a3031a6	sumitha@kreatio.com	12241	\N	2016-06-15 12:22:48.496471	2017-07-01 02:14:56.733664	\N	false	Active	1	9206176285		1995-05-08	1234
327	Ms	Rithi 	M		CLZPM0327A		Female	Unmarried	1994-10-06	2016-08-01	3	9482947545	rithi@kreatio.com	d581b7ce34fa9803d1c2fb2cecae7e56	sumitha@kreatio.com		\N	2016-08-08 10:28:48.374901	2016-11-15 09:22:09.400053	476f8b0b	false	Deactivated	1			\N	\N
309	Mr	Mahesh	S		GYYPS9808E		Male	Unmarried	1993-12-12	2016-04-26	3	7353569520	maheshs@webnish.com	ccaa250e8ca26a2e4873154a2ee8d6d1	souvik@webnish.com	15035	\N	2016-05-07 05:26:49.403565	2017-08-11 09:53:17.535867	f9585bb1	false	Deactivated	2			\N	812610723609
320	Mr	Balamurugan	N		BMUPB6847H	PY/BOM/60812/239	Male	Unmarried	1994-01-25	2016-06-13	3	9842059138	balamurugan@kreatio.com	38db47f7cc57bac213c66d0d1e14b5c1	souvik@kreatio.com	12242	\N	2016-06-15 12:22:34.541106	2017-06-20 08:17:33.404103	\N	false	Deactivated	1	9842059138		\N	
348	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	rajarathnam@webnish.com	c7b3daebd42f1e1724b8fa71d3deddf3	\N	\N	\N	2016-09-12 05:26:34.494083	2016-10-21 07:38:43.928205	dd5faf55	false	Deactivated	2	\N	\N	\N	\N
351	Mr	NAZIMUL	HOQUE		AHEPH9060L	PY/BOM/60812/277	Male	Unmarried	1988-12-31	0010-08-16	3	9632205712	nazimul@webnish.com	9410dbecb54be392126d7a8b4df89b17	sarunlobo@webnish.com	12281	\N	2016-09-12 05:27:19.356531	2017-05-04 07:29:12.859916	a4ed872a	true	Deactivated	2			\N	\N
332	Ms	Ritika			BMHPR0428R		Female	Unmarried	1995-01-05	2016-08-08	3	7795534570	ritika@kreatio.com	36178458569a5346a63981e0d1892074	presithprakash@kreatio.com	12275	\N	2016-08-09 07:04:39.054567	2017-07-31 05:36:24.747035	90e7edcc	false	Active	1			\N	
349	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	manjunathswami@webnish.com	4ad54bfc6585dad1c52985ff3c9079ce	\N	\N	\N	2016-09-12 05:26:49.172352	2016-10-18 09:34:33.698056	9fb7dbfe	true	Deactivated	2	\N	\N	\N	\N
355	Mr	bala	k	subramanyam	bjbpk6630d	PY/BOM/60812/278	Male	Unmarried	1992-08-15	2016-08-11	3	8553702582	kbalasubramanyam@webnish.com	3e6fb6f9b61a9cb38ba8fdfad2151ce5	sarunlobo@webnish.com	12282	\N	2016-09-16 04:35:23.531423	2016-10-21 07:46:21.900137	487896e3	false	Deactivated	2			\N	\N
350	Mr	Naresh kumar	N	reddy	AQWPN4866H	PY/BOM/60812/266	Male	Unmarried	1991-08-15	2016-07-25	3	9986198140	nnareshkr@webnish.com	4381a43f4bf4cd90d2860b0074c058b3	sarunlobo@webnish.com	12280	\N	2016-09-12 05:27:05.113491	2016-12-06 05:03:07.500332	a911cad7	false	Deactivated	2			\N	\N
342	Mr	Amjith	C.K		CHCPA9060R		Male	Married	1993-10-24	2016-08-25	3	9844145330	amjith@webnish.com	dcac8ffd32fae5b127aab1e8b90f0a56	swathidasari@webnish.com	12286	\N	2016-09-01 10:31:06.80104	2017-07-31 04:22:22.955141	31bc1b98	false	Active	2			\N	
329	Ms	Vidyashree	R				Female	Unmarried	1994-10-23	2016-08-01	3	9686842811	vidyashree@kreatio.com	a7cded6f66e40c4f3a84c3287df87aa0	selvachezhian@kreatio.com	12269	\N	2016-08-08 10:29:35.75929	2017-07-19 09:37:59.28687	\N	false	Deactivated	1			1994-10-23	
354	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	giridhar@webnish.com	a4ac5a15409518cc536e213a6f0140ef	\N	\N	\N	2016-09-14 04:48:25.602605	2016-10-18 09:34:33.718045	\N	false	Deactivated	2	\N	\N	\N	\N
360	Mr	Saawan	Sherkhane	Kumar	EQWPS9032J	PY/BOM/60812/289	Male	Unmarried	1990-12-14	2016-10-13	3	8970656261	saawankumar@kreatio.com	0a00133dd79f5c3890fb904525361029	aditya.agrawal@kreatio.com	12299	\N	2016-10-14 07:43:31.519436	2017-07-25 08:25:52.299768	\N	false	Active	1		100947140019 	1990-12-14	637852580064
331	Ms	Harshitha	R		APLPH0917H		Female	Unmarried	1994-06-02	2016-08-01	3	9448735307	harshitha@kreatio.com	05e1b683408b331959cc703b868df0d2	sumitha@kreatio.com	12273	\N	2016-08-09 04:52:45.042668	2017-06-01 12:59:53.908439	\N	false	Active	1	9448735307		1994-06-02	
359	Mr	Santosh	Tummepalli		AOUPT6109F		Male	Unmarried	1991-07-11	2016-09-28	3	8951588308	santosht@webnish.com	75fc2c673f992319c2100b6f74c4ad78	sarunlobo@webnish.com	12294	\N	2016-10-14 04:29:15.382487	2016-11-09 13:01:26.071771	\N	false	Active	2			\N	\N
333	Mr	Gopinath	N		ASGPN7811A	PY/BOM/60812/252	Male	Unmarried	1992-08-25	2016-04-25	3	9738388614	gopinathn@webnish.com	622c69d8872f1c8b650b8f5686f26955	sarunlobo@webnish.com	12256	\N	2016-08-17 07:14:07.197123	2017-08-17 06:38:21.592755	22bd77af	false	Active	2			1990-11-25	\N
343	Ms	josna		priya	DEIPP5381G		Female	Unmarried	1995-05-20	\N	3	9538716001	josna@webnish.com	dc00b889649c424f6ac3a516cf2f40ee	manish@webnish.com	12290 	\N	2016-09-01 10:32:41.516517	2016-11-09 13:10:21.43492	\N	false	Active	2			\N	\N
352	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	balasubramanyam@webnish.com	8b28d2be14364156527adc9bf78d26fb	\N	\N	\N	2016-09-12 05:27:38.798022	2016-09-16 04:35:03.601889	\N	false	Deactivated	2	\N	\N	\N	\N
334	Mr	RAJESH.D	DURAI		BFPPR6354R		Male	Unmarried	1989-09-03	2016-05-18	3	9710108032	rajeshd@webnish.com	4bedce9e2b2a3db50f3339520cd70caf	sarunlobo@webnish.com		\N	2016-08-19 10:47:41.927425	2017-02-01 13:16:33.226678	38a3e74b	false	Deactivated	2			\N	\N
362	Mr	R.ANJANA KUMAR					Male	Married	1989-02-03	2016-09-26	3	8681944543	anjankumar@webnish.com	7740207bf37fea466fdcb6d9d44ac199	bharathi@webnish.com		\N	2016-10-22 07:12:21.148343	2016-12-20 09:21:28.977903	0ad45373	false	Deactivated	2			1989-02-03	\N
361	Mr	Azahar 	Shah	Ali	BRZPS9722E		Male	Unmarried	1990-03-06	2016-10-03	3	7872739524	azaharali@webnish.com	64b5c153ab8d2285b346e5e1cb2d0ebc	swathidasari@webnish.com	12296	\N	2016-10-18 08:42:01.769207	2017-02-01 13:16:33.24669	\N	false	Deactivated	2	9148599589		\N	\N
356	Mr	Pranow	Ojha	Kumar	AAZPO3112C		Male	Unmarried	1993-02-08	2016-10-03	3	9738869780	pranowkumar@kreatio.com	88c870daee860847e98d925669c3de5e	sumitha@kreatio.com		\N	2016-10-04 09:26:06.836312	2017-04-06 13:37:21.762058	\N	false	Deactivated	1			\N	\N
345	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	prithvirajan@kreatio.com	6a0295df9ae7e556bc1841c58c50594e	\N	\N	\N	2016-09-01 11:47:26.397928	2016-09-14 11:16:43.671861	\N	false	Deactivated	1	\N	\N	\N	\N
358	Mrs	Sabita	Dash	Rani	BEKPD2182R		Female	Married	1990-07-05	2016-10-10	3	9886961900	sabitarani@webnish.com	d8f812027d630df6d50532623653e2f7	swathidasari@webnish.com		\N	2016-10-12 11:59:26.917675	2016-10-18 09:34:33.738131	\N	false	Deactivated	2			\N	\N
336	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	vivek@webnish.com	e26a806ade29085b1a0f6faf5ea2d372	\N	\N	\N	2016-08-19 10:48:27.001134	2016-10-04 08:54:32.038563	\N	false	Deactivated	2	\N	\N	\N	\N
337	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	nsathish@webnish.com	6a809dca039dafb8bfa089d5b3311acd	\N	\N	\N	2016-08-19 10:49:11.581505	2016-10-04 08:54:32.057465	\N	false	Deactivated	2	\N	\N	\N	\N
344	Ms	SHARMILADEVI	S		HANPS3787L		Female	Unmarried	1995-08-02	2016-09-01	3	7708972417	sharmiladevi@webnish.com	e2cb72f60232333eda8eedb44841330b	manish@webnish.com	12289	\N	2016-09-01 10:33:30.988332	2017-05-09 10:29:24.728326	55562df6	false	Active	2			1995-08-02	
324	Mr	Prithivirajan	S		AUVPP2603F	PYBOM00613130000000077	Male	Married	1978-06-24	2016-08-05	1	9008211100	prithivirajan@kreatio.com	fac6c403ff1e3563160577d8a30948fb	senthilkumar@kreatio.com	12274	\N	2016-08-08 10:27:25.75849	2017-07-26 11:07:36.871615	\N	false	Active	1	9620204514	100528340438	1979-07-26	482472130191
339	Mr	Hemant	Singh	Kumar	DHCPS3912R		Male	Unmarried	1992-07-04	2016-08-25	3	8197599813	hemant@kreatio.com	057d6e5279b0d99b2cc4bdecd22926a7	aditya.agrawal@kreatio.com	12281	\N	2016-08-29 10:22:29.87043	2017-07-19 11:09:06.638311	a6f52fb1	false	Active	1			\N	\N
338	Mr	Nanghuran			Bjqpp6203c		Male	Married	1989-11-26	\N	3	9940152854	nanghuran@webnish.com	ee593c8704a3bd9062a4885b426b3279	Bharathi@webnish.com 		\N	2016-08-19 10:51:06.935984	2017-02-01 13:16:33.266724	e661d3cb	false	Deactivated	2			1989-11-26	\N
363	Mr	arockiasamy	S				Male	Married	1986-08-29	2016-09-26	3	9789043372	arockiasamy@webnish.com	00b7ab75e0bb6f2a4506b05d18e83ae2	sarunlobo@webnish.com	12293	\N	2016-10-22 07:12:48.355225	2017-02-01 13:16:33.200111	f820d420	false	Deactivated	2			\N	\N
346	Mr	Vinay	R				Male	Unmarried	1986-09-03	2016-08-24	3	7795850885	vinayris@webnish.com	0e6e8b06d5f1381cf8fa859fb52a6b6e	swathidasari@webnish.com		\N	2016-09-03 06:30:46.627866	2016-10-18 09:34:33.680025	\N	false	Deactivated	2			\N	\N
389	Mr	karthik	baradhi		DDJPK6850D		Male	Unmarried	1993-11-02	2017-03-24	3	8904148905	karthik.b@kreatio.com	336f7e4dd8655b4ef08876a563caeed1	sumitha@kreatio.com	12326	\N	2017-03-27 10:10:54.169116	2017-06-29 19:51:09.852187	13590b40	true	Active	1			1993-11-02	261697969374
340	Mrs	Swathi	Dasari				Female	Married	1988-03-10	2016-08-29	1	8050103323	swathidasari@webnish.com	6d221b5ee25792ec3bf7b5532735fc36	deepa@webnish.com	12287	\N	2016-09-01 10:09:29.58153	2017-07-05 13:08:14.176721	8714d6b2	false	Active	2			\N	
335	Mr	Dharmakari	Mahesh		ATJPD6707H		Male	Married	1986-05-10	2016-05-23	3	9885051316	dmahesh@webnish.com	83cd20b51c7d99e8aa12a39978f7f094	sarunleobo@webnish.com	12262	\N	2016-08-19 10:48:06.067746	2017-01-03 09:39:49.851272	3422b3da	false	Active	2			\N	\N
353	Mr	N	SEKHAR	CHANDRA	AVIPC4282D		Male	Married	1992-06-14	2016-09-07	3	8431390990	chandrasekhar@webnish.com	b07c2415c2a51e0e391166a9802bdcdc	sarunlobo@webnish.com		\N	2016-09-14 04:41:03.05177	2017-04-04 05:21:15.554242	\N	false	Deactivated	2			\N	\N
381	Ms	lavanya	n		ATIPN5885B		Female	Married	1994-09-17	2016-12-09	3	9809222965	lavanya.n@webnish.com	a5bab41154918313ba6af982cca817c8	swathidasari@webnish.com		\N	2017-01-09 12:49:11.183764	2017-02-03 13:05:28.373728	47aeeb89	false	Deactivated	2			1994-09-17	854421097187
364	Mr	RAMAN 		A.			Male	Unmarried	1986-02-08	2016-10-03	3	9960992778	ramanpal@webnish.com	8a8e1ee85ece99c46dc7bcf15033252e	swathidasari@webnish.com	12295	\N	2016-11-04 10:46:54.106049	2017-04-19 12:37:33.828167	\N	false	Deactivated	2			1986-02-08	
347	Mr	sivaprakash	sivaprakash	v	GIVPS5835N	PY/BOM/60812/263	Male	Unmarried	1992-03-17	2016-07-21	3	8050026869	sivaprakashv@webnish.com	868a1e3e0ffb37f1c2551bedbc04d279	sarunlobo@webnish.com	12277	\N	2016-09-12 05:26:10.277935	2016-11-29 06:33:45.21999	5530819d	false	Deactivated	2			\N	\N
168	Ms	Swathi			BNIPB4420M	PY/BOM/60812/127	Female	Unmarried	1991-06-11	2014-02-26	3	8095640546	bswathi@kreatio.com	d5988e5cd7eed2b4e46b2ac5898d75d3	Sumitha@kreatio.com	12131	hr@kreatio.com	2014-02-27 09:08:39.212156	2017-06-05 12:38:20.630221	9d5e3e83	true	Active	2		1001 0546 9740	1991-10-20	944676753449
370	Ms	Ankita	sahu		EJBPS1908D		Female	Unmarried	1989-07-18	2016-11-17	3	8123187129	ankitasahu@webnish.com	7e8e053aa97dc2d6a8a215e6de9e5002	michael@webnish.com		\N	2016-11-21 09:56:38.619306	2017-05-12 10:23:50.548062	\N	false	Deactivated	2			1989-07-18	
367	Mr	VENKATESAN 	K R				Male	Unmarried	1993-05-07	2016-11-07	3	9071126016	venkatesank@kreatio.com	cd97f158f86b0a9a9c1fc8d9c3b0283f	prithivirajan@kreatio.com	12304	\N	2016-11-08 11:05:14.328466	2017-06-23 07:16:26.430334	df8f6f7a	false	Active	1	9071126016		1993-11-05	\N
377	Mr	Mohith 	k.j		BWNPM5786P		Male	Unmarried	1993-12-06	2016-12-12	3	9845685170	mohith.kj@kreatio.com	2f7a1f57e62b9410e8515967f5382b85	prithivirajan@kreatio.com	12312	\N	2016-12-20 04:05:24.73416	2017-01-23 12:22:55.620617	a25df1de	false	Deactivated	1			\N	\N
369	Ms	shwetha	mn		BWEPM8134Q		Female	Married	1991-01-04	2016-11-14	3	8884993472	shwethamn@kreatio.com	a8ca6594c16140c7ab5b097c46f9b8f3	sumitha@kreatio.com	12305	\N	2016-11-15 06:44:37.393153	2017-08-01 06:25:48.093062	3e161cca	false	Deactivated	1			1990-09-18	
392	Mr	prapul	prapul HJ	H J			Male	Unmarried	1990-09-08	2017-03-27	3	8867935825	prapulla.h@webnish.com	aaef4e41fca96b34d74302a1b3e9a98e	sarunlobo@webnish.com	12328	\N	2017-03-27 12:08:10.572358	2017-06-20 09:09:48.677736	\N	false	Deactivated	2			1990-09-08	569345824397
382	Mr	Soubhagya	Pradhan	Kumar	BHGPP9867G		Male	Unmarried	1989-04-20	2017-01-17	3	8970861122	soubhagyakumar@kreatio.com	69f1f75137802a168e4935b499fd01aa	prithivirajan@kreatio.com	12317	\N	2017-01-18 08:40:44.229332	2017-03-19 03:55:46.422031	\N	false	Active	1			1989-08-30	7456 8753 6715
426	Mr	Vaseem	T				Male	Unmarried	1991-09-27	2017-07-11	3	9947904906	vaseem.t@kreatio.com	abe6e0d630295762201a7684df7ef85b	hr@kreatio.com	12364	\N	2017-07-19 10:32:27.382069	2017-07-25 09:39:38.74929	\N	false	Active	1	04933284004		1991-09-27	326609312224
375	Mr	HARI	GUNDARAPU	RAMA KRISHNA	BQYPG1443E		Male	Unmarried	1992-03-01	2016-12-16	3	8897782191	hariramakrishna@webnish.com	c0cd7988346f98068cf05fa94ef1e546	sarunlobo@webnish.com		\N	2016-12-01 10:04:48.345124	2017-03-20 01:37:51.039116	469ffb4b	false	Active	2		100675234960	1993-03-01	\N
394	Mr	Udit	Kumar		DVPPS8486D		Male	Unmarried	1993-04-24	2017-04-03	3	09034408908	udit.kumar@webnish.com	69a0d880b7569bdc4936fff73d76562d	swathidasari@webnish.com	12331	\N	2017-04-05 08:47:06.493063	2017-04-24 07:00:50.830545	\N	false	Active	2			1993-04-24	
378	Mr	Milind	Puranik	Dinesh	CWPPP1806A		Male	Unmarried	1991-07-10	2016-12-22	3	9738958424	milind.puranik@kreatio.com	4aade29d476d9f6fb7cafb0a3061c025	swapnil@kreatio.com	12313	\N	2017-01-02 07:43:56.071411	2017-01-10 05:47:16.441089	\N	false	Active	1	9738958424		1991-07-10	865677693454
376	Mr	Indradas	R		ABIPI5551K		Male	Married	1989-10-21	2016-12-07	3	9066596501	indradas@webnish.com	eb390baa1f1456981f54cfbf36b84071	sarunlobo@webnish.com	12310	\N	2016-12-08 09:31:40.785873	2017-02-09 11:09:11.739273	\N	false	Deactivated	2			1989-10-21	
383	Mr	Michael	Wins		BDRPM7374L	PYBOM00608120000000053	Male	Married	1987-04-27	2017-01-16	3	8050953164	michael@webnish.com	87ca7962c197ed7c9289b87add396c6f	souvik@webnish.com		\N	2017-01-18 09:01:53.707052	2017-07-07 09:54:00.390543	99ddafe3	false	Active	2	8050953164	100227333387	1987-04-27	697077705790
368	Mr	Rohit	Viswam		AVHPV0813C	PY/BOM/34744/2488	Male	Unmarried	1989-11-14	2016-11-11	3	7840083825	rohitviswam@webnish.com	44e2fdbbb8e3915f4f4e44c363979002	souvik@kreatio.com	12306	\N	2016-11-11 09:08:15.222789	2017-03-11 05:08:16.712397	\N	false	Deactivated	2		100573507788	1989-11-14	\N
374	Mr	Ajay 	Maheshwaram	kumar	BQYPM9534N		Male	Unmarried	1991-07-02	2016-12-01	3	9963204294	ajaykumar_m@webnish.com	1a54fa9cbb0532b6c85552f5045a30f0	santhosh@webnish.com		\N	2016-12-01 10:04:30.193295	2017-07-04 08:28:31.2458	2b52a862	false	Deactivated	2			1991-07-02	\N
373	Ms	Poornima	R		BYUPR1392B		Female	Unmarried	1996-07-06	2016-11-21	3	9535951803	poornima.r@webnish.com	e815c9aa55712e3e0633e56b6eb5a52a	swathidasari@webnish.com	12308	\N	2016-11-24 05:37:13.326503	2017-08-14 10:26:07.673255	591cb042	false	Active	2			1996-10-06	
384	Mr	mohan	D	kumar	CEEPM0108K	WB/SLG/31854/00790	Male	Unmarried	1988-03-03	2017-02-02	3	9035133896	mohan.d@webnish.com	4fa972cce86d15e8de98b4c0023c8e83	sarunlobo@webnish.com	12319	\N	2017-02-02 07:25:06.862003	2017-02-14 04:29:52.327197	\N	false	Active	2		100229475042	1988-03-03	
365	Mr	MALHAR	PATIL		CCLPM9171R		Male	Unmarried	1988-07-25	2016-10-28	3	8197920336	malharc@webnish.com	08c4c9b73f4e4b8684b7b34f1926bd5f	swathidasari@webnish.com	12302	\N	2016-11-07 05:25:08.240834	2017-03-11 05:08:16.653111	\N	false	Deactivated	2			1988-09-21	\N
372	Ms	kalpana			EAVPK6870D		Female	Unmarried	1995-04-12	2016-10-24	3	9741261830	kalpanat@webnish.com	a4cbe56905653505524a83a76195e17b	swathidasari@webnish.com	12301	\N	2016-11-24 05:36:07.849397	2017-05-31 12:50:43.759131	\N	false	Deactivated	2	9148599597		1995-01-10	
371	Ms	k.p.shambavi			ERGPK6783R		Female	Unmarried	1995-06-03	2016-10-24	3	9160453002	shambavikp@webnish.com	3e201fbc4823fd75bf3068bc455ba380	swathidasari@webnish.com	12300	\N	2016-11-24 05:35:46.647499	2017-03-01 13:09:33.707964	6615e2ba	true	Deactivated	2	9148599594		1994-02-28	\N
379	Mr	varun	kamath		CTGPK2461N		Male	Unmarried	1995-02-08	2017-01-03	3	8105158857	varun.kamath@kreatio.com	1d2ac651085849cb9876dda7ea2d9fad	souvik@kreatio.com	12316	\N	2017-01-03 09:33:35.20082	2017-03-15 13:18:21.889987	\N	false	Active	1	8105158857		1995-02-08	986163141788
387	Mr	Devaraj	TS		CEQPD6540C		Male	Unmarried	1991-04-28	2017-03-13	3	9566477638	devaraj.ts@kreatio.com	2a0f6180b8bd6256e7a5b39060ebb4f5	rabindrak@kreatio.com	12324	\N	2017-03-14 05:29:50.662489	2017-03-16 09:04:37.586972	\N	false	Active	1	9566477638		1991-04-28	
393	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	ramaprasad@kreatio.com	bda13c2094500b3185226149a0162465	\N	\N	\N	2017-04-03 03:36:36.076728	2017-04-03 06:00:37.333835	\N	false	Active	1	\N	\N	\N	\N
385	Mr	P.SARAT CHAND	CHAND	CHAND	BHRPP2475D		Male	Married	1988-06-14	2017-02-02	3	9620908103	saratchand.p@webnish.com	591dc55635d26afa8131a2745473f3b5	sarunlobo@webnish.com	12320	\N	2017-02-02 07:25:26.260745	2017-04-10 05:16:47.800216	\N	false	Deactivated	2			1988-06-14	443478471043
386	Ms	vaishali		verma			Female	Unmarried	1994-08-02	\N	3	8088183832	vaishali.verma@webnish.com	750407d3b261ac6f6409fdd3d5f9cc36	sarunlobo@webnish.com, hr@webnish.com		\N	2017-03-07 05:17:30.266787	2017-04-24 08:56:09.579501	81a428aa	true	Active	2			\N	
380	Mr	Sanjay	R		EZTPS5350H		Male	Unmarried	1995-04-07	2016-12-28	3	8892933234	sanjay.r@webnish.com	47ad9da668c0fc12b880f16fa67b0e53	sarunlobo@webnish.com	12315	\N	2017-01-07 06:10:54.293025	2017-07-24 12:54:59.008442	\N	false	Active	2			1995-04-07	771836201259
391	Mr	david	S		BXGPD4923F		Male	Unmarried	1991-02-20	2017-03-27	3	9629864724	david.s@webnish.com	f888210a98f1e10432c3efc324671ffe	sarunlobo@webnish.com	12329	\N	2017-03-27 12:07:44.121274	2017-06-20 09:07:58.8675	\N	false	Deactivated	2			1991-02-20	512124930497
395	Mr	Arun	Muthe	Teja	DFBM5369M		Male	Married	1993-04-24	2017-04-10	3	8147167965	arunteja.m@kreatio.com	cfca875af8f6742c515863628cf0bd35	aditya.agrawal@kreatio.com	12333	\N	2017-04-10 11:06:45.083977	2017-07-19 11:09:56.517269	\N	false	Active	1		100694556238	1992-04-24	327551391015
390	Mr	sayed	shahid	abdul	DMXPS6997C		Male	Unmarried	1989-06-10	2017-03-24	3	9742991217	sayed.shahid@webnish.com	bd39da521475336b3a873584a9005957	michael@webnish.com	12327	\N	2017-03-27 12:07:18.246718	2017-06-05 07:54:58.36831	\N	false	Active	2			1989-06-10	610155205981
245	Mr	Tamilarasan	C		APYPT2560H		Male	Unmarried	1993-10-16	2015-06-08	3	+919788007626	tamilarasanc@kreatio.com	d45054a6b1700c01d217b017e4a2216f	aditya.agrawal@kreatio.com	12194	\N	2015-06-17 10:21:08.609589	2017-07-19 11:10:12.877604	f479df36	false	Active	1			1993-10-16	
388	Mr	Rahul	AG		AQKPR4981P		Male	Unmarried	1988-11-12	\N	3	8971833456	rahul.ag@kreatio.com	ee1249812dc32b5ab79f63237587c39a	rabindrak@kreatio.com	12325	\N	2017-03-15 11:34:14.155119	2017-07-25 08:39:00.234289	\N	false	Active	1			1988-11-12	794405080318
396	Mr	Gattu	Kumar	Sravan	AYEPG0130H		Male	Unmarried	1987-01-07	2017-04-11	3	9848090436	sravankumar.g@webnish.com	3e487c4c7f767cb9ea3935d0995cba8e	sarunlobo@webnish.com	12334	\N	2017-04-13 04:43:48.310149	2017-04-13 05:15:49.918852	\N	false	Active	2			1987-01-07	460835582269
398	Mr	MOHAMMED 	ASKARI	ASKARI	APLPHD	NO	Male	Married	1987-06-08	2017-04-19	3	7676858835	mohammed.askari@webnish.com	00cbdc1ea91cae848214c1a61cfc657e	sarunlobo@webnish.com	12336	\N	2017-04-19 10:52:31.08116	2017-08-08 06:07:06.104291	\N	false	Active	2	_	NO	\N	973635441483
419	Mr	Dharmjeet	Kumar		DDEPK5871H		Male	Unmarried	1994-02-17	2017-07-03	3	9738391524	dharmjeet.kumar@kreatio.com	ef74491b778fe6dfa1ba02da442e06e9	aditya.agrawal@kreatio.com	12355	\N	2017-07-04 03:51:50.486942	2017-08-09 06:38:44.131872	\N	false	Active	1			1994-02-17	2729 1412 2719
400	Mr	prasanna		kumar.k			Male	Married	1993-01-14	2017-04-21	3	9942751045	prasannakumar.k@webnish.com	48c1042ed8bf5d38e58c4127852af429	sarunlobo@webnish.com		\N	2017-04-21 08:47:22.84532	2017-04-21 09:15:37.331748	\N	false	Active	2	9786211004		1993-01-14	734217135592
412	Ms	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	yashaswini.c@webnish.com	3b6ea255fd8fedbb83f5d627585141a9	\N	\N	\N	2017-06-01 06:48:35.11177	2017-06-20 09:07:58.887311	\N	false	Deactivated	2	\N	\N	\N	\N
406	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	puttaswamy.a@webnish.com	14b93ed18437f9d081ba0b8e5ca633ad	\N	\N	\N	2017-05-13 05:36:28.689722	2017-05-18 11:12:56.609205	\N	false	Deactivated	2	\N	\N	\N	\N
404	Mr	mohammed	Imran		AEIPI8996M	00000000	Male	Unmarried	1993-08-10	2017-02-23	3	9845522809	mohammed.imran@webnish.com	01223c88b93601cbe416f6b3dcabeebd	sarunlobo@webnish.com	12322	\N	2017-05-12 05:16:09.621418	2017-05-19 17:54:01.153891	\N	false	Active	2	9845522809	0000000	1993-08-10	567324441835
409	Mr	ANIL	D V		BKAPA156L		Male	Unmarried	1990-09-10	2017-05-03	3	7760234749	anil.dv@webnish.com	e172de92893c5d915bf7c5b66e97cd7c	sarunlobo@webnish.com	12341	\N	2017-05-22 08:37:54.548179	2017-06-20 09:07:58.897146	2aae2024	false	Deactivated	2		100768345475	1990-09-10	363123947167
411	Ms	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	lakshmi.g@webnish.com	c83918683dc3dcf7862e81c477bf5a4c	\N	\N	\N	2017-06-01 06:48:03.267957	2017-06-20 09:07:58.90715	\N	false	Deactivated	2	\N	\N	\N	\N
408	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	molagri.rajesh@webnish.com	0d269cfda83b590adfe6de65f093761f	\N	\N	\N	2017-05-15 09:47:03.690029	2017-05-22 06:45:46.721859	\N	false	Deactivated	2	\N	\N	\N	\N
403	Mr	\N	\N	\N	\N	\N	\N	\N	1976-05-02	\N	1	\N	vishnu@kreatio.com	1a1dc91c907325c69271ddf0c944bc72	\N	\N	\N	2017-05-10 10:16:45.023435	2017-05-12 08:30:50.851723	\N	false	Active	\N	\N	\N	\N	\N
420	Mr	Aditya	Agrawal		AKAPA9071F	PY/BOM/60267/311	Male	Married	1988-07-20	2017-07-03	1	9611194417	aditya.agrawal@kreatio.com	776e4cabd53840e78b7f20ac5946c23d	kkkg@kreatio.com	12354	\N	2017-07-04 03:52:06.745486	2017-07-19 11:14:16.204344	\N	false	Active	1	9611194417	100074016378	1988-07-20	431325967706
425	Mr	Anandhakumar	G				Male	Unmarried	1995-06-27	2017-07-11	3	9600344401	anandhakumar.g@kreatio.com	146ca9804b945f07d63294688368c2a7	hr@kreatio.com	12363	\N	2017-07-19 10:32:14.792759	2017-07-25 09:29:12.384814	\N	false	Active	1			1995-06-27	716021720611
414	Mr	Murali Krishna	Divvela		ARKPD7767L		Male	Married	1988-06-06	2017-06-05	3	9966551909	muralikrishna.d@kreatio.com	a4284e5632081e82292e558257c1210b	kkkg@kreatio.com	12349	\N	2017-06-05 10:10:12.818308	2017-06-06 05:11:07.530166	\N	false	Active	1			1989-11-09	572441827280
401	Mr	Harshavardhana	reddy		AORPH3492L		Male	Unmarried	1992-03-01	2017-05-08	3	9972420143	harshavardhan.b@kreatio.com	ced9697286cead5eb69aba88e8a3d994	sumitha@kreatio.com	12342	\N	2017-05-09 09:26:49.657937	2017-06-06 11:08:12.65505	\N	false	Active	1			1992-04-22	426369265232
415	Mr	Sambath	Bojan		DSNPS7103C		Male	Unmarried	1992-10-05	2017-06-27	3	919047645240	sambath.bojan@kreatio.com	72b8d7ebf8d9f5a7c208027fb8e3ded2	rabindrak@kreatio.com		\N	2017-06-28 06:45:17.783359	2017-06-28 09:38:22.94653	\N	false	Active	1			1992-10-05	313328796034
357	Mr	Girish kulkarni	Kulkarni		DWNPK2461R	BGBNG00441570000000203	Male	Unmarried	1994-05-03	1994-10-03	3	8147925885	girishkulkarni@kreatio.com	d34f2b77e0d577fdcf37ea66b252b999	selvachezhian@kreatio.com	12297	\N	2016-10-04 09:26:23.626792	2017-07-31 07:04:02.1903	\N	false	Deactivated	1		100576606617	1994-05-03	
405	Mr	Selva Chezhian			DFJPS5206F		Male	Married	1987-06-30	2017-05-11	1	9791184989	selvachezhian@kreatio.com	53aac1f589797d36a4bc6e1c84e5a5d9	senthilkumar@kreatio.com	12343	\N	2017-05-12 11:09:06.78459	2017-06-08 06:20:43.031664	90b2902f	false	Active	1		100910659684	1986-11-05	584479170305
410	Mr	Gandharv 	Rawat		BNNPR2573N	PYKRP003500400010226	Male	Unmarried	1989-01-15	2017-05-19	3	9945601123	gandharv.rawat@kreatio.com	d4b197ebcec26a5cd3882160f48e4def	ramaprasad@kreatio.com		\N	2017-05-22 10:32:08.896293	2017-07-07 05:22:22.829396	30b0f18a	false	Active	1		100025403950	\N	224470011833
399	Mr	Srinivas	Rao				Male	Unmarried	1991-03-07	2017-04-20	3	9964267979	srinivas.rao@kreatio.com	6572bdaff799084b973320f43f09b363	rabindrak@kreatio.com	12337	\N	2017-04-20 10:01:36.903162	2017-07-03 07:46:41.988313	\N	false	Deactivated	1			1991-03-07	952323988582
417	Mrs	Sneha	S		DSQPS0824B	000	Female	Married	1993-01-27	2017-07-03	3	7996804345	sneha.s@webnish.com	0a7e079ab0e2c73f541abc9aa803e893	swathidasari@webnish.com	12357	\N	2017-07-03 10:49:40.910001	2017-08-11 09:53:17.557833	\N	false	Deactivated	2	9148599591	000	1993-01-27	232625314170
423	Mr	ASHOK	PALETI	KUMAR	BPUPP2837J	PY/BOM/46370/349642	Male	Married	1984-06-03	2017-07-05	3	8147886479	ashokkumar.p@webnish.com	69e8d364c8fea15f4ac0425d4513a262	s.arunlobo@webnish.com		\N	2017-07-07 10:08:21.495893	2017-08-16 11:20:25.812093	\N	false	Deactivated	2	9008077710	0	1984-06-03	345308671565
416	Ms	peddareddygari	reddy	aishwarya	BEGPA2187F		Female	Unmarried	1992-06-04	2017-07-03	3	9743880684	aiswarya.p@webnish.com	fd9708b27fd78485841d25fbc974786c	swathidasari@webnish.com	12358	\N	2017-07-03 10:49:00.112942	2017-08-07 09:11:11.182965	a53221fe	false	Active	2	9148599594		\N	592801172642
421	Mr	Vinod	J	Kumar	BFEPJ0010D		Male	Unmarried	1992-01-16	2017-07-03	3	9742243556	vinodkumar.j@kreatio.com	5f9f0cbd6e3144de64dbea441690d175	rabindrak@krestio.com	12353	\N	2017-07-04 03:52:20.613131	2017-07-05 15:44:29.408299	8e9a7759	false	Active	1			1992-01-16	910662494158
422	Mr	SANTHOS	REDDY	KUMAR	BAFPR6705M		Male	Unmarried	1989-08-10	2017-07-05	3	09059549042	santhoshkumar.k@webnish.com	645d48874bb3bd758488f1696b829cc5	sarunlobo@webnish.com	12360	\N	2017-07-06 09:10:09.971459	2017-07-06 10:18:15.765109	\N	false	Active	2		1094/92553/21491	1988-08-24	302863410184
413	Mr	Selva kumar			ENEPS2343F		Male	Unmarried	1992-06-10	2017-06-01	3	9894866432	selvakumar.m@webnish.com	badd574d0572ca2a4a582e3584e3bb7a	michael@webnish.com	12348	\N	2017-06-01 06:48:58.840202	2017-07-07 06:03:46.661784	\N	false	Active	2		101052784045	1992-06-10	956424021369
407	Mr	Chitimineni	Manikanta		BBQPC2731Q		Male	Unmarried	1992-07-19	2017-05-15	3	8143704092	manikanta.c@kreatio.com	45f3ed49b307eadbfbc17c1f720edccf	rabindrak@kreatio.com	12344	\N	2017-05-15 09:25:10.096452	2017-07-11 18:21:03.227291	\N	false	Active	1		101106937680	1992-02-22	254359514730
418	Mr	G	CHANDAR	BHANU	BKTPG7797J		Male	Unmarried	1993-05-08	2017-07-03	3	8686823404	bhanuchandar.g@kreatio.com	df928382e80f6e10b9d8239ccfefdd82	rabindrak@kreatio.com		\N	2017-07-04 03:51:24.626871	2017-07-11 04:59:18.266529	\N	false	Active	1			1993-05-08	296362439881
397	Mr	Rajeev		CS	BTKPR9815C		Male	Unmarried	1993-11-12	2017-04-14	3	9972512878	rajeev.cs@webnish.com	b808a5a228865001e791e1a6e11897b6	sarunlobo@webnish.com	12335	\N	2017-04-14 11:32:43.834572	2017-07-31 12:10:37.291851	\N	false	Deactivated	2	9343512878		1993-11-12	953738037817
424	Mr	Vaideshwaran 	R		AYNPV3435F		Male	Unmarried	1995-08-27	2017-07-11	3	9790518383	vaideshwaran.r@kreatio.com	544f76162bf446689f46ea13c88aaf31	hr@kreatio.com	12362	\N	2017-07-19 10:31:58.562174	2017-07-21 10:56:12.918493	\N	false	Active	1			1995-08-27	658637510974
437	Mr	Mohammed	Nayeem		ATCPN8995L		Male	Unmarried	1994-05-16	2017-07-13	3	9663435401	mohammed.nayeem@kreatio.com	b21aeae82f5ae2019c20f9e3888445ae	hr@kreatio.com		\N	2017-07-19 10:35:29.812179	2017-07-21 09:52:48.766227	\N	false	Active	1			1994-05-16	610466254086
341	Ms	nimmakayala	lakshmi	naga	AIOPN7520J		Female	Unmarried	1985-01-09	2016-08-29	3	9035412411	nagalakshmi@webnish.com	d44b017158cd2e9f9d45aa9c34687455	sarunlobo@webnish.com	12288	\N	2016-09-01 10:28:33.228957	2017-07-24 13:15:20.731628	59060696	true	Active	2			\N	381625714433
438	Ms	Shruti			HOHPS3417H		Female	Unmarried	1992-04-18	2017-07-13	3	8095254538	shruti@kreatio.com	aafecdca052ddc0dad543f18a310b7c7	hr@kreatio.com	12377	\N	2017-07-19 10:35:43.280699	2017-07-27 10:04:23.079429	\N	false	Active	1			1993-04-18	423324559927
427	Ms	Kushboo	A S		FQWPK3056F		Female	Unmarried	1994-11-22	2017-07-11	3	9945365054	kushboo.as@kreatio.com	9eb225c4dc1d6fa172b18b23be445ebc	presitprakesh@kreatio.com	12365	\N	2017-07-19 10:32:44.889788	2017-08-14 04:47:25.312742	\N	false	Active	1	9945365054		1994-11-22	285397187739
251	Mr	Harish	Jarra	Naidu	AWMPN7607A	PY/BOM/60812/197	Male	Unmarried	1992-01-01	2015-07-09	3	9490373088	harishnaidu@kreatio.com	c1542e1ee81cc4876e7cea1a215e01dc	sumitha@kreatio.com	12200	\N	2015-07-09 13:33:40.108113	2017-07-24 13:06:04.812907	682f1818	false	Active	1	9490373088		1991-11-27	847693798955
433	Mr	Flyan	Fernandes	Joseph	ACJPF3620N		Male	Unmarried	1992-12-03	2017-07-11	3	8698515060	flyan.fernandes@kreatio.com	b7bc9b8da330abd2b235664a0422b60f	swapnil@kreatio.com	12372	\N	2017-07-19 10:34:16.242522	2017-07-25 06:08:17.189378	\N	false	Active	1	8698515060		1992-12-03	646360391808
432	Mr	Sharan	P T	Titto	BGJPT6786J		Male	Unmarried	1993-12-24	2017-07-11	3	9497090160	sharan.titto@kreatio.com	70620929e028d1401b4618755cac12d4	swapnil@kreatio.com	12371	\N	2017-07-19 10:34:02.136747	2017-07-21 10:57:50.744689	\N	false	Active	1			1993-12-24	573512818282
428	Mr	BharathRam					Male	Unmarried	1997-04-20	2017-07-11	3	8903055416	bharathram.m@kreatio.com	982b47ad38be4b24c76a8d364ed09239	hr@kreatio.com	12366	\N	2017-07-19 10:32:59.059655	2017-07-21 09:35:14.874661	\N	false	Active	1	8903055416		1997-04-20	768246927459
442	Mr	Eswaramoorthi	Balasubramanian		ACMPE7508D		Male	Unmarried	2017-03-24	2017-08-07	3	8760291214	eswaramoorthi.b@webnish.com	392fa944981079ee9cc111518b094076	eswaramoorthi94cse@gmail.com	12383	\N	2017-08-08 11:48:49.204611	2017-08-10 06:24:59.29473	\N	false	Active	2	9715519376		\N	383378138758
435	Mr	Venkatesh	S		ARHPV3980A		Male	Unmarried	1993-06-14	2017-07-13	3	9164665993	venkatesh.s@kreatio.com	361595b0dde5e50137ffc5582a3371b3	hr@kreatio.com	12374	\N	2017-07-19 10:34:54.071532	2017-07-24 09:01:31.846474	\N	false	Active	1			1993-02-09	672482699728
366	Mr	Venkateswara	Murapureddy	Reddy	BQBPR6292M	PY/BOM/60812/299	Male	Unmarried	1993-06-14	2016-11-07	3	7893847511	venkateswara@kreatio.com	2b62ff37392387551c20c959f6c8f148	sumitha@kreatio.com	12303	\N	2016-11-08 11:04:58.433587	2017-07-25 05:28:20.906003	\N	false	Active	1			1992-10-06	767656026976
325	Ms	Nisarga	J		BCBPN1462R	PY/BOM/60812/268	Female	Unmarried	1994-05-18	2016-08-01	3	9742608636	nisarga@kreatio.com	e85f2b04012e452dcfb533bc4b308dd1	presithprakash@kreatio.com	12267	\N	2016-08-08 10:28:15.670063	2017-07-25 09:28:33.766524	ee9c99b3	false	Active	1	9742608636	100917805423	\N	9894 8870 3866
429	Mr	Vimalan 	E		ASWPV3666M		Male	Unmarried	1995-05-30	2017-07-11	3	7305561358	vimalan.e@kreatio.com	b7464e07fc692071c29a4cd87506635b	hr@kreatio.com	12367	\N	2017-07-19 10:33:15.872621	2017-07-27 04:06:46.395121	\N	false	Active	1			1995-05-30	858877988870
291	Mr	Sreerag	A V		EQGPS1651M		Male	Unmarried	1993-09-01	2016-02-18	3	8792119580	sreerag@kreatio.com	5dd7b8b097a739e7a3ef5fc8319df654	aditya.agrawal@kreatio.com	12225	\N	2016-02-18 12:25:14.198026	2017-08-03 06:13:17.946722	\N	false	Active	1			\N	499700799482
317	Mr	Venkata Pavan Chandra Mouli	Vallabhaneni		BHJPC7405A	PY/BOM/60812/236	Male	Unmarried	1995-07-07	2016-06-09	3	09959699994	chandramouli@kreatio.com	2fecbb81232af22577cc83ec195e5d2b	aditya.agrawal@kreatio.com	12239	\N	2016-06-09 09:26:17.79481	2017-07-27 13:50:20.826488	\N	false	Active	1	8892434929	100911393496	1994-07-07	526371228687
444	Mr	Abhinandan	Kumar		EBEPK6881C		Male	Unmarried	1994-02-27	2017-08-08	3	9564807615	abhinandan.kumar@webnish.com	4b1920fec8aa5aaded84fedc8a38456c	arunkumar@webnish.com	12384	\N	2017-08-08 11:49:48.936255	2017-08-08 12:52:49.961573	73d3fb4c	false	Active	2			1994-02-27	288560073894
440	Mr	Devaram	Kanth	Chandra	AVJPC2254Q		Male	Unmarried	1991-04-15	2017-06-15	3	9849269677	chandrakanth.d@webnish.com	ab351c4c8aa3f18786b00735b059080b	sarunlobo@webnish.com		\N	2017-07-31 06:49:27.002559	2017-07-31 09:31:46.186861	\N	false	Active	2		101128795181	1991-04-15	
434	Ms	Merlin	Antony		CUGPM0226E		Female	Unmarried	1994-01-31	2017-07-11	3	8951995429	merlin.antony@kreatio.com	5aa60d4276c208b6350db1cec84859cc	gandharv.rawat@kreatio.com	12373	\N	2017-07-19 10:34:30.041018	2017-08-01 05:05:05.362317	\N	false	Active	1			1994-01-31	787530125987
249	Mr	A.Mohammed	Hakkim	Fazil	CIFPM6343B	PY/BOM/60812/196	Male	Unmarried	1993-08-20	2015-06-08	3	9600740796	amohammed@kreatio.com	53858d5b754b0fc4fb2126356b5b7703	aditya.agrawal@kreatio.com	12199	hr@kreatio.com	2015-06-23 04:42:37.547248	2017-08-01 12:14:04.350375	4009d59d	false	Active	1	9600740796	100833189329	1993-08-20	304737721233
441	Mr	kishore		vishnu	DEDPP5457L		Male	Unmarried	1990-01-03	2017-08-03	3	7899172762	kishore.v@webnish.com	33c186bc0c752665456d836602671f74	sarunlobo@webnish.com		\N	2017-08-08 11:48:27.168353	2017-08-08 13:04:49.024741	e8a8ef53	false	Active	2			1990-01-03	665664912178
445	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	jayaprakash.asokan@kreatio.com	e4f699c83896a02c4d616dd5b4d4b82e	\N	\N	\N	2017-08-17 06:24:44.520048	2017-08-17 07:31:45.930467	\N	false	Active	1	\N	\N	\N	\N
439	Mr	Arun	Varghese		AJPPV9275J		Male	Unmarried	1988-02-03	2017-07-24	1	8056209544	arun.varghese@kreatio.com	a0ffadaed9776b3d7a4d8a7081ab7464	senthilkumar@kreatio.com		\N	2017-07-26 06:40:56.537608	2017-08-08 14:11:51.140433	\N	false	Active	1		100091063412	1988-02-03	512637418349
446	Ms	Ramya			BIEPR3971C		Female	Unmarried	1993-05-30	2017-08-18	3	9739557627	ramya.g@kreatio.com	d3e93c66b5d9c9cca82a960820c0d460	senthilkumar@kreatio.com		\N	2017-08-17 06:24:56.890204	2017-08-17 11:14:41.329624	\N	false	Active	1			1993-08-23	528350435051
443	Mr	Abhijith.S			BWXPA6264L		Male	Unmarried	1995-02-13	2017-08-09	3	8050720492	abhijith.s@webnish.com	b78809a040900c690cd12468ff87f471	swathidasari@webnish.com		\N	2017-08-08 11:49:25.627852	2017-08-09 04:31:03.085347	\N	false	Active	2			1995-02-13	718741040128
430	Ms	Lavita	Misquith	Shoba	DAAPM2220K		Female	Unmarried	1994-09-03	2017-07-11	3	7760072773	lavita.misquith@kreatio.com	f392c3595dc1bc6453b3edf2d84c7111	ramaprasad@kreatio.com	12369	\N	2017-07-19 10:33:33.479477	2017-08-09 04:47:20.902332	\N	false	Active	1			1994-09-03	708555748833
\.


--
-- Name: employee_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_details_id_seq', 446, true);


--
-- Data for Name: leave_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY leave_details (id, employee_detail_id, leave_type_id, total_leaves, balance, availed, carry_forward, year, total_leave_balance, created_at, updated_at) FROM stdin;
2	2	1	5	5	0	0	2012	5	\N	\N
3	2	2	15	15	0	0	2012	15	\N	\N
4	2	3	7	7	0	0	2012	7	\N	\N
5	2	4	7	7	0	0	2012	7	\N	\N
6	2	5	5	5	0	0	2012	5	\N	\N
7	2	6	84	84	0	0	2012	84	\N	\N
8	2	7	7	7	0	0	2012	7	\N	\N
9	2	8	5	5	0	0	2012	5	\N	\N
10	2	9	0	0	0	0	2012	0	\N	\N
19	3	9	0	0	0	0	2012	0	\N	\N
16	3	6	84	0	0	0	2012	0	\N	\N
20	4	1	5	5	0	0	2012	5	\N	\N
21	4	2	15	15	0	0	2012	15	\N	\N
22	4	3	7	7	0	0	2012	7	\N	\N
23	4	4	7	7	0	0	2012	7	\N	\N
24	4	5	5	5	0	0	2012	5	\N	\N
26	4	7	7	7	0	0	2012	7	\N	\N
27	4	8	5	5	0	0	2012	5	\N	\N
28	4	9	0	0	0	0	2012	0	\N	\N
25	4	6	84	0	0	0	2012	0	\N	\N
29	5	1	5	5	0	0	2012	5	\N	\N
30	5	2	15	15	0	0	2012	15	\N	\N
31	5	3	7	7	0	0	2012	7	\N	\N
32	5	4	7	7	0	0	2012	7	\N	\N
33	5	5	5	5	0	0	2012	5	\N	\N
35	5	7	7	7	0	0	2012	7	\N	\N
36	5	8	5	5	0	0	2012	5	\N	\N
37	5	9	0	0	0	0	2012	0	\N	\N
34	5	6	84	0	0	0	2012	0	\N	\N
11	3	1	5	4	0	0	2012	4	\N	\N
12	3	2	15	10	0	0	2012	10	\N	\N
13	3	3	7	5	0	0	2012	5	\N	\N
14	3	4	7	5	0	0	2012	5	\N	\N
15	3	5	5	4	0	0	2012	4	\N	\N
17	3	7	7	5	0	0	2012	5	\N	\N
18	3	8	5	4	0	0	2012	4	\N	\N
38	6	1	5	5	0	0	2012	5	\N	\N
39	6	2	15	15	0	0	2012	15	\N	\N
40	6	3	7	7	0	0	2012	7	\N	\N
41	6	4	7	7	0	0	2012	7	\N	\N
42	6	5	5	5	0	0	2012	5	\N	\N
44	6	7	7	7	0	0	2012	7	\N	\N
45	6	8	5	5	0	0	2012	5	\N	\N
46	6	9	0	0	0	0	2012	0	\N	\N
43	6	6	84	0	0	0	2012	0	\N	\N
47	7	1	5	5	0	0	2012	5	\N	\N
49	7	3	7	7	0	0	2012	7	\N	\N
50	7	4	7	7	0	0	2012	7	\N	\N
51	7	5	5	5	0	0	2012	5	\N	\N
53	7	7	7	7	0	0	2012	7	\N	\N
54	7	8	5	5	0	0	2012	5	\N	\N
55	7	9	0	0	0	0	2012	0	\N	\N
52	7	6	84	0	0	0	2012	0	\N	\N
48	7	2	15	13	2	0	2012	15	\N	\N
56	8	1	5	5	0	0	2012	5	\N	\N
57	8	2	15	15	0	0	2012	15	\N	\N
58	8	3	7	7	0	0	2012	7	\N	\N
59	8	4	7	7	0	0	2012	7	\N	\N
60	8	5	5	5	0	0	2012	5	\N	\N
62	8	7	7	7	0	0	2012	7	\N	\N
63	8	8	5	5	0	0	2012	5	\N	\N
64	8	9	0	0	0	0	2012	0	\N	\N
61	8	6	84	0	0	0	2012	0	\N	\N
65	9	1	5	5	0	0	2012	5	\N	\N
66	9	2	15	15	0	0	2012	15	\N	\N
67	9	3	7	7	0	0	2012	7	\N	\N
68	9	4	7	7	0	0	2012	7	\N	\N
69	9	5	5	5	0	0	2012	5	\N	\N
70	9	6	84	84	0	0	2012	84	\N	\N
72	9	8	5	5	0	0	2012	5	\N	\N
73	9	9	0	0	0	0	2012	0	\N	\N
71	9	7	7	0	0	0	2012	0	\N	\N
74	10	1	5	5	0	0	2012	5	\N	\N
79	10	6	84	0	0	0	2012	0	\N	\N
83	11	1	5	5	0	0	2012	5	\N	\N
86	11	4	7	7	0	0	2012	7	\N	\N
77	10	4	7	7	0	0	2012	7	\N	\N
78	10	5	5	5	0	0	2012	5	\N	\N
82	10	9	0	0	2	0	2012	2	\N	\N
80	10	7	7	0	0	0	2012	0	\N	\N
84	11	2	15	9	0	0	2012	9	\N	\N
76	10	3	7	7	0	0	2012	7	\N	\N
85	11	3	7	6	0	0	2012	6	\N	\N
87	11	5	5	3.5	0	0	2012	3.5	\N	\N
89	11	7	7	0	0	0	2012	0	\N	\N
90	11	8	5	4	0	0	2012	4	\N	\N
81	10	8	5	0	1	0	2012	1	\N	\N
91	11	9	0	0	0	0	2012	0	\N	\N
88	11	6	84	0	0	0	2012	0	\N	\N
100	12	9	0	0	0	0	2012	0	\N	\N
98	12	7	7	0	0	0	2012	0	\N	\N
103	13	3	7	7	0	0	2012	7	\N	\N
104	13	4	7	7	0	0	2012	7	\N	\N
109	13	9	0	0	0	0	2012	0	\N	\N
107	13	7	7	0	0	0	2012	0	\N	\N
102	13	2	15	6	0	0	2012	6	\N	\N
106	13	6	84	0	0	0	2012	0	\N	\N
113	14	4	7	7	0	0	2012	7	\N	\N
115	14	6	84	0	0	0	2012	0	\N	\N
110	14	1	5	3	0	0	2012	3	\N	\N
111	14	2	15	8	0	0	2012	8	\N	\N
112	14	3	7	5	0	0	2012	5	\N	\N
114	14	5	5	4	0	0	2012	4	\N	\N
116	14	7	7	0	0	0	2012	0	\N	\N
117	14	8	5	3	0	0	2012	3	\N	\N
118	14	9	0	0	0	0	2012	0	\N	\N
123	15	5	5	5	0	0	2012	5	\N	\N
127	15	9	0	0	0	0	2012	0	\N	\N
124	15	6	84	0	0	0	2012	0	\N	\N
119	15	1	5	0	0	0	2012	0	\N	\N
120	15	2	15	0	0	0	2012	0	\N	\N
121	15	3	7	2	0	0	2012	2	\N	\N
122	15	4	7	2	0	0	2012	2	\N	\N
125	15	7	7	0	0	0	2012	0	\N	\N
126	15	8	5	3	0	0	2012	3	\N	\N
130	16	3	7	7	0	0	2012	7	\N	\N
131	16	4	7	7	0	0	2012	7	\N	\N
136	16	9	0	0	0	0	2012	0	\N	\N
133	16	6	84	0	0	0	2012	0	\N	\N
128	16	1	5	3	0	0	2012	3	\N	\N
129	16	2	15	0	0	0	2012	0	\N	\N
132	16	5	5	0	0	0	2012	0	\N	\N
134	16	7	7	0	0	0	2012	0	\N	\N
135	16	8	5	3	0	0	2012	3	\N	\N
137	17	1	5	5	0	0	2012	5	\N	\N
140	17	4	7	7	0	0	2012	7	\N	\N
145	17	9	0	0	0	0	2012	0	\N	\N
142	17	6	84	0	0	0	2012	0	\N	\N
138	17	2	15	9	0	0	2012	9	\N	\N
139	17	3	7	6	0	0	2012	6	\N	\N
141	17	5	5	4	0	0	2012	4	\N	\N
143	17	7	7	0	0	0	2012	0	\N	\N
144	17	8	5	4	0	0	2012	4	\N	\N
148	18	3	7	7	0	0	2012	7	\N	\N
149	18	4	7	7	0	0	2012	7	\N	\N
154	18	9	0	0	0	0	2012	0	\N	\N
151	18	6	84	0	0	0	2012	0	\N	\N
146	18	1	5	0	0	0	2012	0	\N	\N
147	18	2	15	8	0	0	2012	8	\N	\N
150	18	5	5	3	0	0	2012	3	\N	\N
152	18	7	7	0	0	0	2012	0	\N	\N
153	18	8	5	1	0	0	2012	1	\N	\N
155	19	1	5	5	0	0	2012	5	\N	\N
156	19	2	15	15	0	0	2012	15	\N	\N
157	19	3	7	7	0	0	2012	7	\N	\N
158	19	4	7	7	0	0	2012	7	\N	\N
159	19	5	5	5	0	0	2012	5	\N	\N
161	19	7	7	7	0	0	2012	7	\N	\N
162	19	8	5	5	0	0	2012	5	\N	\N
163	19	9	0	0	0	0	2012	0	\N	\N
160	19	6	84	0	0	0	2012	0	\N	\N
166	20	3	7	7	0	0	2012	7	\N	\N
167	20	4	7	7	0	0	2012	7	\N	\N
172	20	9	0	0	0	0	2012	0	\N	\N
169	20	6	84	0	0	0	2012	0	\N	\N
164	20	1	5	0	0	0	2012	0	\N	\N
165	20	2	15	5	0	0	2012	5	\N	\N
168	20	5	5	4	0	0	2012	4	\N	\N
170	20	7	7	0	0	0	2012	0	\N	\N
171	20	8	5	2	0	0	2012	2	\N	\N
173	21	1	5	5	0	0	2012	5	\N	\N
174	21	2	15	15	0	0	2012	15	\N	\N
175	21	3	7	7	0	0	2012	7	\N	\N
176	21	4	7	7	0	0	2012	7	\N	\N
177	21	5	5	5	0	0	2012	5	\N	\N
105	13	5	5	1.5	0	0	2012	1.5	\N	\N
108	13	8	5	3	0	0	2012	3	\N	\N
92	12	1	5	2.5	0	0	2012	2.5	\N	\N
93	12	2	15	6	0	0	2012	6	\N	\N
94	12	3	7	7	0	0	2012	7	\N	\N
95	12	4	7	7	0	0	2012	7	\N	\N
96	12	5	5	1.5	0	0	2012	1.5	\N	\N
99	12	8	5	3	0	0	2012	3	\N	\N
97	12	6	84	84	0	0	2012	84	\N	\N
178	21	6	84	84	0	0	2012	84	\N	\N
180	21	8	5	5	0	0	2012	5	\N	\N
181	21	9	0	0	0	0	2012	0	\N	\N
179	21	7	7	0	0	0	2012	0	\N	\N
184	22	3	7	7	0	0	2012	7	\N	\N
185	22	4	7	7	0	0	2012	7	\N	\N
190	22	9	0	0	0	0	2012	0	\N	\N
188	22	7	7	0	0	0	2012	0	\N	\N
182	22	1	5	2	0	0	2012	2	\N	\N
183	22	2	15	4	0	0	2012	4	\N	\N
186	22	5	5	2	0	0	2012	2	\N	\N
187	22	6	84	0	0	0	2012	0	\N	\N
189	22	8	5	2	0	0	2012	2	\N	\N
193	23	3	7	7	0	0	2012	7	\N	\N
198	23	8	5	5	0	0	2012	5	\N	\N
199	23	9	0	0	0	0	2012	0	\N	\N
196	23	6	84	0	0	0	2012	0	\N	\N
191	23	1	5	4	0	0	2012	4	\N	\N
192	23	2	15	12	0	0	2012	12	\N	\N
194	23	4	7	0	0	0	2012	0	\N	\N
195	23	5	5	4	0	0	2012	4	\N	\N
197	23	7	7	0	0	0	2012	0	\N	\N
202	24	3	7	7	0	0	2012	7	\N	\N
203	24	4	7	7	0	0	2012	7	\N	\N
204	24	5	5	5	0	0	2012	5	\N	\N
207	24	8	5	5	0	0	2012	5	\N	\N
208	24	9	0	0	0	0	2012	0	\N	\N
205	24	6	84	0	0	0	2012	0	\N	\N
200	24	1	5	4	0	0	2012	4	\N	\N
201	24	2	15	3	0	0	2012	3	\N	\N
206	24	7	7	0	0	0	2012	0	\N	\N
211	25	3	7	7	0	0	2012	7	\N	\N
212	25	4	7	7	0	0	2012	7	\N	\N
217	25	9	0	0	0	0	2012	0	\N	\N
214	25	6	84	0	0	0	2012	0	\N	\N
209	25	1	5	3	0	0	2012	3	\N	\N
210	25	2	15	5	0	0	2012	5	\N	\N
213	25	5	5	2	0	0	2012	2	\N	\N
215	25	7	7	0	0	0	2012	0	\N	\N
216	25	8	5	3	0	0	2012	3	\N	\N
220	26	3	7	7	0	0	2012	7	\N	\N
221	26	4	7	7	0	0	2012	7	\N	\N
226	26	9	0	0	0	0	2012	0	\N	\N
223	26	6	84	0	0	0	2012	0	\N	\N
218	26	1	5	4	0	0	2012	4	\N	\N
219	26	2	15	7	0	0	2012	7	\N	\N
222	26	5	5	2	0	0	2012	2	\N	\N
224	26	7	7	0	0	0	2012	0	\N	\N
225	26	8	5	3	0	0	2012	3	\N	\N
229	27	3	7	7	0	0	2012	7	\N	\N
232	27	6	84	0	0	0	2012	0	\N	\N
227	27	1	5	2	0	0	2012	2	\N	\N
228	27	2	15	8	0	0	2012	8	\N	\N
230	27	4	7	6	0	0	2012	6	\N	\N
231	27	5	5	4	0	0	2012	4	\N	\N
235	27	9	0	0	0	0	2012	0	\N	\N
233	27	7	7	0	0	0	2012	0	\N	\N
234	27	8	5	3	0	0	2012	3	\N	\N
239	28	4	7	7	0	0	2012	7	\N	\N
244	28	9	0	0	0	0	2012	0	\N	\N
241	28	6	84	0	0	0	2012	0	\N	\N
236	28	1	5	3	0	0	2012	3	\N	\N
238	28	3	7	1	0	0	2012	1	\N	\N
242	28	7	7	0	0	0	2012	0	\N	\N
247	29	3	7	7	0	0	2012	7	\N	\N
248	29	4	7	7	0	0	2012	7	\N	\N
250	29	6	84	0	0	0	2012	0	\N	\N
251	29	7	7	0	0	0	2012	0	\N	\N
262	30	9	0	0	0	0	2012	0	\N	\N
259	30	6	84	0	0	0	2012	0	\N	\N
258	30	5	5	2	0	0	2012	2	\N	\N
260	30	7	7	0	0	0	2012	0	\N	\N
271	31	9	0	0	0	0	2012	0	\N	\N
268	31	6	84	0	0	0	2012	0	\N	\N
263	31	1	5	3	0	0	2012	3	\N	\N
261	30	8	5	1	1	0	2012	2	\N	\N
256	30	3	7	4	0	0	2012	4	\N	\N
257	30	4	7	3	0	0	2012	3	\N	\N
254	30	1	5	1	1	0	2012	2	\N	\N
253	29	9	0	2	0	0	2012	2	\N	\N
252	29	8	5	-63	64	0	2012	1	\N	\N
237	28	2	15	-1	11	0	2012	10	\N	\N
255	30	2	15	5	1	0	2012	6	\N	\N
240	28	5	5	4	1	0	2012	5	\N	\N
245	29	1	5	3.5	0.5	0	2012	4	\N	\N
249	29	5	5	3.5	1.5	0	2012	5	\N	\N
246	29	2	15	-114	119	0	2012	5	\N	\N
266	31	4	7	4	0	0	2012	4	\N	\N
269	31	7	7	0	0	0	2012	0	\N	\N
274	32	3	7	7	0	0	2012	7	\N	\N
277	32	6	84	0	0	0	2012	0	\N	\N
273	32	2	15	0	0	0	2012	0	\N	\N
275	32	4	7	2	0	0	2012	2	\N	\N
283	33	3	7	7	0	0	2012	7	\N	\N
284	33	4	7	7	0	0	2012	7	\N	\N
285	33	5	5	5	0	0	2012	5	\N	\N
289	33	9	0	0	0	0	2012	0	\N	\N
286	33	6	84	0	0	0	2012	0	\N	\N
287	33	7	7	0	0	0	2012	0	\N	\N
298	34	9	0	0	0	0	2012	0	\N	\N
295	34	6	84	0	0	0	2012	0	\N	\N
296	34	7	7	0	0	0	2012	0	\N	\N
301	35	3	7	7	0	0	2012	7	\N	\N
302	35	4	7	7	0	0	2012	7	\N	\N
304	35	6	84	0	0	0	2012	0	\N	\N
310	36	3	7	7	0	0	2012	7	\N	\N
311	36	4	7	7	0	0	2012	7	\N	\N
316	36	9	0	0	0	0	2012	0	\N	\N
313	36	6	84	0	0	0	2012	0	\N	\N
308	36	1	5	3	0	0	2012	3	\N	\N
314	36	7	7	0	0	0	2012	0	\N	\N
315	36	8	5	4	0	0	2012	4	\N	\N
319	37	3	7	7	0	0	2012	7	\N	\N
320	37	4	7	7	0	0	2012	7	\N	\N
321	37	5	5	5	0	0	2012	5	\N	\N
322	37	6	84	0	0	0	2012	0	\N	\N
318	37	2	15	2	0	0	2012	2	\N	\N
323	37	7	7	0	0	0	2012	0	\N	\N
328	38	3	7	7	0	0	2012	7	\N	\N
329	38	4	7	7	0	0	2012	7	\N	\N
334	38	9	0	0	0	0	2012	0	\N	\N
331	38	6	84	0	0	0	2012	0	\N	\N
332	38	7	7	0	0	0	2012	0	\N	\N
337	39	3	7	7	0	0	2012	7	\N	\N
339	39	5	5	5	0	0	2012	5	\N	\N
343	39	9	0	0	0	0	2012	0	\N	\N
340	39	6	84	0	0	0	2012	0	\N	\N
335	39	1	5	4	0	0	2012	4	\N	\N
336	39	2	15	9	0	0	2012	9	\N	\N
338	39	4	7	0	0	0	2012	0	\N	\N
341	39	7	7	0	0	0	2012	0	\N	\N
342	39	8	5	4	0	0	2012	4	\N	\N
344	40	1	5	5	0	0	2012	5	\N	\N
346	40	3	7	7	0	0	2012	7	\N	\N
347	40	4	7	7	0	0	2012	7	\N	\N
352	40	9	0	0	0	0	2012	0	\N	\N
349	40	6	84	0	0	0	2012	0	\N	\N
345	40	2	15	3	0	0	2012	3	\N	\N
350	40	7	7	0	0	0	2012	0	\N	\N
351	40	8	5	4	0	0	2012	4	\N	\N
356	41	4	7	7	0	0	2012	7	\N	\N
293	34	4	7	7	0	0	2012	7	\N	\N
294	34	5	5	4	0	0	2012	4	\N	\N
327	38	2	15	1	1	0	2012	2	\N	\N
279	32	8	5	0	2	0	2012	2	\N	\N
292	34	3	7	7	0	0	2012	7	\N	\N
307	35	9	0	1	0	0	2012	1	\N	\N
281	33	1	5	0.5	0	0	2012	0.5	\N	\N
300	35	2	15	3	0	0	2012	3	\N	\N
306	35	8	5	2	0	0	2012	2	\N	\N
325	37	9	0	1	0	0	2012	1	\N	\N
309	36	2	15	1	0	0	2012	1	\N	\N
312	36	5	5	4.5	0	0	2012	4.5	\N	\N
326	38	1	5	1.5	0	0	2012	1.5	\N	\N
333	38	8	5	0	2	0	2012	2	\N	\N
348	40	5	5	2.5	0	0	2012	2.5	\N	\N
267	31	5	5	1	1	0	2012	2	\N	\N
265	31	3	7	4	0	0	2012	4	\N	\N
270	31	8	5	0	2	0	2012	2	\N	\N
330	38	5	5	3	1	0	2012	4	\N	\N
305	35	7	7	7	0	0	2012	7	\N	\N
303	35	5	5	1	0	0	2012	1	\N	\N
280	32	9	0	0	0	0	2012	0	\N	\N
299	35	1	5	1	0	0	2012	1	\N	\N
297	34	8	5	4	1	0	2012	5	\N	\N
272	32	1	5	0	0	0	2012	0	\N	\N
288	33	8	5	5	0	0	2012	5	\N	\N
278	32	7	7	0	7	0	2012	7	\N	\N
276	32	5	5	0	0	0	2012	0	\N	\N
317	37	1	5	2.5	0.5	0	2012	3	\N	\N
282	33	2	15	4	4	0	2012	8	\N	\N
324	37	8	5	2	1	0	2012	3	\N	\N
264	31	2	15	1	6	0	2012	7	\N	\N
361	41	9	0	0	0	0	2012	0	\N	\N
358	41	6	84	0	0	0	2012	0	\N	\N
355	41	3	7	6	0	0	2012	6	\N	\N
357	41	5	5	2	0	0	2012	2	\N	\N
359	41	7	7	0	0	0	2012	0	\N	\N
360	41	8	5	3	0	0	2012	3	\N	\N
353	41	1	5	2	0	0	2012	2	\N	\N
364	42	3	7	7	0	0	2012	7	\N	\N
365	42	4	7	7	0	0	2012	7	\N	\N
367	42	6	84	0	0	0	2012	0	\N	\N
362	42	1	5	1	0	0	2012	1	\N	\N
363	42	2	15	8	0	0	2012	8	\N	\N
366	42	5	5	3	0	0	2012	3	\N	\N
368	42	7	7	0	0	0	2012	0	\N	\N
373	43	3	7	7	0	0	2012	7	\N	\N
374	43	4	7	7	0	0	2012	7	\N	\N
379	43	9	0	0	0	0	2012	0	\N	\N
376	43	6	84	0	0	0	2012	0	\N	\N
372	43	2	15	0	0	0	2012	0	\N	\N
378	43	8	5	3	0	0	2012	3	\N	\N
383	44	4	7	7	0	0	2012	7	\N	\N
384	44	5	5	5	0	0	2012	5	\N	\N
388	44	9	0	0	0	0	2012	0	\N	\N
385	44	6	84	0	0	0	2012	0	\N	\N
382	44	3	7	4	0	0	2012	4	\N	\N
386	44	7	7	0	0	0	2012	0	\N	\N
394	45	6	84	0	0	0	2012	0	\N	\N
395	45	7	7	0	0	0	2012	0	\N	\N
400	46	3	7	7	0	0	2012	7	\N	\N
401	46	4	7	7	0	0	2012	7	\N	\N
406	46	9	0	0	0	0	2012	0	\N	\N
403	46	6	84	0	0	0	2012	0	\N	\N
398	46	1	5	0	0	0	2012	0	\N	\N
402	46	5	5	3	0	0	2012	3	\N	\N
404	46	7	7	0	0	0	2012	0	\N	\N
410	47	4	7	7	0	0	2012	7	\N	\N
415	47	9	0	0	0	0	2012	0	\N	\N
412	47	6	84	0	0	0	2012	0	\N	\N
413	47	7	7	0	0	0	2012	0	\N	\N
418	48	3	7	7	0	0	2012	7	\N	\N
419	48	4	7	7	0	0	2012	7	\N	\N
421	48	6	84	0	0	0	2012	0	\N	\N
422	48	7	7	0	0	0	2012	0	\N	\N
423	48	8	5	3	0	0	2012	3	\N	\N
425	49	1	5	5	0	0	2012	5	\N	\N
427	49	3	7	7	0	0	2012	7	\N	\N
428	49	4	7	7	0	0	2012	7	\N	\N
433	49	9	0	0	0	0	2012	0	\N	\N
430	49	6	84	0	0	0	2012	0	\N	\N
429	49	5	5	4	0	0	2012	4	\N	\N
436	50	3	7	7	0	0	2012	7	\N	\N
437	50	4	7	7	0	0	2012	7	\N	\N
439	50	6	84	0	0	0	2012	0	\N	\N
440	50	7	7	0	0	0	2012	0	\N	\N
405	46	8	5	2	0	0	2012	2	\N	\N
399	46	2	15	0	11	0	2012	11	\N	\N
416	48	1	5	1.5	0	0	2012	1.5	\N	\N
417	48	2	15	11	0	0	2012	11	\N	\N
420	48	5	5	1.5	0	0	2012	1.5	\N	\N
438	50	5	5	1.5	1	0	2012	2.5	\N	\N
390	45	2	15	11	0	0	2012	11	\N	\N
391	45	3	7	7	0	0	2012	7	\N	\N
392	45	4	7	7	0	0	2012	7	\N	\N
393	45	5	5	5	0	0	2012	5	\N	\N
396	45	8	5	5	0	0	2012	5	\N	\N
414	47	8	5	2	2	0	2012	4	\N	\N
389	45	1	5	5	0	0	2012	5	\N	\N
426	49	2	15	2	0	0	2012	2	\N	\N
432	49	8	5	2	0	0	2012	2	\N	\N
411	47	5	5	3.5	0	0	2012	3.5	\N	\N
371	43	1	5	3.5	0.5	0	2012	4	\N	\N
369	42	8	5	4	0	0	2012	4	\N	\N
431	49	7	7	7	0	0	2012	7	\N	\N
397	45	9	0	1	0	0	2012	1	\N	\N
424	48	9	0	1	0	0	2012	1	\N	\N
375	43	5	5	2	1	0	2012	3	\N	\N
408	47	2	15	4	3	0	2012	7	\N	\N
370	42	9	0	2	0	0	2012	2	\N	\N
387	44	8	5	3	2	0	2012	5	\N	\N
407	47	1	5	4	1	0	2012	5	\N	\N
442	50	9	0	0	1	0	2012	1	\N	\N
409	47	3	7	6	1	0	2012	7	\N	\N
377	43	7	7	1	6	0	2012	7	\N	\N
381	44	2	15	5	4	0	2012	9	\N	\N
434	50	1	5	3	1	0	2012	4	\N	\N
435	50	2	15	8	3	0	2012	11	\N	\N
445	51	3	7	7	0	0	2012	7	\N	\N
449	51	7	7	0	0	0	2012	0	\N	\N
458	52	7	7	0	0	0	2012	0	\N	\N
456	52	5	5	0	0	0	2012	0	\N	\N
457	52	6	84	0	0	0	2012	0	\N	\N
463	53	3	7	7	0	0	2012	7	\N	\N
464	53	4	7	7	0	0	2012	7	\N	\N
467	53	7	7	0	0	0	2012	0	\N	\N
465	53	5	5	4	0	0	2012	4	\N	\N
466	53	6	84	0	0	0	2012	0	\N	\N
473	54	4	7	4	0	0	2012	4	\N	\N
475	54	6	84	0	0	0	2012	0	\N	\N
478	54	9	0	0	0	0	2012	0	\N	\N
476	54	7	7	0	0	0	2012	0	\N	\N
484	55	6	84	0	0	0	2012	0	\N	\N
485	55	7	7	0	0	0	2012	0	\N	\N
492	56	5	5	5	0	0	2012	5	\N	\N
493	56	6	84	0	0	0	2012	0	\N	\N
489	56	2	15	0	0	0	2012	0	\N	\N
490	56	3	7	6	0	0	2012	6	\N	\N
491	56	4	7	0	0	0	2012	0	\N	\N
495	56	8	5	4	0	0	2012	4	\N	\N
499	57	3	7	7	0	0	2012	7	\N	\N
500	57	4	7	7	0	0	2012	7	\N	\N
502	57	6	84	0	0	0	2012	0	\N	\N
497	57	1	5	3	0	0	2012	3	\N	\N
503	57	7	7	0	0	0	2012	0	\N	\N
509	58	4	7	7	0	0	2012	7	\N	\N
514	58	9	0	0	0	0	2012	0	\N	\N
511	58	6	84	0	0	0	2012	0	\N	\N
507	58	2	15	0	0	0	2012	0	\N	\N
510	58	5	5	0	0	0	2012	0	\N	\N
520	59	6	84	0	0	0	2012	0	\N	\N
532	60	9	0	0	0	0	2012	0	\N	\N
529	60	6	84	0	0	0	2012	0	\N	\N
524	60	1	5	1	0	0	2012	1	\N	\N
526	60	3	7	4	0	0	2012	4	\N	\N
521	59	7	7	7	0	0	2012	7	\N	\N
470	54	1	5	3	2	0	2012	5	\N	\N
443	51	1	5	1	1	0	2012	2	\N	\N
504	57	8	5	2	0	0	2012	2	\N	\N
454	52	3	7	7	0	0	2012	7	\N	\N
455	52	4	7	7	0	0	2012	7	\N	\N
452	52	1	5	1.5	0.5	0	2012	2	\N	\N
461	53	1	5	1.5	0	0	2012	1.5	\N	\N
513	58	8	5	2	1	0	2012	3	\N	\N
462	53	2	15	6.5	0	0	2012	6.5	\N	\N
471	54	2	15	0	1	0	2012	1	\N	\N
486	55	8	5	3	1	0	2012	4	\N	\N
472	54	3	7	0	0	0	2012	0	\N	\N
481	55	3	7	7	0	0	2012	7	\N	\N
482	55	4	7	7	0	0	2012	7	\N	\N
483	55	5	5	5	0	0	2012	5	\N	\N
444	51	2	15	0	4	0	2012	4	\N	\N
488	56	1	5	4.5	0	0	2012	4.5	\N	\N
525	60	2	15	7	1	0	2012	8	\N	\N
498	57	2	15	7	2	0	2012	9	\N	\N
508	58	3	7	4	0	0	2012	4	\N	\N
527	60	4	7	4	0	0	2012	4	\N	\N
469	53	9	0	0	1	0	2012	1	\N	\N
506	58	1	5	3	0	0	2012	3	\N	\N
448	51	6	84	84	0	0	2012	84	\N	\N
494	56	7	7	7	0	0	2012	7	\N	\N
512	58	7	7	7	0	0	2012	7	\N	\N
468	53	8	5	1	1	0	2012	2	\N	\N
501	57	5	5	3.5	1	0	2012	4.5	\N	\N
505	57	9	0	1	0	0	2012	1	\N	\N
518	59	4	7	7	1	0	2012	7	\N	\N
460	52	9	0	1	0	0	2012	1	\N	\N
487	55	9	0	1	0	0	2012	1	\N	\N
496	56	9	0	1	0	0	2012	1	\N	\N
523	59	9	0	0	0	0	2012	0	\N	\N
477	54	8	5	0	1	0	2012	1	\N	\N
459	52	8	5	0	4	0	2012	4	\N	\N
519	59	5	5	5	3.5	0	2012	5	\N	\N
451	51	9	0	0	1	0	2012	1	\N	\N
441	50	8	5	0	1	0	2012	1	\N	\N
447	51	5	5	1.5	1.5	0	2012	3	\N	\N
446	51	4	7	2.5	0.5	0	2012	3	\N	\N
515	59	1	5	4	0	0	2012	4	\N	\N
479	55	1	5	4	1	0	2012	5	\N	\N
474	54	5	5	0.5	2.5	0	2012	3	\N	\N
517	59	3	7	7	1	0	2012	7	\N	\N
522	59	8	5	5	1	0	2012	5	\N	\N
453	52	2	15	0	7	0	2012	7	\N	\N
528	60	5	5	3	0	0	2012	3	\N	\N
530	60	7	7	0	0	0	2012	0	\N	\N
531	60	8	5	2	0	0	2012	2	\N	\N
541	61	9	0	0	0	0	2012	0	\N	\N
538	61	6	84	0	0	0	2012	0	\N	\N
533	61	1	5	3	0	0	2012	3	\N	\N
534	61	2	15	7	0	0	2012	7	\N	\N
535	61	3	7	4	0	0	2012	4	\N	\N
536	61	4	7	3	0	0	2012	3	\N	\N
537	61	5	5	3	0	0	2012	3	\N	\N
539	61	7	7	0	0	0	2012	0	\N	\N
540	61	8	5	2	0	0	2012	2	\N	\N
550	62	9	0	0	0	0	2012	0	\N	\N
547	62	6	84	0	0	0	2012	0	\N	\N
545	62	4	7	3	0	0	2012	3	\N	\N
548	62	7	7	0	0	0	2012	0	\N	\N
549	62	8	5	2	0	0	2012	2	\N	\N
559	63	9	0	0	0	0	2012	0	\N	\N
556	63	6	84	0	0	0	2012	0	\N	\N
554	63	4	7	3	0	0	2012	3	\N	\N
557	63	7	7	0	0	0	2012	0	\N	\N
568	64	9	0	0	0	0	2012	0	\N	\N
565	64	6	84	0	0	0	2012	0	\N	\N
562	64	3	7	3	0	0	2012	3	\N	\N
563	64	4	7	3	0	0	2012	3	\N	\N
566	64	7	7	0	0	0	2012	0	\N	\N
75	10	2	15	7	2	0	2012	9	\N	\N
101	13	1	5	2.5	0	0	2012	2.5	\N	\N
291	34	2	15	2.5	5	0	2012	7.5	\N	\N
591	67	5	5	0	3	0	2012	3	\N	\N
574	65	6	84	0	0	0	2012	0	\N	\N
516	59	2	15	15	2	0	2012	15	\N	\N
570	65	2	15	0	0	0	2012	0	\N	\N
571	65	3	7	0	0	0	2012	0	\N	\N
572	65	4	7	0.5	0	0	2012	0.5	\N	\N
573	65	5	5	0	0	0	2012	0	\N	\N
542	62	1	5	2	0	0	2012	2	\N	\N
581	66	4	7	7	0	0	2012	7	\N	\N
586	66	9	0	0	0	0	2012	0	\N	\N
583	66	6	84	0	0	0	2012	0	\N	\N
578	66	1	5	3	0	0	2012	3	\N	\N
579	66	2	15	8	0	0	2012	8	\N	\N
580	66	3	7	5	0	0	2012	5	\N	\N
582	66	5	5	3.5	0	0	2012	3.5	\N	\N
584	66	7	7	0	0	0	2012	0	\N	\N
585	66	8	5	2	0	0	2012	2	\N	\N
589	67	3	7	7	0	0	2012	7	\N	\N
590	67	4	7	7	0	0	2012	7	\N	\N
592	67	6	84	0	0	0	2012	0	\N	\N
587	67	1	5	0	0	0	2012	0	\N	\N
594	67	8	5	-1	2	0	2012	1	\N	\N
480	55	2	15	3	5	0	2012	8	\N	\N
593	67	7	7	0	0	0	2012	0	\N	\N
595	67	9	0	0	1	0	2012	1	\N	\N
598	68	3	7	7	0	0	2012	7	\N	\N
599	68	4	7	7	0	0	2012	7	\N	\N
600	68	5	5	5	0	0	2012	5	\N	\N
601	68	6	84	0	0	0	2012	0	\N	\N
569	65	1	5	2	0	0	2012	2	\N	\N
602	68	7	7	0	0	0	2012	0	\N	\N
603	68	8	5	3	0	0	2012	3	\N	\N
551	63	1	5	3	0	0	2012	3	\N	\N
552	63	2	15	6	0	0	2012	6	\N	\N
553	63	3	7	3	0	0	2012	3	\N	\N
555	63	5	5	2	0	0	2012	2	\N	\N
558	63	8	5	1	0	0	2012	1	\N	\N
560	64	1	5	3	0	0	2012	3	\N	\N
561	64	2	15	6	0	0	2012	6	\N	\N
564	64	5	5	2	0	0	2012	2	\N	\N
567	64	8	5	1	0	0	2012	1	\N	\N
543	62	2	15	6	0	0	2012	6	\N	\N
544	62	3	7	3	0	0	2012	3	\N	\N
546	62	5	5	2	0	0	2012	2	\N	\N
596	68	1	5	4	1	0	2012	5	\N	\N
576	65	8	5	2	0	0	2012	2	\N	\N
575	65	7	7	7	0	0	2012	7	\N	\N
577	65	9	0	0.5	0	0	2012	0.5	\N	\N
597	68	2	15	8	3	0	2012	11	\N	\N
243	28	8	5	0	3	0	2012	3	\N	\N
588	67	2	15	3	4	0	2012	7	\N	\N
354	41	2	15	2	10	0	2012	12	\N	\N
38933	71	3	7	7	0	0	2017	7	2017-01-02 04:46:49.291001	2017-01-02 04:46:49.291001
38934	71	4	7	7	0	0	2017	7	2017-01-02 04:46:49.300689	2017-01-02 04:46:49.300689
38935	71	5	5	1.5	3.5	0	2017	5	2017-01-02 04:46:49.310919	2017-08-16 06:40:33.929709
605	69	1	5	5	0	0	2012	5	\N	\N
606	69	2	15	15	0	0	2012	15	\N	\N
607	69	3	7	7	0	0	2012	7	\N	\N
608	69	4	7	7	0	0	2012	7	\N	\N
609	69	5	5	5	0	0	2012	5	\N	\N
610	69	6	84	84	0	0	2012	84	\N	\N
612	69	8	5	5	0	0	2012	5	\N	\N
613	69	9	0	0	0	0	2012	0	\N	\N
611	69	7	7	0	0	0	2012	0	\N	\N
616	70	3	7	7	0	0	2012	7	\N	\N
617	70	4	7	7	0	0	2012	7	\N	\N
622	70	9	0	0	0	0	2012	0	\N	\N
620	70	7	7	0	0	0	2012	0	\N	\N
614	70	1	5	3	0	0	2012	3	\N	\N
621	70	8	5	1	0	0	2012	1	\N	\N
618	70	5	5	2	0	0	2012	2	\N	\N
619	70	6	84	0	0	0	2012	0	\N	\N
677	77	1	5	2	1	0	2012	3	\N	\N
625	71	3	7	7	0	0	2012	7	\N	\N
631	71	9	0	0	0	0	2012	0	\N	\N
628	71	6	84	0	0	0	2012	0	\N	\N
669	76	2	15	7	0	0	2012	7	\N	\N
647	73	7	7	7	0	0	2012	7	\N	\N
626	71	4	7	2	0	0	2012	2	\N	\N
627	71	5	5	4	0	0	2012	4	\N	\N
633	72	2	15	0	3	0	2012	3	\N	\N
630	71	8	5	4	0	0	2012	4	\N	\N
634	72	3	7	7	0	0	2012	7	\N	\N
635	72	4	7	7	0	0	2012	7	\N	\N
636	72	5	5	5	0	0	2012	5	\N	\N
639	72	8	5	5	0	0	2012	5	\N	\N
640	72	9	0	0	0	0	2012	0	\N	\N
637	72	6	84	0	0	0	2012	0	\N	\N
632	72	1	5	4	0	0	2012	4	\N	\N
650	74	1	5	2	1	0	2012	3	\N	\N
638	72	7	7	0	0	0	2012	0	\N	\N
649	73	9	0	0	0	0	2012	0	\N	\N
646	73	6	84	0	0	0	2012	0	\N	\N
641	73	1	5	0	0	0	2012	0	\N	\N
642	73	2	15	0	0	0	2012	0	\N	\N
643	73	3	7	4	0	0	2012	4	\N	\N
644	73	4	7	1.5	0	0	2012	1.5	\N	\N
645	73	5	5	0	0	0	2012	0	\N	\N
629	71	7	7	7	0	0	2012	7	\N	\N
604	68	9	0	2	0	0	2012	2	\N	\N
652	74	3	7	7	0	0	2012	7	\N	\N
653	74	4	7	7	0	0	2012	7	\N	\N
658	74	9	0	0	0	0	2012	0	\N	\N
655	74	6	84	0	0	0	2012	0	\N	\N
657	74	8	5	1	1	0	2012	2	\N	\N
678	77	2	15	1	7	0	2012	8	\N	\N
654	74	5	5	2.5	0	0	2012	2.5	\N	\N
656	74	7	7	0	0	0	2012	0	\N	\N
651	74	2	15	-0.5	5.5	0	2012	5	\N	\N
661	75	3	7	7	0	0	2012	7	\N	\N
662	75	4	7	7	0	0	2012	7	\N	\N
667	75	9	0	0	0	0	2012	0	\N	\N
664	75	6	84	0	0	0	2012	0	\N	\N
659	75	1	5	4	0	0	2012	4	\N	\N
660	75	2	15	6	0	0	2012	6	\N	\N
663	75	5	5	1.5	0	0	2012	1.5	\N	\N
665	75	7	7	0	0	0	2012	0	\N	\N
666	75	8	5	3	0	0	2012	3	\N	\N
670	76	3	7	7	0	0	2012	7	\N	\N
676	76	9	0	0	0	0	2012	0	\N	\N
673	76	6	84	0	0	0	2012	0	\N	\N
668	76	1	5	2	0	0	2012	2	\N	\N
624	71	2	15	13	0	0	2012	13	\N	\N
671	76	4	7	6	0	0	2012	6	\N	\N
672	76	5	5	4	0	0	2012	4	\N	\N
674	76	7	7	0	0	0	2012	0	\N	\N
675	76	8	5	3	0	0	2012	3	\N	\N
680	77	4	7	7	0	0	2012	7	\N	\N
685	77	9	0	0	0	0	2012	0	\N	\N
682	77	6	84	0	0	0	2012	0	\N	\N
615	70	2	15	-1	8	0	2012	7	\N	\N
679	77	3	7	5	0	0	2012	5	\N	\N
681	77	5	5	3.5	0	0	2012	3.5	\N	\N
683	77	7	7	0	0	0	2012	0	\N	\N
684	77	8	5	2	0	0	2012	2	\N	\N
688	78	3	7	7	0	0	2012	7	\N	\N
686	78	1	5	0	0	0	2012	0	\N	\N
687	78	2	15	0	4	0	2012	4	\N	\N
623	71	1	5	3	0	0	2012	3	\N	\N
648	73	8	5	0.5	0	0	2012	0.5	\N	\N
689	78	4	7	7	0	0	2012	7	\N	\N
694	78	9	0	0	0	0	2012	0	\N	\N
692	78	7	7	0	0	0	2012	0	\N	\N
736	83	6	84	0	0	0	2012	0	\N	\N
290	34	1	5	3	1	0	2012	4	\N	\N
693	78	8	5	0	2	0	2012	2	\N	\N
703	79	9	0	0	0	0	2012	0	\N	\N
700	79	6	84	0	0	0	2012	0	\N	\N
695	79	1	5	3	0	0	2012	3	\N	\N
696	79	2	15	7	0	0	2012	7	\N	\N
697	79	3	7	4	0	0	2012	4	\N	\N
698	79	4	7	4	0	0	2012	4	\N	\N
699	79	5	5	3	0	0	2012	3	\N	\N
701	79	7	7	0	0	0	2012	0	\N	\N
704	80	1	5	3	1	0	2012	4	\N	\N
706	80	3	7	7	0	0	2012	7	\N	\N
708	80	5	5	5	0	0	2012	5	\N	\N
709	80	6	84	0	0	0	2012	0	\N	\N
705	80	2	15	7	2	0	2012	9	\N	\N
707	80	4	7	0	0	0	2012	0	\N	\N
710	80	7	7	0	0	0	2012	0	\N	\N
711	80	8	5	4	0	0	2012	4	\N	\N
721	81	9	0	0	0	0	2012	0	\N	\N
719	81	7	7	0	0	0	2012	0	\N	\N
702	79	8	5	1	1	0	2012	2	\N	\N
718	81	6	84	84	0	0	2012	84	\N	\N
715	81	3	7	4	0	0	2012	4	\N	\N
716	81	4	7	3	0	0	2012	3	\N	\N
714	81	2	15	0	0	0	2012	0	\N	\N
720	81	8	5	3	0	0	2012	3	\N	\N
731	83	1	5	3	0	0	2012	3	\N	\N
690	78	5	5	2.5	1.5	0	2012	4	\N	\N
722	82	1	5	5	0	0	2012	5	\N	\N
725	82	4	7	7	0	0	2012	7	\N	\N
727	82	6	84	0	0	0	2012	0	\N	\N
723	82	2	15	9	0	0	2012	9	\N	\N
724	82	3	7	6	0	0	2012	6	\N	\N
726	82	5	5	3.5	0	0	2012	3.5	\N	\N
691	78	6	84	84	0	0	2012	84	\N	\N
729	82	8	5	4	0	0	2012	4	\N	\N
739	83	9	0	0	0	0	2012	0	\N	\N
732	83	2	15	6	0	0	2012	6	\N	\N
733	83	3	7	3	0	0	2012	3	\N	\N
734	83	4	7	3	0	0	2012	3	\N	\N
735	83	5	5	2	0	0	2012	2	\N	\N
737	83	7	7	0	0	0	2012	0	\N	\N
738	83	8	5	2	0	0	2012	2	\N	\N
742	84	3	7	7	0	0	2012	7	\N	\N
743	84	4	7	7	0	0	2012	7	\N	\N
748	84	9	0	0	0	0	2012	0	\N	\N
745	84	6	84	0	0	0	2012	0	\N	\N
713	81	1	5	0.5	0	0	2012	0.5	\N	\N
741	84	2	15	8	0	0	2012	8	\N	\N
744	84	5	5	4	0	0	2012	4	\N	\N
746	84	7	7	6	0	0	2012	6	\N	\N
747	84	8	5	4	0	0	2012	4	\N	\N
380	44	1	5	2	0	0	2012	2	\N	\N
740	84	1	5	0	0	0	2012	0	\N	\N
728	82	7	7	7	0	0	2012	7	\N	\N
751	85	3	7	7	0	0	2012	7	\N	\N
752	85	4	7	7	0	0	2012	7	\N	\N
754	85	6	84	84	0	0	2012	84	\N	\N
757	85	9	0	0	0	0	2012	0	\N	\N
755	85	7	7	0	0	0	2012	0	\N	\N
749	85	1	5	2.5	0	0	2012	2.5	\N	\N
750	85	2	15	1.5	4.5	0	2012	6	\N	\N
753	85	5	5	1.5	0	0	2012	1.5	\N	\N
761	86	4	7	7	0	0	2012	7	\N	\N
766	86	9	0	0	0	0	2012	0	\N	\N
763	86	6	84	0	0	0	2012	0	\N	\N
758	86	1	5	3	0	0	2012	3	\N	\N
759	86	2	15	6	0	0	2012	6	\N	\N
760	86	3	7	4	0	0	2012	4	\N	\N
762	86	5	5	2	0	0	2012	2	\N	\N
764	86	7	7	0	0	0	2012	0	\N	\N
765	86	8	5	2	0	0	2012	2	\N	\N
767	87	1	5	0	0	0	2012	0	\N	\N
768	87	2	15	0	0	0	2012	0	\N	\N
769	87	3	7	0	0	0	2012	0	\N	\N
770	87	4	7	0	0	0	2012	0	\N	\N
771	87	5	5	0	0	0	2012	0	\N	\N
730	82	9	0	1	0	0	2012	1	\N	\N
756	85	8	5	2	1	0	2012	3	\N	\N
717	81	5	5	0.5	0.5	0	2012	1	\N	\N
775	87	9	0	0	0	0	2012	0	\N	\N
772	87	6	84	0	0	0	2012	0	\N	\N
773	87	7	7	0	0	0	2012	0	\N	\N
774	87	8	5	0	0	0	2012	0	\N	\N
784	88	9	0	0	0	0	2012	0	\N	\N
781	88	6	84	0	0	0	2012	0	\N	\N
776	88	1	5	3	0	0	2012	3	\N	\N
777	88	2	15	6	0	0	2012	6	\N	\N
778	88	3	7	4	0	0	2012	4	\N	\N
779	88	4	7	4	0	0	2012	4	\N	\N
780	88	5	5	2.5	0	0	2012	2.5	\N	\N
782	88	7	7	0	0	0	2012	0	\N	\N
783	88	8	5	2	0	0	2012	2	\N	\N
793	89	9	0	0	0	0	2012	0	\N	\N
790	89	6	84	0	0	0	2012	0	\N	\N
817	92	6	84	0	0	0	2012	0	\N	\N
812	92	1	5	2	0	0	2012	2	\N	\N
787	89	3	7	4	0	0	2012	4	\N	\N
788	89	4	7	4	0	0	2012	4	\N	\N
789	89	5	5	2.5	0	0	2012	2.5	\N	\N
791	89	7	7	0	0	0	2012	0	\N	\N
813	92	2	15	2	0	0	2012	2	\N	\N
814	92	3	7	2	0	0	2012	2	\N	\N
38937	71	7	7	7	0	0	2017	7	2017-01-02 04:46:49.330661	2017-01-02 04:46:49.330661
796	90	3	7	7	0	0	2012	7	\N	\N
797	90	4	7	7	0	0	2012	7	\N	\N
802	90	9	0	0	0	0	2012	0	\N	\N
799	90	6	84	0	0	0	2012	0	\N	\N
794	90	1	5	0	0	0	2012	0	\N	\N
795	90	2	15	8	0	0	2012	8	\N	\N
798	90	5	5	4	0	0	2012	4	\N	\N
800	90	7	7	8	0	0	2012	8	\N	\N
801	90	8	5	4	0	0	2012	4	\N	\N
786	89	2	15	5	1	0	2012	6	\N	\N
792	89	8	5	0	2	0	2012	2	\N	\N
809	91	7	7	7	0	0	2012	7	\N	\N
811	91	9	0	0	0	0	2012	0	\N	\N
808	91	6	84	0	0	0	2012	0	\N	\N
803	91	1	5	2	0	0	2012	2	\N	\N
804	91	2	15	2	0	0	2012	2	\N	\N
805	91	3	7	2	0	0	2012	2	\N	\N
806	91	4	7	2	0	0	2012	2	\N	\N
807	91	5	5	2	0	0	2012	2	\N	\N
835	94	6	84	0	0	0	2012	0	\N	\N
820	92	9	0	0	0	0	2012	0	\N	\N
815	92	4	7	2	0	0	2012	2	\N	\N
816	92	5	5	2	0	0	2012	2	\N	\N
818	92	7	7	0	0	0	2012	0	\N	\N
819	92	8	5	2	0	0	2012	2	\N	\N
810	91	8	5	2	0	0	2012	2	\N	\N
829	93	9	0	0	0	0	2012	0	\N	\N
826	93	6	84	0	0	0	2012	0	\N	\N
821	93	1	5	2	0	0	2012	2	\N	\N
822	93	2	15	2	0	0	2012	2	\N	\N
823	93	3	7	2	0	0	2012	2	\N	\N
824	93	4	7	2	0	0	2012	2	\N	\N
825	93	5	5	2	0	0	2012	2	\N	\N
827	93	7	7	0	0	0	2012	0	\N	\N
828	93	8	5	2	0	0	2012	2	\N	\N
838	94	9	0	0	0	0	2012	0	\N	\N
830	94	1	5	2	0	0	2012	2	\N	\N
831	94	2	15	2	0	0	2012	2	\N	\N
832	94	3	7	2	0	0	2012	2	\N	\N
833	94	4	7	2	0	0	2012	2	\N	\N
834	94	5	5	2	0	0	2012	2	\N	\N
836	94	7	7	0	0	0	2012	0	\N	\N
837	94	8	5	2	0	0	2012	2	\N	\N
847	95	9	0	0	0	0	2012	0	\N	\N
844	95	6	84	0	0	0	2012	0	\N	\N
839	95	1	5	2	0	0	2012	2	\N	\N
840	95	2	15	2	0	0	2012	2	\N	\N
841	95	3	7	2	0	0	2012	2	\N	\N
842	95	4	7	2	0	0	2012	2	\N	\N
843	95	5	5	2	0	0	2012	2	\N	\N
845	95	7	7	0	0	0	2012	0	\N	\N
846	95	8	5	2	0	0	2012	2	\N	\N
848	96	1	5	0	2	0	2012	2	\N	\N
850	96	3	7	2	0	0	2012	2	\N	\N
851	96	4	7	2	0	0	2012	2	\N	\N
852	96	5	5	2	0	0	2012	2	\N	\N
854	96	7	7	0	0	0	2012	0	\N	\N
450	51	8	5	0	2	0	2012	2	\N	\N
785	89	1	5	1	2	0	2012	3	\N	\N
712	80	9	0	0	1	0	2012	1	\N	\N
855	96	8	5	0	2	0	2012	2	\N	\N
856	96	9	0	0	0	0	2012	0	\N	\N
853	96	6	84	0	0	0	2012	0	\N	\N
865	97	9	0	0	0	0	2012	0	\N	\N
863	97	7	7	0	0	0	2012	0	\N	\N
857	97	1	5	2	0	0	2012	2	\N	\N
858	97	2	15	2	0	0	2012	2	\N	\N
859	97	3	7	2	0	0	2012	2	\N	\N
860	97	4	7	2	0	0	2012	2	\N	\N
861	97	5	5	2	0	0	2012	2	\N	\N
862	97	6	84	0	0	0	2012	0	\N	\N
864	97	8	5	2	0	0	2012	2	\N	\N
874	98	9	0	0	0	0	2012	0	\N	\N
872	98	7	7	0	0	0	2012	0	\N	\N
866	98	1	5	2	0	0	2012	2	\N	\N
867	98	2	15	2	0	0	2012	2	\N	\N
868	98	3	7	2	0	0	2012	2	\N	\N
869	98	4	7	0	0	0	2012	0	\N	\N
870	98	5	5	2	0	0	2012	2	\N	\N
871	98	6	84	0	0	0	2012	0	\N	\N
873	98	8	5	2	0	0	2012	2	\N	\N
883	99	9	0	0	0	0	2012	0	\N	\N
880	99	6	84	0	0	0	2012	0	\N	\N
875	99	1	5	2	0	0	2012	2	\N	\N
876	99	2	15	2	0	0	2012	2	\N	\N
877	99	3	7	0	0	0	2012	0	\N	\N
878	99	4	7	0	0	0	2012	0	\N	\N
879	99	5	5	2	0	0	2012	2	\N	\N
881	99	7	7	0	0	0	2012	0	\N	\N
894	94	2	15	0	15	0	2013	15	\N	\N
886	91	3	7	7	0	0	2013	7	\N	\N
887	91	4	7	7	0	0	2013	7	\N	\N
890	91	7	7	7	0	0	2013	7	\N	\N
896	94	4	7	7	0	0	2013	7	\N	\N
899	94	7	7	7	0	0	2013	7	\N	\N
901	94	9	0	0	0	0	2013	0	\N	\N
904	60	3	7	7	0	0	2013	7	\N	\N
905	60	4	7	7	0	0	2013	7	\N	\N
908	60	7	7	7	0	0	2013	7	\N	\N
910	60	9	0	0	0	0	2013	0	\N	\N
913	36	3	7	7	0	0	2013	7	\N	\N
914	36	4	7	7	0	0	2013	7	\N	\N
915	36	5	5	5	0	0	2013	5	\N	\N
907	60	6	84	0	0	0	2013	0	\N	\N
916	36	6	84	0	0	0	2013	0	\N	\N
849	96	2	15	0	2	0	2012	2	\N	\N
885	91	2	15	2	13	0	2013	15	\N	\N
892	91	9	12	12	0	0	2013	12	\N	\N
882	99	8	5	0	2	0	2012	2	\N	\N
902	60	1	5	2	3	0	2013	5	\N	\N
893	94	1	5	0	5	0	2013	5	\N	\N
38939	71	9	0	0	0	0	2017	0	2017-01-02 04:46:49.350753	2017-01-02 04:46:49.350753
903	60	2	15	2	13	0	2013	15	\N	\N
889	91	6	84	0	0	0	2013	0	\N	\N
898	94	6	84	0	0	0	2013	0	\N	\N
909	60	8	5	0	5	0	2013	5	\N	\N
906	60	5	5	4.5	0.5	0	2013	5	\N	\N
897	94	5	5	0	5	0	2013	5	\N	\N
38940	73	1	5	5	0	0	2017	5	2017-01-02 04:46:49.3607	2017-01-02 04:46:49.3607
38941	73	2	15	15	0	0	2017	15	2017-01-02 04:46:49.370935	2017-01-02 04:46:49.370935
38942	73	3	7	7	0	0	2017	7	2017-01-02 04:46:49.382432	2017-01-02 04:46:49.382432
38943	73	4	7	7	0	0	2017	7	2017-01-02 04:46:49.391586	2017-01-02 04:46:49.391586
38944	73	5	5	5	0	0	2017	5	2017-01-02 04:46:49.401478	2017-01-02 04:46:49.401478
888	91	5	5	3.5	1	0	2013	5	\N	\N
912	36	2	15	0	15	0	2013	15	\N	\N
895	94	3	7	6	1	0	2013	7	\N	\N
38945	73	6	84	84	0	0	2017	84	2017-01-02 04:46:49.411505	2017-01-02 04:46:49.411505
38946	73	7	7	7	0	0	2017	7	2017-01-02 04:46:49.421378	2017-01-02 04:46:49.421378
38947	73	8	5	5	0	0	2017	5	2017-01-02 04:46:49.431436	2017-01-02 04:46:49.431436
38948	73	9	0	0	0	0	2017	0	2017-01-02 04:46:49.441352	2017-01-02 04:46:49.441352
911	36	1	5	3.5	1.5	0	2013	5	\N	\N
900	94	8	5	0	5	0	2013	5	\N	\N
38949	43	1	5	5	0	0	2017	5	2017-01-02 04:46:49.451424	2017-01-02 04:46:49.451424
38950	43	2	15	15	0	0	2017	15	2017-01-02 04:46:49.461416	2017-01-02 04:46:49.461416
884	91	1	5	1.5	3.5	0	2013	5	\N	\N
891	91	8	5	1	4	0	2013	5	\N	\N
38951	43	3	7	7	0	0	2017	7	2017-01-02 04:46:49.47164	2017-01-02 04:46:49.47164
38952	43	4	7	7	0	0	2017	7	2017-01-02 04:46:49.481444	2017-01-02 04:46:49.481444
38953	43	5	5	5	0	0	2017	5	2017-01-02 04:46:49.491418	2017-01-02 04:46:49.491418
38955	43	7	7	7	0	0	2017	7	2017-01-02 04:46:49.511381	2017-01-02 04:46:49.511381
38956	43	8	5	5	0	0	2017	5	2017-01-02 04:46:49.521388	2017-01-02 04:46:49.521388
38957	43	9	0	0	0	0	2017	0	2017-01-02 04:46:49.531442	2017-01-02 04:46:49.531442
38938	71	8	5	4	1	0	2017	5	2017-01-02 04:46:49.340681	2017-08-07 06:46:48.500729
917	36	7	7	7	0	0	2013	7	\N	\N
919	36	9	0	0	0	0	2013	0	\N	\N
922	76	3	7	7	0	0	2013	7	\N	\N
923	76	4	7	7	0	0	2013	7	\N	\N
38958	83	1	5	5	0	0	2017	5	2017-01-02 04:46:49.54141	2017-01-02 04:46:49.54141
926	76	7	7	7	0	0	2013	7	\N	\N
928	76	9	0	0	0	0	2013	0	\N	\N
931	78	3	7	7	0	0	2013	7	\N	\N
932	78	4	7	7	0	0	2013	7	\N	\N
934	78	6	84	84	0	0	2013	84	\N	\N
937	78	9	0	0	0	0	2013	0	\N	\N
940	34	3	7	7	0	0	2013	7	\N	\N
941	34	4	7	7	0	0	2013	7	\N	\N
944	34	7	7	7	0	0	2013	7	\N	\N
946	34	9	0	0	0	0	2013	0	\N	\N
947	75	1	5	5	0	0	2013	5	\N	\N
948	75	2	15	15	0	0	2013	15	\N	\N
949	75	3	7	7	0	0	2013	7	\N	\N
950	75	4	7	7	0	0	2013	7	\N	\N
951	75	5	5	5	0	0	2013	5	\N	\N
953	75	7	7	7	0	0	2013	7	\N	\N
954	75	8	5	5	0	0	2013	5	\N	\N
955	75	9	0	0	0	0	2013	0	\N	\N
956	83	1	5	5	0	0	2013	5	\N	\N
957	83	2	15	15	0	0	2013	15	\N	\N
958	83	3	7	7	0	0	2013	7	\N	\N
959	83	4	7	7	0	0	2013	7	\N	\N
960	83	5	5	5	0	0	2013	5	\N	\N
961	83	6	84	84	0	0	2013	84	\N	\N
962	83	7	7	7	0	0	2013	7	\N	\N
963	83	8	5	5	0	0	2013	5	\N	\N
964	83	9	0	0	0	0	2013	0	\N	\N
965	54	1	5	5	0	0	2013	5	\N	\N
967	54	3	7	7	0	0	2013	7	\N	\N
968	54	4	7	7	0	0	2013	7	\N	\N
970	54	6	84	84	0	0	2013	84	\N	\N
973	54	9	0	0	0	0	2013	0	\N	\N
974	50	1	5	5	0	0	2013	5	\N	\N
975	50	2	15	15	0	0	2013	15	\N	\N
976	50	3	7	7	0	0	2013	7	\N	\N
977	50	4	7	7	0	0	2013	7	\N	\N
978	50	5	5	5	0	0	2013	5	\N	\N
980	50	7	7	7	0	0	2013	7	\N	\N
982	50	9	0	0	0	0	2013	0	\N	\N
983	2	1	5	5	0	0	2013	5	\N	\N
984	2	2	15	15	0	0	2013	15	\N	\N
985	2	3	7	7	0	0	2013	7	\N	\N
986	2	4	7	7	0	0	2013	7	\N	\N
987	2	5	5	5	0	0	2013	5	\N	\N
988	2	6	84	84	0	0	2013	84	\N	\N
989	2	7	7	7	0	0	2013	7	\N	\N
990	2	8	5	5	0	0	2013	5	\N	\N
991	2	9	0	0	0	0	2013	0	\N	\N
994	30	3	7	7	0	0	2013	7	\N	\N
995	30	4	7	7	0	0	2013	7	\N	\N
998	30	7	7	7	0	0	2013	7	\N	\N
1000	30	9	0	0	0	0	2013	0	\N	\N
1003	41	3	7	7	0	0	2013	7	\N	\N
1004	41	4	7	7	0	0	2013	7	\N	\N
943	34	6	84	0	0	0	2013	0	\N	\N
952	75	6	84	0	0	0	2013	0	\N	\N
979	50	6	84	0	0	0	2013	0	\N	\N
997	30	6	84	0	0	0	2013	0	\N	\N
935	78	7	7	0	0	0	2013	0	\N	\N
971	54	7	7	0	0	0	2013	0	\N	\N
933	78	5	5	0.5	4.5	0	2013	5	\N	\N
981	50	8	5	4	0	0	2013	5	\N	\N
942	34	5	5	1.5	3.5	0	2013	5	\N	\N
999	30	8	5	4	1	0	2013	5	\N	\N
972	54	8	5	0	5	0	2013	5	\N	\N
992	30	1	5	1	4	0	2013	5	\N	\N
938	34	1	5	0	5	0	2013	5	\N	\N
993	30	2	15	3	12	0	2013	15	\N	\N
930	78	2	15	0	15	0	2013	15	\N	\N
929	78	1	5	0	4	0	2013	5	\N	\N
969	54	5	5	4	1	0	2013	5	\N	\N
927	76	8	5	3	1	0	2013	5	\N	\N
1001	41	1	5	0	5	0	2013	0	\N	\N
936	78	8	5	0	5	0	2013	5	\N	\N
918	36	8	5	2	3	0	2013	5	\N	\N
924	76	5	5	4.5	0.5	0	2013	5	\N	\N
945	34	8	5	2	4	0	2013	5	\N	\N
920	76	1	5	4	0	0	2013	5	\N	\N
921	76	2	15	9	3	0	2013	15	\N	\N
1002	41	2	15	0	15	0	2013	0	\N	\N
996	30	5	5	2.5	2.5	0	2013	5	\N	\N
966	54	2	15	1	14	0	2013	15	\N	\N
1007	41	7	7	7	0	0	2013	7	\N	\N
1010	82	1	5	5	0	0	2013	5	\N	\N
1012	82	3	7	7	0	0	2013	7	\N	\N
1014	82	5	5	5	0	0	2013	5	\N	\N
1016	82	7	7	7	0	0	2013	7	\N	\N
1018	82	9	0	0	0	0	2013	0	\N	\N
1021	65	3	7	7	0	0	2013	7	\N	\N
1022	65	4	7	7	0	0	2013	7	\N	\N
1025	65	7	7	7	0	0	2013	7	\N	\N
1027	65	9	0	0	0	0	2013	0	\N	\N
1031	59	4	7	7	0	0	2013	7	\N	\N
1034	59	7	7	7	0	0	2013	7	\N	\N
1037	43	1	5	5	0	0	2013	5	\N	\N
1039	43	3	7	7	0	0	2013	7	\N	\N
1040	43	4	7	7	0	0	2013	7	\N	\N
1041	43	5	5	5	0	0	2013	5	\N	\N
1043	43	7	7	7	0	0	2013	7	\N	\N
1045	43	9	0	0	0	0	2013	0	\N	\N
1048	81	3	7	7	0	0	2013	7	\N	\N
1049	81	4	7	7	0	0	2013	7	\N	\N
1051	81	6	84	84	0	0	2013	84	\N	\N
1054	81	9	0	0	0	0	2013	0	\N	\N
1058	44	4	7	7	0	0	2013	7	\N	\N
1061	44	7	7	7	0	0	2013	7	\N	\N
1063	44	9	0	0	0	0	2013	0	\N	\N
1068	42	5	5	5	0	0	2013	5	\N	\N
1070	42	7	7	7	0	0	2013	7	\N	\N
1076	47	4	7	7	0	0	2013	7	\N	\N
1079	47	7	7	7	0	0	2013	7	\N	\N
1084	10	3	7	7	0	0	2013	7	\N	\N
1085	10	4	7	7	0	0	2013	7	\N	\N
1088	10	7	7	7	0	0	2013	7	\N	\N
1015	82	6	84	0	0	0	2013	0	\N	\N
1024	65	6	84	0	0	0	2013	0	\N	\N
1033	59	6	84	0	0	0	2013	0	\N	\N
1042	43	6	84	0	0	0	2013	0	\N	\N
1060	44	6	84	0	0	0	2013	0	\N	\N
1069	42	6	84	0	0	0	2013	0	\N	\N
1078	47	6	84	0	0	0	2013	0	\N	\N
1087	10	6	84	0	0	0	2013	0	\N	\N
1052	81	7	7	0	0	0	2013	0	\N	\N
1089	10	8	5	4	1	0	2013	5	\N	\N
1047	81	2	15	10	0	0	2013	15	\N	\N
1090	10	9	2	0	2	0	2013	2	\N	\N
1044	43	8	5	2	3	0	2013	5	\N	\N
1029	59	2	15	1	14	0	2013	15	\N	\N
1075	47	3	7	6	1	0	2013	7	\N	\N
1013	82	4	7	2	5	0	2013	7	\N	\N
1046	81	1	5	4	1	0	2013	5	\N	\N
1023	65	5	5	1.5	3.5	0	2013	5	\N	\N
1056	44	2	15	0	15	0	2013	15	\N	\N
1050	81	5	5	4	0	0	2013	5	\N	\N
1072	42	9	4	4	0	0	2013	4	\N	\N
1053	81	8	5	1	2	0	2013	5	\N	\N
1011	82	2	15	8	7	0	2013	15	\N	\N
1019	65	1	5	2	3	0	2013	5	\N	\N
1086	10	5	5	4.5	0.5	0	2013	5	\N	\N
1038	43	2	15	11	4	0	2013	15	\N	\N
1055	44	1	5	1	4	0	2013	5	\N	\N
1073	47	1	5	0	5	0	2013	5	\N	\N
1071	42	8	5	4	1	0	2013	5	\N	\N
1026	65	8	5	3	2	0	2013	5	\N	\N
1020	65	2	15	6	9	0	2013	15	\N	\N
1008	41	8	5	3	2	0	2013	5	\N	\N
1017	82	8	5	2	3	0	2013	5	\N	\N
1057	44	3	7	4	3	0	2013	7	\N	\N
1009	41	9	1	1	0	0	2013	1	\N	\N
1081	47	9	13	5	8	0	2013	13	\N	\N
1067	42	4	7	2	5	0	2013	7	\N	\N
1005	41	5	5	0	5	0	2013	0	\N	\N
1028	59	1	5	0.5	4.5	0	2013	5	\N	\N
1077	47	5	5	3.5	1.5	0	2013	5	\N	\N
1032	59	5	5	4.5	0.5	0	2013	5	\N	\N
1030	59	3	7	5	2	0	2013	7	\N	\N
1080	47	8	5	3	2	0	2013	5	\N	\N
1065	42	2	15	4	11	0	2013	15	\N	\N
1082	10	1	5	3	2	0	2013	5	\N	\N
1036	59	9	10	5	5	0	2013	10	\N	\N
1066	42	3	7	6	1	0	2013	7	\N	\N
1064	42	1	5	2.5	2.5	0	2013	5	\N	\N
1074	47	2	15	11	4	0	2013	15	\N	\N
1035	59	8	5	2	3	0	2013	5	\N	\N
1062	44	8	5	0	5	0	2013	5	\N	\N
1059	44	5	5	2	3	0	2013	5	\N	\N
1091	29	1	5	1.5	3.5	0	2013	5	\N	\N
1093	29	3	7	7	0	0	2013	7	\N	\N
1094	29	4	7	7	0	0	2013	7	\N	\N
1097	29	7	7	7	0	0	2013	7	\N	\N
1099	29	9	0	0	0	0	2013	0	\N	\N
1102	33	3	7	7	0	0	2013	7	\N	\N
1103	33	4	7	7	0	0	2013	7	\N	\N
38959	83	2	15	15	0	0	2017	15	2017-01-02 04:46:49.551443	2017-01-02 04:46:49.551443
1106	33	7	7	7	0	0	2013	7	\N	\N
1108	33	9	0	0	0	0	2013	0	\N	\N
1111	77	3	7	7	0	0	2013	7	\N	\N
1112	77	4	7	7	0	0	2013	7	\N	\N
1115	77	7	7	7	0	0	2013	7	\N	\N
1117	77	9	0	0	0	0	2013	0	\N	\N
1120	40	3	7	7	0	0	2013	7	\N	\N
1121	40	4	7	7	0	0	2013	7	\N	\N
1124	40	7	7	7	0	0	2013	7	\N	\N
1126	40	9	0	0	0	0	2013	0	\N	\N
1129	55	3	7	7	0	0	2013	7	\N	\N
1130	55	4	7	7	0	0	2013	7	\N	\N
1131	55	5	5	5	0	0	2013	5	\N	\N
1133	55	7	7	7	0	0	2013	7	\N	\N
1136	45	1	5	5	0	0	2013	5	\N	\N
1138	45	3	7	7	0	0	2013	7	\N	\N
1139	45	4	7	7	0	0	2013	7	\N	\N
1140	45	5	5	5	0	0	2013	5	\N	\N
1142	45	7	7	7	0	0	2013	7	\N	\N
1146	58	2	15	15	0	0	2013	15	\N	\N
1147	58	3	7	7	0	0	2013	7	\N	\N
1148	58	4	7	7	0	0	2013	7	\N	\N
1151	58	7	7	7	0	0	2013	7	\N	\N
1156	70	3	7	7	0	0	2013	7	\N	\N
1157	70	4	7	7	0	0	2013	7	\N	\N
1159	70	6	84	84	0	0	2013	84	\N	\N
1162	70	9	0	0	0	0	2013	0	\N	\N
1163	57	1	5	5	0	0	2013	5	\N	\N
1165	57	3	7	7	0	0	2013	7	\N	\N
1166	57	4	7	7	0	0	2013	7	\N	\N
1167	57	5	5	5	0	0	2013	5	\N	\N
1169	57	7	7	7	0	0	2013	7	\N	\N
1172	48	1	5	5	0	0	2013	5	\N	\N
1173	48	2	15	15	0	0	2013	15	\N	\N
1174	48	3	7	7	0	0	2013	7	\N	\N
1175	48	4	7	7	0	0	2013	7	\N	\N
1176	48	5	5	5	0	0	2013	5	\N	\N
1178	48	7	7	7	0	0	2013	7	\N	\N
1179	48	8	5	5	0	0	2013	5	\N	\N
1180	48	9	0	0	0	0	2013	0	\N	\N
1114	77	6	84	0	0	0	2013	0	\N	\N
1132	55	6	84	0	0	0	2013	0	\N	\N
1141	45	6	84	0	0	0	2013	0	\N	\N
1150	58	6	84	0	0	0	2013	0	\N	\N
1168	57	6	84	0	0	0	2013	0	\N	\N
1096	29	6	84	0	0	0	2013	0	\N	\N
1160	70	7	7	0	0	0	2013	0	\N	\N
1161	70	8	5	0	5	0	2013	5	\N	\N
1177	48	6	84	0	0	0	2013	0	\N	\N
1152	58	8	5	3	2	0	2013	5	\N	\N
1119	40	2	15	9	6	0	2013	15	\N	\N
1154	70	1	5	2	3	0	2013	5	\N	\N
1100	33	1	5	0	5	0	2013	5	\N	\N
1101	33	2	15	0	15	0	2013	15	\N	\N
1170	57	8	5	4	1	0	2013	5	\N	\N
1123	40	6	84	0	0	0	2013	0	\N	\N
1171	57	9	2	0	2	0	2013	2	\N	\N
1164	57	2	15	13	2	0	2013	15	\N	\N
1137	45	2	15	11.5	3.5	0	2013	15	\N	\N
1145	58	1	5	4.5	0.5	0	2013	5	\N	\N
1095	29	5	5	1.5	3.5	0	2013	5	\N	\N
1122	40	5	5	2.5	2.5	0	2013	5	\N	\N
1125	40	8	5	4	1	0	2013	5	\N	\N
1110	77	2	15	0	15	0	2013	15	\N	\N
1149	58	5	5	4.5	0.5	0	2013	5	\N	\N
1098	29	8	5	1	4	0	2013	5	\N	\N
1155	70	2	15	0	15	0	2013	15	\N	\N
1127	55	1	5	0	5	0	2013	5	\N	\N
1104	33	5	5	3.5	1.5	0	2013	5	\N	\N
1153	58	9	1	1	0	0	2013	1	\N	\N
1116	77	8	5	0	5	0	2013	5	\N	\N
1134	55	8	5	2	3	0	2013	5	\N	\N
1135	55	9	1	1	0	0	2013	1	\N	\N
1144	45	9	1	1	0	0	2013	1	\N	\N
1143	45	8	5	3	2	0	2013	5	\N	\N
1118	40	1	5	2	3	0	2013	5	\N	\N
1107	33	8	5	0	5	0	2013	5	\N	\N
1158	70	5	5	0	5	0	2013	5	\N	\N
1109	77	1	5	0	5	0	2013	5	\N	\N
1184	67	4	7	7	0	0	2013	7	\N	\N
1187	67	7	7	7	0	0	2013	7	\N	\N
1189	67	9	0	0	0	0	2013	0	\N	\N
1190	62	1	5	5	0	0	2013	5	\N	\N
1191	62	2	15	15	0	0	2013	15	\N	\N
1192	62	3	7	7	0	0	2013	7	\N	\N
1193	62	4	7	7	0	0	2013	7	\N	\N
1194	62	5	5	5	0	0	2013	5	\N	\N
1196	62	7	7	7	0	0	2013	7	\N	\N
1197	62	8	5	5	0	0	2013	5	\N	\N
1198	62	9	0	0	0	0	2013	0	\N	\N
1201	63	3	7	7	0	0	2013	7	\N	\N
1203	63	5	5	5	0	0	2013	5	\N	\N
1205	63	7	7	7	0	0	2013	7	\N	\N
1207	63	9	0	0	0	0	2013	0	\N	\N
1208	53	1	5	5	0	0	2013	5	\N	\N
1209	53	2	15	15	0	0	2013	15	\N	\N
1210	53	3	7	7	0	0	2013	7	\N	\N
1211	53	4	7	7	0	0	2013	7	\N	\N
1212	53	5	5	5	0	0	2013	5	\N	\N
1213	53	6	84	84	0	0	2013	84	\N	\N
1215	53	8	5	5	0	0	2013	5	\N	\N
1216	53	9	0	0	0	0	2013	0	\N	\N
1219	35	3	7	7	0	0	2013	7	\N	\N
1220	35	4	7	7	0	0	2013	7	\N	\N
1221	35	5	5	5	0	0	2013	5	\N	\N
1223	35	7	7	7	0	0	2013	7	\N	\N
1224	35	8	5	5	0	0	2013	5	\N	\N
1225	35	9	0	0	0	0	2013	0	\N	\N
1228	38	3	7	7	0	0	2013	7	\N	\N
1229	38	4	7	7	0	0	2013	7	\N	\N
1230	38	5	5	5	0	0	2013	5	\N	\N
1232	38	7	7	7	0	0	2013	7	\N	\N
1234	38	9	0	0	0	0	2013	0	\N	\N
1235	73	1	5	5	0	0	2013	5	\N	\N
1236	73	2	15	15	0	0	2013	15	\N	\N
1237	73	3	7	7	0	0	2013	7	\N	\N
1238	73	4	7	7	0	0	2013	7	\N	\N
1239	73	5	5	5	0	0	2013	5	\N	\N
1241	73	7	7	7	0	0	2013	7	\N	\N
1242	73	8	5	5	0	0	2013	5	\N	\N
1243	73	9	0	0	0	0	2013	0	\N	\N
1246	71	3	7	7	0	0	2013	7	\N	\N
1247	71	4	7	7	0	0	2013	7	\N	\N
1250	71	7	7	7	0	0	2013	7	\N	\N
1252	71	9	0	0	0	0	2013	0	\N	\N
1255	64	3	7	7	0	0	2013	7	\N	\N
1256	64	4	7	7	0	0	2013	7	\N	\N
1257	64	5	5	5	0	0	2013	5	\N	\N
1259	64	7	7	7	0	0	2013	7	\N	\N
1260	64	8	5	5	0	0	2013	5	\N	\N
1261	64	9	0	0	0	0	2013	0	\N	\N
1264	56	3	7	7	0	0	2013	7	\N	\N
1265	56	4	7	7	0	0	2013	7	\N	\N
1266	56	5	5	5	0	0	2013	5	\N	\N
1231	38	6	84	0	0	0	2013	0	\N	\N
1249	71	6	84	0	0	0	2013	0	\N	\N
1267	56	6	84	0	0	0	2013	0	\N	\N
1214	53	7	7	0	0	0	2013	0	\N	\N
1222	35	6	84	0	0	0	2013	0	\N	\N
1182	67	2	15	0	15	0	2013	15	\N	\N
1217	35	1	5	3	2	0	2013	5	\N	\N
1226	38	1	5	4	1	0	2013	5	\N	\N
1204	63	6	84	0	0	0	2013	0	\N	\N
1258	64	6	84	0	0	0	2013	0	\N	\N
1254	64	2	15	1	14	0	2013	15	\N	\N
1188	67	8	5	1	4	0	2013	5	\N	\N
1251	71	8	5	4	1	0	2013	5	\N	\N
1240	73	6	84	0	0	0	2013	0	\N	\N
1263	56	2	15	13	2	0	2013	15	\N	\N
1227	38	2	15	13	2	0	2013	15	\N	\N
1195	62	6	84	0	0	0	2013	0	\N	\N
1253	64	1	5	0	5	0	2013	5	\N	\N
1233	38	8	5	3	2	0	2013	5	\N	\N
1206	63	8	5	4	1	0	2013	5	\N	\N
1268	56	7	7	2	5	0	2013	7	\N	\N
1202	63	4	7	0	7	0	2013	7	\N	\N
1199	63	1	5	4	1	0	2013	5	\N	\N
1185	67	5	5	0	5	0	2013	5	\N	\N
1183	67	3	7	4	3	0	2013	7	\N	\N
1248	71	5	5	3	2	0	2013	5	\N	\N
1262	56	1	5	4	1	0	2013	5	\N	\N
1244	71	1	5	2	3	0	2013	5	\N	\N
1181	67	1	5	0	5	0	2013	5	\N	\N
1200	63	2	15	12	3	0	2013	15	\N	\N
1245	71	2	15	-58	73	0	2013	15	\N	\N
1274	37	4	7	7	0	0	2013	7	\N	\N
38960	83	3	7	7	0	0	2017	7	2017-01-02 04:46:49.56151	2017-01-02 04:46:49.56151
1277	37	7	7	7	0	0	2013	7	\N	\N
1282	52	3	7	7	0	0	2013	7	\N	\N
1283	52	4	7	7	0	0	2013	7	\N	\N
1286	52	7	7	7	0	0	2013	7	\N	\N
1291	32	3	7	7	0	0	2013	7	\N	\N
1292	32	4	7	7	0	0	2013	7	\N	\N
1295	32	7	7	7	0	0	2013	7	\N	\N
1297	32	9	0	0	0	0	2013	0	\N	\N
1300	28	3	7	7	0	0	2013	7	\N	\N
1301	28	4	7	7	0	0	2013	7	\N	\N
1304	28	7	7	7	0	0	2013	7	\N	\N
1306	28	9	0	0	0	0	2013	0	\N	\N
1308	46	2	15	15	0	0	2013	15	\N	\N
1309	46	3	7	7	0	0	2013	7	\N	\N
1310	46	4	7	7	0	0	2013	7	\N	\N
1313	46	7	7	7	0	0	2013	7	\N	\N
1318	68	3	7	7	0	0	2013	7	\N	\N
1319	68	4	7	7	0	0	2013	7	\N	\N
1322	68	7	7	7	0	0	2013	7	\N	\N
1327	31	3	7	7	0	0	2013	7	\N	\N
1328	31	4	7	7	0	0	2013	7	\N	\N
1331	31	7	7	7	0	0	2013	7	\N	\N
1333	31	9	0	0	0	0	2013	0	\N	\N
1336	74	3	7	7	0	0	2013	7	\N	\N
1337	74	4	7	7	0	0	2013	7	\N	\N
1340	74	7	7	7	0	0	2013	7	\N	\N
1342	74	9	0	0	0	0	2013	0	\N	\N
1343	89	1	5	5	0	0	2013	5	\N	\N
1344	89	2	15	15	0	0	2013	15	\N	\N
1345	89	3	7	7	0	0	2013	7	\N	\N
1346	89	4	7	7	0	0	2013	7	\N	\N
1347	89	5	5	5	0	0	2013	5	\N	\N
1349	89	7	7	7	0	0	2013	7	\N	\N
1350	89	8	5	5	0	0	2013	5	\N	\N
1351	89	9	0	0	0	0	2013	0	\N	\N
1354	80	3	7	7	0	0	2013	7	\N	\N
1355	80	4	7	7	0	0	2013	7	\N	\N
1285	52	6	84	0	0	0	2013	0	\N	\N
1294	32	6	84	0	0	0	2013	0	\N	\N
1303	28	6	84	0	0	0	2013	0	\N	\N
1312	46	6	84	0	0	0	2013	0	\N	\N
1321	68	6	84	0	0	0	2013	0	\N	\N
1330	31	6	84	0	0	0	2013	0	\N	\N
1339	74	6	84	0	0	0	2013	0	\N	\N
1348	89	6	84	0	0	0	2013	0	\N	\N
1293	32	5	5	3.5	1.5	0	2013	5	\N	\N
1272	37	2	15	7.5	7.5	0	2013	15	\N	\N
1338	74	5	5	4	1	0	2013	5	\N	\N
1314	46	8	5	3	2	0	2013	5	\N	\N
1341	74	8	5	3	2	0	2013	5	\N	\N
1275	37	5	5	3.5	1.5	0	2013	5	\N	\N
1305	28	8	5	4	1	0	2013	5	\N	\N
1299	28	2	15	8	7	0	2013	15	\N	\N
1280	52	1	5	2	3	0	2013	5	\N	\N
1298	28	1	5	3.5	1.5	0	2013	5	\N	\N
1334	74	1	5	1	4	0	2013	5	\N	\N
1279	37	9	1	1	0	0	2013	1	\N	\N
1296	32	8	5	4	1	0	2013	5	\N	\N
1332	31	8	5	3	2	0	2013	5	\N	\N
1271	37	1	5	0	5	0	2013	5	\N	\N
1325	31	1	5	0	5	0	2013	5	\N	\N
1290	32	2	15	10	5	0	2013	15	\N	\N
1316	68	1	5	3	2	0	2013	5	\N	\N
1289	32	1	5	3	2	0	2013	5	\N	\N
1278	37	8	5	2	3	0	2013	5	\N	\N
1307	46	1	5	0	5	0	2013	5	\N	\N
1352	80	1	5	3	2	0	2013	5	\N	\N
1335	74	2	15	3	12	0	2013	15	\N	\N
1356	80	5	5	4	1	0	2013	5	\N	\N
1288	52	9	1	0	1	0	2013	1	\N	\N
1302	28	5	5	3	2	0	2013	5	\N	\N
1270	56	9	4	0	4	0	2013	4	\N	\N
1284	52	5	5	2	3	0	2013	5	\N	\N
1317	68	2	15	6.5	8.5	0	2013	15	\N	\N
1320	68	5	5	3	2	0	2013	5	\N	\N
1269	56	8	5	2	3	0	2013	5	\N	\N
1281	52	2	15	0	15	0	2013	15	\N	\N
1273	37	3	7	4	3	0	2013	7	\N	\N
1311	46	5	5	2	3	0	2013	5	\N	\N
1324	68	9	4	4	0	0	2013	4	\N	\N
1326	31	2	15	1	14	0	2013	15	\N	\N
1315	46	9	3	1	2	0	2013	3	\N	\N
1287	52	8	5	0	5	0	2013	5	\N	\N
1329	31	5	5	1	4	0	2013	5	\N	\N
38961	83	4	7	7	0	0	2017	7	2017-01-02 04:46:49.571537	2017-01-02 04:46:49.571537
1358	80	7	7	7	0	0	2013	7	\N	\N
1363	51	3	7	7	0	0	2013	7	\N	\N
1366	51	6	84	84	0	0	2013	84	\N	\N
1372	72	3	7	7	0	0	2013	7	\N	\N
1373	72	4	7	7	0	0	2013	7	\N	\N
1374	72	5	5	5	0	0	2013	5	\N	\N
1376	72	7	7	7	0	0	2013	7	\N	\N
1378	72	9	0	0	0	0	2013	0	\N	\N
1381	90	3	7	7	0	0	2013	7	\N	\N
1382	90	4	7	7	0	0	2013	7	\N	\N
1385	90	7	7	7	0	0	2013	7	\N	\N
1387	90	9	0	0	0	0	2013	0	\N	\N
1390	85	3	7	7	0	0	2013	7	\N	\N
1391	85	4	7	7	0	0	2013	7	\N	\N
1393	85	6	84	84	0	0	2013	84	\N	\N
1396	85	9	0	0	0	0	2013	0	\N	\N
1397	49	1	5	5	0	0	2013	5	\N	\N
1399	49	3	7	7	0	0	2013	7	\N	\N
1400	49	4	7	7	0	0	2013	7	\N	\N
1403	49	7	7	7	0	0	2013	7	\N	\N
1404	49	8	5	5	0	0	2013	5	\N	\N
1405	49	9	0	0	0	0	2013	0	\N	\N
1409	96	4	7	7	0	0	2013	7	\N	\N
1412	96	7	7	7	0	0	2013	7	\N	\N
1414	96	9	0	0	0	0	2013	0	\N	\N
1417	97	3	7	7	0	0	2013	7	\N	\N
1418	97	4	7	7	0	0	2013	7	\N	\N
1419	97	5	5	5	0	0	2013	5	\N	\N
1423	97	9	0	0	0	0	2013	0	\N	\N
1430	87	7	7	7	0	0	2013	7	\N	\N
1432	87	9	0	0	0	0	2013	0	\N	\N
1435	99	3	7	7	0	0	2013	7	\N	\N
1436	99	4	7	7	0	0	2013	7	\N	\N
1439	99	7	7	7	0	0	2013	7	\N	\N
1441	99	9	0	0	0	0	2013	0	\N	\N
1444	79	3	7	7	0	0	2013	7	\N	\N
1375	72	6	84	0	0	0	2013	0	\N	\N
1384	90	6	84	0	0	0	2013	0	\N	\N
1402	49	6	84	0	0	0	2013	0	\N	\N
1411	96	6	84	0	0	0	2013	0	\N	\N
1429	87	6	84	0	0	0	2013	0	\N	\N
1367	51	7	7	0	0	0	2013	0	\N	\N
1394	85	7	7	0	0	0	2013	0	\N	\N
1369	51	9	2	0	2	0	2013	2	\N	\N
1362	51	2	15	5	10	0	2013	15	\N	\N
1360	80	9	2	0	2	0	2013	2	\N	\N
1377	72	8	5	2	3	0	2013	5	\N	\N
1421	97	7	7	0	0	0	2013	0	\N	\N
1359	80	8	5	4	1	0	2013	5	\N	\N
1425	87	2	15	0	15	0	2013	15	\N	\N
1415	97	1	5	4	1	0	2013	5	\N	\N
1371	72	2	15	3	12	0	2013	15	\N	\N
1422	97	8	5	3	2	0	2013	5	\N	\N
1408	96	3	7	0	7	0	2013	7	\N	\N
1386	90	8	5	1	4	0	2013	5	\N	\N
1401	49	5	5	3	2	0	2013	5	\N	\N
1438	99	6	84	0	0	0	2013	0	\N	\N
1364	51	4	7	6	1	0	2013	7	\N	\N
1413	96	8	5	4	1	0	2013	5	\N	\N
1428	87	5	5	0	5	0	2013	5	\N	\N
1406	96	1	5	3	2	0	2013	5	\N	\N
1395	85	8	5	2.5	2.5	0	2013	5	\N	\N
1407	96	2	15	6	9	0	2013	15	\N	\N
1426	87	3	7	4	3	0	2013	7	\N	\N
1437	99	5	5	2	3	0	2013	5	\N	\N
1443	79	2	15	6	9	0	2013	15	\N	\N
1420	97	6	84	84	0	0	2013	84	\N	\N
1433	99	1	5	0	5	0	2013	5	\N	\N
1431	87	8	5	0	5	0	2013	5	\N	\N
1379	90	1	5	3.5	1.5	0	2013	5	\N	\N
1416	97	2	15	3	12	0	2013	15	\N	\N
1368	51	8	5	1	4	0	2013	5	\N	\N
1410	96	5	5	4	1	0	2013	5	\N	\N
1383	90	5	5	3	2	0	2013	5	\N	\N
1424	87	1	5	1	4	0	2013	5	\N	\N
1434	99	2	15	0	15	0	2013	15	\N	\N
1380	90	2	15	4	11	0	2013	15	\N	\N
1442	79	1	5	4	1	0	2013	5	\N	\N
1440	99	8	5	2	3	0	2013	5	\N	\N
1398	49	2	15	4	11	0	2013	15	\N	\N
1365	51	5	5	2	3	0	2013	5	\N	\N
1361	51	1	5	1	4	0	2013	5	\N	\N
1388	85	1	5	3.5	1.5	0	2013	5	\N	\N
1370	72	1	5	1	4	0	2013	5	\N	\N
1427	87	4	7	0	7	0	2013	7	\N	\N
1445	79	4	7	7	0	0	2013	7	\N	\N
1446	79	5	5	5	0	0	2013	5	\N	\N
1448	79	7	7	7	0	0	2013	7	\N	\N
1450	79	9	0	0	0	0	2013	0	\N	\N
38962	83	5	5	5	0	0	2017	5	2017-01-02 04:46:49.581549	2017-01-02 04:46:49.581549
1453	98	3	7	7	0	0	2013	7	\N	\N
1454	98	4	7	7	0	0	2013	7	\N	\N
1456	98	6	84	84	0	0	2013	84	\N	\N
1459	98	9	0	0	0	0	2013	0	\N	\N
1462	95	3	7	7	0	0	2013	7	\N	\N
1463	95	4	7	7	0	0	2013	7	\N	\N
1466	95	7	7	7	0	0	2013	7	\N	\N
925	76	6	84	0	0	0	2013	0	\N	\N
1006	41	6	84	0	0	0	2013	0	\N	\N
1105	33	6	84	0	0	0	2013	0	\N	\N
1186	67	6	84	0	0	0	2013	0	\N	\N
1276	37	6	84	0	0	0	2013	0	\N	\N
1357	80	6	84	0	0	0	2013	0	\N	\N
1447	79	6	84	0	0	0	2013	0	\N	\N
1465	95	6	84	0	0	0	2013	0	\N	\N
1501	103	6	84	0	0	0	2013	0	\N	\N
1469	100	1	5	5	0	0	2013	5	\N	\N
1471	100	3	7	7	0	0	2013	7	\N	\N
1472	100	4	7	7	0	0	2013	7	\N	\N
1473	100	5	5	5	0	0	2013	5	\N	\N
1475	100	7	7	7	0	0	2013	7	\N	\N
1476	100	8	5	5	0	0	2013	5	\N	\N
1477	100	9	0	0	0	0	2013	0	\N	\N
1474	100	6	84	0	0	0	2013	0	\N	\N
1464	95	5	5	0.5	4.5	0	2013	5	\N	\N
1392	85	5	5	0	5	0	2013	5	\N	\N
1512	104	8	5	4	1	0	2013	5	\N	\N
1503	103	8	5	4	1	0	2013	5	\N	\N
1481	101	4	7	7	0	0	2013	7	\N	\N
1484	101	7	7	7	0	0	2013	7	\N	\N
1485	101	8	5	5	0	0	2013	5	\N	\N
1486	101	9	0	0	0	0	2013	0	\N	\N
1483	101	6	84	0	0	0	2013	0	\N	\N
1490	102	4	7	7	0	0	2013	7	\N	\N
1493	102	7	7	7	0	0	2013	7	\N	\N
1495	102	9	0	0	0	0	2013	0	\N	\N
1492	102	6	84	0	0	0	2013	0	\N	\N
1498	103	3	7	7	0	0	2013	7	\N	\N
1499	103	4	7	7	0	0	2013	7	\N	\N
1500	103	5	5	5	0	0	2013	5	\N	\N
1502	103	7	7	7	0	0	2013	7	\N	\N
1504	103	9	0	0	0	0	2013	0	\N	\N
1507	104	3	7	7	0	0	2013	7	\N	\N
1508	104	4	7	7	0	0	2013	7	\N	\N
1513	104	9	0	0	0	0	2013	0	\N	\N
1510	104	6	84	0	0	0	2013	0	\N	\N
1457	98	7	7	0	0	0	2013	0	\N	\N
1509	104	5	5	4	1	0	2013	5	\N	\N
1489	102	3	7	6	1	0	2013	7	\N	\N
1480	101	3	7	5.5	1.5	0	2013	7	\N	\N
1518	105	5	5	4.5	0.5	0	2013	5	\N	\N
1488	102	2	15	1	14	0	2013	15	\N	\N
1461	95	2	15	6	9	0	2013	15	\N	\N
1218	35	2	15	13	2	0	2013	15	\N	\N
1516	105	3	7	7	0	0	2013	7	\N	\N
1517	105	4	7	7	0	0	2013	7	\N	\N
1511	104	7	7	0	6	0	2013	6	\N	\N
1083	10	2	15	9	6	0	2013	15	\N	\N
1470	100	2	15	14	1	0	2013	15	\N	\N
1458	98	8	5	0	5	0	2013	5	\N	\N
1128	55	2	15	0	15	0	2013	15	\N	\N
1482	101	5	5	0.5	4.5	0	2013	5	\N	\N
1323	68	8	5	3	2	0	2013	5	\N	\N
1449	79	8	5	3	2	0	2013	5	\N	\N
1479	101	2	15	0	15	0	2013	15	\N	\N
939	34	2	15	0	15	0	2013	15	\N	\N
1514	105	1	5	0.5	4.5	0	2013	5	\N	\N
1468	95	9	2	2	0	0	2013	2	\N	\N
1515	105	2	15	5.5	9.5	0	2013	15	\N	\N
1506	104	2	15	11	4	0	2013	15	\N	\N
1487	102	1	5	1	4	0	2013	5	\N	\N
1505	104	1	5	4	1	0	2013	5	\N	\N
1455	98	5	5	4	1	0	2013	5	\N	\N
1451	98	1	5	5	0	0	2013	5	\N	\N
1494	102	8	5	4	1	0	2013	5	\N	\N
1467	95	8	5	0	5	0	2013	5	\N	\N
1497	103	2	15	7	8	0	2013	15	\N	\N
1460	95	1	5	0	5	0	2013	5	\N	\N
1496	103	1	5	3	2	0	2013	5	\N	\N
1491	102	5	5	4.5	0.5	0	2013	5	\N	\N
1478	101	1	5	0.5	4.5	0	2013	5	\N	\N
1520	105	7	7	7	0	0	2013	7	\N	\N
1522	105	9	0	0	0	0	2013	0	\N	\N
1519	105	6	84	0	0	0	2013	0	\N	\N
1523	106	1	5	5	0	0	2013	5	\N	\N
1524	106	2	15	15	0	0	2013	15	\N	\N
1525	106	3	7	7	0	0	2013	7	\N	\N
1526	106	4	7	7	0	0	2013	7	\N	\N
1527	106	5	5	5	0	0	2013	5	\N	\N
1528	106	6	84	84	0	0	2013	84	\N	\N
1530	106	8	5	5	0	0	2013	5	\N	\N
1531	106	9	0	0	0	0	2013	0	\N	\N
1529	106	7	7	0	0	0	2013	0	\N	\N
1534	107	3	7	7	0	0	2013	7	\N	\N
1535	107	4	7	7	0	0	2013	7	\N	\N
1536	107	5	5	5	0	0	2013	5	\N	\N
1538	107	7	7	7	0	0	2013	7	\N	\N
1537	107	6	84	0	0	0	2013	0	\N	\N
1543	108	3	7	7	0	0	2013	7	\N	\N
1544	108	4	7	7	0	0	2013	7	\N	\N
1546	108	6	84	84	0	0	2013	84	\N	\N
1549	108	9	0	0	0	0	2013	0	\N	\N
1547	108	7	7	0	0	0	2013	0	\N	\N
1521	105	8	5	4	1	0	2013	5	\N	\N
1539	107	8	5	4	1	0	2013	5	\N	\N
1563	110	5	5	4	1	0	2013	5	\N	\N
1550	109	1	5	5	0	0	2013	5	\N	\N
1552	109	3	7	7	0	0	2013	7	\N	\N
1553	109	4	7	7	0	0	2013	7	\N	\N
1555	109	6	84	84	0	0	2013	84	\N	\N
1556	109	7	7	0	0	0	2013	0	\N	\N
1559	110	1	5	5	0	0	2013	5	\N	\N
1561	110	3	7	7	0	0	2013	7	\N	\N
1562	110	4	7	7	0	0	2013	7	\N	\N
1564	110	6	84	84	0	0	2013	84	\N	\N
1566	110	8	5	5	0	0	2013	5	\N	\N
1567	110	9	0	0	0	0	2013	0	\N	\N
1565	110	7	7	0	0	0	2013	0	\N	\N
1571	111	4	7	7	0	0	2013	7	\N	\N
1574	111	7	7	7	0	0	2013	7	\N	\N
1576	111	9	0	0	0	0	2013	0	\N	\N
1573	111	6	84	0	0	0	2013	0	\N	\N
1577	112	1	5	5	0	0	2013	5	\N	\N
1578	112	2	15	15	0	0	2013	15	\N	\N
1579	112	3	7	7	0	0	2013	7	\N	\N
1580	112	4	7	7	0	0	2013	7	\N	\N
1581	112	5	5	5	0	0	2013	5	\N	\N
1583	112	7	7	7	0	0	2013	7	\N	\N
1584	112	8	5	5	0	0	2013	5	\N	\N
1585	112	9	0	0	0	0	2013	0	\N	\N
1582	112	6	84	0	0	0	2013	0	\N	\N
1588	113	3	7	7	0	0	2013	7	\N	\N
1589	113	4	7	7	0	0	2013	7	\N	\N
1590	113	5	5	5	0	0	2013	5	\N	\N
1592	113	7	7	7	0	0	2013	7	\N	\N
1593	113	8	5	5	0	0	2013	5	\N	\N
1594	113	9	0	0	0	0	2013	0	\N	\N
1591	113	6	84	0	0	0	2013	0	\N	\N
1597	114	3	7	7	0	0	2013	7	\N	\N
1598	114	4	7	7	0	0	2013	7	\N	\N
1599	114	5	5	5	0	0	2013	5	\N	\N
1601	114	7	7	7	0	0	2013	7	\N	\N
1602	114	8	5	5	0	0	2013	5	\N	\N
1603	114	9	0	0	0	0	2013	0	\N	\N
1600	114	6	84	0	0	0	2013	0	\N	\N
1548	108	8	5	0	5	0	2013	5	\N	\N
1596	114	2	15	13	2	0	2013	15	\N	\N
1604	115	1	5	5	0	0	2013	5	\N	\N
1605	115	2	15	15	0	0	2013	15	\N	\N
1606	115	3	7	7	0	0	2013	7	\N	\N
1572	111	5	5	3.5	1.5	0	2013	5	\N	\N
1532	107	1	5	4	1	0	2013	5	\N	\N
1587	113	2	15	11	4	0	2013	15	\N	\N
1542	108	2	15	1	14	0	2013	15	\N	\N
1560	110	2	15	2	13	0	2013	15	\N	\N
1570	111	3	7	6	1	0	2013	7	\N	\N
1586	113	1	5	3	2	0	2013	5	\N	\N
1595	114	1	5	3	2	0	2013	5	\N	\N
1540	107	9	1	1	0	0	2013	1	\N	\N
1554	109	5	5	4.5	0.5	0	2013	5	\N	\N
1541	108	1	5	1	4	0	2013	5	\N	\N
1575	111	8	5	1	4	0	2013	5	\N	\N
1568	111	1	5	3	2	0	2013	5	\N	\N
1557	109	8	5	4	1	0	2013	5	\N	\N
1558	109	9	1	0	1	0	2013	1	\N	\N
1569	111	2	15	8	7	0	2013	15	\N	\N
1551	109	2	15	10	5	0	2013	15	\N	\N
1607	115	4	7	7	0	0	2013	7	\N	\N
1608	115	5	5	5	0	0	2013	5	\N	\N
1609	115	6	84	84	0	0	2013	84	\N	\N
1611	115	8	5	5	0	0	2013	5	\N	\N
1612	115	9	0	0	0	0	2013	0	\N	\N
1610	115	7	7	0	0	0	2013	0	\N	\N
1614	116	2	15	15	0	0	2013	15	\N	\N
1615	116	3	7	7	0	0	2013	7	\N	\N
1616	116	4	7	7	0	0	2013	7	\N	\N
1617	116	5	5	5	0	0	2013	5	\N	\N
1618	116	6	84	84	0	0	2013	84	\N	\N
1620	116	8	5	5	0	0	2013	5	\N	\N
1621	116	9	0	0	0	0	2013	0	\N	\N
1619	116	7	7	0	0	0	2013	0	\N	\N
1624	117	3	7	7	0	0	2013	7	\N	\N
1625	117	4	7	7	0	0	2013	7	\N	\N
1627	117	6	84	84	0	0	2013	84	\N	\N
1630	117	9	0	0	0	0	2013	0	\N	\N
1628	117	7	7	0	0	0	2013	0	\N	\N
1673	122	7	7	0	0	0	2013	0	\N	\N
1389	85	2	15	6	9	0	2013	15	\N	\N
1613	116	1	5	3	2	0	2013	5	\N	\N
1631	118	1	5	5	0	0	2013	5	\N	\N
1632	118	2	15	15	0	0	2013	15	\N	\N
1633	118	3	7	7	0	0	2013	7	\N	\N
1634	118	4	7	7	0	0	2013	7	\N	\N
1635	118	5	5	5	0	0	2013	5	\N	\N
1637	118	7	7	7	0	0	2013	7	\N	\N
1639	118	9	0	0	0	0	2013	0	\N	\N
1636	118	6	84	0	0	0	2013	0	\N	\N
1642	119	3	7	7	0	0	2013	7	\N	\N
1643	119	4	7	7	0	0	2013	7	\N	\N
1644	119	5	5	5	0	0	2013	5	\N	\N
1645	119	6	84	84	0	0	2013	84	\N	\N
1648	119	9	0	0	0	0	2013	0	\N	\N
1646	119	7	7	0	0	0	2013	0	\N	\N
1651	120	3	7	7	0	0	2013	7	\N	\N
1652	120	4	7	7	0	0	2013	7	\N	\N
1653	120	5	5	5	0	0	2013	5	\N	\N
1655	120	7	7	7	0	0	2013	7	\N	\N
1654	120	6	84	0	0	0	2013	0	\N	\N
1650	120	2	15	8	7	0	2013	15	\N	\N
1623	117	2	15	13	2	0	2013	15	\N	\N
1658	121	1	5	5	0	0	2013	5	\N	\N
1659	121	2	15	15	0	0	2013	15	\N	\N
1660	121	3	7	7	0	0	2013	7	\N	\N
1661	121	4	7	7	0	0	2013	7	\N	\N
1662	121	5	5	5	0	0	2013	5	\N	\N
1664	121	7	7	7	0	0	2013	7	\N	\N
1665	121	8	5	5	0	0	2013	5	\N	\N
1666	121	9	0	0	0	0	2013	0	\N	\N
1663	121	6	84	0	0	0	2013	0	\N	\N
1667	122	1	5	5	0	0	2013	5	\N	\N
1668	122	2	15	15	0	0	2013	15	\N	\N
1669	122	3	7	7	0	0	2013	7	\N	\N
1670	122	4	7	7	0	0	2013	7	\N	\N
1671	122	5	5	5	0	0	2013	5	\N	\N
1672	122	6	84	84	0	0	2013	84	\N	\N
1674	122	8	5	5	0	0	2013	5	\N	\N
1675	122	9	0	0	0	0	2013	0	\N	\N
1678	123	3	7	7	0	0	2013	7	\N	\N
1679	123	4	7	7	0	0	2013	7	\N	\N
1681	123	6	84	84	0	0	2013	84	\N	\N
1684	123	9	0	0	0	0	2013	0	\N	\N
1682	123	7	7	0	0	0	2013	0	\N	\N
1685	124	1	5	5	0	0	2013	5	\N	\N
1686	124	2	15	15	0	0	2013	15	\N	\N
1687	124	3	7	7	0	0	2013	7	\N	\N
1688	124	4	7	7	0	0	2013	7	\N	\N
1689	124	5	5	5	0	0	2013	5	\N	\N
1640	119	1	5	2	3	0	2013	5	\N	\N
1677	123	2	15	3.5	11.5	0	2013	15	\N	\N
1680	123	5	5	4.5	0.5	0	2013	5	\N	\N
1657	120	9	1	0	1	0	2013	1	\N	\N
1622	117	1	5	3	2	0	2013	5	\N	\N
1647	119	8	5	4	1	0	2013	5	\N	\N
1533	107	2	15	0.5	14.5	0	2013	15	\N	\N
1626	117	5	5	2.5	2.5	0	2013	5	\N	\N
1683	123	8	5	4	1	0	2013	5	\N	\N
1641	119	2	15	12	3	0	2013	15	\N	\N
1545	108	5	5	0.5	4.5	0	2013	5	\N	\N
1649	120	1	5	3	2	0	2013	5	\N	\N
1676	123	1	5	0	5	0	2013	5	\N	\N
1638	118	8	5	1	4	0	2013	5	\N	\N
1629	117	8	5	0	5	0	2013	5	\N	\N
1656	120	8	5	3	2	0	2013	5	\N	\N
1691	124	7	7	7	0	0	2013	7	\N	\N
1692	124	8	5	5	0	0	2013	5	\N	\N
1693	124	9	0	0	0	0	2013	0	\N	\N
1690	124	6	84	0	0	0	2013	0	\N	\N
38963	83	6	84	84	0	0	2017	84	2017-01-02 04:46:49.591667	2017-01-02 04:46:49.591667
38964	83	7	7	7	0	0	2017	7	2017-01-02 04:46:49.60161	2017-01-02 04:46:49.60161
38965	83	8	5	5	0	0	2017	5	2017-01-02 04:46:49.611617	2017-01-02 04:46:49.611617
38966	83	9	0	0	0	0	2017	0	2017-01-02 04:46:49.621671	2017-01-02 04:46:49.621671
38967	62	1	5	5	0	0	2017	5	2017-01-02 04:46:49.631675	2017-01-02 04:46:49.631675
38968	62	2	15	15	0	0	2017	15	2017-01-02 04:46:49.641686	2017-01-02 04:46:49.641686
38969	62	3	7	7	0	0	2017	7	2017-01-02 04:46:49.651823	2017-01-02 04:46:49.651823
38970	62	4	7	7	0	0	2017	7	2017-01-02 04:46:49.661744	2017-01-02 04:46:49.661744
38971	62	5	5	5	0	0	2017	5	2017-01-02 04:46:49.671835	2017-01-02 04:46:49.671835
38972	62	6	84	84	0	0	2017	84	2017-01-02 04:46:49.681818	2017-01-02 04:46:49.681818
38973	62	7	7	7	0	0	2017	7	2017-01-02 04:46:49.691886	2017-01-02 04:46:49.691886
38974	62	8	5	5	0	0	2017	5	2017-01-02 04:46:49.701886	2017-01-02 04:46:49.701886
38975	62	9	0	0	0	0	2017	0	2017-01-02 04:46:49.711944	2017-01-02 04:46:49.711944
38976	38	1	5	5	0	0	2017	5	2017-01-02 04:46:49.72192	2017-01-02 04:46:49.72192
38977	38	2	15	15	0	0	2017	15	2017-01-02 04:46:49.732013	2017-01-02 04:46:49.732013
38978	38	3	7	7	0	0	2017	7	2017-01-02 04:46:49.741929	2017-01-02 04:46:49.741929
38979	38	4	7	7	0	0	2017	7	2017-01-02 04:46:49.752056	2017-01-02 04:46:49.752056
38980	38	5	5	5	0	0	2017	5	2017-01-02 04:46:49.762098	2017-01-02 04:46:49.762098
38982	38	7	7	7	0	0	2017	7	2017-01-02 04:46:49.782128	2017-01-02 04:46:49.782128
38983	38	8	5	5	0	0	2017	5	2017-01-02 04:46:49.792183	2017-01-02 04:46:49.792183
38984	38	9	0	0	0	0	2017	0	2017-01-02 04:46:49.802181	2017-01-02 04:46:49.802181
38985	30	1	5	5	0	0	2017	5	2017-01-02 04:46:49.812238	2017-01-02 04:46:49.812238
38986	30	2	15	15	0	0	2017	15	2017-01-02 04:46:49.822201	2017-01-02 04:46:49.822201
38987	30	3	7	7	0	0	2017	7	2017-01-02 04:46:49.832275	2017-01-02 04:46:49.832275
38988	30	4	7	7	0	0	2017	7	2017-01-02 04:46:49.842281	2017-01-02 04:46:49.842281
38989	30	5	5	5	0	0	2017	5	2017-01-02 04:46:49.852285	2017-01-02 04:46:49.852285
38991	30	7	7	7	0	0	2017	7	2017-01-02 04:46:49.87234	2017-01-02 04:46:49.87234
38992	30	8	5	5	0	0	2017	5	2017-01-02 04:46:49.88238	2017-01-02 04:46:49.88238
38993	30	9	0	0	0	0	2017	0	2017-01-02 04:46:49.892391	2017-01-02 04:46:49.892391
38994	42	1	5	5	0	0	2017	5	2017-01-02 04:46:49.902424	2017-01-02 04:46:49.902424
38995	42	2	15	15	0	0	2017	15	2017-01-02 04:46:49.912495	2017-01-02 04:46:49.912495
38996	42	3	7	7	0	0	2017	7	2017-01-02 04:46:49.922508	2017-01-02 04:46:49.922508
38997	42	4	7	7	0	0	2017	7	2017-01-02 04:46:49.932533	2017-01-02 04:46:49.932533
38998	42	5	5	5	0	0	2017	5	2017-01-02 04:46:49.942472	2017-01-02 04:46:49.942472
39000	42	7	7	7	0	0	2017	7	2017-01-02 04:46:49.962605	2017-01-02 04:46:49.962605
39001	42	8	5	5	0	0	2017	5	2017-01-02 04:46:49.972535	2017-01-02 04:46:49.972535
39002	42	9	0	0	0	0	2017	0	2017-01-02 04:46:49.98267	2017-01-02 04:46:49.98267
39003	53	1	5	5	0	0	2017	5	2017-01-02 04:46:49.992678	2017-01-02 04:46:49.992678
39004	53	2	15	15	0	0	2017	15	2017-01-02 04:46:50.002671	2017-01-02 04:46:50.002671
39005	53	3	7	7	0	0	2017	7	2017-01-02 04:46:50.01267	2017-01-02 04:46:50.01267
39006	53	4	7	7	0	0	2017	7	2017-01-02 04:46:50.02267	2017-01-02 04:46:50.02267
39007	53	5	5	5	0	0	2017	5	2017-01-02 04:46:50.032761	2017-01-02 04:46:50.032761
39008	53	6	84	84	0	0	2017	84	2017-01-02 04:46:50.042763	2017-01-02 04:46:50.042763
39010	53	8	5	5	0	0	2017	5	2017-01-02 04:46:50.062815	2017-01-02 04:46:50.062815
39011	53	9	0	0	0	0	2017	0	2017-01-02 04:46:50.072864	2017-01-02 04:46:50.072864
39012	70	1	5	5	0	0	2017	5	2017-01-02 04:46:50.082877	2017-01-02 04:46:50.082877
39014	70	3	7	7	0	0	2017	7	2017-01-02 04:46:50.102779	2017-01-02 04:46:50.102779
39015	70	4	7	7	0	0	2017	7	2017-01-02 04:46:50.112876	2017-01-02 04:46:50.112876
39017	70	6	84	84	0	0	2017	84	2017-01-02 04:46:50.132916	2017-01-02 04:46:50.132916
39021	48	1	5	5	0	0	2017	5	2017-01-02 04:46:50.173033	2017-01-02 04:46:50.173033
39022	48	2	15	15	0	0	2017	15	2017-01-02 04:46:50.183035	2017-01-02 04:46:50.183035
39023	48	3	7	7	0	0	2017	7	2017-01-02 04:46:50.193066	2017-01-02 04:46:50.193066
39024	48	4	7	7	0	0	2017	7	2017-01-02 04:46:50.203085	2017-01-02 04:46:50.203085
39027	48	7	7	7	0	0	2017	7	2017-01-02 04:46:50.233152	2017-01-02 04:46:50.233152
39028	48	8	5	5	0	0	2017	5	2017-01-02 04:46:50.243165	2017-01-02 04:46:50.243165
39029	48	9	0	0	0	0	2017	0	2017-01-02 04:46:50.253206	2017-01-02 04:46:50.253206
39030	10	1	5	5	0	0	2017	5	2017-01-02 04:46:50.26321	2017-01-02 04:46:50.26321
39031	10	2	15	15	0	0	2017	15	2017-01-02 04:46:50.273236	2017-01-02 04:46:50.273236
39032	10	3	7	7	0	0	2017	7	2017-01-02 04:46:50.283296	2017-01-02 04:46:50.283296
39033	10	4	7	7	0	0	2017	7	2017-01-02 04:46:50.293315	2017-01-02 04:46:50.293315
39034	10	5	5	5	0	0	2017	5	2017-01-02 04:46:50.303355	2017-01-02 04:46:50.303355
39018	70	7	7	0	0	0	2017	0	2017-01-02 04:46:50.142901	2017-01-02 04:47:22.078845
38981	38	6	84	0	0	0	2017	0	2017-01-02 04:46:49.772156	2017-01-02 04:47:23.551777
38990	30	6	84	0	0	0	2017	0	2017-01-02 04:46:49.862322	2017-01-02 04:47:23.571778
38999	42	6	84	0	0	0	2017	0	2017-01-02 04:46:49.952496	2017-01-02 04:47:23.591842
39026	48	6	84	0	0	0	2017	0	2017-01-02 04:46:50.223122	2017-01-02 04:47:23.611883
39025	48	5	5	4	1	0	2017	5	2017-01-02 04:46:50.213114	2017-05-17 09:37:28.780309
39020	70	9	1	0	1	0	2017	1	2017-01-02 04:46:50.162959	2017-03-20 05:06:01.566916
39013	70	2	15	7	8	0	2017	15	2017-01-02 04:46:50.092876	2017-08-08 09:25:26.477076
39019	70	8	5	3	2	0	2017	5	2017-01-02 04:46:50.15298	2017-06-27 10:58:04.319086
1696	125	3	7	7	0	0	2013	7	\N	\N
1697	125	4	7	7	0	0	2013	7	\N	\N
1700	125	7	7	7	0	0	2013	7	\N	\N
1702	125	9	0	0	0	0	2013	0	\N	\N
1699	125	6	84	0	0	0	2013	0	\N	\N
1703	126	1	5	5	0	0	2013	5	\N	\N
1704	126	2	15	15	0	0	2013	15	\N	\N
1705	126	3	7	7	0	0	2013	7	\N	\N
1706	126	4	7	7	0	0	2013	7	\N	\N
1707	126	5	5	5	0	0	2013	5	\N	\N
1709	126	7	7	7	0	0	2013	7	\N	\N
1710	126	8	5	5	0	0	2013	5	\N	\N
1711	126	9	0	0	0	0	2013	0	\N	\N
1708	126	6	84	0	0	0	2013	0	\N	\N
1714	127	3	7	7	0	0	2013	7	\N	\N
1715	127	4	7	7	0	0	2013	7	\N	\N
1716	127	5	5	5	0	0	2013	5	\N	\N
1718	127	7	7	7	0	0	2013	7	\N	\N
1720	127	9	0	0	0	0	2013	0	\N	\N
1717	127	6	84	0	0	0	2013	0	\N	\N
1721	128	1	5	5	0	0	2013	5	\N	\N
1722	128	2	15	15	0	0	2013	15	\N	\N
1723	128	3	7	7	0	0	2013	7	\N	\N
1724	128	4	7	7	0	0	2013	7	\N	\N
1726	128	6	84	84	0	0	2013	84	\N	\N
1727	128	7	7	0	0	0	2013	0	\N	\N
1732	129	3	7	7	0	0	2013	7	\N	\N
1736	129	7	7	7	0	0	2013	7	\N	\N
1738	129	9	0	0	0	0	2013	0	\N	\N
1735	129	6	84	0	0	0	2013	0	\N	\N
1741	130	3	7	7	0	0	2013	7	\N	\N
1742	130	4	7	7	0	0	2013	7	\N	\N
1743	130	5	5	5	0	0	2013	5	\N	\N
1745	130	7	7	7	0	0	2013	7	\N	\N
1747	130	9	0	0	0	0	2013	0	\N	\N
1744	130	6	84	0	0	0	2013	0	\N	\N
1750	131	3	7	7	0	0	2013	7	\N	\N
1751	131	4	7	7	0	0	2013	7	\N	\N
1753	131	6	84	84	0	0	2013	84	\N	\N
1756	131	9	0	0	0	0	2013	0	\N	\N
1754	131	7	7	0	0	0	2013	0	\N	\N
1760	132	4	7	7	0	0	2013	7	\N	\N
1761	132	5	5	5	0	0	2013	5	\N	\N
1763	132	7	7	7	0	0	2013	7	\N	\N
1765	132	9	0	0	0	0	2013	0	\N	\N
1762	132	6	84	0	0	0	2013	0	\N	\N
1779	134	5	5	4.5	0.5	0	2013	5	\N	\N
1092	29	2	15	0	15	0	2013	15	\N	\N
1733	129	4	7	7	0	0	2013	7	\N	\N
1749	131	2	15	5	10	0	2013	15	\N	\N
1768	133	3	7	7	0	0	2013	7	\N	\N
1769	133	4	7	7	0	0	2013	7	\N	\N
1770	133	5	5	5	0	0	2013	5	\N	\N
1772	133	7	7	7	0	0	2013	7	\N	\N
1773	133	8	5	5	0	0	2013	5	\N	\N
1774	133	9	0	0	0	0	2013	0	\N	\N
1771	133	6	84	0	0	0	2013	0	\N	\N
1757	132	1	5	3	2	0	2013	5	\N	\N
1775	134	1	5	5	0	0	2013	5	\N	\N
1777	134	3	7	7	0	0	2013	7	\N	\N
1778	134	4	7	7	0	0	2013	7	\N	\N
1731	129	2	15	10	5	0	2013	15	\N	\N
1740	130	2	15	14	1	0	2013	15	\N	\N
1746	130	8	5	4	1	0	2013	5	\N	\N
1767	133	2	15	14	1	0	2013	15	\N	\N
1730	129	1	5	4	1	0	2013	5	\N	\N
1728	128	8	5	4	1	0	2013	5	\N	\N
1764	132	8	5	4	1	0	2013	5	\N	\N
1752	131	5	5	3.5	1.5	0	2013	5	\N	\N
1698	125	5	5	4	1	0	2013	5	\N	\N
1766	133	1	5	4	1	0	2013	5	\N	\N
1734	129	5	5	3	2	0	2013	5	\N	\N
1759	132	3	7	5	2	0	2013	7	\N	\N
1719	127	8	5	2	3	0	2013	5	\N	\N
1758	132	2	15	13	2	0	2013	15	\N	\N
1712	127	1	5	4	1	0	2013	5	\N	\N
1694	125	1	5	3	2	0	2013	5	\N	\N
1725	128	5	5	4	1	0	2013	5	\N	\N
1776	134	2	15	14	1	0	2013	15	\N	\N
1713	127	2	15	9	6	0	2013	15	\N	\N
1353	80	2	15	1	14	0	2013	15	\N	\N
1695	125	2	15	13	2	0	2013	15	\N	\N
1748	131	1	5	3	2	0	2013	5	\N	\N
1755	131	8	5	2	3	0	2013	5	\N	\N
1701	125	8	5	2	3	0	2013	5	\N	\N
1781	134	7	7	7	0	0	2013	7	\N	\N
1782	134	8	5	5	0	0	2013	5	\N	\N
1783	134	9	0	0	0	0	2013	0	\N	\N
1780	134	6	84	0	0	0	2013	0	\N	\N
1452	98	2	15	5	10	0	2013	15	\N	\N
1739	130	1	5	4	1	0	2013	5	\N	\N
1784	135	1	5	5	0	0	2013	5	\N	\N
1785	135	2	15	15	0	0	2013	15	\N	\N
1786	135	3	7	7	0	0	2013	7	\N	\N
1787	135	4	7	7	0	0	2013	7	\N	\N
1788	135	5	5	5	0	0	2013	5	\N	\N
1789	135	6	84	84	0	0	2013	84	\N	\N
1792	135	9	0	0	0	0	2013	0	\N	\N
1790	135	7	7	0	0	0	2013	0	\N	\N
1794	136	2	15	15	0	0	2013	15	\N	\N
1795	136	3	7	7	0	0	2013	7	\N	\N
1796	136	4	7	7	0	0	2013	7	\N	\N
1799	136	7	7	7	0	0	2013	7	\N	\N
1801	136	9	0	0	0	0	2013	0	\N	\N
1798	136	6	84	0	0	0	2013	0	\N	\N
1802	137	1	5	5	0	0	2013	5	\N	\N
1803	137	2	15	15	0	0	2013	15	\N	\N
1804	137	3	7	7	0	0	2013	7	\N	\N
1805	137	4	7	7	0	0	2013	7	\N	\N
1806	137	5	5	5	0	0	2013	5	\N	\N
1807	137	6	84	84	0	0	2013	84	\N	\N
1809	137	8	5	5	0	0	2013	5	\N	\N
1810	137	9	0	0	0	0	2013	0	\N	\N
1808	137	7	7	0	0	0	2013	0	\N	\N
1813	138	3	7	7	0	0	2013	7	\N	\N
1814	138	4	7	7	0	0	2013	7	\N	\N
1816	138	6	84	84	0	0	2013	84	\N	\N
1819	138	9	0	0	0	0	2013	0	\N	\N
1817	138	7	7	0	0	0	2013	0	\N	\N
1791	135	8	5	4	1	0	2013	5	\N	\N
1865	144	1	5	3	2	0	2013	5	\N	\N
1800	136	8	5	4	1	0	2013	5	\N	\N
1843	141	6	84	0	0	0	2013	0	\N	\N
1793	136	1	5	2	3	0	2013	5	\N	\N
1863	143	8	5	3	2	0	2013	5	\N	\N
1822	139	3	7	7	0	0	2013	7	\N	\N
1823	139	4	7	7	0	0	2013	7	\N	\N
1825	139	6	84	84	0	0	2013	84	\N	\N
1828	139	9	0	0	0	0	2013	0	\N	\N
1826	139	7	7	0	0	0	2013	0	\N	\N
1831	140	3	7	7	0	0	2013	7	\N	\N
1832	140	4	7	7	0	0	2013	7	\N	\N
1834	140	6	84	84	0	0	2013	84	\N	\N
1837	140	9	0	0	0	0	2013	0	\N	\N
1835	140	7	7	0	0	0	2013	0	\N	\N
1838	141	1	5	5	0	0	2013	5	\N	\N
1839	141	2	15	15	0	0	2013	15	\N	\N
1840	141	3	7	7	0	0	2013	7	\N	\N
1841	141	4	7	7	0	0	2013	7	\N	\N
1842	141	5	5	5	0	0	2013	5	\N	\N
1844	141	7	7	7	0	0	2013	7	\N	\N
1845	141	8	5	5	0	0	2013	5	\N	\N
1846	141	9	0	0	0	0	2013	0	\N	\N
1847	142	1	5	5	0	0	2013	5	\N	\N
1848	142	2	15	15	0	0	2013	15	\N	\N
1849	142	3	7	7	0	0	2013	7	\N	\N
1850	142	4	7	7	0	0	2013	7	\N	\N
1851	142	5	5	5	0	0	2013	5	\N	\N
1853	142	7	7	7	0	0	2013	7	\N	\N
1855	142	9	0	0	0	0	2013	0	\N	\N
1852	142	6	84	0	0	0	2013	0	\N	\N
1858	143	3	7	7	0	0	2013	7	\N	\N
1859	143	4	7	7	0	0	2013	7	\N	\N
1860	143	5	5	5	0	0	2013	5	\N	\N
1862	143	7	7	7	0	0	2013	7	\N	\N
1864	143	9	0	0	0	0	2013	0	\N	\N
1737	129	8	5	2	3	0	2013	5	\N	\N
1827	139	8	5	4	1	0	2013	5	\N	\N
1812	138	2	15	8	7	0	2013	15	\N	\N
1815	138	5	5	4	1	0	2013	5	\N	\N
1811	138	1	5	4	1	0	2013	5	\N	\N
1833	140	5	5	4.5	0.5	0	2013	5	\N	\N
1820	139	1	5	3	2	0	2013	5	\N	\N
1824	139	5	5	4	1	0	2013	5	\N	\N
1854	142	8	5	4	1	0	2013	5	\N	\N
1856	143	1	5	4	1	0	2013	5	\N	\N
1818	138	8	5	4	1	0	2013	5	\N	\N
1821	139	2	15	10	5	0	2013	15	\N	\N
1829	140	1	5	3.5	1.5	0	2013	5	\N	\N
1836	140	8	5	4	1	0	2013	5	\N	\N
1830	140	2	15	13	2	0	2013	15	\N	\N
1861	143	6	84	0	0	0	2013	0	\N	\N
39036	10	7	7	7	0	0	2017	7	2017-01-02 04:46:50.323314	2017-01-02 04:46:50.323314
39037	10	8	5	5	0	0	2017	5	2017-01-02 04:46:50.333363	2017-01-02 04:46:50.333363
39038	10	9	0	0	0	0	2017	0	2017-01-02 04:46:50.343454	2017-01-02 04:46:50.343454
39039	2	1	5	5	0	0	2017	5	2017-01-02 04:46:50.353495	2017-01-02 04:46:50.353495
39040	2	2	15	15	0	0	2017	15	2017-01-02 04:46:50.363531	2017-01-02 04:46:50.363531
39041	2	3	7	7	0	0	2017	7	2017-01-02 04:46:50.373494	2017-01-02 04:46:50.373494
39042	2	4	7	7	0	0	2017	7	2017-01-02 04:46:50.383477	2017-01-02 04:46:50.383477
39043	2	5	5	5	0	0	2017	5	2017-01-02 04:46:50.394118	2017-01-02 04:46:50.394118
39044	2	6	84	84	0	0	2017	84	2017-01-02 04:46:50.404241	2017-01-02 04:46:50.404241
39045	2	7	7	7	0	0	2017	7	2017-01-02 04:46:50.414273	2017-01-02 04:46:50.414273
39046	2	8	5	5	0	0	2017	5	2017-01-02 04:46:50.424163	2017-01-02 04:46:50.424163
39047	2	9	0	0	0	0	2017	0	2017-01-02 04:46:50.434048	2017-01-02 04:46:50.434048
39048	75	1	5	5	0	0	2017	5	2017-01-02 04:46:50.444098	2017-01-02 04:46:50.444098
39049	75	2	15	15	0	0	2017	15	2017-01-02 04:46:50.454081	2017-01-02 04:46:50.454081
39050	75	3	7	7	0	0	2017	7	2017-01-02 04:46:50.464146	2017-01-02 04:46:50.464146
39051	75	4	7	7	0	0	2017	7	2017-01-02 04:46:50.474023	2017-01-02 04:46:50.474023
39052	75	5	5	5	0	0	2017	5	2017-01-02 04:46:50.484099	2017-01-02 04:46:50.484099
39054	75	7	7	7	0	0	2017	7	2017-01-02 04:46:50.504072	2017-01-02 04:46:50.504072
39055	75	8	5	5	0	0	2017	5	2017-01-02 04:46:50.513954	2017-01-02 04:46:50.513954
39056	75	9	0	0	0	0	2017	0	2017-01-02 04:46:50.524015	2017-01-02 04:46:50.524015
39057	60	1	5	5	0	0	2017	5	2017-01-02 04:46:50.534018	2017-01-02 04:46:50.534018
39058	60	2	15	15	0	0	2017	15	2017-01-02 04:46:50.544084	2017-01-02 04:46:50.544084
39059	60	3	7	7	0	0	2017	7	2017-01-02 04:46:50.554042	2017-01-02 04:46:50.554042
39060	60	4	7	7	0	0	2017	7	2017-01-02 04:46:50.56412	2017-01-02 04:46:50.56412
39061	60	5	5	5	0	0	2017	5	2017-01-02 04:46:50.5741	2017-01-02 04:46:50.5741
39063	60	7	7	7	0	0	2017	7	2017-01-02 04:46:50.594188	2017-01-02 04:46:50.594188
39064	60	8	5	5	0	0	2017	5	2017-01-02 04:46:50.604267	2017-01-02 04:46:50.604267
39065	60	9	0	0	0	0	2017	0	2017-01-02 04:46:50.614265	2017-01-02 04:46:50.614265
39066	94	1	5	5	0	0	2017	5	2017-01-02 04:46:50.624315	2017-01-02 04:46:50.624315
39067	94	2	15	15	0	0	2017	15	2017-01-02 04:46:50.634313	2017-01-02 04:46:50.634313
39068	94	3	7	7	0	0	2017	7	2017-01-02 04:46:50.644379	2017-01-02 04:46:50.644379
39069	94	4	7	7	0	0	2017	7	2017-01-02 04:46:50.694673	2017-01-02 04:46:50.694673
39070	94	5	5	5	0	0	2017	5	2017-01-02 04:46:50.715004	2017-01-02 04:46:50.715004
39072	94	7	7	7	0	0	2017	7	2017-01-02 04:46:50.734952	2017-01-02 04:46:50.734952
39073	94	8	5	5	0	0	2017	5	2017-01-02 04:46:50.74482	2017-01-02 04:46:50.74482
39074	94	9	0	0	0	0	2017	0	2017-01-02 04:46:50.754881	2017-01-02 04:46:50.754881
39077	45	3	7	7	0	0	2017	7	2017-01-02 04:46:50.784874	2017-01-02 04:46:50.784874
39078	45	4	7	7	0	0	2017	7	2017-01-02 04:46:50.794892	2017-01-02 04:46:50.794892
39082	45	8	5	5	0	0	2017	5	2017-01-02 04:46:50.834893	2017-01-02 04:46:50.834893
39083	45	9	0	0	0	0	2017	0	2017-01-02 04:46:50.844934	2017-01-02 04:46:50.844934
39084	81	1	5	5	0	0	2017	5	2017-01-02 04:46:50.854938	2017-01-02 04:46:50.854938
39085	81	2	15	15	0	0	2017	15	2017-01-02 04:46:50.865004	2017-01-02 04:46:50.865004
39086	81	3	7	7	0	0	2017	7	2017-01-02 04:46:50.874991	2017-01-02 04:46:50.874991
39087	81	4	7	7	0	0	2017	7	2017-01-02 04:46:50.885046	2017-01-02 04:46:50.885046
39088	81	5	5	5	0	0	2017	5	2017-01-02 04:46:50.895046	2017-01-02 04:46:50.895046
39089	81	6	84	84	0	0	2017	84	2017-01-02 04:46:50.905093	2017-01-02 04:46:50.905093
39091	81	8	5	5	0	0	2017	5	2017-01-02 04:46:50.925148	2017-01-02 04:46:50.925148
39092	81	9	0	0	0	0	2017	0	2017-01-02 04:46:50.935138	2017-01-02 04:46:50.935138
39093	47	1	5	5	0	0	2017	5	2017-01-02 04:46:50.945162	2017-01-02 04:46:50.945162
39094	47	2	15	15	0	0	2017	15	2017-01-02 04:46:50.955152	2017-01-02 04:46:50.955152
39095	47	3	7	7	0	0	2017	7	2017-01-02 04:46:50.965193	2017-01-02 04:46:50.965193
39096	47	4	7	7	0	0	2017	7	2017-01-02 04:46:50.976378	2017-01-02 04:46:50.976378
39097	47	5	5	5	0	0	2017	5	2017-01-02 04:46:50.985051	2017-01-02 04:46:50.985051
39099	47	7	7	7	0	0	2017	7	2017-01-02 04:46:51.005343	2017-01-02 04:46:51.005343
39100	47	8	5	5	0	0	2017	5	2017-01-02 04:46:51.01536	2017-01-02 04:46:51.01536
39101	47	9	0	0	0	0	2017	0	2017-01-02 04:46:51.025882	2017-01-02 04:46:51.025882
39102	44	1	5	5	0	0	2017	5	2017-01-02 04:46:51.035776	2017-01-02 04:46:51.035776
39103	44	2	15	15	0	0	2017	15	2017-01-02 04:46:51.045737	2017-01-02 04:46:51.045737
39104	44	3	7	7	0	0	2017	7	2017-01-02 04:46:51.055709	2017-01-02 04:46:51.055709
39105	44	4	7	7	0	0	2017	7	2017-01-02 04:46:51.06562	2017-01-02 04:46:51.06562
39106	44	5	5	5	0	0	2017	5	2017-01-02 04:46:51.075668	2017-01-02 04:46:51.075668
39108	44	7	7	7	0	0	2017	7	2017-01-02 04:46:51.095653	2017-01-02 04:46:51.095653
39109	44	8	5	5	0	0	2017	5	2017-01-02 04:46:51.105501	2017-01-02 04:46:51.105501
39053	75	6	84	0	0	0	2017	0	2017-01-02 04:46:50.49398	2017-01-02 04:47:23.651987
39062	60	6	84	0	0	0	2017	0	2017-01-02 04:46:50.584178	2017-01-02 04:47:23.671992
39071	94	6	84	0	0	0	2017	0	2017-01-02 04:46:50.724936	2017-01-02 04:47:23.692031
39080	45	6	84	0	0	0	2017	0	2017-01-02 04:46:50.814842	2017-01-02 04:47:23.712059
39098	47	6	84	0	0	0	2017	0	2017-01-02 04:46:50.995087	2017-01-02 04:47:23.73213
39107	44	6	84	0	0	0	2017	0	2017-01-02 04:46:51.085711	2017-01-02 04:47:23.752169
39081	45	7	7	0	7	0	2017	7	2017-01-02 04:46:50.824901	2017-05-15 06:09:01.551631
39079	45	5	5	3.5	1.5	0	2017	5	2017-01-02 04:46:50.804848	2017-07-26 05:45:55.653377
39075	45	1	5	0	5	0	2017	5	2017-01-02 04:46:50.764827	2017-06-28 07:44:28.360562
39076	45	2	15	7	8	0	2017	15	2017-01-02 04:46:50.774842	2017-06-28 07:45:33.041673
1866	144	2	15	15	0	0	2013	15	\N	\N
1867	144	3	7	7	0	0	2013	7	\N	\N
1868	144	4	7	7	0	0	2013	7	\N	\N
1869	144	5	5	5	0	0	2013	5	\N	\N
1871	144	7	7	7	0	0	2013	7	\N	\N
1873	144	9	0	0	0	0	2013	0	\N	\N
1870	144	6	84	0	0	0	2013	0	\N	\N
1797	136	5	5	4	1	0	2013	5	\N	\N
1874	145	1	5	5	0	0	2013	5	\N	\N
1875	145	2	15	15	0	0	2013	15	\N	\N
1876	145	3	7	7	0	0	2013	7	\N	\N
1877	145	4	7	7	0	0	2013	7	\N	\N
1880	145	7	7	7	0	0	2013	7	\N	\N
1882	145	9	0	0	0	0	2013	0	\N	\N
1879	145	6	84	0	0	0	2013	0	\N	\N
1883	146	1	5	5	0	0	2013	5	\N	\N
1885	146	3	7	7	0	0	2013	7	\N	\N
1886	146	4	7	7	0	0	2013	7	\N	\N
1887	146	5	5	5	0	0	2013	5	\N	\N
1888	146	6	84	84	0	0	2013	84	\N	\N
39110	44	9	0	0	0	0	2017	0	2017-01-02 04:46:51.115592	2017-01-02 04:46:51.115592
1891	146	9	0	0	0	0	2013	0	\N	\N
1889	146	7	7	0	0	0	2013	0	\N	\N
1892	147	1	5	5	0	0	2013	5	\N	\N
1894	147	3	7	7	0	0	2013	7	\N	\N
1895	147	4	7	7	0	0	2013	7	\N	\N
1896	147	5	5	5	0	0	2013	5	\N	\N
1897	147	6	84	84	0	0	2013	84	\N	\N
1900	147	9	0	0	0	0	2013	0	\N	\N
1898	147	7	7	0	0	0	2013	0	\N	\N
1901	148	1	5	5	0	0	2013	5	\N	\N
1902	148	2	15	15	0	0	2013	15	\N	\N
1903	148	3	7	7	0	0	2013	7	\N	\N
1904	148	4	7	7	0	0	2013	7	\N	\N
1905	148	5	5	5	0	0	2013	5	\N	\N
1907	148	7	7	7	0	0	2013	7	\N	\N
1908	148	8	5	5	0	0	2013	5	\N	\N
1909	148	9	0	0	0	0	2013	0	\N	\N
1906	148	6	84	0	0	0	2013	0	\N	\N
1912	149	3	7	7	0	0	2013	7	\N	\N
1913	149	4	7	7	0	0	2013	7	\N	\N
1916	149	7	7	7	0	0	2013	7	\N	\N
1917	149	8	5	5	0	0	2013	5	\N	\N
1918	149	9	0	0	0	0	2013	0	\N	\N
1915	149	6	84	0	0	0	2013	0	\N	\N
1919	150	1	5	5	0	0	2013	5	\N	\N
1920	150	2	15	15	0	0	2013	15	\N	\N
1921	150	3	7	7	0	0	2013	7	\N	\N
1922	150	4	7	7	0	0	2013	7	\N	\N
1923	150	5	5	5	0	0	2013	5	\N	\N
1924	150	6	84	84	0	0	2013	84	\N	\N
1926	150	8	5	5	0	0	2013	5	\N	\N
1927	150	9	0	0	0	0	2013	0	\N	\N
1925	150	7	7	0	0	0	2013	0	\N	\N
1929	151	2	15	15	0	0	2013	15	\N	\N
1930	151	3	7	7	0	0	2013	7	\N	\N
1931	151	4	7	7	0	0	2013	7	\N	\N
1932	151	5	5	5	0	0	2013	5	\N	\N
1933	151	6	84	84	0	0	2013	84	\N	\N
1935	151	8	5	5	0	0	2013	5	\N	\N
1936	151	9	0	0	0	0	2013	0	\N	\N
1934	151	7	7	0	0	0	2013	0	\N	\N
1857	143	2	15	10	5	0	2013	15	\N	\N
1937	152	1	5	5	0	0	2013	5	\N	\N
1938	152	2	15	15	0	0	2013	15	\N	\N
1939	152	3	7	7	0	0	2013	7	\N	\N
1940	152	4	7	7	0	0	2013	7	\N	\N
1941	152	5	5	5	0	0	2013	5	\N	\N
1943	152	7	7	7	0	0	2013	7	\N	\N
1944	152	8	5	5	0	0	2013	5	\N	\N
1945	152	9	0	0	0	0	2013	0	\N	\N
1942	152	6	84	0	0	0	2013	0	\N	\N
1946	153	1	5	5	0	0	2013	5	\N	\N
1947	153	2	15	15	0	0	2013	15	\N	\N
1948	153	3	7	7	0	0	2013	7	\N	\N
1949	153	4	7	7	0	0	2013	7	\N	\N
1950	153	5	5	5	0	0	2013	5	\N	\N
1928	151	1	5	4	1	0	2013	5	\N	\N
1893	147	2	15	13	2	0	2013	15	\N	\N
1884	146	2	15	12	3	0	2013	15	\N	\N
1914	149	5	5	3	2	0	2013	5	\N	\N
1911	149	2	15	11	4	0	2013	15	\N	\N
1910	149	1	5	3	2	0	2013	5	\N	\N
1899	147	8	5	4	1	0	2013	5	\N	\N
1872	144	8	5	4	1	0	2013	5	\N	\N
1878	145	5	5	4	1	0	2013	5	\N	\N
1881	145	8	5	3	2	0	2013	5	\N	\N
1952	153	7	7	7	0	0	2013	7	\N	\N
1953	153	8	5	5	0	0	2013	5	\N	\N
1954	153	9	0	0	0	0	2013	0	\N	\N
1951	153	6	84	0	0	0	2013	0	\N	\N
1955	154	1	5	5	0	0	2013	5	\N	\N
1956	154	2	15	15	0	0	2013	15	\N	\N
1957	154	3	7	7	0	0	2013	7	\N	\N
1958	154	4	7	7	0	0	2013	7	\N	\N
1959	154	5	5	5	0	0	2013	5	\N	\N
1961	154	7	7	7	0	0	2013	7	\N	\N
1962	154	8	5	5	0	0	2013	5	\N	\N
1963	154	9	0	0	0	0	2013	0	\N	\N
1960	154	6	84	0	0	0	2013	0	\N	\N
1964	155	1	5	5	0	0	2013	5	\N	\N
1965	155	2	15	15	0	0	2013	15	\N	\N
1966	155	3	7	7	0	0	2013	7	\N	\N
1967	155	4	7	7	0	0	2013	7	\N	\N
1968	155	5	5	5	0	0	2013	5	\N	\N
1970	155	7	7	7	0	0	2013	7	\N	\N
1971	155	8	5	5	0	0	2013	5	\N	\N
1972	155	9	0	0	0	0	2013	0	\N	\N
1969	155	6	84	0	0	0	2013	0	\N	\N
1974	156	2	15	15	0	0	2013	15	\N	\N
1975	156	3	7	7	0	0	2013	7	\N	\N
1976	156	4	7	7	0	0	2013	7	\N	\N
1977	156	5	5	5	0	0	2013	5	\N	\N
1979	156	7	7	7	0	0	2013	7	\N	\N
1980	156	8	5	5	0	0	2013	5	\N	\N
1981	156	9	0	0	0	0	2013	0	\N	\N
1978	156	6	84	0	0	0	2013	0	\N	\N
1982	157	1	5	5	0	0	2013	5	\N	\N
1983	157	2	15	15	0	0	2013	15	\N	\N
1984	157	3	7	7	0	0	2013	7	\N	\N
1985	157	4	7	7	0	0	2013	7	\N	\N
1986	157	5	5	5	0	0	2013	5	\N	\N
1988	157	7	7	7	0	0	2013	7	\N	\N
1989	157	8	5	5	0	0	2013	5	\N	\N
1990	157	9	0	0	0	0	2013	0	\N	\N
1987	157	6	84	0	0	0	2013	0	\N	\N
1991	158	1	5	5	0	0	2013	5	\N	\N
1992	158	2	15	15	0	0	2013	15	\N	\N
1993	158	3	7	7	0	0	2013	7	\N	\N
1994	158	4	7	7	0	0	2013	7	\N	\N
1995	158	5	5	5	0	0	2013	5	\N	\N
1997	158	7	7	7	0	0	2013	7	\N	\N
1998	158	8	5	5	0	0	2013	5	\N	\N
1999	158	9	0	0	0	0	2013	0	\N	\N
1996	158	6	84	0	0	0	2013	0	\N	\N
2001	159	2	15	15	0	0	2013	15	\N	\N
2002	159	3	7	7	0	0	2013	7	\N	\N
2003	159	4	7	7	0	0	2013	7	\N	\N
2004	159	5	5	5	0	0	2013	5	\N	\N
2006	159	7	7	7	0	0	2013	7	\N	\N
2007	159	8	5	5	0	0	2013	5	\N	\N
2008	159	9	0	0	0	0	2013	0	\N	\N
2005	159	6	84	0	0	0	2013	0	\N	\N
2009	160	1	5	5	0	0	2013	5	\N	\N
2010	160	2	15	15	0	0	2013	15	\N	\N
2011	160	3	7	7	0	0	2013	7	\N	\N
2012	160	4	7	7	0	0	2013	7	\N	\N
2013	160	5	5	5	0	0	2013	5	\N	\N
2015	160	7	7	7	0	0	2013	7	\N	\N
2016	160	8	5	5	0	0	2013	5	\N	\N
2017	160	9	0	0	0	0	2013	0	\N	\N
2014	160	6	84	0	0	0	2013	0	\N	\N
1113	77	5	5	0	5	0	2013	5	\N	\N
2018	62	1	5	5	0	0	2014	5	\N	\N
2019	62	2	15	15	0	0	2014	15	\N	\N
2020	62	3	7	7	0	0	2014	7	\N	\N
2021	62	4	7	7	0	0	2014	7	\N	\N
2022	62	5	5	5	0	0	2014	5	\N	\N
2023	62	6	84	84	0	0	2014	84	\N	\N
2024	62	7	7	7	0	0	2014	7	\N	\N
2025	62	8	5	5	0	0	2014	5	\N	\N
2026	62	9	0	0	0	0	2014	0	\N	\N
2027	73	1	5	5	0	0	2014	5	\N	\N
2028	73	2	15	15	0	0	2014	15	\N	\N
2029	73	3	7	7	0	0	2014	7	\N	\N
2000	159	1	5	4	1	0	2013	5	\N	\N
1973	156	1	5	3	2	0	2013	5	\N	\N
39114	77	4	7	7	0	0	2017	7	2017-01-02 04:46:51.155679	2017-01-02 04:46:51.155679
39117	77	7	7	7	0	0	2017	7	2017-01-02 04:46:51.185806	2017-01-02 04:46:51.185806
39113	77	3	7	0	7	0	2017	7	2017-01-02 04:46:51.145655	2017-05-30 07:39:31.603489
39111	77	1	5	3	2	0	2017	5	2017-01-02 04:46:51.125604	2017-04-12 07:25:42.861327
39112	77	2	15	4	11	0	2017	15	2017-01-02 04:46:51.135652	2017-06-21 07:43:36.738396
2030	73	4	7	7	0	0	2014	7	\N	\N
2031	73	5	5	5	0	0	2014	5	\N	\N
2032	73	6	84	84	0	0	2014	84	\N	\N
2033	73	7	7	7	0	0	2014	7	\N	\N
2034	73	8	5	5	0	0	2014	5	\N	\N
2035	73	9	0	0	0	0	2014	0	\N	\N
2036	43	1	5	5	0	0	2014	5	\N	\N
2037	43	2	15	15	0	0	2014	15	\N	\N
2038	43	3	7	7	0	0	2014	7	\N	\N
2039	43	4	7	7	0	0	2014	7	\N	\N
2040	43	5	5	5	0	0	2014	5	\N	\N
2042	43	7	7	7	0	0	2014	7	\N	\N
2043	43	8	5	5	0	0	2014	5	\N	\N
2044	43	9	0	0	0	0	2014	0	\N	\N
2045	83	1	5	5	0	0	2014	5	\N	\N
2046	83	2	15	15	0	0	2014	15	\N	\N
2047	83	3	7	7	0	0	2014	7	\N	\N
2048	83	4	7	7	0	0	2014	7	\N	\N
2049	83	5	5	5	0	0	2014	5	\N	\N
2050	83	6	84	84	0	0	2014	84	\N	\N
2051	83	7	7	7	0	0	2014	7	\N	\N
2052	83	8	5	5	0	0	2014	5	\N	\N
2053	83	9	0	0	0	0	2014	0	\N	\N
2057	77	4	7	7	0	0	2014	7	\N	\N
2062	77	9	0	0	0	0	2014	0	\N	\N
2063	67	1	5	5	0	0	2014	5	\N	\N
2064	67	2	15	15	0	0	2014	15	\N	\N
2065	67	3	7	7	0	0	2014	7	\N	\N
2066	67	4	7	7	0	0	2014	7	\N	\N
2067	67	5	5	5	0	0	2014	5	\N	\N
2069	67	7	7	7	0	0	2014	7	\N	\N
2070	67	8	5	5	0	0	2014	5	\N	\N
2071	67	9	0	0	0	0	2014	0	\N	\N
2074	40	3	7	7	0	0	2014	7	\N	\N
39119	77	9	0	0	0	0	2017	0	2017-01-02 04:46:51.205805	2017-01-02 04:46:51.205805
2078	40	7	7	7	0	0	2014	7	\N	\N
2082	47	2	15	15	0	0	2014	15	\N	\N
2083	47	3	7	7	0	0	2014	7	\N	\N
2084	47	4	7	7	0	0	2014	7	\N	\N
2085	47	5	5	5	0	0	2014	5	\N	\N
2087	47	7	7	7	0	0	2014	7	\N	\N
2089	47	9	0	0	0	0	2014	0	\N	\N
2090	53	1	5	5	0	0	2014	5	\N	\N
2091	53	2	15	15	0	0	2014	15	\N	\N
2092	53	3	7	7	0	0	2014	7	\N	\N
2093	53	4	7	7	0	0	2014	7	\N	\N
2094	53	5	5	5	0	0	2014	5	\N	\N
2095	53	6	84	84	0	0	2014	84	\N	\N
2097	53	8	5	5	0	0	2014	5	\N	\N
2098	53	9	0	0	0	0	2014	0	\N	\N
2101	91	3	7	7	0	0	2014	7	\N	\N
2102	91	4	7	7	0	0	2014	7	\N	\N
2105	91	7	7	7	0	0	2014	7	\N	\N
2111	71	4	7	7	0	0	2014	7	\N	\N
2114	71	7	7	7	0	0	2014	7	\N	\N
2116	71	9	0	0	0	0	2014	0	\N	\N
2117	10	1	5	5	0	0	2014	5	\N	\N
2059	77	6	84	0	0	0	2014	0	\N	\N
2068	67	6	84	0	0	0	2014	0	\N	\N
2077	40	6	84	0	0	0	2014	0	\N	\N
2086	47	6	84	0	0	0	2014	0	\N	\N
2104	91	6	84	0	0	0	2014	0	\N	\N
2113	71	6	84	0	0	0	2014	0	\N	\N
2096	53	7	7	0	0	0	2014	0	\N	\N
2088	47	8	5	4	1	0	2014	5	\N	\N
2079	40	8	5	1	4	0	2014	5	\N	\N
2109	71	2	15	1	14	0	2014	15	\N	\N
2056	77	3	7	5	2	0	2014	7	\N	\N
2107	91	9	2	0	2	0	2014	2	\N	\N
2081	47	1	5	2	3	0	2014	5	\N	\N
2058	77	5	5	0	5	0	2014	5	\N	\N
2055	77	2	15	0	15	0	2014	15	\N	\N
2072	40	1	5	0	5	0	2014	5	\N	\N
2108	71	1	5	1	4	0	2014	5	\N	\N
2100	91	2	15	0	15	0	2014	15	\N	\N
2075	40	4	7	2	5	0	2014	7	\N	\N
2073	40	2	15	10	5	0	2014	15	\N	\N
2115	71	8	5	0	5	0	2014	5	\N	\N
2060	77	7	7	0	7	0	2014	7	\N	\N
2054	77	1	5	0	5	0	2014	5	\N	\N
2110	71	3	7	4	3	0	2014	7	\N	\N
2103	91	5	5	3.5	1.5	0	2014	5	\N	\N
2061	77	8	5	0	5	0	2014	5	\N	\N
2099	91	1	5	1	4	0	2014	5	\N	\N
2080	40	9	1	0	1	0	2014	1	\N	\N
2112	71	5	5	-2.5	7.5	0	2014	5	\N	\N
2118	10	2	15	15	0	0	2014	15	\N	\N
2119	10	3	7	7	0	0	2014	7	\N	\N
2120	10	4	7	7	0	0	2014	7	\N	\N
2121	10	5	5	5	0	0	2014	5	\N	\N
2123	10	7	7	7	0	0	2014	7	\N	\N
2124	10	8	5	5	0	0	2014	5	\N	\N
2125	10	9	0	0	0	0	2014	0	\N	\N
2128	54	3	7	7	0	0	2014	7	\N	\N
2129	54	4	7	7	0	0	2014	7	\N	\N
2131	54	6	84	84	0	0	2014	84	\N	\N
2134	54	9	0	0	0	0	2014	0	\N	\N
2135	75	1	5	5	0	0	2014	5	\N	\N
2136	75	2	15	15	0	0	2014	15	\N	\N
2137	75	3	7	7	0	0	2014	7	\N	\N
2138	75	4	7	7	0	0	2014	7	\N	\N
2139	75	5	5	5	0	0	2014	5	\N	\N
2141	75	7	7	7	0	0	2014	7	\N	\N
2142	75	8	5	5	0	0	2014	5	\N	\N
2143	75	9	0	0	0	0	2014	0	\N	\N
2146	48	3	7	7	0	0	2014	7	\N	\N
2147	48	4	7	7	0	0	2014	7	\N	\N
2148	48	5	5	5	0	0	2014	5	\N	\N
2149	48	6	84	84	0	0	2014	84	\N	\N
2150	48	7	7	7	0	0	2014	7	\N	\N
2152	48	9	0	0	0	0	2014	0	\N	\N
2155	41	3	7	7	0	0	2014	7	\N	\N
2156	41	4	7	7	0	0	2014	7	\N	\N
2159	41	7	7	7	0	0	2014	7	\N	\N
2164	44	3	7	7	0	0	2014	7	\N	\N
2165	44	4	7	7	0	0	2014	7	\N	\N
2168	44	7	7	7	0	0	2014	7	\N	\N
2170	44	9	0	0	0	0	2014	0	\N	\N
2171	81	1	5	5	0	0	2014	5	\N	\N
2172	81	2	15	15	0	0	2014	15	\N	\N
2173	81	3	7	7	0	0	2014	7	\N	\N
2174	81	4	7	7	0	0	2014	7	\N	\N
2175	81	5	5	5	0	0	2014	5	\N	\N
2176	81	6	84	84	0	0	2014	84	\N	\N
2178	81	8	5	5	0	0	2014	5	\N	\N
2179	81	9	0	0	0	0	2014	0	\N	\N
2182	33	3	7	7	0	0	2014	7	\N	\N
2183	33	4	7	7	0	0	2014	7	\N	\N
2186	33	7	7	7	0	0	2014	7	\N	\N
2188	33	9	0	0	0	0	2014	0	\N	\N
2191	55	3	7	7	0	0	2014	7	\N	\N
2192	55	4	7	7	0	0	2014	7	\N	\N
2195	55	7	7	7	0	0	2014	7	\N	\N
2198	65	1	5	5	0	0	2014	5	\N	\N
2199	65	2	15	15	0	0	2014	15	\N	\N
2200	65	3	7	7	0	0	2014	7	\N	\N
2201	65	4	7	7	0	0	2014	7	\N	\N
2202	65	5	5	5	0	0	2014	5	\N	\N
2204	65	7	7	7	0	0	2014	7	\N	\N
2205	65	8	5	5	0	0	2014	5	\N	\N
2140	75	6	84	0	0	0	2014	0	\N	\N
2158	41	6	84	0	0	0	2014	0	\N	\N
2167	44	6	84	0	0	0	2014	0	\N	\N
2185	33	6	84	0	0	0	2014	0	\N	\N
2194	55	6	84	0	0	0	2014	0	\N	\N
2203	65	6	84	0	0	0	2014	0	\N	\N
2132	54	7	7	0	0	0	2014	0	\N	\N
2177	81	7	7	0	0	0	2014	0	\N	\N
2162	44	1	5	1	4	0	2014	5	\N	\N
2157	41	5	5	2	3	0	2014	5	\N	\N
2163	44	2	15	0	15	0	2014	15	\N	\N
2197	55	9	2	2	0	0	2014	2	\N	\N
2196	55	8	5	1	4	0	2014	5	\N	\N
2184	33	5	5	3	2	0	2014	5	\N	\N
2169	44	8	5	0	5	0	2014	5	\N	\N
2151	48	8	5	2	3	0	2014	5	\N	\N
2160	41	8	5	3	2	0	2014	5	\N	\N
2153	41	1	5	0	5	0	2014	5	\N	\N
2190	55	2	15	0.5	14.5	0	2014	15	\N	\N
2187	33	8	5	2	3	0	2014	5	\N	\N
2193	55	5	5	3	2	0	2014	5	\N	\N
2126	54	1	5	0	5	0	2014	5	\N	\N
2181	33	2	15	0	15	0	2014	15	\N	\N
2180	33	1	5	1	4	0	2014	5	\N	\N
2154	41	2	15	5	10	0	2014	15	\N	\N
2145	48	2	15	14	1	0	2014	15	\N	\N
2161	41	9	1	0	1	0	2014	1	\N	\N
2130	54	5	5	3	2	0	2014	5	\N	\N
2133	54	8	5	0	5	0	2014	5	\N	\N
2144	48	1	5	2	3	0	2014	5	\N	\N
2127	54	2	15	0	15	0	2014	15	\N	\N
2189	55	1	5	2	3	0	2014	5	\N	\N
2206	65	9	0	0	0	0	2014	0	\N	\N
2207	57	1	5	5	0	0	2014	5	\N	\N
2208	57	2	15	15	0	0	2014	15	\N	\N
2209	57	3	7	7	0	0	2014	7	\N	\N
2210	57	4	7	7	0	0	2014	7	\N	\N
2211	57	5	5	5	0	0	2014	5	\N	\N
39120	57	1	5	5	0	0	2017	5	2017-01-02 04:46:51.215869	2017-01-02 04:46:51.215869
2213	57	7	7	7	0	0	2014	7	\N	\N
2214	57	8	5	5	0	0	2014	5	\N	\N
2215	57	9	0	0	0	0	2014	0	\N	\N
2218	70	3	7	7	0	0	2014	7	\N	\N
2219	70	4	7	7	0	0	2014	7	\N	\N
2221	70	6	84	84	0	0	2014	84	\N	\N
2224	70	9	0	0	0	0	2014	0	\N	\N
2226	76	2	15	15	0	0	2014	15	\N	\N
2227	76	3	7	7	0	0	2014	7	\N	\N
2228	76	4	7	7	0	0	2014	7	\N	\N
2229	76	5	5	5	0	0	2014	5	\N	\N
2231	76	7	7	7	0	0	2014	7	\N	\N
2232	76	8	5	5	0	0	2014	5	\N	\N
2233	76	9	0	0	0	0	2014	0	\N	\N
2234	2	1	5	5	0	0	2014	5	\N	\N
2235	2	2	15	15	0	0	2014	15	\N	\N
2236	2	3	7	7	0	0	2014	7	\N	\N
2237	2	4	7	7	0	0	2014	7	\N	\N
2238	2	5	5	5	0	0	2014	5	\N	\N
2239	2	6	84	84	0	0	2014	84	\N	\N
2240	2	7	7	7	0	0	2014	7	\N	\N
2241	2	8	5	5	0	0	2014	5	\N	\N
2242	2	9	0	0	0	0	2014	0	\N	\N
2245	30	3	7	7	0	0	2014	7	\N	\N
2246	30	4	7	7	0	0	2014	7	\N	\N
2249	30	7	7	7	0	0	2014	7	\N	\N
2251	30	9	0	0	0	0	2014	0	\N	\N
2255	45	4	7	7	0	0	2014	7	\N	\N
2258	45	7	7	7	0	0	2014	7	\N	\N
2260	45	9	0	0	0	0	2014	0	\N	\N
2261	38	1	5	5	0	0	2014	5	\N	\N
2262	38	2	15	15	0	0	2014	15	\N	\N
2263	38	3	7	7	0	0	2014	7	\N	\N
2264	38	4	7	7	0	0	2014	7	\N	\N
2265	38	5	5	5	0	0	2014	5	\N	\N
2267	38	7	7	7	0	0	2014	7	\N	\N
2268	38	8	5	5	0	0	2014	5	\N	\N
2269	38	9	0	0	0	0	2014	0	\N	\N
2270	34	1	5	5	0	0	2014	5	\N	\N
2271	34	2	15	15	0	0	2014	15	\N	\N
2272	34	3	7	7	0	0	2014	7	\N	\N
2273	34	4	7	7	0	0	2014	7	\N	\N
2274	34	5	5	5	0	0	2014	5	\N	\N
2276	34	7	7	7	0	0	2014	7	\N	\N
2277	34	8	5	5	0	0	2014	5	\N	\N
2278	34	9	0	0	0	0	2014	0	\N	\N
2281	94	3	7	7	0	0	2014	7	\N	\N
2282	94	4	7	7	0	0	2014	7	\N	\N
2285	94	7	7	7	0	0	2014	7	\N	\N
2287	94	9	0	0	0	0	2014	0	\N	\N
2290	60	3	7	7	0	0	2014	7	\N	\N
2291	60	4	7	7	0	0	2014	7	\N	\N
2230	76	6	84	0	0	0	2014	0	\N	\N
2248	30	6	84	0	0	0	2014	0	\N	\N
2257	45	6	84	0	0	0	2014	0	\N	\N
2266	38	6	84	0	0	0	2014	0	\N	\N
2275	34	6	84	0	0	0	2014	0	\N	\N
2284	94	6	84	0	0	0	2014	0	\N	\N
2293	60	6	84	0	0	0	2014	0	\N	\N
2222	70	7	7	0	0	0	2014	0	\N	\N
2256	45	5	5	0	5	0	2014	5	\N	\N
2292	60	5	5	2.5	2.5	0	2014	5	\N	\N
2250	30	8	5	4	1	0	2014	5	\N	\N
2252	45	1	5	0	5	0	2014	5	\N	\N
2280	94	2	15	0	15	0	2014	15	\N	\N
2223	70	8	5	0	5	0	2014	5	\N	2015-01-08 17:00:02.890264
2220	70	5	5	0	5	0	2014	5	\N	\N
2247	30	5	5	4.5	0.5	0	2014	5	\N	\N
2225	76	1	5	4	1	0	2014	5	\N	\N
2259	45	8	5	3	2	0	2014	5	\N	\N
2216	70	1	5	0.5	4.5	0	2014	5	\N	\N
2283	94	5	5	0	5	0	2014	5	\N	\N
2217	70	2	15	1	14	0	2014	15	\N	2015-01-08 17:02:24.23023
2279	94	1	5	0	5	0	2014	5	\N	\N
2254	45	3	7	6	1	0	2014	7	\N	\N
2286	94	8	5	-1	6	0	2014	5	\N	2015-01-05 09:07:45.554828
2289	60	2	15	0	15	0	2014	15	\N	\N
2253	45	2	15	1	14	0	2014	15	\N	\N
2244	30	2	15	5	10	0	2014	15	\N	\N
2294	60	7	7	7	0	0	2014	7	\N	\N
39121	57	2	15	15	0	0	2017	15	2017-01-02 04:46:51.225844	2017-01-02 04:46:51.225844
2299	42	3	7	7	0	0	2014	7	\N	\N
2300	42	4	7	7	0	0	2014	7	\N	\N
2301	42	5	5	5	0	0	2014	5	\N	\N
2303	42	7	7	7	0	0	2014	7	\N	\N
2305	42	9	0	0	0	0	2014	0	\N	\N
2306	36	1	5	5	0	0	2014	5	\N	\N
2307	36	2	15	15	0	0	2014	15	\N	\N
2308	36	3	7	7	0	0	2014	7	\N	\N
2310	36	5	5	5	0	0	2014	5	\N	\N
2312	36	7	7	7	0	0	2014	7	\N	\N
2314	36	9	0	0	0	0	2014	0	\N	\N
2315	50	1	5	5	0	0	2014	5	\N	\N
2316	50	2	15	15	0	0	2014	15	\N	\N
2317	50	3	7	7	0	0	2014	7	\N	\N
2318	50	4	7	7	0	0	2014	7	\N	\N
2319	50	5	5	5	0	0	2014	5	\N	\N
2321	50	7	7	7	0	0	2014	7	\N	\N
2322	50	8	5	5	0	0	2014	5	\N	\N
2323	50	9	0	0	0	0	2014	0	\N	\N
2324	89	1	5	5	0	0	2014	5	\N	\N
2325	89	2	15	15	0	0	2014	15	\N	\N
2326	89	3	7	7	0	0	2014	7	\N	\N
2327	89	4	7	7	0	0	2014	7	\N	\N
2328	89	5	5	5	0	0	2014	5	\N	\N
2330	89	7	7	7	0	0	2014	7	\N	\N
2331	89	8	5	5	0	0	2014	5	\N	\N
2332	89	9	0	0	0	0	2014	0	\N	\N
2333	32	1	5	5	0	0	2014	5	\N	\N
2334	32	2	15	15	0	0	2014	15	\N	\N
2335	32	3	7	7	0	0	2014	7	\N	\N
2336	32	4	7	7	0	0	2014	7	\N	\N
2337	32	5	5	5	0	0	2014	5	\N	\N
2339	32	7	7	7	0	0	2014	7	\N	\N
2340	32	8	5	5	0	0	2014	5	\N	\N
2341	32	9	0	0	0	0	2014	0	\N	\N
2342	97	1	5	5	0	0	2014	5	\N	\N
2343	97	2	15	15	0	0	2014	15	\N	\N
2344	97	3	7	7	0	0	2014	7	\N	\N
2345	97	4	7	7	0	0	2014	7	\N	\N
2346	97	5	5	5	0	0	2014	5	\N	\N
2347	97	6	84	84	0	0	2014	84	\N	\N
2349	97	8	5	5	0	0	2014	5	\N	\N
2350	97	9	0	0	0	0	2014	0	\N	\N
2351	96	1	5	5	0	0	2014	5	\N	\N
2352	96	2	15	15	0	0	2014	15	\N	\N
2353	96	3	7	7	0	0	2014	7	\N	\N
2354	96	4	7	7	0	0	2014	7	\N	\N
2355	96	5	5	5	0	0	2014	5	\N	\N
2357	96	7	7	7	0	0	2014	7	\N	\N
2358	96	8	5	5	0	0	2014	5	\N	\N
2359	96	9	0	0	0	0	2014	0	\N	\N
2360	82	1	5	5	0	0	2014	5	\N	\N
2361	82	2	15	15	0	0	2014	15	\N	\N
2362	82	3	7	7	0	0	2014	7	\N	\N
2363	82	4	7	7	0	0	2014	7	\N	\N
2364	82	5	5	5	0	0	2014	5	\N	\N
2366	82	7	7	7	0	0	2014	7	\N	\N
2367	82	8	5	5	0	0	2014	5	\N	\N
2368	82	9	0	0	0	0	2014	0	\N	\N
2369	74	1	5	5	0	0	2014	5	\N	\N
2370	74	2	15	15	0	0	2014	15	\N	\N
2371	74	3	7	7	0	0	2014	7	\N	\N
2372	74	4	7	7	0	0	2014	7	\N	\N
2373	74	5	5	5	0	0	2014	5	\N	\N
2375	74	7	7	7	0	0	2014	7	\N	\N
2376	74	8	5	5	0	0	2014	5	\N	\N
2377	74	9	0	0	0	0	2014	0	\N	\N
2380	51	3	7	7	0	0	2014	7	\N	\N
2381	51	4	7	7	0	0	2014	7	\N	\N
2311	36	6	84	0	0	0	2014	0	\N	\N
2320	50	6	84	0	0	0	2014	0	\N	\N
2329	89	6	84	0	0	0	2014	0	\N	\N
2338	32	6	84	0	0	0	2014	0	\N	\N
2356	96	6	84	0	0	0	2014	0	\N	\N
2365	82	6	84	0	0	0	2014	0	\N	\N
2374	74	6	84	0	0	0	2014	0	\N	\N
2348	97	7	7	0	0	0	2014	0	\N	\N
2304	42	8	5	4	1	0	2014	5	\N	\N
2313	36	8	5	4	1	0	2014	5	\N	\N
2378	51	1	5	0	5	0	2014	5	\N	\N
2309	36	4	7	3	4	0	2014	7	\N	\N
2296	60	9	2	2	0	0	2014	2	\N	\N
2297	42	1	5	4	1	0	2014	5	\N	\N
2379	51	2	15	0	15	0	2014	15	\N	\N
2295	60	8	5	1	4	0	2014	5	\N	\N
2383	51	6	84	84	0	0	2014	84	\N	\N
2386	51	9	0	0	0	0	2014	0	\N	\N
2389	95	3	7	7	0	0	2014	7	\N	\N
2390	95	4	7	7	0	0	2014	7	\N	\N
2393	95	7	7	7	0	0	2014	7	\N	\N
2398	29	3	7	7	0	0	2014	7	\N	\N
2399	29	4	7	7	0	0	2014	7	\N	\N
2402	29	7	7	7	0	0	2014	7	\N	\N
2404	29	9	0	0	0	0	2014	0	\N	\N
2406	37	2	15	15	0	0	2014	15	\N	\N
2407	37	3	7	7	0	0	2014	7	\N	\N
2408	37	4	7	7	0	0	2014	7	\N	\N
2411	37	7	7	7	0	0	2014	7	\N	\N
2414	104	1	5	5	0	0	2014	5	\N	\N
2415	104	2	15	15	0	0	2014	15	\N	\N
2416	104	3	7	7	0	0	2014	7	\N	\N
2417	104	4	7	7	0	0	2014	7	\N	\N
2418	104	5	5	5	0	0	2014	5	\N	\N
2420	104	7	7	7	0	0	2014	7	\N	\N
2421	104	8	5	5	0	0	2014	5	\N	\N
2422	104	9	0	0	0	0	2014	0	\N	\N
2423	46	1	5	5	0	0	2014	5	\N	\N
2424	46	2	15	15	0	0	2014	15	\N	\N
2425	46	3	7	7	0	0	2014	7	\N	\N
2426	46	4	7	7	0	0	2014	7	\N	\N
2427	46	5	5	5	0	0	2014	5	\N	\N
2429	46	7	7	7	0	0	2014	7	\N	\N
2430	46	8	5	5	0	0	2014	5	\N	\N
2431	46	9	0	0	0	0	2014	0	\N	\N
2435	90	4	7	7	0	0	2014	7	\N	\N
2438	90	7	7	7	0	0	2014	7	\N	\N
2440	90	9	0	0	0	0	2014	0	\N	\N
2441	106	1	5	5	0	0	2014	5	\N	\N
2442	106	2	15	15	0	0	2014	15	\N	\N
2443	106	3	7	7	0	0	2014	7	\N	\N
2444	106	4	7	7	0	0	2014	7	\N	\N
2445	106	5	5	5	0	0	2014	5	\N	\N
2446	106	6	84	84	0	0	2014	84	\N	\N
2448	106	8	5	5	0	0	2014	5	\N	\N
2449	106	9	0	0	0	0	2014	0	\N	\N
2450	100	1	5	5	0	0	2014	5	\N	\N
2451	100	2	15	15	0	0	2014	15	\N	\N
2452	100	3	7	7	0	0	2014	7	\N	\N
2453	100	4	7	7	0	0	2014	7	\N	\N
2454	100	5	5	5	0	0	2014	5	\N	\N
2456	100	7	7	7	0	0	2014	7	\N	\N
2457	100	8	5	5	0	0	2014	5	\N	\N
2458	100	9	0	0	0	0	2014	0	\N	\N
2459	79	1	5	5	0	0	2014	5	\N	\N
2460	79	2	15	15	0	0	2014	15	\N	\N
2461	79	3	7	7	0	0	2014	7	\N	\N
2462	79	4	7	7	0	0	2014	7	\N	\N
2463	79	5	5	5	0	0	2014	5	\N	\N
2465	79	7	7	7	0	0	2014	7	\N	\N
2466	79	8	5	5	0	0	2014	5	\N	\N
2467	79	9	0	0	0	0	2014	0	\N	\N
2401	29	6	84	0	0	0	2014	0	\N	\N
2410	37	6	84	0	0	0	2014	0	\N	\N
2419	104	6	84	0	0	0	2014	0	\N	\N
2428	46	6	84	0	0	0	2014	0	\N	\N
2437	90	6	84	0	0	0	2014	0	\N	\N
2455	100	6	84	0	0	0	2014	0	\N	\N
2464	79	6	84	0	0	0	2014	0	\N	\N
2384	51	7	7	0	0	0	2014	0	\N	\N
2447	106	7	7	0	0	0	2014	0	\N	\N
2385	51	8	5	0	5	0	2014	5	\N	\N
2468	98	1	5	1	4	0	2014	5	\N	\N
2439	90	8	5	3	2	0	2014	5	\N	\N
2412	37	8	5	4	1	0	2014	5	\N	\N
2403	29	8	5	1	4	0	2014	5	\N	\N
2395	95	9	7	0	7	0	2014	7	\N	\N
2432	90	1	5	0	5	0	2014	5	\N	\N
2405	37	1	5	4	1	0	2014	5	\N	\N
2409	37	5	5	4.5	0.5	0	2014	5	\N	\N
2469	98	2	15	0	15	0	2014	15	\N	\N
2413	37	9	2	2	0	0	2014	2	\N	\N
2387	95	1	5	0	5	0	2014	5	\N	\N
2394	95	8	5	0	5	0	2014	5	\N	\N
2397	29	2	15	0	15	0	2014	15	\N	\N
2391	95	5	5	0	5	0	2014	5	\N	\N
2400	29	5	5	0	5	0	2014	5	\N	\N
2436	90	5	5	0	5	0	2014	5	\N	\N
2396	29	1	5	0.5	4.5	0	2014	5	\N	\N
2434	90	3	7	0	7	0	2014	7	\N	\N
2382	51	5	5	0	5	0	2014	5	\N	\N
2433	90	2	15	-6	21	0	2014	15	\N	\N
2470	98	3	7	7	0	0	2014	7	\N	\N
2471	98	4	7	7	0	0	2014	7	\N	\N
2473	98	6	84	84	0	0	2014	84	\N	\N
2476	98	9	0	0	0	0	2014	0	\N	\N
2480	101	4	7	7	0	0	2014	7	\N	\N
39122	57	3	7	7	0	0	2017	7	2017-01-02 04:46:51.235977	2017-01-02 04:46:51.235977
2483	101	7	7	7	0	0	2014	7	\N	\N
2485	101	9	0	0	0	0	2014	0	\N	\N
2486	103	1	5	5	0	0	2014	5	\N	\N
2487	103	2	15	15	0	0	2014	15	\N	\N
2488	103	3	7	7	0	0	2014	7	\N	\N
2489	103	4	7	7	0	0	2014	7	\N	\N
2490	103	5	5	5	0	0	2014	5	\N	\N
2492	103	7	7	7	0	0	2014	7	\N	\N
2493	103	8	5	5	0	0	2014	5	\N	\N
2494	103	9	0	0	0	0	2014	0	\N	\N
2497	87	3	7	7	0	0	2014	7	\N	\N
2501	87	7	7	7	0	0	2014	7	\N	\N
2504	56	1	5	5	0	0	2014	5	\N	\N
2505	56	2	15	15	0	0	2014	15	\N	\N
2506	56	3	7	7	0	0	2014	7	\N	\N
2507	56	4	7	7	0	0	2014	7	\N	\N
2508	56	5	5	5	0	0	2014	5	\N	\N
2510	56	7	7	7	0	0	2014	7	\N	\N
2511	56	8	5	5	0	0	2014	5	\N	\N
2512	56	9	0	0	0	0	2014	0	\N	\N
2515	28	3	7	7	0	0	2014	7	\N	\N
2516	28	4	7	7	0	0	2014	7	\N	\N
2517	28	5	5	5	0	0	2014	5	\N	\N
2519	28	7	7	7	0	0	2014	7	\N	\N
2520	28	8	5	5	0	0	2014	5	\N	\N
2521	28	9	0	0	0	0	2014	0	\N	\N
2524	31	3	7	7	0	0	2014	7	\N	\N
2525	31	4	7	7	0	0	2014	7	\N	\N
2528	31	7	7	7	0	0	2014	7	\N	\N
2530	31	9	0	0	0	0	2014	0	\N	\N
2534	72	4	7	7	0	0	2014	7	\N	\N
2537	72	7	7	7	0	0	2014	7	\N	\N
2539	72	9	0	0	0	0	2014	0	\N	\N
2543	80	4	7	7	0	0	2014	7	\N	\N
2546	80	7	7	7	0	0	2014	7	\N	\N
2549	49	1	5	5	0	0	2014	5	\N	\N
2551	49	3	7	7	0	0	2014	7	\N	\N
2552	49	4	7	7	0	0	2014	7	\N	\N
2555	49	7	7	7	0	0	2014	7	\N	\N
2557	49	9	0	0	0	0	2014	0	\N	\N
2491	103	6	84	0	0	0	2014	0	\N	\N
2500	87	6	84	0	0	0	2014	0	\N	\N
2509	56	6	84	0	0	0	2014	0	\N	\N
2518	28	6	84	0	0	0	2014	0	\N	\N
2527	31	6	84	0	0	0	2014	0	\N	\N
2536	72	6	84	0	0	0	2014	0	\N	\N
2545	80	6	84	0	0	0	2014	0	\N	\N
2554	49	6	84	0	0	0	2014	0	\N	\N
2474	98	7	7	0	0	0	2014	0	\N	\N
2540	80	1	5	1	4	0	2014	5	\N	\N
2550	49	2	15	7	8	0	2014	15	\N	\N
2502	87	8	5	1	4	0	2014	5	\N	\N
2481	101	5	5	1	4	0	2014	5	\N	\N
2535	72	5	5	0	5	0	2014	5	\N	\N
2495	87	1	5	0.5	4.5	0	2014	5	\N	\N
2556	49	8	5	2	3	0	2014	5	\N	\N
2514	28	2	15	14	1	0	2014	15	\N	\N
2548	80	9	5	0	5	0	2014	5	\N	\N
2513	28	1	5	4.5	0.5	0	2014	5	\N	\N
2547	80	8	5	1	4	0	2014	5	\N	\N
2484	101	8	5	0	5	0	2014	5	\N	\N
2544	80	5	5	0	5	0	2014	5	\N	\N
2498	87	4	7	4	3	0	2014	7	\N	\N
2475	98	8	5	1	4	0	2014	5	\N	\N
2522	31	1	5	0	5	0	2014	5	\N	\N
2479	101	3	7	6	1	0	2014	7	\N	\N
2531	72	1	5	0	5	0	2014	5	\N	\N
2472	98	5	5	0	5	0	2014	5	\N	\N
2499	87	5	5	1	4	0	2014	5	\N	\N
2532	72	2	15	0	15	0	2014	15	\N	\N
2538	72	8	5	0	5	0	2014	5	\N	\N
2533	72	3	7	5	2	0	2014	7	\N	2015-01-05 09:07:25.829943
2526	31	5	5	0.5	4.5	0	2014	5	\N	\N
2542	80	3	7	3	4	0	2014	7	\N	\N
2529	31	8	5	2	3	0	2014	5	\N	\N
2523	31	2	15	0	15	0	2014	15	\N	\N
2478	101	2	15	0	15	0	2014	15	\N	\N
2541	80	2	15	0	15	0	2014	15	\N	\N
2553	49	5	5	1	4	0	2014	5	\N	\N
2477	101	1	5	0	5	0	2014	5	\N	\N
2560	64	3	7	7	0	0	2014	7	\N	\N
2561	64	4	7	7	0	0	2014	7	\N	\N
2562	64	5	5	5	0	0	2014	5	\N	\N
39123	57	4	7	7	0	0	2017	7	2017-01-02 04:46:51.245926	2017-01-02 04:46:51.245926
2564	64	7	7	7	0	0	2014	7	\N	\N
2566	64	9	0	0	0	0	2014	0	\N	\N
2570	68	4	7	7	0	0	2014	7	\N	\N
2573	68	7	7	7	0	0	2014	7	\N	\N
2575	68	9	0	0	0	0	2014	0	\N	\N
2579	102	4	7	7	0	0	2014	7	\N	\N
2582	102	7	7	7	0	0	2014	7	\N	\N
2585	85	1	5	5	0	0	2014	5	\N	\N
2586	85	2	15	15	0	0	2014	15	\N	\N
2587	85	3	7	7	0	0	2014	7	\N	\N
2588	85	4	7	7	0	0	2014	7	\N	\N
2589	85	5	5	5	0	0	2014	5	\N	\N
2590	85	6	84	84	0	0	2014	84	\N	\N
2592	85	8	5	5	0	0	2014	5	\N	\N
2593	85	9	0	0	0	0	2014	0	\N	\N
2597	52	4	7	7	0	0	2014	7	\N	\N
2600	52	7	7	7	0	0	2014	7	\N	\N
2603	113	1	5	5	0	0	2014	5	\N	\N
2604	113	2	15	15	0	0	2014	15	\N	\N
2605	113	3	7	7	0	0	2014	7	\N	\N
2606	113	4	7	7	0	0	2014	7	\N	\N
2607	113	5	5	5	0	0	2014	5	\N	\N
2609	113	7	7	7	0	0	2014	7	\N	\N
2610	113	8	5	5	0	0	2014	5	\N	\N
2611	113	9	0	0	0	0	2014	0	\N	\N
2615	99	4	7	7	0	0	2014	7	\N	\N
2618	99	7	7	7	0	0	2014	7	\N	\N
2623	120	3	7	7	0	0	2014	7	\N	\N
2624	120	4	7	7	0	0	2014	7	\N	\N
2625	120	5	5	5	0	0	2014	5	\N	\N
2627	120	7	7	7	0	0	2014	7	\N	\N
2629	120	9	0	0	0	0	2014	0	\N	\N
2630	35	1	5	5	0	0	2014	5	\N	\N
2631	35	2	15	15	0	0	2014	15	\N	\N
2632	35	3	7	7	0	0	2014	7	\N	\N
2633	35	4	7	7	0	0	2014	7	\N	\N
2634	35	5	5	5	0	0	2014	5	\N	\N
2636	35	7	7	7	0	0	2014	7	\N	\N
2637	35	8	5	5	0	0	2014	5	\N	\N
2638	35	9	0	0	0	0	2014	0	\N	\N
2642	111	4	7	7	0	0	2014	7	\N	\N
2645	111	7	7	7	0	0	2014	7	\N	\N
2572	68	6	84	0	0	0	2014	0	\N	\N
2581	102	6	84	0	0	0	2014	0	\N	\N
2599	52	6	84	0	0	0	2014	0	\N	\N
2608	113	6	84	0	0	0	2014	0	\N	\N
2617	99	6	84	0	0	0	2014	0	\N	\N
2626	120	6	84	0	0	0	2014	0	\N	\N
2635	35	6	84	0	0	0	2014	0	\N	\N
2644	111	6	84	0	0	0	2014	0	\N	\N
2591	85	7	7	0	0	0	2014	0	\N	\N
2621	120	1	5	2	3	0	2014	5	\N	\N
2595	52	2	15	3	12	0	2014	15	\N	\N
2639	111	1	5	0	5	0	2014	5	\N	\N
2567	68	1	5	4	1	0	2014	5	\N	\N
2559	64	2	15	0	15	0	2014	15	\N	\N
2620	99	9	7	0	7	0	2014	7	\N	\N
2578	102	3	7	6	1	0	2014	7	\N	\N
2568	68	2	15	2	13	0	2014	15	\N	\N
2596	52	3	7	2	5	0	2014	7	\N	\N
2614	99	3	7	6	1	0	2014	7	\N	\N
2643	111	5	5	0	5	0	2014	5	\N	2015-01-05 09:07:09.863209
2576	102	1	5	1	4	0	2014	5	\N	\N
2571	68	5	5	3.5	1.5	0	2014	5	\N	\N
2569	68	3	7	6	1	0	2014	7	\N	\N
2640	111	2	15	0	15	0	2014	15	\N	2015-01-05 09:09:02.066948
2612	99	1	5	1	4	0	2014	5	\N	\N
2628	120	8	5	3	2	0	2014	5	\N	\N
2641	111	3	7	2	5	0	2014	7	\N	\N
2602	52	9	2	0	2	0	2014	2	\N	\N
2584	102	9	2	0	2	0	2014	2	\N	\N
2598	52	5	5	0.5	4.5	0	2014	5	\N	\N
2580	102	5	5	3.5	1.5	0	2014	5	\N	\N
2613	99	2	15	2	13	0	2014	15	\N	2015-01-06 05:27:13.94356
2622	120	2	15	6	9	0	2014	15	\N	\N
2577	102	2	15	0	15	0	2014	15	\N	\N
2583	102	8	5	0	5	0	2014	5	\N	\N
2601	52	8	5	0	5	0	2014	5	\N	2015-01-05 09:06:54.347189
2558	64	1	5	0	5	0	2014	5	\N	\N
2619	99	8	5	1	4	0	2014	5	\N	\N
2594	52	1	5	0	5	0	2014	5	\N	\N
2647	111	9	0	0	0	0	2014	0	\N	\N
2650	138	3	7	7	0	0	2014	7	\N	\N
2651	138	4	7	7	0	0	2014	7	\N	\N
2653	138	6	84	84	0	0	2014	84	\N	\N
2656	138	9	0	0	0	0	2014	0	\N	\N
2657	135	1	5	5	0	0	2014	5	\N	\N
2659	135	3	7	7	0	0	2014	7	\N	\N
2660	135	4	7	7	0	0	2014	7	\N	\N
2661	135	5	5	5	0	0	2014	5	\N	\N
39124	57	5	5	5	0	0	2017	5	2017-01-02 04:46:51.256021	2017-01-02 04:46:51.256021
2663	135	7	7	7	0	0	2014	7	\N	\N
2664	135	8	5	5	0	0	2014	5	\N	\N
2665	135	9	0	0	0	0	2014	0	\N	\N
2666	126	1	5	5	0	0	2014	5	\N	\N
2667	126	2	15	15	0	0	2014	15	\N	\N
2668	126	3	7	7	0	0	2014	7	\N	\N
2669	126	4	7	7	0	0	2014	7	\N	\N
2670	126	5	5	5	0	0	2014	5	\N	\N
2671	126	6	84	84	0	0	2014	84	\N	\N
2672	126	7	7	7	0	0	2014	7	\N	\N
2673	126	8	5	5	0	0	2014	5	\N	\N
2674	126	9	0	0	0	0	2014	0	\N	\N
2677	107	3	7	7	0	0	2014	7	\N	\N
2678	107	4	7	7	0	0	2014	7	\N	\N
2679	107	5	5	5	0	0	2014	5	\N	\N
2681	107	7	7	7	0	0	2014	7	\N	\N
2683	107	9	0	0	0	0	2014	0	\N	\N
2684	121	1	5	5	0	0	2014	5	\N	\N
2685	121	2	15	15	0	0	2014	15	\N	\N
2686	121	3	7	7	0	0	2014	7	\N	\N
2687	121	4	7	7	0	0	2014	7	\N	\N
2688	121	5	5	5	0	0	2014	5	\N	\N
2689	121	6	84	84	0	0	2014	84	\N	\N
2690	121	7	7	7	0	0	2014	7	\N	\N
2691	121	8	5	5	0	0	2014	5	\N	\N
2692	121	9	0	0	0	0	2014	0	\N	\N
2693	116	1	5	5	0	0	2014	5	\N	\N
2694	116	2	15	15	0	0	2014	15	\N	\N
2695	116	3	7	7	0	0	2014	7	\N	\N
2696	116	4	7	7	0	0	2014	7	\N	\N
2697	116	5	5	5	0	0	2014	5	\N	\N
2699	116	7	7	7	0	0	2014	7	\N	\N
2700	116	8	5	5	0	0	2014	5	\N	\N
2701	116	9	0	0	0	0	2014	0	\N	\N
2702	129	1	5	5	0	0	2014	5	\N	\N
2703	129	2	15	15	0	0	2014	15	\N	\N
2704	129	3	7	7	0	0	2014	7	\N	\N
2705	129	4	7	7	0	0	2014	7	\N	\N
2706	129	5	5	5	0	0	2014	5	\N	\N
2708	129	7	7	7	0	0	2014	7	\N	\N
2709	129	8	5	5	0	0	2014	5	\N	\N
2710	129	9	0	0	0	0	2014	0	\N	\N
2713	109	3	7	7	0	0	2014	7	\N	\N
2714	109	4	7	7	0	0	2014	7	\N	\N
2716	109	6	84	84	0	0	2014	84	\N	\N
2719	109	9	0	0	0	0	2014	0	\N	\N
2720	119	1	5	5	0	0	2014	5	\N	\N
2721	119	2	15	15	0	0	2014	15	\N	\N
2722	119	3	7	7	0	0	2014	7	\N	\N
2723	119	4	7	7	0	0	2014	7	\N	\N
2724	119	5	5	5	0	0	2014	5	\N	\N
2726	119	7	7	7	0	0	2014	7	\N	\N
2727	119	8	5	5	0	0	2014	5	\N	\N
2728	119	9	0	0	0	0	2014	0	\N	\N
2729	118	1	5	5	0	0	2014	5	\N	\N
2731	118	3	7	7	0	0	2014	7	\N	\N
2732	118	4	7	7	0	0	2014	7	\N	\N
2680	107	6	84	0	0	0	2014	0	\N	\N
2698	116	6	84	0	0	0	2014	0	\N	\N
2707	129	6	84	0	0	0	2014	0	\N	\N
2725	119	6	84	0	0	0	2014	0	\N	\N
2654	138	7	7	0	0	0	2014	0	\N	\N
2717	109	7	7	0	0	0	2014	0	\N	\N
2649	138	2	15	10	5	0	2014	15	\N	\N
2655	138	8	5	4	1	0	2014	5	\N	\N
2682	107	8	5	4	1	0	2014	5	\N	\N
2718	109	8	5	0	5	0	2014	5	\N	\N
2648	138	1	5	4	1	0	2014	5	\N	\N
2676	107	2	15	9.5	5.5	0	2014	15	\N	\N
2675	107	1	5	1	4	0	2014	5	\N	\N
2733	118	5	5	3	2	0	2014	5	\N	\N
2652	138	5	5	4.5	0.5	0	2014	5	\N	\N
2711	109	1	5	4	1	0	2014	5	\N	\N
2730	118	2	15	11	4	0	2014	15	\N	\N
2646	111	8	5	0	5	0	2014	5	\N	\N
2715	109	5	5	0	5	0	2014	5	\N	\N
2658	135	2	15	0	15	0	2014	15	\N	\N
2735	118	7	7	7	0	0	2014	7	\N	\N
2737	118	9	0	0	0	0	2014	0	\N	\N
2738	136	1	5	5	0	0	2014	5	\N	\N
2739	136	2	15	15	0	0	2014	15	\N	\N
2740	136	3	7	7	0	0	2014	7	\N	\N
2741	136	4	7	7	0	0	2014	7	\N	\N
2742	136	5	5	5	0	0	2014	5	\N	\N
2744	136	7	7	7	0	0	2014	7	\N	\N
2745	136	8	5	5	0	0	2014	5	\N	\N
2746	136	9	0	0	0	0	2014	0	\N	\N
2749	123	3	7	7	0	0	2014	7	\N	\N
39126	57	7	7	7	0	0	2017	7	2017-01-02 04:46:51.276085	2017-01-02 04:46:51.276085
2752	123	6	84	84	0	0	2014	84	\N	\N
2755	123	9	0	0	0	0	2014	0	\N	\N
2756	78	1	5	5	0	0	2014	5	\N	\N
2757	78	2	15	15	0	0	2014	15	\N	\N
2758	78	3	7	7	0	0	2014	7	\N	\N
2759	78	4	7	7	0	0	2014	7	\N	\N
2760	78	5	5	5	0	0	2014	5	\N	\N
2761	78	6	84	84	0	0	2014	84	\N	\N
2763	78	8	5	5	0	0	2014	5	\N	\N
2764	78	9	0	0	0	0	2014	0	\N	\N
2765	132	1	5	5	0	0	2014	5	\N	\N
2766	132	2	15	15	0	0	2014	15	\N	\N
2767	132	3	7	7	0	0	2014	7	\N	\N
2768	132	4	7	7	0	0	2014	7	\N	\N
2769	132	5	5	5	0	0	2014	5	\N	\N
2771	132	7	7	7	0	0	2014	7	\N	\N
2772	132	8	5	5	0	0	2014	5	\N	\N
2773	132	9	0	0	0	0	2014	0	\N	\N
2776	133	3	7	7	0	0	2014	7	\N	\N
2777	133	4	7	7	0	0	2014	7	\N	\N
2780	133	7	7	7	0	0	2014	7	\N	\N
2782	133	9	0	0	0	0	2014	0	\N	\N
2785	134	3	7	7	0	0	2014	7	\N	\N
2786	134	4	7	7	0	0	2014	7	\N	\N
2789	134	7	7	7	0	0	2014	7	\N	\N
2791	134	9	0	0	0	0	2014	0	\N	\N
2792	130	1	5	5	0	0	2014	5	\N	\N
2793	130	2	15	15	0	0	2014	15	\N	\N
2794	130	3	7	7	0	0	2014	7	\N	\N
2795	130	4	7	7	0	0	2014	7	\N	\N
2796	130	5	5	5	0	0	2014	5	\N	\N
2798	130	7	7	7	0	0	2014	7	\N	\N
2799	130	8	5	5	0	0	2014	5	\N	\N
2800	130	9	0	0	0	0	2014	0	\N	\N
2801	137	1	5	5	0	0	2014	5	\N	\N
2802	137	2	15	15	0	0	2014	15	\N	\N
2803	137	3	7	7	0	0	2014	7	\N	\N
2804	137	4	7	7	0	0	2014	7	\N	\N
2805	137	5	5	5	0	0	2014	5	\N	\N
2806	137	6	84	84	0	0	2014	84	\N	\N
2807	137	7	7	7	0	0	2014	7	\N	\N
2808	137	8	5	5	0	0	2014	5	\N	\N
2809	137	9	0	0	0	0	2014	0	\N	\N
2813	140	4	7	7	0	0	2014	7	\N	\N
2818	140	9	0	0	0	0	2014	0	\N	\N
2819	110	1	5	5	0	0	2014	5	\N	\N
2820	110	2	15	15	0	0	2014	15	\N	\N
2821	110	3	7	7	0	0	2014	7	\N	\N
2743	136	6	84	0	0	0	2014	0	\N	\N
2770	132	6	84	0	0	0	2014	0	\N	\N
2779	133	6	84	0	0	0	2014	0	\N	\N
2788	134	6	84	0	0	0	2014	0	\N	\N
2797	130	6	84	0	0	0	2014	0	\N	\N
2753	123	7	7	0	0	0	2014	0	\N	\N
2762	78	7	7	0	0	0	2014	0	\N	\N
2816	140	7	7	0	0	0	2014	0	\N	\N
2815	140	6	84	22	62	0	2014	84	\N	\N
2778	133	5	5	3.5	1.5	0	2014	5	\N	\N
2790	134	8	5	2	3	0	2014	5	\N	\N
2754	123	8	5	3	2	0	2014	5	\N	\N
2811	140	2	15	0	15	0	2014	15	\N	\N
2810	140	1	5	0	5	0	2014	5	\N	\N
2817	140	8	5	0	5	0	2014	5	\N	\N
2812	140	3	7	2	5	0	2014	7	\N	\N
2750	123	4	7	5	2	0	2014	7	\N	\N
2781	133	8	5	2	3	0	2014	5	\N	\N
2783	134	1	5	1	4	0	2014	5	\N	\N
2787	134	5	5	3	2	0	2014	5	\N	\N
2774	133	1	5	0	5	0	2014	5	\N	\N
2736	118	8	5	3	2	0	2014	5	\N	\N
2814	140	5	5	1	4	0	2014	5	\N	\N
2748	123	2	15	7	8	0	2014	15	\N	\N
2747	123	1	5	3	2	0	2014	5	\N	\N
2784	134	2	15	1	14	0	2014	15	\N	\N
2822	110	4	7	7	0	0	2014	7	\N	\N
2823	110	5	5	5	0	0	2014	5	\N	\N
2824	110	6	84	84	0	0	2014	84	\N	\N
2826	110	8	5	5	0	0	2014	5	\N	\N
2827	110	9	0	0	0	0	2014	0	\N	\N
2828	122	1	5	5	0	0	2014	5	\N	\N
2829	122	2	15	15	0	0	2014	15	\N	\N
2830	122	3	7	7	0	0	2014	7	\N	\N
2831	122	4	7	7	0	0	2014	7	\N	\N
2832	122	5	5	5	0	0	2014	5	\N	\N
2833	122	6	84	84	0	0	2014	84	\N	\N
2834	122	7	7	7	0	0	2014	7	\N	\N
2835	122	8	5	5	0	0	2014	5	\N	\N
2836	122	9	0	0	0	0	2014	0	\N	\N
2837	112	1	5	5	0	0	2014	5	\N	\N
2838	112	2	15	15	0	0	2014	15	\N	\N
2839	112	3	7	7	0	0	2014	7	\N	\N
2840	112	4	7	7	0	0	2014	7	\N	\N
2841	112	5	5	5	0	0	2014	5	\N	\N
2842	112	6	84	84	0	0	2014	84	\N	\N
2843	112	7	7	7	0	0	2014	7	\N	\N
2844	112	8	5	5	0	0	2014	5	\N	\N
2845	112	9	0	0	0	0	2014	0	\N	\N
2848	127	3	7	7	0	0	2014	7	\N	\N
2849	127	4	7	7	0	0	2014	7	\N	\N
39127	57	8	5	5	0	0	2017	5	2017-01-02 04:46:51.286048	2017-01-02 04:46:51.286048
2852	127	7	7	7	0	0	2014	7	\N	\N
2854	127	9	0	0	0	0	2014	0	\N	\N
2855	125	1	5	5	0	0	2014	5	\N	\N
2857	125	3	7	7	0	0	2014	7	\N	\N
2858	125	4	7	7	0	0	2014	7	\N	\N
2861	125	7	7	7	0	0	2014	7	\N	\N
2863	125	9	0	0	0	0	2014	0	\N	\N
2866	108	3	7	7	0	0	2014	7	\N	\N
2867	108	4	7	7	0	0	2014	7	\N	\N
2869	108	6	84	84	0	0	2014	84	\N	\N
2872	108	9	0	0	0	0	2014	0	\N	\N
2873	114	1	5	5	0	0	2014	5	\N	\N
2874	114	2	15	15	0	0	2014	15	\N	\N
2875	114	3	7	7	0	0	2014	7	\N	\N
2876	114	4	7	7	0	0	2014	7	\N	\N
2877	114	5	5	5	0	0	2014	5	\N	\N
2879	114	7	7	7	0	0	2014	7	\N	\N
2880	114	8	5	5	0	0	2014	5	\N	\N
2881	114	9	0	0	0	0	2014	0	\N	\N
2884	63	3	7	7	0	0	2014	7	\N	\N
2888	63	7	7	7	0	0	2014	7	\N	\N
2889	63	8	5	5	0	0	2014	5	\N	\N
2890	63	9	0	0	0	0	2014	0	\N	\N
2894	117	4	7	7	0	0	2014	7	\N	\N
2896	117	6	84	84	0	0	2014	84	\N	\N
2899	117	9	0	0	0	0	2014	0	\N	\N
2902	128	3	7	7	0	0	2014	7	\N	\N
2903	128	4	7	7	0	0	2014	7	\N	\N
2905	128	6	84	84	0	0	2014	84	\N	\N
2860	125	6	84	0	0	0	2014	0	\N	\N
2878	114	6	84	0	0	0	2014	0	\N	\N
2887	63	6	84	0	0	0	2014	0	\N	\N
2825	110	7	7	0	0	0	2014	0	\N	\N
2870	108	7	7	0	0	0	2014	0	\N	\N
2897	117	7	7	0	0	0	2014	0	\N	\N
2906	128	7	7	0	0	0	2014	0	\N	\N
2859	125	5	5	2.5	2.5	0	2014	5	\N	\N
2908	128	9	1	0	1	0	2014	1	\N	\N
2900	128	1	5	3	2	0	2014	5	\N	\N
2856	125	2	15	10	5	0	2014	15	\N	\N
2847	127	2	15	4	11	0	2014	15	\N	\N
2909	155	1	5	0	5	0	2014	5	\N	\N
2893	117	3	7	5	2	0	2014	7	\N	\N
2901	128	2	15	0	15	0	2014	15	\N	2015-01-05 09:06:57.848301
2853	127	8	5	2	3	0	2014	5	\N	\N
2892	117	2	15	0	15	0	2014	15	\N	\N
2871	108	8	5	1	4	0	2014	5	\N	\N
2895	117	5	5	0	5	0	2014	5	\N	\N
2850	127	5	5	1	4	0	2014	5	\N	\N
2891	117	1	5	0	5	0	2014	5	\N	\N
2907	128	8	5	0	5	0	2014	5	\N	\N
2868	108	5	5	0	5	0	2014	5	\N	\N
2882	63	1	5	1	4	0	2014	5	\N	\N
2865	108	2	15	0	15	0	2014	15	\N	\N
2846	127	1	5	0	5	0	2014	5	\N	\N
2885	63	4	7	2	5	0	2014	7	\N	\N
2864	108	1	5	1	4	0	2014	5	\N	\N
2862	125	8	5	1	4	0	2014	5	\N	\N
2904	128	5	5	0	5	0	2014	5	\N	2015-01-05 09:08:12.358103
2886	63	5	5	4.5	0.5	0	2014	5	\N	\N
2912	155	4	7	7	0	0	2014	7	\N	\N
2914	155	6	84	84	0	0	2014	84	\N	\N
2915	155	7	7	7	0	0	2014	7	\N	\N
2917	155	9	0	0	0	0	2014	0	\N	\N
2918	58	1	5	5	0	0	2014	5	\N	\N
2919	58	2	15	15	0	0	2014	15	\N	\N
2920	58	3	7	7	0	0	2014	7	\N	\N
2921	58	4	7	7	0	0	2014	7	\N	\N
2922	58	5	5	5	0	0	2014	5	\N	\N
39128	57	9	0	0	0	0	2017	0	2017-01-02 04:46:51.296119	2017-01-02 04:46:51.296119
2924	58	7	7	7	0	0	2014	7	\N	\N
2925	58	8	5	5	0	0	2014	5	\N	\N
2926	58	9	0	0	0	0	2014	0	\N	\N
2927	105	1	5	5	0	0	2014	5	\N	\N
2928	105	2	15	15	0	0	2014	15	\N	\N
2929	105	3	7	7	0	0	2014	7	\N	\N
2930	105	4	7	7	0	0	2014	7	\N	\N
2931	105	5	5	5	0	0	2014	5	\N	\N
2933	105	7	7	7	0	0	2014	7	\N	\N
2934	105	8	5	5	0	0	2014	5	\N	\N
2935	105	9	0	0	0	0	2014	0	\N	\N
2938	147	3	7	7	0	0	2014	7	\N	\N
2939	147	4	7	7	0	0	2014	7	\N	\N
2941	147	6	84	84	0	0	2014	84	\N	\N
2944	147	9	0	0	0	0	2014	0	\N	\N
2948	59	4	7	7	0	0	2014	7	\N	\N
2951	59	7	7	7	0	0	2014	7	\N	\N
2956	139	3	7	7	0	0	2014	7	\N	\N
2957	139	4	7	7	0	0	2014	7	\N	\N
2959	139	6	84	84	0	0	2014	84	\N	\N
2962	139	9	0	0	0	0	2014	0	\N	\N
2966	143	4	7	7	0	0	2014	7	\N	\N
2969	143	7	7	7	0	0	2014	7	\N	\N
2971	143	9	0	0	0	0	2014	0	\N	\N
2974	131	3	7	7	0	0	2014	7	\N	\N
2975	131	4	7	7	0	0	2014	7	\N	\N
2977	131	6	84	84	0	0	2014	84	\N	\N
2980	131	9	0	0	0	0	2014	0	\N	\N
2983	146	3	7	7	0	0	2014	7	\N	\N
2984	146	4	7	7	0	0	2014	7	\N	\N
2986	146	6	84	84	0	0	2014	84	\N	\N
2989	146	9	0	0	0	0	2014	0	\N	\N
2992	142	3	7	7	0	0	2014	7	\N	\N
2993	142	4	7	7	0	0	2014	7	\N	\N
2996	142	7	7	7	0	0	2014	7	\N	\N
2932	105	6	84	0	0	0	2014	0	\N	\N
2950	59	6	84	0	0	0	2014	0	\N	\N
2968	143	6	84	0	0	0	2014	0	\N	\N
2995	142	6	84	0	0	0	2014	0	\N	\N
2942	147	7	7	0	0	0	2014	0	\N	\N
2960	139	7	7	0	0	0	2014	0	\N	\N
2978	131	7	7	0	0	0	2014	0	\N	\N
2987	146	7	7	0	0	0	2014	0	\N	\N
2970	143	8	5	1	4	0	2014	5	\N	2015-01-05 04:42:35.991457
2958	139	5	5	0.5	4.5	0	2014	5	\N	\N
2961	139	8	5	1	4	0	2014	5	\N	\N
2910	155	2	15	2	13	0	2014	15	\N	\N
2991	142	2	15	2	13	0	2014	15	\N	\N
2943	147	8	5	0	5	0	2014	5	\N	\N
2953	59	9	1	0	1	0	2014	1	\N	\N
2946	59	2	15	0	15	0	2014	15	\N	\N
2954	139	1	5	0	5	0	2014	5	\N	\N
2940	147	5	5	0	5	0	2014	5	\N	\N
2973	131	2	15	0	15	0	2014	15	\N	\N
2947	59	3	7	5	2	0	2014	7	\N	2015-01-05 09:08:54.924425
2988	146	8	5	2	3	0	2014	5	\N	\N
2955	139	2	15	6	9	0	2014	15	\N	\N
2981	146	1	5	0	5	0	2014	5	\N	\N
2990	142	1	5	3	2	0	2014	5	\N	\N
2916	155	8	5	3	2	0	2014	5	\N	\N
2911	155	3	7	6	1	0	2014	7	\N	\N
2937	147	2	15	0	15	0	2014	15	\N	\N
2994	142	5	5	2	3	0	2014	5	\N	\N
2985	146	5	5	0	5	0	2014	5	\N	\N
2952	59	8	5	0	5	0	2014	5	\N	\N
2949	59	5	5	0	5	0	2014	5	\N	\N
2945	59	1	5	0	5	0	2014	5	\N	\N
2965	143	3	7	4	3	0	2014	7	\N	\N
2972	131	1	5	0	5	0	2014	5	\N	\N
2964	143	2	15	0	15	0	2014	15	\N	\N
2997	142	8	5	0	5	0	2014	5	\N	2015-01-05 09:07:53.870552
2913	155	5	5	2	3	0	2014	5	\N	\N
2976	131	5	5	0	5	0	2014	5	\N	\N
2967	143	5	5	-7.5	12.5	0	2014	5	\N	2015-01-05 09:09:05.482833
2979	131	8	5	0	5	0	2014	5	\N	\N
3001	158	3	7	7	0	0	2014	7	\N	\N
3002	158	4	7	7	0	0	2014	7	\N	\N
39129	33	1	5	5	0	0	2017	5	2017-01-02 04:46:51.306067	2017-01-02 04:46:51.306067
3005	158	7	7	7	0	0	2014	7	\N	\N
3006	158	8	5	5	0	0	2014	5	\N	\N
3007	158	9	0	0	0	0	2014	0	\N	\N
3011	144	4	7	7	0	0	2014	7	\N	\N
3014	144	7	7	7	0	0	2014	7	\N	\N
3019	160	3	7	7	0	0	2014	7	\N	\N
3020	160	4	7	7	0	0	2014	7	\N	\N
3022	160	6	84	84	0	0	2014	84	\N	\N
3023	160	7	7	7	0	0	2014	7	\N	\N
3025	160	9	0	0	0	0	2014	0	\N	\N
3026	150	1	5	5	0	0	2014	5	\N	\N
3027	150	2	15	15	0	0	2014	15	\N	\N
3028	150	3	7	7	0	0	2014	7	\N	\N
3029	150	4	7	7	0	0	2014	7	\N	\N
3030	150	5	5	5	0	0	2014	5	\N	\N
3031	150	6	84	84	0	0	2014	84	\N	\N
3032	150	7	7	7	0	0	2014	7	\N	\N
3033	150	8	5	5	0	0	2014	5	\N	\N
3034	150	9	0	0	0	0	2014	0	\N	\N
3035	141	1	5	5	0	0	2014	5	\N	\N
3036	141	2	15	15	0	0	2014	15	\N	\N
3037	141	3	7	7	0	0	2014	7	\N	\N
3038	141	4	7	7	0	0	2014	7	\N	\N
3039	141	5	5	5	0	0	2014	5	\N	\N
3040	141	6	84	84	0	0	2014	84	\N	\N
3041	141	7	7	7	0	0	2014	7	\N	\N
3042	141	8	5	5	0	0	2014	5	\N	\N
3043	141	9	0	0	0	0	2014	0	\N	\N
3044	156	1	5	5	0	0	2014	5	\N	\N
3045	156	2	15	15	0	0	2014	15	\N	\N
3046	156	3	7	7	0	0	2014	7	\N	\N
3047	156	4	7	7	0	0	2014	7	\N	\N
3048	156	5	5	5	0	0	2014	5	\N	\N
3049	156	6	84	84	0	0	2014	84	\N	\N
3050	156	7	7	7	0	0	2014	7	\N	\N
3051	156	8	5	5	0	0	2014	5	\N	\N
3052	156	9	0	0	0	0	2014	0	\N	\N
3053	157	1	5	5	0	0	2014	5	\N	\N
3054	157	2	15	15	0	0	2014	15	\N	\N
3055	157	3	7	7	0	0	2014	7	\N	\N
3056	157	4	7	7	0	0	2014	7	\N	\N
3057	157	5	5	5	0	0	2014	5	\N	\N
3059	157	7	7	7	0	0	2014	7	\N	\N
3060	157	8	5	5	0	0	2014	5	\N	\N
3061	157	9	0	0	0	0	2014	0	\N	\N
3062	148	1	5	5	0	0	2014	5	\N	\N
3063	148	2	15	15	0	0	2014	15	\N	\N
3064	148	3	7	7	0	0	2014	7	\N	\N
3065	148	4	7	7	0	0	2014	7	\N	\N
3066	148	5	5	5	0	0	2014	5	\N	\N
3067	148	6	84	84	0	0	2014	84	\N	\N
3068	148	7	7	7	0	0	2014	7	\N	\N
3069	148	8	5	5	0	0	2014	5	\N	\N
3070	148	9	0	0	0	0	2014	0	\N	\N
3071	149	1	5	5	0	0	2014	5	\N	\N
3072	149	2	15	15	0	0	2014	15	\N	\N
3073	149	3	7	7	0	0	2014	7	\N	\N
3074	149	4	7	7	0	0	2014	7	\N	\N
3075	149	5	5	5	0	0	2014	5	\N	\N
3077	149	7	7	7	0	0	2014	7	\N	\N
3078	149	8	5	5	0	0	2014	5	\N	\N
3079	149	9	0	0	0	0	2014	0	\N	\N
3082	151	3	7	7	0	0	2014	7	\N	\N
3083	151	4	7	7	0	0	2014	7	\N	\N
3085	151	6	84	84	0	0	2014	84	\N	\N
3013	144	6	84	0	0	0	2014	0	\N	\N
3058	157	6	84	0	0	0	2014	0	\N	\N
3076	149	6	84	0	0	0	2014	0	\N	\N
3081	151	2	15	0	15	0	2014	15	\N	\N
3021	160	5	5	1	4	0	2014	5	\N	\N
3080	151	1	5	0	5	0	2014	5	\N	\N
3008	144	1	5	0	5	0	2014	5	\N	\N
3018	160	2	15	2	13	0	2014	15	\N	\N
3024	160	8	5	3	2	0	2014	5	\N	\N
2999	158	1	5	4	1	0	2014	5	\N	\N
3003	158	5	5	4	1	0	2014	5	\N	\N
3000	158	2	15	6	9	0	2014	15	\N	\N
3010	144	3	7	4	3	0	2014	7	\N	\N
3017	160	1	5	2	3	0	2014	5	\N	\N
2998	142	9	2	0	2	0	2014	2	\N	\N
3084	151	5	5	2.5	2.5	0	2014	5	\N	\N
3012	144	5	5	0	5	0	2014	5	\N	\N
3016	144	9	1	0	1	0	2014	1	\N	\N
3015	144	8	5	0	5	0	2014	5	\N	2015-01-05 09:05:07.433087
3088	151	9	0	0	0	0	2014	0	\N	\N
3089	152	1	5	5	0	0	2014	5	\N	\N
3090	152	2	15	15	0	0	2014	15	\N	\N
3091	152	3	7	7	0	0	2014	7	\N	\N
3092	152	4	7	7	0	0	2014	7	\N	\N
3093	152	5	5	5	0	0	2014	5	\N	\N
3094	152	6	84	84	0	0	2014	84	\N	\N
3095	152	7	7	7	0	0	2014	7	\N	\N
3096	152	8	5	5	0	0	2014	5	\N	\N
3097	152	9	0	0	0	0	2014	0	\N	\N
3098	153	1	5	5	0	0	2014	5	\N	\N
3099	153	2	15	15	0	0	2014	15	\N	\N
3100	153	3	7	7	0	0	2014	7	\N	\N
3101	153	4	7	7	0	0	2014	7	\N	\N
3102	153	5	5	5	0	0	2014	5	\N	\N
3103	153	6	84	84	0	0	2014	84	\N	\N
3104	153	7	7	7	0	0	2014	7	\N	\N
3105	153	8	5	5	0	0	2014	5	\N	\N
3106	153	9	0	0	0	0	2014	0	\N	\N
3109	154	3	7	7	0	0	2014	7	\N	\N
3110	154	4	7	7	0	0	2014	7	\N	\N
3112	154	6	84	84	0	0	2014	84	\N	\N
3113	154	7	7	7	0	0	2014	7	\N	\N
3115	154	9	0	0	0	0	2014	0	\N	\N
3118	159	3	7	7	0	0	2014	7	\N	\N
3119	159	4	7	7	0	0	2014	7	\N	\N
3122	159	7	7	7	0	0	2014	7	\N	\N
3124	159	9	0	0	0	0	2014	0	\N	\N
3127	145	3	7	7	0	0	2014	7	\N	\N
3128	145	4	7	7	0	0	2014	7	\N	\N
3131	145	7	7	7	0	0	2014	7	\N	\N
3133	145	9	0	0	0	0	2014	0	\N	\N
2041	43	6	84	0	0	0	2014	0	\N	\N
2122	10	6	84	0	0	0	2014	0	\N	\N
2212	57	6	84	0	0	0	2014	0	\N	\N
2302	42	6	84	0	0	0	2014	0	\N	\N
2392	95	6	84	0	0	0	2014	0	\N	\N
2482	101	6	84	0	0	0	2014	0	\N	\N
2563	64	6	84	0	0	0	2014	0	\N	\N
2662	135	6	84	0	0	0	2014	0	\N	\N
2734	118	6	84	0	0	0	2014	0	\N	\N
2851	127	6	84	0	0	0	2014	0	\N	\N
2923	58	6	84	0	0	0	2014	0	\N	\N
3130	145	6	84	0	0	0	2014	0	\N	\N
3004	158	6	84	0	0	0	2014	0	\N	\N
3121	159	6	84	0	0	0	2014	0	\N	\N
3086	151	7	7	0	0	0	2014	0	\N	\N
1890	146	8	5	4	1	0	2013	5	\N	\N
39130	33	2	15	15	0	0	2017	15	2017-01-02 04:46:51.316166	2017-01-02 04:46:51.316166
1729	128	9	7	0	7	0	2013	7	\N	\N
3134	161	1	5	5	0	0	2014	5	\N	\N
3135	161	2	15	15	0	0	2014	15	\N	\N
3136	161	3	7	7	0	0	2014	7	\N	\N
3137	161	4	7	7	0	0	2014	7	\N	\N
3138	161	5	5	5	0	0	2014	5	\N	\N
3140	161	7	7	7	0	0	2014	7	\N	\N
3141	161	8	5	5	0	0	2014	5	\N	\N
3142	161	9	0	0	0	0	2014	0	\N	\N
3139	161	6	84	0	0	0	2014	0	\N	\N
3120	159	5	5	4.5	0.5	0	2014	5	\N	\N
3114	154	8	5	2	3	0	2014	5	\N	\N
3145	162	3	7	7	0	0	2014	7	\N	\N
3146	162	4	7	7	0	0	2014	7	\N	\N
3116	159	1	5	3	2	0	2014	5	\N	\N
3149	162	7	7	7	0	0	2014	7	\N	\N
3117	159	2	15	3	12	0	2014	15	\N	\N
3151	162	9	0	0	0	0	2014	0	\N	\N
3148	162	6	84	0	0	0	2014	0	\N	\N
3143	162	1	5	0	5	0	2014	5	\N	\N
3154	163	3	7	7	0	0	2014	7	\N	\N
3155	163	4	7	7	0	0	2014	7	\N	\N
3125	145	1	5	0	5	0	2014	5	\N	\N
3123	159	8	5	3	2	0	2014	5	\N	\N
3129	145	5	5	0	5	0	2014	5	\N	2015-01-05 04:42:33.585834
3150	162	8	5	2	3	0	2014	5	\N	\N
3111	154	5	5	0.5	4.5	0	2014	5	\N	\N
3152	163	1	5	2	3	0	2014	5	\N	\N
3087	151	8	5	0	5	0	2014	5	\N	\N
3144	162	2	15	0	15	0	2014	15	\N	\N
3107	154	1	5	-7	12	0	2014	5	\N	\N
3132	145	8	5	0	5	0	2014	5	\N	\N
3153	163	2	15	1	14	0	2014	15	\N	2015-01-05 09:07:57.891088
3147	162	5	5	0	5	0	2014	5	\N	\N
3108	154	2	15	5	10	0	2014	15	\N	\N
3126	145	2	15	0	15	0	2014	15	\N	\N
3156	163	5	5	3	2	0	2014	5	\N	\N
3158	163	7	7	7	0	0	2014	7	\N	\N
3160	163	9	0	0	0	0	2014	0	\N	\N
3157	163	6	84	0	0	0	2014	0	\N	\N
3161	164	1	5	5	0	0	2014	5	\N	\N
3163	164	3	7	7	0	0	2014	7	\N	\N
3164	164	4	7	7	0	0	2014	7	\N	\N
3165	164	5	5	5	0	0	2014	5	\N	\N
3167	164	7	7	7	0	0	2014	7	\N	\N
3168	164	8	5	5	0	0	2014	5	\N	\N
3169	164	9	0	0	0	0	2014	0	\N	\N
3166	164	6	84	0	0	0	2014	0	\N	\N
39131	33	3	7	7	0	0	2017	7	2017-01-02 04:46:51.32608	2017-01-02 04:46:51.32608
3172	165	3	7	7	0	0	2014	7	\N	\N
3173	165	4	7	7	0	0	2014	7	\N	\N
3176	165	7	7	7	0	0	2014	7	\N	\N
3178	165	9	0	0	0	0	2014	0	\N	\N
3175	165	6	84	0	0	0	2014	0	\N	\N
3220	170	6	84	0	0	0	2014	0	\N	\N
3179	166	1	5	5	0	0	2014	5	\N	\N
3180	166	2	15	15	0	0	2014	15	\N	\N
3181	166	3	7	7	0	0	2014	7	\N	\N
3182	166	4	7	7	0	0	2014	7	\N	\N
3183	166	5	5	5	0	0	2014	5	\N	\N
3185	166	7	7	7	0	0	2014	7	\N	\N
3186	166	8	5	5	0	0	2014	5	\N	\N
3187	166	9	0	0	0	0	2014	0	\N	\N
3184	166	6	84	0	0	0	2014	0	\N	\N
2751	123	5	5	4	1	0	2014	5	\N	\N
3206	169	1	5	2	3	0	2014	5	\N	\N
3188	167	1	5	5	0	0	2014	5	\N	\N
3189	167	2	15	15	0	0	2014	15	\N	\N
3190	167	3	7	7	0	0	2014	7	\N	\N
3191	167	4	7	7	0	0	2014	7	\N	\N
3192	167	5	5	5	0	0	2014	5	\N	\N
3194	167	7	7	7	0	0	2014	7	\N	\N
3195	167	8	5	5	0	0	2014	5	\N	\N
3196	167	9	0	0	0	0	2014	0	\N	\N
3193	167	6	84	0	0	0	2014	0	\N	\N
3199	168	3	7	7	0	0	2014	7	\N	\N
3200	168	4	7	7	0	0	2014	7	\N	\N
3202	168	6	84	84	0	0	2014	84	\N	\N
3205	168	9	0	0	0	0	2014	0	\N	\N
3203	168	7	7	0	0	0	2014	0	\N	\N
3210	169	5	5	1.5	3.5	0	2014	5	\N	\N
3162	164	2	15	13	2	0	2014	15	\N	\N
3208	169	3	7	7	0	0	2014	7	\N	\N
3209	169	4	7	7	0	0	2014	7	\N	\N
3212	169	7	7	7	0	0	2014	7	\N	\N
3214	169	9	0	0	0	0	2014	0	\N	\N
3211	169	6	84	0	0	0	2014	0	\N	\N
3215	170	1	5	0	5	0	2014	5	\N	\N
3217	170	3	7	7	0	0	2014	7	\N	\N
3218	170	4	7	7	0	0	2014	7	\N	\N
3221	170	7	7	7	0	0	2014	7	\N	\N
3223	170	9	0	0	0	0	2014	0	\N	\N
3227	171	4	7	7	0	0	2014	7	\N	\N
3230	171	7	7	7	0	0	2014	7	\N	\N
3232	171	9	0	0	0	0	2014	0	\N	\N
3229	171	6	84	0	0	0	2014	0	\N	\N
3233	172	1	5	5	0	0	2014	5	\N	\N
3234	172	2	15	15	0	0	2014	15	\N	\N
3235	172	3	7	7	0	0	2014	7	\N	\N
3197	168	1	5	1.5	3.5	0	2014	5	\N	\N
2388	95	2	15	0	15	0	2014	15	\N	\N
3251	174	1	5	5	0	0	2014	5	\N	\N
2288	60	1	5	0	5	0	2014	5	\N	\N
2298	42	2	15	9	6	0	2014	15	\N	\N
3171	165	2	15	2	13	0	2014	15	\N	\N
3216	170	2	15	0	15	0	2014	15	\N	\N
3159	163	8	5	0	5	0	2014	5	\N	\N
3204	168	8	5	2	3	0	2014	5	\N	\N
3201	168	5	5	2.5	2.5	0	2014	5	\N	\N
3228	171	5	5	2.5	2.5	0	2014	5	\N	\N
2166	44	5	5	0	5	0	2014	5	\N	\N
2496	87	2	15	3	12	0	2014	15	\N	\N
2574	68	8	5	3	2	0	2014	5	\N	\N
3198	168	2	15	6	9	0	2014	15	\N	\N
3226	171	3	7	6	1	0	2014	7	\N	\N
3224	171	1	5	4	1	0	2014	5	\N	\N
3222	170	8	5	2	3	0	2014	5	\N	\N
3213	169	8	5	4	1	0	2014	5	\N	\N
3177	165	8	5	2	3	0	2014	5	\N	\N
2898	117	8	5	0	5	0	2014	5	\N	\N
3219	170	5	5	0	5	0	2014	5	\N	\N
3207	169	2	15	0	15	0	2014	15	\N	\N
3174	165	5	5	0	5	0	2014	5	\N	\N
3236	172	4	7	7	0	0	2014	7	\N	\N
3237	172	5	5	5	0	0	2014	5	\N	\N
3239	172	7	7	7	0	0	2014	7	\N	\N
3240	172	8	5	5	0	0	2014	5	\N	\N
3241	172	9	0	0	0	0	2014	0	\N	\N
3238	172	6	84	0	0	0	2014	0	\N	\N
39132	33	4	7	7	0	0	2017	7	2017-01-02 04:46:51.33621	2017-01-02 04:46:51.33621
3242	173	1	5	5	0	0	2014	5	\N	\N
3243	173	2	15	15	0	0	2014	15	\N	\N
3244	173	3	7	7	0	0	2014	7	\N	\N
3245	173	4	7	7	0	0	2014	7	\N	\N
3246	173	5	5	5	0	0	2014	5	\N	\N
3247	173	6	84	84	0	0	2014	84	\N	\N
3249	173	8	5	5	0	0	2014	5	\N	\N
3250	173	9	0	0	0	0	2014	0	\N	\N
3248	173	7	7	0	0	0	2014	0	\N	\N
39133	33	5	5	5	0	0	2017	5	2017-01-02 04:46:51.346326	2017-01-02 04:46:51.346326
3170	165	1	5	0	5	0	2014	5	\N	\N
39135	33	7	7	7	0	0	2017	7	2017-01-02 04:46:51.366278	2017-01-02 04:46:51.366278
39136	33	8	5	5	0	0	2017	5	2017-01-02 04:46:51.376344	2017-01-02 04:46:51.376344
39137	33	9	0	0	0	0	2017	0	2017-01-02 04:46:51.386497	2017-01-02 04:46:51.386497
39138	91	1	5	5	0	0	2017	5	2017-01-02 04:46:51.396388	2017-01-02 04:46:51.396388
39139	91	2	15	15	0	0	2017	15	2017-01-02 04:46:51.406417	2017-01-02 04:46:51.406417
39140	91	3	7	7	0	0	2017	7	2017-01-02 04:46:51.416467	2017-01-02 04:46:51.416467
39141	91	4	7	7	0	0	2017	7	2017-01-02 04:46:51.426461	2017-01-02 04:46:51.426461
39142	91	5	5	5	0	0	2017	5	2017-01-02 04:46:51.436499	2017-01-02 04:46:51.436499
39144	91	7	7	7	0	0	2017	7	2017-01-02 04:46:51.45654	2017-01-02 04:46:51.45654
39145	91	8	5	5	0	0	2017	5	2017-01-02 04:46:51.466565	2017-01-02 04:46:51.466565
39146	91	9	0	0	0	0	2017	0	2017-01-02 04:46:51.476541	2017-01-02 04:46:51.476541
39147	67	1	5	5	0	0	2017	5	2017-01-02 04:46:51.486594	2017-01-02 04:46:51.486594
39148	67	2	15	15	0	0	2017	15	2017-01-02 04:46:51.496567	2017-01-02 04:46:51.496567
39149	67	3	7	7	0	0	2017	7	2017-01-02 04:46:51.506611	2017-01-02 04:46:51.506611
39150	67	4	7	7	0	0	2017	7	2017-01-02 04:46:51.516758	2017-01-02 04:46:51.516758
39151	67	5	5	5	0	0	2017	5	2017-01-02 04:46:51.526758	2017-01-02 04:46:51.526758
39153	67	7	7	7	0	0	2017	7	2017-01-02 04:46:51.546772	2017-01-02 04:46:51.546772
39154	67	8	5	5	0	0	2017	5	2017-01-02 04:46:51.556801	2017-01-02 04:46:51.556801
39155	67	9	0	0	0	0	2017	0	2017-01-02 04:46:51.566785	2017-01-02 04:46:51.566785
39158	40	3	7	7	0	0	2017	7	2017-01-02 04:46:51.596892	2017-01-02 04:46:51.596892
39159	40	4	7	7	0	0	2017	7	2017-01-02 04:46:51.60689	2017-01-02 04:46:51.60689
39162	40	7	7	7	0	0	2017	7	2017-01-02 04:46:51.636981	2017-01-02 04:46:51.636981
39165	41	1	5	5	0	0	2017	5	2017-01-02 04:46:51.667043	2017-01-02 04:46:51.667043
39166	41	2	15	15	0	0	2017	15	2017-01-02 04:46:51.677087	2017-01-02 04:46:51.677087
39167	41	3	7	7	0	0	2017	7	2017-01-02 04:46:51.687097	2017-01-02 04:46:51.687097
39168	41	4	7	7	0	0	2017	7	2017-01-02 04:46:51.697126	2017-01-02 04:46:51.697126
39169	41	5	5	5	0	0	2017	5	2017-01-02 04:46:51.707168	2017-01-02 04:46:51.707168
39171	41	7	7	7	0	0	2017	7	2017-01-02 04:46:51.727192	2017-01-02 04:46:51.727192
39172	41	8	5	5	0	0	2017	5	2017-01-02 04:46:51.737256	2017-01-02 04:46:51.737256
39173	41	9	0	0	0	0	2017	0	2017-01-02 04:46:51.747315	2017-01-02 04:46:51.747315
39174	76	1	5	5	0	0	2017	5	2017-01-02 04:46:51.75732	2017-01-02 04:46:51.75732
39175	76	2	15	15	0	0	2017	15	2017-01-02 04:46:51.767349	2017-01-02 04:46:51.767349
39176	76	3	7	7	0	0	2017	7	2017-01-02 04:46:51.777381	2017-01-02 04:46:51.777381
39177	76	4	7	7	0	0	2017	7	2017-01-02 04:46:51.787426	2017-01-02 04:46:51.787426
39178	76	5	5	5	0	0	2017	5	2017-01-02 04:46:51.797412	2017-01-02 04:46:51.797412
39180	76	7	7	7	0	0	2017	7	2017-01-02 04:46:51.817475	2017-01-02 04:46:51.817475
39181	76	8	5	5	0	0	2017	5	2017-01-02 04:46:51.827563	2017-01-02 04:46:51.827563
39182	76	9	0	0	0	0	2017	0	2017-01-02 04:46:51.837565	2017-01-02 04:46:51.837565
39183	34	1	5	5	0	0	2017	5	2017-01-02 04:46:51.847598	2017-01-02 04:46:51.847598
39184	34	2	15	15	0	0	2017	15	2017-01-02 04:46:51.857633	2017-01-02 04:46:51.857633
39185	34	3	7	7	0	0	2017	7	2017-01-02 04:46:51.867639	2017-01-02 04:46:51.867639
39186	34	4	7	7	0	0	2017	7	2017-01-02 04:46:51.877634	2017-01-02 04:46:51.877634
39187	34	5	5	5	0	0	2017	5	2017-01-02 04:46:51.887703	2017-01-02 04:46:51.887703
39189	34	7	7	7	0	0	2017	7	2017-01-02 04:46:51.907741	2017-01-02 04:46:51.907741
39190	34	8	5	5	0	0	2017	5	2017-01-02 04:46:51.917724	2017-01-02 04:46:51.917724
39191	34	9	0	0	0	0	2017	0	2017-01-02 04:46:51.927824	2017-01-02 04:46:51.927824
39192	36	1	5	5	0	0	2017	5	2017-01-02 04:46:51.937741	2017-01-02 04:46:51.937741
39143	91	6	84	0	0	0	2017	0	2017-01-02 04:46:51.44649	2017-01-02 04:47:23.832295
39152	67	6	84	0	0	0	2017	0	2017-01-02 04:46:51.536822	2017-01-02 04:47:23.852412
39161	40	6	84	0	0	0	2017	0	2017-01-02 04:46:51.626925	2017-01-02 04:47:23.876124
39170	41	6	84	0	0	0	2017	0	2017-01-02 04:46:51.717191	2017-01-02 04:47:23.903031
39179	76	6	84	0	0	0	2017	0	2017-01-02 04:46:51.807512	2017-01-02 04:47:23.922984
39188	34	6	84	0	0	0	2017	0	2017-01-02 04:46:51.897672	2017-01-02 04:47:23.94295
39163	40	8	5	1	4	0	2017	5	2017-01-02 04:46:51.647006	2017-08-10 06:57:32.184225
39160	40	5	5	1	4	0	2017	5	2017-01-02 04:46:51.616949	2017-07-26 11:29:31.201906
39156	40	1	5	1	4	0	2017	5	2017-01-02 04:46:51.576839	2017-07-26 11:28:46.921562
39157	40	2	15	9	6	0	2017	15	2017-01-02 04:46:51.586832	2017-05-26 10:55:41.340416
39164	40	9	1	0	1	0	2017	1	2017-01-02 04:46:51.657055	2017-04-26 09:38:02.133159
3252	174	2	15	15	0	0	2014	15	\N	\N
3253	174	3	7	7	0	0	2014	7	\N	\N
3254	174	4	7	7	0	0	2014	7	\N	\N
3255	174	5	5	5	0	0	2014	5	\N	\N
3257	174	7	7	7	0	0	2014	7	\N	\N
3258	174	8	5	5	0	0	2014	5	\N	\N
3259	174	9	0	0	0	0	2014	0	\N	\N
3256	174	6	84	0	0	0	2014	0	\N	\N
3261	175	2	15	15	0	0	2014	15	\N	\N
3262	175	3	7	7	0	0	2014	7	\N	\N
3263	175	4	7	7	0	0	2014	7	\N	\N
3264	175	5	5	5	0	0	2014	5	\N	\N
3266	175	7	7	7	0	0	2014	7	\N	\N
3268	175	9	0	0	0	0	2014	0	\N	\N
3265	175	6	84	0	0	0	2014	0	\N	\N
3271	176	3	7	7	0	0	2014	7	\N	\N
3272	176	4	7	7	0	0	2014	7	\N	\N
39193	36	2	15	15	0	0	2017	15	2017-01-02 04:46:51.94786	2017-01-02 04:46:51.94786
3274	176	6	84	84	0	0	2014	84	\N	\N
3277	176	9	0	0	0	0	2014	0	\N	\N
3275	176	7	7	0	0	0	2014	0	\N	\N
2982	146	2	15	0	15	0	2014	15	\N	\N
3280	177	3	7	7	0	0	2014	7	\N	\N
3281	177	4	7	7	0	0	2014	7	\N	\N
3282	177	5	5	5	0	0	2014	5	\N	\N
3284	177	7	7	7	0	0	2014	7	\N	\N
3283	177	6	84	0	0	0	2014	0	\N	\N
3289	178	3	7	7	0	0	2014	7	\N	\N
3290	178	4	7	7	0	0	2014	7	\N	\N
3293	178	7	7	7	0	0	2014	7	\N	\N
3294	178	8	5	5	0	0	2014	5	\N	\N
3295	178	9	0	0	0	0	2014	0	\N	\N
3292	178	6	84	0	0	0	2014	0	\N	\N
3298	179	3	7	7	0	0	2014	7	\N	\N
3299	179	4	7	7	0	0	2014	7	\N	\N
3302	179	7	7	7	0	0	2014	7	\N	\N
3304	179	9	0	0	0	0	2014	0	\N	\N
3301	179	6	84	0	0	0	2014	0	\N	\N
3260	175	1	5	4	1	0	2014	5	\N	\N
3267	175	8	5	4	1	0	2014	5	\N	\N
3305	180	1	5	5	0	0	2014	5	\N	\N
3306	180	2	15	15	0	0	2014	15	\N	\N
3307	180	3	7	7	0	0	2014	7	\N	\N
3308	180	4	7	7	0	0	2014	7	\N	\N
3309	180	5	5	5	0	0	2014	5	\N	\N
3311	180	7	7	7	0	0	2014	7	\N	\N
3312	180	8	5	5	0	0	2014	5	\N	\N
3313	180	9	0	0	0	0	2014	0	\N	\N
3310	180	6	84	0	0	0	2014	0	\N	\N
3316	181	3	7	7	0	0	2014	7	\N	\N
3317	181	4	7	7	0	0	2014	7	\N	\N
3318	181	5	5	5	0	0	2014	5	\N	\N
3320	181	7	7	7	0	0	2014	7	\N	\N
3321	181	8	5	5	0	0	2014	5	\N	\N
3322	181	9	0	0	0	0	2014	0	\N	\N
3319	181	6	84	0	0	0	2014	0	\N	\N
3324	182	2	15	15	0	0	2014	15	\N	\N
3325	182	3	7	7	0	0	2014	7	\N	\N
3326	182	4	7	7	0	0	2014	7	\N	\N
3329	182	7	7	7	0	0	2014	7	\N	\N
3330	182	8	5	5	0	0	2014	5	\N	\N
3331	182	9	0	0	0	0	2014	0	\N	\N
3328	182	6	84	0	0	0	2014	0	\N	\N
3291	178	5	5	4	1	0	2014	5	\N	\N
3332	183	1	5	5	0	0	2014	5	\N	\N
3334	183	3	7	7	0	0	2014	7	\N	\N
3269	176	1	5	4	1	0	2014	5	\N	\N
3297	179	2	15	7	8	0	2014	15	\N	\N
3231	171	8	5	0	5	0	2014	5	\N	2015-01-05 09:07:39.164192
3323	182	1	5	0	5	0	2014	5	\N	\N
3315	181	2	15	14	1	0	2014	15	\N	\N
3333	183	2	15	12	3	0	2014	15	\N	\N
3335	183	4	7	2	5	0	2014	7	\N	\N
3336	183	5	5	4	1	0	2014	5	\N	\N
3314	181	1	5	4	1	0	2014	5	\N	\N
3285	177	8	5	4	1	0	2014	5	\N	\N
3278	177	1	5	1	4	0	2014	5	\N	\N
3287	178	1	5	4	1	0	2014	5	\N	\N
3327	182	5	5	4	1	0	2014	5	\N	\N
3300	179	5	5	4.5	0.5	0	2014	5	\N	\N
3270	176	2	15	0	15	0	2014	15	\N	\N
3276	176	8	5	1	4	0	2014	5	\N	2015-01-05 09:08:02.076559
2106	91	8	5	1	4	0	2014	5	\N	\N
3303	179	8	5	2	3	0	2014	5	\N	\N
3279	177	2	15	2	13	0	2014	15	\N	\N
3288	178	2	15	1	14	0	2014	15	\N	\N
3338	183	7	7	7	0	0	2014	7	\N	\N
3339	183	8	5	5	0	0	2014	5	\N	\N
3340	183	9	0	0	0	0	2014	0	\N	\N
3337	183	6	84	0	0	0	2014	0	\N	\N
2503	87	9	8	0	8	0	2014	8	\N	\N
39194	36	3	7	7	0	0	2017	7	2017-01-02 04:46:52.028223	2017-01-02 04:46:52.028223
3341	184	1	5	5	0	0	2014	5	\N	\N
3342	184	2	15	15	0	0	2014	15	\N	\N
3343	184	3	7	7	0	0	2014	7	\N	\N
3344	184	4	7	7	0	0	2014	7	\N	\N
3345	184	5	5	5	0	0	2014	5	\N	\N
3347	184	7	7	7	0	0	2014	7	\N	\N
3348	184	8	5	5	0	0	2014	5	\N	\N
3349	184	9	0	0	0	0	2014	0	\N	\N
3346	184	6	84	0	0	0	2014	0	\N	\N
3353	185	4	7	7	0	0	2014	7	\N	\N
3354	185	5	5	5	0	0	2014	5	\N	\N
3356	185	7	7	7	0	0	2014	7	\N	\N
3358	185	9	0	0	0	0	2014	0	\N	\N
3355	185	6	84	0	0	0	2014	0	\N	\N
3286	177	9	1	1	0	0	2014	1	\N	\N
3359	186	1	5	5	0	0	2014	5	\N	\N
3360	186	2	15	15	0	0	2014	15	\N	\N
3361	186	3	7	7	0	0	2014	7	\N	\N
3362	186	4	7	7	0	0	2014	7	\N	\N
3363	186	5	5	5	0	0	2014	5	\N	\N
3365	186	7	7	7	0	0	2014	7	\N	\N
3366	186	8	5	5	0	0	2014	5	\N	\N
3367	186	9	0	0	0	0	2014	0	\N	\N
3364	186	6	84	0	0	0	2014	0	\N	\N
3368	187	1	5	5	0	0	2014	5	\N	\N
3370	187	3	7	7	0	0	2014	7	\N	\N
3371	187	4	7	7	0	0	2014	7	\N	\N
3372	187	5	5	5	0	0	2014	5	\N	\N
3374	187	7	7	7	0	0	2014	7	\N	\N
3376	187	9	0	0	0	0	2014	0	\N	\N
3373	187	6	84	0	0	0	2014	0	\N	\N
3379	188	3	7	7	0	0	2014	7	\N	\N
3380	188	4	7	7	0	0	2014	7	\N	\N
3383	188	7	7	7	0	0	2014	7	\N	\N
3385	188	9	0	0	0	0	2014	0	\N	\N
3382	188	6	84	0	0	0	2014	0	\N	\N
3386	189	1	5	5	0	0	2014	5	\N	\N
3388	189	3	7	7	0	0	2014	7	\N	\N
3389	189	4	7	7	0	0	2014	7	\N	\N
3392	189	7	7	7	0	0	2014	7	\N	\N
3393	189	8	5	5	0	0	2014	5	\N	\N
3394	189	9	0	0	0	0	2014	0	\N	\N
3391	189	6	84	0	0	0	2014	0	\N	\N
3395	190	1	5	5	0	0	2014	5	\N	\N
3396	190	2	15	15	0	0	2014	15	\N	\N
3397	190	3	7	7	0	0	2014	7	\N	\N
3398	190	4	7	7	0	0	2014	7	\N	\N
3399	190	5	5	5	0	0	2014	5	\N	\N
3401	190	7	7	7	0	0	2014	7	\N	\N
3402	190	8	5	5	0	0	2014	5	\N	\N
3403	190	9	0	0	0	0	2014	0	\N	\N
3400	190	6	84	0	0	0	2014	0	\N	\N
3405	191	2	15	15	0	0	2014	15	\N	\N
3406	191	3	7	7	0	0	2014	7	\N	\N
3407	191	4	7	7	0	0	2014	7	\N	\N
3408	191	5	5	5	0	0	2014	5	\N	\N
3410	191	7	7	7	0	0	2014	7	\N	\N
3412	191	9	0	0	0	0	2014	0	\N	\N
3409	191	6	84	0	0	0	2014	0	\N	\N
3415	192	3	7	7	0	0	2014	7	\N	\N
3416	192	4	7	7	0	0	2014	7	\N	\N
3404	191	1	5	0	5	0	2014	5	\N	2015-01-06 04:27:41.430908
3390	189	5	5	4.5	0.5	0	2014	5	\N	\N
3352	185	3	7	6	1	0	2014	7	\N	\N
2076	40	5	5	3.5	1.5	0	2014	5	\N	\N
3381	188	5	5	3	2	0	2014	5	\N	\N
3351	185	2	15	8	7	0	2014	15	\N	\N
3375	187	8	5	4	1	0	2014	5	\N	\N
3449	196	1	5	2	3	0	2014	5	\N	\N
3378	188	2	15	13	2	0	2014	15	\N	\N
3413	192	1	5	2	3	0	2014	5	\N	\N
3357	185	8	5	1	4	0	2014	5	\N	\N
3369	187	2	15	13	2	0	2014	15	\N	\N
2712	109	2	15	0	15	0	2014	15	\N	\N
3414	192	2	15	12	3	0	2014	15	\N	\N
3387	189	2	15	8	7	0	2014	15	\N	\N
3296	179	1	5	2	3	0	2014	5	\N	\N
3350	185	1	5	1	4	0	2014	5	\N	\N
3384	188	8	5	3	2	0	2014	5	\N	\N
2775	133	2	15	3	12	0	2014	15	\N	\N
3417	192	5	5	5	0	0	2014	5	\N	\N
3419	192	7	7	7	0	0	2014	7	\N	\N
3420	192	8	5	5	0	0	2014	5	\N	\N
3421	192	9	0	0	0	0	2014	0	\N	\N
3418	192	6	84	0	0	0	2014	0	\N	\N
3422	193	1	5	5	0	0	2014	5	\N	\N
3423	193	2	15	15	0	0	2014	15	\N	\N
3424	193	3	7	7	0	0	2014	7	\N	\N
3425	193	4	7	7	0	0	2014	7	\N	\N
3426	193	5	5	5	0	0	2014	5	\N	\N
3428	193	7	7	7	0	0	2014	7	\N	\N
3429	193	8	5	5	0	0	2014	5	\N	\N
3430	193	9	0	0	0	0	2014	0	\N	\N
3427	193	6	84	0	0	0	2014	0	\N	\N
3433	194	3	7	7	0	0	2014	7	\N	\N
3434	194	4	7	7	0	0	2014	7	\N	\N
3436	194	6	84	84	0	0	2014	84	\N	\N
3439	194	9	0	0	0	0	2014	0	\N	\N
3437	194	7	7	0	0	0	2014	0	\N	\N
3441	195	2	15	15	0	0	2014	15	\N	\N
3442	195	3	7	7	0	0	2014	7	\N	\N
3443	195	4	7	7	0	0	2014	7	\N	\N
3444	195	5	5	5	0	0	2014	5	\N	\N
3446	195	7	7	7	0	0	2014	7	\N	\N
3447	195	8	5	5	0	0	2014	5	\N	\N
3448	195	9	0	0	0	0	2014	0	\N	\N
3445	195	6	84	0	0	0	2014	0	\N	\N
3440	195	1	5	1	4	0	2014	5	\N	\N
39195	36	4	7	7	0	0	2017	7	2017-01-02 04:46:52.037843	2017-01-02 04:46:52.037843
39196	36	5	5	5	0	0	2017	5	2017-01-02 04:46:52.047913	2017-01-02 04:46:52.047913
39198	36	7	7	7	0	0	2017	7	2017-01-02 04:46:52.067934	2017-01-02 04:46:52.067934
39199	36	8	5	5	0	0	2017	5	2017-01-02 04:46:52.077907	2017-01-02 04:46:52.077907
39200	36	9	0	0	0	0	2017	0	2017-01-02 04:46:52.10817	2017-01-02 04:46:52.10817
3435	194	5	5	2	3	0	2014	5	\N	\N
39201	55	1	5	5	0	0	2017	5	2017-01-02 04:46:52.118826	2017-01-02 04:46:52.118826
3431	194	1	5	2	3	0	2014	5	\N	\N
39202	55	2	15	15	0	0	2017	15	2017-01-02 04:46:52.148786	2017-01-02 04:46:52.148786
3432	194	2	15	5	10	0	2014	15	\N	\N
3438	194	8	5	0	5	0	2014	5	\N	2015-01-05 09:08:06.187845
39203	55	3	7	7	0	0	2017	7	2017-01-02 04:46:52.17884	2017-01-02 04:46:52.17884
39204	55	4	7	7	0	0	2017	7	2017-01-02 04:46:52.209041	2017-01-02 04:46:52.209041
39205	55	5	5	5	0	0	2017	5	2017-01-02 04:46:52.218865	2017-01-02 04:46:52.218865
39207	55	7	7	7	0	0	2017	7	2017-01-02 04:46:52.23918	2017-01-02 04:46:52.23918
39208	55	8	5	5	0	0	2017	5	2017-01-02 04:46:52.249016	2017-01-02 04:46:52.249016
39209	55	9	0	0	0	0	2017	0	2017-01-02 04:46:52.259051	2017-01-02 04:46:52.259051
39210	50	1	5	5	0	0	2017	5	2017-01-02 04:46:52.269152	2017-01-02 04:46:52.269152
39211	50	2	15	15	0	0	2017	15	2017-01-02 04:46:52.278477	2017-01-02 04:46:52.278477
39212	50	3	7	7	0	0	2017	7	2017-01-02 04:46:52.2885	2017-01-02 04:46:52.2885
39213	50	4	7	7	0	0	2017	7	2017-01-02 04:46:52.298329	2017-01-02 04:46:52.298329
39214	50	5	5	5	0	0	2017	5	2017-01-02 04:46:52.308347	2017-01-02 04:46:52.308347
39216	50	7	7	7	0	0	2017	7	2017-01-02 04:46:52.32847	2017-01-02 04:46:52.32847
39217	50	8	5	5	0	0	2017	5	2017-01-02 04:46:52.33847	2017-01-02 04:46:52.33847
39218	50	9	0	0	0	0	2017	0	2017-01-02 04:46:52.348481	2017-01-02 04:46:52.348481
39219	32	1	5	5	0	0	2017	5	2017-01-02 04:46:52.358531	2017-01-02 04:46:52.358531
39220	32	2	15	15	0	0	2017	15	2017-01-02 04:46:52.3685	2017-01-02 04:46:52.3685
39221	32	3	7	7	0	0	2017	7	2017-01-02 04:46:52.37853	2017-01-02 04:46:52.37853
39222	32	4	7	7	0	0	2017	7	2017-01-02 04:46:52.388756	2017-01-02 04:46:52.388756
39223	32	5	5	5	0	0	2017	5	2017-01-02 04:46:52.39862	2017-01-02 04:46:52.39862
39225	32	7	7	7	0	0	2017	7	2017-01-02 04:46:52.418646	2017-01-02 04:46:52.418646
39226	32	8	5	5	0	0	2017	5	2017-01-02 04:46:52.42858	2017-01-02 04:46:52.42858
39227	32	9	0	0	0	0	2017	0	2017-01-02 04:46:52.438682	2017-01-02 04:46:52.438682
39228	97	1	5	5	0	0	2017	5	2017-01-02 04:46:52.44874	2017-01-02 04:46:52.44874
39229	97	2	15	15	0	0	2017	15	2017-01-02 04:46:52.459477	2017-01-02 04:46:52.459477
39230	97	3	7	7	0	0	2017	7	2017-01-02 04:46:52.469698	2017-01-02 04:46:52.469698
39231	97	4	7	7	0	0	2017	7	2017-01-02 04:46:52.479751	2017-01-02 04:46:52.479751
39232	97	5	5	5	0	0	2017	5	2017-01-02 04:46:52.489647	2017-01-02 04:46:52.489647
39233	97	6	84	84	0	0	2017	84	2017-01-02 04:46:52.499675	2017-01-02 04:46:52.499675
39235	97	8	5	5	0	0	2017	5	2017-01-02 04:46:52.519577	2017-01-02 04:46:52.519577
39236	97	9	0	0	0	0	2017	0	2017-01-02 04:46:52.529535	2017-01-02 04:46:52.529535
39237	96	1	5	5	0	0	2017	5	2017-01-02 04:46:52.53966	2017-01-02 04:46:52.53966
39238	96	2	15	15	0	0	2017	15	2017-01-02 04:46:52.549577	2017-01-02 04:46:52.549577
39239	96	3	7	7	0	0	2017	7	2017-01-02 04:46:52.559607	2017-01-02 04:46:52.559607
39240	96	4	7	7	0	0	2017	7	2017-01-02 04:46:52.569627	2017-01-02 04:46:52.569627
39241	96	5	5	5	0	0	2017	5	2017-01-02 04:46:52.579666	2017-01-02 04:46:52.579666
39197	36	6	84	0	0	0	2017	0	2017-01-02 04:46:52.058081	2017-01-02 04:47:23.962978
39206	55	6	84	0	0	0	2017	0	2017-01-02 04:46:52.229131	2017-01-02 04:47:23.983044
39215	50	6	84	0	0	0	2017	0	2017-01-02 04:46:52.318373	2017-01-02 04:47:24.0031
39224	32	6	84	0	0	0	2017	0	2017-01-02 04:46:52.408632	2017-01-02 04:47:24.023142
3450	196	2	15	15	0	0	2014	15	\N	\N
3451	196	3	7	7	0	0	2014	7	\N	\N
3452	196	4	7	7	0	0	2014	7	\N	\N
3453	196	5	5	5	0	0	2014	5	\N	\N
3455	196	7	7	7	0	0	2014	7	\N	\N
3456	196	8	5	5	0	0	2014	5	\N	\N
3457	196	9	0	0	0	0	2014	0	\N	\N
3454	196	6	84	0	0	0	2014	0	\N	\N
3460	197	3	7	7	0	0	2014	7	\N	\N
3461	197	4	7	7	0	0	2014	7	\N	\N
3462	197	5	5	5	0	0	2014	5	\N	\N
3464	197	7	7	7	0	0	2014	7	\N	\N
3465	197	8	5	5	0	0	2014	5	\N	\N
3466	197	9	0	0	0	0	2014	0	\N	\N
3463	197	6	84	0	0	0	2014	0	\N	\N
3467	198	1	5	5	0	0	2014	5	\N	\N
3469	198	3	7	7	0	0	2014	7	\N	\N
3470	198	4	7	7	0	0	2014	7	\N	\N
3471	198	5	5	5	0	0	2014	5	\N	\N
3473	198	7	7	7	0	0	2014	7	\N	\N
3474	198	8	5	5	0	0	2014	5	\N	\N
3475	198	9	0	0	0	0	2014	0	\N	\N
3472	198	6	84	0	0	0	2014	0	\N	\N
3476	199	1	5	5	0	0	2014	5	\N	\N
3477	199	2	15	15	0	0	2014	15	\N	\N
3478	199	3	7	7	0	0	2014	7	\N	\N
3479	199	4	7	7	0	0	2014	7	\N	\N
3480	199	5	5	5	0	0	2014	5	\N	\N
3482	199	7	7	7	0	0	2014	7	\N	\N
3483	199	8	5	5	0	0	2014	5	\N	\N
3484	199	9	0	0	0	0	2014	0	\N	\N
3481	199	6	84	0	0	0	2014	0	\N	\N
3487	200	3	7	7	0	0	2014	7	\N	\N
3488	200	4	7	7	0	0	2014	7	\N	\N
3489	200	5	5	5	0	0	2014	5	\N	\N
3491	200	7	7	7	0	0	2014	7	\N	\N
3493	200	9	0	0	0	0	2014	0	\N	\N
3490	200	6	84	0	0	0	2014	0	\N	\N
3494	201	1	5	5	0	0	2014	5	\N	\N
3496	201	3	7	7	0	0	2014	7	\N	\N
3497	201	4	7	7	0	0	2014	7	\N	\N
3498	201	5	5	5	0	0	2014	5	\N	\N
3499	201	6	84	84	0	0	2014	84	\N	\N
3501	201	8	5	5	0	0	2014	5	\N	\N
3502	201	9	0	0	0	0	2014	0	\N	\N
3500	201	7	7	0	0	0	2014	0	\N	\N
3503	202	1	5	5	0	0	2014	5	\N	\N
3505	202	3	7	7	0	0	2014	7	\N	\N
3506	202	4	7	7	0	0	2014	7	\N	\N
3507	202	5	5	5	0	0	2014	5	\N	\N
3509	202	7	7	7	0	0	2014	7	\N	\N
3510	202	8	5	5	0	0	2014	5	\N	\N
3511	202	9	0	0	0	0	2014	0	\N	\N
3508	202	6	84	0	0	0	2014	0	\N	\N
3513	203	2	15	15	0	0	2014	15	\N	\N
3514	203	3	7	7	0	0	2014	7	\N	\N
3515	203	4	7	7	0	0	2014	7	\N	\N
3516	203	5	5	5	0	0	2014	5	\N	\N
3518	203	7	7	7	0	0	2014	7	\N	\N
3519	203	8	5	5	0	0	2014	5	\N	\N
3520	203	9	0	0	0	0	2014	0	\N	\N
3517	203	6	84	0	0	0	2014	0	\N	\N
3458	197	1	5	4	1	0	2014	5	\N	\N
3459	197	2	15	10	5	0	2014	15	\N	\N
3521	204	1	5	5	0	0	2014	5	\N	\N
3522	204	2	15	15	0	0	2014	15	\N	\N
3523	204	3	7	7	0	0	2014	7	\N	\N
3524	204	4	7	7	0	0	2014	7	\N	\N
3525	204	5	5	5	0	0	2014	5	\N	\N
3527	204	7	7	7	0	0	2014	7	\N	\N
3528	204	8	5	5	0	0	2014	5	\N	\N
3529	204	9	0	0	0	0	2014	0	\N	\N
3526	204	6	84	0	0	0	2014	0	\N	\N
2963	143	1	5	0	5	0	2014	5	\N	\N
3530	205	1	5	5	0	0	2014	5	\N	\N
3531	205	2	15	15	0	0	2014	15	\N	\N
3532	205	3	7	7	0	0	2014	7	\N	\N
3533	205	4	7	7	0	0	2014	7	\N	\N
3534	205	5	5	5	0	0	2014	5	\N	\N
3495	201	2	15	9	6	0	2014	15	\N	\N
3468	198	2	15	13	2	0	2014	15	\N	\N
3492	200	8	5	3	2	0	2014	5	\N	\N
3504	202	2	15	15	0	0	2014	15	\N	\N
3512	203	1	5	3	2	0	2014	5	\N	\N
3485	200	1	5	4	1	0	2014	5	\N	\N
3486	200	2	15	13	2	0	2014	15	\N	2015-01-05 09:07:50.126004
3536	205	7	7	7	0	0	2014	7	\N	\N
3537	205	8	5	5	0	0	2014	5	\N	\N
3538	205	9	0	0	0	0	2014	0	\N	\N
3535	205	6	84	0	0	0	2014	0	\N	\N
3539	206	1	5	5	0	0	2014	5	\N	\N
3540	206	2	15	15	0	0	2014	15	\N	\N
3541	206	3	7	7	0	0	2014	7	\N	\N
3542	206	4	7	7	0	0	2014	7	\N	\N
3543	206	5	5	5	0	0	2014	5	\N	\N
3545	206	7	7	7	0	0	2014	7	\N	\N
3547	206	9	0	0	0	0	2014	0	\N	\N
3544	206	6	84	0	0	0	2014	0	\N	\N
39243	96	7	7	7	0	0	2017	7	2017-01-02 04:46:52.599631	2017-01-02 04:46:52.599631
3548	207	1	5	5	0	0	2014	5	\N	\N
3550	207	3	7	7	0	0	2014	7	\N	\N
3551	207	4	7	7	0	0	2014	7	\N	\N
3552	207	5	5	5	0	0	2014	5	\N	\N
3554	207	7	7	7	0	0	2014	7	\N	\N
3556	207	9	0	0	0	0	2014	0	\N	\N
3553	207	6	84	0	0	0	2014	0	\N	\N
3557	208	1	5	5	0	0	2014	5	\N	\N
3558	208	2	15	15	0	0	2014	15	\N	\N
3559	208	3	7	7	0	0	2014	7	\N	\N
3560	208	4	7	7	0	0	2014	7	\N	\N
3563	208	7	7	7	0	0	2014	7	\N	\N
3565	208	9	0	0	0	0	2014	0	\N	\N
3562	208	6	84	0	0	0	2014	0	\N	\N
3561	208	5	5	4	1	0	2014	5	\N	\N
3607	213	6	84	0	0	0	2014	0	\N	\N
3546	206	8	5	4	1	0	2014	5	\N	\N
3564	208	8	5	4	1	0	2014	5	\N	\N
3555	207	8	5	4	1	0	2014	5	\N	\N
2936	147	1	5	0	5	0	2014	5	\N	\N
3549	207	2	15	14	1	0	2014	15	\N	\N
3602	213	1	5	1	4	0	2014	5	\N	\N
3567	209	2	15	15	0	0	2014	15	\N	\N
3568	209	3	7	7	0	0	2014	7	\N	\N
3569	209	4	7	7	0	0	2014	7	\N	\N
3570	209	5	5	5	0	0	2014	5	\N	\N
3571	209	6	84	84	0	0	2014	84	\N	\N
3574	209	9	0	0	0	0	2014	0	\N	\N
3572	209	7	7	0	0	0	2014	0	\N	\N
2565	64	8	5	3	2	0	2014	5	\N	\N
3575	210	1	5	5	0	0	2014	5	\N	\N
3576	210	2	15	15	0	0	2014	15	\N	\N
3577	210	3	7	7	0	0	2014	7	\N	\N
3578	210	4	7	7	0	0	2014	7	\N	\N
3579	210	5	5	5	0	0	2014	5	\N	\N
3581	210	7	7	7	0	0	2014	7	\N	\N
3582	210	8	5	5	0	0	2014	5	\N	\N
3583	210	9	0	0	0	0	2014	0	\N	\N
3580	210	6	84	0	0	0	2014	0	\N	\N
3585	211	2	15	15	0	0	2014	15	\N	\N
3586	211	3	7	7	0	0	2014	7	\N	\N
3587	211	4	7	7	0	0	2014	7	\N	\N
3588	211	5	5	5	0	0	2014	5	\N	\N
3590	211	7	7	7	0	0	2014	7	\N	\N
3591	211	8	5	5	0	0	2014	5	\N	\N
3592	211	9	0	0	0	0	2014	0	\N	\N
3589	211	6	84	0	0	0	2014	0	\N	\N
3611	214	1	5	5	0	0	2014	5	\N	\N
2243	30	1	5	1	4	0	2014	5	\N	\N
3573	209	8	5	3	2	0	2014	5	\N	\N
3594	212	2	15	15	0	0	2014	15	\N	\N
3595	212	3	7	7	0	0	2014	7	\N	\N
3596	212	4	7	7	0	0	2014	7	\N	\N
3597	212	5	5	5	0	0	2014	5	\N	\N
3599	212	7	7	7	0	0	2014	7	\N	\N
3600	212	8	5	5	0	0	2014	5	\N	\N
3601	212	9	0	0	0	0	2014	0	\N	\N
3598	212	6	84	0	0	0	2014	0	\N	\N
3603	213	2	15	15	0	0	2014	15	\N	\N
3604	213	3	7	7	0	0	2014	7	\N	\N
3605	213	4	7	7	0	0	2014	7	\N	\N
3606	213	5	5	5	0	0	2014	5	\N	\N
3608	213	7	7	7	0	0	2014	7	\N	\N
3609	213	8	5	5	0	0	2014	5	\N	\N
3610	213	9	0	0	0	0	2014	0	\N	\N
3612	214	2	15	15	0	0	2014	15	\N	\N
3613	214	3	7	7	0	0	2014	7	\N	\N
3614	214	4	7	7	0	0	2014	7	\N	\N
3615	214	5	5	5	0	0	2014	5	\N	\N
3617	214	7	7	7	0	0	2014	7	\N	\N
3593	212	1	5	3	2	0	2014	5	\N	\N
3584	211	1	5	4	1	0	2014	5	\N	\N
3377	188	1	5	0	5	0	2014	5	\N	\N
3566	209	1	5	1	4	0	2014	5	\N	2015-01-05 09:07:33.628048
3618	214	8	5	5	0	0	2014	5	\N	\N
3619	214	9	0	0	0	0	2014	0	\N	\N
3616	214	6	84	0	0	0	2014	0	\N	\N
3634	40	6	84	0	0	0	2015	0	\N	\N
2616	99	5	5	0	5	0	2014	5	\N	\N
3620	215	1	5	5	0	0	2014	5	\N	\N
3621	215	2	15	15	0	0	2014	15	\N	\N
3622	215	3	7	7	0	0	2014	7	\N	\N
3623	215	4	7	7	0	0	2014	7	\N	\N
3624	215	5	5	5	0	0	2014	5	\N	\N
3626	215	7	7	7	0	0	2014	7	\N	\N
3627	215	8	5	5	0	0	2014	5	\N	\N
3628	215	9	0	0	0	0	2014	0	\N	\N
3625	215	6	84	0	0	0	2014	0	\N	\N
3633	40	5	5	1	4	0	2015	5	\N	2015-12-24 11:46:39.774548
3631	40	3	7	7	0	0	2015	7	\N	\N
3635	40	7	7	7	0	0	2015	7	\N	\N
3637	40	9	0	0	0	0	2015	0	\N	\N
3638	73	1	5	5	0	0	2015	5	\N	\N
3639	73	2	15	15	0	0	2015	15	\N	\N
3640	73	3	7	7	0	0	2015	7	\N	\N
3641	73	4	7	7	0	0	2015	7	\N	\N
3642	73	5	5	5	0	0	2015	5	\N	\N
3643	73	6	84	84	0	0	2015	84	\N	\N
3644	73	7	7	7	0	0	2015	7	\N	\N
3645	73	8	5	5	0	0	2015	5	\N	\N
3646	73	9	0	0	0	0	2015	0	\N	\N
3647	43	1	5	5	0	0	2015	5	\N	\N
3648	43	2	15	15	0	0	2015	15	\N	\N
3649	43	3	7	7	0	0	2015	7	\N	\N
3650	43	4	7	7	0	0	2015	7	\N	\N
3651	43	5	5	5	0	0	2015	5	\N	\N
3653	43	7	7	7	0	0	2015	7	\N	\N
3654	43	8	5	5	0	0	2015	5	\N	\N
3655	43	9	0	0	0	0	2015	0	\N	\N
3656	83	1	5	5	0	0	2015	5	\N	\N
3657	83	2	15	15	0	0	2015	15	\N	\N
3658	83	3	7	7	0	0	2015	7	\N	\N
3659	83	4	7	7	0	0	2015	7	\N	\N
3660	83	5	5	5	0	0	2015	5	\N	\N
3661	83	6	84	84	0	0	2015	84	\N	\N
3662	83	7	7	7	0	0	2015	7	\N	\N
3663	83	8	5	5	0	0	2015	5	\N	\N
3664	83	9	0	0	0	0	2015	0	\N	\N
3665	62	1	5	5	0	0	2015	5	\N	\N
3666	62	2	15	15	0	0	2015	15	\N	\N
3667	62	3	7	7	0	0	2015	7	\N	\N
3668	62	4	7	7	0	0	2015	7	\N	\N
3669	62	5	5	5	0	0	2015	5	\N	\N
3670	62	6	84	84	0	0	2015	84	\N	\N
3671	62	7	7	7	0	0	2015	7	\N	\N
3672	62	8	5	5	0	0	2015	5	\N	\N
3673	62	9	0	0	0	0	2015	0	\N	\N
3674	38	1	5	5	0	0	2015	5	\N	\N
3675	38	2	15	15	0	0	2015	15	\N	\N
3676	38	3	7	7	0	0	2015	7	\N	\N
3677	38	4	7	7	0	0	2015	7	\N	\N
3678	38	5	5	5	0	0	2015	5	\N	\N
3680	38	7	7	7	0	0	2015	7	\N	\N
3681	38	8	5	5	0	0	2015	5	\N	\N
3682	38	9	0	0	0	0	2015	0	\N	\N
3685	41	3	7	7	0	0	2015	7	\N	\N
3686	41	4	7	7	0	0	2015	7	\N	\N
3689	41	7	7	7	0	0	2015	7	\N	\N
3692	42	1	5	5	0	0	2015	5	\N	\N
3693	42	2	15	15	0	0	2015	15	\N	\N
3694	42	3	7	7	0	0	2015	7	\N	\N
3695	42	4	7	7	0	0	2015	7	\N	\N
3696	42	5	5	5	0	0	2015	5	\N	\N
3698	42	7	7	7	0	0	2015	7	\N	\N
3652	43	6	84	0	0	0	2015	0	\N	\N
3679	38	6	84	0	0	0	2015	0	\N	\N
3688	41	6	84	0	0	0	2015	0	\N	\N
3697	42	6	84	0	0	0	2015	0	\N	\N
3009	144	2	15	0	15	0	2014	15	\N	\N
3690	41	8	5	1	4	0	2015	5	\N	2015-10-27 05:31:51.319855
39244	96	8	5	5	0	0	2017	5	2017-01-02 04:46:52.60964	2017-01-02 04:46:52.60964
3632	40	4	7	6	1	0	2015	7	\N	2015-04-22 12:07:00.515191
3683	41	1	5	0	5	0	2015	5	\N	2015-08-26 10:03:17.579167
3629	40	1	5	2	3	0	2015	5	\N	2015-12-28 04:14:01.677511
3636	40	8	5	0	5	0	2015	5	\N	2015-11-13 07:20:56.016286
3691	41	9	1	0	1	0	2015	1	\N	2015-11-24 04:56:28.093641
3687	41	5	5	0	5	0	2015	5	\N	2015-12-17 05:37:01.984392
3684	41	2	15	2	13	0	2015	15	\N	2015-12-29 13:28:42.170925
3630	40	2	15	0	15	0	2015	15	\N	2015-12-24 11:43:20.622246
3699	42	8	5	5	0	0	2015	5	\N	\N
3700	42	9	0	0	0	0	2015	0	\N	\N
3701	53	1	5	5	0	0	2015	5	\N	\N
3702	53	2	15	15	0	0	2015	15	\N	\N
3703	53	3	7	7	0	0	2015	7	\N	\N
3704	53	4	7	7	0	0	2015	7	\N	\N
3705	53	5	5	5	0	0	2015	5	\N	\N
3706	53	6	84	84	0	0	2015	84	\N	\N
3708	53	8	5	5	0	0	2015	5	\N	\N
3709	53	9	0	0	0	0	2015	0	\N	\N
3712	33	3	7	7	0	0	2015	7	\N	\N
3713	33	4	7	7	0	0	2015	7	\N	\N
39245	96	9	0	0	0	0	2017	0	2017-01-02 04:46:52.619655	2017-01-02 04:46:52.619655
3716	33	7	7	7	0	0	2015	7	\N	\N
3718	33	9	0	0	0	0	2015	0	\N	\N
3722	71	4	7	7	0	0	2015	7	\N	\N
3728	10	1	5	5	0	0	2015	5	\N	\N
3729	10	2	15	15	0	0	2015	15	\N	\N
3730	10	3	7	7	0	0	2015	7	\N	\N
3731	10	4	7	7	0	0	2015	7	\N	\N
3732	10	5	5	5	0	0	2015	5	\N	\N
3734	10	7	7	7	0	0	2015	7	\N	\N
3735	10	8	5	5	0	0	2015	5	\N	\N
3736	10	9	0	0	0	0	2015	0	\N	\N
3737	75	1	5	5	0	0	2015	5	\N	\N
3738	75	2	15	15	0	0	2015	15	\N	\N
3739	75	3	7	7	0	0	2015	7	\N	\N
3740	75	4	7	7	0	0	2015	7	\N	\N
3741	75	5	5	5	0	0	2015	5	\N	\N
3743	75	7	7	7	0	0	2015	7	\N	\N
3744	75	8	5	5	0	0	2015	5	\N	\N
3745	75	9	0	0	0	0	2015	0	\N	\N
3748	70	3	7	7	0	0	2015	7	\N	\N
3754	70	9	0	0	0	0	2015	0	\N	\N
3757	48	3	7	7	0	0	2015	7	\N	\N
3758	48	4	7	7	0	0	2015	7	\N	\N
3759	48	5	5	5	0	0	2015	5	\N	\N
3761	48	7	7	7	0	0	2015	7	\N	\N
3767	44	4	7	7	0	0	2015	7	\N	\N
3770	44	7	7	7	0	0	2015	7	\N	\N
3772	44	9	0	0	0	0	2015	0	\N	\N
3773	81	1	5	5	0	0	2015	5	\N	\N
3774	81	2	15	15	0	0	2015	15	\N	\N
3775	81	3	7	7	0	0	2015	7	\N	\N
3776	81	4	7	7	0	0	2015	7	\N	\N
3777	81	5	5	5	0	0	2015	5	\N	\N
3778	81	6	84	84	0	0	2015	84	\N	\N
3780	81	8	5	5	0	0	2015	5	\N	\N
3781	81	9	0	0	0	0	2015	0	\N	\N
3782	47	1	5	5	0	0	2015	5	\N	\N
3783	47	2	15	15	0	0	2015	15	\N	\N
3784	47	3	7	7	0	0	2015	7	\N	\N
3785	47	4	7	7	0	0	2015	7	\N	\N
3786	47	5	5	5	0	0	2015	5	\N	\N
3724	71	6	84	0	0	0	2015	0	\N	\N
3733	10	6	84	0	0	0	2015	0	\N	\N
3742	75	6	84	0	0	0	2015	0	\N	\N
3760	48	6	84	0	0	0	2015	0	\N	\N
3769	44	6	84	0	0	0	2015	0	\N	\N
3707	53	7	7	0	0	0	2015	0	\N	\N
3752	70	7	7	0	0	0	2015	0	\N	\N
3779	81	7	7	0	0	0	2015	0	\N	\N
3771	44	8	5	4	1	0	2015	5	\N	2015-04-09 13:45:59.317597
3766	44	3	7	5	2	0	2015	7	\N	2015-01-29 08:28:40.678141
3723	71	5	5	2.5	2.5	0	2015	5	\N	2015-12-28 09:03:28.956387
3753	70	8	5	3	2	0	2015	5	\N	2015-04-07 06:38:12.685806
3768	44	5	5	4	1	0	2015	5	\N	2015-04-14 06:57:45.37504
3721	71	3	7	6	1	0	2015	7	\N	2015-01-20 12:32:23.421677
3714	33	5	5	4	1	0	2015	5	\N	2015-11-30 10:40:15.767758
3750	70	5	5	0	5	0	2015	5	\N	2015-09-09 08:44:03.302211
3756	48	2	15	3	12	0	2015	15	\N	2015-12-24 10:28:03.005154
3719	71	1	5	0	5	0	2015	5	\N	2015-11-18 05:59:17.334788
3755	48	1	5	2	3	0	2015	5	\N	2015-10-16 06:19:36.450585
3765	44	2	15	10	5	0	2015	15	\N	2015-04-09 13:47:00.286555
3726	71	8	5	0	5	0	2015	5	\N	2015-11-18 05:58:36.661048
3751	70	6	84	24	60	0	2015	84	\N	2015-09-10 09:46:59.87482
3710	33	1	5	0	5	0	2015	5	\N	2015-08-12 12:56:10.696446
3746	70	1	5	0	5	0	2015	5	\N	2015-09-09 08:46:02.036437
3711	33	2	15	1	14	0	2015	15	\N	2015-10-20 15:35:50.847826
3720	71	2	15	0	15	0	2015	15	\N	2015-12-07 12:29:17.280617
3762	48	8	5	3	2	0	2015	5	\N	2015-12-24 10:27:17.762981
3763	48	9	4	0	4	0	2015	4	\N	2015-11-12 06:42:58.019262
3725	71	7	7	0	7	0	2015	7	\N	2015-12-07 12:24:23.233404
39246	82	1	5	5	0	0	2017	5	2017-01-02 04:46:52.629539	2017-01-02 04:46:52.629539
3788	47	7	7	7	0	0	2015	7	\N	\N
3789	47	8	5	5	0	0	2015	5	\N	\N
3790	47	9	0	0	0	0	2015	0	\N	\N
3791	55	1	5	5	0	0	2015	5	\N	\N
3792	55	2	15	15	0	0	2015	15	\N	\N
3793	55	3	7	7	0	0	2015	7	\N	\N
3794	55	4	7	7	0	0	2015	7	\N	\N
3795	55	5	5	5	0	0	2015	5	\N	\N
3797	55	7	7	7	0	0	2015	7	\N	\N
3798	55	8	5	5	0	0	2015	5	\N	\N
3799	55	9	0	0	0	0	2015	0	\N	\N
3802	91	3	7	7	0	0	2015	7	\N	\N
3803	91	4	7	7	0	0	2015	7	\N	\N
3806	91	7	7	7	0	0	2015	7	\N	\N
3809	57	1	5	5	0	0	2015	5	\N	\N
3810	57	2	15	15	0	0	2015	15	\N	\N
3811	57	3	7	7	0	0	2015	7	\N	\N
3812	57	4	7	7	0	0	2015	7	\N	\N
3813	57	5	5	5	0	0	2015	5	\N	\N
3815	57	7	7	7	0	0	2015	7	\N	\N
3816	57	8	5	5	0	0	2015	5	\N	\N
3817	57	9	0	0	0	0	2015	0	\N	\N
3820	77	3	7	7	0	0	2015	7	\N	\N
3821	77	4	7	7	0	0	2015	7	\N	\N
3824	77	7	7	7	0	0	2015	7	\N	\N
3826	77	9	0	0	0	0	2015	0	\N	\N
3829	54	3	7	7	0	0	2015	7	\N	\N
3830	54	4	7	7	0	0	2015	7	\N	\N
3832	54	6	84	84	0	0	2015	84	\N	\N
3835	54	9	0	0	0	0	2015	0	\N	\N
3836	67	1	5	5	0	0	2015	5	\N	\N
3837	67	2	15	15	0	0	2015	15	\N	\N
3838	67	3	7	7	0	0	2015	7	\N	\N
3839	67	4	7	7	0	0	2015	7	\N	\N
3840	67	5	5	5	0	0	2015	5	\N	\N
3842	67	7	7	7	0	0	2015	7	\N	\N
3843	67	8	5	5	0	0	2015	5	\N	\N
3844	67	9	0	0	0	0	2015	0	\N	\N
3847	94	3	7	7	0	0	2015	7	\N	\N
3848	94	4	7	7	0	0	2015	7	\N	\N
3851	94	7	7	7	0	0	2015	7	\N	\N
3853	94	9	0	0	0	0	2015	0	\N	\N
3854	2	1	5	5	0	0	2015	5	\N	\N
3855	2	2	15	15	0	0	2015	15	\N	\N
3856	2	3	7	7	0	0	2015	7	\N	\N
3857	2	4	7	7	0	0	2015	7	\N	\N
3858	2	5	5	5	0	0	2015	5	\N	\N
3859	2	6	84	84	0	0	2015	84	\N	\N
3860	2	7	7	7	0	0	2015	7	\N	\N
3861	2	8	5	5	0	0	2015	5	\N	\N
3862	2	9	0	0	0	0	2015	0	\N	\N
3865	45	3	7	7	0	0	2015	7	\N	\N
3866	45	4	7	7	0	0	2015	7	\N	\N
3869	45	7	7	7	0	0	2015	7	\N	\N
3871	45	9	0	0	0	0	2015	0	\N	\N
3872	76	1	5	5	0	0	2015	5	\N	\N
3873	76	2	15	15	0	0	2015	15	\N	\N
3874	76	3	7	7	0	0	2015	7	\N	\N
3796	55	6	84	0	0	0	2015	0	\N	\N
3805	91	6	84	0	0	0	2015	0	\N	\N
3814	57	6	84	0	0	0	2015	0	\N	\N
3823	77	6	84	0	0	0	2015	0	\N	\N
3841	67	6	84	0	0	0	2015	0	\N	\N
3850	94	6	84	0	0	0	2015	0	\N	\N
3868	45	6	84	0	0	0	2015	0	\N	\N
3833	54	7	7	0	0	0	2015	0	\N	\N
3849	94	5	5	0	5	0	2015	5	\N	2015-12-29 11:46:18.49697
3834	54	8	5	3	2	0	2015	5	\N	2015-03-11 04:59:54.958616
3831	54	5	5	2	3	0	2015	5	\N	2015-09-04 07:34:03.318276
3825	77	8	5	0	5	0	2015	5	\N	2015-11-30 04:51:43.878788
3828	54	2	15	0	15	0	2015	15	\N	2015-08-06 04:59:05.640925
3867	45	5	5	0	5	0	2015	5	\N	2015-07-27 10:23:53.881745
3870	45	8	5	3	2	0	2015	5	\N	2015-10-27 13:39:02.152782
3845	94	1	5	0	5	0	2015	5	\N	2015-09-03 05:04:04.010507
3818	77	1	5	0	5	0	2015	5	\N	2015-11-30 04:54:46.093677
3808	91	9	2	0	2	0	2015	2	\N	2015-11-26 05:41:32.984815
3807	91	8	5	2	3	0	2015	5	\N	2015-11-09 05:47:16.175214
3819	77	2	15	0	15	0	2015	15	\N	2015-10-16 05:18:15.627459
3827	54	1	5	2	3	0	2015	5	\N	2015-10-06 05:55:30.552821
3804	91	5	5	1	4	0	2015	5	\N	2015-12-31 10:22:46.774812
3863	45	1	5	0	5	0	2015	5	\N	2015-07-27 10:08:05.936949
3800	91	1	5	2	3	0	2015	5	\N	2015-08-03 06:25:10.413395
3852	94	8	5	0	5	0	2015	5	\N	2015-11-10 09:13:09.150008
3875	76	4	7	7	0	0	2015	7	\N	\N
3876	76	5	5	5	0	0	2015	5	\N	\N
3878	76	7	7	7	0	0	2015	7	\N	\N
3879	76	8	5	5	0	0	2015	5	\N	\N
3880	76	9	0	0	0	0	2015	0	\N	\N
3881	34	1	5	5	0	0	2015	5	\N	\N
3882	34	2	15	15	0	0	2015	15	\N	\N
3883	34	3	7	7	0	0	2015	7	\N	\N
3884	34	4	7	7	0	0	2015	7	\N	\N
3885	34	5	5	5	0	0	2015	5	\N	\N
3887	34	7	7	7	0	0	2015	7	\N	\N
3888	34	8	5	5	0	0	2015	5	\N	\N
3889	34	9	0	0	0	0	2015	0	\N	\N
3890	36	1	5	5	0	0	2015	5	\N	\N
3891	36	2	15	15	0	0	2015	15	\N	\N
3892	36	3	7	7	0	0	2015	7	\N	\N
3893	36	4	7	7	0	0	2015	7	\N	\N
3894	36	5	5	5	0	0	2015	5	\N	\N
3896	36	7	7	7	0	0	2015	7	\N	\N
3897	36	8	5	5	0	0	2015	5	\N	\N
3898	36	9	0	0	0	0	2015	0	\N	\N
3901	30	3	7	7	0	0	2015	7	\N	\N
3902	30	4	7	7	0	0	2015	7	\N	\N
3905	30	7	7	7	0	0	2015	7	\N	\N
3911	60	4	7	7	0	0	2015	7	\N	\N
3914	60	7	7	7	0	0	2015	7	\N	\N
3916	60	9	0	0	0	0	2015	0	\N	\N
3917	50	1	5	5	0	0	2015	5	\N	\N
3918	50	2	15	15	0	0	2015	15	\N	\N
3919	50	3	7	7	0	0	2015	7	\N	\N
3920	50	4	7	7	0	0	2015	7	\N	\N
3921	50	5	5	5	0	0	2015	5	\N	\N
3923	50	7	7	7	0	0	2015	7	\N	\N
3924	50	8	5	5	0	0	2015	5	\N	\N
3925	50	9	0	0	0	0	2015	0	\N	\N
3929	72	4	7	7	0	0	2015	7	\N	\N
3932	72	7	7	7	0	0	2015	7	\N	\N
3935	32	1	5	5	0	0	2015	5	\N	\N
3936	32	2	15	15	0	0	2015	15	\N	\N
3937	32	3	7	7	0	0	2015	7	\N	\N
3938	32	4	7	7	0	0	2015	7	\N	\N
3939	32	5	5	5	0	0	2015	5	\N	\N
3941	32	7	7	7	0	0	2015	7	\N	\N
3942	32	8	5	5	0	0	2015	5	\N	\N
3943	32	9	0	0	0	0	2015	0	\N	\N
3944	97	1	5	5	0	0	2015	5	\N	\N
3945	97	2	15	15	0	0	2015	15	\N	\N
3946	97	3	7	7	0	0	2015	7	\N	\N
3947	97	4	7	7	0	0	2015	7	\N	\N
3948	97	5	5	5	0	0	2015	5	\N	\N
3949	97	6	84	84	0	0	2015	84	\N	\N
3951	97	8	5	5	0	0	2015	5	\N	\N
3952	97	9	0	0	0	0	2015	0	\N	\N
3953	96	1	5	5	0	0	2015	5	\N	\N
3954	96	2	15	15	0	0	2015	15	\N	\N
3955	96	3	7	7	0	0	2015	7	\N	\N
3956	96	4	7	7	0	0	2015	7	\N	\N
3957	96	5	5	5	0	0	2015	5	\N	\N
3959	96	7	7	7	0	0	2015	7	\N	\N
3960	96	8	5	5	0	0	2015	5	\N	\N
3961	96	9	0	0	0	0	2015	0	\N	\N
3962	82	1	5	5	0	0	2015	5	\N	\N
3886	34	6	84	0	0	0	2015	0	\N	\N
3895	36	6	84	0	0	0	2015	0	\N	\N
3904	30	6	84	0	0	0	2015	0	\N	\N
3913	60	6	84	0	0	0	2015	0	\N	\N
3922	50	6	84	0	0	0	2015	0	\N	\N
3931	72	6	84	0	0	0	2015	0	\N	\N
3940	32	6	84	0	0	0	2015	0	\N	\N
3958	96	6	84	0	0	0	2015	0	\N	\N
3950	97	7	7	0	0	0	2015	0	\N	\N
3906	30	8	5	3	2	0	2015	5	\N	2015-03-31 15:55:40.729531
3899	30	1	5	0	5	0	2015	5	\N	2015-09-29 05:19:53.02855
3927	72	2	15	0	15	0	2015	15	\N	2015-08-15 11:32:52.812823
3910	60	3	7	0	7	0	2015	7	\N	2015-08-14 05:24:56.937192
3912	60	5	5	0	5	0	2015	5	\N	2015-08-14 05:26:52.366709
3903	30	5	5	4.5	0.5	0	2015	5	\N	2015-08-27 08:19:16.383112
3908	60	1	5	0	5	0	2015	5	\N	2015-06-04 05:43:29.314293
3915	60	8	5	2	3	0	2015	5	\N	2015-10-20 13:12:34.177215
3928	72	3	7	6	1	0	2015	7	\N	2015-11-24 09:13:29.009159
3934	72	9	1	0	1	0	2015	1	\N	2015-07-28 11:54:03.5025
3909	60	2	15	0	15	0	2015	15	\N	2015-05-21 04:33:34.71154
3926	72	1	5	0	5	0	2015	5	\N	2015-10-26 07:25:23.471886
3930	72	5	5	0	5	0	2015	5	\N	2015-11-18 05:50:16.95735
3963	82	2	15	15	0	0	2015	15	\N	\N
3964	82	3	7	7	0	0	2015	7	\N	\N
3965	82	4	7	7	0	0	2015	7	\N	\N
3966	82	5	5	5	0	0	2015	5	\N	\N
39247	82	2	15	15	0	0	2017	15	2017-01-02 04:46:52.639603	2017-01-02 04:46:52.639603
3968	82	7	7	7	0	0	2015	7	\N	\N
3969	82	8	5	5	0	0	2015	5	\N	\N
3970	82	9	0	0	0	0	2015	0	\N	\N
3971	74	1	5	5	0	0	2015	5	\N	\N
3972	74	2	15	15	0	0	2015	15	\N	\N
3973	74	3	7	7	0	0	2015	7	\N	\N
3974	74	4	7	7	0	0	2015	7	\N	\N
3975	74	5	5	5	0	0	2015	5	\N	\N
3977	74	7	7	7	0	0	2015	7	\N	\N
3978	74	8	5	5	0	0	2015	5	\N	\N
3979	74	9	0	0	0	0	2015	0	\N	\N
3983	51	4	7	7	0	0	2015	7	\N	\N
3985	51	6	84	84	0	0	2015	84	\N	\N
3988	51	9	0	0	0	0	2015	0	\N	\N
3991	87	3	7	7	0	0	2015	7	\N	\N
3992	87	4	7	7	0	0	2015	7	\N	\N
3995	87	7	7	7	0	0	2015	7	\N	\N
3998	68	1	5	5	0	0	2015	5	\N	\N
3999	68	2	15	15	0	0	2015	15	\N	\N
4000	68	3	7	7	0	0	2015	7	\N	\N
4001	68	4	7	7	0	0	2015	7	\N	\N
4002	68	5	5	5	0	0	2015	5	\N	\N
4004	68	7	7	7	0	0	2015	7	\N	\N
4005	68	8	5	5	0	0	2015	5	\N	\N
4006	68	9	0	0	0	0	2015	0	\N	\N
4009	95	3	7	7	0	0	2015	7	\N	\N
4010	95	4	7	7	0	0	2015	7	\N	\N
4013	95	7	7	7	0	0	2015	7	\N	\N
4016	46	1	5	5	0	0	2015	5	\N	\N
4017	46	2	15	15	0	0	2015	15	\N	\N
4018	46	3	7	7	0	0	2015	7	\N	\N
4019	46	4	7	7	0	0	2015	7	\N	\N
4020	46	5	5	5	0	0	2015	5	\N	\N
4022	46	7	7	7	0	0	2015	7	\N	\N
4023	46	8	5	5	0	0	2015	5	\N	\N
4024	46	9	0	0	0	0	2015	0	\N	\N
4025	28	1	5	5	0	0	2015	5	\N	\N
4026	28	2	15	15	0	0	2015	15	\N	\N
4027	28	3	7	7	0	0	2015	7	\N	\N
4028	28	4	7	7	0	0	2015	7	\N	\N
4029	28	5	5	5	0	0	2015	5	\N	\N
4031	28	7	7	7	0	0	2015	7	\N	\N
4032	28	8	5	5	0	0	2015	5	\N	\N
4033	28	9	0	0	0	0	2015	0	\N	\N
4036	90	3	7	7	0	0	2015	7	\N	\N
4037	90	4	7	7	0	0	2015	7	\N	\N
4040	90	7	7	7	0	0	2015	7	\N	\N
4042	90	9	0	0	0	0	2015	0	\N	\N
4043	106	1	5	5	0	0	2015	5	\N	\N
4044	106	2	15	15	0	0	2015	15	\N	\N
4045	106	3	7	7	0	0	2015	7	\N	\N
4046	106	4	7	7	0	0	2015	7	\N	\N
4047	106	5	5	5	0	0	2015	5	\N	\N
4048	106	6	84	84	0	0	2015	84	\N	\N
4050	106	8	5	5	0	0	2015	5	\N	\N
3976	74	6	84	0	0	0	2015	0	\N	\N
3994	87	6	84	0	0	0	2015	0	\N	\N
4003	68	6	84	0	0	0	2015	0	\N	\N
4012	95	6	84	0	0	0	2015	0	\N	\N
4021	46	6	84	0	0	0	2015	0	\N	\N
4030	28	6	84	0	0	0	2015	0	\N	\N
4039	90	6	84	0	0	0	2015	0	\N	\N
3986	51	7	7	0	0	0	2015	0	\N	\N
4049	106	7	7	0	0	0	2015	0	\N	\N
3996	87	8	5	3	2	0	2015	5	\N	2015-04-01 11:30:11.007961
4038	90	5	5	4	1	0	2015	5	\N	2015-11-18 12:17:49.771208
4014	95	8	5	0	5	0	2015	5	\N	2015-12-30 13:03:32.339702
4015	95	9	2	0	2	0	2015	2	\N	2015-07-01 12:44:00.768709
4035	90	2	15	1	14	0	2015	15	\N	2015-12-28 04:05:25.943343
3993	87	5	5	3	2	0	2015	5	\N	2015-04-25 03:55:30.924699
3982	51	3	7	5	2	0	2015	7	\N	2015-08-25 12:35:55.987942
3989	87	1	5	4	1	0	2015	5	\N	2015-05-26 04:52:56.230539
3987	51	8	5	0	5	0	2015	5	\N	2015-12-22 13:11:07.302438
3980	51	1	5	0	5	0	2015	5	\N	2015-12-07 05:40:59.020364
4011	95	5	5	0.5	4.5	0	2015	5	\N	2015-12-22 14:21:12.738128
4041	90	8	5	3	2	0	2015	5	\N	2015-11-10 13:39:13.064767
3981	51	2	15	0	15	0	2015	15	\N	2015-12-22 13:10:50.84788
3997	87	9	5	3	2	0	2015	5	\N	2015-06-03 04:49:09.902073
4034	90	1	5	0	5	0	2015	5	\N	2015-12-01 05:41:34.999726
4051	106	9	0	0	0	0	2015	0	\N	\N
4052	100	1	5	5	0	0	2015	5	\N	\N
4053	100	2	15	15	0	0	2015	15	\N	\N
4054	100	3	7	7	0	0	2015	7	\N	\N
4055	100	4	7	7	0	0	2015	7	\N	\N
4056	100	5	5	5	0	0	2015	5	\N	\N
39248	82	3	7	7	0	0	2017	7	2017-01-02 04:46:52.649581	2017-01-02 04:46:52.649581
4058	100	7	7	7	0	0	2015	7	\N	\N
4059	100	8	5	5	0	0	2015	5	\N	\N
4060	100	9	0	0	0	0	2015	0	\N	\N
4061	79	1	5	5	0	0	2015	5	\N	\N
4062	79	2	15	15	0	0	2015	15	\N	\N
4063	79	3	7	7	0	0	2015	7	\N	\N
4064	79	4	7	7	0	0	2015	7	\N	\N
4065	79	5	5	5	0	0	2015	5	\N	\N
4067	79	7	7	7	0	0	2015	7	\N	\N
4068	79	8	5	5	0	0	2015	5	\N	\N
4069	79	9	0	0	0	0	2015	0	\N	\N
4070	85	1	5	5	0	0	2015	5	\N	\N
4071	85	2	15	15	0	0	2015	15	\N	\N
4072	85	3	7	7	0	0	2015	7	\N	\N
4073	85	4	7	7	0	0	2015	7	\N	\N
4074	85	5	5	5	0	0	2015	5	\N	\N
4075	85	6	84	84	0	0	2015	84	\N	\N
4077	85	8	5	5	0	0	2015	5	\N	\N
4078	85	9	0	0	0	0	2015	0	\N	\N
4082	31	4	7	7	0	0	2015	7	\N	\N
4085	31	7	7	7	0	0	2015	7	\N	\N
4087	31	9	0	0	0	0	2015	0	\N	\N
4088	103	1	5	5	0	0	2015	5	\N	\N
4089	103	2	15	15	0	0	2015	15	\N	\N
4090	103	3	7	7	0	0	2015	7	\N	\N
4091	103	4	7	7	0	0	2015	7	\N	\N
4092	103	5	5	5	0	0	2015	5	\N	\N
4094	103	7	7	7	0	0	2015	7	\N	\N
4095	103	8	5	5	0	0	2015	5	\N	\N
4096	103	9	0	0	0	0	2015	0	\N	\N
4097	64	1	5	5	0	0	2015	5	\N	\N
4099	64	3	7	7	0	0	2015	7	\N	\N
4100	64	4	7	7	0	0	2015	7	\N	\N
4103	64	7	7	7	0	0	2015	7	\N	\N
4105	64	9	0	0	0	0	2015	0	\N	\N
4106	56	1	5	5	0	0	2015	5	\N	\N
4107	56	2	15	15	0	0	2015	15	\N	\N
4108	56	3	7	7	0	0	2015	7	\N	\N
4109	56	4	7	7	0	0	2015	7	\N	\N
4110	56	5	5	5	0	0	2015	5	\N	\N
4112	56	7	7	7	0	0	2015	7	\N	\N
4113	56	8	5	5	0	0	2015	5	\N	\N
4114	56	9	0	0	0	0	2015	0	\N	\N
4115	37	1	5	5	0	0	2015	5	\N	\N
4116	37	2	15	15	0	0	2015	15	\N	\N
4117	37	3	7	7	0	0	2015	7	\N	\N
4118	37	4	7	7	0	0	2015	7	\N	\N
4119	37	5	5	5	0	0	2015	5	\N	\N
4121	37	7	7	7	0	0	2015	7	\N	\N
4122	37	8	5	5	0	0	2015	5	\N	\N
4123	37	9	0	0	0	0	2015	0	\N	\N
4124	104	1	5	5	0	0	2015	5	\N	\N
4125	104	2	15	15	0	0	2015	15	\N	\N
4126	104	3	7	7	0	0	2015	7	\N	\N
4127	104	4	7	7	0	0	2015	7	\N	\N
4128	104	5	5	5	0	0	2015	5	\N	\N
4130	104	7	7	7	0	0	2015	7	\N	\N
4131	104	8	5	5	0	0	2015	5	\N	\N
4132	104	9	0	0	0	0	2015	0	\N	\N
4136	98	4	7	7	0	0	2015	7	\N	\N
4138	98	6	84	84	0	0	2015	84	\N	\N
4066	79	6	84	0	0	0	2015	0	\N	\N
4084	31	6	84	0	0	0	2015	0	\N	\N
4093	103	6	84	0	0	0	2015	0	\N	\N
4102	64	6	84	0	0	0	2015	0	\N	\N
4111	56	6	84	0	0	0	2015	0	\N	\N
4120	37	6	84	0	0	0	2015	0	\N	\N
4129	104	6	84	0	0	0	2015	0	\N	\N
4076	85	7	7	0	0	0	2015	0	\N	\N
4081	31	3	7	1	6	0	2015	7	\N	2015-11-16 05:33:19.169553
4137	98	5	5	0	5	0	2015	5	\N	2015-12-09 07:04:14.251965
4101	64	5	5	4	1	0	2015	5	\N	2015-08-20 07:31:48.191179
4135	98	3	7	2	5	0	2015	7	\N	2015-09-28 05:46:36.028409
4083	31	5	5	0	5	0	2015	5	\N	2015-12-03 13:59:04.722036
4086	31	8	5	0	5	0	2015	5	\N	2015-12-23 13:28:54.219889
4133	98	1	5	0	5	0	2015	5	\N	2015-11-09 06:14:44.6156
4134	98	2	15	0	15	0	2015	15	\N	2015-12-09 07:09:47.465831
4098	64	2	15	2	13	0	2015	15	\N	2015-11-04 05:56:44.170933
4141	98	9	0	0	0	0	2015	0	\N	\N
4145	101	4	7	7	0	0	2015	7	\N	\N
39249	82	4	7	7	0	0	2017	7	2017-01-02 04:46:52.659626	2017-01-02 04:46:52.659626
4148	101	7	7	7	0	0	2015	7	\N	\N
4150	101	9	0	0	0	0	2015	0	\N	\N
4151	89	1	5	5	0	0	2015	5	\N	\N
4152	89	2	15	15	0	0	2015	15	\N	\N
4153	89	3	7	7	0	0	2015	7	\N	\N
4154	89	4	7	7	0	0	2015	7	\N	\N
4155	89	5	5	5	0	0	2015	5	\N	\N
4157	89	7	7	7	0	0	2015	7	\N	\N
4158	89	8	5	5	0	0	2015	5	\N	\N
4159	89	9	0	0	0	0	2015	0	\N	\N
4160	49	1	5	5	0	0	2015	5	\N	\N
4162	49	3	7	7	0	0	2015	7	\N	\N
4163	49	4	7	7	0	0	2015	7	\N	\N
4166	49	7	7	7	0	0	2015	7	\N	\N
4168	49	9	0	0	0	0	2015	0	\N	\N
4171	29	3	7	7	0	0	2015	7	\N	\N
4172	29	4	7	7	0	0	2015	7	\N	\N
4173	29	5	5	5	0	0	2015	5	\N	\N
4175	29	7	7	7	0	0	2015	7	\N	\N
4177	29	9	0	0	0	0	2015	0	\N	\N
4180	80	3	7	7	0	0	2015	7	\N	\N
4181	80	4	7	7	0	0	2015	7	\N	\N
4190	102	4	7	7	0	0	2015	7	\N	\N
4193	102	7	7	7	0	0	2015	7	\N	\N
4198	52	3	7	7	0	0	2015	7	\N	\N
4199	52	4	7	7	0	0	2015	7	\N	\N
4201	52	6	84	84	0	0	2015	84	\N	\N
4205	136	1	5	5	0	0	2015	5	\N	\N
4206	136	2	15	15	0	0	2015	15	\N	\N
4207	136	3	7	7	0	0	2015	7	\N	\N
4208	136	4	7	7	0	0	2015	7	\N	\N
4209	136	5	5	5	0	0	2015	5	\N	\N
4211	136	7	7	7	0	0	2015	7	\N	\N
4212	136	8	5	5	0	0	2015	5	\N	\N
4213	136	9	0	0	0	0	2015	0	\N	\N
4217	63	4	7	7	0	0	2015	7	\N	\N
4220	63	7	7	7	0	0	2015	7	\N	\N
4222	63	9	0	0	0	0	2015	0	\N	\N
4223	35	1	5	5	0	0	2015	5	\N	\N
4224	35	2	15	15	0	0	2015	15	\N	\N
4225	35	3	7	7	0	0	2015	7	\N	\N
4226	35	4	7	7	0	0	2015	7	\N	\N
4156	89	6	84	0	0	0	2015	0	\N	\N
4165	49	6	84	0	0	0	2015	0	\N	\N
4174	29	6	84	0	0	0	2015	0	\N	\N
4183	80	6	84	0	0	0	2015	0	\N	\N
4192	102	6	84	0	0	0	2015	0	\N	\N
4210	136	6	84	0	0	0	2015	0	\N	\N
4219	63	6	84	0	0	0	2015	0	\N	\N
4139	98	7	7	0	0	0	2015	0	\N	\N
4202	52	7	7	0	0	0	2015	0	\N	\N
4140	98	8	5	3	2	0	2015	5	\N	2015-12-09 07:09:11.44343
4143	101	2	15	1	14	0	2015	15	\N	2015-11-30 04:48:06.702009
4149	101	8	5	3	2	0	2015	5	\N	2015-09-23 12:54:59.872688
4194	102	8	5	1	4	0	2015	5	\N	2015-10-26 07:38:07.82977
4170	29	2	15	4	11	0	2015	15	\N	2015-07-06 15:12:07.768917
4197	52	2	15	0	15	0	2015	15	\N	2015-03-30 07:03:52.232496
4218	63	5	5	0	5	0	2015	5	\N	2015-12-21 10:56:29.130833
4221	63	8	5	0	5	0	2015	5	\N	2015-12-30 08:25:00.592107
4144	101	3	7	3	4	0	2015	7	\N	2015-11-20 05:09:58.235712
4142	101	1	5	3	2	0	2015	5	\N	2015-09-29 05:14:41.083578
4200	52	5	5	0	5	0	2015	5	\N	2015-05-26 12:33:00.470609
4189	102	3	7	6	1	0	2015	7	\N	2015-08-04 05:35:14.20771
4179	80	2	15	4	11	0	2015	15	\N	2015-06-01 11:53:10.451608
4187	102	1	5	0	5	0	2015	5	\N	2015-12-01 05:21:13.721244
4161	49	2	15	0	15	0	2015	15	\N	2015-12-17 13:56:06.859314
4178	80	1	5	2	3	0	2015	5	\N	2015-08-13 05:13:02.469987
4184	80	7	7	0	7	0	2015	7	\N	2015-03-19 13:36:34.906514
4176	29	8	5	4	1	0	2015	5	\N	2015-03-30 13:33:37.937087
4214	63	1	5	0	5	0	2015	5	\N	2015-08-11 11:14:13.969996
4167	49	8	5	3	2	0	2015	5	\N	2015-12-17 13:56:38.511636
4195	102	9	2	0	2	0	2015	2	\N	2015-10-26 06:16:18.167747
4185	80	8	5	3	2	0	2015	5	\N	2015-09-16 12:05:21.678338
4169	29	1	5	3	2	0	2015	5	\N	2015-08-24 05:09:47.814216
4182	80	5	5	1.5	3.5	0	2015	5	\N	2015-09-24 05:12:20.556947
4204	52	9	1	0	1	0	2015	1	\N	2015-08-26 13:06:24.941304
4164	49	5	5	2	3	0	2015	5	\N	2015-08-27 13:07:22.236366
4216	63	3	7	5	2	0	2015	7	\N	2015-11-23 11:00:31.659497
4227	35	5	5	5	0	0	2015	5	\N	\N
39250	82	5	5	5	0	0	2017	5	2017-01-02 04:46:52.669637	2017-01-02 04:46:52.669637
4229	35	7	7	7	0	0	2015	7	\N	\N
4230	35	8	5	5	0	0	2015	5	\N	\N
4231	35	9	0	0	0	0	2015	0	\N	\N
4232	127	1	5	5	0	0	2015	5	\N	\N
4233	127	2	15	15	0	0	2015	15	\N	\N
4234	127	3	7	7	0	0	2015	7	\N	\N
4235	127	4	7	7	0	0	2015	7	\N	\N
4236	127	5	5	5	0	0	2015	5	\N	\N
4238	127	7	7	7	0	0	2015	7	\N	\N
4239	127	8	5	5	0	0	2015	5	\N	\N
4240	127	9	0	0	0	0	2015	0	\N	\N
4241	123	1	5	5	0	0	2015	5	\N	\N
4242	123	2	15	15	0	0	2015	15	\N	\N
4243	123	3	7	7	0	0	2015	7	\N	\N
4244	123	4	7	7	0	0	2015	7	\N	\N
4245	123	5	5	5	0	0	2015	5	\N	\N
4246	123	6	84	84	0	0	2015	84	\N	\N
4248	123	8	5	5	0	0	2015	5	\N	\N
4249	123	9	0	0	0	0	2015	0	\N	\N
4250	128	1	5	5	0	0	2015	5	\N	\N
4252	128	3	7	7	0	0	2015	7	\N	\N
4253	128	4	7	7	0	0	2015	7	\N	\N
4255	128	6	84	84	0	0	2015	84	\N	\N
4258	128	9	0	0	0	0	2015	0	\N	\N
4259	111	1	5	5	0	0	2015	5	\N	\N
4261	111	3	7	7	0	0	2015	7	\N	\N
4262	111	4	7	7	0	0	2015	7	\N	\N
4263	111	5	5	5	0	0	2015	5	\N	\N
4265	111	7	7	7	0	0	2015	7	\N	\N
4266	111	8	5	5	0	0	2015	5	\N	\N
4267	111	9	0	0	0	0	2015	0	\N	\N
4268	121	1	5	5	0	0	2015	5	\N	\N
4269	121	2	15	15	0	0	2015	15	\N	\N
4270	121	3	7	7	0	0	2015	7	\N	\N
4271	121	4	7	7	0	0	2015	7	\N	\N
4272	121	5	5	5	0	0	2015	5	\N	\N
4273	121	6	84	84	0	0	2015	84	\N	\N
4274	121	7	7	7	0	0	2015	7	\N	\N
4275	121	8	5	5	0	0	2015	5	\N	\N
4276	121	9	0	0	0	0	2015	0	\N	\N
4277	116	1	5	5	0	0	2015	5	\N	\N
4278	116	2	15	15	0	0	2015	15	\N	\N
4279	116	3	7	7	0	0	2015	7	\N	\N
4280	116	4	7	7	0	0	2015	7	\N	\N
4281	116	5	5	5	0	0	2015	5	\N	\N
4283	116	7	7	7	0	0	2015	7	\N	\N
4284	116	8	5	5	0	0	2015	5	\N	\N
4285	116	9	0	0	0	0	2015	0	\N	\N
4286	129	1	5	5	0	0	2015	5	\N	\N
4287	129	2	15	15	0	0	2015	15	\N	\N
4288	129	3	7	7	0	0	2015	7	\N	\N
4289	129	4	7	7	0	0	2015	7	\N	\N
4290	129	5	5	5	0	0	2015	5	\N	\N
4292	129	7	7	7	0	0	2015	7	\N	\N
4293	129	8	5	5	0	0	2015	5	\N	\N
4294	129	9	0	0	0	0	2015	0	\N	\N
4297	118	3	7	7	0	0	2015	7	\N	\N
4298	118	4	7	7	0	0	2015	7	\N	\N
4301	118	7	7	7	0	0	2015	7	\N	\N
4303	118	9	0	0	0	0	2015	0	\N	\N
4304	119	1	5	5	0	0	2015	5	\N	\N
4305	119	2	15	15	0	0	2015	15	\N	\N
4306	119	3	7	7	0	0	2015	7	\N	\N
4307	119	4	7	7	0	0	2015	7	\N	\N
4308	119	5	5	5	0	0	2015	5	\N	\N
4310	119	7	7	7	0	0	2015	7	\N	\N
4311	119	8	5	5	0	0	2015	5	\N	\N
4312	119	9	0	0	0	0	2015	0	\N	\N
4237	127	6	84	0	0	0	2015	0	\N	\N
4264	111	6	84	0	0	0	2015	0	\N	\N
4282	116	6	84	0	0	0	2015	0	\N	\N
4291	129	6	84	0	0	0	2015	0	\N	\N
4300	118	6	84	0	0	0	2015	0	\N	\N
4309	119	6	84	0	0	0	2015	0	\N	\N
4247	123	7	7	0	0	0	2015	0	\N	\N
4256	128	7	7	0	0	0	2015	0	\N	\N
4260	111	2	15	14	1	0	2015	15	\N	2015-01-13 04:16:47.056097
4257	128	8	5	4	1	0	2015	5	\N	2015-01-13 12:02:22.816496
4302	118	8	5	3	2	0	2015	5	\N	2015-09-21 07:32:18.652728
4299	118	5	5	0.5	4.5	0	2015	5	\N	2015-09-21 07:33:08.517693
4296	118	2	15	0	15	0	2015	15	\N	2015-03-23 10:25:28.004491
4314	134	2	15	0	15	0	2015	15	\N	2015-12-14 12:36:36.470102
4295	118	1	5	4	1	0	2015	5	\N	2015-06-03 05:32:19.156391
4313	134	1	5	0	5	0	2015	5	\N	2015-12-13 14:26:05.656931
4315	134	3	7	7	0	0	2015	7	\N	\N
4316	134	4	7	7	0	0	2015	7	\N	\N
4319	134	7	7	7	0	0	2015	7	\N	\N
4321	134	9	0	0	0	0	2015	0	\N	\N
4322	112	1	5	5	0	0	2015	5	\N	\N
4323	112	2	15	15	0	0	2015	15	\N	\N
4324	112	3	7	7	0	0	2015	7	\N	\N
4325	112	4	7	7	0	0	2015	7	\N	\N
4326	112	5	5	5	0	0	2015	5	\N	\N
4327	112	6	84	84	0	0	2015	84	\N	\N
4328	112	7	7	7	0	0	2015	7	\N	\N
4329	112	8	5	5	0	0	2015	5	\N	\N
4330	112	9	0	0	0	0	2015	0	\N	\N
4331	78	1	5	5	0	0	2015	5	\N	\N
4332	78	2	15	15	0	0	2015	15	\N	\N
4333	78	3	7	7	0	0	2015	7	\N	\N
4334	78	4	7	7	0	0	2015	7	\N	\N
4335	78	5	5	5	0	0	2015	5	\N	\N
4336	78	6	84	84	0	0	2015	84	\N	\N
4338	78	8	5	5	0	0	2015	5	\N	\N
4339	78	9	0	0	0	0	2015	0	\N	\N
4340	132	1	5	5	0	0	2015	5	\N	\N
4341	132	2	15	15	0	0	2015	15	\N	\N
4342	132	3	7	7	0	0	2015	7	\N	\N
4343	132	4	7	7	0	0	2015	7	\N	\N
4344	132	5	5	5	0	0	2015	5	\N	\N
4346	132	7	7	7	0	0	2015	7	\N	\N
4347	132	8	5	5	0	0	2015	5	\N	\N
4348	132	9	0	0	0	0	2015	0	\N	\N
4352	117	4	7	7	0	0	2015	7	\N	\N
4354	117	6	84	84	0	0	2015	84	\N	\N
4357	117	9	0	0	0	0	2015	0	\N	\N
4360	109	3	7	7	0	0	2015	7	\N	\N
4361	109	4	7	7	0	0	2015	7	\N	\N
4363	109	6	84	84	0	0	2015	84	\N	\N
4366	109	9	0	0	0	0	2015	0	\N	\N
4367	130	1	5	5	0	0	2015	5	\N	\N
4368	130	2	15	15	0	0	2015	15	\N	\N
4369	130	3	7	7	0	0	2015	7	\N	\N
4370	130	4	7	7	0	0	2015	7	\N	\N
4371	130	5	5	5	0	0	2015	5	\N	\N
4373	130	7	7	7	0	0	2015	7	\N	\N
4374	130	8	5	5	0	0	2015	5	\N	\N
4375	130	9	0	0	0	0	2015	0	\N	\N
4376	137	1	5	5	0	0	2015	5	\N	\N
4377	137	2	15	15	0	0	2015	15	\N	\N
4378	137	3	7	7	0	0	2015	7	\N	\N
4379	137	4	7	7	0	0	2015	7	\N	\N
4380	137	5	5	5	0	0	2015	5	\N	\N
4381	137	6	84	84	0	0	2015	84	\N	\N
4382	137	7	7	7	0	0	2015	7	\N	\N
4383	137	8	5	5	0	0	2015	5	\N	\N
4384	137	9	0	0	0	0	2015	0	\N	\N
4387	140	3	7	7	0	0	2015	7	\N	\N
4388	140	4	7	7	0	0	2015	7	\N	\N
4390	140	6	84	84	0	0	2015	84	\N	\N
4393	140	9	0	0	0	0	2015	0	\N	\N
4394	110	1	5	5	0	0	2015	5	\N	\N
4395	110	2	15	15	0	0	2015	15	\N	\N
4396	110	3	7	7	0	0	2015	7	\N	\N
4397	110	4	7	7	0	0	2015	7	\N	\N
4398	110	5	5	5	0	0	2015	5	\N	\N
4399	110	6	84	84	0	0	2015	84	\N	\N
4401	110	8	5	5	0	0	2015	5	\N	\N
4402	110	9	0	0	0	0	2015	0	\N	\N
4345	132	6	84	0	0	0	2015	0	\N	\N
4372	130	6	84	0	0	0	2015	0	\N	\N
4337	78	7	7	0	0	0	2015	0	\N	\N
4355	117	7	7	0	0	0	2015	0	\N	\N
4364	109	7	7	0	0	0	2015	0	\N	\N
4391	140	7	7	0	0	0	2015	0	\N	\N
4400	110	7	7	0	0	0	2015	0	\N	\N
4385	140	1	5	0	5	0	2015	5	\N	2015-12-22 06:19:00.102773
4362	109	5	5	0	5	0	2015	5	\N	2015-11-23 06:57:57.79714
4389	140	5	5	0	5	0	2015	5	\N	2015-12-11 07:20:11.433664
4350	117	2	15	0	15	0	2015	15	\N	2015-11-06 09:43:45.585462
4386	140	2	15	0	15	0	2015	15	\N	2015-12-11 07:20:45.907918
4356	117	8	5	0	5	0	2015	5	\N	2015-09-10 09:58:28.028632
4358	109	1	5	0	5	0	2015	5	\N	2015-11-23 06:57:04.014918
4320	134	8	5	2	3	0	2015	5	\N	2015-12-14 12:37:28.731468
4351	117	3	7	2	5	0	2015	7	\N	2015-12-15 07:38:24.66812
4365	109	8	5	0	5	0	2015	5	\N	2015-08-26 05:18:24.445996
4349	117	1	5	0	5	0	2015	5	\N	2015-05-15 04:41:50.908734
4353	117	5	5	0	5	0	2015	5	\N	2015-12-22 07:33:29.91601
4403	122	1	5	5	0	0	2015	5	\N	\N
4404	122	2	15	15	0	0	2015	15	\N	\N
4405	122	3	7	7	0	0	2015	7	\N	\N
4406	122	4	7	7	0	0	2015	7	\N	\N
4407	122	5	5	5	0	0	2015	5	\N	\N
4408	122	6	84	84	0	0	2015	84	\N	\N
4409	122	7	7	7	0	0	2015	7	\N	\N
4410	122	8	5	5	0	0	2015	5	\N	\N
4411	122	9	0	0	0	0	2015	0	\N	\N
4412	114	1	5	5	0	0	2015	5	\N	\N
4413	114	2	15	15	0	0	2015	15	\N	\N
4414	114	3	7	7	0	0	2015	7	\N	\N
4415	114	4	7	7	0	0	2015	7	\N	\N
4416	114	5	5	5	0	0	2015	5	\N	\N
39252	82	7	7	7	0	0	2017	7	2017-01-02 04:46:52.689824	2017-01-02 04:46:52.689824
4418	114	7	7	7	0	0	2015	7	\N	\N
4419	114	8	5	5	0	0	2015	5	\N	\N
4420	114	9	0	0	0	0	2015	0	\N	\N
4421	138	1	5	5	0	0	2015	5	\N	\N
4422	138	2	15	15	0	0	2015	15	\N	\N
4423	138	3	7	7	0	0	2015	7	\N	\N
4424	138	4	7	7	0	0	2015	7	\N	\N
4425	138	5	5	5	0	0	2015	5	\N	\N
4426	138	6	84	84	0	0	2015	84	\N	\N
4428	138	8	5	5	0	0	2015	5	\N	\N
4429	138	9	0	0	0	0	2015	0	\N	\N
4432	133	3	7	7	0	0	2015	7	\N	\N
4433	133	4	7	7	0	0	2015	7	\N	\N
4436	133	7	7	7	0	0	2015	7	\N	\N
4438	133	9	0	0	0	0	2015	0	\N	\N
4439	120	1	5	5	0	0	2015	5	\N	\N
4440	120	2	15	15	0	0	2015	15	\N	\N
4441	120	3	7	7	0	0	2015	7	\N	\N
4442	120	4	7	7	0	0	2015	7	\N	\N
4443	120	5	5	5	0	0	2015	5	\N	\N
4445	120	7	7	7	0	0	2015	7	\N	\N
4446	120	8	5	5	0	0	2015	5	\N	\N
4447	120	9	0	0	0	0	2015	0	\N	\N
4448	125	1	5	5	0	0	2015	5	\N	\N
4449	125	2	15	15	0	0	2015	15	\N	\N
4450	125	3	7	7	0	0	2015	7	\N	\N
4451	125	4	7	7	0	0	2015	7	\N	\N
4452	125	5	5	5	0	0	2015	5	\N	\N
4454	125	7	7	7	0	0	2015	7	\N	\N
4455	125	8	5	5	0	0	2015	5	\N	\N
4456	125	9	0	0	0	0	2015	0	\N	\N
4457	113	1	5	5	0	0	2015	5	\N	\N
4458	113	2	15	15	0	0	2015	15	\N	\N
4459	113	3	7	7	0	0	2015	7	\N	\N
4460	113	4	7	7	0	0	2015	7	\N	\N
4461	113	5	5	5	0	0	2015	5	\N	\N
4463	113	7	7	7	0	0	2015	7	\N	\N
4464	113	8	5	5	0	0	2015	5	\N	\N
4465	113	9	0	0	0	0	2015	0	\N	\N
4466	108	1	5	5	0	0	2015	5	\N	\N
4467	108	2	15	15	0	0	2015	15	\N	\N
4468	108	3	7	7	0	0	2015	7	\N	\N
4469	108	4	7	7	0	0	2015	7	\N	\N
4470	108	5	5	5	0	0	2015	5	\N	\N
4471	108	6	84	84	0	0	2015	84	\N	\N
4473	108	8	5	5	0	0	2015	5	\N	\N
4474	108	9	0	0	0	0	2015	0	\N	\N
4475	135	1	5	5	0	0	2015	5	\N	\N
4477	135	3	7	7	0	0	2015	7	\N	\N
4478	135	4	7	7	0	0	2015	7	\N	\N
4479	135	5	5	5	0	0	2015	5	\N	\N
4481	135	7	7	7	0	0	2015	7	\N	\N
4482	135	8	5	5	0	0	2015	5	\N	\N
4483	135	9	0	0	0	0	2015	0	\N	\N
4484	166	1	5	5	0	0	2015	5	\N	\N
4485	166	2	15	15	0	0	2015	15	\N	\N
4486	166	3	7	7	0	0	2015	7	\N	\N
4487	166	4	7	7	0	0	2015	7	\N	\N
4488	166	5	5	5	0	0	2015	5	\N	\N
4489	166	6	84	84	0	0	2015	84	\N	\N
4490	166	7	7	7	0	0	2015	7	\N	\N
4435	133	6	84	0	0	0	2015	0	\N	\N
4444	120	6	84	0	0	0	2015	0	\N	\N
4453	125	6	84	0	0	0	2015	0	\N	\N
4462	113	6	84	0	0	0	2015	0	\N	\N
4480	135	6	84	0	0	0	2015	0	\N	\N
4427	138	7	7	0	0	0	2015	0	\N	\N
4472	108	7	7	0	0	0	2015	0	\N	\N
4476	135	2	15	13	2	0	2015	15	\N	2015-05-06 08:49:29.262804
4434	133	5	5	2.5	2.5	0	2015	5	\N	2015-12-29 13:39:09.202539
4437	133	8	5	4	1	0	2015	5	\N	2015-12-29 13:38:14.703241
4431	133	2	15	1	14	0	2015	15	\N	2015-12-29 13:38:42.929749
4491	166	8	5	5	0	0	2015	5	\N	\N
4492	166	9	0	0	0	0	2015	0	\N	\N
4493	161	1	5	5	0	0	2015	5	\N	\N
4494	161	2	15	15	0	0	2015	15	\N	\N
4495	161	3	7	7	0	0	2015	7	\N	\N
4496	161	4	7	7	0	0	2015	7	\N	\N
4497	161	5	5	5	0	0	2015	5	\N	\N
4499	161	7	7	7	0	0	2015	7	\N	\N
4500	161	8	5	5	0	0	2015	5	\N	\N
4501	161	9	0	0	0	0	2015	0	\N	\N
4502	58	1	5	5	0	0	2015	5	\N	\N
4503	58	2	15	15	0	0	2015	15	\N	\N
4504	58	3	7	7	0	0	2015	7	\N	\N
4505	58	4	7	7	0	0	2015	7	\N	\N
4506	58	5	5	5	0	0	2015	5	\N	\N
4508	58	7	7	7	0	0	2015	7	\N	\N
4509	58	8	5	5	0	0	2015	5	\N	\N
4510	58	9	0	0	0	0	2015	0	\N	\N
4511	105	1	5	5	0	0	2015	5	\N	\N
4512	105	2	15	15	0	0	2015	15	\N	\N
4513	105	3	7	7	0	0	2015	7	\N	\N
4514	105	4	7	7	0	0	2015	7	\N	\N
4515	105	5	5	5	0	0	2015	5	\N	\N
4517	105	7	7	7	0	0	2015	7	\N	\N
4518	105	8	5	5	0	0	2015	5	\N	\N
4519	105	9	0	0	0	0	2015	0	\N	\N
4520	172	1	5	5	0	0	2015	5	\N	\N
4521	172	2	15	15	0	0	2015	15	\N	\N
4522	172	3	7	7	0	0	2015	7	\N	\N
4523	172	4	7	7	0	0	2015	7	\N	\N
4524	172	5	5	5	0	0	2015	5	\N	\N
4526	172	7	7	7	0	0	2015	7	\N	\N
4527	172	8	5	5	0	0	2015	5	\N	\N
4528	172	9	0	0	0	0	2015	0	\N	\N
4531	144	3	7	7	0	0	2015	7	\N	\N
4532	144	4	7	7	0	0	2015	7	\N	\N
4535	144	7	7	7	0	0	2015	7	\N	\N
4537	144	9	0	0	0	0	2015	0	\N	\N
4538	141	1	5	5	0	0	2015	5	\N	\N
4539	141	2	15	15	0	0	2015	15	\N	\N
4540	141	3	7	7	0	0	2015	7	\N	\N
4541	141	4	7	7	0	0	2015	7	\N	\N
4542	141	5	5	5	0	0	2015	5	\N	\N
4543	141	6	84	84	0	0	2015	84	\N	\N
4544	141	7	7	7	0	0	2015	7	\N	\N
4545	141	8	5	5	0	0	2015	5	\N	\N
4546	141	9	0	0	0	0	2015	0	\N	\N
4549	131	3	7	7	0	0	2015	7	\N	\N
4550	131	4	7	7	0	0	2015	7	\N	\N
4552	131	6	84	84	0	0	2015	84	\N	\N
4556	154	1	5	5	0	0	2015	5	\N	\N
4557	154	2	15	15	0	0	2015	15	\N	\N
4558	154	3	7	7	0	0	2015	7	\N	\N
4559	154	4	7	7	0	0	2015	7	\N	\N
4560	154	5	5	5	0	0	2015	5	\N	\N
4562	154	7	7	7	0	0	2015	7	\N	\N
4563	154	8	5	5	0	0	2015	5	\N	\N
4564	154	9	0	0	0	0	2015	0	\N	\N
4568	162	4	7	7	0	0	2015	7	\N	\N
4571	162	7	7	7	0	0	2015	7	\N	\N
4573	162	9	0	0	0	0	2015	0	\N	\N
4576	59	3	7	7	0	0	2015	7	\N	\N
4577	59	4	7	7	0	0	2015	7	\N	\N
4507	58	6	84	0	0	0	2015	0	\N	\N
4516	105	6	84	0	0	0	2015	0	\N	\N
4525	172	6	84	0	0	0	2015	0	\N	\N
4534	144	6	84	0	0	0	2015	0	\N	\N
4561	154	6	84	0	0	0	2015	0	\N	\N
4570	162	6	84	0	0	0	2015	0	\N	\N
4553	131	7	7	0	0	0	2015	0	\N	\N
4567	162	3	7	0	7	0	2015	7	\N	2015-03-23 04:49:01.663045
4551	131	5	5	0	5	0	2015	5	\N	2015-12-24 13:36:03.913255
4547	131	1	5	0	5	0	2015	5	\N	2015-11-06 12:52:19.906982
4533	144	5	5	1	4	0	2015	5	\N	2015-08-12 05:38:26.802822
4529	144	1	5	2	3	0	2015	5	\N	2015-08-24 04:38:43.451943
4569	162	5	5	3.5	1.5	0	2015	5	\N	2015-05-07 07:08:54.688275
4536	144	8	5	2	3	0	2015	5	\N	2015-02-16 11:07:54.958601
4565	162	1	5	1	4	0	2015	5	\N	2015-05-12 04:46:59.733702
4575	59	2	15	7	8	0	2015	15	\N	2015-06-19 11:38:23.370789
4578	59	5	5	3	2	0	2015	5	\N	2015-05-26 13:02:55.190753
4548	131	2	15	0	15	0	2015	15	\N	2015-12-01 09:05:55.656147
4566	162	2	15	0	15	0	2015	15	\N	2015-03-23 04:51:14.6535
4574	59	1	5	1	4	0	2015	5	\N	2015-08-05 04:57:21.339864
4555	131	9	2	0	2	0	2015	2	\N	2015-12-21 12:23:50.268373
39253	82	8	5	5	0	0	2017	5	2017-01-02 04:46:52.699851	2017-01-02 04:46:52.699851
4580	59	7	7	7	0	0	2015	7	\N	\N
4585	145	3	7	7	0	0	2015	7	\N	\N
4586	145	4	7	7	0	0	2015	7	\N	\N
4589	145	7	7	7	0	0	2015	7	\N	\N
4591	145	9	0	0	0	0	2015	0	\N	\N
4594	143	3	7	7	0	0	2015	7	\N	\N
4595	143	4	7	7	0	0	2015	7	\N	\N
4598	143	7	7	7	0	0	2015	7	\N	\N
4601	156	1	5	5	0	0	2015	5	\N	\N
4602	156	2	15	15	0	0	2015	15	\N	\N
4603	156	3	7	7	0	0	2015	7	\N	\N
4604	156	4	7	7	0	0	2015	7	\N	\N
4605	156	5	5	5	0	0	2015	5	\N	\N
4607	156	7	7	7	0	0	2015	7	\N	\N
4608	156	8	5	5	0	0	2015	5	\N	\N
4609	156	9	0	0	0	0	2015	0	\N	\N
4610	157	1	5	5	0	0	2015	5	\N	\N
4611	157	2	15	15	0	0	2015	15	\N	\N
4612	157	3	7	7	0	0	2015	7	\N	\N
4613	157	4	7	7	0	0	2015	7	\N	\N
4614	157	5	5	5	0	0	2015	5	\N	\N
4616	157	7	7	7	0	0	2015	7	\N	\N
4617	157	8	5	5	0	0	2015	5	\N	\N
4618	157	9	0	0	0	0	2015	0	\N	\N
4621	171	3	7	7	0	0	2015	7	\N	\N
4622	171	4	7	7	0	0	2015	7	\N	\N
4625	171	7	7	7	0	0	2015	7	\N	\N
4628	150	1	5	5	0	0	2015	5	\N	\N
4629	150	2	15	15	0	0	2015	15	\N	\N
4630	150	3	7	7	0	0	2015	7	\N	\N
4631	150	4	7	7	0	0	2015	7	\N	\N
4632	150	5	5	5	0	0	2015	5	\N	\N
4633	150	6	84	84	0	0	2015	84	\N	\N
4634	150	7	7	7	0	0	2015	7	\N	\N
4635	150	8	5	5	0	0	2015	5	\N	\N
4636	150	9	0	0	0	0	2015	0	\N	\N
4639	142	3	7	7	0	0	2015	7	\N	\N
4640	142	4	7	7	0	0	2015	7	\N	\N
4643	142	7	7	7	0	0	2015	7	\N	\N
4649	151	4	7	7	0	0	2015	7	\N	\N
4651	151	6	84	84	0	0	2015	84	\N	\N
4654	151	9	0	0	0	0	2015	0	\N	\N
4658	158	4	7	7	0	0	2015	7	\N	\N
4659	158	5	5	5	0	0	2015	5	\N	\N
4661	158	7	7	7	0	0	2015	7	\N	\N
4663	158	9	0	0	0	0	2015	0	\N	\N
4664	149	1	5	5	0	0	2015	5	\N	\N
4665	149	2	15	15	0	0	2015	15	\N	\N
4666	149	3	7	7	0	0	2015	7	\N	\N
4588	145	6	84	0	0	0	2015	0	\N	\N
4597	143	6	84	0	0	0	2015	0	\N	\N
4606	156	6	84	0	0	0	2015	0	\N	\N
4615	157	6	84	0	0	0	2015	0	\N	\N
4624	171	6	84	0	0	0	2015	0	\N	\N
4642	142	6	84	0	0	0	2015	0	\N	\N
4660	158	6	84	0	0	0	2015	0	\N	\N
4652	151	7	7	0	0	0	2015	0	\N	\N
4581	59	8	5	4	1	0	2015	5	\N	2015-09-07 14:02:19.118236
4638	142	2	15	0	15	0	2015	15	\N	2015-11-09 14:16:50.26314
4619	171	1	5	0	5	0	2015	5	\N	2015-11-25 05:04:22.977549
4662	158	8	5	4	1	0	2015	5	\N	2015-02-19 05:22:24.372716
4590	145	8	5	4	1	0	2015	5	\N	2015-03-05 10:08:26.319748
4648	151	3	7	0	7	0	2015	7	\N	2015-04-07 07:16:25.016812
4620	171	2	15	2	13	0	2015	15	\N	2015-12-24 13:02:34.419147
4592	143	1	5	0	5	0	2015	5	\N	2015-10-13 07:01:01.446874
4596	143	5	5	0	5	0	2015	5	\N	2015-12-29 12:32:32.007621
4582	59	9	2	1	1	0	2015	2	\N	2015-06-30 06:11:51.747042
4646	151	1	5	2	3	0	2015	5	\N	2015-12-17 09:11:57.361236
4645	142	9	3	0	3	0	2015	3	\N	2015-08-31 04:47:09.718715
4657	158	3	7	4	3	0	2015	7	\N	2015-02-19 04:57:12.891383
4584	145	2	15	0	15	0	2015	15	\N	2015-05-28 05:17:53.090087
4637	142	1	5	1	4	0	2015	5	\N	2015-12-07 04:21:47.887329
4626	171	8	5	1	4	0	2015	5	\N	2015-11-10 13:35:52.672238
4655	158	1	5	4	1	0	2015	5	\N	2015-07-10 03:33:38.306923
4600	143	9	1	0	1	0	2015	1	\N	2015-02-24 05:25:16.219664
4650	151	5	5	0.5	4.5	0	2015	5	\N	2015-12-17 09:12:27.239097
4583	145	1	5	0	5	0	2015	5	\N	2015-03-26 08:46:43.975805
4644	142	8	5	0	5	0	2015	5	\N	2015-12-30 12:40:14.528859
4599	143	8	5	0	5	0	2015	5	\N	2015-12-29 12:35:10.14137
4587	145	5	5	1	4	0	2015	5	\N	2015-07-12 16:16:37.24094
4623	171	5	5	2.5	2.5	0	2015	5	\N	2015-10-12 09:00:33.234116
4667	149	4	7	7	0	0	2015	7	\N	\N
4668	149	5	5	5	0	0	2015	5	\N	\N
39254	82	9	0	0	0	0	2017	0	2017-01-02 04:46:52.709854	2017-01-02 04:46:52.709854
4670	149	7	7	7	0	0	2015	7	\N	\N
4671	149	8	5	5	0	0	2015	5	\N	\N
4672	149	9	0	0	0	0	2015	0	\N	\N
4675	165	3	7	7	0	0	2015	7	\N	\N
4676	165	4	7	7	0	0	2015	7	\N	\N
4679	165	7	7	7	0	0	2015	7	\N	\N
4681	165	9	0	0	0	0	2015	0	\N	\N
4684	163	3	7	7	0	0	2015	7	\N	\N
4685	163	4	7	7	0	0	2015	7	\N	\N
4688	163	7	7	7	0	0	2015	7	\N	\N
4690	163	9	0	0	0	0	2015	0	\N	\N
4691	139	1	5	5	0	0	2015	5	\N	\N
4692	139	2	15	15	0	0	2015	15	\N	\N
4693	139	3	7	7	0	0	2015	7	\N	\N
4694	139	4	7	7	0	0	2015	7	\N	\N
4695	139	5	5	5	0	0	2015	5	\N	\N
4696	139	6	84	84	0	0	2015	84	\N	\N
4698	139	8	5	5	0	0	2015	5	\N	\N
4699	139	9	0	0	0	0	2015	0	\N	\N
4700	147	1	5	5	0	0	2015	5	\N	\N
4703	147	4	7	7	0	0	2015	7	\N	\N
4705	147	6	84	84	0	0	2015	84	\N	\N
4707	147	8	5	5	0	0	2015	5	\N	\N
4708	147	9	0	0	0	0	2015	0	\N	\N
4709	146	1	5	5	0	0	2015	5	\N	\N
4710	146	2	15	15	0	0	2015	15	\N	\N
4711	146	3	7	7	0	0	2015	7	\N	\N
4712	146	4	7	7	0	0	2015	7	\N	\N
4713	146	5	5	5	0	0	2015	5	\N	\N
4714	146	6	84	84	0	0	2015	84	\N	\N
4716	146	8	5	5	0	0	2015	5	\N	\N
4717	146	9	0	0	0	0	2015	0	\N	\N
4720	168	3	7	7	0	0	2015	7	\N	\N
4721	168	4	7	7	0	0	2015	7	\N	\N
4723	168	6	84	84	0	0	2015	84	\N	\N
4726	168	9	0	0	0	0	2015	0	\N	\N
4730	169	4	7	7	0	0	2015	7	\N	\N
4733	169	7	7	7	0	0	2015	7	\N	\N
4735	169	9	0	0	0	0	2015	0	\N	\N
4738	155	3	7	7	0	0	2015	7	\N	\N
4739	155	4	7	7	0	0	2015	7	\N	\N
4742	155	7	7	7	0	0	2015	7	\N	\N
4744	155	9	0	0	0	0	2015	0	\N	\N
4745	164	1	5	5	0	0	2015	5	\N	\N
4746	164	2	15	15	0	0	2015	15	\N	\N
4747	164	3	7	7	0	0	2015	7	\N	\N
4748	164	4	7	7	0	0	2015	7	\N	\N
4749	164	5	5	5	0	0	2015	5	\N	\N
4751	164	7	7	7	0	0	2015	7	\N	\N
4752	164	8	5	5	0	0	2015	5	\N	\N
4753	164	9	0	0	0	0	2015	0	\N	\N
4678	165	6	84	0	0	0	2015	0	\N	\N
4687	163	6	84	0	0	0	2015	0	\N	\N
4732	169	6	84	0	0	0	2015	0	\N	\N
4741	155	6	84	0	0	0	2015	0	\N	\N
4750	164	6	84	0	0	0	2015	0	\N	\N
4697	139	7	7	0	0	0	2015	0	\N	\N
4706	147	7	7	0	0	0	2015	0	\N	\N
4715	146	7	7	0	0	0	2015	0	\N	\N
4724	168	7	7	0	0	0	2015	0	\N	\N
4704	147	5	5	4.5	0.5	0	2015	5	\N	2015-01-21 06:33:42.307965
4677	165	5	5	4	1	0	2015	5	\N	2015-05-29 05:06:37.272834
4686	163	5	5	0	5	0	2015	5	\N	2015-12-22 03:56:20.101113
4725	168	8	5	3	2	0	2015	5	\N	2015-12-24 12:54:32.468864
4682	163	1	5	0	5	0	2015	5	\N	2015-03-09 08:57:49.495486
4729	169	3	7	5	2	0	2015	7	\N	2015-11-05 07:27:12.251114
4673	165	1	5	2	3	0	2015	5	\N	2015-06-05 07:53:35.875497
4722	168	5	5	0	5	0	2015	5	\N	2015-05-18 05:08:58.281155
4737	155	2	15	0	15	0	2015	15	\N	2015-10-05 05:48:34.495278
4731	169	5	5	2.5	2.5	0	2015	5	\N	2015-12-07 09:23:48.713452
4701	147	2	15	5	10	0	2015	15	\N	2015-02-16 04:17:46.193067
4702	147	3	7	0	7	0	2015	7	\N	2015-02-16 04:16:53.463197
4674	165	2	15	3	12	0	2015	15	\N	2015-10-20 06:09:42.047422
4719	168	2	15	0	15	0	2015	15	\N	2015-12-15 12:09:21.963439
4727	169	1	5	2	3	0	2015	5	\N	2015-03-05 07:49:29.13888
4740	155	5	5	0	5	0	2015	5	\N	2015-10-05 05:51:17.236348
4680	165	8	5	1	4	0	2015	5	\N	2015-10-20 06:09:01.011872
4743	155	8	5	0	5	0	2015	5	\N	2015-10-23 08:50:11.127835
4736	155	1	5	0	5	0	2015	5	\N	2015-10-05 05:41:49.16388
4718	168	1	5	0	5	0	2015	5	\N	2015-11-16 05:18:42.613632
4756	160	3	7	7	0	0	2015	7	\N	\N
4757	160	4	7	7	0	0	2015	7	\N	\N
4760	160	7	7	7	0	0	2015	7	\N	\N
4766	159	4	7	7	0	0	2015	7	\N	\N
4769	159	7	7	7	0	0	2015	7	\N	\N
4770	159	8	5	5	0	0	2015	5	\N	\N
4771	159	9	0	0	0	0	2015	0	\N	\N
4772	174	1	5	5	0	0	2015	5	\N	\N
4773	174	2	15	15	0	0	2015	15	\N	\N
4774	174	3	7	7	0	0	2015	7	\N	\N
4775	174	4	7	7	0	0	2015	7	\N	\N
4776	174	5	5	5	0	0	2015	5	\N	\N
4777	174	6	84	84	0	0	2015	84	\N	\N
4778	174	7	7	7	0	0	2015	7	\N	\N
4779	174	8	5	5	0	0	2015	5	\N	\N
4780	174	9	0	0	0	0	2015	0	\N	\N
4781	148	1	5	5	0	0	2015	5	\N	\N
4782	148	2	15	15	0	0	2015	15	\N	\N
4783	148	3	7	7	0	0	2015	7	\N	\N
4784	148	4	7	7	0	0	2015	7	\N	\N
4785	148	5	5	5	0	0	2015	5	\N	\N
4786	148	6	84	84	0	0	2015	84	\N	\N
4787	148	7	7	7	0	0	2015	7	\N	\N
4788	148	8	5	5	0	0	2015	5	\N	\N
4789	148	9	0	0	0	0	2015	0	\N	\N
4790	173	1	5	5	0	0	2015	5	\N	\N
4791	173	2	15	15	0	0	2015	15	\N	\N
4792	173	3	7	7	0	0	2015	7	\N	\N
4793	173	4	7	7	0	0	2015	7	\N	\N
4794	173	5	5	5	0	0	2015	5	\N	\N
4795	173	6	84	84	0	0	2015	84	\N	\N
4796	173	7	7	7	0	0	2015	7	\N	\N
4797	173	8	5	5	0	0	2015	5	\N	\N
4798	173	9	0	0	0	0	2015	0	\N	\N
4799	126	1	5	5	0	0	2015	5	\N	\N
4800	126	2	15	15	0	0	2015	15	\N	\N
4801	126	3	7	7	0	0	2015	7	\N	\N
4802	126	4	7	7	0	0	2015	7	\N	\N
4803	126	5	5	5	0	0	2015	5	\N	\N
4804	126	6	84	84	0	0	2015	84	\N	\N
4805	126	7	7	7	0	0	2015	7	\N	\N
4806	126	8	5	5	0	0	2015	5	\N	\N
4807	126	9	0	0	0	0	2015	0	\N	\N
4810	176	3	7	7	0	0	2015	7	\N	\N
4811	176	4	7	7	0	0	2015	7	\N	\N
4813	176	6	84	84	0	0	2015	84	\N	\N
4816	176	9	0	0	0	0	2015	0	\N	\N
4817	182	1	5	5	0	0	2015	5	\N	\N
4818	182	2	15	15	0	0	2015	15	\N	\N
4819	182	3	7	7	0	0	2015	7	\N	\N
4820	182	4	7	7	0	0	2015	7	\N	\N
4821	182	5	5	5	0	0	2015	5	\N	\N
4823	182	7	7	7	0	0	2015	7	\N	\N
4824	182	8	5	5	0	0	2015	5	\N	\N
4825	182	9	0	0	0	0	2015	0	\N	\N
4826	202	1	5	5	0	0	2015	5	\N	\N
4827	202	2	15	15	0	0	2015	15	\N	\N
4828	202	3	7	7	0	0	2015	7	\N	\N
4829	202	4	7	7	0	0	2015	7	\N	\N
4830	202	5	5	5	0	0	2015	5	\N	\N
4832	202	7	7	7	0	0	2015	7	\N	\N
4833	202	8	5	5	0	0	2015	5	\N	\N
4834	202	9	0	0	0	0	2015	0	\N	\N
4835	183	1	5	5	0	0	2015	5	\N	\N
4836	183	2	15	15	0	0	2015	15	\N	\N
4837	183	3	7	7	0	0	2015	7	\N	\N
4838	183	4	7	7	0	0	2015	7	\N	\N
4839	183	5	5	5	0	0	2015	5	\N	\N
4841	183	7	7	7	0	0	2015	7	\N	\N
4842	183	8	5	5	0	0	2015	5	\N	\N
4768	159	6	84	0	0	0	2015	0	\N	\N
4822	182	6	84	0	0	0	2015	0	\N	\N
4831	202	6	84	0	0	0	2015	0	\N	\N
4840	183	6	84	0	0	0	2015	0	\N	\N
4814	176	7	7	0	0	0	2015	0	\N	\N
4815	176	8	5	0	5	0	2015	5	\N	2016-01-04 05:20:28.050448
4767	159	5	5	3.5	1.5	0	2015	5	\N	2015-08-20 09:07:35.834452
4758	160	5	5	2	3	0	2015	5	\N	2015-03-16 05:05:31.234725
4762	160	9	3	1	2	0	2015	3	\N	2015-08-27 13:01:39.8999
4809	176	2	15	0	15	0	2015	15	\N	2016-01-04 04:52:03.496337
4764	159	2	15	8	7	0	2015	15	\N	2015-12-25 11:20:51.663843
4808	176	1	5	2	3	0	2015	5	\N	2015-06-22 07:27:39.897507
4765	159	3	7	4	3	0	2015	7	\N	2015-07-16 04:35:15.798463
4761	160	8	5	1	4	0	2015	5	\N	2015-12-28 08:20:15.837634
4763	159	1	5	0	5	0	2015	5	\N	2015-11-16 03:45:16.573329
4843	183	9	0	0	0	0	2015	0	\N	\N
4844	192	1	5	5	0	0	2015	5	\N	\N
4845	192	2	15	15	0	0	2015	15	\N	\N
4846	192	3	7	7	0	0	2015	7	\N	\N
4847	192	4	7	7	0	0	2015	7	\N	\N
4848	192	5	5	5	0	0	2015	5	\N	\N
39255	74	1	5	5	0	0	2017	5	2017-01-02 04:46:52.719909	2017-01-02 04:46:52.719909
4850	192	7	7	7	0	0	2015	7	\N	\N
4851	192	8	5	5	0	0	2015	5	\N	\N
4852	192	9	0	0	0	0	2015	0	\N	\N
4853	204	1	5	5	0	0	2015	5	\N	\N
4854	204	2	15	15	0	0	2015	15	\N	\N
4855	204	3	7	7	0	0	2015	7	\N	\N
4856	204	4	7	7	0	0	2015	7	\N	\N
4857	204	5	5	5	0	0	2015	5	\N	\N
4859	204	7	7	7	0	0	2015	7	\N	\N
4860	204	8	5	5	0	0	2015	5	\N	\N
4861	204	9	0	0	0	0	2015	0	\N	\N
4862	170	1	5	5	0	0	2015	5	\N	\N
4865	170	4	7	7	0	0	2015	7	\N	\N
4868	170	7	7	7	0	0	2015	7	\N	\N
4873	200	3	7	7	0	0	2015	7	\N	\N
4874	200	4	7	7	0	0	2015	7	\N	\N
4875	200	5	5	5	0	0	2015	5	\N	\N
4877	200	7	7	7	0	0	2015	7	\N	\N
4879	200	9	0	0	0	0	2015	0	\N	\N
4880	180	1	5	5	0	0	2015	5	\N	\N
4881	180	2	15	15	0	0	2015	15	\N	\N
4882	180	3	7	7	0	0	2015	7	\N	\N
4883	180	4	7	7	0	0	2015	7	\N	\N
4884	180	5	5	5	0	0	2015	5	\N	\N
4885	180	6	84	84	0	0	2015	84	\N	\N
4886	180	7	7	7	0	0	2015	7	\N	\N
4887	180	8	5	5	0	0	2015	5	\N	\N
4888	180	9	0	0	0	0	2015	0	\N	\N
4892	188	4	7	7	0	0	2015	7	\N	\N
4895	188	7	7	7	0	0	2015	7	\N	\N
4897	188	9	0	0	0	0	2015	0	\N	\N
4898	190	1	5	5	0	0	2015	5	\N	\N
4899	190	2	15	15	0	0	2015	15	\N	\N
4900	190	3	7	7	0	0	2015	7	\N	\N
4901	190	4	7	7	0	0	2015	7	\N	\N
4902	190	5	5	5	0	0	2015	5	\N	\N
4904	190	7	7	7	0	0	2015	7	\N	\N
4905	190	8	5	5	0	0	2015	5	\N	\N
4906	190	9	0	0	0	0	2015	0	\N	\N
4909	198	3	7	7	0	0	2015	7	\N	\N
4910	198	4	7	7	0	0	2015	7	\N	\N
4911	198	5	5	5	0	0	2015	5	\N	\N
4913	198	7	7	7	0	0	2015	7	\N	\N
4915	198	9	0	0	0	0	2015	0	\N	\N
4918	187	3	7	7	0	0	2015	7	\N	\N
4922	187	7	7	7	0	0	2015	7	\N	\N
4924	187	9	0	0	0	0	2015	0	\N	\N
4925	184	1	5	5	0	0	2015	5	\N	\N
4926	184	2	15	15	0	0	2015	15	\N	\N
4927	184	3	7	7	0	0	2015	7	\N	\N
4928	184	4	7	7	0	0	2015	7	\N	\N
4929	184	5	5	5	0	0	2015	5	\N	\N
4858	204	6	84	0	0	0	2015	0	\N	\N
4867	170	6	84	0	0	0	2015	0	\N	\N
4876	200	6	84	0	0	0	2015	0	\N	\N
4894	188	6	84	0	0	0	2015	0	\N	\N
4903	190	6	84	0	0	0	2015	0	\N	\N
4912	198	6	84	0	0	0	2015	0	\N	\N
4921	187	6	84	0	0	0	2015	0	\N	\N
4930	184	6	84	0	0	0	2015	0	\N	\N
4871	200	1	5	4	1	0	2015	5	\N	2015-01-05 09:06:11.540045
4878	200	8	5	4	1	0	2015	5	\N	2015-01-05 09:06:18.510996
4863	170	2	15	5	10	0	2015	15	\N	2015-05-14 13:20:46.633322
4864	170	3	7	6	1	0	2015	7	\N	2015-01-07 07:52:03.691345
4890	188	2	15	0	15	0	2015	15	\N	2015-03-18 06:59:59.598781
4889	188	1	5	0	5	0	2015	5	\N	2015-03-09 05:22:48.251822
4866	170	5	5	4.5	0.5	0	2015	5	\N	2015-02-05 12:32:55.255098
4907	198	1	5	2	3	0	2015	5	\N	2015-09-28 08:49:03.668761
4917	187	2	15	0	15	0	2015	15	\N	2015-11-23 13:45:09.182974
4869	170	8	5	5	0	0	2015	5	\N	2015-03-23 10:39:39.939002
4920	187	5	5	2	3	0	2015	5	\N	2015-10-20 12:21:12.479953
4914	198	8	5	1	4	0	2015	5	\N	2015-12-23 08:28:04.943809
4916	187	1	5	0	5	0	2015	5	\N	2015-12-23 13:50:47.46512
4891	188	3	7	0	7	0	2015	7	\N	2015-12-22 09:17:06.381301
4919	187	4	7	7	0	0	2015	7	\N	2015-04-03 06:11:53.835573
4893	188	5	5	0	5	0	2015	5	\N	2015-08-25 09:55:36.288548
4923	187	8	5	0	5	0	2015	5	\N	2015-12-23 13:51:35.123019
4931	184	7	7	7	0	0	2015	7	\N	\N
4932	184	8	5	5	0	0	2015	5	\N	\N
4933	184	9	0	0	0	0	2015	0	\N	\N
4934	175	1	5	5	0	0	2015	5	\N	\N
4935	175	2	15	15	0	0	2015	15	\N	\N
4936	175	3	7	7	0	0	2015	7	\N	\N
4937	175	4	7	7	0	0	2015	7	\N	\N
4938	175	5	5	5	0	0	2015	5	\N	\N
39256	74	2	15	15	0	0	2017	15	2017-01-02 04:46:52.729916	2017-01-02 04:46:52.729916
4940	175	7	7	7	0	0	2015	7	\N	\N
4941	175	8	5	5	0	0	2015	5	\N	\N
4942	175	9	0	0	0	0	2015	0	\N	\N
4945	203	3	7	7	0	0	2015	7	\N	\N
4946	203	4	7	7	0	0	2015	7	\N	\N
4949	203	7	7	7	0	0	2015	7	\N	\N
4950	203	8	5	5	0	0	2015	5	\N	\N
4951	203	9	0	0	0	0	2015	0	\N	\N
4952	181	1	5	5	0	0	2015	5	\N	\N
4953	181	2	15	15	0	0	2015	15	\N	\N
4954	181	3	7	7	0	0	2015	7	\N	\N
4955	181	4	7	7	0	0	2015	7	\N	\N
4956	181	5	5	5	0	0	2015	5	\N	\N
4958	181	7	7	7	0	0	2015	7	\N	\N
4959	181	8	5	5	0	0	2015	5	\N	\N
4960	181	9	0	0	0	0	2015	0	\N	\N
4961	199	1	5	5	0	0	2015	5	\N	\N
4962	199	2	15	15	0	0	2015	15	\N	\N
4963	199	3	7	7	0	0	2015	7	\N	\N
4964	199	4	7	7	0	0	2015	7	\N	\N
4965	199	5	5	5	0	0	2015	5	\N	\N
4967	199	7	7	7	0	0	2015	7	\N	\N
4968	199	8	5	5	0	0	2015	5	\N	\N
4969	199	9	0	0	0	0	2015	0	\N	\N
4972	191	3	7	7	0	0	2015	7	\N	\N
4973	191	4	7	7	0	0	2015	7	\N	\N
4976	191	7	7	7	0	0	2015	7	\N	\N
4978	191	9	0	0	0	0	2015	0	\N	\N
4979	193	1	5	5	0	0	2015	5	\N	\N
4980	193	2	15	15	0	0	2015	15	\N	\N
4981	193	3	7	7	0	0	2015	7	\N	\N
4982	193	4	7	7	0	0	2015	7	\N	\N
4983	193	5	5	5	0	0	2015	5	\N	\N
4984	193	6	84	84	0	0	2015	84	\N	\N
4985	193	7	7	7	0	0	2015	7	\N	\N
4986	193	8	5	5	0	0	2015	5	\N	\N
4987	193	9	0	0	0	0	2015	0	\N	\N
4989	194	2	15	15	0	0	2015	15	\N	\N
4990	194	3	7	7	0	0	2015	7	\N	\N
4991	194	4	7	7	0	0	2015	7	\N	\N
4993	194	6	84	84	0	0	2015	84	\N	\N
4996	194	9	0	0	0	0	2015	0	\N	\N
4999	177	3	7	7	0	0	2015	7	\N	\N
5000	177	4	7	7	0	0	2015	7	\N	\N
5003	177	7	7	7	0	0	2015	7	\N	\N
5006	179	1	5	5	0	0	2015	5	\N	\N
5008	179	3	7	7	0	0	2015	7	\N	\N
5009	179	4	7	7	0	0	2015	7	\N	\N
5010	179	5	5	5	0	0	2015	5	\N	\N
5012	179	7	7	7	0	0	2015	7	\N	\N
5014	179	9	0	0	0	0	2015	0	\N	\N
5017	189	3	7	7	0	0	2015	7	\N	\N
5018	189	4	7	7	0	0	2015	7	\N	\N
4948	203	6	84	0	0	0	2015	0	\N	\N
4957	181	6	84	0	0	0	2015	0	\N	\N
4966	199	6	84	0	0	0	2015	0	\N	\N
4975	191	6	84	0	0	0	2015	0	\N	\N
5002	177	6	84	0	0	0	2015	0	\N	\N
5011	179	6	84	0	0	0	2015	0	\N	\N
4994	194	7	7	0	0	0	2015	0	\N	\N
4992	194	5	5	2.5	2.5	0	2015	5	\N	2015-01-14 08:00:58.976033
5016	189	2	15	15	0	0	2015	15	\N	2015-01-23 04:51:43.382474
4944	203	2	15	7	8	0	2015	15	\N	2015-07-31 03:26:45.447866
5013	179	8	5	4	1	0	2015	5	\N	2015-01-05 13:46:06.337857
4970	191	1	5	0	5	0	2015	5	\N	2015-07-07 04:01:46.473011
5007	179	2	15	6	9	0	2015	15	\N	2015-01-09 09:46:13.144803
5004	177	8	5	3	2	0	2015	5	\N	2015-12-30 09:20:01.090748
5005	177	9	6	5	1	0	2015	6	\N	2015-06-30 06:10:52.841193
4995	194	8	5	3	2	0	2015	5	\N	2015-01-14 07:58:50.688796
4943	203	1	5	2	3	0	2015	5	\N	2015-02-05 03:33:59.982446
5001	177	5	5	4.5	0.5	0	2015	5	\N	2015-09-25 04:14:04.299192
4988	194	1	5	1	4	0	2015	5	\N	2015-03-05 05:06:50.096912
4997	177	1	5	1	4	0	2015	5	\N	2015-05-27 05:05:25.564808
4947	203	5	5	4	1	0	2015	5	\N	2015-04-30 08:16:28.80702
4998	177	2	15	8	7	0	2015	15	\N	2015-11-09 14:30:42.831329
5019	189	5	5	5	0	0	2015	5	\N	\N
39257	74	3	7	7	0	0	2017	7	2017-01-02 04:46:52.739939	2017-01-02 04:46:52.739939
5021	189	7	7	7	0	0	2015	7	\N	\N
5022	189	8	5	5	0	0	2015	5	\N	\N
5023	189	9	0	0	0	0	2015	0	\N	\N
5024	206	1	5	5	0	0	2015	5	\N	\N
5025	206	2	15	15	0	0	2015	15	\N	\N
5026	206	3	7	7	0	0	2015	7	\N	\N
5027	206	4	7	7	0	0	2015	7	\N	\N
5028	206	5	5	5	0	0	2015	5	\N	\N
5030	206	7	7	7	0	0	2015	7	\N	\N
5031	206	8	5	5	0	0	2015	5	\N	\N
5032	206	9	0	0	0	0	2015	0	\N	\N
5036	178	4	7	7	0	0	2015	7	\N	\N
5039	178	7	7	7	0	0	2015	7	\N	\N
5041	178	9	0	0	0	0	2015	0	\N	\N
5042	107	1	5	5	0	0	2015	5	\N	\N
5043	107	2	15	15	0	0	2015	15	\N	\N
5044	107	3	7	7	0	0	2015	7	\N	\N
5045	107	4	7	7	0	0	2015	7	\N	\N
5046	107	5	5	5	0	0	2015	5	\N	\N
5048	107	7	7	7	0	0	2015	7	\N	\N
5049	107	8	5	5	0	0	2015	5	\N	\N
5050	107	9	0	0	0	0	2015	0	\N	\N
5053	197	3	7	7	0	0	2015	7	\N	\N
5054	197	4	7	7	0	0	2015	7	\N	\N
5057	197	7	7	7	0	0	2015	7	\N	\N
5059	197	9	0	0	0	0	2015	0	\N	\N
5060	195	1	5	5	0	0	2015	5	\N	\N
5061	195	2	15	15	0	0	2015	15	\N	\N
5062	195	3	7	7	0	0	2015	7	\N	\N
5063	195	4	7	7	0	0	2015	7	\N	\N
5064	195	5	5	5	0	0	2015	5	\N	\N
5066	195	7	7	7	0	0	2015	7	\N	\N
5067	195	8	5	5	0	0	2015	5	\N	\N
5068	195	9	0	0	0	0	2015	0	\N	\N
5071	201	3	7	7	0	0	2015	7	\N	\N
5072	201	4	7	7	0	0	2015	7	\N	\N
5074	201	6	84	84	0	0	2015	84	\N	\N
5077	201	9	0	0	0	0	2015	0	\N	\N
5078	205	1	5	5	0	0	2015	5	\N	\N
5079	205	2	15	15	0	0	2015	15	\N	\N
5080	205	3	7	7	0	0	2015	7	\N	\N
5081	205	4	7	7	0	0	2015	7	\N	\N
5082	205	5	5	5	0	0	2015	5	\N	\N
5083	205	6	84	84	0	0	2015	84	\N	\N
5084	205	7	7	7	0	0	2015	7	\N	\N
5085	205	8	5	5	0	0	2015	5	\N	\N
5086	205	9	0	0	0	0	2015	0	\N	\N
5089	196	3	7	7	0	0	2015	7	\N	\N
5090	196	4	7	7	0	0	2015	7	\N	\N
5093	196	7	7	7	0	0	2015	7	\N	\N
5095	196	9	0	0	0	0	2015	0	\N	\N
5096	185	1	5	5	0	0	2015	5	\N	\N
5098	185	3	7	7	0	0	2015	7	\N	\N
5099	185	4	7	7	0	0	2015	7	\N	\N
5100	185	5	5	5	0	0	2015	5	\N	\N
5102	185	7	7	7	0	0	2015	7	\N	\N
5104	185	9	0	0	0	0	2015	0	\N	\N
5029	206	6	84	0	0	0	2015	0	\N	\N
5038	178	6	84	0	0	0	2015	0	\N	\N
5047	107	6	84	0	0	0	2015	0	\N	\N
5056	197	6	84	0	0	0	2015	0	\N	\N
5065	195	6	84	0	0	0	2015	0	\N	\N
5092	196	6	84	0	0	0	2015	0	\N	\N
5101	185	6	84	0	0	0	2015	0	\N	\N
5075	201	7	7	0	0	0	2015	0	\N	\N
5076	201	8	5	0	5	0	2015	5	\N	2015-10-19 13:12:04.966738
5055	197	5	5	0	5	0	2015	5	\N	2015-11-09 04:45:44.395593
5035	178	3	7	6	1	0	2015	7	\N	2015-02-27 12:29:30.376278
5033	178	1	5	0	5	0	2015	5	\N	2015-12-28 05:44:02.243378
5106	215	2	15	3	12	0	2015	15	\N	2015-12-18 10:59:34.647588
5088	196	2	15	0	15	0	2015	15	\N	2015-12-25 08:07:49.245615
5037	178	5	5	0	5	0	2015	5	\N	2015-12-28 11:32:52.124165
5087	196	1	5	0	5	0	2015	5	\N	2016-01-04 13:08:35.507261
5040	178	8	5	0	5	0	2015	5	\N	2015-10-13 10:53:37.11519
5069	201	1	5	0	5	0	2015	5	\N	2015-05-19 12:47:44.477896
5091	196	5	5	4	1	0	2015	5	\N	2015-12-25 08:06:37.966352
5052	197	2	15	0	15	0	2015	15	\N	2015-08-12 04:50:41.161618
5094	196	8	5	2	3	0	2015	5	\N	2016-01-04 13:09:58.163679
5073	201	5	5	0	5	0	2015	5	\N	2015-12-23 13:20:32.906741
5051	197	1	5	0	5	0	2015	5	\N	2015-07-02 06:49:20.618155
5105	215	1	5	1	4	0	2015	5	\N	2015-12-07 04:21:31.044563
5058	197	8	5	0	5	0	2015	5	\N	2015-12-30 07:01:23.018671
5107	215	3	7	7	0	0	2015	7	\N	\N
5108	215	4	7	7	0	0	2015	7	\N	\N
39258	74	4	7	7	0	0	2017	7	2017-01-02 04:46:52.749945	2017-01-02 04:46:52.749945
5111	215	7	7	7	0	0	2015	7	\N	\N
5113	215	9	0	0	0	0	2015	0	\N	\N
5116	99	3	7	7	0	0	2015	7	\N	\N
5117	99	4	7	7	0	0	2015	7	\N	\N
5120	99	7	7	7	0	0	2015	7	\N	\N
5125	212	3	7	7	0	0	2015	7	\N	\N
5126	212	4	7	7	0	0	2015	7	\N	\N
5131	212	9	0	0	0	0	2015	0	\N	\N
5134	214	3	7	7	0	0	2015	7	\N	\N
5135	214	4	7	7	0	0	2015	7	\N	\N
5138	214	7	7	7	0	0	2015	7	\N	\N
5140	214	9	0	0	0	0	2015	0	\N	\N
5144	209	4	7	7	0	0	2015	7	\N	\N
5146	209	6	84	84	0	0	2015	84	\N	\N
5149	209	9	0	0	0	0	2015	0	\N	\N
5150	207	1	5	5	0	0	2015	5	\N	\N
5151	207	2	15	15	0	0	2015	15	\N	\N
5152	207	3	7	7	0	0	2015	7	\N	\N
5153	207	4	7	7	0	0	2015	7	\N	\N
5154	207	5	5	5	0	0	2015	5	\N	\N
5156	207	7	7	7	0	0	2015	7	\N	\N
5157	207	8	5	5	0	0	2015	5	\N	\N
5158	207	9	0	0	0	0	2015	0	\N	\N
5161	210	3	7	7	0	0	2015	7	\N	\N
5162	210	4	7	7	0	0	2015	7	\N	\N
5165	210	7	7	7	0	0	2015	7	\N	\N
5166	210	8	5	5	0	0	2015	5	\N	\N
5168	208	1	5	5	0	0	2015	5	\N	\N
5169	208	2	15	15	0	0	2015	15	\N	\N
5170	208	3	7	7	0	0	2015	7	\N	\N
5171	208	4	7	7	0	0	2015	7	\N	\N
5172	208	5	5	5	0	0	2015	5	\N	\N
5174	208	7	7	7	0	0	2015	7	\N	\N
5175	208	8	5	5	0	0	2015	5	\N	\N
5176	208	9	0	0	0	0	2015	0	\N	\N
5179	211	3	7	7	0	0	2015	7	\N	\N
5180	211	4	7	7	0	0	2015	7	\N	\N
5183	211	7	7	7	0	0	2015	7	\N	\N
5185	211	9	0	0	0	0	2015	0	\N	\N
5190	213	5	5	5	0	0	2015	5	\N	\N
5192	213	7	7	7	0	0	2015	7	\N	\N
5194	213	9	0	0	0	0	2015	0	\N	\N
5119	99	6	84	0	0	0	2015	0	\N	\N
5128	212	6	84	0	0	0	2015	0	\N	\N
5155	207	6	84	0	0	0	2015	0	\N	\N
5164	210	6	84	0	0	0	2015	0	\N	\N
5173	208	6	84	0	0	0	2015	0	\N	\N
5182	211	6	84	0	0	0	2015	0	\N	\N
5191	213	6	84	0	0	0	2015	0	\N	\N
5147	209	7	7	0	0	0	2015	0	\N	\N
5137	214	6	84	0	0	0	2015	0	\N	\N
5118	99	5	5	0.5	4.5	0	2015	5	\N	2015-10-07 05:48:34.503698
5186	213	1	5	2	3	0	2015	5	\N	2015-03-30 05:56:04.111776
5177	211	1	5	0	5	0	2015	5	\N	2015-06-02 05:49:47.95702
5121	99	8	5	1	4	0	2015	5	\N	2015-11-10 11:40:33.599485
5124	212	2	15	4	11	0	2015	15	\N	2015-11-16 07:08:20.652874
5115	99	2	15	7	8	0	2015	15	\N	2015-10-19 06:09:55.338139
5178	211	2	15	0	15	0	2015	15	\N	2015-11-26 04:14:55.667861
5188	213	3	7	5	2	0	2015	7	\N	2015-01-14 05:42:49.766197
5122	99	9	3	0	3	0	2015	3	\N	2015-10-07 05:49:33.166744
5132	214	1	5	2	3	0	2015	5	\N	2015-09-16 05:40:01.232812
5139	214	8	5	2	3	0	2015	5	\N	2015-11-12 05:54:46.373671
5136	214	5	5	0	5	0	2015	5	\N	2015-11-12 05:54:23.525549
5129	212	7	7	4	3	0	2015	7	\N	2015-03-30 10:28:05.032849
5142	209	2	15	0	15	0	2015	15	\N	2015-11-06 11:27:45.256856
5130	212	8	5	0	5	0	2015	5	\N	2015-11-16 07:06:20.373023
5167	210	9	1	1	0	0	2015	1	\N	2015-06-30 06:11:19.461545
5109	215	5	5	4	1	0	2015	5	\N	2015-12-03 07:01:35.031721
5160	210	2	15	5	10	0	2015	15	\N	2015-05-20 06:43:24.988289
5184	211	8	5	0	5	0	2015	5	\N	2015-12-28 04:46:30.179798
5163	210	5	5	2.5	2.5	0	2015	5	\N	2016-09-19 12:37:17.929831
5189	213	4	7	0	7	0	2015	7	\N	2015-04-23 04:54:34.397223
5112	215	8	5	4	1	0	2015	5	\N	2015-12-18 10:59:57.297064
5143	209	3	7	4	3	0	2015	7	\N	2015-09-01 04:52:46.01806
5141	209	1	5	0	5	0	2015	5	\N	2015-09-21 11:55:09.422249
5133	214	2	15	12	3	0	2015	15	\N	2015-11-23 07:32:14.842595
5123	212	1	5	0	5	0	2015	5	\N	2015-12-08 06:02:01.905467
5159	210	1	5	1	4	0	2015	5	\N	2016-09-19 12:37:27.165859
3715	33	6	84	0	0	0	2015	0	\N	\N
3787	47	6	84	0	0	0	2015	0	\N	\N
3877	76	6	84	0	0	0	2015	0	\N	\N
3967	82	6	84	0	0	0	2015	0	\N	\N
4057	100	6	84	0	0	0	2015	0	\N	\N
4147	101	6	84	0	0	0	2015	0	\N	\N
4228	35	6	84	0	0	0	2015	0	\N	\N
4318	134	6	84	0	0	0	2015	0	\N	\N
4417	114	6	84	0	0	0	2015	0	\N	\N
4498	161	6	84	0	0	0	2015	0	\N	\N
4579	59	6	84	0	0	0	2015	0	\N	\N
4669	149	6	84	0	0	0	2015	0	\N	\N
4759	160	6	84	0	0	0	2015	0	\N	\N
4849	192	6	84	0	0	0	2015	0	\N	\N
4939	175	6	84	0	0	0	2015	0	\N	\N
5020	189	6	84	0	0	0	2015	0	\N	\N
5110	215	6	84	0	0	0	2015	0	\N	\N
2883	63	2	15	7	8	0	2014	15	\N	\N
3273	176	5	5	1	4	0	2014	5	\N	\N
5197	216	3	7	7	0	0	2015	7	2015-01-05 06:57:43.600559	2015-01-05 06:57:43.600559
5198	216	4	7	7	0	0	2015	7	2015-01-05 06:57:43.713515	2015-01-05 06:57:43.713515
5201	216	7	7	7	0	0	2015	7	2015-01-05 06:57:43.810871	2015-01-05 06:57:43.810871
5203	216	9	0	0	0	0	2015	0	2015-01-05 06:57:43.917724	2015-01-05 06:57:43.917724
5200	216	6	84	0	0	0	2015	0	2015-01-05 06:57:43.78414	2015-01-05 06:57:43.948357
4872	200	2	15	13	2	0	2015	15	\N	2015-01-05 09:06:31.238401
5015	189	1	5	4	1	0	2015	5	\N	2015-01-05 09:08:39.312831
3225	171	2	15	7	8	0	2014	15	\N	2015-01-05 09:09:09.343342
5193	213	8	5	4	1	0	2015	5	\N	2015-01-05 13:46:06.222142
4572	162	8	5	4	1	0	2015	5	\N	2015-01-06 11:51:43.215394
5206	217	3	7	7	0	0	2015	7	2015-01-09 10:30:22.628265	2015-01-09 10:30:22.628265
5207	217	4	7	7	0	0	2015	7	2015-01-09 10:30:22.641864	2015-01-09 10:30:22.641864
5210	217	7	7	7	0	0	2015	7	2015-01-09 10:30:22.683833	2015-01-09 10:30:22.683833
5212	217	9	0	0	0	0	2015	0	2015-01-09 10:30:22.71224	2015-01-09 10:30:22.71224
5209	217	6	84	0	0	0	2015	0	2015-01-09 10:30:22.670134	2015-01-09 10:30:22.727826
3411	191	8	5	5	0	0	2014	5	\N	2015-01-13 06:54:02.032517
5218	218	6	84	0	0	0	2015	0	2015-01-19 09:12:43.819316	2015-01-19 09:12:43.992688
5223	219	2	15	10	5	0	2015	15	2015-01-19 11:04:46.193532	2015-09-21 05:12:51.616491
5215	218	3	7	7	0	0	2015	7	2015-01-19 09:12:43.673392	2015-01-19 09:12:43.673392
5216	218	4	7	7	0	0	2015	7	2015-01-19 09:12:43.702081	2015-01-19 09:12:43.702081
5219	218	7	7	7	0	0	2015	7	2015-01-19 09:12:43.84883	2015-01-19 09:12:43.84883
5221	218	9	0	0	0	0	2015	0	2015-01-19 09:12:43.935201	2015-01-19 09:12:43.935201
5222	219	1	5	5	0	0	2015	5	2015-01-19 11:04:46.171648	2015-01-19 11:04:46.171648
5224	219	3	7	7	0	0	2015	7	2015-01-19 11:04:46.2074	2015-01-19 11:04:46.2074
5225	219	4	7	7	0	0	2015	7	2015-01-19 11:04:46.222206	2015-01-19 11:04:46.222206
5226	219	5	5	5	0	0	2015	5	2015-01-19 11:04:46.236242	2015-01-19 11:04:46.236242
5228	219	7	7	7	0	0	2015	7	2015-01-19 11:04:46.275031	2015-01-19 11:04:46.275031
5229	219	8	5	5	0	0	2015	5	2015-01-19 11:04:46.288942	2015-01-19 11:04:46.288942
5227	219	6	84	0	0	0	2015	0	2015-01-19 11:04:46.251848	2015-01-19 11:04:46.331846
5103	185	8	5	0	5	0	2015	5	\N	2015-12-16 08:34:44.827447
4188	102	2	15	1	14	0	2015	15	\N	2015-12-04 10:45:52.055345
3990	87	2	15	10	5	0	2015	15	\N	2015-05-18 05:16:35.288998
4971	191	2	15	0	15	0	2015	15	\N	2015-05-28 11:03:01.121214
5202	216	8	5	-17	22	0	2015	5	2015-01-05 06:57:43.889713	2015-09-03 08:00:29.912804
3747	70	2	15	0	15	0	2015	15	\N	2015-09-09 08:49:48.742275
4593	143	2	15	0	15	0	2015	15	\N	2015-12-29 12:34:47.465943
5220	218	8	5	1	4	0	2015	5	2015-01-19 09:12:43.877103	2015-12-30 08:05:41.401794
4196	52	1	5	1	4	0	2015	5	\N	2015-10-27 07:32:05.46686
5195	216	1	5	0	5	0	2015	5	2015-01-05 06:57:43.507713	2015-09-28 09:00:56.90793
5196	216	2	15	4	11	0	2015	15	2015-01-05 06:57:43.572094	2015-09-28 09:08:13.733634
4689	163	8	5	0	5	0	2015	5	\N	2015-12-30 03:40:15.024412
3822	77	5	5	0	5	0	2015	5	\N	2015-05-27 10:19:42.052935
4080	31	2	15	0	15	0	2015	15	\N	2015-05-21 09:20:47.305711
4734	169	8	5	2	3	0	2015	5	\N	2015-12-17 09:05:47.880601
5214	218	2	15	0	15	0	2015	15	2015-01-19 09:12:43.644736	2015-12-21 14:29:57.804247
5204	217	1	5	3	2	0	2015	5	2015-01-09 10:30:22.592113	2015-11-25 04:10:27.422623
5199	216	5	5	4	1	0	2015	5	2015-01-05 06:57:43.756095	2015-09-18 09:11:40.806472
4317	134	5	5	0	5	0	2015	5	\N	2015-12-14 12:35:42.971021
5205	217	2	15	7	8	0	2015	15	2015-01-09 10:30:22.613667	2015-12-23 10:36:00.290421
5148	209	8	5	0	5	0	2015	5	\N	2015-11-06 11:27:27.205831
5211	217	8	5	1	4	0	2015	5	2015-01-09 10:30:22.697425	2015-12-22 12:41:04.235748
5208	217	5	5	3	2	0	2015	5	2015-01-09 10:30:22.655518	2015-12-28 10:47:46.443882
4359	109	2	15	0	15	0	2015	15	\N	2015-11-23 06:56:06.016874
4656	158	2	15	5	10	0	2015	15	\N	2015-12-18 14:26:22.303441
5217	218	5	5	0	5	0	2015	5	2015-01-19 09:12:43.730075	2015-11-10 04:51:41.304946
3933	72	8	5	0	5	0	2015	5	\N	2015-12-22 12:11:11.254568
5213	218	1	5	0	5	0	2015	5	2015-01-19 09:12:43.620367	2015-10-26 04:15:50.868957
5230	219	9	0	0	0	0	2015	0	2015-01-19 11:04:46.303905	2015-01-19 11:04:46.303905
5233	220	3	7	7	0	0	2015	7	2015-01-22 06:56:42.370726	2015-01-22 06:56:42.370726
5234	220	4	7	7	0	0	2015	7	2015-01-22 06:56:42.385691	2015-01-22 06:56:42.385691
5237	220	7	7	7	0	0	2015	7	2015-01-22 06:56:42.428621	2015-01-22 06:56:42.428621
5239	220	9	0	0	0	0	2015	0	2015-01-22 06:56:42.457358	2015-01-22 06:56:42.457358
5236	220	6	84	0	0	0	2015	0	2015-01-22 06:56:42.414543	2015-01-22 06:56:42.474373
39259	74	5	5	5	0	0	2017	5	2017-01-02 04:46:52.760021	2017-01-02 04:46:52.760021
5243	221	4	7	7	0	0	2015	7	2015-02-02 07:50:58.626996	2015-02-02 07:50:58.626996
5246	221	7	7	7	0	0	2015	7	2015-02-02 07:50:58.668937	2015-02-02 07:50:58.668937
5248	221	9	0	0	0	0	2015	0	2015-02-02 07:50:58.697194	2015-02-02 07:50:58.697194
5245	221	6	84	0	0	0	2015	0	2015-02-02 07:50:58.655218	2015-02-02 07:50:58.714179
5252	222	4	7	7	0	0	2015	7	2015-02-02 10:46:12.265024	2015-02-02 10:46:12.265024
5255	222	7	7	7	0	0	2015	7	2015-02-02 10:46:12.350878	2015-02-02 10:46:12.350878
5256	222	8	5	5	0	0	2015	5	2015-02-02 10:46:12.378739	2015-02-02 10:46:12.378739
5257	222	9	0	0	0	0	2015	0	2015-02-02 10:46:12.407649	2015-02-02 10:46:12.407649
5254	222	6	84	0	0	0	2015	0	2015-02-02 10:46:12.321982	2015-02-02 10:46:12.439366
5272	224	6	84	0	0	0	2015	0	2015-02-17 06:05:08.992278	2015-02-17 06:05:09.063537
5242	221	3	7	3	4	0	2015	7	2015-02-02 07:50:58.613333	2015-02-10 07:07:02.300158
5285	226	1	5	1	4	0	2015	5	2015-02-17 06:44:51.127367	2015-11-20 11:14:48.760488
5260	223	3	7	7	0	0	2015	7	2015-02-12 05:21:39.225567	2015-02-12 05:21:39.225567
5262	223	5	5	5	0	0	2015	5	2015-02-12 05:21:39.253718	2015-02-12 05:21:39.253718
5264	223	7	7	7	0	0	2015	7	2015-02-12 05:21:39.292142	2015-02-12 05:21:39.292142
5265	223	8	5	5	0	0	2015	5	2015-02-12 05:21:39.305746	2015-02-12 05:21:39.305746
5266	223	9	0	0	0	0	2015	0	2015-02-12 05:21:39.320406	2015-02-12 05:21:39.320406
5263	223	6	84	0	0	0	2015	0	2015-02-12 05:21:39.278828	2015-02-12 05:21:39.35822
5269	224	3	7	7	0	0	2015	7	2015-02-17 06:05:08.949477	2015-02-17 06:05:08.949477
5270	224	4	7	7	0	0	2015	7	2015-02-17 06:05:08.964493	2015-02-17 06:05:08.964493
5271	224	5	5	5	0	0	2015	5	2015-02-17 06:05:08.97828	2015-02-17 06:05:08.97828
5273	224	7	7	7	0	0	2015	7	2015-02-17 06:05:09.007078	2015-02-17 06:05:09.007078
5274	224	8	5	5	0	0	2015	5	2015-02-17 06:05:09.021052	2015-02-17 06:05:09.021052
5275	224	9	0	0	0	0	2015	0	2015-02-17 06:05:09.035897	2015-02-17 06:05:09.035897
5277	225	2	15	15	0	0	2015	15	2015-02-17 06:06:15.694815	2015-02-17 06:06:15.694815
5278	225	3	7	7	0	0	2015	7	2015-02-17 06:06:15.709411	2015-02-17 06:06:15.709411
5279	225	4	7	7	0	0	2015	7	2015-02-17 06:06:15.723372	2015-02-17 06:06:15.723372
5280	225	5	5	5	0	0	2015	5	2015-02-17 06:06:15.737302	2015-02-17 06:06:15.737302
5282	225	7	7	7	0	0	2015	7	2015-02-17 06:06:15.766019	2015-02-17 06:06:15.766019
5283	225	8	5	5	0	0	2015	5	2015-02-17 06:06:15.779959	2015-02-17 06:06:15.779959
5284	225	9	0	0	0	0	2015	0	2015-02-17 06:06:15.794947	2015-02-17 06:06:15.794947
5281	225	6	84	0	0	0	2015	0	2015-02-17 06:06:15.752128	2015-02-17 06:06:15.823513
4908	198	2	15	0	15	0	2015	15	\N	2015-12-23 13:24:53.828829
5287	226	3	7	6	1	0	2015	7	2015-02-17 06:44:51.162189	2015-11-24 12:44:17.021325
5247	221	8	5	1	4	0	2015	5	2015-02-02 07:50:58.683526	2015-11-10 12:59:38.833351
5288	226	4	7	0	7	0	2015	7	2015-02-17 06:44:51.175731	2015-10-27 12:33:44.405025
4755	160	2	15	2	13	0	2015	15	\N	2015-10-27 05:33:06.566757
5253	222	5	5	4.5	0.5	0	2015	5	2015-02-02 10:46:12.293074	2015-04-13 07:31:10.544801
5276	225	1	5	3	2	0	2015	5	2015-02-17 06:06:15.676242	2015-03-24 04:46:47.341684
5238	220	8	5	2	3	0	2015	5	2015-01-22 06:56:42.442433	2015-12-28 10:29:23.390817
5286	226	2	15	6	9	0	2015	15	2015-02-17 06:44:51.147953	2015-12-25 06:51:58.811879
5250	222	2	15	10	5	0	2015	15	2015-02-02 10:46:12.207619	2015-11-30 06:55:28.040695
5244	221	5	5	2	3	0	2015	5	2015-02-02 07:50:58.64159	2015-12-23 13:26:04.710367
5251	222	3	7	4	3	0	2015	7	2015-02-02 10:46:12.236491	2015-05-26 05:42:50.736136
3801	91	2	15	3	12	0	2015	15	\N	2015-12-22 05:25:17.719906
3907	30	9	1	0	1	0	2015	1	\N	2015-08-31 10:19:13.764243
5258	223	1	5	2	3	0	2015	5	2015-02-12 05:21:39.192779	2015-04-15 04:18:48.908733
5259	223	2	15	14	1	0	2015	15	2015-02-12 05:21:39.212078	2015-04-27 04:29:49.93123
4251	128	2	15	9	6	0	2015	15	\N	2015-04-28 10:31:27.639516
5289	226	5	5	0	5	0	2015	5	2015-02-17 06:44:51.189223	2015-11-20 11:16:04.064402
5261	223	4	7	7	0	0	2015	7	2015-02-12 05:21:39.240111	2015-05-13 10:34:49.083984
5114	99	1	5	0	5	0	2015	5	\N	2015-05-12 06:44:32.136795
5267	224	1	5	0	5	0	2015	5	2015-02-17 06:05:08.895475	2015-07-13 04:31:01.781581
5268	224	2	15	14	1	0	2015	15	2015-02-17 06:05:08.935853	2015-11-02 05:16:35.07344
4530	144	2	15	6	9	0	2015	15	\N	2015-06-23 03:45:48.563151
5249	222	1	5	0	5	0	2015	5	2015-02-02 10:46:12.184737	2015-08-25 07:35:41.979615
4977	191	8	5	2	3	0	2015	5	\N	2015-08-31 05:20:46.631732
4683	163	2	15	0	15	0	2015	15	\N	2015-08-12 04:43:13.987937
4186	80	9	5	1	4	0	2015	5	\N	2015-09-03 05:20:04.272385
5070	201	2	15	0	15	0	2015	15	\N	2015-12-23 13:18:17.403888
5240	221	1	5	4	1	0	2015	5	2015-02-02 07:50:58.57766	2015-09-21 02:35:26.818681
3717	33	8	5	0	5	0	2015	5	\N	2015-09-22 07:41:36.595173
5232	220	2	15	1	14	0	2015	15	2015-01-22 06:56:42.357167	2015-11-19 12:52:03.437174
4008	95	2	15	0	15	0	2015	15	\N	2015-11-24 07:04:17.389601
5231	220	1	5	0	5	0	2015	5	2015-01-22 06:56:42.336348	2015-12-22 13:44:31.439271
5235	220	5	5	2	3	0	2015	5	2015-01-22 06:56:42.399614	2015-12-28 10:31:53.833388
5290	226	6	84	84	0	0	2015	84	2015-02-17 06:44:51.203716	2015-02-17 06:44:51.203716
5293	226	9	0	0	0	0	2015	0	2015-02-17 06:44:51.275524	2015-02-17 06:44:51.275524
5291	226	7	7	0	0	0	2015	0	2015-02-17 06:44:51.247524	2015-02-17 06:44:51.353267
5335	231	6	84	0	0	0	2015	0	2015-03-13 04:52:04.918482	2015-03-13 04:52:05.000374
5297	227	4	7	7	0	0	2015	7	2015-02-19 04:21:28.493121	2015-02-19 04:21:28.493121
5300	227	7	7	7	0	0	2015	7	2015-02-19 04:21:28.535987	2015-02-19 04:21:28.535987
5301	227	8	5	5	0	0	2015	5	2015-02-19 04:21:28.549938	2015-02-19 04:21:28.549938
5302	227	9	0	0	0	0	2015	0	2015-02-19 04:21:28.56487	2015-02-19 04:21:28.56487
5299	227	6	84	0	0	0	2015	0	2015-02-19 04:21:28.52204	2015-02-19 04:21:28.593646
5321	230	1	5	0	5	0	2015	5	2015-03-13 04:51:18.064788	2015-09-03 06:29:03.830524
5303	228	1	5	5	0	0	2015	5	2015-03-04 05:10:39.980934	2015-03-04 05:10:39.980934
5304	228	2	15	15	0	0	2015	15	2015-03-04 05:10:40.002777	2015-03-04 05:10:40.002777
5305	228	3	7	7	0	0	2015	7	2015-03-04 05:10:40.017425	2015-03-04 05:10:40.017425
5306	228	4	7	7	0	0	2015	7	2015-03-04 05:10:40.031338	2015-03-04 05:10:40.031338
5307	228	5	5	5	0	0	2015	5	2015-03-04 05:10:40.045195	2015-03-04 05:10:40.045195
5310	228	8	5	5	0	0	2015	5	2015-03-04 05:10:40.097967	2015-03-04 05:10:40.097967
5311	228	9	0	0	0	0	2015	0	2015-03-04 05:10:40.112886	2015-03-04 05:10:40.112886
5308	228	6	84	0	0	0	2015	0	2015-03-04 05:10:40.070171	2015-03-04 05:10:40.128958
5344	232	6	84	0	0	0	2015	0	2015-03-23 04:23:28.213087	2015-03-23 04:23:28.283232
5314	229	3	7	7	0	0	2015	7	2015-03-05 08:03:58.589771	2015-03-05 08:03:58.589771
5315	229	4	7	7	0	0	2015	7	2015-03-05 08:03:58.60438	2015-03-05 08:03:58.60438
5318	229	7	7	7	0	0	2015	7	2015-03-05 08:03:58.646339	2015-03-05 08:03:58.646339
5319	229	8	5	5	0	0	2015	5	2015-03-05 08:03:58.659959	2015-03-05 08:03:58.659959
5320	229	9	0	0	0	0	2015	0	2015-03-05 08:03:58.67459	2015-03-05 08:03:58.67459
5317	229	6	84	0	0	0	2015	0	2015-03-05 08:03:58.632662	2015-03-05 08:03:58.701794
5309	228	7	7	0	0	0	2015	7	2015-03-04 05:10:40.084112	2015-03-05 09:48:12.2407
5325	230	5	5	4.5	0.5	0	2015	5	2015-03-13 04:51:18.130087	2015-06-09 07:05:42.303504
5323	230	3	7	7	0	0	2015	7	2015-03-13 04:51:18.10119	2015-03-13 04:51:18.10119
5324	230	4	7	7	0	0	2015	7	2015-03-13 04:51:18.115182	2015-03-13 04:51:18.115182
5326	230	6	84	84	0	0	2015	84	2015-03-13 04:51:18.14411	2015-03-13 04:51:18.14411
5329	230	9	0	0	0	0	2015	0	2015-03-13 04:51:18.186856	2015-03-13 04:51:18.186856
5327	230	7	7	0	0	0	2015	0	2015-03-13 04:51:18.15797	2015-03-13 04:51:18.204183
5330	231	1	5	5	0	0	2015	5	2015-03-13 04:52:04.836561	2015-03-13 04:52:04.836561
5332	231	3	7	7	0	0	2015	7	2015-03-13 04:52:04.875695	2015-03-13 04:52:04.875695
5333	231	4	7	7	0	0	2015	7	2015-03-13 04:52:04.890631	2015-03-13 04:52:04.890631
5334	231	5	5	5	0	0	2015	5	2015-03-13 04:52:04.904574	2015-03-13 04:52:04.904574
5336	231	7	7	7	0	0	2015	7	2015-03-13 04:52:04.933433	2015-03-13 04:52:04.933433
5337	231	8	5	5	0	0	2015	5	2015-03-13 04:52:04.947385	2015-03-13 04:52:04.947385
5338	231	9	0	0	0	0	2015	0	2015-03-13 04:52:04.961299	2015-03-13 04:52:04.961299
3764	44	1	5	4	1	0	2015	5	\N	2015-03-19 03:28:04.046802
5340	232	2	15	15	0	0	2015	15	2015-03-23 04:23:28.157735	2015-03-23 04:23:28.157735
5341	232	3	7	7	0	0	2015	7	2015-03-23 04:23:28.171172	2015-03-23 04:23:28.171172
5342	232	4	7	7	0	0	2015	7	2015-03-23 04:23:28.185814	2015-03-23 04:23:28.185814
5343	232	5	5	5	0	0	2015	5	2015-03-23 04:23:28.199445	2015-03-23 04:23:28.199445
5345	232	7	7	7	0	0	2015	7	2015-03-23 04:23:28.2277	2015-03-23 04:23:28.2277
5346	232	8	5	5	0	0	2015	5	2015-03-23 04:23:28.241385	2015-03-23 04:23:28.241385
5347	232	9	0	0	0	0	2015	0	2015-03-23 04:23:28.255046	2015-03-23 04:23:28.255046
4191	102	5	5	2.5	2.5	0	2015	5	\N	2015-10-08 08:56:36.77266
5339	232	1	5	3	2	0	2015	5	2015-03-23 04:23:28.093851	2015-04-27 05:29:46.671421
5316	229	5	5	4	1	0	2015	5	2015-03-05 08:03:58.618055	2015-12-30 08:02:23.906726
4870	170	9	1	1	0	0	2015	1	\N	2015-04-09 05:16:16.138045
4392	140	8	5	0	5	0	2015	5	\N	2015-09-16 05:26:00.781609
4007	95	1	5	1	4	0	2015	5	\N	2015-11-30 06:40:48.403031
5292	226	8	5	1	4	0	2015	5	2015-02-17 06:44:51.261017	2015-11-28 12:32:37.011235
4203	52	8	5	0	5	0	2015	5	\N	2015-12-24 11:18:01.667128
5296	227	3	7	5	2	0	2015	7	2015-02-19 04:21:28.47821	2015-11-05 09:29:36.545288
5181	211	5	5	0	5	0	2015	5	\N	2015-07-08 03:48:53.197635
4641	142	5	5	0.5	4.5	0	2015	5	\N	2015-09-14 07:37:39.445095
4754	160	1	5	0	5	0	2015	5	\N	2015-11-24 09:28:05.190879
5331	231	2	15	5	10	0	2015	15	2015-03-13 04:52:04.861982	2015-10-27 09:31:42.976774
4653	151	8	5	1	26	0	2015	5	\N	2015-10-07 07:39:33.938234
3864	45	2	15	2	13	0	2015	15	\N	2015-10-27 13:38:26.029057
5294	227	1	5	4	1	0	2015	5	2015-02-19 04:21:28.442375	2015-09-22 06:29:14.03688
5298	227	5	5	4	1	0	2015	5	2015-02-19 04:21:28.507128	2015-12-07 09:18:43.600715
4554	131	8	5	0	5	0	2015	5	\N	2015-12-21 12:19:56.53922
5313	229	2	15	3	12	0	2015	15	2015-03-05 08:03:58.576285	2015-12-30 08:03:01.136988
4812	176	5	5	1	4	0	2015	5	\N	2015-09-22 08:56:03.815467
4647	151	2	15	0	15	0	2015	15	\N	2015-11-24 09:28:56.544902
4430	133	1	5	0	5	0	2015	5	\N	2015-12-04 04:17:39.58077
5322	230	2	15	6	9	0	2015	15	2015-03-13 04:51:18.087625	2015-12-22 07:05:21.096512
5328	230	8	5	1	4	0	2015	5	2015-03-13 04:51:18.172905	2015-12-22 07:04:40.654643
5312	229	1	5	5	0	0	2015	5	2015-03-05 08:03:58.554389	2015-11-30 12:55:17.931368
5295	227	2	15	3	12	0	2015	15	2015-02-19 04:21:28.464532	2015-12-17 09:00:12.077984
5350	233	3	7	7	0	0	2015	7	2015-04-09 11:06:10.389629	2015-04-09 11:06:10.389629
5351	233	4	7	7	0	0	2015	7	2015-04-09 11:06:10.41858	2015-04-09 11:06:10.41858
5354	233	7	7	7	0	0	2015	7	2015-04-09 11:06:10.461369	2015-04-09 11:06:10.461369
5356	233	9	0	0	0	0	2015	0	2015-04-09 11:06:10.490196	2015-04-09 11:06:10.490196
5353	233	6	84	0	0	0	2015	0	2015-04-09 11:06:10.447734	2015-04-09 11:06:10.506939
5357	234	1	5	5	0	0	2015	5	2015-04-09 11:07:09.277669	2015-04-09 11:07:09.277669
5358	234	2	15	15	0	0	2015	15	2015-04-09 11:07:09.324465	2015-04-09 11:07:09.324465
5359	234	3	7	7	0	0	2015	7	2015-04-09 11:07:09.337734	2015-04-09 11:07:09.337734
5360	234	4	7	7	0	0	2015	7	2015-04-09 11:07:09.352657	2015-04-09 11:07:09.352657
5361	234	5	5	5	0	0	2015	5	2015-04-09 11:07:09.366889	2015-04-09 11:07:09.366889
5363	234	7	7	7	0	0	2015	7	2015-04-09 11:07:09.405537	2015-04-09 11:07:09.405537
5364	234	8	5	5	0	0	2015	5	2015-04-09 11:07:09.419458	2015-04-09 11:07:09.419458
5365	234	9	0	0	0	0	2015	0	2015-04-09 11:07:09.434431	2015-04-09 11:07:09.434431
5362	234	6	84	0	0	0	2015	0	2015-04-09 11:07:09.391602	2015-04-09 11:07:09.473818
5368	235	3	7	7	0	0	2015	7	2015-04-13 08:34:38.296761	2015-04-13 08:34:38.296761
5371	235	6	84	84	0	0	2015	84	2015-04-13 08:34:38.33958	2015-04-13 08:34:38.33958
5374	235	9	0	0	0	0	2015	0	2015-04-13 08:34:38.382429	2015-04-13 08:34:38.382429
5372	235	7	7	0	0	0	2015	0	2015-04-13 08:34:38.353532	2015-04-13 08:34:38.411262
5407	239	6	84	0	0	0	2015	0	2015-06-01 10:40:11.673423	2015-06-01 10:40:11.783206
4254	128	5	5	3	2	0	2015	5	\N	2015-04-15 14:00:45.361644
5375	236	1	5	5	0	0	2015	5	2015-04-20 06:44:13.817085	2015-04-20 06:44:13.817085
5376	236	2	15	15	0	0	2015	15	2015-04-20 06:44:13.837866	2015-04-20 06:44:13.837866
5377	236	3	7	7	0	0	2015	7	2015-04-20 06:44:13.865794	2015-04-20 06:44:13.865794
5378	236	4	7	7	0	0	2015	7	2015-04-20 06:44:13.89399	2015-04-20 06:44:13.89399
5379	236	5	5	5	0	0	2015	5	2015-04-20 06:44:13.922369	2015-04-20 06:44:13.922369
5381	236	7	7	7	0	0	2015	7	2015-04-20 06:44:13.977898	2015-04-20 06:44:13.977898
5382	236	8	5	5	0	0	2015	5	2015-04-20 06:44:14.006144	2015-04-20 06:44:14.006144
5383	236	9	0	0	0	0	2015	0	2015-04-20 06:44:14.033498	2015-04-20 06:44:14.033498
5380	236	6	84	0	0	0	2015	0	2015-04-20 06:44:13.949661	2015-04-20 06:44:14.064185
5187	213	2	15	10	5	0	2015	15	\N	2015-06-25 07:46:15.60754
5386	237	3	7	7	0	0	2015	7	2015-04-23 06:57:52.777093	2015-04-23 06:57:52.777093
5387	237	4	7	7	0	0	2015	7	2015-04-23 06:57:52.79167	2015-04-23 06:57:52.79167
5389	237	6	84	84	0	0	2015	84	2015-04-23 06:57:52.820925	2015-04-23 06:57:52.820925
5392	237	9	0	0	0	0	2015	0	2015-04-23 06:57:52.872143	2015-04-23 06:57:52.872143
5390	237	7	7	0	0	0	2015	0	2015-04-23 06:57:52.84389	2015-04-23 06:57:52.888586
5394	238	2	15	15	0	0	2015	15	2015-04-24 11:19:40.721201	2015-04-24 11:19:40.721201
5395	238	3	7	7	0	0	2015	7	2015-04-24 11:19:40.734475	2015-04-24 11:19:40.734475
5396	238	4	7	7	0	0	2015	7	2015-04-24 11:19:40.747915	2015-04-24 11:19:40.747915
5397	238	5	5	5	0	0	2015	5	2015-04-24 11:19:40.76243	2015-04-24 11:19:40.76243
5399	238	7	7	7	0	0	2015	7	2015-04-24 11:19:40.789436	2015-04-24 11:19:40.789436
5400	238	8	5	5	0	0	2015	5	2015-04-24 11:19:40.803911	2015-04-24 11:19:40.803911
5401	238	9	0	0	0	0	2015	0	2015-04-24 11:19:40.817451	2015-04-24 11:19:40.817451
5398	238	6	84	0	0	0	2015	0	2015-04-24 11:19:40.775925	2015-04-24 11:19:40.834909
5388	237	5	5	4	1	0	2015	5	2015-04-23 06:57:52.805329	2015-07-16 12:09:24.667269
5348	233	1	5	5	0	0	2015	5	2015-04-09 11:06:10.343595	2015-05-04 07:26:50.697837
5349	233	2	15	8	7	0	2015	15	2015-04-09 11:06:10.365912	2016-01-25 10:39:34.605
5393	238	1	5	3	2	0	2015	5	2015-04-24 11:19:40.676279	2015-11-30 12:23:18.137387
5411	240	1	5	5	0	0	2015	5	2015-06-02 05:43:42.514906	2015-06-02 05:43:42.514906
5412	240	2	15	15	0	0	2015	15	2015-06-02 05:43:42.530941	2015-06-02 05:43:42.530941
5384	237	1	5	4	1	0	2015	5	2015-04-23 06:57:52.749333	2015-12-18 03:57:04.536113
4974	191	5	5	1	4	0	2015	5	\N	2015-09-11 09:21:33.194145
5402	239	1	5	5	0	0	2015	5	2015-06-01 10:40:11.596575	2015-06-01 10:40:11.596575
5403	239	2	15	15	0	0	2015	15	2015-06-01 10:40:11.618616	2015-06-01 10:40:11.618616
5404	239	3	7	7	0	0	2015	7	2015-06-01 10:40:11.631827	2015-06-01 10:40:11.631827
5405	239	4	7	7	0	0	2015	7	2015-06-01 10:40:11.645384	2015-06-01 10:40:11.645384
5406	239	5	5	5	0	0	2015	5	2015-06-01 10:40:11.659868	2015-06-01 10:40:11.659868
5408	239	7	7	7	0	0	2015	7	2015-06-01 10:40:11.68693	2015-06-01 10:40:11.68693
5409	239	8	5	5	0	0	2015	5	2015-06-01 10:40:11.701343	2015-06-01 10:40:11.701343
5413	240	3	7	7	0	0	2015	7	2015-06-02 05:43:42.544136	2015-06-02 05:43:42.544136
5414	240	4	7	7	0	0	2015	7	2015-06-02 05:43:42.558922	2015-06-02 05:43:42.558922
5415	240	5	5	5	0	0	2015	5	2015-06-02 05:43:42.572324	2015-06-02 05:43:42.572324
5391	237	8	5	0	5	0	2015	5	2015-04-23 06:57:52.857493	2015-12-29 08:57:01.667787
5352	233	5	5	1	4	0	2015	5	2015-04-09 11:06:10.432414	2015-12-25 06:25:51.688181
3846	94	2	15	0	15	0	2015	15	\N	2015-09-30 08:02:45.953133
5373	235	8	5	1	4	0	2015	5	2015-04-13 08:34:38.368453	2015-11-09 09:54:30.928198
4896	188	8	5	0	5	0	2015	5	\N	2015-08-31 13:35:16.580507
5367	235	2	15	9	6	0	2015	15	2015-04-13 08:34:38.270895	2015-11-24 07:59:14.157792
5355	233	8	5	4	1	0	2015	5	2015-04-09 11:06:10.476412	2015-09-28 06:44:42.052493
3900	30	2	15	4	11	0	2015	15	\N	2015-09-29 05:20:34.629331
5385	237	2	15	5	10	0	2015	15	2015-04-23 06:57:52.763636	2015-10-05 06:06:59.358093
5034	178	2	15	0	15	0	2015	15	\N	2015-12-28 11:33:13.992805
5369	235	4	7	6	1	0	2015	7	2015-04-13 08:34:38.31077	2015-12-29 10:40:58.603801
5370	235	5	5	3	2	0	2015	5	2015-04-13 08:34:38.325643	2015-12-29 11:52:13.97472
5410	239	9	0	0	0	0	2015	0	2015-06-01 10:40:11.714934	2015-06-01 10:40:11.714934
39261	74	7	7	7	0	0	2017	7	2017-01-02 04:46:52.780024	2017-01-02 04:46:52.780024
39262	74	8	5	5	0	0	2017	5	2017-01-02 04:46:52.790091	2017-01-02 04:46:52.790091
39263	74	9	0	0	0	0	2017	0	2017-01-02 04:46:52.80008	2017-01-02 04:46:52.80008
5145	209	5	5	0	5	0	2015	5	\N	2015-11-30 07:34:01.161537
39269	51	6	84	84	0	0	2017	84	2017-01-02 04:46:52.880959	2017-01-02 04:46:52.880959
39273	64	1	5	5	0	0	2017	5	2017-01-02 04:46:52.976325	2017-01-02 04:46:52.976325
39274	64	2	15	15	0	0	2017	15	2017-01-02 04:46:52.990393	2017-01-02 04:46:52.990393
39275	64	3	7	7	0	0	2017	7	2017-01-02 04:46:53.000456	2017-01-02 04:46:53.000456
39276	64	4	7	7	0	0	2017	7	2017-01-02 04:46:53.010426	2017-01-02 04:46:53.010426
39277	64	5	5	5	0	0	2017	5	2017-01-02 04:46:53.020454	2017-01-02 04:46:53.020454
39279	64	7	7	7	0	0	2017	7	2017-01-02 04:46:53.041059	2017-01-02 04:46:53.041059
39280	64	8	5	5	0	0	2017	5	2017-01-02 04:46:53.050666	2017-01-02 04:46:53.050666
39281	64	9	0	0	0	0	2017	0	2017-01-02 04:46:53.060659	2017-01-02 04:46:53.060659
39282	102	1	5	5	0	0	2017	5	2017-01-02 04:46:53.070872	2017-01-02 04:46:53.070872
39283	102	2	15	15	0	0	2017	15	2017-01-02 04:46:53.080835	2017-01-02 04:46:53.080835
39284	102	3	7	7	0	0	2017	7	2017-01-02 04:46:53.09094	2017-01-02 04:46:53.09094
39285	102	4	7	7	0	0	2017	7	2017-01-02 04:46:53.100887	2017-01-02 04:46:53.100887
39286	102	5	5	5	0	0	2017	5	2017-01-02 04:46:53.110864	2017-01-02 04:46:53.110864
39288	102	7	7	7	0	0	2017	7	2017-01-02 04:46:53.130771	2017-01-02 04:46:53.130771
39289	102	8	5	5	0	0	2017	5	2017-01-02 04:46:53.140785	2017-01-02 04:46:53.140785
39290	102	9	0	0	0	0	2017	0	2017-01-02 04:46:53.150763	2017-01-02 04:46:53.150763
39291	29	1	5	5	0	0	2017	5	2017-01-02 04:46:53.160833	2017-01-02 04:46:53.160833
39292	29	2	15	15	0	0	2017	15	2017-01-02 04:46:53.170822	2017-01-02 04:46:53.170822
39293	29	3	7	7	0	0	2017	7	2017-01-02 04:46:53.180918	2017-01-02 04:46:53.180918
39294	29	4	7	7	0	0	2017	7	2017-01-02 04:46:53.190906	2017-01-02 04:46:53.190906
39295	29	5	5	5	0	0	2017	5	2017-01-02 04:46:53.200962	2017-01-02 04:46:53.200962
39297	29	7	7	7	0	0	2017	7	2017-01-02 04:46:53.221116	2017-01-02 04:46:53.221116
39298	29	8	5	5	0	0	2017	5	2017-01-02 04:46:53.231134	2017-01-02 04:46:53.231134
39299	29	9	0	0	0	0	2017	0	2017-01-02 04:46:53.24116	2017-01-02 04:46:53.24116
39300	46	1	5	5	0	0	2017	5	2017-01-02 04:46:53.251175	2017-01-02 04:46:53.251175
39301	46	2	15	15	0	0	2017	15	2017-01-02 04:46:53.261223	2017-01-02 04:46:53.261223
39302	46	3	7	7	0	0	2017	7	2017-01-02 04:46:53.271234	2017-01-02 04:46:53.271234
39303	46	4	7	7	0	0	2017	7	2017-01-02 04:46:53.281237	2017-01-02 04:46:53.281237
39304	46	5	5	5	0	0	2017	5	2017-01-02 04:46:53.291301	2017-01-02 04:46:53.291301
39306	46	7	7	7	0	0	2017	7	2017-01-02 04:46:53.311359	2017-01-02 04:46:53.311359
39307	46	8	5	5	0	0	2017	5	2017-01-02 04:46:53.321412	2017-01-02 04:46:53.321412
39308	46	9	0	0	0	0	2017	0	2017-01-02 04:46:53.331463	2017-01-02 04:46:53.331463
39309	28	1	5	5	0	0	2017	5	2017-01-02 04:46:53.341451	2017-01-02 04:46:53.341451
39310	28	2	15	15	0	0	2017	15	2017-01-02 04:46:53.351527	2017-01-02 04:46:53.351527
39311	28	3	7	7	0	0	2017	7	2017-01-02 04:46:53.361498	2017-01-02 04:46:53.361498
39312	28	4	7	7	0	0	2017	7	2017-01-02 04:46:53.371553	2017-01-02 04:46:53.371553
39313	28	5	5	5	0	0	2017	5	2017-01-02 04:46:53.38156	2017-01-02 04:46:53.38156
39315	28	7	7	7	0	0	2017	7	2017-01-02 04:46:53.401602	2017-01-02 04:46:53.401602
39316	28	8	5	5	0	0	2017	5	2017-01-02 04:46:53.411624	2017-01-02 04:46:53.411624
39317	28	9	0	0	0	0	2017	0	2017-01-02 04:46:53.421615	2017-01-02 04:46:53.421615
39318	68	1	5	5	0	0	2017	5	2017-01-02 04:46:53.431705	2017-01-02 04:46:53.431705
39319	68	2	15	15	0	0	2017	15	2017-01-02 04:46:53.441683	2017-01-02 04:46:53.441683
39320	68	3	7	7	0	0	2017	7	2017-01-02 04:46:53.451718	2017-01-02 04:46:53.451718
39321	68	4	7	7	0	0	2017	7	2017-01-02 04:46:53.461716	2017-01-02 04:46:53.461716
39322	68	5	5	5	0	0	2017	5	2017-01-02 04:46:53.471823	2017-01-02 04:46:53.471823
39324	68	7	7	7	0	0	2017	7	2017-01-02 04:46:53.491896	2017-01-02 04:46:53.491896
39325	68	8	5	5	0	0	2017	5	2017-01-02 04:46:53.501893	2017-01-02 04:46:53.501893
39326	68	9	0	0	0	0	2017	0	2017-01-02 04:46:53.511927	2017-01-02 04:46:53.511927
39327	106	1	5	5	0	0	2017	5	2017-01-02 04:46:53.522038	2017-01-02 04:46:53.522038
39328	106	2	15	15	0	0	2017	15	2017-01-02 04:46:53.531785	2017-01-02 04:46:53.531785
39329	106	3	7	7	0	0	2017	7	2017-01-02 04:46:53.541812	2017-01-02 04:46:53.541812
39330	106	4	7	7	0	0	2017	7	2017-01-02 04:46:53.551873	2017-01-02 04:46:53.551873
39331	106	5	5	5	0	0	2017	5	2017-01-02 04:46:53.561887	2017-01-02 04:46:53.561887
39332	106	6	84	84	0	0	2017	84	2017-01-02 04:46:53.571924	2017-01-02 04:46:53.571924
39333	106	7	7	0	0	0	2017	0	2017-01-02 04:46:53.582031	2017-01-02 04:47:22.159537
39278	64	6	84	0	0	0	2017	0	2017-01-02 04:46:53.0306	2017-01-02 04:47:24.103424
39287	102	6	84	0	0	0	2017	0	2017-01-02 04:46:53.120773	2017-01-02 04:47:24.123381
39296	29	6	84	0	0	0	2017	0	2017-01-02 04:46:53.211035	2017-01-02 04:47:24.143453
39305	46	6	84	0	0	0	2017	0	2017-01-02 04:46:53.301335	2017-01-02 04:47:24.163399
39314	28	6	84	0	0	0	2017	0	2017-01-02 04:46:53.391593	2017-01-02 04:47:24.183454
39323	68	6	84	0	0	0	2017	0	2017-01-02 04:46:53.481852	2017-01-02 04:47:24.203493
39265	51	2	15	11	4	0	2017	15	2017-01-02 04:46:52.820206	2017-07-27 10:11:28.967891
39272	51	9	1	0	1	0	2017	1	2017-01-02 04:46:52.91076	2017-03-20 11:36:40.190009
39268	51	5	5	2.5	2.5	0	2017	5	2017-01-02 04:46:52.852433	2017-08-16 11:01:21.162343
39266	51	3	7	4	3	0	2017	7	2017-01-02 04:46:52.830193	2017-07-10 12:44:24.269257
39271	51	8	5	2	3	0	2017	5	2017-01-02 04:46:52.900776	2017-06-21 05:56:10.463126
39267	51	4	7	6	1	0	2017	7	2017-01-02 04:46:52.840252	2017-07-19 14:23:18.204589
39264	51	1	5	3	2	0	2017	5	2017-01-02 04:46:52.810171	2017-07-27 10:09:48.348638
5417	240	7	7	7	0	0	2015	7	2015-06-02 05:43:42.600555	2015-06-02 05:43:42.600555
5418	240	8	5	5	0	0	2015	5	2015-06-02 05:43:42.614463	2015-06-02 05:43:42.614463
5419	240	9	0	0	0	0	2015	0	2015-06-02 05:43:42.637312	2015-06-02 05:43:42.637312
5416	240	6	84	0	0	0	2015	0	2015-06-02 05:43:42.585777	2015-06-02 05:43:42.665231
3727	71	9	1	0	1	0	2015	1	\N	2015-06-03 09:12:28.84329
5420	241	1	5	5	0	0	2015	5	2015-06-09 09:46:15.220903	2015-06-09 09:46:15.220903
5422	241	3	7	7	0	0	2015	7	2015-06-09 09:46:15.256893	2015-06-09 09:46:15.256893
5423	241	4	7	7	0	0	2015	7	2015-06-09 09:46:15.270818	2015-06-09 09:46:15.270818
5424	241	5	5	5	0	0	2015	5	2015-06-09 09:46:15.285595	2015-06-09 09:46:15.285595
5426	241	7	7	7	0	0	2015	7	2015-06-09 09:46:15.314638	2015-06-09 09:46:15.314638
5427	241	8	5	5	0	0	2015	5	2015-06-09 09:46:15.328492	2015-06-09 09:46:15.328492
5428	241	9	0	0	0	0	2015	0	2015-06-09 09:46:15.342528	2015-06-09 09:46:15.342528
5425	241	6	84	0	0	0	2015	0	2015-06-09 09:46:15.299576	2015-06-09 09:46:15.381339
39334	106	8	5	5	0	0	2017	5	2017-01-02 04:46:53.592067	2017-01-02 04:46:53.592067
5431	242	3	7	7	0	0	2015	7	2015-06-16 09:10:25.463021	2015-06-16 09:10:25.463021
5432	242	4	7	7	0	0	2015	7	2015-06-16 09:10:25.476635	2015-06-16 09:10:25.476635
5435	242	7	7	7	0	0	2015	7	2015-06-16 09:10:25.518549	2015-06-16 09:10:25.518549
5437	242	9	0	0	0	0	2015	0	2015-06-16 09:10:25.546824	2015-06-16 09:10:25.546824
5434	242	6	84	0	0	0	2015	0	2015-06-16 09:10:25.504916	2015-06-16 09:10:25.562677
5438	243	1	5	5	0	0	2015	5	2015-06-17 10:18:50.42781	2015-06-17 10:18:50.42781
5439	243	2	15	15	0	0	2015	15	2015-06-17 10:18:50.451632	2015-06-17 10:18:50.451632
5440	243	3	7	7	0	0	2015	7	2015-06-17 10:18:50.466689	2015-06-17 10:18:50.466689
5441	243	4	7	7	0	0	2015	7	2015-06-17 10:18:50.489498	2015-06-17 10:18:50.489498
5442	243	5	5	5	0	0	2015	5	2015-06-17 10:18:50.503003	2015-06-17 10:18:50.503003
5443	243	6	84	84	0	0	2015	84	2015-06-17 10:18:50.517508	2015-06-17 10:18:50.517508
5445	243	8	5	5	0	0	2015	5	2015-06-17 10:18:50.572587	2015-06-17 10:18:50.572587
5446	243	9	0	0	0	0	2015	0	2015-06-17 10:18:50.600541	2015-06-17 10:18:50.600541
5444	243	7	7	0	0	0	2015	0	2015-06-17 10:18:50.544546	2015-06-17 10:18:50.616376
5447	244	1	5	5	0	0	2015	5	2015-06-17 10:20:46.266151	2015-06-17 10:20:46.266151
5448	244	2	15	15	0	0	2015	15	2015-06-17 10:20:46.28189	2015-06-17 10:20:46.28189
5449	244	3	7	7	0	0	2015	7	2015-06-17 10:20:46.29522	2015-06-17 10:20:46.29522
5450	244	4	7	7	0	0	2015	7	2015-06-17 10:20:46.309706	2015-06-17 10:20:46.309706
5451	244	5	5	5	0	0	2015	5	2015-06-17 10:20:46.323233	2015-06-17 10:20:46.323233
5452	244	6	84	84	0	0	2015	84	2015-06-17 10:20:46.336756	2015-06-17 10:20:46.336756
5454	244	8	5	5	0	0	2015	5	2015-06-17 10:20:46.364722	2015-06-17 10:20:46.364722
5455	244	9	0	0	0	0	2015	0	2015-06-17 10:20:46.378242	2015-06-17 10:20:46.378242
5453	244	7	7	0	0	0	2015	0	2015-06-17 10:20:46.351223	2015-06-17 10:20:46.394863
5458	245	3	7	7	0	0	2015	7	2015-06-17 10:21:08.782215	2015-06-17 10:21:08.782215
5459	245	4	7	7	0	0	2015	7	2015-06-17 10:21:08.797109	2015-06-17 10:21:08.797109
5462	245	7	7	7	0	0	2015	7	2015-06-17 10:21:08.839944	2015-06-17 10:21:08.839944
5464	245	9	0	0	0	0	2015	0	2015-06-17 10:21:08.868838	2015-06-17 10:21:08.868838
5461	245	6	84	0	0	0	2015	0	2015-06-17 10:21:08.825037	2015-06-17 10:21:08.886074
5467	246	3	7	7	0	0	2015	7	2015-06-17 10:21:32.765432	2015-06-17 10:21:32.765432
5468	246	4	7	7	0	0	2015	7	2015-06-17 10:21:32.834941	2015-06-17 10:21:32.834941
5471	246	7	7	7	0	0	2015	7	2015-06-17 10:21:32.921765	2015-06-17 10:21:32.921765
5472	246	8	5	5	0	0	2015	5	2015-06-17 10:21:32.935692	2015-06-17 10:21:32.935692
5473	246	9	0	0	0	0	2015	0	2015-06-17 10:21:32.95063	2015-06-17 10:21:32.95063
5470	246	6	84	0	0	0	2015	0	2015-06-17 10:21:32.907802	2015-06-17 10:21:32.967396
5474	247	1	5	5	0	0	2015	5	2015-06-17 10:21:59.02501	2015-06-17 10:21:59.02501
5476	247	3	7	7	0	0	2015	7	2015-06-17 10:21:59.056144	2015-06-17 10:21:59.056144
5477	247	4	7	7	0	0	2015	7	2015-06-17 10:21:59.070058	2015-06-17 10:21:59.070058
5478	247	5	5	5	0	0	2015	5	2015-06-17 10:21:59.08503	2015-06-17 10:21:59.08503
5480	247	7	7	7	0	0	2015	7	2015-06-17 10:21:59.113856	2015-06-17 10:21:59.113856
5481	247	8	5	5	0	0	2015	5	2015-06-17 10:21:59.127837	2015-06-17 10:21:59.127837
5482	247	9	0	0	0	0	2015	0	2015-06-17 10:21:59.141736	2015-06-17 10:21:59.141736
5479	247	6	84	0	0	0	2015	0	2015-06-17 10:21:59.09895	2015-06-17 10:21:59.170534
5483	248	1	5	5	0	0	2015	5	2015-06-17 10:22:13.897592	2015-06-17 10:22:13.897592
5486	248	4	7	7	0	0	2015	7	2015-06-17 10:22:13.951298	2015-06-17 10:22:13.951298
5488	248	6	84	0	0	0	2015	0	2015-06-17 10:22:13.979211	2015-06-17 10:22:14.061011
5501	250	1	5	5	0	0	2015	5	2015-06-23 04:43:36.168331	2015-06-23 04:43:36.168331
5421	241	2	15	12	3	0	2015	15	2015-06-09 09:46:15.243225	2015-07-29 02:43:06.420996
5485	248	3	7	5	2	0	2015	7	2015-06-17 10:22:13.9364	2015-10-05 13:46:23.991654
5460	245	5	5	4.5	0.5	0	2015	5	2015-06-17 10:21:08.811066	2015-12-24 09:47:33.849081
5436	242	8	5	1	4	0	2015	5	2015-06-16 09:10:25.532215	2015-12-16 08:24:31.332408
5469	246	5	5	4.5	0.5	0	2015	5	2015-06-17 10:21:32.892893	2015-09-08 09:44:02.93648
5475	247	2	15	14	1	0	2015	15	2015-06-17 10:21:59.042427	2015-11-05 05:28:52.575004
5433	242	5	5	0.5	4.5	0	2015	5	2015-06-16 09:10:25.49028	2015-12-02 06:58:52.510066
5466	246	2	15	13	2	0	2015	15	2015-06-17 10:21:32.750644	2015-12-21 13:10:46.746335
5463	245	8	5	3	2	0	2015	5	2015-06-17 10:21:08.85389	2015-12-30 14:18:46.094191
5484	248	2	15	13	2	0	2015	15	2015-06-17 10:22:13.922586	2015-12-24 08:39:18.139845
5487	248	5	5	4	1	0	2015	5	2015-06-17 10:22:13.965221	2015-12-24 08:39:43.116489
5429	242	1	5	3	2	0	2015	5	2015-06-16 09:10:25.426732	2015-12-31 02:00:51.766135
5465	246	1	5	4	1	0	2015	5	2015-06-17 10:21:32.735527	2015-12-29 05:41:10.296414
5456	245	1	5	1	4	0	2015	5	2015-06-17 10:21:08.75337	2015-12-30 14:18:02.280493
5489	248	7	7	7	0	0	2015	7	2015-06-17 10:22:13.994222	2015-06-17 10:22:13.994222
5491	248	9	0	0	0	0	2015	0	2015-06-17 10:22:14.022011	2015-06-17 10:22:14.022011
5494	249	3	7	7	0	0	2015	7	2015-06-23 04:42:37.707804	2015-06-23 04:42:37.707804
5495	249	4	7	7	0	0	2015	7	2015-06-23 04:42:37.72246	2015-06-23 04:42:37.72246
5498	249	7	7	7	0	0	2015	7	2015-06-23 04:42:37.765362	2015-06-23 04:42:37.765362
5500	249	9	0	0	0	0	2015	0	2015-06-23 04:42:37.80194	2015-06-23 04:42:37.80194
5497	249	6	84	0	0	0	2015	0	2015-06-23 04:42:37.749693	2015-06-23 04:42:37.819364
5492	249	1	5	4	1	0	2015	5	2015-06-23 04:42:37.679511	2015-07-28 05:08:39.388818
5366	235	1	5	0	5	0	2015	5	2015-04-13 08:34:38.252344	2015-08-31 06:43:55.316385
39335	106	9	0	0	0	0	2017	0	2017-01-02 04:46:53.602077	2017-01-02 04:46:53.602077
5496	249	5	5	4	1	0	2015	5	2015-06-23 04:42:37.73607	2015-12-24 06:55:38.365182
5499	249	8	5	3	2	0	2015	5	2015-06-23 04:42:37.788369	2015-12-24 06:57:07.842199
5493	249	2	15	14	1	0	2015	15	2015-06-23 04:42:37.694342	2015-12-24 07:00:21.553549
5490	248	8	5	4	1	0	2015	5	2015-06-17 10:22:14.008168	2015-12-24 08:40:01.817474
39336	100	1	5	5	0	0	2017	5	2017-01-02 04:46:53.61215	2017-01-02 04:46:53.61215
39337	100	2	15	15	0	0	2017	15	2017-01-02 04:46:53.622195	2017-01-02 04:46:53.622195
39338	100	3	7	7	0	0	2017	7	2017-01-02 04:46:53.632181	2017-01-02 04:46:53.632181
39339	100	4	7	7	0	0	2017	7	2017-01-02 04:46:53.642228	2017-01-02 04:46:53.642228
39340	100	5	5	5	0	0	2017	5	2017-01-02 04:46:53.65224	2017-01-02 04:46:53.65224
39342	100	7	7	7	0	0	2017	7	2017-01-02 04:46:53.67229	2017-01-02 04:46:53.67229
39343	100	8	5	5	0	0	2017	5	2017-01-02 04:46:53.682306	2017-01-02 04:46:53.682306
39344	100	9	0	0	0	0	2017	0	2017-01-02 04:46:53.692337	2017-01-02 04:46:53.692337
39345	79	1	5	5	0	0	2017	5	2017-01-02 04:46:53.702375	2017-01-02 04:46:53.702375
39346	79	2	15	15	0	0	2017	15	2017-01-02 04:46:53.712362	2017-01-02 04:46:53.712362
39347	79	3	7	7	0	0	2017	7	2017-01-02 04:46:53.722394	2017-01-02 04:46:53.722394
39348	79	4	7	7	0	0	2017	7	2017-01-02 04:46:53.732393	2017-01-02 04:46:53.732393
39349	79	5	5	5	0	0	2017	5	2017-01-02 04:46:53.742519	2017-01-02 04:46:53.742519
39351	79	7	7	7	0	0	2017	7	2017-01-02 04:46:53.762573	2017-01-02 04:46:53.762573
39352	79	8	5	5	0	0	2017	5	2017-01-02 04:46:53.772543	2017-01-02 04:46:53.772543
39353	79	9	0	0	0	0	2017	0	2017-01-02 04:46:53.782594	2017-01-02 04:46:53.782594
39354	80	1	5	5	0	0	2017	5	2017-01-02 04:46:53.792579	2017-01-02 04:46:53.792579
39355	80	2	15	15	0	0	2017	15	2017-01-02 04:46:53.802678	2017-01-02 04:46:53.802678
39356	80	3	7	7	0	0	2017	7	2017-01-02 04:46:53.812667	2017-01-02 04:46:53.812667
39357	80	4	7	7	0	0	2017	7	2017-01-02 04:46:53.8227	2017-01-02 04:46:53.8227
39358	80	5	5	5	0	0	2017	5	2017-01-02 04:46:53.832715	2017-01-02 04:46:53.832715
39360	80	7	7	7	0	0	2017	7	2017-01-02 04:46:53.852791	2017-01-02 04:46:53.852791
39361	80	8	5	5	0	0	2017	5	2017-01-02 04:46:53.862802	2017-01-02 04:46:53.862802
39362	80	9	0	0	0	0	2017	0	2017-01-02 04:46:53.872856	2017-01-02 04:46:53.872856
39363	85	1	5	5	0	0	2017	5	2017-01-02 04:46:53.882849	2017-01-02 04:46:53.882849
39364	85	2	15	15	0	0	2017	15	2017-01-02 04:46:53.892879	2017-01-02 04:46:53.892879
39365	85	3	7	7	0	0	2017	7	2017-01-02 04:46:53.902917	2017-01-02 04:46:53.902917
39366	85	4	7	7	0	0	2017	7	2017-01-02 04:46:53.912937	2017-01-02 04:46:53.912937
39367	85	5	5	5	0	0	2017	5	2017-01-02 04:46:53.922967	2017-01-02 04:46:53.922967
39368	85	6	84	84	0	0	2017	84	2017-01-02 04:46:53.932998	2017-01-02 04:46:53.932998
39370	85	8	5	5	0	0	2017	5	2017-01-02 04:46:53.953058	2017-01-02 04:46:53.953058
39371	85	9	0	0	0	0	2017	0	2017-01-02 04:46:53.963058	2017-01-02 04:46:53.963058
39374	31	3	7	7	0	0	2017	7	2017-01-02 04:46:53.993147	2017-01-02 04:46:53.993147
39375	31	4	7	7	0	0	2017	7	2017-01-02 04:46:54.003161	2017-01-02 04:46:54.003161
39378	31	7	7	7	0	0	2017	7	2017-01-02 04:46:54.033313	2017-01-02 04:46:54.033313
39380	31	9	0	0	0	0	2017	0	2017-01-02 04:46:54.053327	2017-01-02 04:46:54.053327
39381	103	1	5	5	0	0	2017	5	2017-01-02 04:46:54.063387	2017-01-02 04:46:54.063387
39382	103	2	15	15	0	0	2017	15	2017-01-02 04:46:54.073377	2017-01-02 04:46:54.073377
39383	103	3	7	7	0	0	2017	7	2017-01-02 04:46:54.083407	2017-01-02 04:46:54.083407
39384	103	4	7	7	0	0	2017	7	2017-01-02 04:46:54.093435	2017-01-02 04:46:54.093435
39385	103	5	5	5	0	0	2017	5	2017-01-02 04:46:54.103461	2017-01-02 04:46:54.103461
39387	103	7	7	7	0	0	2017	7	2017-01-02 04:46:54.123546	2017-01-02 04:46:54.123546
39388	103	8	5	5	0	0	2017	5	2017-01-02 04:46:54.133539	2017-01-02 04:46:54.133539
39389	103	9	0	0	0	0	2017	0	2017-01-02 04:46:54.14355	2017-01-02 04:46:54.14355
39390	95	1	5	5	0	0	2017	5	2017-01-02 04:46:54.153591	2017-01-02 04:46:54.153591
39391	95	2	15	15	0	0	2017	15	2017-01-02 04:46:54.163595	2017-01-02 04:46:54.163595
39392	95	3	7	7	0	0	2017	7	2017-01-02 04:46:54.173606	2017-01-02 04:46:54.173606
39393	95	4	7	7	0	0	2017	7	2017-01-02 04:46:54.183687	2017-01-02 04:46:54.183687
39394	95	5	5	5	0	0	2017	5	2017-01-02 04:46:54.193696	2017-01-02 04:46:54.193696
39396	95	7	7	7	0	0	2017	7	2017-01-02 04:46:54.213729	2017-01-02 04:46:54.213729
39341	100	6	84	0	0	0	2017	0	2017-01-02 04:46:53.662249	2017-01-02 04:47:24.22359
39350	79	6	84	0	0	0	2017	0	2017-01-02 04:46:53.752502	2017-01-02 04:47:24.243519
39359	80	6	84	0	0	0	2017	0	2017-01-02 04:46:53.842763	2017-01-02 04:47:24.263602
39377	31	6	84	0	0	0	2017	0	2017-01-02 04:46:54.023257	2017-01-02 04:47:24.283679
39386	103	6	84	0	0	0	2017	0	2017-01-02 04:46:54.113479	2017-01-02 04:47:24.303759
39395	95	6	84	0	0	0	2017	0	2017-01-02 04:46:54.203723	2017-01-02 04:47:24.323778
39373	31	2	15	4	11	0	2017	15	2017-01-02 04:46:53.983106	2017-06-19 13:03:35.226632
39379	31	8	5	4	1	0	2017	5	2017-01-02 04:46:54.043317	2017-08-11 11:35:21.603393
39372	31	1	5	2	3	0	2017	5	2017-01-02 04:46:53.973098	2017-03-01 09:18:31.663923
5503	250	3	7	7	0	0	2015	7	2015-06-23 04:43:36.204933	2015-06-23 04:43:36.204933
5504	250	4	7	7	0	0	2015	7	2015-06-23 04:43:36.21971	2015-06-23 04:43:36.21971
5507	250	7	7	7	0	0	2015	7	2015-06-23 04:43:36.261442	2015-06-23 04:43:36.261442
5508	250	8	5	5	0	0	2015	5	2015-06-23 04:43:36.275113	2015-06-23 04:43:36.275113
5509	250	9	0	0	0	0	2015	0	2015-06-23 04:43:36.288783	2015-06-23 04:43:36.288783
5506	250	6	84	0	0	0	2015	0	2015-06-23 04:43:36.246868	2015-06-23 04:43:36.305942
5505	250	5	5	4	1	0	2015	5	2015-06-23 04:43:36.23319	2015-11-30 11:37:50.356123
39397	95	8	5	5	0	0	2017	5	2017-01-02 04:46:54.230222	2017-01-02 04:46:54.230222
5502	250	2	15	12	3	0	2015	15	2015-06-23 04:43:36.191292	2015-12-23 13:18:17.822714
39398	95	9	0	0	0	0	2017	0	2017-01-02 04:46:54.243815	2017-01-02 04:46:54.243815
39399	56	1	5	5	0	0	2017	5	2017-01-02 04:46:54.253837	2017-01-02 04:46:54.253837
39400	56	2	15	15	0	0	2017	15	2017-01-02 04:46:54.263808	2017-01-02 04:46:54.263808
39401	56	3	7	7	0	0	2017	7	2017-01-02 04:46:54.286031	2017-01-02 04:46:54.286031
39402	56	4	7	7	0	0	2017	7	2017-01-02 04:46:54.304653	2017-01-02 04:46:54.304653
39403	56	5	5	5	0	0	2017	5	2017-01-02 04:46:54.314533	2017-01-02 04:46:54.314533
39405	56	7	7	7	0	0	2017	7	2017-01-02 04:46:54.334508	2017-01-02 04:46:54.334508
39406	56	8	5	5	0	0	2017	5	2017-01-02 04:46:54.344439	2017-01-02 04:46:54.344439
39407	56	9	0	0	0	0	2017	0	2017-01-02 04:46:54.354518	2017-01-02 04:46:54.354518
39408	37	1	5	5	0	0	2017	5	2017-01-02 04:46:54.36451	2017-01-02 04:46:54.36451
39409	37	2	15	15	0	0	2017	15	2017-01-02 04:46:54.374386	2017-01-02 04:46:54.374386
39410	37	3	7	7	0	0	2017	7	2017-01-02 04:46:54.384348	2017-01-02 04:46:54.384348
39411	37	4	7	7	0	0	2017	7	2017-01-02 04:46:54.394402	2017-01-02 04:46:54.394402
39412	37	5	5	5	0	0	2017	5	2017-01-02 04:46:54.404505	2017-01-02 04:46:54.404505
39414	37	7	7	7	0	0	2017	7	2017-01-02 04:46:54.424511	2017-01-02 04:46:54.424511
39415	37	8	5	5	0	0	2017	5	2017-01-02 04:46:54.434394	2017-01-02 04:46:54.434394
39416	37	9	0	0	0	0	2017	0	2017-01-02 04:46:54.444432	2017-01-02 04:46:54.444432
39417	104	1	5	5	0	0	2017	5	2017-01-02 04:46:54.454463	2017-01-02 04:46:54.454463
39418	104	2	15	15	0	0	2017	15	2017-01-02 04:46:54.464305	2017-01-02 04:46:54.464305
39419	104	3	7	7	0	0	2017	7	2017-01-02 04:46:54.474317	2017-01-02 04:46:54.474317
39420	104	4	7	7	0	0	2017	7	2017-01-02 04:46:54.484324	2017-01-02 04:46:54.484324
39421	104	5	5	5	0	0	2017	5	2017-01-02 04:46:54.494352	2017-01-02 04:46:54.494352
39423	104	7	7	7	0	0	2017	7	2017-01-02 04:46:54.514522	2017-01-02 04:46:54.514522
39424	104	8	5	5	0	0	2017	5	2017-01-02 04:46:54.524551	2017-01-02 04:46:54.524551
39425	104	9	0	0	0	0	2017	0	2017-01-02 04:46:54.534477	2017-01-02 04:46:54.534477
39426	90	1	5	5	0	0	2017	5	2017-01-02 04:46:54.544797	2017-01-02 04:46:54.544797
39427	90	2	15	15	0	0	2017	15	2017-01-02 04:46:54.554679	2017-01-02 04:46:54.554679
39428	90	3	7	7	0	0	2017	7	2017-01-02 04:46:54.56455	2017-01-02 04:46:54.56455
39429	90	4	7	7	0	0	2017	7	2017-01-02 04:46:54.596247	2017-01-02 04:46:54.596247
39430	90	5	5	5	0	0	2017	5	2017-01-02 04:46:54.605186	2017-01-02 04:46:54.605186
39432	90	7	7	7	0	0	2017	7	2017-01-02 04:46:54.625049	2017-01-02 04:46:54.625049
39433	90	8	5	5	0	0	2017	5	2017-01-02 04:46:54.635157	2017-01-02 04:46:54.635157
39434	90	9	0	0	0	0	2017	0	2017-01-02 04:46:54.645009	2017-01-02 04:46:54.645009
39435	49	1	5	5	0	0	2017	5	2017-01-02 04:46:54.655026	2017-01-02 04:46:54.655026
39437	49	3	7	7	0	0	2017	7	2017-01-02 04:46:54.675	2017-01-02 04:46:54.675
39438	49	4	7	7	0	0	2017	7	2017-01-02 04:46:54.684999	2017-01-02 04:46:54.684999
39441	49	7	7	7	0	0	2017	7	2017-01-02 04:46:54.715046	2017-01-02 04:46:54.715046
39443	49	9	0	0	0	0	2017	0	2017-01-02 04:46:54.735085	2017-01-02 04:46:54.735085
39444	89	1	5	5	0	0	2017	5	2017-01-02 04:46:54.745151	2017-01-02 04:46:54.745151
39445	89	2	15	15	0	0	2017	15	2017-01-02 04:46:54.755115	2017-01-02 04:46:54.755115
39446	89	3	7	7	0	0	2017	7	2017-01-02 04:46:54.765228	2017-01-02 04:46:54.765228
39447	89	4	7	7	0	0	2017	7	2017-01-02 04:46:54.775192	2017-01-02 04:46:54.775192
39448	89	5	5	5	0	0	2017	5	2017-01-02 04:46:54.785207	2017-01-02 04:46:54.785207
39450	89	7	7	7	0	0	2017	7	2017-01-02 04:46:54.805298	2017-01-02 04:46:54.805298
39451	89	8	5	5	0	0	2017	5	2017-01-02 04:46:54.815307	2017-01-02 04:46:54.815307
39452	89	9	0	0	0	0	2017	0	2017-01-02 04:46:54.825325	2017-01-02 04:46:54.825325
39456	72	4	7	7	0	0	2017	7	2017-01-02 04:46:54.86601	2017-01-02 04:46:54.86601
39459	72	7	7	7	0	0	2017	7	2017-01-02 04:46:54.895923	2017-01-02 04:46:54.895923
39461	72	9	0	0	0	0	2017	0	2017-01-02 04:46:54.915847	2017-01-02 04:46:54.915847
39462	101	1	5	5	0	0	2017	5	2017-01-02 04:46:54.925836	2017-01-02 04:46:54.925836
39463	101	2	15	15	0	0	2017	15	2017-01-02 04:46:54.935884	2017-01-02 04:46:54.935884
39413	37	6	84	0	0	0	2017	0	2017-01-02 04:46:54.414406	2017-01-02 04:47:24.363881
39422	104	6	84	0	0	0	2017	0	2017-01-02 04:46:54.504403	2017-01-02 04:47:24.383923
39431	90	6	84	0	0	0	2017	0	2017-01-02 04:46:54.615136	2017-01-02 04:47:24.403948
39440	49	6	84	0	0	0	2017	0	2017-01-02 04:46:54.705024	2017-01-02 04:47:24.423993
39449	89	6	84	0	0	0	2017	0	2017-01-02 04:46:54.795286	2017-01-02 04:47:24.443989
39458	72	6	84	0	0	0	2017	0	2017-01-02 04:46:54.885881	2017-01-02 04:47:24.464049
39454	72	2	15	1	14	0	2017	15	2017-01-02 04:46:54.846159	2017-05-15 06:27:24.038048
39439	49	5	5	3	2	0	2017	5	2017-01-02 04:46:54.695632	2017-04-05 07:15:45.116369
39455	72	3	7	3	4	0	2017	7	2017-01-02 04:46:54.856146	2017-07-18 12:30:43.62113
39442	49	8	5	4	1	0	2017	5	2017-01-02 04:46:54.725106	2017-03-07 09:25:45.298514
39436	49	2	15	11	4	0	2017	15	2017-01-02 04:46:54.66501	2017-08-09 05:21:48.023578
39453	72	1	5	3	2	0	2017	5	2017-01-02 04:46:54.835365	2017-08-16 07:52:15.767362
39457	72	5	5	0	5	0	2017	5	2017-01-02 04:46:54.875943	2017-06-15 08:46:44.45192
39464	101	3	7	7	0	0	2017	7	2017-01-02 04:46:54.9458	2017-01-02 04:46:54.9458
39465	101	4	7	7	0	0	2017	7	2017-01-02 04:46:54.955857	2017-01-02 04:46:54.955857
39466	101	5	5	5	0	0	2017	5	2017-01-02 04:46:54.96579	2017-01-02 04:46:54.96579
3984	51	5	5	0	5	0	2015	5	\N	2015-09-02 07:16:45.484157
39468	101	7	7	7	0	0	2017	7	2017-01-02 04:46:54.985792	2017-01-02 04:46:54.985792
39469	101	8	5	5	0	0	2017	5	2017-01-02 04:46:54.995835	2017-01-02 04:46:54.995835
39470	101	9	0	0	0	0	2017	0	2017-01-02 04:46:55.00583	2017-01-02 04:46:55.00583
39473	52	3	7	7	0	0	2017	7	2017-01-02 04:46:55.03662	2017-01-02 04:46:55.03662
39476	52	6	84	84	0	0	2017	84	2017-01-02 04:46:55.066557	2017-01-02 04:46:55.066557
39479	52	9	0	0	0	0	2017	0	2017-01-02 04:46:55.097257	2017-01-02 04:46:55.097257
39480	98	1	5	5	0	0	2017	5	2017-01-02 04:46:55.106426	2017-01-02 04:46:55.106426
39481	98	2	15	15	0	0	2017	15	2017-01-02 04:46:55.116397	2017-01-02 04:46:55.116397
39482	98	3	7	7	0	0	2017	7	2017-01-02 04:46:55.126451	2017-01-02 04:46:55.126451
39483	98	4	7	7	0	0	2017	7	2017-01-02 04:46:55.136352	2017-01-02 04:46:55.136352
39484	98	5	5	5	0	0	2017	5	2017-01-02 04:46:55.146436	2017-01-02 04:46:55.146436
39485	98	6	84	84	0	0	2017	84	2017-01-02 04:46:55.156324	2017-01-02 04:46:55.156324
39487	98	8	5	5	0	0	2017	5	2017-01-02 04:46:55.176394	2017-01-02 04:46:55.176394
39488	98	9	0	0	0	0	2017	0	2017-01-02 04:46:55.186393	2017-01-02 04:46:55.186393
39489	136	1	5	5	0	0	2017	5	2017-01-02 04:46:55.196507	2017-01-02 04:46:55.196507
39490	136	2	15	15	0	0	2017	15	2017-01-02 04:46:55.206445	2017-01-02 04:46:55.206445
39491	136	3	7	7	0	0	2017	7	2017-01-02 04:46:55.216448	2017-01-02 04:46:55.216448
39492	136	4	7	7	0	0	2017	7	2017-01-02 04:46:55.226529	2017-01-02 04:46:55.226529
39493	136	5	5	5	0	0	2017	5	2017-01-02 04:46:55.236497	2017-01-02 04:46:55.236497
39495	136	7	7	7	0	0	2017	7	2017-01-02 04:46:55.25661	2017-01-02 04:46:55.25661
39496	136	8	5	5	0	0	2017	5	2017-01-02 04:46:55.266633	2017-01-02 04:46:55.266633
39497	136	9	0	0	0	0	2017	0	2017-01-02 04:46:55.276661	2017-01-02 04:46:55.276661
39498	111	1	5	5	0	0	2017	5	2017-01-02 04:46:55.286656	2017-01-02 04:46:55.286656
39499	111	2	15	15	0	0	2017	15	2017-01-02 04:46:55.296692	2017-01-02 04:46:55.296692
39500	111	3	7	7	0	0	2017	7	2017-01-02 04:46:55.306734	2017-01-02 04:46:55.306734
39501	111	4	7	7	0	0	2017	7	2017-01-02 04:46:55.316775	2017-01-02 04:46:55.316775
39502	111	5	5	5	0	0	2017	5	2017-01-02 04:46:55.326775	2017-01-02 04:46:55.326775
39504	111	7	7	7	0	0	2017	7	2017-01-02 04:46:55.346808	2017-01-02 04:46:55.346808
39505	111	8	5	5	0	0	2017	5	2017-01-02 04:46:55.35688	2017-01-02 04:46:55.35688
39506	111	9	0	0	0	0	2017	0	2017-01-02 04:46:55.366892	2017-01-02 04:46:55.366892
39507	35	1	5	5	0	0	2017	5	2017-01-02 04:46:55.376918	2017-01-02 04:46:55.376918
39508	35	2	15	15	0	0	2017	15	2017-01-02 04:46:55.386946	2017-01-02 04:46:55.386946
39509	35	3	7	7	0	0	2017	7	2017-01-02 04:46:55.39698	2017-01-02 04:46:55.39698
39510	35	4	7	7	0	0	2017	7	2017-01-02 04:46:55.406942	2017-01-02 04:46:55.406942
39511	35	5	5	5	0	0	2017	5	2017-01-02 04:46:55.417009	2017-01-02 04:46:55.417009
39513	35	7	7	7	0	0	2017	7	2017-01-02 04:46:55.437054	2017-01-02 04:46:55.437054
39514	35	8	5	5	0	0	2017	5	2017-01-02 04:46:55.447059	2017-01-02 04:46:55.447059
39515	35	9	0	0	0	0	2017	0	2017-01-02 04:46:55.457103	2017-01-02 04:46:55.457103
39516	127	1	5	5	0	0	2017	5	2017-01-02 04:46:55.467109	2017-01-02 04:46:55.467109
39517	127	2	15	15	0	0	2017	15	2017-01-02 04:46:55.477151	2017-01-02 04:46:55.477151
39518	127	3	7	7	0	0	2017	7	2017-01-02 04:46:55.48716	2017-01-02 04:46:55.48716
39519	127	4	7	7	0	0	2017	7	2017-01-02 04:46:55.497211	2017-01-02 04:46:55.497211
39520	127	5	5	5	0	0	2017	5	2017-01-02 04:46:55.507292	2017-01-02 04:46:55.507292
39522	127	7	7	7	0	0	2017	7	2017-01-02 04:46:55.527415	2017-01-02 04:46:55.527415
39523	127	8	5	5	0	0	2017	5	2017-01-02 04:46:55.537353	2017-01-02 04:46:55.537353
39524	127	9	0	0	0	0	2017	0	2017-01-02 04:46:55.547406	2017-01-02 04:46:55.547406
39525	123	1	5	5	0	0	2017	5	2017-01-02 04:46:55.557406	2017-01-02 04:46:55.557406
39526	123	2	15	15	0	0	2017	15	2017-01-02 04:46:55.57384	2017-01-02 04:46:55.57384
39527	123	3	7	7	0	0	2017	7	2017-01-02 04:46:55.587489	2017-01-02 04:46:55.587489
39528	123	4	7	7	0	0	2017	7	2017-01-02 04:46:55.597482	2017-01-02 04:46:55.597482
39529	123	5	5	5	0	0	2017	5	2017-01-02 04:46:55.607484	2017-01-02 04:46:55.607484
39530	123	6	84	84	0	0	2017	84	2017-01-02 04:46:55.617507	2017-01-02 04:46:55.617507
39532	123	8	5	5	0	0	2017	5	2017-01-02 04:46:55.637565	2017-01-02 04:46:55.637565
39533	123	9	0	0	0	0	2017	0	2017-01-02 04:46:55.647609	2017-01-02 04:46:55.647609
39536	133	3	7	7	0	0	2017	7	2017-01-02 04:46:55.677615	2017-01-02 04:46:55.677615
39537	133	4	7	7	0	0	2017	7	2017-01-02 04:46:55.687694	2017-01-02 04:46:55.687694
39486	98	7	7	0	0	0	2017	0	2017-01-02 04:46:55.166341	2017-01-02 04:47:22.268885
39531	123	7	7	0	0	0	2017	0	2017-01-02 04:46:55.627561	2017-01-02 04:47:22.288922
39467	101	6	84	0	0	0	2017	0	2017-01-02 04:46:54.975846	2017-01-02 04:47:24.494063
39494	136	6	84	0	0	0	2017	0	2017-01-02 04:46:55.246615	2017-01-02 04:47:24.514142
39503	111	6	84	0	0	0	2017	0	2017-01-02 04:46:55.336844	2017-01-02 04:47:24.534195
39512	35	6	84	0	0	0	2017	0	2017-01-02 04:46:55.427013	2017-01-02 04:47:24.554192
39521	127	6	84	0	0	0	2017	0	2017-01-02 04:46:55.517333	2017-01-02 04:47:24.574326
39471	52	1	5	4	1	0	2017	5	2017-01-02 04:46:55.015895	2017-05-11 15:30:19.06661
39535	133	2	15	11	4	0	2017	15	2017-01-02 04:46:55.667638	2017-05-04 13:01:05.402777
39472	52	2	15	11	4	0	2017	15	2017-01-02 04:46:55.025921	2017-06-21 09:07:29.783445
39474	52	4	7	6	1	0	2017	7	2017-01-02 04:46:55.046684	2017-07-13 06:33:31.208387
39475	52	5	5	1.5	3.5	0	2017	5	2017-01-02 04:46:55.056541	2017-07-26 08:36:55.630911
39478	52	8	5	3	2	0	2017	5	2017-01-02 04:46:55.086464	2017-08-04 14:20:48.204384
39534	133	1	5	0	5	0	2017	5	2017-01-02 04:46:55.657619	2017-07-21 04:33:14.157431
5574	258	2	15	13	2	0	2015	15	2015-08-05 09:41:06.340914	2015-11-10 02:24:54.742066
5510	251	1	5	5	0	0	2015	5	2015-07-09 13:33:40.262913	2015-07-09 13:33:40.262913
5511	251	2	15	15	0	0	2015	15	2015-07-09 13:33:40.278055	2015-07-09 13:33:40.278055
5512	251	3	7	7	0	0	2015	7	2015-07-09 13:33:40.292469	2015-07-09 13:33:40.292469
5513	251	4	7	7	0	0	2015	7	2015-07-09 13:33:40.305953	2015-07-09 13:33:40.305953
5514	251	5	5	5	0	0	2015	5	2015-07-09 13:33:40.319383	2015-07-09 13:33:40.319383
5516	251	7	7	7	0	0	2015	7	2015-07-09 13:33:40.347413	2015-07-09 13:33:40.347413
5517	251	8	5	5	0	0	2015	5	2015-07-09 13:33:40.360902	2015-07-09 13:33:40.360902
5518	251	9	0	0	0	0	2015	0	2015-07-09 13:33:40.375454	2015-07-09 13:33:40.375454
5515	251	6	84	0	0	0	2015	0	2015-07-09 13:33:40.333893	2015-07-09 13:33:40.452809
4627	171	9	2	0	2	0	2015	2	\N	2015-07-13 05:41:03.203344
5519	252	1	5	5	0	0	2015	5	2015-07-14 05:28:05.455506	2015-07-14 05:28:05.455506
5521	252	3	7	7	0	0	2015	7	2015-07-14 05:28:05.486231	2015-07-14 05:28:05.486231
5522	252	4	7	7	0	0	2015	7	2015-07-14 05:28:05.499923	2015-07-14 05:28:05.499923
5523	252	5	5	5	0	0	2015	5	2015-07-14 05:28:05.514525	2015-07-14 05:28:05.514525
5525	252	7	7	7	0	0	2015	7	2015-07-14 05:28:05.541787	2015-07-14 05:28:05.541787
5527	252	9	0	0	0	0	2015	0	2015-07-14 05:28:05.570215	2015-07-14 05:28:05.570215
5524	252	6	84	0	0	0	2015	0	2015-07-14 05:28:05.528249	2015-07-14 05:28:05.608459
5530	253	3	7	7	0	0	2015	7	2015-07-27 07:36:57.779196	2015-07-27 07:36:57.779196
5531	253	4	7	7	0	0	2015	7	2015-07-27 07:36:57.793119	2015-07-27 07:36:57.793119
5532	253	5	5	5	0	0	2015	5	2015-07-27 07:36:57.818155	2015-07-27 07:36:57.818155
5533	253	6	84	84	0	0	2015	84	2015-07-27 07:36:57.832117	2015-07-27 07:36:57.832117
5536	253	9	0	0	0	0	2015	0	2015-07-27 07:36:57.874963	2015-07-27 07:36:57.874963
5534	253	7	7	0	0	0	2015	0	2015-07-27 07:36:57.846066	2015-07-27 07:36:57.903797
5537	254	1	5	5	0	0	2015	5	2015-07-28 05:08:44.732837	2015-07-28 05:08:44.732837
5538	254	2	15	15	0	0	2015	15	2015-07-28 05:08:44.749958	2015-07-28 05:08:44.749958
5539	254	3	7	7	0	0	2015	7	2015-07-28 05:08:44.764461	2015-07-28 05:08:44.764461
5540	254	4	7	7	0	0	2015	7	2015-07-28 05:08:44.778082	2015-07-28 05:08:44.778082
5541	254	5	5	5	0	0	2015	5	2015-07-28 05:08:44.791733	2015-07-28 05:08:44.791733
5543	254	7	7	7	0	0	2015	7	2015-07-28 05:08:44.820025	2015-07-28 05:08:44.820025
5544	254	8	5	5	0	0	2015	5	2015-07-28 05:08:44.833616	2015-07-28 05:08:44.833616
5545	254	9	0	0	0	0	2015	0	2015-07-28 05:08:44.848283	2015-07-28 05:08:44.848283
5542	254	6	84	0	0	0	2015	0	2015-07-28 05:08:44.806383	2015-07-28 05:08:44.864197
5546	255	1	5	5	0	0	2015	5	2015-07-28 05:09:17.085874	2015-07-28 05:09:17.085874
5547	255	2	15	15	0	0	2015	15	2015-07-28 05:09:17.103154	2015-07-28 05:09:17.103154
5548	255	3	7	7	0	0	2015	7	2015-07-28 05:09:17.117521	2015-07-28 05:09:17.117521
5549	255	4	7	7	0	0	2015	7	2015-07-28 05:09:17.131195	2015-07-28 05:09:17.131195
5550	255	5	5	5	0	0	2015	5	2015-07-28 05:09:17.145839	2015-07-28 05:09:17.145839
5552	255	7	7	7	0	0	2015	7	2015-07-28 05:09:17.173167	2015-07-28 05:09:17.173167
5553	255	8	5	5	0	0	2015	5	2015-07-28 05:09:17.187751	2015-07-28 05:09:17.187751
5554	255	9	0	0	0	0	2015	0	2015-07-28 05:09:17.201416	2015-07-28 05:09:17.201416
5551	255	6	84	0	0	0	2015	0	2015-07-28 05:09:17.159456	2015-07-28 05:09:17.217366
5555	256	1	5	5	0	0	2015	5	2015-08-05 09:39:01.84837	2015-08-05 09:39:01.84837
5556	256	2	15	15	0	0	2015	15	2015-08-05 09:39:01.870839	2015-08-05 09:39:01.870839
5557	256	3	7	7	0	0	2015	7	2015-08-05 09:39:01.885425	2015-08-05 09:39:01.885425
5558	256	4	7	7	0	0	2015	7	2015-08-05 09:39:01.899426	2015-08-05 09:39:01.899426
5559	256	5	5	5	0	0	2015	5	2015-08-05 09:39:01.965482	2015-08-05 09:39:01.965482
5561	256	7	7	7	0	0	2015	7	2015-08-05 09:39:02.002937	2015-08-05 09:39:02.002937
5562	256	8	5	5	0	0	2015	5	2015-08-05 09:39:02.017746	2015-08-05 09:39:02.017746
5563	256	9	0	0	0	0	2015	0	2015-08-05 09:39:02.031656	2015-08-05 09:39:02.031656
5560	256	6	84	0	0	0	2015	0	2015-08-05 09:39:01.988982	2015-08-05 09:39:02.070671
5564	257	1	5	5	0	0	2015	5	2015-08-05 09:40:22.344506	2015-08-05 09:40:22.344506
5565	257	2	15	15	0	0	2015	15	2015-08-05 09:40:22.369966	2015-08-05 09:40:22.369966
5566	257	3	7	7	0	0	2015	7	2015-08-05 09:40:22.383432	2015-08-05 09:40:22.383432
5567	257	4	7	7	0	0	2015	7	2015-08-05 09:40:22.398634	2015-08-05 09:40:22.398634
5568	257	5	5	5	0	0	2015	5	2015-08-05 09:40:22.412628	2015-08-05 09:40:22.412628
5570	257	7	7	7	0	0	2015	7	2015-08-05 09:40:22.441181	2015-08-05 09:40:22.441181
5571	257	8	5	5	0	0	2015	5	2015-08-05 09:40:22.455119	2015-08-05 09:40:22.455119
5572	257	9	0	0	0	0	2015	0	2015-08-05 09:40:22.470197	2015-08-05 09:40:22.470197
5569	257	6	84	0	0	0	2015	0	2015-08-05 09:40:22.426392	2015-08-05 09:40:22.497827
5575	258	3	7	7	0	0	2015	7	2015-08-05 09:41:06.355715	2015-08-05 09:41:06.355715
5576	258	4	7	7	0	0	2015	7	2015-08-05 09:41:06.370258	2015-08-05 09:41:06.370258
5577	258	5	5	5	0	0	2015	5	2015-08-05 09:41:06.383756	2015-08-05 09:41:06.383756
5579	258	7	7	7	0	0	2015	7	2015-08-05 09:41:06.412708	2015-08-05 09:41:06.412708
5580	258	8	5	5	0	0	2015	5	2015-08-05 09:41:06.4276	2015-08-05 09:41:06.4276
5578	258	6	84	0	0	0	2015	0	2015-08-05 09:41:06.398715	2015-08-05 09:41:06.480413
5582	259	1	5	5	0	0	2015	5	2015-08-06 05:24:35.311436	2015-08-06 05:24:35.311436
5535	253	8	5	3	2	0	2015	5	2015-07-27 07:36:57.861016	2015-10-20 05:25:04.903622
5430	242	2	15	7	8	0	2015	15	2015-06-16 09:10:25.4486	2015-12-25 07:17:00.86396
5573	258	1	5	4	1	0	2015	5	2015-08-05 09:41:06.318508	2015-09-10 16:56:26.352268
5528	253	1	5	4	1	0	2015	5	2015-07-27 07:36:57.741606	2015-09-28 03:45:43.204328
5526	252	8	5	4	1	0	2015	5	2015-07-14 05:28:05.556551	2015-11-09 12:29:42.354783
5520	252	2	15	13	2	0	2015	15	2015-07-14 05:28:05.472865	2015-11-09 12:30:10.130553
5581	258	9	0	0	0	0	2015	0	2015-08-05 09:41:06.441569	2015-08-05 09:41:06.441569
39540	133	7	7	7	0	0	2017	7	2017-01-02 04:46:55.717733	2017-01-02 04:46:55.717733
39542	133	9	0	0	0	0	2017	0	2017-01-02 04:46:55.737787	2017-01-02 04:46:55.737787
39543	118	1	5	5	0	0	2017	5	2017-01-02 04:46:55.747849	2017-01-02 04:46:55.747849
39544	118	2	15	15	0	0	2017	15	2017-01-02 04:46:55.757832	2017-01-02 04:46:55.757832
39545	118	3	7	7	0	0	2017	7	2017-01-02 04:46:55.767903	2017-01-02 04:46:55.767903
39546	118	4	7	7	0	0	2017	7	2017-01-02 04:46:55.777886	2017-01-02 04:46:55.777886
39547	118	5	5	5	0	0	2017	5	2017-01-02 04:46:55.787947	2017-01-02 04:46:55.787947
39549	118	7	7	7	0	0	2017	7	2017-01-02 04:46:55.808028	2017-01-02 04:46:55.808028
39550	118	8	5	5	0	0	2017	5	2017-01-02 04:46:55.818003	2017-01-02 04:46:55.818003
39551	118	9	0	0	0	0	2017	0	2017-01-02 04:46:55.828088	2017-01-02 04:46:55.828088
39552	121	1	5	5	0	0	2017	5	2017-01-02 04:46:55.838096	2017-01-02 04:46:55.838096
39553	121	2	15	15	0	0	2017	15	2017-01-02 04:46:55.848141	2017-01-02 04:46:55.848141
39554	121	3	7	7	0	0	2017	7	2017-01-02 04:46:55.858118	2017-01-02 04:46:55.858118
39555	121	4	7	7	0	0	2017	7	2017-01-02 04:46:55.868172	2017-01-02 04:46:55.868172
39556	121	5	5	5	0	0	2017	5	2017-01-02 04:46:55.878247	2017-01-02 04:46:55.878247
39557	121	6	84	84	0	0	2017	84	2017-01-02 04:46:55.888226	2017-01-02 04:46:55.888226
39558	121	7	7	7	0	0	2017	7	2017-01-02 04:46:55.898209	2017-01-02 04:46:55.898209
39559	121	8	5	5	0	0	2017	5	2017-01-02 04:46:55.908281	2017-01-02 04:46:55.908281
39560	121	9	0	0	0	0	2017	0	2017-01-02 04:46:55.91828	2017-01-02 04:46:55.91828
39561	109	1	5	5	0	0	2017	5	2017-01-02 04:46:55.928339	2017-01-02 04:46:55.928339
39562	109	2	15	15	0	0	2017	15	2017-01-02 04:46:55.938347	2017-01-02 04:46:55.938347
39563	109	3	7	7	0	0	2017	7	2017-01-02 04:46:55.948365	2017-01-02 04:46:55.948365
39564	109	4	7	7	0	0	2017	7	2017-01-02 04:46:55.958368	2017-01-02 04:46:55.958368
39565	109	5	5	5	0	0	2017	5	2017-01-02 04:46:55.968412	2017-01-02 04:46:55.968412
39566	109	6	84	84	0	0	2017	84	2017-01-02 04:46:55.978421	2017-01-02 04:46:55.978421
39568	109	8	5	5	0	0	2017	5	2017-01-02 04:46:55.998486	2017-01-02 04:46:55.998486
39569	109	9	0	0	0	0	2017	0	2017-01-02 04:46:56.008545	2017-01-02 04:46:56.008545
39570	129	1	5	5	0	0	2017	5	2017-01-02 04:46:56.018548	2017-01-02 04:46:56.018548
39571	129	2	15	15	0	0	2017	15	2017-01-02 04:46:56.028583	2017-01-02 04:46:56.028583
39572	129	3	7	7	0	0	2017	7	2017-01-02 04:46:56.038611	2017-01-02 04:46:56.038611
39573	129	4	7	7	0	0	2017	7	2017-01-02 04:46:56.048591	2017-01-02 04:46:56.048591
39574	129	5	5	5	0	0	2017	5	2017-01-02 04:46:56.058597	2017-01-02 04:46:56.058597
39576	129	7	7	7	0	0	2017	7	2017-01-02 04:46:56.078686	2017-01-02 04:46:56.078686
39577	129	8	5	5	0	0	2017	5	2017-01-02 04:46:56.088779	2017-01-02 04:46:56.088779
39578	129	9	0	0	0	0	2017	0	2017-01-02 04:46:56.098793	2017-01-02 04:46:56.098793
39582	140	4	7	7	0	0	2017	7	2017-01-02 04:46:56.138917	2017-01-02 04:46:56.138917
39584	140	6	84	84	0	0	2017	84	2017-01-02 04:46:56.158942	2017-01-02 04:46:56.158942
39587	140	9	0	0	0	0	2017	0	2017-01-02 04:46:56.189036	2017-01-02 04:46:56.189036
39588	119	1	5	5	0	0	2017	5	2017-01-02 04:46:56.279648	2017-01-02 04:46:56.279648
39589	119	2	15	15	0	0	2017	15	2017-01-02 04:46:56.309569	2017-01-02 04:46:56.309569
39590	119	3	7	7	0	0	2017	7	2017-01-02 04:46:56.319356	2017-01-02 04:46:56.319356
39591	119	4	7	7	0	0	2017	7	2017-01-02 04:46:56.329372	2017-01-02 04:46:56.329372
39592	119	5	5	5	0	0	2017	5	2017-01-02 04:46:56.339421	2017-01-02 04:46:56.339421
39594	119	7	7	7	0	0	2017	7	2017-01-02 04:46:56.359575	2017-01-02 04:46:56.359575
39595	119	8	5	5	0	0	2017	5	2017-01-02 04:46:56.369482	2017-01-02 04:46:56.369482
39596	119	9	0	0	0	0	2017	0	2017-01-02 04:46:56.379479	2017-01-02 04:46:56.379479
39597	116	1	5	5	0	0	2017	5	2017-01-02 04:46:56.38956	2017-01-02 04:46:56.38956
39598	116	2	15	15	0	0	2017	15	2017-01-02 04:46:56.39958	2017-01-02 04:46:56.39958
39599	116	3	7	7	0	0	2017	7	2017-01-02 04:46:56.414051	2017-01-02 04:46:56.414051
39600	116	4	7	7	0	0	2017	7	2017-01-02 04:46:56.419634	2017-01-02 04:46:56.419634
39601	116	5	5	5	0	0	2017	5	2017-01-02 04:46:56.429646	2017-01-02 04:46:56.429646
39603	116	7	7	7	0	0	2017	7	2017-01-02 04:46:56.449686	2017-01-02 04:46:56.449686
39604	116	8	5	5	0	0	2017	5	2017-01-02 04:46:56.459764	2017-01-02 04:46:56.459764
39605	116	9	0	0	0	0	2017	0	2017-01-02 04:46:56.469797	2017-01-02 04:46:56.469797
39606	128	1	5	5	0	0	2017	5	2017-01-02 04:46:56.479838	2017-01-02 04:46:56.479838
39607	128	2	15	15	0	0	2017	15	2017-01-02 04:46:56.489838	2017-01-02 04:46:56.489838
39608	128	3	7	7	0	0	2017	7	2017-01-02 04:46:56.499876	2017-01-02 04:46:56.499876
39609	128	4	7	7	0	0	2017	7	2017-01-02 04:46:56.509847	2017-01-02 04:46:56.509847
39610	128	5	5	5	0	0	2017	5	2017-01-02 04:46:56.519926	2017-01-02 04:46:56.519926
39611	128	6	84	84	0	0	2017	84	2017-01-02 04:46:56.529935	2017-01-02 04:46:56.529935
39585	140	7	7	0	0	0	2017	0	2017-01-02 04:46:56.168983	2017-01-02 04:47:22.328857
39612	128	7	7	0	0	0	2017	0	2017-01-02 04:46:56.539981	2017-01-02 04:47:22.348892
39539	133	6	84	0	0	0	2017	0	2017-01-02 04:46:55.707763	2017-01-02 04:47:24.594359
39548	118	6	84	0	0	0	2017	0	2017-01-02 04:46:55.797971	2017-01-02 04:47:24.614418
39575	129	6	84	0	0	0	2017	0	2017-01-02 04:46:56.068661	2017-01-02 04:47:24.634478
39593	119	6	84	0	0	0	2017	0	2017-01-02 04:46:56.349418	2017-01-02 04:47:24.654537
39602	116	6	84	0	0	0	2017	0	2017-01-02 04:46:56.439686	2017-01-02 04:47:24.674573
39541	133	8	5	4	1	0	2017	5	2017-01-02 04:46:55.727807	2017-08-16 12:37:46.328216
39583	140	5	5	1.5	3.5	0	2017	5	2017-01-02 04:46:56.148929	2017-07-27 06:56:42.050548
39579	140	1	5	2	3	0	2017	5	2017-01-02 04:46:56.108845	2017-05-15 09:36:46.05117
39581	140	3	7	4	3	0	2017	7	2017-01-02 04:46:56.1289	2017-03-21 04:36:25.586584
39586	140	8	5	3	2	0	2017	5	2017-01-02 04:46:56.178995	2017-06-23 13:00:44.836489
39580	140	2	15	7	8	0	2017	15	2017-01-02 04:46:56.118846	2017-08-08 12:50:40.289539
5583	259	2	15	15	0	0	2015	15	2015-08-06 05:24:35.358786	2015-08-06 05:24:35.358786
5584	259	3	7	7	0	0	2015	7	2015-08-06 05:24:35.389601	2015-08-06 05:24:35.389601
5585	259	4	7	7	0	0	2015	7	2015-08-06 05:24:35.417564	2015-08-06 05:24:35.417564
5586	259	5	5	5	0	0	2015	5	2015-08-06 05:24:35.431731	2015-08-06 05:24:35.431731
5588	259	7	7	7	0	0	2015	7	2015-08-06 05:24:35.469017	2015-08-06 05:24:35.469017
5589	259	8	5	5	0	0	2015	5	2015-08-06 05:24:35.482536	2015-08-06 05:24:35.482536
5590	259	9	0	0	0	0	2015	0	2015-08-06 05:24:35.497039	2015-08-06 05:24:35.497039
5587	259	6	84	0	0	0	2015	0	2015-08-06 05:24:35.455545	2015-08-06 05:24:35.523966
4215	63	2	15	0	15	0	2015	15	\N	2015-12-30 08:26:06.99098
39613	128	8	5	5	0	0	2017	5	2017-01-02 04:46:56.549916	2017-01-02 04:46:56.549916
39614	128	9	0	0	0	0	2017	0	2017-01-02 04:46:56.560064	2017-01-02 04:46:56.560064
39615	112	1	5	5	0	0	2017	5	2017-01-02 04:46:56.570017	2017-01-02 04:46:56.570017
39616	112	2	15	15	0	0	2017	15	2017-01-02 04:46:56.580075	2017-01-02 04:46:56.580075
39617	112	3	7	7	0	0	2017	7	2017-01-02 04:46:56.590043	2017-01-02 04:46:56.590043
39618	112	4	7	7	0	0	2017	7	2017-01-02 04:46:56.60011	2017-01-02 04:46:56.60011
39619	112	5	5	5	0	0	2017	5	2017-01-02 04:46:56.610112	2017-01-02 04:46:56.610112
39620	112	6	84	84	0	0	2017	84	2017-01-02 04:46:56.620172	2017-01-02 04:46:56.620172
39621	112	7	7	7	0	0	2017	7	2017-01-02 04:46:56.630243	2017-01-02 04:46:56.630243
39622	112	8	5	5	0	0	2017	5	2017-01-02 04:46:56.640206	2017-01-02 04:46:56.640206
39623	112	9	0	0	0	0	2017	0	2017-01-02 04:46:56.650207	2017-01-02 04:46:56.650207
39624	78	1	5	5	0	0	2017	5	2017-01-02 04:46:56.660277	2017-01-02 04:46:56.660277
39625	78	2	15	15	0	0	2017	15	2017-01-02 04:46:56.670256	2017-01-02 04:46:56.670256
39626	78	3	7	7	0	0	2017	7	2017-01-02 04:46:56.680297	2017-01-02 04:46:56.680297
39627	78	4	7	7	0	0	2017	7	2017-01-02 04:46:56.690387	2017-01-02 04:46:56.690387
39628	78	5	5	5	0	0	2017	5	2017-01-02 04:46:56.700357	2017-01-02 04:46:56.700357
39629	78	6	84	84	0	0	2017	84	2017-01-02 04:46:56.710401	2017-01-02 04:46:56.710401
39631	78	8	5	5	0	0	2017	5	2017-01-02 04:46:56.730426	2017-01-02 04:46:56.730426
39632	78	9	0	0	0	0	2017	0	2017-01-02 04:46:56.740368	2017-01-02 04:46:56.740368
39633	132	1	5	5	0	0	2017	5	2017-01-02 04:46:56.750432	2017-01-02 04:46:56.750432
39634	132	2	15	15	0	0	2017	15	2017-01-02 04:46:56.760548	2017-01-02 04:46:56.760548
39635	132	3	7	7	0	0	2017	7	2017-01-02 04:46:56.770533	2017-01-02 04:46:56.770533
39636	132	4	7	7	0	0	2017	7	2017-01-02 04:46:56.780508	2017-01-02 04:46:56.780508
39637	132	5	5	5	0	0	2017	5	2017-01-02 04:46:56.790613	2017-01-02 04:46:56.790613
39639	132	7	7	7	0	0	2017	7	2017-01-02 04:46:56.81064	2017-01-02 04:46:56.81064
39640	132	8	5	5	0	0	2017	5	2017-01-02 04:46:56.820672	2017-01-02 04:46:56.820672
39641	132	9	0	0	0	0	2017	0	2017-01-02 04:46:56.830676	2017-01-02 04:46:56.830676
39644	134	3	7	7	0	0	2017	7	2017-01-02 04:46:56.860758	2017-01-02 04:46:56.860758
39645	134	4	7	7	0	0	2017	7	2017-01-02 04:46:56.870776	2017-01-02 04:46:56.870776
39648	134	7	7	7	0	0	2017	7	2017-01-02 04:46:56.900913	2017-01-02 04:46:56.900913
39650	134	9	0	0	0	0	2017	0	2017-01-02 04:46:56.920953	2017-01-02 04:46:56.920953
39651	135	1	5	5	0	0	2017	5	2017-01-02 04:46:56.930953	2017-01-02 04:46:56.930953
39652	135	2	15	15	0	0	2017	15	2017-01-02 04:46:56.940972	2017-01-02 04:46:56.940972
39653	135	3	7	7	0	0	2017	7	2017-01-02 04:46:56.950949	2017-01-02 04:46:56.950949
39654	135	4	7	7	0	0	2017	7	2017-01-02 04:46:56.961126	2017-01-02 04:46:56.961126
39655	135	5	5	5	0	0	2017	5	2017-01-02 04:46:56.971094	2017-01-02 04:46:56.971094
39657	135	7	7	7	0	0	2017	7	2017-01-02 04:46:56.991154	2017-01-02 04:46:56.991154
39658	135	8	5	5	0	0	2017	5	2017-01-02 04:46:57.001164	2017-01-02 04:46:57.001164
39659	135	9	0	0	0	0	2017	0	2017-01-02 04:46:57.011178	2017-01-02 04:46:57.011178
39660	130	1	5	5	0	0	2017	5	2017-01-02 04:46:57.021218	2017-01-02 04:46:57.021218
39661	130	2	15	15	0	0	2017	15	2017-01-02 04:46:57.031263	2017-01-02 04:46:57.031263
39662	130	3	7	7	0	0	2017	7	2017-01-02 04:46:57.041337	2017-01-02 04:46:57.041337
39663	130	4	7	7	0	0	2017	7	2017-01-02 04:46:57.051349	2017-01-02 04:46:57.051349
39664	130	5	5	5	0	0	2017	5	2017-01-02 04:46:57.061388	2017-01-02 04:46:57.061388
39666	130	7	7	7	0	0	2017	7	2017-01-02 04:46:57.081448	2017-01-02 04:46:57.081448
39667	130	8	5	5	0	0	2017	5	2017-01-02 04:46:57.091447	2017-01-02 04:46:57.091447
39668	130	9	0	0	0	0	2017	0	2017-01-02 04:46:57.10148	2017-01-02 04:46:57.10148
39669	137	1	5	5	0	0	2017	5	2017-01-02 04:46:57.111542	2017-01-02 04:46:57.111542
39670	137	2	15	15	0	0	2017	15	2017-01-02 04:46:57.121565	2017-01-02 04:46:57.121565
39671	137	3	7	7	0	0	2017	7	2017-01-02 04:46:57.131594	2017-01-02 04:46:57.131594
39672	137	4	7	7	0	0	2017	7	2017-01-02 04:46:57.141534	2017-01-02 04:46:57.141534
39673	137	5	5	5	0	0	2017	5	2017-01-02 04:46:57.171694	2017-01-02 04:46:57.171694
39674	137	6	84	84	0	0	2017	84	2017-01-02 04:46:57.202393	2017-01-02 04:46:57.202393
39675	137	7	7	7	0	0	2017	7	2017-01-02 04:46:57.212358	2017-01-02 04:46:57.212358
39676	137	8	5	5	0	0	2017	5	2017-01-02 04:46:57.222252	2017-01-02 04:46:57.222252
39677	137	9	0	0	0	0	2017	0	2017-01-02 04:46:57.232188	2017-01-02 04:46:57.232188
39638	132	6	84	0	0	0	2017	0	2017-01-02 04:46:56.800596	2017-01-02 04:47:24.6947
39647	134	6	84	0	0	0	2017	0	2017-01-02 04:46:56.890824	2017-01-02 04:47:24.714759
39656	135	6	84	0	0	0	2017	0	2017-01-02 04:46:56.981096	2017-01-02 04:47:24.73476
39665	130	6	84	0	0	0	2017	0	2017-01-02 04:46:57.071417	2017-01-02 04:47:24.754748
39643	134	2	15	0	15	0	2017	15	2017-01-02 04:46:56.850711	2017-05-29 11:26:27.405003
39646	134	5	5	0.5	4.5	0	2017	5	2017-01-02 04:46:56.880845	2017-05-29 11:26:47.92616
39642	134	1	5	0	5	0	2017	5	2017-01-02 04:46:56.840692	2017-07-19 10:15:35.548423
39649	134	8	5	2	3	0	2017	5	2017-01-02 04:46:56.910892	2017-08-04 10:11:54.047635
39678	63	1	5	3	2	0	2017	5	2017-01-02 04:46:57.242149	2017-08-04 07:51:08.086339
5593	260	3	7	7	0	0	2015	7	2015-08-12 05:52:48.011762	2015-08-12 05:52:48.011762
5594	260	4	7	7	0	0	2015	7	2015-08-12 05:52:48.025377	2015-08-12 05:52:48.025377
5596	260	6	84	84	0	0	2015	84	2015-08-12 05:52:48.133927	2015-08-12 05:52:48.133927
5599	260	9	0	0	0	0	2015	0	2015-08-12 05:52:48.196678	2015-08-12 05:52:48.196678
5597	260	7	7	0	0	0	2015	0	2015-08-12 05:52:48.158698	2015-08-12 05:52:48.24442
5600	261	1	5	5	0	0	2015	5	2015-08-18 10:02:58.940255	2015-08-18 10:02:58.940255
5601	261	2	15	15	0	0	2015	15	2015-08-18 10:02:58.957585	2015-08-18 10:02:58.957585
5602	261	3	7	7	0	0	2015	7	2015-08-18 10:02:58.97188	2015-08-18 10:02:58.97188
5603	261	4	7	7	0	0	2015	7	2015-08-18 10:02:58.985383	2015-08-18 10:02:58.985383
5604	261	5	5	5	0	0	2015	5	2015-08-18 10:02:58.998889	2015-08-18 10:02:58.998889
5606	261	7	7	7	0	0	2015	7	2015-08-18 10:02:59.026919	2015-08-18 10:02:59.026919
5607	261	8	5	5	0	0	2015	5	2015-08-18 10:02:59.040447	2015-08-18 10:02:59.040447
5608	261	9	0	0	0	0	2015	0	2015-08-18 10:02:59.095311	2015-08-18 10:02:59.095311
5605	261	6	84	0	0	0	2015	0	2015-08-18 10:02:59.013408	2015-08-18 10:02:59.111983
5609	262	1	5	5	0	0	2015	5	2015-08-24 05:07:19.812204	2015-08-24 05:07:19.812204
5610	262	2	15	15	0	0	2015	15	2015-08-24 05:07:19.836604	2015-08-24 05:07:19.836604
5611	262	3	7	7	0	0	2015	7	2015-08-24 05:07:19.850228	2015-08-24 05:07:19.850228
5612	262	4	7	7	0	0	2015	7	2015-08-24 05:07:19.865074	2015-08-24 05:07:19.865074
5613	262	5	5	5	0	0	2015	5	2015-08-24 05:07:19.879086	2015-08-24 05:07:19.879086
5615	262	7	7	7	0	0	2015	7	2015-08-24 05:07:19.907747	2015-08-24 05:07:19.907747
5616	262	8	5	5	0	0	2015	5	2015-08-24 05:07:19.92167	2015-08-24 05:07:19.92167
5617	262	9	0	0	0	0	2015	0	2015-08-24 05:07:19.936558	2015-08-24 05:07:19.936558
5614	262	6	84	0	0	0	2015	0	2015-08-24 05:07:19.893867	2015-08-24 05:07:19.95273
5618	263	1	5	5	0	0	2015	5	2015-08-24 05:07:39.73072	2015-08-24 05:07:39.73072
5619	263	2	15	15	0	0	2015	15	2015-08-24 05:07:39.7521	2015-08-24 05:07:39.7521
5620	263	3	7	7	0	0	2015	7	2015-08-24 05:07:39.765838	2015-08-24 05:07:39.765838
5621	263	4	7	7	0	0	2015	7	2015-08-24 05:07:39.779711	2015-08-24 05:07:39.779711
5622	263	5	5	5	0	0	2015	5	2015-08-24 05:07:39.795311	2015-08-24 05:07:39.795311
5624	263	7	7	7	0	0	2015	7	2015-08-24 05:07:39.832374	2015-08-24 05:07:39.832374
5625	263	8	5	5	0	0	2015	5	2015-08-24 05:07:39.847264	2015-08-24 05:07:39.847264
5626	263	9	0	0	0	0	2015	0	2015-08-24 05:07:39.861167	2015-08-24 05:07:39.861167
5623	263	6	84	0	0	0	2015	0	2015-08-24 05:07:39.81849	2015-08-24 05:07:39.878604
5627	264	1	5	5	0	0	2015	5	2015-08-24 10:44:56.496745	2015-08-24 10:44:56.496745
5628	264	2	15	15	0	0	2015	15	2015-08-24 10:44:56.512782	2015-08-24 10:44:56.512782
5629	264	3	7	7	0	0	2015	7	2015-08-24 10:44:56.526612	2015-08-24 10:44:56.526612
5630	264	4	7	7	0	0	2015	7	2015-08-24 10:44:56.540478	2015-08-24 10:44:56.540478
5631	264	5	5	5	0	0	2015	5	2015-08-24 10:44:56.55538	2015-08-24 10:44:56.55538
5633	264	7	7	7	0	0	2015	7	2015-08-24 10:44:56.583264	2015-08-24 10:44:56.583264
5634	264	8	5	5	0	0	2015	5	2015-08-24 10:44:56.598207	2015-08-24 10:44:56.598207
5635	264	9	0	0	0	0	2015	0	2015-08-24 10:44:56.612209	2015-08-24 10:44:56.612209
5632	264	6	84	0	0	0	2015	0	2015-08-24 10:44:56.56932	2015-08-24 10:44:56.641048
5637	265	2	15	15	0	0	2015	15	2015-08-26 10:34:50.841629	2015-08-26 10:34:50.841629
5638	265	3	7	7	0	0	2015	7	2015-08-26 10:34:50.854983	2015-08-26 10:34:50.854983
5639	265	4	7	7	0	0	2015	7	2015-08-26 10:34:50.869473	2015-08-26 10:34:50.869473
5640	265	5	5	5	0	0	2015	5	2015-08-26 10:34:50.883082	2015-08-26 10:34:50.883082
5642	265	7	7	7	0	0	2015	7	2015-08-26 10:34:50.921113	2015-08-26 10:34:50.921113
5643	265	8	5	5	0	0	2015	5	2015-08-26 10:34:50.985823	2015-08-26 10:34:50.985823
5644	265	9	0	0	0	0	2015	0	2015-08-26 10:34:51.009642	2015-08-26 10:34:51.009642
5641	265	6	84	0	0	0	2015	0	2015-08-26 10:34:50.896569	2015-08-26 10:34:51.036552
5647	266	3	7	7	0	0	2015	7	2015-08-27 06:17:21.745312	2015-08-27 06:17:21.745312
5648	266	4	7	7	0	0	2015	7	2015-08-27 06:17:21.759147	2015-08-27 06:17:21.759147
5649	266	5	5	5	0	0	2015	5	2015-08-27 06:17:21.772764	2015-08-27 06:17:21.772764
5651	266	7	7	7	0	0	2015	7	2015-08-27 06:17:21.801064	2015-08-27 06:17:21.801064
5653	266	9	0	0	0	0	2015	0	2015-08-27 06:17:21.829348	2015-08-27 06:17:21.829348
5650	266	6	84	0	0	0	2015	0	2015-08-27 06:17:21.787398	2015-08-27 06:17:21.868246
3749	70	4	7	7	0	0	2015	7	\N	2015-09-09 11:38:08.051723
5654	268	1	5	5	0	0	2015	5	2015-09-24 08:57:57.43392	2015-09-24 08:57:57.43392
5652	266	8	5	4	1	0	2015	5	2015-08-27 06:17:21.814728	2015-09-16 06:33:10.592269
4079	31	1	5	0	5	0	2015	5	\N	2015-10-15 14:01:32.005102
5655	268	2	15	15	0	0	2015	15	2015-09-24 08:57:57.503082	2015-09-24 08:57:57.503082
5656	268	3	7	7	0	0	2015	7	2015-09-24 08:57:57.516638	2015-09-24 08:57:57.516638
5657	268	4	7	7	0	0	2015	7	2015-09-24 08:57:57.530619	2015-09-24 08:57:57.530619
5658	268	5	5	5	0	0	2015	5	2015-09-24 08:57:57.545638	2015-09-24 08:57:57.545638
5660	268	7	7	7	0	0	2015	7	2015-09-24 08:57:57.574426	2015-09-24 08:57:57.574426
5661	268	8	5	5	0	0	2015	5	2015-09-24 08:57:57.588355	2015-09-24 08:57:57.588355
5646	266	2	15	10	5	0	2015	15	2015-08-27 06:17:21.730993	2016-01-25 10:47:04.060489
5636	265	1	5	4	1	0	2015	5	2015-08-26 10:34:50.80874	2015-11-03 09:23:34.943247
5591	260	1	5	4	1	0	2015	5	2015-08-12 05:52:47.975916	2015-12-10 04:44:46.133852
5595	260	5	5	3	2	0	2015	5	2015-08-12 05:52:48.039004	2015-10-26 05:29:17.173863
5645	266	1	5	2	3	0	2015	5	2015-08-27 06:17:21.707478	2015-12-25 06:38:53.378658
5592	260	2	15	14	1	0	2015	15	2015-08-12 05:52:47.997128	2015-12-25 06:31:04.004545
5097	185	2	15	8	7	0	2015	15	\N	2015-12-16 08:35:45.782566
5598	260	8	5	2	3	0	2015	5	2015-08-12 05:52:48.182065	2015-12-25 06:31:55.563051
5662	268	9	0	0	0	0	2015	0	2015-09-24 08:57:57.602313	2015-09-24 08:57:57.602313
5659	268	6	84	0	0	0	2015	0	2015-09-24 08:57:57.559463	2015-09-24 08:57:57.641353
5663	269	1	5	5	0	0	2015	5	2015-10-20 05:05:42.037937	2015-10-20 05:05:42.037937
5664	269	2	15	15	0	0	2015	15	2015-10-20 05:05:42.091796	2015-10-20 05:05:42.091796
5665	269	3	7	7	0	0	2015	7	2015-10-20 05:05:42.105515	2015-10-20 05:05:42.105515
5666	269	4	7	7	0	0	2015	7	2015-10-20 05:05:42.120436	2015-10-20 05:05:42.120436
5667	269	5	5	5	0	0	2015	5	2015-10-20 05:05:42.13438	2015-10-20 05:05:42.13438
5669	269	7	7	7	0	0	2015	7	2015-10-20 05:05:42.163285	2015-10-20 05:05:42.163285
5670	269	8	5	5	0	0	2015	5	2015-10-20 05:05:42.177262	2015-10-20 05:05:42.177262
5671	269	9	0	0	0	0	2015	0	2015-10-20 05:05:42.192167	2015-10-20 05:05:42.192167
5668	269	6	84	0	0	0	2015	0	2015-10-20 05:05:42.149334	2015-10-20 05:05:42.230107
5679	270	8	5	4	1	0	2015	5	2015-11-02 09:29:26.08445	2015-12-21 12:16:34.700636
5672	270	1	5	5	0	0	2015	5	2015-11-02 09:29:25.958625	2015-11-02 09:29:25.958625
5673	270	2	15	15	0	0	2015	15	2015-11-02 09:29:25.978097	2015-11-02 09:29:25.978097
5674	270	3	7	7	0	0	2015	7	2015-11-02 09:29:26.001473	2015-11-02 09:29:26.001473
5675	270	4	7	7	0	0	2015	7	2015-11-02 09:29:26.014881	2015-11-02 09:29:26.014881
5676	270	5	5	5	0	0	2015	5	2015-11-02 09:29:26.029372	2015-11-02 09:29:26.029372
5677	270	6	84	84	0	0	2015	84	2015-11-02 09:29:26.042872	2015-11-02 09:29:26.042872
5680	270	9	0	0	0	0	2015	0	2015-11-02 09:29:26.112892	2015-11-02 09:29:26.112892
5678	270	7	7	0	0	0	2015	0	2015-11-02 09:29:26.056463	2015-11-02 09:29:26.141914
5681	271	1	5	5	0	0	2015	5	2015-11-02 09:29:59.786895	2015-11-02 09:29:59.786895
5682	271	2	15	15	0	0	2015	15	2015-11-02 09:29:59.810849	2015-11-02 09:29:59.810849
5683	271	3	7	7	0	0	2015	7	2015-11-02 09:29:59.833985	2015-11-02 09:29:59.833985
5685	271	5	5	5	0	0	2015	5	2015-11-02 09:29:59.861813	2015-11-02 09:29:59.861813
5687	271	7	7	7	0	0	2015	7	2015-11-02 09:29:59.889746	2015-11-02 09:29:59.889746
5688	271	8	5	5	0	0	2015	5	2015-11-02 09:29:59.90324	2015-11-02 09:29:59.90324
5689	271	9	0	0	0	0	2015	0	2015-11-02 09:29:59.916759	2015-11-02 09:29:59.916759
5686	271	6	84	0	0	0	2015	0	2015-11-02 09:29:59.875253	2015-11-02 09:29:59.934089
5690	272	1	5	5	0	0	2015	5	2015-11-02 09:30:38.483642	2015-11-02 09:30:38.483642
5691	272	2	15	15	0	0	2015	15	2015-11-02 09:30:38.505977	2015-11-02 09:30:38.505977
5692	272	3	7	7	0	0	2015	7	2015-11-02 09:30:38.520383	2015-11-02 09:30:38.520383
5693	272	4	7	7	0	0	2015	7	2015-11-02 09:30:38.533817	2015-11-02 09:30:38.533817
5694	272	5	5	5	0	0	2015	5	2015-11-02 09:30:38.54732	2015-11-02 09:30:38.54732
5696	272	7	7	7	0	0	2015	7	2015-11-02 09:30:38.575321	2015-11-02 09:30:38.575321
5697	272	8	5	5	0	0	2015	5	2015-11-02 09:30:38.588828	2015-11-02 09:30:38.588828
5698	272	9	0	0	0	0	2015	0	2015-11-02 09:30:38.603578	2015-11-02 09:30:38.603578
5695	272	6	84	0	0	0	2015	0	2015-11-02 09:30:38.561796	2015-11-02 09:30:38.619518
5699	273	1	5	5	0	0	2015	5	2015-11-02 09:31:00.292861	2015-11-02 09:31:00.292861
5700	273	2	15	15	0	0	2015	15	2015-11-02 09:31:00.31616	2015-11-02 09:31:00.31616
5701	273	3	7	7	0	0	2015	7	2015-11-02 09:31:00.329492	2015-11-02 09:31:00.329492
5702	273	4	7	7	0	0	2015	7	2015-11-02 09:31:00.342958	2015-11-02 09:31:00.342958
5703	273	5	5	5	0	0	2015	5	2015-11-02 09:31:00.357464	2015-11-02 09:31:00.357464
5705	273	7	7	7	0	0	2015	7	2015-11-02 09:31:00.38452	2015-11-02 09:31:00.38452
5706	273	8	5	5	0	0	2015	5	2015-11-02 09:31:00.39897	2015-11-02 09:31:00.39897
5707	273	9	0	0	0	0	2015	0	2015-11-02 09:31:00.412472	2015-11-02 09:31:00.412472
5704	273	6	84	0	0	0	2015	0	2015-11-02 09:31:00.370959	2015-11-02 09:31:00.428141
5708	274	1	5	5	0	0	2015	5	2015-11-02 09:32:21.561606	2015-11-02 09:32:21.561606
5709	274	2	15	15	0	0	2015	15	2015-11-02 09:32:21.594593	2015-11-02 09:32:21.594593
5710	274	3	7	7	0	0	2015	7	2015-11-02 09:32:21.621487	2015-11-02 09:32:21.621487
5711	274	4	7	7	0	0	2015	7	2015-11-02 09:32:21.649626	2015-11-02 09:32:21.649626
5712	274	5	5	5	0	0	2015	5	2015-11-02 09:32:21.673117	2015-11-02 09:32:21.673117
5714	274	7	7	7	0	0	2015	7	2015-11-02 09:32:21.701195	2015-11-02 09:32:21.701195
5715	274	8	5	5	0	0	2015	5	2015-11-02 09:32:21.714663	2015-11-02 09:32:21.714663
5716	274	9	0	0	0	0	2015	0	2015-11-02 09:32:21.739494	2015-11-02 09:32:21.739494
5713	274	6	84	0	0	0	2015	0	2015-11-02 09:32:21.687718	2015-11-02 09:32:21.766889
4104	64	8	5	3	2	0	2015	5	\N	2015-11-04 05:55:05.952229
5717	275	1	5	5	0	0	2015	5	2015-11-09 05:35:53.83134	2015-11-09 05:35:53.83134
5718	275	2	15	15	0	0	2015	15	2015-11-09 05:35:53.856964	2015-11-09 05:35:53.856964
5719	275	3	7	7	0	0	2015	7	2015-11-09 05:35:53.870688	2015-11-09 05:35:53.870688
5720	275	4	7	7	0	0	2015	7	2015-11-09 05:35:53.884757	2015-11-09 05:35:53.884757
5721	275	5	5	5	0	0	2015	5	2015-11-09 05:35:53.899735	2015-11-09 05:35:53.899735
5723	275	7	7	7	0	0	2015	7	2015-11-09 05:35:53.928601	2015-11-09 05:35:53.928601
5724	275	8	5	5	0	0	2015	5	2015-11-09 05:35:53.942516	2015-11-09 05:35:53.942516
5725	275	9	0	0	0	0	2015	0	2015-11-09 05:35:53.95652	2015-11-09 05:35:53.95652
5722	275	6	84	0	0	0	2015	0	2015-11-09 05:35:53.913814	2015-11-09 05:35:53.995332
5457	245	2	15	12	3	0	2015	15	2015-06-17 10:21:08.768523	2015-12-16 11:21:38.71227
5726	276	1	5	5	0	0	2015	5	2015-11-17 07:29:01.522147	2015-11-17 07:29:01.522147
5727	276	2	15	15	0	0	2015	15	2015-11-17 07:29:01.538635	2015-11-17 07:29:01.538635
5728	276	3	7	7	0	0	2015	7	2015-11-17 07:29:01.56381	2015-11-17 07:29:01.56381
5729	276	4	7	7	0	0	2015	7	2015-11-17 07:29:01.59771	2015-11-17 07:29:01.59771
5730	276	5	5	5	0	0	2015	5	2015-11-17 07:29:01.621458	2015-11-17 07:29:01.621458
5731	276	6	84	84	0	0	2015	84	2015-11-17 07:29:01.645998	2015-11-17 07:29:01.645998
4146	101	5	5	3	2	0	2015	5	\N	2015-11-20 07:37:04.43704
5529	253	2	15	8	7	0	2015	15	2015-07-27 07:36:57.765316	2015-12-03 05:35:30.88541
5733	276	8	5	5	0	0	2015	5	2015-11-17 07:29:01.692484	2015-11-17 07:29:01.692484
5734	276	9	0	0	0	0	2015	0	2015-11-17 07:29:01.738507	2015-11-17 07:29:01.738507
5732	276	7	7	0	0	0	2015	0	2015-11-17 07:29:01.669265	2015-11-17 07:29:01.763951
5735	277	1	5	5	0	0	2015	5	2015-11-17 07:29:22.173448	2015-11-17 07:29:22.173448
5736	277	2	15	15	0	0	2015	15	2015-11-17 07:29:22.195929	2015-11-17 07:29:22.195929
5737	277	3	7	7	0	0	2015	7	2015-11-17 07:29:22.210301	2015-11-17 07:29:22.210301
5738	277	4	7	7	0	0	2015	7	2015-11-17 07:29:22.233229	2015-11-17 07:29:22.233229
5739	277	5	5	5	0	0	2015	5	2015-11-17 07:29:22.247842	2015-11-17 07:29:22.247842
5741	277	7	7	7	0	0	2015	7	2015-11-17 07:29:22.28515	2015-11-17 07:29:22.28515
5742	277	8	5	5	0	0	2015	5	2015-11-17 07:29:22.299702	2015-11-17 07:29:22.299702
5743	277	9	0	0	0	0	2015	0	2015-11-17 07:29:22.313383	2015-11-17 07:29:22.313383
5740	277	6	84	0	0	0	2015	0	2015-11-17 07:29:22.262359	2015-11-17 07:29:22.351655
5744	278	1	5	5	0	0	2015	5	2015-11-23 07:25:35.565237	2015-11-23 07:25:35.565237
5745	278	2	15	15	0	0	2015	15	2015-11-23 07:25:35.587756	2015-11-23 07:25:35.587756
5746	278	3	7	7	0	0	2015	7	2015-11-23 07:25:35.601574	2015-11-23 07:25:35.601574
5747	278	4	7	7	0	0	2015	7	2015-11-23 07:25:35.61546	2015-11-23 07:25:35.61546
5748	278	5	5	5	0	0	2015	5	2015-11-23 07:25:35.630405	2015-11-23 07:25:35.630405
5750	278	7	7	7	0	0	2015	7	2015-11-23 07:25:35.6593	2015-11-23 07:25:35.6593
5751	278	8	5	5	0	0	2015	5	2015-11-23 07:25:35.673266	2015-11-23 07:25:35.673266
5752	278	9	0	0	0	0	2015	0	2015-11-23 07:25:35.687189	2015-11-23 07:25:35.687189
5749	278	6	84	0	0	0	2015	0	2015-11-23 07:25:35.644389	2015-11-23 07:25:35.726132
39680	63	3	7	7	0	0	2017	7	2017-01-02 04:46:57.262068	2017-01-02 04:46:57.262068
4728	169	2	15	0	15	0	2015	15	\N	2015-12-17 09:06:35.871754
39684	63	7	7	7	0	0	2017	7	2017-01-02 04:46:57.302107	2017-01-02 04:46:57.302107
39687	110	1	5	5	0	0	2017	5	2017-01-02 04:46:57.342157	2017-01-02 04:46:57.342157
39688	110	2	15	15	0	0	2017	15	2017-01-02 04:46:57.352198	2017-01-02 04:46:57.352198
39689	110	3	7	7	0	0	2017	7	2017-01-02 04:46:57.362125	2017-01-02 04:46:57.362125
39690	110	4	7	7	0	0	2017	7	2017-01-02 04:46:57.372263	2017-01-02 04:46:57.372263
39691	110	5	5	5	0	0	2017	5	2017-01-02 04:46:57.38232	2017-01-02 04:46:57.38232
39692	110	6	84	84	0	0	2017	84	2017-01-02 04:46:57.392369	2017-01-02 04:46:57.392369
39694	110	8	5	5	0	0	2017	5	2017-01-02 04:46:57.412366	2017-01-02 04:46:57.412366
39695	110	9	0	0	0	0	2017	0	2017-01-02 04:46:57.422398	2017-01-02 04:46:57.422398
39696	122	1	5	5	0	0	2017	5	2017-01-02 04:46:57.432401	2017-01-02 04:46:57.432401
39697	122	2	15	15	0	0	2017	15	2017-01-02 04:46:57.442402	2017-01-02 04:46:57.442402
39698	122	3	7	7	0	0	2017	7	2017-01-02 04:46:57.452416	2017-01-02 04:46:57.452416
39699	122	4	7	7	0	0	2017	7	2017-01-02 04:46:57.462492	2017-01-02 04:46:57.462492
39700	122	5	5	5	0	0	2017	5	2017-01-02 04:46:57.472426	2017-01-02 04:46:57.472426
39701	122	6	84	84	0	0	2017	84	2017-01-02 04:46:57.482475	2017-01-02 04:46:57.482475
39702	122	7	7	7	0	0	2017	7	2017-01-02 04:46:57.492517	2017-01-02 04:46:57.492517
39703	122	8	5	5	0	0	2017	5	2017-01-02 04:46:57.502587	2017-01-02 04:46:57.502587
39704	122	9	0	0	0	0	2017	0	2017-01-02 04:46:57.512547	2017-01-02 04:46:57.512547
39705	114	1	5	5	0	0	2017	5	2017-01-02 04:46:57.522635	2017-01-02 04:46:57.522635
39706	114	2	15	15	0	0	2017	15	2017-01-02 04:46:57.532593	2017-01-02 04:46:57.532593
39707	114	3	7	7	0	0	2017	7	2017-01-02 04:46:57.542626	2017-01-02 04:46:57.542626
39708	114	4	7	7	0	0	2017	7	2017-01-02 04:46:57.552617	2017-01-02 04:46:57.552617
39709	114	5	5	5	0	0	2017	5	2017-01-02 04:46:57.562671	2017-01-02 04:46:57.562671
39711	114	7	7	7	0	0	2017	7	2017-01-02 04:46:57.582755	2017-01-02 04:46:57.582755
39712	114	8	5	5	0	0	2017	5	2017-01-02 04:46:57.592749	2017-01-02 04:46:57.592749
39713	114	9	0	0	0	0	2017	0	2017-01-02 04:46:57.602777	2017-01-02 04:46:57.602777
39714	138	1	5	5	0	0	2017	5	2017-01-02 04:46:57.613034	2017-01-02 04:46:57.613034
39715	138	2	15	15	0	0	2017	15	2017-01-02 04:46:57.622838	2017-01-02 04:46:57.622838
39716	138	3	7	7	0	0	2017	7	2017-01-02 04:46:57.632864	2017-01-02 04:46:57.632864
39717	138	4	7	7	0	0	2017	7	2017-01-02 04:46:57.663012	2017-01-02 04:46:57.663012
39718	138	5	5	5	0	0	2017	5	2017-01-02 04:46:57.673215	2017-01-02 04:46:57.673215
39719	138	6	84	84	0	0	2017	84	2017-01-02 04:46:57.703768	2017-01-02 04:46:57.703768
39721	138	8	5	5	0	0	2017	5	2017-01-02 04:46:57.723691	2017-01-02 04:46:57.723691
39722	138	9	0	0	0	0	2017	0	2017-01-02 04:46:57.733642	2017-01-02 04:46:57.733642
39723	108	1	5	5	0	0	2017	5	2017-01-02 04:46:57.743792	2017-01-02 04:46:57.743792
39724	108	2	15	15	0	0	2017	15	2017-01-02 04:46:57.753555	2017-01-02 04:46:57.753555
39725	108	3	7	7	0	0	2017	7	2017-01-02 04:46:57.76356	2017-01-02 04:46:57.76356
39726	108	4	7	7	0	0	2017	7	2017-01-02 04:46:57.773542	2017-01-02 04:46:57.773542
39727	108	5	5	5	0	0	2017	5	2017-01-02 04:46:57.784118	2017-01-02 04:46:57.784118
39728	108	6	84	84	0	0	2017	84	2017-01-02 04:46:57.793518	2017-01-02 04:46:57.793518
39730	108	8	5	5	0	0	2017	5	2017-01-02 04:46:57.813568	2017-01-02 04:46:57.813568
39731	108	9	0	0	0	0	2017	0	2017-01-02 04:46:57.823592	2017-01-02 04:46:57.823592
39732	120	1	5	5	0	0	2017	5	2017-01-02 04:46:57.833609	2017-01-02 04:46:57.833609
39720	138	7	7	0	0	0	2017	0	2017-01-02 04:46:57.713793	2017-01-02 04:47:22.408863
39729	108	7	7	0	0	0	2017	0	2017-01-02 04:46:57.803528	2017-01-02 04:47:22.428963
39683	63	6	84	0	0	0	2017	0	2017-01-02 04:46:57.292092	2017-01-02 04:47:24.77482
39710	114	6	84	0	0	0	2017	0	2017-01-02 04:46:57.572667	2017-01-02 04:47:24.794859
39686	63	9	1	1	0	0	2017	1	2017-01-02 04:46:57.327438	2017-03-20 05:09:26.054286
39681	63	4	7	5	2	0	2017	7	2017-01-02 04:46:57.272181	2017-05-19 11:57:23.146213
39682	63	5	5	4	1	0	2017	5	2017-01-02 04:46:57.282075	2017-06-27 06:18:34.139534
39685	63	8	5	1	4	0	2017	5	2017-01-02 04:46:57.312815	2017-06-27 06:09:19.273957
5753	279	1	5	5	0	0	2015	5	2015-11-23 07:25:58.620779	2015-11-23 07:25:58.620779
5754	279	2	15	15	0	0	2015	15	2015-11-23 07:25:58.647146	2015-11-23 07:25:58.647146
5755	279	3	7	7	0	0	2015	7	2015-11-23 07:25:58.681196	2015-11-23 07:25:58.681196
5756	279	4	7	7	0	0	2015	7	2015-11-23 07:25:58.695207	2015-11-23 07:25:58.695207
5757	279	5	5	5	0	0	2015	5	2015-11-23 07:25:58.709963	2015-11-23 07:25:58.709963
5759	279	7	7	7	0	0	2015	7	2015-11-23 07:25:58.737994	2015-11-23 07:25:58.737994
5760	279	8	5	5	0	0	2015	5	2015-11-23 07:25:58.763194	2015-11-23 07:25:58.763194
5761	279	9	0	0	0	0	2015	0	2015-11-23 07:25:58.776862	2015-11-23 07:25:58.776862
5758	279	6	84	0	0	0	2015	0	2015-11-23 07:25:58.72411	2015-11-23 07:25:58.804394
39733	120	2	15	15	0	0	2017	15	2017-01-02 04:46:57.843624	2017-01-02 04:46:57.843624
39734	120	3	7	7	0	0	2017	7	2017-01-02 04:46:57.85369	2017-01-02 04:46:57.85369
39735	120	4	7	7	0	0	2017	7	2017-01-02 04:46:57.863756	2017-01-02 04:46:57.863756
39736	120	5	5	5	0	0	2017	5	2017-01-02 04:46:57.873697	2017-01-02 04:46:57.873697
39738	120	7	7	7	0	0	2017	7	2017-01-02 04:46:57.893741	2017-01-02 04:46:57.893741
39739	120	8	5	5	0	0	2017	5	2017-01-02 04:46:57.903796	2017-01-02 04:46:57.903796
39740	120	9	0	0	0	0	2017	0	2017-01-02 04:46:57.913763	2017-01-02 04:46:57.913763
39741	125	1	5	5	0	0	2017	5	2017-01-02 04:46:57.92386	2017-01-02 04:46:57.92386
39742	125	2	15	15	0	0	2017	15	2017-01-02 04:46:57.933787	2017-01-02 04:46:57.933787
39743	125	3	7	7	0	0	2017	7	2017-01-02 04:46:57.94389	2017-01-02 04:46:57.94389
39744	125	4	7	7	0	0	2017	7	2017-01-02 04:46:57.953803	2017-01-02 04:46:57.953803
39745	125	5	5	5	0	0	2017	5	2017-01-02 04:46:57.963967	2017-01-02 04:46:57.963967
39747	125	7	7	7	0	0	2017	7	2017-01-02 04:46:57.984013	2017-01-02 04:46:57.984013
39748	125	8	5	5	0	0	2017	5	2017-01-02 04:46:57.994007	2017-01-02 04:46:57.994007
39749	125	9	0	0	0	0	2017	0	2017-01-02 04:46:58.004031	2017-01-02 04:46:58.004031
39750	113	1	5	5	0	0	2017	5	2017-01-02 04:46:58.014083	2017-01-02 04:46:58.014083
39751	113	2	15	15	0	0	2017	15	2017-01-02 04:46:58.024107	2017-01-02 04:46:58.024107
39752	113	3	7	7	0	0	2017	7	2017-01-02 04:46:58.034003	2017-01-02 04:46:58.034003
39753	113	4	7	7	0	0	2017	7	2017-01-02 04:46:58.044075	2017-01-02 04:46:58.044075
39754	113	5	5	5	0	0	2017	5	2017-01-02 04:46:58.054114	2017-01-02 04:46:58.054114
39756	113	7	7	7	0	0	2017	7	2017-01-02 04:46:58.074113	2017-01-02 04:46:58.074113
39757	113	8	5	5	0	0	2017	5	2017-01-02 04:46:58.084165	2017-01-02 04:46:58.084165
39758	113	9	0	0	0	0	2017	0	2017-01-02 04:46:58.094164	2017-01-02 04:46:58.094164
39759	117	1	5	5	0	0	2017	5	2017-01-02 04:46:58.110175	2017-01-02 04:46:58.110175
39760	117	2	15	15	0	0	2017	15	2017-01-02 04:46:58.124223	2017-01-02 04:46:58.124223
39761	117	3	7	7	0	0	2017	7	2017-01-02 04:46:58.134161	2017-01-02 04:46:58.134161
39762	117	4	7	7	0	0	2017	7	2017-01-02 04:46:58.14411	2017-01-02 04:46:58.14411
39763	117	5	5	5	0	0	2017	5	2017-01-02 04:46:58.154119	2017-01-02 04:46:58.154119
39764	117	6	84	84	0	0	2017	84	2017-01-02 04:46:58.164178	2017-01-02 04:46:58.164178
39766	117	8	5	5	0	0	2017	5	2017-01-02 04:46:58.1842	2017-01-02 04:46:58.1842
39767	117	9	0	0	0	0	2017	0	2017-01-02 04:46:58.194295	2017-01-02 04:46:58.194295
39768	166	1	5	5	0	0	2017	5	2017-01-02 04:46:58.204233	2017-01-02 04:46:58.204233
39769	166	2	15	15	0	0	2017	15	2017-01-02 04:46:58.214264	2017-01-02 04:46:58.214264
39770	166	3	7	7	0	0	2017	7	2017-01-02 04:46:58.224307	2017-01-02 04:46:58.224307
39771	166	4	7	7	0	0	2017	7	2017-01-02 04:46:58.234367	2017-01-02 04:46:58.234367
39772	166	5	5	5	0	0	2017	5	2017-01-02 04:46:58.24434	2017-01-02 04:46:58.24434
39773	166	6	84	84	0	0	2017	84	2017-01-02 04:46:58.254522	2017-01-02 04:46:58.254522
39774	166	7	7	7	0	0	2017	7	2017-01-02 04:46:58.264526	2017-01-02 04:46:58.264526
39775	166	8	5	5	0	0	2017	5	2017-01-02 04:46:58.274495	2017-01-02 04:46:58.274495
39776	166	9	0	0	0	0	2017	0	2017-01-02 04:46:58.284531	2017-01-02 04:46:58.284531
39777	161	1	5	5	0	0	2017	5	2017-01-02 04:46:58.294544	2017-01-02 04:46:58.294544
39778	161	2	15	15	0	0	2017	15	2017-01-02 04:46:58.304584	2017-01-02 04:46:58.304584
39779	161	3	7	7	0	0	2017	7	2017-01-02 04:46:58.314578	2017-01-02 04:46:58.314578
39780	161	4	7	7	0	0	2017	7	2017-01-02 04:46:58.324614	2017-01-02 04:46:58.324614
39781	161	5	5	5	0	0	2017	5	2017-01-02 04:46:58.334644	2017-01-02 04:46:58.334644
39783	161	7	7	7	0	0	2017	7	2017-01-02 04:46:58.354671	2017-01-02 04:46:58.354671
39784	161	8	5	5	0	0	2017	5	2017-01-02 04:46:58.36472	2017-01-02 04:46:58.36472
39785	161	9	0	0	0	0	2017	0	2017-01-02 04:46:58.374723	2017-01-02 04:46:58.374723
39786	58	1	5	5	0	0	2017	5	2017-01-02 04:46:58.384765	2017-01-02 04:46:58.384765
39787	58	2	15	15	0	0	2017	15	2017-01-02 04:46:58.395745	2017-01-02 04:46:58.395745
39788	58	3	7	7	0	0	2017	7	2017-01-02 04:46:58.405531	2017-01-02 04:46:58.405531
39789	58	4	7	7	0	0	2017	7	2017-01-02 04:46:58.415493	2017-01-02 04:46:58.415493
39790	58	5	5	5	0	0	2017	5	2017-01-02 04:46:58.425397	2017-01-02 04:46:58.425397
39792	58	7	7	7	0	0	2017	7	2017-01-02 04:46:58.445324	2017-01-02 04:46:58.445324
39793	58	8	5	5	0	0	2017	5	2017-01-02 04:46:58.455537	2017-01-02 04:46:58.455537
39794	58	9	0	0	0	0	2017	0	2017-01-02 04:46:58.465245	2017-01-02 04:46:58.465245
39795	105	1	5	5	0	0	2017	5	2017-01-02 04:46:58.475289	2017-01-02 04:46:58.475289
39796	105	2	15	15	0	0	2017	15	2017-01-02 04:46:58.485213	2017-01-02 04:46:58.485213
39797	105	3	7	7	0	0	2017	7	2017-01-02 04:46:58.495249	2017-01-02 04:46:58.495249
39798	105	4	7	7	0	0	2017	7	2017-01-02 04:46:58.505272	2017-01-02 04:46:58.505272
39737	120	6	84	0	0	0	2017	0	2017-01-02 04:46:57.883752	2017-01-02 04:47:24.815005
39746	125	6	84	0	0	0	2017	0	2017-01-02 04:46:57.973944	2017-01-02 04:47:24.83502
39755	113	6	84	0	0	0	2017	0	2017-01-02 04:46:58.064135	2017-01-02 04:47:24.855043
39782	161	6	84	0	0	0	2017	0	2017-01-02 04:46:58.344649	2017-01-02 04:47:24.875121
39791	58	6	84	0	0	0	2017	0	2017-01-02 04:46:58.435421	2017-01-02 04:47:24.895169
5762	280	1	5	5	0	0	2015	5	2015-11-23 07:26:46.72571	2015-11-23 07:26:46.72571
5763	280	2	15	15	0	0	2015	15	2015-11-23 07:26:46.758006	2015-11-23 07:26:46.758006
5764	280	3	7	7	0	0	2015	7	2015-11-23 07:26:46.772419	2015-11-23 07:26:46.772419
5765	280	4	7	7	0	0	2015	7	2015-11-23 07:26:46.806694	2015-11-23 07:26:46.806694
5766	280	5	5	5	0	0	2015	5	2015-11-23 07:26:46.830662	2015-11-23 07:26:46.830662
5768	280	7	7	7	0	0	2015	7	2015-11-23 07:26:46.889845	2015-11-23 07:26:46.889845
5769	280	8	5	5	0	0	2015	5	2015-11-23 07:26:46.914807	2015-11-23 07:26:46.914807
5770	280	9	0	0	0	0	2015	0	2015-11-23 07:26:46.949046	2015-11-23 07:26:46.949046
5767	280	6	84	0	0	0	2015	0	2015-11-23 07:26:46.845539	2015-11-23 07:26:46.985589
5684	271	4	7	5	2	0	2015	7	2015-11-02 09:29:59.848297	2015-12-02 10:41:56.097729
39799	105	5	5	5	0	0	2017	5	2017-01-02 04:46:58.51533	2017-01-02 04:46:58.51533
39801	105	7	7	7	0	0	2017	7	2017-01-02 04:46:58.535365	2017-01-02 04:46:58.535365
39802	105	8	5	5	0	0	2017	5	2017-01-02 04:46:58.545426	2017-01-02 04:46:58.545426
39803	105	9	0	0	0	0	2017	0	2017-01-02 04:46:58.555451	2017-01-02 04:46:58.555451
39804	172	1	5	5	0	0	2017	5	2017-01-02 04:46:58.56547	2017-01-02 04:46:58.56547
39805	172	2	15	15	0	0	2017	15	2017-01-02 04:46:58.575497	2017-01-02 04:46:58.575497
39806	172	3	7	7	0	0	2017	7	2017-01-02 04:46:58.585518	2017-01-02 04:46:58.585518
39807	172	4	7	7	0	0	2017	7	2017-01-02 04:46:58.59555	2017-01-02 04:46:58.59555
39808	172	5	5	5	0	0	2017	5	2017-01-02 04:46:58.605534	2017-01-02 04:46:58.605534
39810	172	7	7	7	0	0	2017	7	2017-01-02 04:46:58.625612	2017-01-02 04:46:58.625612
39811	172	8	5	5	0	0	2017	5	2017-01-02 04:46:58.635724	2017-01-02 04:46:58.635724
39812	172	9	0	0	0	0	2017	0	2017-01-02 04:46:58.645667	2017-01-02 04:46:58.645667
39813	162	1	5	5	0	0	2017	5	2017-01-02 04:46:58.655696	2017-01-02 04:46:58.655696
39814	162	2	15	15	0	0	2017	15	2017-01-02 04:46:58.665707	2017-01-02 04:46:58.665707
39815	162	3	7	7	0	0	2017	7	2017-01-02 04:46:58.675772	2017-01-02 04:46:58.675772
39816	162	4	7	7	0	0	2017	7	2017-01-02 04:46:58.685759	2017-01-02 04:46:58.685759
39817	162	5	5	5	0	0	2017	5	2017-01-02 04:46:58.695803	2017-01-02 04:46:58.695803
39819	162	7	7	7	0	0	2017	7	2017-01-02 04:46:58.715859	2017-01-02 04:46:58.715859
39820	162	8	5	5	0	0	2017	5	2017-01-02 04:46:58.725855	2017-01-02 04:46:58.725855
39821	162	9	0	0	0	0	2017	0	2017-01-02 04:46:58.735929	2017-01-02 04:46:58.735929
39822	141	1	5	5	0	0	2017	5	2017-01-02 04:46:58.745894	2017-01-02 04:46:58.745894
39823	141	2	15	15	0	0	2017	15	2017-01-02 04:46:58.755971	2017-01-02 04:46:58.755971
39824	141	3	7	7	0	0	2017	7	2017-01-02 04:46:58.765917	2017-01-02 04:46:58.765917
39825	141	4	7	7	0	0	2017	7	2017-01-02 04:46:58.776008	2017-01-02 04:46:58.776008
39826	141	5	5	5	0	0	2017	5	2017-01-02 04:46:58.786003	2017-01-02 04:46:58.786003
39827	141	6	84	84	0	0	2017	84	2017-01-02 04:46:58.796073	2017-01-02 04:46:58.796073
39828	141	7	7	7	0	0	2017	7	2017-01-02 04:46:58.806041	2017-01-02 04:46:58.806041
39829	141	8	5	5	0	0	2017	5	2017-01-02 04:46:58.816117	2017-01-02 04:46:58.816117
39830	141	9	0	0	0	0	2017	0	2017-01-02 04:46:58.826076	2017-01-02 04:46:58.826076
39831	59	1	5	5	0	0	2017	5	2017-01-02 04:46:58.836224	2017-01-02 04:46:58.836224
39832	59	2	15	15	0	0	2017	15	2017-01-02 04:46:58.84616	2017-01-02 04:46:58.84616
39833	59	3	7	7	0	0	2017	7	2017-01-02 04:46:58.856288	2017-01-02 04:46:58.856288
39834	59	4	7	7	0	0	2017	7	2017-01-02 04:46:58.866248	2017-01-02 04:46:58.866248
39835	59	5	5	5	0	0	2017	5	2017-01-02 04:46:58.876303	2017-01-02 04:46:58.876303
39837	59	7	7	7	0	0	2017	7	2017-01-02 04:46:58.89634	2017-01-02 04:46:58.89634
39838	59	8	5	5	0	0	2017	5	2017-01-02 04:46:58.906338	2017-01-02 04:46:58.906338
39839	59	9	0	0	0	0	2017	0	2017-01-02 04:46:58.916384	2017-01-02 04:46:58.916384
39840	154	1	5	5	0	0	2017	5	2017-01-02 04:46:58.926382	2017-01-02 04:46:58.926382
39841	154	2	15	15	0	0	2017	15	2017-01-02 04:46:58.936436	2017-01-02 04:46:58.936436
39842	154	3	7	7	0	0	2017	7	2017-01-02 04:46:58.9464	2017-01-02 04:46:58.9464
39843	154	4	7	7	0	0	2017	7	2017-01-02 04:46:58.956478	2017-01-02 04:46:58.956478
39844	154	5	5	5	0	0	2017	5	2017-01-02 04:46:58.966475	2017-01-02 04:46:58.966475
39846	154	7	7	7	0	0	2017	7	2017-01-02 04:46:58.986525	2017-01-02 04:46:58.986525
39847	154	8	5	5	0	0	2017	5	2017-01-02 04:46:58.996514	2017-01-02 04:46:58.996514
39848	154	9	0	0	0	0	2017	0	2017-01-02 04:46:59.006571	2017-01-02 04:46:59.006571
39849	150	1	5	5	0	0	2017	5	2017-01-02 04:46:59.01655	2017-01-02 04:46:59.01655
39850	150	2	15	15	0	0	2017	15	2017-01-02 04:46:59.026627	2017-01-02 04:46:59.026627
39851	150	3	7	7	0	0	2017	7	2017-01-02 04:46:59.036665	2017-01-02 04:46:59.036665
39852	150	4	7	7	0	0	2017	7	2017-01-02 04:46:59.047188	2017-01-02 04:46:59.047188
39853	150	5	5	5	0	0	2017	5	2017-01-02 04:46:59.057277	2017-01-02 04:46:59.057277
39854	150	6	84	84	0	0	2017	84	2017-01-02 04:46:59.067329	2017-01-02 04:46:59.067329
39855	150	7	7	7	0	0	2017	7	2017-01-02 04:46:59.077184	2017-01-02 04:46:59.077184
39856	150	8	5	5	0	0	2017	5	2017-01-02 04:46:59.087464	2017-01-02 04:46:59.087464
39857	150	9	0	0	0	0	2017	0	2017-01-02 04:46:59.097446	2017-01-02 04:46:59.097446
39860	160	3	7	7	0	0	2017	7	2017-01-02 04:46:59.127434	2017-01-02 04:46:59.127434
39861	160	4	7	7	0	0	2017	7	2017-01-02 04:46:59.137343	2017-01-02 04:46:59.137343
39809	172	6	84	0	0	0	2017	0	2017-01-02 04:46:58.615612	2017-01-02 04:47:24.935304
39818	162	6	84	0	0	0	2017	0	2017-01-02 04:46:58.705827	2017-01-02 04:47:24.955344
39836	59	6	84	0	0	0	2017	0	2017-01-02 04:46:58.886296	2017-01-02 04:47:24.975417
39845	154	6	84	0	0	0	2017	0	2017-01-02 04:46:58.976503	2017-01-02 04:47:24.995446
39863	160	6	84	0	0	0	2017	0	2017-01-02 04:46:59.157187	2017-01-02 04:47:25.015507
39858	160	1	5	2	3	0	2017	5	2017-01-02 04:46:59.107437	2017-06-28 07:56:35.996583
39859	160	2	15	10	5	0	2017	15	2017-01-02 04:46:59.117394	2017-04-25 08:01:57.833764
39862	160	5	5	2.5	2.5	0	2017	5	2017-01-02 04:46:59.147356	2017-05-29 06:51:02.193358
5241	221	2	15	9	6	0	2015	15	2015-02-02 07:50:58.599824	2015-11-26 12:59:57.142391
5772	281	2	15	15	0	0	2015	15	2015-12-08 09:19:40.595636	2015-12-08 09:19:40.595636
5773	281	3	7	7	0	0	2015	7	2015-12-08 09:19:40.608742	2015-12-08 09:19:40.608742
5774	281	4	7	7	0	0	2015	7	2015-12-08 09:19:40.622099	2015-12-08 09:19:40.622099
5777	281	7	7	7	0	0	2015	7	2015-12-08 09:19:40.663622	2015-12-08 09:19:40.663622
5779	281	9	0	0	0	0	2015	0	2015-12-08 09:19:40.691691	2015-12-08 09:19:40.691691
5776	281	6	84	0	0	0	2015	0	2015-12-08 09:19:40.650109	2015-12-08 09:19:40.708967
5780	282	1	5	5	0	0	2015	5	2015-12-10 05:00:16.371739	2015-12-10 05:00:16.371739
5781	282	2	15	15	0	0	2015	15	2015-12-10 05:00:16.394779	2015-12-10 05:00:16.394779
5782	282	3	7	7	0	0	2015	7	2015-12-10 05:00:16.408496	2015-12-10 05:00:16.408496
5783	282	4	7	7	0	0	2015	7	2015-12-10 05:00:16.423452	2015-12-10 05:00:16.423452
5784	282	5	5	5	0	0	2015	5	2015-12-10 05:00:16.437411	2015-12-10 05:00:16.437411
5786	282	7	7	7	0	0	2015	7	2015-12-10 05:00:16.466289	2015-12-10 05:00:16.466289
5787	282	8	5	5	0	0	2015	5	2015-12-10 05:00:16.4802	2015-12-10 05:00:16.4802
5788	282	9	0	0	0	0	2015	0	2015-12-10 05:00:16.495849	2015-12-10 05:00:16.495849
5785	282	6	84	0	0	0	2015	0	2015-12-10 05:00:16.452429	2015-12-10 05:00:16.52193
5771	281	1	5	3	2	0	2015	5	2015-12-08 09:19:40.572714	2015-12-23 08:25:22.9616
5794	40	6	84	0	0	0	2016	0	2015-12-29 09:52:34.614102	2015-12-29 09:53:10.847832
5775	281	5	5	4	1	0	2015	5	2015-12-08 09:19:40.636575	2015-12-29 07:53:58.713379
5791	40	3	7	7	0	0	2016	7	2015-12-29 09:52:34.560396	2015-12-29 09:52:34.560396
5792	40	4	7	7	0	0	2016	7	2015-12-29 09:52:34.575177	2015-12-29 09:52:34.575177
5795	40	7	7	7	0	0	2016	7	2015-12-29 09:52:34.628095	2015-12-29 09:52:34.628095
5798	73	1	5	5	0	0	2016	5	2015-12-29 09:52:34.670898	2015-12-29 09:52:34.670898
5799	73	2	15	15	0	0	2016	15	2015-12-29 09:52:34.685764	2015-12-29 09:52:34.685764
5800	73	3	7	7	0	0	2016	7	2015-12-29 09:52:34.699784	2015-12-29 09:52:34.699784
5801	73	4	7	7	0	0	2016	7	2015-12-29 09:52:34.713676	2015-12-29 09:52:34.713676
5802	73	5	5	5	0	0	2016	5	2015-12-29 09:52:34.728637	2015-12-29 09:52:34.728637
5803	73	6	84	84	0	0	2016	84	2015-12-29 09:52:34.742576	2015-12-29 09:52:34.742576
5804	73	7	7	7	0	0	2016	7	2015-12-29 09:52:34.756478	2015-12-29 09:52:34.756478
5805	73	8	5	5	0	0	2016	5	2015-12-29 09:52:34.771395	2015-12-29 09:52:34.771395
5806	73	9	0	0	0	0	2016	0	2015-12-29 09:52:34.785414	2015-12-29 09:52:34.785414
5807	43	1	5	5	0	0	2016	5	2015-12-29 09:52:34.800382	2015-12-29 09:52:34.800382
5808	43	2	15	15	0	0	2016	15	2015-12-29 09:52:34.81427	2015-12-29 09:52:34.81427
5809	43	3	7	7	0	0	2016	7	2015-12-29 09:52:34.828287	2015-12-29 09:52:34.828287
5810	43	4	7	7	0	0	2016	7	2015-12-29 09:52:34.843206	2015-12-29 09:52:34.843206
5811	43	5	5	5	0	0	2016	5	2015-12-29 09:52:34.857113	2015-12-29 09:52:34.857113
5813	43	7	7	7	0	0	2016	7	2015-12-29 09:52:34.896201	2015-12-29 09:52:34.896201
5814	43	8	5	5	0	0	2016	5	2015-12-29 09:52:34.910018	2015-12-29 09:52:34.910018
5815	43	9	0	0	0	0	2016	0	2015-12-29 09:52:34.945259	2015-12-29 09:52:34.945259
5816	83	1	5	5	0	0	2016	5	2015-12-29 09:52:34.959141	2015-12-29 09:52:34.959141
5817	83	2	15	15	0	0	2016	15	2015-12-29 09:52:34.973048	2015-12-29 09:52:34.973048
5818	83	3	7	7	0	0	2016	7	2015-12-29 09:52:34.988032	2015-12-29 09:52:34.988032
5819	83	4	7	7	0	0	2016	7	2015-12-29 09:52:35.071055	2015-12-29 09:52:35.071055
5820	83	5	5	5	0	0	2016	5	2015-12-29 09:52:35.102809	2015-12-29 09:52:35.102809
5821	83	6	84	84	0	0	2016	84	2015-12-29 09:52:35.117716	2015-12-29 09:52:35.117716
5822	83	7	7	7	0	0	2016	7	2015-12-29 09:52:35.131716	2015-12-29 09:52:35.131716
5823	83	8	5	5	0	0	2016	5	2015-12-29 09:52:35.145586	2015-12-29 09:52:35.145586
5824	83	9	0	0	0	0	2016	0	2015-12-29 09:52:35.16053	2015-12-29 09:52:35.16053
5825	62	1	5	5	0	0	2016	5	2015-12-29 09:52:35.17446	2015-12-29 09:52:35.17446
5826	62	2	15	15	0	0	2016	15	2015-12-29 09:52:35.188404	2015-12-29 09:52:35.188404
5827	62	3	7	7	0	0	2016	7	2015-12-29 09:52:35.209946	2015-12-29 09:52:35.209946
5828	62	4	7	7	0	0	2016	7	2015-12-29 09:52:35.237955	2015-12-29 09:52:35.237955
5829	62	5	5	5	0	0	2016	5	2015-12-29 09:52:35.25241	2015-12-29 09:52:35.25241
5830	62	6	84	84	0	0	2016	84	2015-12-29 09:52:35.26639	2015-12-29 09:52:35.26639
5831	62	7	7	7	0	0	2016	7	2015-12-29 09:52:35.281066	2015-12-29 09:52:35.281066
5832	62	8	5	5	0	0	2016	5	2015-12-29 09:52:35.305412	2015-12-29 09:52:35.305412
5833	62	9	0	0	0	0	2016	0	2015-12-29 09:52:35.319369	2015-12-29 09:52:35.319369
5834	38	1	5	5	0	0	2016	5	2015-12-29 09:52:35.333568	2015-12-29 09:52:35.333568
5835	38	2	15	15	0	0	2016	15	2015-12-29 09:52:35.358728	2015-12-29 09:52:35.358728
5836	38	3	7	7	0	0	2016	7	2015-12-29 09:52:35.372287	2015-12-29 09:52:35.372287
5837	38	4	7	7	0	0	2016	7	2015-12-29 09:52:35.387147	2015-12-29 09:52:35.387147
5838	38	5	5	5	0	0	2016	5	2015-12-29 09:52:35.401172	2015-12-29 09:52:35.401172
5812	43	6	84	0	0	0	2016	0	2015-12-29 09:52:34.871049	2015-12-29 09:53:10.883076
5839	38	6	84	0	0	0	2016	0	2015-12-29 09:52:35.415079	2015-12-29 09:53:10.912145
5778	281	8	5	4	1	0	2015	5	2015-12-08 09:19:40.678117	2015-12-30 12:14:40.173167
5789	40	1	5	1	4	0	2016	5	2015-12-29 09:52:34.406416	2016-07-12 17:12:08.100333
5796	40	8	5	1	4	0	2016	5	2015-12-29 09:52:34.641974	2016-11-07 07:03:43.68491
5797	40	9	2	0	2	0	2016	2	2015-12-29 09:52:34.656895	2016-09-21 06:35:03.064171
5790	40	2	15	6	9	0	2016	15	2015-12-29 09:52:34.537528	2016-12-06 09:10:54.67958
5793	40	5	5	1.5	3.5	0	2016	5	2015-12-29 09:52:34.58909	2016-12-15 10:42:20.447994
39864	160	7	7	7	0	0	2017	7	2017-01-02 04:46:59.167183	2017-01-02 04:46:59.167183
39866	160	9	0	0	0	0	2017	0	2017-01-02 04:46:59.187279	2017-01-02 04:46:59.187279
39865	160	8	5	4	1	0	2017	5	2017-01-02 04:46:59.177235	2017-08-08 05:25:33.046348
39867	168	1	5	3	2	0	2017	5	2017-01-02 04:46:59.1972	2017-07-06 04:50:11.474246
5840	38	7	7	7	0	0	2016	7	2015-12-29 09:52:35.429999	2015-12-29 09:52:35.429999
5841	38	8	5	5	0	0	2016	5	2015-12-29 09:52:35.454743	2015-12-29 09:52:35.454743
5842	38	9	0	0	0	0	2016	0	2015-12-29 09:52:35.478225	2015-12-29 09:52:35.478225
5843	60	1	5	5	0	0	2016	5	2015-12-29 09:52:35.493227	2015-12-29 09:52:35.493227
5844	60	2	15	15	0	0	2016	15	2015-12-29 09:52:35.507108	2015-12-29 09:52:35.507108
5845	60	3	7	7	0	0	2016	7	2015-12-29 09:52:35.522061	2015-12-29 09:52:35.522061
5846	60	4	7	7	0	0	2016	7	2015-12-29 09:52:35.536113	2015-12-29 09:52:35.536113
5847	60	5	5	5	0	0	2016	5	2015-12-29 09:52:35.549942	2015-12-29 09:52:35.549942
5849	60	7	7	7	0	0	2016	7	2015-12-29 09:52:35.578834	2015-12-29 09:52:35.578834
5850	60	8	5	5	0	0	2016	5	2015-12-29 09:52:35.593873	2015-12-29 09:52:35.593873
5851	60	9	0	0	0	0	2016	0	2015-12-29 09:52:35.607697	2015-12-29 09:52:35.607697
5852	42	1	5	5	0	0	2016	5	2015-12-29 09:52:35.632227	2015-12-29 09:52:35.632227
5853	42	2	15	15	0	0	2016	15	2015-12-29 09:52:35.656872	2015-12-29 09:52:35.656872
5854	42	3	7	7	0	0	2016	7	2015-12-29 09:52:35.670854	2015-12-29 09:52:35.670854
5855	42	4	7	7	0	0	2016	7	2015-12-29 09:52:35.684735	2015-12-29 09:52:35.684735
5856	42	5	5	5	0	0	2016	5	2015-12-29 09:52:35.709883	2015-12-29 09:52:35.709883
5858	42	7	7	7	0	0	2016	7	2015-12-29 09:52:35.748753	2015-12-29 09:52:35.748753
5859	42	8	5	5	0	0	2016	5	2015-12-29 09:52:35.762737	2015-12-29 09:52:35.762737
5860	42	9	0	0	0	0	2016	0	2015-12-29 09:52:35.77667	2015-12-29 09:52:35.77667
5861	53	1	5	5	0	0	2016	5	2015-12-29 09:52:35.79156	2015-12-29 09:52:35.79156
5862	53	2	15	15	0	0	2016	15	2015-12-29 09:52:35.805582	2015-12-29 09:52:35.805582
5863	53	3	7	7	0	0	2016	7	2015-12-29 09:52:35.819504	2015-12-29 09:52:35.819504
5864	53	4	7	7	0	0	2016	7	2015-12-29 09:52:35.834437	2015-12-29 09:52:35.834437
5865	53	5	5	5	0	0	2016	5	2015-12-29 09:52:35.848345	2015-12-29 09:52:35.848345
5866	53	6	84	84	0	0	2016	84	2015-12-29 09:52:35.863581	2015-12-29 09:52:35.863581
5868	53	8	5	5	0	0	2016	5	2015-12-29 09:52:35.901408	2015-12-29 09:52:35.901408
5869	53	9	0	0	0	0	2016	0	2015-12-29 09:52:35.916359	2015-12-29 09:52:35.916359
5872	71	3	7	7	0	0	2016	7	2015-12-29 09:52:35.959276	2015-12-29 09:52:35.959276
5873	71	4	7	7	0	0	2016	7	2015-12-29 09:52:35.9831	2015-12-29 09:52:35.9831
5876	71	7	7	7	0	0	2016	7	2015-12-29 09:52:36.026009	2015-12-29 09:52:36.026009
5878	71	9	0	0	0	0	2016	0	2015-12-29 09:52:36.054839	2015-12-29 09:52:36.054839
5879	91	1	5	5	0	0	2016	5	2015-12-29 09:52:36.069843	2015-12-29 09:52:36.069843
5881	91	3	7	7	0	0	2016	7	2015-12-29 09:52:36.09772	2015-12-29 09:52:36.09772
5882	91	4	7	7	0	0	2016	7	2015-12-29 09:52:36.112621	2015-12-29 09:52:36.112621
5883	91	5	5	5	0	0	2016	5	2015-12-29 09:52:36.126374	2015-12-29 09:52:36.126374
5885	91	7	7	7	0	0	2016	7	2015-12-29 09:52:36.15527	2015-12-29 09:52:36.15527
5887	91	9	0	0	0	0	2016	0	2015-12-29 09:52:36.184209	2015-12-29 09:52:36.184209
5888	10	1	5	5	0	0	2016	5	2015-12-29 09:52:36.198072	2015-12-29 09:52:36.198072
5889	10	2	15	15	0	0	2016	15	2015-12-29 09:52:36.212063	2015-12-29 09:52:36.212063
5890	10	3	7	7	0	0	2016	7	2015-12-29 09:52:36.226998	2015-12-29 09:52:36.226998
5891	10	4	7	7	0	0	2016	7	2015-12-29 09:52:36.24098	2015-12-29 09:52:36.24098
5892	10	5	5	5	0	0	2016	5	2015-12-29 09:52:36.255876	2015-12-29 09:52:36.255876
5894	10	7	7	7	0	0	2016	7	2015-12-29 09:52:36.283843	2015-12-29 09:52:36.283843
5895	10	8	5	5	0	0	2016	5	2015-12-29 09:52:36.298738	2015-12-29 09:52:36.298738
5896	10	9	0	0	0	0	2016	0	2015-12-29 09:52:36.312623	2015-12-29 09:52:36.312623
5897	2	1	5	5	0	0	2016	5	2015-12-29 09:52:36.336757	2015-12-29 09:52:36.336757
5898	2	2	15	15	0	0	2016	15	2015-12-29 09:52:36.351672	2015-12-29 09:52:36.351672
5899	2	3	7	7	0	0	2016	7	2015-12-29 09:52:36.365556	2015-12-29 09:52:36.365556
5900	2	4	7	7	0	0	2016	7	2015-12-29 09:52:36.380512	2015-12-29 09:52:36.380512
5901	2	5	5	5	0	0	2016	5	2015-12-29 09:52:36.404649	2015-12-29 09:52:36.404649
5902	2	6	84	84	0	0	2016	84	2015-12-29 09:52:36.418553	2015-12-29 09:52:36.418553
5903	2	7	7	7	0	0	2016	7	2015-12-29 09:52:36.433466	2015-12-29 09:52:36.433466
5904	2	8	5	5	0	0	2016	5	2015-12-29 09:52:36.447458	2015-12-29 09:52:36.447458
5905	2	9	0	0	0	0	2016	0	2015-12-29 09:52:36.461341	2015-12-29 09:52:36.461341
5906	75	1	5	5	0	0	2016	5	2015-12-29 09:52:36.476273	2015-12-29 09:52:36.476273
5907	75	2	15	15	0	0	2016	15	2015-12-29 09:52:36.490184	2015-12-29 09:52:36.490184
5908	75	3	7	7	0	0	2016	7	2015-12-29 09:52:36.515266	2015-12-29 09:52:36.515266
5909	75	4	7	7	0	0	2016	7	2015-12-29 09:52:36.529189	2015-12-29 09:52:36.529189
5910	75	5	5	5	0	0	2016	5	2015-12-29 09:52:36.543119	2015-12-29 09:52:36.543119
5912	75	7	7	7	0	0	2016	7	2015-12-29 09:52:36.58243	2015-12-29 09:52:36.58243
5913	75	8	5	5	0	0	2016	5	2015-12-29 09:52:36.597058	2015-12-29 09:52:36.597058
5914	75	9	0	0	0	0	2016	0	2015-12-29 09:52:36.610921	2015-12-29 09:52:36.610921
5848	60	6	84	0	0	0	2016	0	2015-12-29 09:52:35.564879	2015-12-29 09:53:10.940898
5857	42	6	84	0	0	0	2016	0	2015-12-29 09:52:35.723834	2015-12-29 09:53:10.968805
5875	71	6	84	0	0	0	2016	0	2015-12-29 09:52:36.012075	2015-12-29 09:53:10.997671
5884	91	6	84	0	0	0	2016	0	2015-12-29 09:52:36.140299	2015-12-29 09:53:11.027788
5893	10	6	84	0	0	0	2016	0	2015-12-29 09:52:36.269818	2015-12-29 09:53:11.05634
5911	75	6	84	0	0	0	2016	0	2015-12-29 09:52:36.558026	2015-12-29 09:53:11.084193
5886	91	8	5	4	1	0	2016	5	2015-12-29 09:52:36.169247	2016-01-13 07:07:36.708242
5871	71	2	15	0	15	0	2016	15	2015-12-29 09:52:35.944999	2016-11-11 13:29:13.475216
5877	71	8	5	0	5	0	2016	5	2015-12-29 09:52:36.0409	2016-10-18 04:47:42.725567
5880	91	2	15	15	0	0	2016	15	2015-12-29 09:52:36.083499	2016-01-28 09:23:24.796181
5870	71	1	5	0	5	0	2016	5	2015-12-29 09:52:35.930046	2016-12-05 05:03:56.58772
5874	71	5	5	0.5	4.5	0	2016	5	2015-12-29 09:52:35.998069	2016-11-09 17:03:17.86604
5915	70	1	5	5	0	0	2016	5	2015-12-29 09:52:36.624958	2015-12-29 09:52:36.624958
5917	70	3	7	7	0	0	2016	7	2015-12-29 09:52:36.653807	2015-12-29 09:52:36.653807
5918	70	4	7	7	0	0	2016	7	2015-12-29 09:52:36.667714	2015-12-29 09:52:36.667714
39869	168	3	7	7	0	0	2017	7	2017-01-02 04:46:59.217167	2017-01-02 04:46:59.217167
5923	70	9	0	0	0	0	2016	0	2015-12-29 09:52:36.760569	2015-12-29 09:52:36.760569
5926	77	3	7	7	0	0	2016	7	2015-12-29 09:52:36.812609	2015-12-29 09:52:36.812609
5927	77	4	7	7	0	0	2016	7	2015-12-29 09:52:36.827594	2015-12-29 09:52:36.827594
5930	77	7	7	7	0	0	2016	7	2015-12-29 09:52:36.890621	2015-12-29 09:52:36.890621
5932	77	9	0	0	0	0	2016	0	2015-12-29 09:52:36.919469	2015-12-29 09:52:36.919469
5933	48	1	5	5	0	0	2016	5	2015-12-29 09:52:36.933336	2015-12-29 09:52:36.933336
5935	48	3	7	7	0	0	2016	7	2015-12-29 09:52:36.962298	2015-12-29 09:52:36.962298
5936	48	4	7	7	0	0	2016	7	2015-12-29 09:52:36.97626	2015-12-29 09:52:36.97626
5937	48	5	5	5	0	0	2016	5	2015-12-29 09:52:36.991075	2015-12-29 09:52:36.991075
5939	48	7	7	7	0	0	2016	7	2015-12-29 09:52:37.019071	2015-12-29 09:52:37.019071
5941	48	9	0	0	0	0	2016	0	2015-12-29 09:52:37.047976	2015-12-29 09:52:37.047976
5942	81	1	5	5	0	0	2016	5	2015-12-29 09:52:37.08312	2015-12-29 09:52:37.08312
5943	81	2	15	15	0	0	2016	15	2015-12-29 09:52:37.097071	2015-12-29 09:52:37.097071
5944	81	3	7	7	0	0	2016	7	2015-12-29 09:52:37.110953	2015-12-29 09:52:37.110953
5945	81	4	7	7	0	0	2016	7	2015-12-29 09:52:37.125884	2015-12-29 09:52:37.125884
5946	81	5	5	5	0	0	2016	5	2015-12-29 09:52:37.139931	2015-12-29 09:52:37.139931
5947	81	6	84	84	0	0	2016	84	2015-12-29 09:52:37.154083	2015-12-29 09:52:37.154083
5949	81	8	5	5	0	0	2016	5	2015-12-29 09:52:37.18264	2015-12-29 09:52:37.18264
5950	81	9	0	0	0	0	2016	0	2015-12-29 09:52:37.197635	2015-12-29 09:52:37.197635
5951	47	1	5	5	0	0	2016	5	2015-12-29 09:52:37.211637	2015-12-29 09:52:37.211637
5952	47	2	15	15	0	0	2016	15	2015-12-29 09:52:37.225522	2015-12-29 09:52:37.225522
5953	47	3	7	7	0	0	2016	7	2015-12-29 09:52:37.250723	2015-12-29 09:52:37.250723
5954	47	4	7	7	0	0	2016	7	2015-12-29 09:52:37.274787	2015-12-29 09:52:37.274787
5955	47	5	5	5	0	0	2016	5	2015-12-29 09:52:37.288561	2015-12-29 09:52:37.288561
5957	47	7	7	7	0	0	2016	7	2015-12-29 09:52:37.317543	2015-12-29 09:52:37.317543
5958	47	8	5	5	0	0	2016	5	2015-12-29 09:52:37.332412	2015-12-29 09:52:37.332412
5959	47	9	0	0	0	0	2016	0	2015-12-29 09:52:37.346314	2015-12-29 09:52:37.346314
5960	44	1	5	5	0	0	2016	5	2015-12-29 09:52:37.360325	2015-12-29 09:52:37.360325
5961	44	2	15	15	0	0	2016	15	2015-12-29 09:52:37.375265	2015-12-29 09:52:37.375265
5962	44	3	7	7	0	0	2016	7	2015-12-29 09:52:37.389264	2015-12-29 09:52:37.389264
5963	44	4	7	7	0	0	2016	7	2015-12-29 09:52:37.40427	2015-12-29 09:52:37.40427
5964	44	5	5	5	0	0	2016	5	2015-12-29 09:52:37.418056	2015-12-29 09:52:37.418056
5966	44	7	7	7	0	0	2016	7	2015-12-29 09:52:37.446952	2015-12-29 09:52:37.446952
5967	44	8	5	5	0	0	2016	5	2015-12-29 09:52:37.460829	2015-12-29 09:52:37.460829
5968	44	9	0	0	0	0	2016	0	2015-12-29 09:52:37.474816	2015-12-29 09:52:37.474816
5969	57	1	5	5	0	0	2016	5	2015-12-29 09:52:37.489807	2015-12-29 09:52:37.489807
5970	57	2	15	15	0	0	2016	15	2015-12-29 09:52:37.503819	2015-12-29 09:52:37.503819
5971	57	3	7	7	0	0	2016	7	2015-12-29 09:52:37.518618	2015-12-29 09:52:37.518618
5972	57	4	7	7	0	0	2016	7	2015-12-29 09:52:37.532653	2015-12-29 09:52:37.532653
5973	57	5	5	5	0	0	2016	5	2015-12-29 09:52:37.54661	2015-12-29 09:52:37.54661
5975	57	7	7	7	0	0	2016	7	2015-12-29 09:52:37.575466	2015-12-29 09:52:37.575466
5976	57	8	5	5	0	0	2016	5	2015-12-29 09:52:37.589433	2015-12-29 09:52:37.589433
5977	57	9	0	0	0	0	2016	0	2015-12-29 09:52:37.604428	2015-12-29 09:52:37.604428
5978	33	1	5	5	0	0	2016	5	2015-12-29 09:52:37.618333	2015-12-29 09:52:37.618333
5980	33	3	7	7	0	0	2016	7	2015-12-29 09:52:37.647129	2015-12-29 09:52:37.647129
5981	33	4	7	7	0	0	2016	7	2015-12-29 09:52:37.66109	2015-12-29 09:52:37.66109
5982	33	5	5	5	0	0	2016	5	2015-12-29 09:52:37.676028	2015-12-29 09:52:37.676028
5984	33	7	7	7	0	0	2016	7	2015-12-29 09:52:37.704967	2015-12-29 09:52:37.704967
5985	33	8	5	5	0	0	2016	5	2015-12-29 09:52:37.718871	2015-12-29 09:52:37.718871
5986	33	9	0	0	0	0	2016	0	2015-12-29 09:52:37.732764	2015-12-29 09:52:37.732764
5987	30	1	5	5	0	0	2016	5	2015-12-29 09:52:37.747741	2015-12-29 09:52:37.747741
5988	30	2	15	15	0	0	2016	15	2015-12-29 09:52:37.761681	2015-12-29 09:52:37.761681
5989	30	3	7	7	0	0	2016	7	2015-12-29 09:52:37.77564	2015-12-29 09:52:37.77564
5948	81	7	7	0	0	0	2016	0	2015-12-29 09:52:37.168749	2015-12-29 09:53:09.516441
5929	77	6	84	0	0	0	2016	0	2015-12-29 09:52:36.876716	2015-12-29 09:53:11.113158
5938	48	6	84	0	0	0	2016	0	2015-12-29 09:52:37.005151	2015-12-29 09:53:11.141941
5956	47	6	84	0	0	0	2016	0	2015-12-29 09:52:37.303534	2015-12-29 09:53:11.170794
5965	44	6	84	0	0	0	2016	0	2015-12-29 09:52:37.432052	2015-12-29 09:53:11.20887
5974	57	6	84	0	0	0	2016	0	2015-12-29 09:52:37.561502	2015-12-29 09:53:11.237644
5983	33	6	84	0	0	0	2016	0	2015-12-29 09:52:37.690036	2015-12-29 09:53:11.266553
5920	70	6	84	60	24	0	2016	84	2015-12-29 09:52:36.706749	2016-01-01 07:27:41.655837
5922	70	8	5	2	3	0	2016	5	2015-12-29 09:52:36.736375	2016-12-26 04:57:40.099542
5979	33	2	15	14	1	0	2016	15	2015-12-29 09:52:37.633174	2016-01-28 05:55:49.903165
5925	77	2	15	0	15	0	2016	15	2015-12-29 09:52:36.798682	2016-12-29 07:23:03.025542
5940	48	8	5	3	2	0	2016	5	2015-12-29 09:52:37.033983	2016-03-18 08:57:43.039889
5928	77	5	5	1	4	0	2016	5	2015-12-29 09:52:36.841515	2016-11-29 06:42:26.750823
5934	48	2	15	12	3	0	2016	15	2015-12-29 09:52:36.947356	2016-03-04 08:18:14.34131
5924	77	1	5	0	5	0	2016	5	2015-12-29 09:52:36.784743	2016-06-24 06:07:04.465387
5916	70	2	15	7	8	0	2016	15	2015-12-29 09:52:36.639882	2016-11-22 13:22:25.705273
5931	77	8	5	0	5	0	2016	5	2015-12-29 09:52:36.904547	2016-11-29 06:36:18.375559
5990	30	4	7	7	0	0	2016	7	2015-12-29 09:52:37.790565	2015-12-29 09:52:37.790565
5991	30	5	5	5	0	0	2016	5	2015-12-29 09:52:37.80454	2015-12-29 09:52:37.80454
39870	168	4	7	7	0	0	2017	7	2017-01-02 04:46:59.22717	2017-01-02 04:46:59.22717
5993	30	7	7	7	0	0	2016	7	2015-12-29 09:52:37.833405	2015-12-29 09:52:37.833405
5994	30	8	5	5	0	0	2016	5	2015-12-29 09:52:37.847335	2015-12-29 09:52:37.847335
5995	30	9	0	0	0	0	2016	0	2015-12-29 09:52:37.862244	2015-12-29 09:52:37.862244
5996	67	1	5	5	0	0	2016	5	2015-12-29 09:52:37.876232	2015-12-29 09:52:37.876232
5997	67	2	15	15	0	0	2016	15	2015-12-29 09:52:37.890095	2015-12-29 09:52:37.890095
5998	67	3	7	7	0	0	2016	7	2015-12-29 09:52:37.905164	2015-12-29 09:52:37.905164
5999	67	4	7	7	0	0	2016	7	2015-12-29 09:52:37.919042	2015-12-29 09:52:37.919042
6000	67	5	5	5	0	0	2016	5	2015-12-29 09:52:37.935071	2015-12-29 09:52:37.935071
6002	67	7	7	7	0	0	2016	7	2015-12-29 09:52:37.97254	2015-12-29 09:52:37.97254
6003	67	8	5	5	0	0	2016	5	2015-12-29 09:52:37.987113	2015-12-29 09:52:37.987113
6004	67	9	0	0	0	0	2016	0	2015-12-29 09:52:38.000744	2015-12-29 09:52:38.000744
6008	41	4	7	7	0	0	2016	7	2015-12-29 09:52:38.066439	2015-12-29 09:52:38.066439
6011	41	7	7	7	0	0	2016	7	2015-12-29 09:52:38.128585	2015-12-29 09:52:38.128585
6012	41	8	5	5	0	0	2016	5	2015-12-29 09:52:38.153334	2015-12-29 09:52:38.153334
6013	41	9	0	0	0	0	2016	0	2015-12-29 09:52:38.177138	2015-12-29 09:52:38.177138
6016	94	3	7	7	0	0	2016	7	2015-12-29 09:52:38.229076	2015-12-29 09:52:38.229076
6017	94	4	7	7	0	0	2016	7	2015-12-29 09:52:38.243802	2015-12-29 09:52:38.243802
6018	94	5	5	5	0	0	2016	5	2015-12-29 09:52:38.257412	2015-12-29 09:52:38.257412
6020	94	7	7	7	0	0	2016	7	2015-12-29 09:52:38.285623	2015-12-29 09:52:38.285623
6022	94	9	0	0	0	0	2016	0	2015-12-29 09:52:38.312984	2015-12-29 09:52:38.312984
6025	45	3	7	7	0	0	2016	7	2015-12-29 09:52:38.354893	2015-12-29 09:52:38.354893
6026	45	4	7	7	0	0	2016	7	2015-12-29 09:52:38.369576	2015-12-29 09:52:38.369576
6029	45	7	7	7	0	0	2016	7	2015-12-29 09:52:38.421715	2015-12-29 09:52:38.421715
6030	45	8	5	5	0	0	2016	5	2015-12-29 09:52:38.435263	2015-12-29 09:52:38.435263
6031	45	9	0	0	0	0	2016	0	2015-12-29 09:52:38.44888	2015-12-29 09:52:38.44888
6032	76	1	5	5	0	0	2016	5	2015-12-29 09:52:38.46351	2015-12-29 09:52:38.46351
6033	76	2	15	15	0	0	2016	15	2015-12-29 09:52:38.47715	2015-12-29 09:52:38.47715
6034	76	3	7	7	0	0	2016	7	2015-12-29 09:52:38.491808	2015-12-29 09:52:38.491808
6035	76	4	7	7	0	0	2016	7	2015-12-29 09:52:38.505393	2015-12-29 09:52:38.505393
6036	76	5	5	5	0	0	2016	5	2015-12-29 09:52:38.519062	2015-12-29 09:52:38.519062
6038	76	7	7	7	0	0	2016	7	2015-12-29 09:52:38.557468	2015-12-29 09:52:38.557468
6039	76	8	5	5	0	0	2016	5	2015-12-29 09:52:38.581308	2015-12-29 09:52:38.581308
6040	76	9	0	0	0	0	2016	0	2015-12-29 09:52:38.595822	2015-12-29 09:52:38.595822
6041	34	1	5	5	0	0	2016	5	2015-12-29 09:52:38.609482	2015-12-29 09:52:38.609482
6042	34	2	15	15	0	0	2016	15	2015-12-29 09:52:38.623107	2015-12-29 09:52:38.623107
6043	34	3	7	7	0	0	2016	7	2015-12-29 09:52:38.63776	2015-12-29 09:52:38.63776
6044	34	4	7	7	0	0	2016	7	2015-12-29 09:52:38.651416	2015-12-29 09:52:38.651416
6045	34	5	5	5	0	0	2016	5	2015-12-29 09:52:38.665059	2015-12-29 09:52:38.665059
6047	34	7	7	7	0	0	2016	7	2015-12-29 09:52:38.693424	2015-12-29 09:52:38.693424
6048	34	8	5	5	0	0	2016	5	2015-12-29 09:52:38.717213	2015-12-29 09:52:38.717213
6049	34	9	0	0	0	0	2016	0	2015-12-29 09:52:38.731769	2015-12-29 09:52:38.731769
6050	36	1	5	5	0	0	2016	5	2015-12-29 09:52:38.755425	2015-12-29 09:52:38.755425
6051	36	2	15	15	0	0	2016	15	2015-12-29 09:52:38.76917	2015-12-29 09:52:38.76917
6052	36	3	7	7	0	0	2016	7	2015-12-29 09:52:38.783834	2015-12-29 09:52:38.783834
6053	36	4	7	7	0	0	2016	7	2015-12-29 09:52:38.797425	2015-12-29 09:52:38.797425
6054	36	5	5	5	0	0	2016	5	2015-12-29 09:52:38.812052	2015-12-29 09:52:38.812052
6056	36	7	7	7	0	0	2016	7	2015-12-29 09:52:38.839396	2015-12-29 09:52:38.839396
6057	36	8	5	5	0	0	2016	5	2015-12-29 09:52:38.853988	2015-12-29 09:52:38.853988
6058	36	9	0	0	0	0	2016	0	2015-12-29 09:52:38.867731	2015-12-29 09:52:38.867731
6059	55	1	5	5	0	0	2016	5	2015-12-29 09:52:38.881291	2015-12-29 09:52:38.881291
6060	55	2	15	15	0	0	2016	15	2015-12-29 09:52:38.896021	2015-12-29 09:52:38.896021
6061	55	3	7	7	0	0	2016	7	2015-12-29 09:52:38.909604	2015-12-29 09:52:38.909604
6062	55	4	7	7	0	0	2016	7	2015-12-29 09:52:38.923256	2015-12-29 09:52:38.923256
6063	55	5	5	5	0	0	2016	5	2015-12-29 09:52:38.96855	2015-12-29 09:52:38.96855
6001	67	6	84	0	0	0	2016	0	2015-12-29 09:52:37.948697	2015-12-29 09:53:11.333322
6010	41	6	84	0	0	0	2016	0	2015-12-29 09:52:38.115011	2015-12-29 09:53:11.362173
6019	94	6	84	0	0	0	2016	0	2015-12-29 09:52:38.271111	2015-12-29 09:53:11.401618
6028	45	6	84	0	0	0	2016	0	2015-12-29 09:52:38.396824	2015-12-29 09:53:11.430124
6037	76	6	84	0	0	0	2016	0	2015-12-29 09:52:38.54392	2015-12-29 09:53:11.458949
6046	34	6	84	0	0	0	2016	0	2015-12-29 09:52:38.67977	2015-12-29 09:53:11.497006
6055	36	6	84	0	0	0	2016	0	2015-12-29 09:52:38.825703	2015-12-29 09:53:11.536035
6064	55	6	84	0	0	0	2016	0	2015-12-29 09:52:39.002006	2015-12-29 09:53:11.564777
6015	94	2	15	9	6	0	2016	15	2015-12-29 09:52:38.215587	2016-01-12 07:02:24.294588
6021	94	8	5	4	1	0	2016	5	2015-12-29 09:52:38.299329	2016-01-12 07:02:45.18926
6014	94	1	5	4	1	0	2016	5	2015-12-29 09:52:38.191727	2016-02-29 07:14:15.229106
6005	41	1	5	0	5	0	2016	5	2015-12-29 09:52:38.014408	2016-06-22 10:03:15.673792
6024	45	2	15	10	5	0	2016	15	2015-12-29 09:52:38.341293	2016-11-28 08:04:32.300004
6007	41	3	7	0	7	0	2016	7	2015-12-29 09:52:38.05302	2016-03-28 10:33:24.868206
6006	41	2	15	3	12	0	2016	15	2015-12-29 09:52:38.029089	2016-08-25 05:30:23.144057
6027	45	5	5	4.5	0.5	0	2016	5	2015-12-29 09:52:38.383213	2016-03-31 02:46:15.204447
6009	41	5	5	0	5	0	2016	5	2015-12-29 09:52:38.091178	2016-09-28 09:47:47.270414
6065	55	7	7	7	0	0	2016	7	2015-12-29 09:52:39.015683	2015-12-29 09:52:39.015683
6066	55	8	5	5	0	0	2016	5	2015-12-29 09:52:39.040519	2015-12-29 09:52:39.040519
6067	55	9	0	0	0	0	2016	0	2015-12-29 09:52:39.064258	2015-12-29 09:52:39.064258
6068	50	1	5	5	0	0	2016	5	2015-12-29 09:52:39.077794	2015-12-29 09:52:39.077794
6069	50	2	15	15	0	0	2016	15	2015-12-29 09:52:39.102605	2015-12-29 09:52:39.102605
6070	50	3	7	7	0	0	2016	7	2015-12-29 09:52:39.116203	2015-12-29 09:52:39.116203
6071	50	4	7	7	0	0	2016	7	2015-12-29 09:52:39.130766	2015-12-29 09:52:39.130766
6072	50	5	5	5	0	0	2016	5	2015-12-29 09:52:39.144447	2015-12-29 09:52:39.144447
6074	50	7	7	7	0	0	2016	7	2015-12-29 09:52:39.182795	2015-12-29 09:52:39.182795
6075	50	8	5	5	0	0	2016	5	2015-12-29 09:52:39.196454	2015-12-29 09:52:39.196454
6076	50	9	0	0	0	0	2016	0	2015-12-29 09:52:39.210209	2015-12-29 09:52:39.210209
6079	95	3	7	7	0	0	2016	7	2015-12-29 09:52:39.262196	2015-12-29 09:52:39.262196
6080	95	4	7	7	0	0	2016	7	2015-12-29 09:52:39.276784	2015-12-29 09:52:39.276784
6083	95	7	7	7	0	0	2016	7	2015-12-29 09:52:39.328881	2015-12-29 09:52:39.328881
6086	32	1	5	5	0	0	2016	5	2015-12-29 09:52:39.370716	2015-12-29 09:52:39.370716
6087	32	2	15	15	0	0	2016	15	2015-12-29 09:52:39.384398	2015-12-29 09:52:39.384398
6088	32	3	7	7	0	0	2016	7	2015-12-29 09:52:39.398005	2015-12-29 09:52:39.398005
6089	32	4	7	7	0	0	2016	7	2015-12-29 09:52:39.432977	2015-12-29 09:52:39.432977
6090	32	5	5	5	0	0	2016	5	2015-12-29 09:52:39.446577	2015-12-29 09:52:39.446577
6092	32	7	7	7	0	0	2016	7	2015-12-29 09:52:39.495082	2015-12-29 09:52:39.495082
6093	32	8	5	5	0	0	2016	5	2015-12-29 09:52:39.508672	2015-12-29 09:52:39.508672
6094	32	9	0	0	0	0	2016	0	2015-12-29 09:52:39.523859	2015-12-29 09:52:39.523859
6095	97	1	5	5	0	0	2016	5	2015-12-29 09:52:39.550604	2015-12-29 09:52:39.550604
6096	97	2	15	15	0	0	2016	15	2015-12-29 09:52:39.565245	2015-12-29 09:52:39.565245
6097	97	3	7	7	0	0	2016	7	2015-12-29 09:52:39.57888	2015-12-29 09:52:39.57888
6098	97	4	7	7	0	0	2016	7	2015-12-29 09:52:39.592536	2015-12-29 09:52:39.592536
6099	97	5	5	5	0	0	2016	5	2015-12-29 09:52:39.617233	2015-12-29 09:52:39.617233
6100	97	6	84	84	0	0	2016	84	2015-12-29 09:52:39.630935	2015-12-29 09:52:39.630935
6102	97	8	5	5	0	0	2016	5	2015-12-29 09:52:39.659168	2015-12-29 09:52:39.659168
6103	97	9	0	0	0	0	2016	0	2015-12-29 09:52:39.672817	2015-12-29 09:52:39.672817
6104	96	1	5	5	0	0	2016	5	2015-12-29 09:52:39.686509	2015-12-29 09:52:39.686509
6105	96	2	15	15	0	0	2016	15	2015-12-29 09:52:39.714812	2015-12-29 09:52:39.714812
6106	96	3	7	7	0	0	2016	7	2015-12-29 09:52:39.754219	2015-12-29 09:52:39.754219
6107	96	4	7	7	0	0	2016	7	2015-12-29 09:52:39.787191	2015-12-29 09:52:39.787191
6108	96	5	5	5	0	0	2016	5	2015-12-29 09:52:39.801644	2015-12-29 09:52:39.801644
6110	96	7	7	7	0	0	2016	7	2015-12-29 09:52:39.828886	2015-12-29 09:52:39.828886
6111	96	8	5	5	0	0	2016	5	2015-12-29 09:52:39.843572	2015-12-29 09:52:39.843572
6112	96	9	0	0	0	0	2016	0	2015-12-29 09:52:39.858305	2015-12-29 09:52:39.858305
6113	82	1	5	5	0	0	2016	5	2015-12-29 09:52:39.881196	2015-12-29 09:52:39.881196
6114	82	2	15	15	0	0	2016	15	2015-12-29 09:52:39.895803	2015-12-29 09:52:39.895803
6115	82	3	7	7	0	0	2016	7	2015-12-29 09:52:39.909423	2015-12-29 09:52:39.909423
6116	82	4	7	7	0	0	2016	7	2015-12-29 09:52:39.923074	2015-12-29 09:52:39.923074
6117	82	5	5	5	0	0	2016	5	2015-12-29 09:52:39.937736	2015-12-29 09:52:39.937736
6119	82	7	7	7	0	0	2016	7	2015-12-29 09:52:39.964998	2015-12-29 09:52:39.964998
6120	82	8	5	5	0	0	2016	5	2015-12-29 09:52:39.979674	2015-12-29 09:52:39.979674
6121	82	9	0	0	0	0	2016	0	2015-12-29 09:52:39.99334	2015-12-29 09:52:39.99334
6122	74	1	5	5	0	0	2016	5	2015-12-29 09:52:40.006966	2015-12-29 09:52:40.006966
6123	74	2	15	15	0	0	2016	15	2015-12-29 09:52:40.021577	2015-12-29 09:52:40.021577
6124	74	3	7	7	0	0	2016	7	2015-12-29 09:52:40.035316	2015-12-29 09:52:40.035316
6125	74	4	7	7	0	0	2016	7	2015-12-29 09:52:40.049995	2015-12-29 09:52:40.049995
6126	74	5	5	5	0	0	2016	5	2015-12-29 09:52:40.063555	2015-12-29 09:52:40.063555
6128	74	7	7	7	0	0	2016	7	2015-12-29 09:52:40.091859	2015-12-29 09:52:40.091859
6129	74	8	5	5	0	0	2016	5	2015-12-29 09:52:40.105426	2015-12-29 09:52:40.105426
6130	74	9	0	0	0	0	2016	0	2015-12-29 09:52:40.118972	2015-12-29 09:52:40.118972
6134	51	4	7	7	0	0	2016	7	2015-12-29 09:52:40.195916	2015-12-29 09:52:40.195916
6136	51	6	84	84	0	0	2016	84	2015-12-29 09:52:40.243371	2015-12-29 09:52:40.243371
6139	51	9	0	0	0	0	2016	0	2015-12-29 09:52:40.295401	2015-12-29 09:52:40.295401
6137	51	7	7	0	0	0	2016	0	2015-12-29 09:52:40.25796	2015-12-29 09:53:09.57336
6073	50	6	84	0	0	0	2016	0	2015-12-29 09:52:39.16831	2015-12-29 09:53:11.59368
6082	95	6	84	0	0	0	2016	0	2015-12-29 09:52:39.304125	2015-12-29 09:53:11.621594
6091	32	6	84	0	0	0	2016	0	2015-12-29 09:52:39.471249	2015-12-29 09:53:11.660596
6109	96	6	84	0	0	0	2016	0	2015-12-29 09:52:39.815287	2015-12-29 09:53:11.689419
6118	82	6	84	0	0	0	2016	0	2015-12-29 09:52:39.951382	2015-12-29 09:53:11.728416
6127	74	6	84	0	0	0	2016	0	2015-12-29 09:52:40.077249	2015-12-29 09:53:11.766432
6132	51	2	15	0	15	0	2016	15	2015-12-29 09:52:40.167726	2016-12-23 08:49:44.086533
6131	51	1	5	1	4	0	2016	5	2015-12-29 09:52:40.143951	2016-08-26 08:45:39.004613
6135	51	5	5	0.5	4.5	0	2016	5	2015-12-29 09:52:40.220089	2016-11-18 06:22:58.462196
6077	95	1	5	1	4	0	2016	5	2015-12-29 09:52:39.224738	2016-09-23 05:36:58.683787
6084	95	8	5	3	2	0	2016	5	2015-12-29 09:52:39.342429	2016-08-29 14:35:27.563698
6138	51	8	5	0	5	0	2016	5	2015-12-29 09:52:40.28187	2016-10-06 12:58:32.676041
6085	95	9	2	0	2	0	2016	2	2015-12-29 09:52:39.356118	2016-06-27 07:58:43.063724
6133	51	3	7	6	1	0	2016	7	2015-12-29 09:52:40.181191	2016-05-31 06:03:57.445187
6081	95	5	5	4	1	0	2016	5	2015-12-29 09:52:39.290412	2016-08-17 04:11:02.961936
6142	102	3	7	7	0	0	2016	7	2015-12-29 09:52:40.347518	2015-12-29 09:52:40.347518
6143	102	4	7	7	0	0	2016	7	2015-12-29 09:52:40.362109	2015-12-29 09:52:40.362109
6144	102	5	5	5	0	0	2016	5	2015-12-29 09:52:40.375726	2015-12-29 09:52:40.375726
6146	102	7	7	7	0	0	2016	7	2015-12-29 09:52:40.40404	2015-12-29 09:52:40.40404
6151	52	3	7	7	0	0	2016	7	2015-12-29 09:52:40.474167	2015-12-29 09:52:40.474167
6152	52	4	7	7	0	0	2016	7	2015-12-29 09:52:40.48782	2015-12-29 09:52:40.48782
6154	52	6	84	84	0	0	2016	84	2015-12-29 09:52:40.526294	2015-12-29 09:52:40.526294
39872	168	6	84	84	0	0	2017	84	2017-01-02 04:46:59.247146	2017-01-02 04:46:59.247146
6158	29	1	5	5	0	0	2016	5	2015-12-29 09:52:40.592059	2015-12-29 09:52:40.592059
6159	29	2	15	15	0	0	2016	15	2015-12-29 09:52:40.615753	2015-12-29 09:52:40.615753
6160	29	3	7	7	0	0	2016	7	2015-12-29 09:52:40.721853	2015-12-29 09:52:40.721853
6161	29	4	7	7	0	0	2016	7	2015-12-29 09:52:40.744868	2015-12-29 09:52:40.744868
6162	29	5	5	5	0	0	2016	5	2015-12-29 09:52:40.759376	2015-12-29 09:52:40.759376
6164	29	7	7	7	0	0	2016	7	2015-12-29 09:52:40.807003	2015-12-29 09:52:40.807003
6165	29	8	5	5	0	0	2016	5	2015-12-29 09:52:40.821641	2015-12-29 09:52:40.821641
6166	29	9	0	0	0	0	2016	0	2015-12-29 09:52:40.835272	2015-12-29 09:52:40.835272
6167	46	1	5	5	0	0	2016	5	2015-12-29 09:52:40.84896	2015-12-29 09:52:40.84896
6168	46	2	15	15	0	0	2016	15	2015-12-29 09:52:40.863589	2015-12-29 09:52:40.863589
6169	46	3	7	7	0	0	2016	7	2015-12-29 09:52:40.877227	2015-12-29 09:52:40.877227
6170	46	4	7	7	0	0	2016	7	2015-12-29 09:52:40.890853	2015-12-29 09:52:40.890853
6171	46	5	5	5	0	0	2016	5	2015-12-29 09:52:40.905518	2015-12-29 09:52:40.905518
6173	46	7	7	7	0	0	2016	7	2015-12-29 09:52:40.932752	2015-12-29 09:52:40.932752
6174	46	8	5	5	0	0	2016	5	2015-12-29 09:52:40.947409	2015-12-29 09:52:40.947409
6175	46	9	0	0	0	0	2016	0	2015-12-29 09:52:40.971297	2015-12-29 09:52:40.971297
6176	28	1	5	5	0	0	2016	5	2015-12-29 09:52:40.984791	2015-12-29 09:52:40.984791
6177	28	2	15	15	0	0	2016	15	2015-12-29 09:52:41.070871	2015-12-29 09:52:41.070871
6178	28	3	7	7	0	0	2016	7	2015-12-29 09:52:41.140863	2015-12-29 09:52:41.140863
6179	28	4	7	7	0	0	2016	7	2015-12-29 09:52:41.154314	2015-12-29 09:52:41.154314
6180	28	5	5	5	0	0	2016	5	2015-12-29 09:52:41.167991	2015-12-29 09:52:41.167991
6182	28	7	7	7	0	0	2016	7	2015-12-29 09:52:41.196277	2015-12-29 09:52:41.196277
6183	28	8	5	5	0	0	2016	5	2015-12-29 09:52:41.210879	2015-12-29 09:52:41.210879
6184	28	9	0	0	0	0	2016	0	2015-12-29 09:52:41.224531	2015-12-29 09:52:41.224531
6185	68	1	5	5	0	0	2016	5	2015-12-29 09:52:41.23815	2015-12-29 09:52:41.23815
6186	68	2	15	15	0	0	2016	15	2015-12-29 09:52:41.252786	2015-12-29 09:52:41.252786
6187	68	3	7	7	0	0	2016	7	2015-12-29 09:52:41.266499	2015-12-29 09:52:41.266499
6188	68	4	7	7	0	0	2016	7	2015-12-29 09:52:41.280144	2015-12-29 09:52:41.280144
6189	68	5	5	5	0	0	2016	5	2015-12-29 09:52:41.294738	2015-12-29 09:52:41.294738
6191	68	7	7	7	0	0	2016	7	2015-12-29 09:52:41.322017	2015-12-29 09:52:41.322017
6192	68	8	5	5	0	0	2016	5	2015-12-29 09:52:41.336656	2015-12-29 09:52:41.336656
6193	68	9	0	0	0	0	2016	0	2015-12-29 09:52:41.350293	2015-12-29 09:52:41.350293
6194	106	1	5	5	0	0	2016	5	2015-12-29 09:52:41.364057	2015-12-29 09:52:41.364057
6195	106	2	15	15	0	0	2016	15	2015-12-29 09:52:41.378591	2015-12-29 09:52:41.378591
6196	106	3	7	7	0	0	2016	7	2015-12-29 09:52:41.392311	2015-12-29 09:52:41.392311
6197	106	4	7	7	0	0	2016	7	2015-12-29 09:52:41.405875	2015-12-29 09:52:41.405875
6198	106	5	5	5	0	0	2016	5	2015-12-29 09:52:41.430603	2015-12-29 09:52:41.430603
6199	106	6	84	84	0	0	2016	84	2015-12-29 09:52:41.444294	2015-12-29 09:52:41.444294
6201	106	8	5	5	0	0	2016	5	2015-12-29 09:52:41.472602	2015-12-29 09:52:41.472602
6202	106	9	0	0	0	0	2016	0	2015-12-29 09:52:41.486197	2015-12-29 09:52:41.486197
6203	100	1	5	5	0	0	2016	5	2015-12-29 09:52:41.500819	2015-12-29 09:52:41.500819
6204	100	2	15	15	0	0	2016	15	2015-12-29 09:52:41.514491	2015-12-29 09:52:41.514491
6205	100	3	7	7	0	0	2016	7	2015-12-29 09:52:41.528183	2015-12-29 09:52:41.528183
6206	100	4	7	7	0	0	2016	7	2015-12-29 09:52:41.552889	2015-12-29 09:52:41.552889
6207	100	5	5	5	0	0	2016	5	2015-12-29 09:52:41.566542	2015-12-29 09:52:41.566542
6209	100	7	7	7	0	0	2016	7	2015-12-29 09:52:41.594801	2015-12-29 09:52:41.594801
6210	100	8	5	5	0	0	2016	5	2015-12-29 09:52:41.608459	2015-12-29 09:52:41.608459
6211	100	9	0	0	0	0	2016	0	2015-12-29 09:52:41.622091	2015-12-29 09:52:41.622091
6212	79	1	5	5	0	0	2016	5	2015-12-29 09:52:41.636721	2015-12-29 09:52:41.636721
6213	79	2	15	15	0	0	2016	15	2015-12-29 09:52:41.650397	2015-12-29 09:52:41.650397
6214	79	3	7	7	0	0	2016	7	2015-12-29 09:52:41.66408	2015-12-29 09:52:41.66408
6200	106	7	7	0	0	0	2016	0	2015-12-29 09:52:41.457935	2015-12-29 09:53:09.64107
6145	102	6	84	0	0	0	2016	0	2015-12-29 09:52:40.390281	2015-12-29 09:53:11.795289
6163	29	6	84	0	0	0	2016	0	2015-12-29 09:52:40.793396	2015-12-29 09:53:11.824167
6172	46	6	84	0	0	0	2016	0	2015-12-29 09:52:40.919138	2015-12-29 09:53:11.853059
6181	28	6	84	0	0	0	2016	0	2015-12-29 09:52:41.182575	2015-12-29 09:53:11.880947
6190	68	6	84	0	0	0	2016	0	2015-12-29 09:52:41.308376	2015-12-29 09:53:11.909799
6208	100	6	84	0	0	0	2016	0	2015-12-29 09:52:41.580219	2015-12-29 09:53:11.948796
6148	102	9	2	1	1	0	2016	2	2015-12-29 09:52:40.432284	2016-02-02 05:58:44.635479
6147	102	8	5	3	2	0	2016	5	2015-12-29 09:52:40.417639	2016-01-05 14:22:53.393421
6149	52	1	5	0	5	0	2016	5	2015-12-29 09:52:40.446166	2016-11-30 13:38:55.753488
6141	102	2	15	13	2	0	2016	15	2015-12-29 09:52:40.323757	2016-02-15 14:26:55.004919
6140	102	1	5	4	1	0	2016	5	2015-12-29 09:52:40.310056	2016-03-10 09:00:11.113037
6156	52	8	5	1	4	0	2016	5	2015-12-29 09:52:40.553547	2016-12-20 13:55:22.236363
6150	52	2	15	0	15	0	2016	15	2015-12-29 09:52:40.459641	2016-11-28 14:13:05.72727
6153	52	5	5	0	5	0	2016	5	2015-12-29 09:52:40.501508	2016-12-27 04:16:55.392464
6215	79	4	7	7	0	0	2016	7	2015-12-29 09:52:41.678638	2015-12-29 09:52:41.678638
6216	79	5	5	5	0	0	2016	5	2015-12-29 09:52:41.692322	2015-12-29 09:52:41.692322
6218	79	7	7	7	0	0	2016	7	2015-12-29 09:52:41.720591	2015-12-29 09:52:41.720591
6219	79	8	5	5	0	0	2016	5	2015-12-29 09:52:41.744419	2015-12-29 09:52:41.744419
6220	79	9	0	0	0	0	2016	0	2015-12-29 09:52:41.757994	2015-12-29 09:52:41.757994
6221	80	1	5	5	0	0	2016	5	2015-12-29 09:52:41.772639	2015-12-29 09:52:41.772639
6222	80	2	15	15	0	0	2016	15	2015-12-29 09:52:41.786282	2015-12-29 09:52:41.786282
6223	80	3	7	7	0	0	2016	7	2015-12-29 09:52:41.811004	2015-12-29 09:52:41.811004
6224	80	4	7	7	0	0	2016	7	2015-12-29 09:52:41.824669	2015-12-29 09:52:41.824669
6225	80	5	5	5	0	0	2016	5	2015-12-29 09:52:41.848461	2015-12-29 09:52:41.848461
6227	80	7	7	7	0	0	2016	7	2015-12-29 09:52:41.876713	2015-12-29 09:52:41.876713
6228	80	8	5	5	0	0	2016	5	2015-12-29 09:52:41.890322	2015-12-29 09:52:41.890322
6229	80	9	0	0	0	0	2016	0	2015-12-29 09:52:41.904995	2015-12-29 09:52:41.904995
6230	85	1	5	5	0	0	2016	5	2015-12-29 09:52:41.919413	2015-12-29 09:52:41.919413
6231	85	2	15	15	0	0	2016	15	2015-12-29 09:52:41.947121	2015-12-29 09:52:41.947121
6232	85	3	7	7	0	0	2016	7	2015-12-29 09:52:41.974338	2015-12-29 09:52:41.974338
6233	85	4	7	7	0	0	2016	7	2015-12-29 09:52:41.988867	2015-12-29 09:52:41.988867
6234	85	5	5	5	0	0	2016	5	2015-12-29 09:52:42.012649	2015-12-29 09:52:42.012649
6235	85	6	84	84	0	0	2016	84	2015-12-29 09:52:42.026314	2015-12-29 09:52:42.026314
6237	85	8	5	5	0	0	2016	5	2015-12-29 09:52:42.054522	2015-12-29 09:52:42.054522
6238	85	9	0	0	0	0	2016	0	2015-12-29 09:52:42.069186	2015-12-29 09:52:42.069186
6242	31	4	7	7	0	0	2016	7	2015-12-29 09:52:42.155045	2015-12-29 09:52:42.155045
6245	31	7	7	7	0	0	2016	7	2015-12-29 09:52:42.196987	2015-12-29 09:52:42.196987
6247	31	9	0	0	0	0	2016	0	2015-12-29 09:52:42.225283	2015-12-29 09:52:42.225283
6248	103	1	5	5	0	0	2016	5	2015-12-29 09:52:42.238896	2015-12-29 09:52:42.238896
6249	103	2	15	15	0	0	2016	15	2015-12-29 09:52:42.25255	2015-12-29 09:52:42.25255
6250	103	3	7	7	0	0	2016	7	2015-12-29 09:52:42.267206	2015-12-29 09:52:42.267206
6251	103	4	7	7	0	0	2016	7	2015-12-29 09:52:42.280817	2015-12-29 09:52:42.280817
6252	103	5	5	5	0	0	2016	5	2015-12-29 09:52:42.294645	2015-12-29 09:52:42.294645
6254	103	7	7	7	0	0	2016	7	2015-12-29 09:52:42.322769	2015-12-29 09:52:42.322769
6255	103	8	5	5	0	0	2016	5	2015-12-29 09:52:42.336399	2015-12-29 09:52:42.336399
6256	103	9	0	0	0	0	2016	0	2015-12-29 09:52:42.351042	2015-12-29 09:52:42.351042
6257	56	1	5	5	0	0	2016	5	2015-12-29 09:52:42.364715	2015-12-29 09:52:42.364715
6258	56	2	15	15	0	0	2016	15	2015-12-29 09:52:42.379317	2015-12-29 09:52:42.379317
6259	56	3	7	7	0	0	2016	7	2015-12-29 09:52:42.392993	2015-12-29 09:52:42.392993
6260	56	4	7	7	0	0	2016	7	2015-12-29 09:52:42.406885	2015-12-29 09:52:42.406885
6261	56	5	5	5	0	0	2016	5	2015-12-29 09:52:42.421287	2015-12-29 09:52:42.421287
6263	56	7	7	7	0	0	2016	7	2015-12-29 09:52:42.448568	2015-12-29 09:52:42.448568
6264	56	8	5	5	0	0	2016	5	2015-12-29 09:52:42.473294	2015-12-29 09:52:42.473294
6265	56	9	0	0	0	0	2016	0	2015-12-29 09:52:42.486943	2015-12-29 09:52:42.486943
6266	37	1	5	5	0	0	2016	5	2015-12-29 09:52:42.500769	2015-12-29 09:52:42.500769
6267	37	2	15	15	0	0	2016	15	2015-12-29 09:52:42.515226	2015-12-29 09:52:42.515226
6268	37	3	7	7	0	0	2016	7	2015-12-29 09:52:42.528867	2015-12-29 09:52:42.528867
6269	37	4	7	7	0	0	2016	7	2015-12-29 09:52:42.542534	2015-12-29 09:52:42.542534
6270	37	5	5	5	0	0	2016	5	2015-12-29 09:52:42.557166	2015-12-29 09:52:42.557166
6272	37	7	7	7	0	0	2016	7	2015-12-29 09:52:42.584417	2015-12-29 09:52:42.584417
6273	37	8	5	5	0	0	2016	5	2015-12-29 09:52:42.599068	2015-12-29 09:52:42.599068
6274	37	9	0	0	0	0	2016	0	2015-12-29 09:52:42.612747	2015-12-29 09:52:42.612747
6275	104	1	5	5	0	0	2016	5	2015-12-29 09:52:42.626383	2015-12-29 09:52:42.626383
6276	104	2	15	15	0	0	2016	15	2015-12-29 09:52:42.641032	2015-12-29 09:52:42.641032
6277	104	3	7	7	0	0	2016	7	2015-12-29 09:52:42.65466	2015-12-29 09:52:42.65466
6278	104	4	7	7	0	0	2016	7	2015-12-29 09:52:42.669342	2015-12-29 09:52:42.669342
6279	104	5	5	5	0	0	2016	5	2015-12-29 09:52:42.682955	2015-12-29 09:52:42.682955
6281	104	7	7	7	0	0	2016	7	2015-12-29 09:52:42.711233	2015-12-29 09:52:42.711233
6282	104	8	5	5	0	0	2016	5	2015-12-29 09:52:42.724903	2015-12-29 09:52:42.724903
6283	104	9	0	0	0	0	2016	0	2015-12-29 09:52:42.738523	2015-12-29 09:52:42.738523
6287	72	4	7	7	0	0	2016	7	2015-12-29 09:52:42.80526	2015-12-29 09:52:42.80526
6217	79	6	84	0	0	0	2016	0	2015-12-29 09:52:41.705961	2015-12-29 09:53:11.987956
6226	80	6	84	0	0	0	2016	0	2015-12-29 09:52:41.863042	2015-12-29 09:53:12.015757
6244	31	6	84	0	0	0	2016	0	2015-12-29 09:52:42.183308	2015-12-29 09:53:12.044614
6253	103	6	84	0	0	0	2016	0	2015-12-29 09:52:42.309136	2015-12-29 09:53:12.073588
6262	56	6	84	0	0	0	2016	0	2015-12-29 09:52:42.434921	2015-12-29 09:53:12.102692
6271	37	6	84	0	0	0	2016	0	2015-12-29 09:52:42.570805	2015-12-29 09:53:12.131488
6280	104	6	84	0	0	0	2016	0	2015-12-29 09:52:42.696583	2015-12-29 09:53:12.159277
6289	72	6	84	0	0	0	2016	0	2015-12-29 09:52:42.832473	2015-12-29 09:53:12.188174
6284	72	1	5	0	5	0	2016	5	2015-12-29 09:52:42.753168	2016-07-12 05:57:17.179317
6285	72	2	15	0	15	0	2016	15	2015-12-29 09:52:42.766828	2016-07-12 05:57:59.76413
6243	31	5	5	0	5	0	2016	5	2015-12-29 09:52:42.168692	2016-10-04 13:57:16.791045
6286	72	3	7	3	4	0	2016	7	2015-12-29 09:52:42.790612	2016-08-01 07:34:26.42443
6288	72	5	5	0	5	0	2016	5	2015-12-29 09:52:42.818866	2016-07-12 05:58:17.30159
6241	31	3	7	6	1	0	2016	7	2015-12-29 09:52:42.141406	2016-05-26 12:43:34.626731
6239	31	1	5	1	4	0	2016	5	2015-12-29 09:52:42.08292	2016-09-06 12:29:28.16377
6246	31	8	5	1	4	0	2016	5	2015-12-29 09:52:42.210609	2016-10-28 09:49:09.241271
6290	72	7	7	7	0	0	2016	7	2015-12-29 09:52:42.847105	2015-12-29 09:52:42.847105
6292	72	9	0	0	0	0	2016	0	2015-12-29 09:52:42.87444	2015-12-29 09:52:42.87444
6293	49	1	5	5	0	0	2016	5	2015-12-29 09:52:42.899159	2015-12-29 09:52:42.899159
6295	49	3	7	7	0	0	2016	7	2015-12-29 09:52:42.927443	2015-12-29 09:52:42.927443
6296	49	4	7	7	0	0	2016	7	2015-12-29 09:52:42.941112	2015-12-29 09:52:42.941112
6299	49	7	7	7	0	0	2016	7	2015-12-29 09:52:42.983019	2015-12-29 09:52:42.983019
6301	49	9	0	0	0	0	2016	0	2015-12-29 09:52:43.021459	2015-12-29 09:52:43.021459
6302	89	1	5	5	0	0	2016	5	2015-12-29 09:52:43.035049	2015-12-29 09:52:43.035049
6303	89	2	15	15	0	0	2016	15	2015-12-29 09:52:43.048694	2015-12-29 09:52:43.048694
6304	89	3	7	7	0	0	2016	7	2015-12-29 09:52:43.063328	2015-12-29 09:52:43.063328
6305	89	4	7	7	0	0	2016	7	2015-12-29 09:52:43.087142	2015-12-29 09:52:43.087142
6306	89	5	5	5	0	0	2016	5	2015-12-29 09:52:43.100739	2015-12-29 09:52:43.100739
6308	89	7	7	7	0	0	2016	7	2015-12-29 09:52:43.12902	2015-12-29 09:52:43.12902
6309	89	8	5	5	0	0	2016	5	2015-12-29 09:52:43.142681	2015-12-29 09:52:43.142681
6310	89	9	0	0	0	0	2016	0	2015-12-29 09:52:43.157317	2015-12-29 09:52:43.157317
6313	98	3	7	7	0	0	2016	7	2015-12-29 09:52:43.199222	2015-12-29 09:52:43.199222
6314	98	4	7	7	0	0	2016	7	2015-12-29 09:52:43.21288	2015-12-29 09:52:43.21288
6316	98	6	84	84	0	0	2016	84	2015-12-29 09:52:43.241193	2015-12-29 09:52:43.241193
6319	98	9	0	0	0	0	2016	0	2015-12-29 09:52:43.283116	2015-12-29 09:52:43.283116
6320	101	1	5	5	0	0	2016	5	2015-12-29 09:52:43.306916	2015-12-29 09:52:43.306916
6321	101	2	15	15	0	0	2016	15	2015-12-29 09:52:43.321485	2015-12-29 09:52:43.321485
6322	101	3	7	7	0	0	2016	7	2015-12-29 09:52:43.355389	2015-12-29 09:52:43.355389
6323	101	4	7	7	0	0	2016	7	2015-12-29 09:52:43.369001	2015-12-29 09:52:43.369001
6324	101	5	5	5	0	0	2016	5	2015-12-29 09:52:43.383653	2015-12-29 09:52:43.383653
6326	101	7	7	7	0	0	2016	7	2015-12-29 09:52:43.410905	2015-12-29 09:52:43.410905
6327	101	8	5	5	0	0	2016	5	2015-12-29 09:52:43.425551	2015-12-29 09:52:43.425551
6328	101	9	0	0	0	0	2016	0	2015-12-29 09:52:43.439214	2015-12-29 09:52:43.439214
6332	90	4	7	7	0	0	2016	7	2015-12-29 09:52:43.514968	2015-12-29 09:52:43.514968
6335	90	7	7	7	0	0	2016	7	2015-12-29 09:52:43.568022	2015-12-29 09:52:43.568022
6337	90	9	0	0	0	0	2016	0	2015-12-29 09:52:43.595297	2015-12-29 09:52:43.595297
6339	64	2	15	15	0	0	2016	15	2015-12-29 09:52:43.623644	2015-12-29 09:52:43.623644
6340	64	3	7	7	0	0	2016	7	2015-12-29 09:52:43.637231	2015-12-29 09:52:43.637231
6341	64	4	7	7	0	0	2016	7	2015-12-29 09:52:43.651867	2015-12-29 09:52:43.651867
6342	64	5	5	5	0	0	2016	5	2015-12-29 09:52:43.66552	2015-12-29 09:52:43.66552
6344	64	7	7	7	0	0	2016	7	2015-12-29 09:52:43.70398	2015-12-29 09:52:43.70398
6345	64	8	5	5	0	0	2016	5	2015-12-29 09:52:43.717578	2015-12-29 09:52:43.717578
6346	64	9	0	0	0	0	2016	0	2015-12-29 09:52:43.731173	2015-12-29 09:52:43.731173
6347	136	1	5	5	0	0	2016	5	2015-12-29 09:52:43.755994	2015-12-29 09:52:43.755994
6348	136	2	15	15	0	0	2016	15	2015-12-29 09:52:43.769585	2015-12-29 09:52:43.769585
6349	136	3	7	7	0	0	2016	7	2015-12-29 09:52:43.783217	2015-12-29 09:52:43.783217
6350	136	4	7	7	0	0	2016	7	2015-12-29 09:52:43.797853	2015-12-29 09:52:43.797853
6351	136	5	5	5	0	0	2016	5	2015-12-29 09:52:43.821691	2015-12-29 09:52:43.821691
6353	136	7	7	7	0	0	2016	7	2015-12-29 09:52:43.849879	2015-12-29 09:52:43.849879
6354	136	8	5	5	0	0	2016	5	2015-12-29 09:52:43.873684	2015-12-29 09:52:43.873684
6355	136	9	0	0	0	0	2016	0	2015-12-29 09:52:43.888282	2015-12-29 09:52:43.888282
6356	111	1	5	5	0	0	2016	5	2015-12-29 09:52:43.901968	2015-12-29 09:52:43.901968
6357	111	2	15	15	0	0	2016	15	2015-12-29 09:52:43.915618	2015-12-29 09:52:43.915618
6358	111	3	7	7	0	0	2016	7	2015-12-29 09:52:43.930201	2015-12-29 09:52:43.930201
6359	111	4	7	7	0	0	2016	7	2015-12-29 09:52:43.943922	2015-12-29 09:52:43.943922
6360	111	5	5	5	0	0	2016	5	2015-12-29 09:52:43.957503	2015-12-29 09:52:43.957503
6362	111	7	7	7	0	0	2016	7	2015-12-29 09:52:43.985777	2015-12-29 09:52:43.985777
6363	111	8	5	5	0	0	2016	5	2015-12-29 09:52:43.999437	2015-12-29 09:52:43.999437
6364	111	9	0	0	0	0	2016	0	2015-12-29 09:52:44.014073	2015-12-29 09:52:44.014073
6298	49	6	84	0	0	0	2016	0	2015-12-29 09:52:42.969395	2015-12-29 09:53:12.217481
6307	89	6	84	0	0	0	2016	0	2015-12-29 09:52:43.11538	2015-12-29 09:53:12.256225
6325	101	6	84	0	0	0	2016	0	2015-12-29 09:52:43.397289	2015-12-29 09:53:12.284089
6334	90	6	84	0	0	0	2016	0	2015-12-29 09:52:43.553374	2015-12-29 09:53:12.312951
6343	64	6	84	0	0	0	2016	0	2015-12-29 09:52:43.679155	2015-12-29 09:53:12.341821
6352	136	6	84	0	0	0	2016	0	2015-12-29 09:52:43.836281	2015-12-29 09:53:12.370689
6361	111	6	84	0	0	0	2016	0	2015-12-29 09:52:43.972178	2015-12-29 09:53:12.398548
6338	64	1	5	4	1	0	2016	5	2015-12-29 09:52:43.609919	2016-04-12 09:55:14.895486
6297	49	5	5	4	1	0	2016	5	2015-12-29 09:52:42.95474	2016-08-08 11:34:24.328486
6331	90	3	7	6	1	0	2016	7	2015-12-29 09:52:43.501464	2016-07-26 04:54:52.326448
6315	98	5	5	4	1	0	2016	5	2015-12-29 09:52:43.227515	2016-03-22 09:13:31.026756
6312	98	2	15	5	10	0	2016	15	2015-12-29 09:52:43.184593	2016-05-25 12:52:37.854775
6318	98	8	5	3	2	0	2016	5	2015-12-29 09:52:43.269481	2016-03-22 09:13:03.571419
6294	49	2	15	0	15	0	2016	15	2015-12-29 09:52:42.91282	2016-12-07 10:19:54.862984
6329	90	1	5	0	5	0	2016	5	2015-12-29 09:52:43.463009	2016-09-27 12:42:50.517856
6291	72	8	5	0	5	0	2016	5	2015-12-29 09:52:42.860783	2016-07-12 05:58:32.176386
6300	49	8	5	1	4	0	2016	5	2015-12-29 09:52:43.006847	2016-12-07 10:20:23.9718
6330	90	2	15	0	15	0	2016	15	2015-12-29 09:52:43.477579	2016-10-17 10:03:06.656702
6333	90	5	5	2	3	0	2016	5	2015-12-29 09:52:43.539873	2016-10-17 10:04:25.947082
6336	90	8	5	1	4	0	2016	5	2015-12-29 09:52:43.581646	2016-10-10 06:54:49.513665
6367	109	3	7	7	0	0	2016	7	2015-12-29 09:52:44.056046	2015-12-29 09:52:44.056046
6368	109	4	7	7	0	0	2016	7	2015-12-29 09:52:44.069663	2015-12-29 09:52:44.069663
6370	109	6	84	84	0	0	2016	84	2015-12-29 09:52:44.118157	2015-12-29 09:52:44.118157
6373	109	9	0	0	0	0	2016	0	2015-12-29 09:52:44.16015	2015-12-29 09:52:44.16015
6374	35	1	5	5	0	0	2016	5	2015-12-29 09:52:44.173725	2015-12-29 09:52:44.173725
6375	35	2	15	15	0	0	2016	15	2015-12-29 09:52:44.189263	2015-12-29 09:52:44.189263
6376	35	3	7	7	0	0	2016	7	2015-12-29 09:52:44.222339	2015-12-29 09:52:44.222339
6377	35	4	7	7	0	0	2016	7	2015-12-29 09:52:44.235924	2015-12-29 09:52:44.235924
6378	35	5	5	5	0	0	2016	5	2015-12-29 09:52:44.250464	2015-12-29 09:52:44.250464
6380	35	7	7	7	0	0	2016	7	2015-12-29 09:52:44.287972	2015-12-29 09:52:44.287972
6381	35	8	5	5	0	0	2016	5	2015-12-29 09:52:44.31271	2015-12-29 09:52:44.31271
6382	35	9	0	0	0	0	2016	0	2015-12-29 09:52:44.326279	2015-12-29 09:52:44.326279
6383	127	1	5	5	0	0	2016	5	2015-12-29 09:52:44.339962	2015-12-29 09:52:44.339962
6384	127	2	15	15	0	0	2016	15	2015-12-29 09:52:44.354516	2015-12-29 09:52:44.354516
6385	127	3	7	7	0	0	2016	7	2015-12-29 09:52:44.368224	2015-12-29 09:52:44.368224
6386	127	4	7	7	0	0	2016	7	2015-12-29 09:52:44.381835	2015-12-29 09:52:44.381835
6387	127	5	5	5	0	0	2016	5	2015-12-29 09:52:44.39648	2015-12-29 09:52:44.39648
6389	127	7	7	7	0	0	2016	7	2015-12-29 09:52:44.423835	2015-12-29 09:52:44.423835
6390	127	8	5	5	0	0	2016	5	2015-12-29 09:52:44.438419	2015-12-29 09:52:44.438419
6391	127	9	0	0	0	0	2016	0	2015-12-29 09:52:44.452103	2015-12-29 09:52:44.452103
6392	123	1	5	5	0	0	2016	5	2015-12-29 09:52:44.466686	2015-12-29 09:52:44.466686
6393	123	2	15	15	0	0	2016	15	2015-12-29 09:52:44.480346	2015-12-29 09:52:44.480346
6394	123	3	7	7	0	0	2016	7	2015-12-29 09:52:44.493999	2015-12-29 09:52:44.493999
6395	123	4	7	7	0	0	2016	7	2015-12-29 09:52:44.508636	2015-12-29 09:52:44.508636
6396	123	5	5	5	0	0	2016	5	2015-12-29 09:52:44.52228	2015-12-29 09:52:44.52228
6397	123	6	84	84	0	0	2016	84	2015-12-29 09:52:44.53653	2015-12-29 09:52:44.53653
6399	123	8	5	5	0	0	2016	5	2015-12-29 09:52:44.588018	2015-12-29 09:52:44.588018
6400	123	9	0	0	0	0	2016	0	2015-12-29 09:52:44.602591	2015-12-29 09:52:44.602591
6403	117	3	7	7	0	0	2016	7	2015-12-29 09:52:44.64453	2015-12-29 09:52:44.64453
6404	117	4	7	7	0	0	2016	7	2015-12-29 09:52:44.66834	2015-12-29 09:52:44.66834
6406	117	6	84	84	0	0	2016	84	2015-12-29 09:52:44.716739	2015-12-29 09:52:44.716739
6409	117	9	0	0	0	0	2016	0	2015-12-29 09:52:44.778873	2015-12-29 09:52:44.778873
6410	118	1	5	5	0	0	2016	5	2015-12-29 09:52:44.79254	2015-12-29 09:52:44.79254
6411	118	2	15	15	0	0	2016	15	2015-12-29 09:52:44.817283	2015-12-29 09:52:44.817283
6412	118	3	7	7	0	0	2016	7	2015-12-29 09:52:44.830921	2015-12-29 09:52:44.830921
6413	118	4	7	7	0	0	2016	7	2015-12-29 09:52:44.844566	2015-12-29 09:52:44.844566
6414	118	5	5	5	0	0	2016	5	2015-12-29 09:52:44.859184	2015-12-29 09:52:44.859184
6416	118	7	7	7	0	0	2016	7	2015-12-29 09:52:44.886472	2015-12-29 09:52:44.886472
6417	118	8	5	5	0	0	2016	5	2015-12-29 09:52:44.91121	2015-12-29 09:52:44.91121
6418	118	9	0	0	0	0	2016	0	2015-12-29 09:52:44.924869	2015-12-29 09:52:44.924869
6419	121	1	5	5	0	0	2016	5	2015-12-29 09:52:44.938518	2015-12-29 09:52:44.938518
6420	121	2	15	15	0	0	2016	15	2015-12-29 09:52:44.953196	2015-12-29 09:52:44.953196
6421	121	3	7	7	0	0	2016	7	2015-12-29 09:52:44.966805	2015-12-29 09:52:44.966805
6422	121	4	7	7	0	0	2016	7	2015-12-29 09:52:44.980435	2015-12-29 09:52:44.980435
6423	121	5	5	5	0	0	2016	5	2015-12-29 09:52:44.99508	2015-12-29 09:52:44.99508
6424	121	6	84	84	0	0	2016	84	2015-12-29 09:52:45.018921	2015-12-29 09:52:45.018921
6425	121	7	7	7	0	0	2016	7	2015-12-29 09:52:45.032492	2015-12-29 09:52:45.032492
6426	121	8	5	5	0	0	2016	5	2015-12-29 09:52:45.047114	2015-12-29 09:52:45.047114
6427	121	9	0	0	0	0	2016	0	2015-12-29 09:52:45.060809	2015-12-29 09:52:45.060809
6428	116	1	5	5	0	0	2016	5	2015-12-29 09:52:45.075383	2015-12-29 09:52:45.075383
6429	116	2	15	15	0	0	2016	15	2015-12-29 09:52:45.08907	2015-12-29 09:52:45.08907
6430	116	3	7	7	0	0	2016	7	2015-12-29 09:52:45.102702	2015-12-29 09:52:45.102702
6431	116	4	7	7	0	0	2016	7	2015-12-29 09:52:45.117354	2015-12-29 09:52:45.117354
6432	116	5	5	5	0	0	2016	5	2015-12-29 09:52:45.130988	2015-12-29 09:52:45.130988
6434	116	7	7	7	0	0	2016	7	2015-12-29 09:52:45.189636	2015-12-29 09:52:45.189636
6435	116	8	5	5	0	0	2016	5	2015-12-29 09:52:45.223481	2015-12-29 09:52:45.223481
6436	116	9	0	0	0	0	2016	0	2015-12-29 09:52:45.237061	2015-12-29 09:52:45.237061
6437	129	1	5	5	0	0	2016	5	2015-12-29 09:52:45.251719	2015-12-29 09:52:45.251719
6438	129	2	15	15	0	0	2016	15	2015-12-29 09:52:45.265389	2015-12-29 09:52:45.265389
6439	129	3	7	7	0	0	2016	7	2015-12-29 09:52:45.279017	2015-12-29 09:52:45.279017
6398	123	7	7	0	0	0	2016	0	2015-12-29 09:52:44.574437	2015-12-29 09:53:09.957619
6407	117	7	7	0	0	0	2016	0	2015-12-29 09:52:44.730393	2015-12-29 09:53:09.98547
6379	35	6	84	0	0	0	2016	0	2015-12-29 09:52:44.264148	2015-12-29 09:53:12.427651
6388	127	6	84	0	0	0	2016	0	2015-12-29 09:52:44.410131	2015-12-29 09:53:12.456261
6415	118	6	84	0	0	0	2016	0	2015-12-29 09:52:44.872842	2015-12-29 09:53:12.485124
6433	116	6	84	0	0	0	2016	0	2015-12-29 09:52:45.144664	2015-12-29 09:53:12.513088
6369	109	5	5	0	5	0	2016	5	2015-12-29 09:52:44.093505	2016-10-10 05:48:11.77018
6401	117	1	5	0	5	0	2016	5	2015-12-29 09:52:44.616475	2016-04-14 07:32:13.696541
6408	117	8	5	2	3	0	2016	5	2015-12-29 09:52:44.765339	2016-04-05 07:43:09.785313
6372	109	8	5	0	5	0	2016	5	2015-12-29 09:52:44.146402	2016-04-14 03:53:35.231345
6405	117	5	5	4	1	0	2016	5	2015-12-29 09:52:44.702168	2016-01-28 07:32:22.780557
6366	109	2	15	0	15	0	2016	15	2015-12-29 09:52:44.041402	2016-08-12 10:44:10.235333
6402	117	2	15	0	15	0	2016	15	2015-12-29 09:52:44.629879	2016-05-30 07:58:21.669646
6365	109	1	5	0	5	0	2016	5	2015-12-29 09:52:44.027747	2016-11-02 12:25:29.683977
6440	129	4	7	7	0	0	2016	7	2015-12-29 09:52:45.303889	2015-12-29 09:52:45.303889
6441	129	5	5	5	0	0	2016	5	2015-12-29 09:52:45.317402	2015-12-29 09:52:45.317402
6443	129	7	7	7	0	0	2016	7	2015-12-29 09:52:45.34567	2015-12-29 09:52:45.34567
6444	129	8	5	5	0	0	2016	5	2015-12-29 09:52:45.359314	2015-12-29 09:52:45.359314
6445	129	9	0	0	0	0	2016	0	2015-12-29 09:52:45.372976	2015-12-29 09:52:45.372976
6446	119	1	5	5	0	0	2016	5	2015-12-29 09:52:45.387647	2015-12-29 09:52:45.387647
6447	119	2	15	15	0	0	2016	15	2015-12-29 09:52:45.401257	2015-12-29 09:52:45.401257
6448	119	3	7	7	0	0	2016	7	2015-12-29 09:52:45.415886	2015-12-29 09:52:45.415886
6449	119	4	7	7	0	0	2016	7	2015-12-29 09:52:45.429547	2015-12-29 09:52:45.429547
6450	119	5	5	5	0	0	2016	5	2015-12-29 09:52:45.443177	2015-12-29 09:52:45.443177
6452	119	7	7	7	0	0	2016	7	2015-12-29 09:52:45.471473	2015-12-29 09:52:45.471473
6453	119	8	5	5	0	0	2016	5	2015-12-29 09:52:45.485101	2015-12-29 09:52:45.485101
6454	119	9	0	0	0	0	2016	0	2015-12-29 09:52:45.499775	2015-12-29 09:52:45.499775
6457	134	3	7	7	0	0	2016	7	2015-12-29 09:52:45.541663	2015-12-29 09:52:45.541663
6458	134	4	7	7	0	0	2016	7	2015-12-29 09:52:45.555328	2015-12-29 09:52:45.555328
6461	134	7	7	7	0	0	2016	7	2015-12-29 09:52:45.597267	2015-12-29 09:52:45.597267
6463	134	9	0	0	0	0	2016	0	2015-12-29 09:52:45.635743	2015-12-29 09:52:45.635743
6464	128	1	5	5	0	0	2016	5	2015-12-29 09:52:45.649322	2015-12-29 09:52:45.649322
6465	128	2	15	15	0	0	2016	15	2015-12-29 09:52:45.663992	2015-12-29 09:52:45.663992
6466	128	3	7	7	0	0	2016	7	2015-12-29 09:52:45.677577	2015-12-29 09:52:45.677577
6467	128	4	7	7	0	0	2016	7	2015-12-29 09:52:45.692195	2015-12-29 09:52:45.692195
6468	128	5	5	5	0	0	2016	5	2015-12-29 09:52:45.726232	2015-12-29 09:52:45.726232
6469	128	6	84	84	0	0	2016	84	2015-12-29 09:52:45.739905	2015-12-29 09:52:45.739905
6471	128	8	5	5	0	0	2016	5	2015-12-29 09:52:45.768247	2015-12-29 09:52:45.768247
6472	128	9	0	0	0	0	2016	0	2015-12-29 09:52:45.781785	2015-12-29 09:52:45.781785
6473	112	1	5	5	0	0	2016	5	2015-12-29 09:52:45.795438	2015-12-29 09:52:45.795438
6474	112	2	15	15	0	0	2016	15	2015-12-29 09:52:45.810079	2015-12-29 09:52:45.810079
6475	112	3	7	7	0	0	2016	7	2015-12-29 09:52:45.823804	2015-12-29 09:52:45.823804
6476	112	4	7	7	0	0	2016	7	2015-12-29 09:52:45.837406	2015-12-29 09:52:45.837406
6477	112	5	5	5	0	0	2016	5	2015-12-29 09:52:45.852087	2015-12-29 09:52:45.852087
6478	112	6	84	84	0	0	2016	84	2015-12-29 09:52:45.865667	2015-12-29 09:52:45.865667
6479	112	7	7	7	0	0	2016	7	2015-12-29 09:52:45.879154	2015-12-29 09:52:45.879154
6480	112	8	5	5	0	0	2016	5	2015-12-29 09:52:45.893777	2015-12-29 09:52:45.893777
6481	112	9	0	0	0	0	2016	0	2015-12-29 09:52:45.907446	2015-12-29 09:52:45.907446
6482	78	1	5	5	0	0	2016	5	2015-12-29 09:52:45.921121	2015-12-29 09:52:45.921121
6483	78	2	15	15	0	0	2016	15	2015-12-29 09:52:45.936217	2015-12-29 09:52:45.936217
6484	78	3	7	7	0	0	2016	7	2015-12-29 09:52:45.949596	2015-12-29 09:52:45.949596
6485	78	4	7	7	0	0	2016	7	2015-12-29 09:52:45.974333	2015-12-29 09:52:45.974333
6486	78	5	5	5	0	0	2016	5	2015-12-29 09:52:45.987977	2015-12-29 09:52:45.987977
6487	78	6	84	84	0	0	2016	84	2015-12-29 09:52:46.001589	2015-12-29 09:52:46.001589
6489	78	8	5	5	0	0	2016	5	2015-12-29 09:52:46.029843	2015-12-29 09:52:46.029843
6490	78	9	0	0	0	0	2016	0	2015-12-29 09:52:46.04352	2015-12-29 09:52:46.04352
6491	132	1	5	5	0	0	2016	5	2015-12-29 09:52:46.058163	2015-12-29 09:52:46.058163
6492	132	2	15	15	0	0	2016	15	2015-12-29 09:52:46.082001	2015-12-29 09:52:46.082001
6493	132	3	7	7	0	0	2016	7	2015-12-29 09:52:46.095586	2015-12-29 09:52:46.095586
6494	132	4	7	7	0	0	2016	7	2015-12-29 09:52:46.120344	2015-12-29 09:52:46.120344
6495	132	5	5	5	0	0	2016	5	2015-12-29 09:52:46.133926	2015-12-29 09:52:46.133926
6497	132	7	7	7	0	0	2016	7	2015-12-29 09:52:46.162177	2015-12-29 09:52:46.162177
6498	132	8	5	5	0	0	2016	5	2015-12-29 09:52:46.175764	2015-12-29 09:52:46.175764
6499	132	9	0	0	0	0	2016	0	2015-12-29 09:52:46.189327	2015-12-29 09:52:46.189327
6502	133	3	7	7	0	0	2016	7	2015-12-29 09:52:46.231254	2015-12-29 09:52:46.231254
6503	133	4	7	7	0	0	2016	7	2015-12-29 09:52:46.245912	2015-12-29 09:52:46.245912
6506	133	7	7	7	0	0	2016	7	2015-12-29 09:52:46.297996	2015-12-29 09:52:46.297996
6508	133	9	0	0	0	0	2016	0	2015-12-29 09:52:46.326205	2015-12-29 09:52:46.326205
6509	135	1	5	5	0	0	2016	5	2015-12-29 09:52:46.339884	2015-12-29 09:52:46.339884
6510	135	2	15	15	0	0	2016	15	2015-12-29 09:52:46.353513	2015-12-29 09:52:46.353513
6511	135	3	7	7	0	0	2016	7	2015-12-29 09:52:46.37832	2015-12-29 09:52:46.37832
6512	135	4	7	7	0	0	2016	7	2015-12-29 09:52:46.402059	2015-12-29 09:52:46.402059
6513	135	5	5	5	0	0	2016	5	2015-12-29 09:52:46.415667	2015-12-29 09:52:46.415667
6488	78	7	7	0	0	0	2016	0	2015-12-29 09:52:46.016227	2015-12-29 09:53:10.043261
6442	129	6	84	0	0	0	2016	0	2015-12-29 09:52:45.331014	2015-12-29 09:53:12.552128
6451	119	6	84	0	0	0	2016	0	2015-12-29 09:52:45.45782	2015-12-29 09:53:12.581273
6460	134	6	84	0	0	0	2016	0	2015-12-29 09:52:45.583652	2015-12-29 09:53:12.60989
6496	132	6	84	0	0	0	2016	0	2015-12-29 09:52:46.147622	2015-12-29 09:53:12.64799
6505	133	6	84	0	0	0	2016	0	2015-12-29 09:52:46.274173	2015-12-29 09:53:12.676786
6514	135	6	84	0	0	0	2016	0	2015-12-29 09:52:46.440374	2015-12-29 09:53:12.725894
6459	134	5	5	0	5	0	2016	5	2015-12-29 09:52:45.569005	2016-12-30 09:07:50.717604
6504	133	5	5	3	2	0	2016	5	2015-12-29 09:52:46.259586	2016-10-12 08:30:36.206289
6456	134	2	15	0	15	0	2016	15	2015-12-29 09:52:45.527037	2016-12-20 13:07:52.787176
6462	134	8	5	1	4	0	2016	5	2015-12-29 09:52:45.610893	2016-11-13 18:05:39.078929
6507	133	8	5	1	4	0	2016	5	2015-12-29 09:52:46.311637	2016-12-21 13:54:45.941988
6501	133	2	15	5	10	0	2016	15	2015-12-29 09:52:46.217627	2016-12-21 13:53:01.02951
6500	133	1	5	1	4	0	2016	5	2015-12-29 09:52:46.204011	2016-12-16 12:59:48.510401
6455	134	1	5	0	5	0	2016	5	2015-12-29 09:52:45.513421	2016-05-19 05:38:44.026596
6515	135	7	7	7	0	0	2016	7	2015-12-29 09:52:46.454022	2015-12-29 09:52:46.454022
6516	135	8	5	5	0	0	2016	5	2015-12-29 09:52:46.467724	2015-12-29 09:52:46.467724
6517	135	9	0	0	0	0	2016	0	2015-12-29 09:52:46.482299	2015-12-29 09:52:46.482299
6518	130	1	5	5	0	0	2016	5	2015-12-29 09:52:46.495983	2015-12-29 09:52:46.495983
6519	130	2	15	15	0	0	2016	15	2015-12-29 09:52:46.50959	2015-12-29 09:52:46.50959
6520	130	3	7	7	0	0	2016	7	2015-12-29 09:52:46.524284	2015-12-29 09:52:46.524284
6521	130	4	7	7	0	0	2016	7	2015-12-29 09:52:46.537901	2015-12-29 09:52:46.537901
6522	130	5	5	5	0	0	2016	5	2015-12-29 09:52:46.552538	2015-12-29 09:52:46.552538
6524	130	7	7	7	0	0	2016	7	2015-12-29 09:52:46.589992	2015-12-29 09:52:46.589992
6525	130	8	5	5	0	0	2016	5	2015-12-29 09:52:46.604534	2015-12-29 09:52:46.604534
6526	130	9	0	0	0	0	2016	0	2015-12-29 09:52:46.618222	2015-12-29 09:52:46.618222
6527	137	1	5	5	0	0	2016	5	2015-12-29 09:52:46.631901	2015-12-29 09:52:46.631901
6528	137	2	15	15	0	0	2016	15	2015-12-29 09:52:46.646487	2015-12-29 09:52:46.646487
6529	137	3	7	7	0	0	2016	7	2015-12-29 09:52:46.660171	2015-12-29 09:52:46.660171
6530	137	4	7	7	0	0	2016	7	2015-12-29 09:52:46.673772	2015-12-29 09:52:46.673772
6531	137	5	5	5	0	0	2016	5	2015-12-29 09:52:46.688424	2015-12-29 09:52:46.688424
6532	137	6	84	84	0	0	2016	84	2015-12-29 09:52:46.70205	2015-12-29 09:52:46.70205
6533	137	7	7	7	0	0	2016	7	2015-12-29 09:52:46.715758	2015-12-29 09:52:46.715758
6534	137	8	5	5	0	0	2016	5	2015-12-29 09:52:46.730352	2015-12-29 09:52:46.730352
6535	137	9	0	0	0	0	2016	0	2015-12-29 09:52:46.807203	2015-12-29 09:52:46.807203
6538	63	3	7	7	0	0	2016	7	2015-12-29 09:52:46.903686	2015-12-29 09:52:46.903686
6539	63	4	7	7	0	0	2016	7	2015-12-29 09:52:46.917303	2015-12-29 09:52:46.917303
6544	63	9	0	0	0	0	2016	0	2015-12-29 09:52:46.997652	2015-12-29 09:52:46.997652
6545	110	1	5	5	0	0	2016	5	2015-12-29 09:52:47.011289	2015-12-29 09:52:47.011289
6546	110	2	15	15	0	0	2016	15	2015-12-29 09:52:47.025946	2015-12-29 09:52:47.025946
6547	110	3	7	7	0	0	2016	7	2015-12-29 09:52:47.039652	2015-12-29 09:52:47.039652
6548	110	4	7	7	0	0	2016	7	2015-12-29 09:52:47.144597	2015-12-29 09:52:47.144597
6549	110	5	5	5	0	0	2016	5	2015-12-29 09:52:47.178896	2015-12-29 09:52:47.178896
6550	110	6	84	84	0	0	2016	84	2015-12-29 09:52:47.1932	2015-12-29 09:52:47.1932
6552	110	8	5	5	0	0	2016	5	2015-12-29 09:52:47.241505	2015-12-29 09:52:47.241505
6553	110	9	0	0	0	0	2016	0	2015-12-29 09:52:47.254809	2015-12-29 09:52:47.254809
6554	122	1	5	5	0	0	2016	5	2015-12-29 09:52:47.268357	2015-12-29 09:52:47.268357
6555	122	2	15	15	0	0	2016	15	2015-12-29 09:52:47.282944	2015-12-29 09:52:47.282944
6556	122	3	7	7	0	0	2016	7	2015-12-29 09:52:47.296608	2015-12-29 09:52:47.296608
6557	122	4	7	7	0	0	2016	7	2015-12-29 09:52:47.310237	2015-12-29 09:52:47.310237
6558	122	5	5	5	0	0	2016	5	2015-12-29 09:52:47.324892	2015-12-29 09:52:47.324892
6559	122	6	84	84	0	0	2016	84	2015-12-29 09:52:47.338557	2015-12-29 09:52:47.338557
6560	122	7	7	7	0	0	2016	7	2015-12-29 09:52:47.352234	2015-12-29 09:52:47.352234
6561	122	8	5	5	0	0	2016	5	2015-12-29 09:52:47.366818	2015-12-29 09:52:47.366818
6562	122	9	0	0	0	0	2016	0	2015-12-29 09:52:47.380458	2015-12-29 09:52:47.380458
6563	114	1	5	5	0	0	2016	5	2015-12-29 09:52:47.396302	2015-12-29 09:52:47.396302
6564	114	2	15	15	0	0	2016	15	2015-12-29 09:52:47.409964	2015-12-29 09:52:47.409964
6565	114	3	7	7	0	0	2016	7	2015-12-29 09:52:47.423635	2015-12-29 09:52:47.423635
6566	114	4	7	7	0	0	2016	7	2015-12-29 09:52:47.448647	2015-12-29 09:52:47.448647
6567	114	5	5	5	0	0	2016	5	2015-12-29 09:52:47.461987	2015-12-29 09:52:47.461987
6569	114	7	7	7	0	0	2016	7	2015-12-29 09:52:47.500346	2015-12-29 09:52:47.500346
6570	114	8	5	5	0	0	2016	5	2015-12-29 09:52:47.514012	2015-12-29 09:52:47.514012
6571	114	9	0	0	0	0	2016	0	2015-12-29 09:52:47.52769	2015-12-29 09:52:47.52769
6572	138	1	5	5	0	0	2016	5	2015-12-29 09:52:47.542268	2015-12-29 09:52:47.542268
6573	138	2	15	15	0	0	2016	15	2015-12-29 09:52:47.556006	2015-12-29 09:52:47.556006
6574	138	3	7	7	0	0	2016	7	2015-12-29 09:52:47.569576	2015-12-29 09:52:47.569576
6575	138	4	7	7	0	0	2016	7	2015-12-29 09:52:47.584268	2015-12-29 09:52:47.584268
6576	138	5	5	5	0	0	2016	5	2015-12-29 09:52:47.597864	2015-12-29 09:52:47.597864
6577	138	6	84	84	0	0	2016	84	2015-12-29 09:52:47.611506	2015-12-29 09:52:47.611506
6579	138	8	5	5	0	0	2016	5	2015-12-29 09:52:47.639901	2015-12-29 09:52:47.639901
6580	138	9	0	0	0	0	2016	0	2015-12-29 09:52:47.654441	2015-12-29 09:52:47.654441
6581	108	1	5	5	0	0	2016	5	2015-12-29 09:52:47.668745	2015-12-29 09:52:47.668745
6582	108	2	15	15	0	0	2016	15	2015-12-29 09:52:47.691994	2015-12-29 09:52:47.691994
6583	108	3	7	7	0	0	2016	7	2015-12-29 09:52:47.706442	2015-12-29 09:52:47.706442
6584	108	4	7	7	0	0	2016	7	2015-12-29 09:52:47.72018	2015-12-29 09:52:47.72018
6585	108	5	5	5	0	0	2016	5	2015-12-29 09:52:47.733766	2015-12-29 09:52:47.733766
6586	108	6	84	84	0	0	2016	84	2015-12-29 09:52:47.748394	2015-12-29 09:52:47.748394
6588	108	8	5	5	0	0	2016	5	2015-12-29 09:52:47.775693	2015-12-29 09:52:47.775693
6589	108	9	0	0	0	0	2016	0	2015-12-29 09:52:47.790308	2015-12-29 09:52:47.790308
6578	138	7	7	0	0	0	2016	0	2015-12-29 09:52:47.626133	2015-12-29 09:53:10.100227
6587	108	7	7	0	0	0	2016	0	2015-12-29 09:52:47.76203	2015-12-29 09:53:10.12897
6523	130	6	84	0	0	0	2016	0	2015-12-29 09:52:46.566153	2015-12-29 09:53:12.754761
6541	63	6	84	0	0	0	2016	0	2015-12-29 09:52:46.95583	2015-12-29 09:53:12.783658
6568	114	6	84	0	0	0	2016	0	2015-12-29 09:52:47.485778	2015-12-29 09:53:12.811428
6542	63	7	7	4	3	0	2016	7	2015-12-29 09:52:46.969364	2016-04-05 13:27:11.318434
6536	63	1	5	3	2	0	2016	5	2015-12-29 09:52:46.875276	2016-11-30 13:45:14.812085
6537	63	2	15	7	8	0	2016	15	2015-12-29 09:52:46.889012	2016-12-30 07:34:59.07297
6540	63	5	5	3	2	0	2016	5	2015-12-29 09:52:46.931997	2016-12-30 07:42:43.9954
6543	63	8	5	3	2	0	2016	5	2015-12-29 09:52:46.984047	2016-11-24 07:23:01.932715
6590	120	1	5	5	0	0	2016	5	2015-12-29 09:52:47.804031	2015-12-29 09:52:47.804031
6591	120	2	15	15	0	0	2016	15	2015-12-29 09:52:47.81761	2015-12-29 09:52:47.81761
6592	120	3	7	7	0	0	2016	7	2015-12-29 09:52:47.832294	2015-12-29 09:52:47.832294
6593	120	4	7	7	0	0	2016	7	2015-12-29 09:52:47.845901	2015-12-29 09:52:47.845901
6594	120	5	5	5	0	0	2016	5	2015-12-29 09:52:47.85954	2015-12-29 09:52:47.85954
6596	120	7	7	7	0	0	2016	7	2015-12-29 09:52:47.887893	2015-12-29 09:52:47.887893
6597	120	8	5	5	0	0	2016	5	2015-12-29 09:52:47.901487	2015-12-29 09:52:47.901487
6598	120	9	0	0	0	0	2016	0	2015-12-29 09:52:47.916146	2015-12-29 09:52:47.916146
6599	125	1	5	5	0	0	2016	5	2015-12-29 09:52:47.92977	2015-12-29 09:52:47.92977
6600	125	2	15	15	0	0	2016	15	2015-12-29 09:52:47.944391	2015-12-29 09:52:47.944391
6601	125	3	7	7	0	0	2016	7	2015-12-29 09:52:47.958052	2015-12-29 09:52:47.958052
6602	125	4	7	7	0	0	2016	7	2015-12-29 09:52:47.98186	2015-12-29 09:52:47.98186
6603	125	5	5	5	0	0	2016	5	2015-12-29 09:52:47.996445	2015-12-29 09:52:47.996445
6605	125	7	7	7	0	0	2016	7	2015-12-29 09:52:48.023781	2015-12-29 09:52:48.023781
6606	125	8	5	5	0	0	2016	5	2015-12-29 09:52:48.038351	2015-12-29 09:52:48.038351
6607	125	9	0	0	0	0	2016	0	2015-12-29 09:52:48.052061	2015-12-29 09:52:48.052061
6608	113	1	5	5	0	0	2016	5	2015-12-29 09:52:48.065645	2015-12-29 09:52:48.065645
6609	113	2	15	15	0	0	2016	15	2015-12-29 09:52:48.080283	2015-12-29 09:52:48.080283
6610	113	3	7	7	0	0	2016	7	2015-12-29 09:52:48.093956	2015-12-29 09:52:48.093956
6611	113	4	7	7	0	0	2016	7	2015-12-29 09:52:48.107708	2015-12-29 09:52:48.107708
6612	113	5	5	5	0	0	2016	5	2015-12-29 09:52:48.122197	2015-12-29 09:52:48.122197
6614	113	7	7	7	0	0	2016	7	2015-12-29 09:52:48.149562	2015-12-29 09:52:48.149562
6615	113	8	5	5	0	0	2016	5	2015-12-29 09:52:48.16416	2015-12-29 09:52:48.16416
6616	113	9	0	0	0	0	2016	0	2015-12-29 09:52:48.177804	2015-12-29 09:52:48.177804
6620	140	4	7	7	0	0	2016	7	2015-12-29 09:52:48.234372	2015-12-29 09:52:48.234372
6622	140	6	84	84	0	0	2016	84	2015-12-29 09:52:48.26167	2015-12-29 09:52:48.26167
6625	140	9	0	0	0	0	2016	0	2015-12-29 09:52:48.303644	2015-12-29 09:52:48.303644
6626	166	1	5	5	0	0	2016	5	2015-12-29 09:52:48.318258	2015-12-29 09:52:48.318258
6627	166	2	15	15	0	0	2016	15	2015-12-29 09:52:48.331976	2015-12-29 09:52:48.331976
6628	166	3	7	7	0	0	2016	7	2015-12-29 09:52:48.345544	2015-12-29 09:52:48.345544
6629	166	4	7	7	0	0	2016	7	2015-12-29 09:52:48.360222	2015-12-29 09:52:48.360222
6630	166	5	5	5	0	0	2016	5	2015-12-29 09:52:48.373838	2015-12-29 09:52:48.373838
6631	166	6	84	84	0	0	2016	84	2015-12-29 09:52:48.387443	2015-12-29 09:52:48.387443
6632	166	7	7	7	0	0	2016	7	2015-12-29 09:52:48.402076	2015-12-29 09:52:48.402076
6633	166	8	5	5	0	0	2016	5	2015-12-29 09:52:48.4158	2015-12-29 09:52:48.4158
6634	166	9	0	0	0	0	2016	0	2015-12-29 09:52:48.429405	2015-12-29 09:52:48.429405
6635	161	1	5	5	0	0	2016	5	2015-12-29 09:52:48.444823	2015-12-29 09:52:48.444823
6636	161	2	15	15	0	0	2016	15	2015-12-29 09:52:48.467937	2015-12-29 09:52:48.467937
6637	161	3	7	7	0	0	2016	7	2015-12-29 09:52:48.492515	2015-12-29 09:52:48.492515
6638	161	4	7	7	0	0	2016	7	2015-12-29 09:52:48.506418	2015-12-29 09:52:48.506418
6639	161	5	5	5	0	0	2016	5	2015-12-29 09:52:48.530227	2015-12-29 09:52:48.530227
6641	161	7	7	7	0	0	2016	7	2015-12-29 09:52:48.55821	2015-12-29 09:52:48.55821
6642	161	8	5	5	0	0	2016	5	2015-12-29 09:52:48.582024	2015-12-29 09:52:48.582024
6643	161	9	0	0	0	0	2016	0	2015-12-29 09:52:48.596591	2015-12-29 09:52:48.596591
6644	58	1	5	5	0	0	2016	5	2015-12-29 09:52:48.610222	2015-12-29 09:52:48.610222
6645	58	2	15	15	0	0	2016	15	2015-12-29 09:52:48.634199	2015-12-29 09:52:48.634199
6646	58	3	7	7	0	0	2016	7	2015-12-29 09:52:48.648615	2015-12-29 09:52:48.648615
6647	58	4	7	7	0	0	2016	7	2015-12-29 09:52:48.662314	2015-12-29 09:52:48.662314
6648	58	5	5	5	0	0	2016	5	2015-12-29 09:52:48.675971	2015-12-29 09:52:48.675971
6650	58	7	7	7	0	0	2016	7	2015-12-29 09:52:48.704229	2015-12-29 09:52:48.704229
6651	58	8	5	5	0	0	2016	5	2015-12-29 09:52:48.717834	2015-12-29 09:52:48.717834
6652	58	9	0	0	0	0	2016	0	2015-12-29 09:52:48.732477	2015-12-29 09:52:48.732477
6653	105	1	5	5	0	0	2016	5	2015-12-29 09:52:48.746422	2015-12-29 09:52:48.746422
6654	105	2	15	15	0	0	2016	15	2015-12-29 09:52:48.759828	2015-12-29 09:52:48.759828
6655	105	3	7	7	0	0	2016	7	2015-12-29 09:52:48.784509	2015-12-29 09:52:48.784509
6656	105	4	7	7	0	0	2016	7	2015-12-29 09:52:48.79845	2015-12-29 09:52:48.79845
6657	105	5	5	5	0	0	2016	5	2015-12-29 09:52:48.812788	2015-12-29 09:52:48.812788
6659	105	7	7	7	0	0	2016	7	2015-12-29 09:52:48.84037	2015-12-29 09:52:48.84037
6660	105	8	5	5	0	0	2016	5	2015-12-29 09:52:48.854734	2015-12-29 09:52:48.854734
6661	105	9	0	0	0	0	2016	0	2015-12-29 09:52:48.868377	2015-12-29 09:52:48.868377
6662	172	1	5	5	0	0	2016	5	2015-12-29 09:52:48.882032	2015-12-29 09:52:48.882032
6663	172	2	15	15	0	0	2016	15	2015-12-29 09:52:48.896656	2015-12-29 09:52:48.896656
6664	172	3	7	7	0	0	2016	7	2015-12-29 09:52:48.910582	2015-12-29 09:52:48.910582
6595	120	6	84	0	0	0	2016	0	2015-12-29 09:52:47.87416	2015-12-29 09:53:12.850348
6604	125	6	84	0	0	0	2016	0	2015-12-29 09:52:48.010083	2015-12-29 09:53:12.879235
6613	113	6	84	0	0	0	2016	0	2015-12-29 09:52:48.13593	2015-12-29 09:53:12.908109
6640	161	6	84	0	0	0	2016	0	2015-12-29 09:52:48.544576	2015-12-29 09:53:12.936034
6649	58	6	84	0	0	0	2016	0	2015-12-29 09:52:48.690543	2015-12-29 09:53:12.964891
6658	105	6	84	0	0	0	2016	0	2015-12-29 09:52:48.82672	2015-12-29 09:53:12.993756
6618	140	2	15	0	15	0	2016	15	2015-12-29 09:52:48.206087	2016-12-02 08:54:02.326548
6617	140	1	5	1	4	0	2016	5	2015-12-29 09:52:48.191461	2016-12-20 13:47:06.268251
6619	140	3	7	3	4	0	2016	7	2015-12-29 09:52:48.219773	2016-10-11 06:10:51.14204
6624	140	8	5	0	5	0	2016	5	2015-12-29 09:52:48.289953	2016-10-27 06:28:15.31389
6621	140	5	5	0	5	0	2016	5	2015-12-29 09:52:48.248087	2016-12-08 10:52:47.773836
6665	172	4	7	7	0	0	2016	7	2015-12-29 09:52:48.924011	2015-12-29 09:52:48.924011
6666	172	5	5	5	0	0	2016	5	2015-12-29 09:52:48.938593	2015-12-29 09:52:48.938593
39875	168	9	0	0	0	0	2017	0	2017-01-02 04:46:59.277289	2017-01-02 04:46:59.277289
6668	172	7	7	7	0	0	2016	7	2015-12-29 09:52:48.965889	2015-12-29 09:52:48.965889
6669	172	8	5	5	0	0	2016	5	2015-12-29 09:52:48.980507	2015-12-29 09:52:48.980507
6670	172	9	0	0	0	0	2016	0	2015-12-29 09:52:48.994191	2015-12-29 09:52:48.994191
6671	162	1	5	5	0	0	2016	5	2015-12-29 09:52:49.00787	2015-12-29 09:52:49.00787
6672	162	2	15	15	0	0	2016	15	2015-12-29 09:52:49.02244	2015-12-29 09:52:49.02244
6673	162	3	7	7	0	0	2016	7	2015-12-29 09:52:49.036158	2015-12-29 09:52:49.036158
6674	162	4	7	7	0	0	2016	7	2015-12-29 09:52:49.049745	2015-12-29 09:52:49.049745
6675	162	5	5	5	0	0	2016	5	2015-12-29 09:52:49.064391	2015-12-29 09:52:49.064391
6677	162	7	7	7	0	0	2016	7	2015-12-29 09:52:49.092658	2015-12-29 09:52:49.092658
6678	162	8	5	5	0	0	2016	5	2015-12-29 09:52:49.106323	2015-12-29 09:52:49.106323
6679	162	9	0	0	0	0	2016	0	2015-12-29 09:52:49.120008	2015-12-29 09:52:49.120008
6680	141	1	5	5	0	0	2016	5	2015-12-29 09:52:49.134606	2015-12-29 09:52:49.134606
6681	141	2	15	15	0	0	2016	15	2015-12-29 09:52:49.148302	2015-12-29 09:52:49.148302
6682	141	3	7	7	0	0	2016	7	2015-12-29 09:52:49.161895	2015-12-29 09:52:49.161895
6683	141	4	7	7	0	0	2016	7	2015-12-29 09:52:49.176552	2015-12-29 09:52:49.176552
6684	141	5	5	5	0	0	2016	5	2015-12-29 09:52:49.190187	2015-12-29 09:52:49.190187
6685	141	6	84	84	0	0	2016	84	2015-12-29 09:52:49.20386	2015-12-29 09:52:49.20386
6686	141	7	7	7	0	0	2016	7	2015-12-29 09:52:49.21852	2015-12-29 09:52:49.21852
6687	141	8	5	5	0	0	2016	5	2015-12-29 09:52:49.23216	2015-12-29 09:52:49.23216
6688	141	9	0	0	0	0	2016	0	2015-12-29 09:52:49.245757	2015-12-29 09:52:49.245757
6689	59	1	5	5	0	0	2016	5	2015-12-29 09:52:49.260396	2015-12-29 09:52:49.260396
6690	59	2	15	15	0	0	2016	15	2015-12-29 09:52:49.274052	2015-12-29 09:52:49.274052
6691	59	3	7	7	0	0	2016	7	2015-12-29 09:52:49.287693	2015-12-29 09:52:49.287693
6692	59	4	7	7	0	0	2016	7	2015-12-29 09:52:49.302324	2015-12-29 09:52:49.302324
6693	59	5	5	5	0	0	2016	5	2015-12-29 09:52:49.316009	2015-12-29 09:52:49.316009
6695	59	7	7	7	0	0	2016	7	2015-12-29 09:52:49.344282	2015-12-29 09:52:49.344282
6696	59	8	5	5	0	0	2016	5	2015-12-29 09:52:49.357902	2015-12-29 09:52:49.357902
6697	59	9	0	0	0	0	2016	0	2015-12-29 09:52:49.372545	2015-12-29 09:52:49.372545
6698	154	1	5	5	0	0	2016	5	2015-12-29 09:52:49.386209	2015-12-29 09:52:49.386209
6699	154	2	15	15	0	0	2016	15	2015-12-29 09:52:49.399903	2015-12-29 09:52:49.399903
6700	154	3	7	7	0	0	2016	7	2015-12-29 09:52:49.414477	2015-12-29 09:52:49.414477
6701	154	4	7	7	0	0	2016	7	2015-12-29 09:52:49.428181	2015-12-29 09:52:49.428181
6702	154	5	5	5	0	0	2016	5	2015-12-29 09:52:49.442724	2015-12-29 09:52:49.442724
6704	154	7	7	7	0	0	2016	7	2015-12-29 09:52:49.48034	2015-12-29 09:52:49.48034
6705	154	8	5	5	0	0	2016	5	2015-12-29 09:52:49.493975	2015-12-29 09:52:49.493975
6706	154	9	0	0	0	0	2016	0	2015-12-29 09:52:49.508606	2015-12-29 09:52:49.508606
6710	169	4	7	7	0	0	2016	7	2015-12-29 09:52:49.587972	2015-12-29 09:52:49.587972
6713	169	7	7	7	0	0	2016	7	2015-12-29 09:52:49.630684	2015-12-29 09:52:49.630684
6715	169	9	0	0	0	0	2016	0	2015-12-29 09:52:49.657992	2015-12-29 09:52:49.657992
6716	155	1	5	5	0	0	2016	5	2015-12-29 09:52:49.672603	2015-12-29 09:52:49.672603
6718	155	3	7	7	0	0	2016	7	2015-12-29 09:52:49.699993	2015-12-29 09:52:49.699993
6719	155	4	7	7	0	0	2016	7	2015-12-29 09:52:49.714558	2015-12-29 09:52:49.714558
6722	155	7	7	7	0	0	2016	7	2015-12-29 09:52:49.776672	2015-12-29 09:52:49.776672
6724	155	9	0	0	0	0	2016	0	2015-12-29 09:52:49.806241	2015-12-29 09:52:49.806241
6728	160	4	7	7	0	0	2016	7	2015-12-29 09:52:49.870639	2015-12-29 09:52:49.870639
6731	160	7	7	7	0	0	2016	7	2015-12-29 09:52:49.926255	2015-12-29 09:52:49.926255
6733	160	9	0	0	0	0	2016	0	2015-12-29 09:52:49.968216	2015-12-29 09:52:49.968216
6736	171	3	7	7	0	0	2016	7	2015-12-29 09:52:50.010093	2015-12-29 09:52:50.010093
6737	171	4	7	7	0	0	2016	7	2015-12-29 09:52:50.024713	2015-12-29 09:52:50.024713
6676	162	6	84	0	0	0	2016	0	2015-12-29 09:52:49.078031	2015-12-29 09:53:13.06064
6694	59	6	84	0	0	0	2016	0	2015-12-29 09:52:49.330621	2015-12-29 09:53:13.099644
6703	154	6	84	0	0	0	2016	0	2015-12-29 09:52:49.46669	2015-12-29 09:53:13.128524
6712	169	6	84	0	0	0	2016	0	2015-12-29 09:52:49.616141	2015-12-29 09:53:13.157462
6721	155	6	84	0	0	0	2016	0	2015-12-29 09:52:49.7523	2015-12-29 09:53:13.185273
6730	160	6	84	0	0	0	2016	0	2015-12-29 09:52:49.897952	2015-12-29 09:53:13.2142
6739	171	6	84	0	0	0	2016	0	2015-12-29 09:52:50.052088	2015-12-29 09:53:13.253252
6714	169	8	5	0	5	0	2016	5	2015-12-29 09:52:49.644363	2016-04-05 09:25:54.000696
6723	155	8	5	3	2	0	2016	5	2015-12-29 09:52:49.790342	2016-01-11 07:37:38.142674
6729	160	5	5	0	5	0	2016	5	2015-12-29 09:52:49.884355	2016-08-24 10:28:13.604979
6720	155	5	5	4.5	0.5	0	2016	5	2015-12-29 09:52:49.728253	2016-02-12 05:19:55.57546
6717	155	2	15	14	1	0	2016	15	2015-12-29 09:52:49.686314	2016-01-18 04:58:49.884967
6738	171	5	5	0.5	4.5	0	2016	5	2015-12-29 09:52:50.038373	2016-10-11 04:58:32.850004
6708	169	2	15	3	12	0	2016	15	2015-12-29 09:52:49.535965	2016-08-19 10:44:35.017605
6734	171	1	5	1	4	0	2016	5	2015-12-29 09:52:49.982798	2016-11-23 06:59:53.727931
6726	160	2	15	1	14	0	2016	15	2015-12-29 09:52:49.84237	2016-10-21 08:51:46.146652
6727	160	3	7	5	2	0	2016	7	2015-12-29 09:52:49.856051	2016-10-13 11:58:31.239041
6732	160	8	5	1	4	0	2016	5	2015-12-29 09:52:49.954526	2016-10-13 12:01:01.644648
6711	169	5	5	3.5	1.5	0	2016	5	2015-12-29 09:52:49.602635	2016-05-11 05:46:01.701759
6707	169	1	5	3	2	0	2016	5	2015-12-29 09:52:49.522275	2016-06-14 05:05:10.024892
6709	169	3	7	5	2	0	2016	7	2015-12-29 09:52:49.561342	2016-05-11 05:55:18.507154
6725	160	1	5	2	3	0	2016	5	2015-12-29 09:52:49.828806	2016-10-21 08:50:25.53271
6740	171	7	7	7	0	0	2016	7	2015-12-29 09:52:50.066656	2015-12-29 09:52:50.066656
6743	156	1	5	5	0	0	2016	5	2015-12-29 09:52:50.10859	2015-12-29 09:52:50.10859
6744	156	2	15	15	0	0	2016	15	2015-12-29 09:52:50.122279	2015-12-29 09:52:50.122279
6745	156	3	7	7	0	0	2016	7	2015-12-29 09:52:50.135941	2015-12-29 09:52:50.135941
6746	156	4	7	7	0	0	2016	7	2015-12-29 09:52:50.15052	2015-12-29 09:52:50.15052
6747	156	5	5	5	0	0	2016	5	2015-12-29 09:52:50.164235	2015-12-29 09:52:50.164235
6749	156	7	7	7	0	0	2016	7	2015-12-29 09:52:50.192477	2015-12-29 09:52:50.192477
6750	156	8	5	5	0	0	2016	5	2015-12-29 09:52:50.206097	2015-12-29 09:52:50.206097
6751	156	9	0	0	0	0	2016	0	2015-12-29 09:52:50.220763	2015-12-29 09:52:50.220763
6752	157	1	5	5	0	0	2016	5	2015-12-29 09:52:50.23441	2015-12-29 09:52:50.23441
6753	157	2	15	15	0	0	2016	15	2015-12-29 09:52:50.248098	2015-12-29 09:52:50.248098
6754	157	3	7	7	0	0	2016	7	2015-12-29 09:52:50.262669	2015-12-29 09:52:50.262669
6755	157	4	7	7	0	0	2016	7	2015-12-29 09:52:50.276327	2015-12-29 09:52:50.276327
6756	157	5	5	5	0	0	2016	5	2015-12-29 09:52:50.289964	2015-12-29 09:52:50.289964
6758	157	7	7	7	0	0	2016	7	2015-12-29 09:52:50.318255	2015-12-29 09:52:50.318255
6759	157	8	5	5	0	0	2016	5	2015-12-29 09:52:50.331973	2015-12-29 09:52:50.331973
6760	157	9	0	0	0	0	2016	0	2015-12-29 09:52:50.34656	2015-12-29 09:52:50.34656
6761	234	1	5	5	0	0	2016	5	2015-12-29 09:52:50.360217	2015-12-29 09:52:50.360217
6762	234	2	15	15	0	0	2016	15	2015-12-29 09:52:50.373834	2015-12-29 09:52:50.373834
6763	234	3	7	7	0	0	2016	7	2015-12-29 09:52:50.388471	2015-12-29 09:52:50.388471
6764	234	4	7	7	0	0	2016	7	2015-12-29 09:52:50.40213	2015-12-29 09:52:50.40213
6765	234	5	5	5	0	0	2016	5	2015-12-29 09:52:50.415812	2015-12-29 09:52:50.415812
6766	234	6	84	84	0	0	2016	84	2015-12-29 09:52:50.430393	2015-12-29 09:52:50.430393
6767	234	7	7	7	0	0	2016	7	2015-12-29 09:52:50.444135	2015-12-29 09:52:50.444135
6768	234	8	5	5	0	0	2016	5	2015-12-29 09:52:50.45868	2015-12-29 09:52:50.45868
6769	234	9	0	0	0	0	2016	0	2015-12-29 09:52:50.472352	2015-12-29 09:52:50.472352
6770	150	1	5	5	0	0	2016	5	2015-12-29 09:52:50.48599	2015-12-29 09:52:50.48599
6771	150	2	15	15	0	0	2016	15	2015-12-29 09:52:50.500632	2015-12-29 09:52:50.500632
6772	150	3	7	7	0	0	2016	7	2015-12-29 09:52:50.514281	2015-12-29 09:52:50.514281
6773	150	4	7	7	0	0	2016	7	2015-12-29 09:52:50.527986	2015-12-29 09:52:50.527986
6774	150	5	5	5	0	0	2016	5	2015-12-29 09:52:50.542554	2015-12-29 09:52:50.542554
6775	150	6	84	84	0	0	2016	84	2015-12-29 09:52:50.556243	2015-12-29 09:52:50.556243
6776	150	7	7	7	0	0	2016	7	2015-12-29 09:52:50.56985	2015-12-29 09:52:50.56985
6777	150	8	5	5	0	0	2016	5	2015-12-29 09:52:50.584489	2015-12-29 09:52:50.584489
6778	150	9	0	0	0	0	2016	0	2015-12-29 09:52:50.598142	2015-12-29 09:52:50.598142
6781	131	3	7	7	0	0	2016	7	2015-12-29 09:52:50.640108	2015-12-29 09:52:50.640108
6782	131	4	7	7	0	0	2016	7	2015-12-29 09:52:50.653711	2015-12-29 09:52:50.653711
6784	131	6	84	84	0	0	2016	84	2015-12-29 09:52:50.681993	2015-12-29 09:52:50.681993
6787	131	9	0	0	0	0	2016	0	2015-12-29 09:52:50.723984	2015-12-29 09:52:50.723984
6788	173	1	5	5	0	0	2016	5	2015-12-29 09:52:50.738564	2015-12-29 09:52:50.738564
6789	173	2	15	15	0	0	2016	15	2015-12-29 09:52:50.762659	2015-12-29 09:52:50.762659
6790	173	3	7	7	0	0	2016	7	2015-12-29 09:52:50.776005	2015-12-29 09:52:50.776005
6791	173	4	7	7	0	0	2016	7	2015-12-29 09:52:50.790597	2015-12-29 09:52:50.790597
6792	173	5	5	5	0	0	2016	5	2015-12-29 09:52:50.80429	2015-12-29 09:52:50.80429
6793	173	6	84	84	0	0	2016	84	2015-12-29 09:52:50.817878	2015-12-29 09:52:50.817878
6794	173	7	7	7	0	0	2016	7	2015-12-29 09:52:50.83253	2015-12-29 09:52:50.83253
6795	173	8	5	5	0	0	2016	5	2015-12-29 09:52:50.846189	2015-12-29 09:52:50.846189
6796	173	9	0	0	0	0	2016	0	2015-12-29 09:52:50.859893	2015-12-29 09:52:50.859893
6797	145	1	5	5	0	0	2016	5	2015-12-29 09:52:50.874451	2015-12-29 09:52:50.874451
6798	145	2	15	15	0	0	2016	15	2015-12-29 09:52:50.888166	2015-12-29 09:52:50.888166
6799	145	3	7	7	0	0	2016	7	2015-12-29 09:52:50.901751	2015-12-29 09:52:50.901751
6800	145	4	7	7	0	0	2016	7	2015-12-29 09:52:50.916385	2015-12-29 09:52:50.916385
6801	145	5	5	5	0	0	2016	5	2015-12-29 09:52:50.930056	2015-12-29 09:52:50.930056
6803	145	7	7	7	0	0	2016	7	2015-12-29 09:52:50.958328	2015-12-29 09:52:50.958328
6804	145	8	5	5	0	0	2016	5	2015-12-29 09:52:50.972054	2015-12-29 09:52:50.972054
6805	145	9	0	0	0	0	2016	0	2015-12-29 09:52:50.986618	2015-12-29 09:52:50.986618
6806	149	1	5	5	0	0	2016	5	2015-12-29 09:52:51.000272	2015-12-29 09:52:51.000272
6807	149	2	15	15	0	0	2016	15	2015-12-29 09:52:51.013906	2015-12-29 09:52:51.013906
6808	149	3	7	7	0	0	2016	7	2015-12-29 09:52:51.028551	2015-12-29 09:52:51.028551
6809	149	4	7	7	0	0	2016	7	2015-12-29 09:52:51.042187	2015-12-29 09:52:51.042187
6810	149	5	5	5	0	0	2016	5	2015-12-29 09:52:51.055882	2015-12-29 09:52:51.055882
6812	149	7	7	7	0	0	2016	7	2015-12-29 09:52:51.084167	2015-12-29 09:52:51.084167
6813	149	8	5	5	0	0	2016	5	2015-12-29 09:52:51.097781	2015-12-29 09:52:51.097781
6814	149	9	0	0	0	0	2016	0	2015-12-29 09:52:51.117795	2015-12-29 09:52:51.117795
6748	156	6	84	0	0	0	2016	0	2015-12-29 09:52:50.178818	2015-12-29 09:53:13.282016
6757	157	6	84	0	0	0	2016	0	2015-12-29 09:52:50.3046	2015-12-29 09:53:13.309901
6802	145	6	84	0	0	0	2016	0	2015-12-29 09:52:50.943727	2015-12-29 09:53:13.338788
6811	149	6	84	0	0	0	2016	0	2015-12-29 09:52:51.070496	2015-12-29 09:53:13.367748
6783	131	5	5	1	4	0	2016	5	2015-12-29 09:52:50.668353	2016-12-30 06:29:19.288756
6779	131	1	5	0	5	0	2016	5	2015-12-29 09:52:50.611842	2016-10-20 04:05:34.199452
6741	171	8	5	0	5	0	2016	5	2015-12-29 09:52:50.080316	2016-09-08 08:08:58.618794
6780	131	2	15	0	15	0	2016	15	2015-12-29 09:52:50.626408	2016-12-12 07:48:38.748644
6786	131	8	5	1	4	0	2016	5	2015-12-29 09:52:50.71028	2016-12-21 05:44:06.497015
6742	171	9	3	0	3	0	2016	3	2015-12-29 09:52:50.093944	2016-12-26 09:01:38.851264
6815	165	1	5	5	0	0	2016	5	2015-12-29 09:52:51.136607	2015-12-29 09:52:51.136607
6816	165	2	15	15	0	0	2016	15	2015-12-29 09:52:51.160187	2015-12-29 09:52:51.160187
6817	165	3	7	7	0	0	2016	7	2015-12-29 09:52:51.174555	2015-12-29 09:52:51.174555
6818	165	4	7	7	0	0	2016	7	2015-12-29 09:52:51.188235	2015-12-29 09:52:51.188235
6819	165	5	5	5	0	0	2016	5	2015-12-29 09:52:51.201966	2015-12-29 09:52:51.201966
6821	165	7	7	7	0	0	2016	7	2015-12-29 09:52:51.230532	2015-12-29 09:52:51.230532
6822	165	8	5	5	0	0	2016	5	2015-12-29 09:52:51.244093	2015-12-29 09:52:51.244093
6823	165	9	0	0	0	0	2016	0	2015-12-29 09:52:51.258573	2015-12-29 09:52:51.258573
6826	158	3	7	7	0	0	2016	7	2015-12-29 09:52:51.300837	2015-12-29 09:52:51.300837
6827	158	4	7	7	0	0	2016	7	2015-12-29 09:52:51.314279	2015-12-29 09:52:51.314279
6830	158	7	7	7	0	0	2016	7	2015-12-29 09:52:51.381044	2015-12-29 09:52:51.381044
6832	158	9	0	0	0	0	2016	0	2015-12-29 09:52:51.408287	2015-12-29 09:52:51.408287
6833	139	1	5	5	0	0	2016	5	2015-12-29 09:52:51.422873	2015-12-29 09:52:51.422873
6834	139	2	15	15	0	0	2016	15	2015-12-29 09:52:51.436756	2015-12-29 09:52:51.436756
6835	139	3	7	7	0	0	2016	7	2015-12-29 09:52:51.45036	2015-12-29 09:52:51.45036
6836	139	4	7	7	0	0	2016	7	2015-12-29 09:52:51.464785	2015-12-29 09:52:51.464785
6837	139	5	5	5	0	0	2016	5	2015-12-29 09:52:51.478606	2015-12-29 09:52:51.478606
6838	139	6	84	84	0	0	2016	84	2015-12-29 09:52:51.49238	2015-12-29 09:52:51.49238
39876	151	1	5	5	0	0	2017	5	2017-01-02 04:46:59.287324	2017-01-02 04:46:59.287324
6840	139	8	5	5	0	0	2016	5	2015-12-29 09:52:51.530763	2015-12-29 09:52:51.530763
6841	139	9	0	0	0	0	2016	0	2015-12-29 09:52:51.544276	2015-12-29 09:52:51.544276
6844	163	3	7	7	0	0	2016	7	2015-12-29 09:52:51.587349	2015-12-29 09:52:51.587349
6845	163	4	7	7	0	0	2016	7	2015-12-29 09:52:51.600828	2015-12-29 09:52:51.600828
6848	163	7	7	7	0	0	2016	7	2015-12-29 09:52:51.663345	2015-12-29 09:52:51.663345
6850	163	9	0	0	0	0	2016	0	2015-12-29 09:52:51.711819	2015-12-29 09:52:51.711819
6853	143	3	7	7	0	0	2016	7	2015-12-29 09:52:51.763243	2015-12-29 09:52:51.763243
6854	143	4	7	7	0	0	2016	7	2015-12-29 09:52:51.776833	2015-12-29 09:52:51.776833
6857	143	7	7	7	0	0	2016	7	2015-12-29 09:52:51.818733	2015-12-29 09:52:51.818733
6859	143	9	0	0	0	0	2016	0	2015-12-29 09:52:51.847055	2015-12-29 09:52:51.847055
6860	146	1	5	5	0	0	2016	5	2015-12-29 09:52:51.860716	2015-12-29 09:52:51.860716
6861	146	2	15	15	0	0	2016	15	2015-12-29 09:52:51.875314	2015-12-29 09:52:51.875314
6862	146	3	7	7	0	0	2016	7	2015-12-29 09:52:51.889003	2015-12-29 09:52:51.889003
6863	146	4	7	7	0	0	2016	7	2015-12-29 09:52:51.902587	2015-12-29 09:52:51.902587
6864	146	5	5	5	0	0	2016	5	2015-12-29 09:52:51.917233	2015-12-29 09:52:51.917233
6865	146	6	84	84	0	0	2016	84	2015-12-29 09:52:51.930909	2015-12-29 09:52:51.930909
6867	146	8	5	5	0	0	2016	5	2015-12-29 09:52:51.959941	2015-12-29 09:52:51.959941
6868	146	9	0	0	0	0	2016	0	2015-12-29 09:52:51.983088	2015-12-29 09:52:51.983088
6872	168	4	7	7	0	0	2016	7	2015-12-29 09:52:52.038496	2015-12-29 09:52:52.038496
6874	168	6	84	84	0	0	2016	84	2015-12-29 09:52:52.066771	2015-12-29 09:52:52.066771
6877	168	9	0	0	0	0	2016	0	2015-12-29 09:52:52.108677	2015-12-29 09:52:52.108677
6880	151	3	7	7	0	0	2016	7	2015-12-29 09:52:52.150655	2015-12-29 09:52:52.150655
6881	151	4	7	7	0	0	2016	7	2015-12-29 09:52:52.165458	2015-12-29 09:52:52.165458
6883	151	6	84	84	0	0	2016	84	2015-12-29 09:52:52.192752	2015-12-29 09:52:52.192752
6886	151	9	0	0	0	0	2016	0	2015-12-29 09:52:52.235277	2015-12-29 09:52:52.235277
6889	142	3	7	7	0	0	2016	7	2015-12-29 09:52:52.276658	2015-12-29 09:52:52.276658
6866	146	7	7	0	0	0	2016	0	2015-12-29 09:52:51.944548	2015-12-29 09:53:10.243643
6875	168	7	7	0	0	0	2016	0	2015-12-29 09:52:52.08046	2015-12-29 09:53:10.272336
6884	151	7	7	0	0	0	2016	0	2015-12-29 09:52:52.207389	2015-12-29 09:53:10.301237
6820	165	6	84	0	0	0	2016	0	2015-12-29 09:52:51.216578	2015-12-29 09:53:13.406668
6829	158	6	84	0	0	0	2016	0	2015-12-29 09:52:51.359135	2015-12-29 09:53:13.434559
6847	163	6	84	0	0	0	2016	0	2015-12-29 09:52:51.639764	2015-12-29 09:53:13.463468
6856	143	6	84	0	0	0	2016	0	2015-12-29 09:52:51.805098	2015-12-29 09:53:13.492342
6849	163	8	5	0	5	0	2016	5	2015-12-29 09:52:51.687112	2016-08-25 04:27:01.09984
6873	168	5	5	0	5	0	2016	5	2015-12-29 09:52:52.053171	2016-12-28 05:13:45.539591
6885	151	8	5	4	1	0	2016	5	2015-12-29 09:52:52.22095	2016-02-12 13:14:50.485405
6882	151	5	5	3	2	0	2016	5	2015-12-29 09:52:52.17915	2016-03-03 07:52:31.86476
6855	143	5	5	0	5	0	2016	5	2015-12-29 09:52:51.79049	2016-07-27 06:38:21.624656
6858	143	8	5	1	4	0	2016	5	2015-12-29 09:52:51.832414	2016-10-01 17:36:05.167686
6846	163	5	5	0	5	0	2016	5	2015-12-29 09:52:51.614138	2016-12-21 08:34:40.736192
6879	151	2	15	13	2	0	2016	15	2015-12-29 09:52:52.137037	2016-03-04 03:07:02.553299
6878	151	1	5	3	2	0	2016	5	2015-12-29 09:52:52.122382	2016-02-04 16:19:34.805362
6851	143	1	5	0	5	0	2016	5	2015-12-29 09:52:51.735336	2016-07-27 06:37:20.179182
6887	142	1	5	2	3	0	2016	5	2015-12-29 09:52:52.249439	2016-11-29 03:06:34.797841
6828	158	5	5	3	2	0	2016	5	2015-12-29 09:52:51.328849	2016-12-22 08:13:39.371347
6870	168	2	15	0	15	0	2016	15	2015-12-29 09:52:52.011217	2016-10-18 05:05:28.99841
6824	158	1	5	0	5	0	2016	5	2015-12-29 09:52:51.272292	2016-12-16 04:23:44.27565
6869	168	1	5	1	4	0	2016	5	2015-12-29 09:52:51.99657	2016-12-28 05:14:42.777604
6831	158	8	5	1	4	0	2016	5	2015-12-29 09:52:51.394676	2016-05-13 05:07:56.473782
6876	168	8	5	0	5	0	2016	5	2015-12-29 09:52:52.09506	2016-12-28 05:14:15.642396
6871	168	3	7	2	5	0	2016	7	2015-12-29 09:52:52.02487	2016-04-20 12:08:25.480096
6825	158	2	15	3	12	0	2016	15	2015-12-29 09:52:51.287019	2016-12-30 01:58:05.144929
6842	163	1	5	0	5	0	2016	5	2015-12-29 09:52:51.558883	2016-12-30 08:55:52.761446
6888	142	2	15	0	15	0	2016	15	2015-12-29 09:52:52.263092	2016-12-26 07:24:47.376133
6843	163	2	15	0	15	0	2016	15	2015-12-29 09:52:51.572705	2016-12-21 08:34:25.908718
6890	142	4	7	7	0	0	2016	7	2015-12-29 09:52:52.291096	2015-12-29 09:52:52.291096
6893	142	7	7	7	0	0	2016	7	2015-12-29 09:52:52.450331	2015-12-29 09:52:52.450331
6896	164	1	5	5	0	0	2016	5	2015-12-29 09:52:52.501965	2015-12-29 09:52:52.501965
6897	164	2	15	15	0	0	2016	15	2015-12-29 09:52:52.516594	2015-12-29 09:52:52.516594
6898	164	3	7	7	0	0	2016	7	2015-12-29 09:52:52.530212	2015-12-29 09:52:52.530212
6899	164	4	7	7	0	0	2016	7	2015-12-29 09:52:52.543903	2015-12-29 09:52:52.543903
6900	164	5	5	5	0	0	2016	5	2015-12-29 09:52:52.56879	2015-12-29 09:52:52.56879
6902	164	7	7	7	0	0	2016	7	2015-12-29 09:52:52.596564	2015-12-29 09:52:52.596564
6903	164	8	5	5	0	0	2016	5	2015-12-29 09:52:52.610201	2015-12-29 09:52:52.610201
6904	164	9	0	0	0	0	2016	0	2015-12-29 09:52:52.623875	2015-12-29 09:52:52.623875
6907	159	3	7	7	0	0	2016	7	2015-12-29 09:52:52.665791	2015-12-29 09:52:52.665791
6908	159	4	7	7	0	0	2016	7	2015-12-29 09:52:52.6806	2015-12-29 09:52:52.6806
6911	159	7	7	7	0	0	2016	7	2015-12-29 09:52:52.743006	2015-12-29 09:52:52.743006
6913	159	9	0	0	0	0	2016	0	2015-12-29 09:52:52.770086	2015-12-29 09:52:52.770086
6914	174	1	5	5	0	0	2016	5	2015-12-29 09:52:52.784834	2015-12-29 09:52:52.784834
6915	174	2	15	15	0	0	2016	15	2015-12-29 09:52:52.79846	2015-12-29 09:52:52.79846
6916	174	3	7	7	0	0	2016	7	2015-12-29 09:52:52.812141	2015-12-29 09:52:52.812141
6917	174	4	7	7	0	0	2016	7	2015-12-29 09:52:52.827139	2015-12-29 09:52:52.827139
6918	174	5	5	5	0	0	2016	5	2015-12-29 09:52:52.850641	2015-12-29 09:52:52.850641
6919	174	6	84	84	0	0	2016	84	2015-12-29 09:52:52.864957	2015-12-29 09:52:52.864957
6920	174	7	7	7	0	0	2016	7	2015-12-29 09:52:52.878682	2015-12-29 09:52:52.878682
6921	174	8	5	5	0	0	2016	5	2015-12-29 09:52:52.892452	2015-12-29 09:52:52.892452
6922	174	9	0	0	0	0	2016	0	2015-12-29 09:52:52.907114	2015-12-29 09:52:52.907114
6923	148	1	5	5	0	0	2016	5	2015-12-29 09:52:52.920776	2015-12-29 09:52:52.920776
6924	148	2	15	15	0	0	2016	15	2015-12-29 09:52:52.934458	2015-12-29 09:52:52.934458
6925	148	3	7	7	0	0	2016	7	2015-12-29 09:52:52.948729	2015-12-29 09:52:52.948729
6926	148	4	7	7	0	0	2016	7	2015-12-29 09:52:52.962307	2015-12-29 09:52:52.962307
6927	148	5	5	5	0	0	2016	5	2015-12-29 09:52:52.975992	2015-12-29 09:52:52.975992
6928	148	6	84	84	0	0	2016	84	2015-12-29 09:52:52.990575	2015-12-29 09:52:52.990575
6929	148	7	7	7	0	0	2016	7	2015-12-29 09:52:53.004284	2015-12-29 09:52:53.004284
6930	148	8	5	5	0	0	2016	5	2015-12-29 09:52:53.0179	2015-12-29 09:52:53.0179
6931	148	9	0	0	0	0	2016	0	2015-12-29 09:52:53.032525	2015-12-29 09:52:53.032525
6932	147	1	5	5	0	0	2016	5	2015-12-29 09:52:53.046166	2015-12-29 09:52:53.046166
6933	147	2	15	15	0	0	2016	15	2015-12-29 09:52:53.059872	2015-12-29 09:52:53.059872
6934	147	3	7	7	0	0	2016	7	2015-12-29 09:52:53.165769	2015-12-29 09:52:53.165769
6935	147	4	7	7	0	0	2016	7	2015-12-29 09:52:53.179062	2015-12-29 09:52:53.179062
6936	147	5	5	5	0	0	2016	5	2015-12-29 09:52:53.192695	2015-12-29 09:52:53.192695
6937	147	6	84	84	0	0	2016	84	2015-12-29 09:52:53.207312	2015-12-29 09:52:53.207312
39877	151	2	15	15	0	0	2017	15	2017-01-02 04:46:59.305848	2017-01-02 04:46:59.305848
6939	147	8	5	5	0	0	2016	5	2015-12-29 09:52:53.245731	2015-12-29 09:52:53.245731
6940	147	9	0	0	0	0	2016	0	2015-12-29 09:52:53.259415	2015-12-29 09:52:53.259415
6941	126	1	5	5	0	0	2016	5	2015-12-29 09:52:53.273037	2015-12-29 09:52:53.273037
6942	126	2	15	15	0	0	2016	15	2015-12-29 09:52:53.287644	2015-12-29 09:52:53.287644
6943	126	3	7	7	0	0	2016	7	2015-12-29 09:52:53.301307	2015-12-29 09:52:53.301307
6944	126	4	7	7	0	0	2016	7	2015-12-29 09:52:53.315034	2015-12-29 09:52:53.315034
6945	126	5	5	5	0	0	2016	5	2015-12-29 09:52:53.32959	2015-12-29 09:52:53.32959
6946	126	6	84	84	0	0	2016	84	2015-12-29 09:52:53.353708	2015-12-29 09:52:53.353708
6947	126	7	7	7	0	0	2016	7	2015-12-29 09:52:53.366955	2015-12-29 09:52:53.366955
6948	126	8	5	5	0	0	2016	5	2015-12-29 09:52:53.381583	2015-12-29 09:52:53.381583
6949	126	9	0	0	0	0	2016	0	2015-12-29 09:52:53.395266	2015-12-29 09:52:53.395266
6952	176	3	7	7	0	0	2016	7	2015-12-29 09:52:53.437169	2015-12-29 09:52:53.437169
6953	176	4	7	7	0	0	2016	7	2015-12-29 09:52:53.450804	2015-12-29 09:52:53.450804
6955	176	6	84	84	0	0	2016	84	2015-12-29 09:52:53.479095	2015-12-29 09:52:53.479095
6959	182	1	5	5	0	0	2016	5	2015-12-29 09:52:53.535687	2015-12-29 09:52:53.535687
6960	182	2	15	15	0	0	2016	15	2015-12-29 09:52:53.549334	2015-12-29 09:52:53.549334
6961	182	3	7	7	0	0	2016	7	2015-12-29 09:52:53.562978	2015-12-29 09:52:53.562978
6962	182	4	7	7	0	0	2016	7	2015-12-29 09:52:53.577585	2015-12-29 09:52:53.577585
6963	182	5	5	5	0	0	2016	5	2015-12-29 09:52:53.591247	2015-12-29 09:52:53.591247
6956	176	7	7	0	0	0	2016	0	2015-12-29 09:52:53.492746	2015-12-29 09:53:10.358325
6892	142	6	84	0	0	0	2016	0	2015-12-29 09:52:52.382724	2015-12-29 09:53:13.521995
6901	164	6	84	0	0	0	2016	0	2015-12-29 09:52:52.581928	2015-12-29 09:53:13.580807
6910	159	6	84	0	0	0	2016	0	2015-12-29 09:52:52.718646	2015-12-29 09:53:13.608322
6964	182	6	84	0	0	0	2016	0	2015-12-29 09:52:53.604879	2015-12-29 09:53:13.637318
6957	176	8	5	0	5	0	2016	5	2015-12-29 09:52:53.507365	2016-12-22 12:25:34.328782
6891	142	5	5	2.5	2.5	0	2016	5	2015-12-29 09:52:52.304761	2016-12-19 08:45:45.590147
6958	176	9	1	1	0	0	2016	1	2015-12-29 09:52:53.52105	2016-12-23 08:54:52.64036
6951	176	2	15	0	15	0	2016	15	2015-12-29 09:52:53.423498	2016-12-22 12:25:55.349479
6909	159	5	5	0	5	0	2016	5	2015-12-29 09:52:52.694256	2016-09-19 10:52:03.454033
6912	159	8	5	2	3	0	2016	5	2015-12-29 09:52:52.756618	2016-08-26 12:12:27.360562
6950	176	1	5	0	5	0	2016	5	2015-12-29 09:52:53.408921	2016-08-11 08:19:50.756445
6906	159	2	15	0	15	0	2016	15	2015-12-29 09:52:52.652184	2016-09-19 10:50:16.924622
6895	142	9	2	0	2	0	2016	2	2015-12-29 09:52:52.488425	2016-06-27 10:59:34.621718
6905	159	1	5	0	5	0	2016	5	2015-12-29 09:52:52.63848	2016-12-23 04:29:43.1602
6894	142	8	5	3	2	0	2016	5	2015-12-29 09:52:52.474797	2016-12-26 07:25:16.354361
6965	182	7	7	7	0	0	2016	7	2015-12-29 09:52:53.619506	2015-12-29 09:52:53.619506
6966	182	8	5	5	0	0	2016	5	2015-12-29 09:52:53.633201	2015-12-29 09:52:53.633201
6967	182	9	0	0	0	0	2016	0	2015-12-29 09:52:53.646823	2015-12-29 09:52:53.646823
6968	192	1	5	5	0	0	2016	5	2015-12-29 09:52:53.661457	2015-12-29 09:52:53.661457
6969	192	2	15	15	0	0	2016	15	2015-12-29 09:52:53.675121	2015-12-29 09:52:53.675121
6970	192	3	7	7	0	0	2016	7	2015-12-29 09:52:53.688728	2015-12-29 09:52:53.688728
6971	192	4	7	7	0	0	2016	7	2015-12-29 09:52:53.703363	2015-12-29 09:52:53.703363
6972	192	5	5	5	0	0	2016	5	2015-12-29 09:52:53.717056	2015-12-29 09:52:53.717056
39878	151	3	7	7	0	0	2017	7	2017-01-02 04:46:59.327423	2017-01-02 04:46:59.327423
6974	192	7	7	7	0	0	2016	7	2015-12-29 09:52:53.745378	2015-12-29 09:52:53.745378
6975	192	8	5	5	0	0	2016	5	2015-12-29 09:52:53.758957	2015-12-29 09:52:53.758957
6976	192	9	0	0	0	0	2016	0	2015-12-29 09:52:53.78374	2015-12-29 09:52:53.78374
6977	183	1	5	5	0	0	2016	5	2015-12-29 09:52:53.79737	2015-12-29 09:52:53.79737
6978	183	2	15	15	0	0	2016	15	2015-12-29 09:52:53.810992	2015-12-29 09:52:53.810992
6979	183	3	7	7	0	0	2016	7	2015-12-29 09:52:53.825623	2015-12-29 09:52:53.825623
6980	183	4	7	7	0	0	2016	7	2015-12-29 09:52:53.839275	2015-12-29 09:52:53.839275
6981	183	5	5	5	0	0	2016	5	2015-12-29 09:52:53.852949	2015-12-29 09:52:53.852949
6983	183	7	7	7	0	0	2016	7	2015-12-29 09:52:53.881211	2015-12-29 09:52:53.881211
6984	183	8	5	5	0	0	2016	5	2015-12-29 09:52:53.89485	2015-12-29 09:52:53.89485
6985	183	9	0	0	0	0	2016	0	2015-12-29 09:52:53.919976	2015-12-29 09:52:53.919976
6986	200	1	5	5	0	0	2016	5	2015-12-29 09:52:53.94373	2015-12-29 09:52:53.94373
6987	200	2	15	15	0	0	2016	15	2015-12-29 09:52:53.967136	2015-12-29 09:52:53.967136
6988	200	3	7	7	0	0	2016	7	2015-12-29 09:52:53.981683	2015-12-29 09:52:53.981683
6989	200	4	7	7	0	0	2016	7	2015-12-29 09:52:54.005787	2015-12-29 09:52:54.005787
6990	200	5	5	5	0	0	2016	5	2015-12-29 09:52:54.019109	2015-12-29 09:52:54.019109
6992	200	7	7	7	0	0	2016	7	2015-12-29 09:52:54.047413	2015-12-29 09:52:54.047413
6993	200	8	5	5	0	0	2016	5	2015-12-29 09:52:54.061062	2015-12-29 09:52:54.061062
6994	200	9	0	0	0	0	2016	0	2015-12-29 09:52:54.075703	2015-12-29 09:52:54.075703
6995	204	1	5	5	0	0	2016	5	2015-12-29 09:52:54.089353	2015-12-29 09:52:54.089353
6996	204	2	15	15	0	0	2016	15	2015-12-29 09:52:54.114051	2015-12-29 09:52:54.114051
6997	204	3	7	7	0	0	2016	7	2015-12-29 09:52:54.138166	2015-12-29 09:52:54.138166
6998	204	4	7	7	0	0	2016	7	2015-12-29 09:52:54.151459	2015-12-29 09:52:54.151459
6999	204	5	5	5	0	0	2016	5	2015-12-29 09:52:54.166089	2015-12-29 09:52:54.166089
7001	204	7	7	7	0	0	2016	7	2015-12-29 09:52:54.193412	2015-12-29 09:52:54.193412
7002	204	8	5	5	0	0	2016	5	2015-12-29 09:52:54.208061	2015-12-29 09:52:54.208061
7003	204	9	0	0	0	0	2016	0	2015-12-29 09:52:54.221696	2015-12-29 09:52:54.221696
7004	191	1	5	5	0	0	2016	5	2015-12-29 09:52:54.235323	2015-12-29 09:52:54.235323
7005	191	2	15	15	0	0	2016	15	2015-12-29 09:52:54.249966	2015-12-29 09:52:54.249966
7006	191	3	7	7	0	0	2016	7	2015-12-29 09:52:54.263639	2015-12-29 09:52:54.263639
7007	191	4	7	7	0	0	2016	7	2015-12-29 09:52:54.277336	2015-12-29 09:52:54.277336
7008	191	5	5	5	0	0	2016	5	2015-12-29 09:52:54.291893	2015-12-29 09:52:54.291893
7010	191	7	7	7	0	0	2016	7	2015-12-29 09:52:54.319183	2015-12-29 09:52:54.319183
7011	191	8	5	5	0	0	2016	5	2015-12-29 09:52:54.333814	2015-12-29 09:52:54.333814
7012	191	9	0	0	0	0	2016	0	2015-12-29 09:52:54.347486	2015-12-29 09:52:54.347486
7013	180	1	5	5	0	0	2016	5	2015-12-29 09:52:54.361136	2015-12-29 09:52:54.361136
7014	180	2	15	15	0	0	2016	15	2015-12-29 09:52:54.385916	2015-12-29 09:52:54.385916
7015	180	3	7	7	0	0	2016	7	2015-12-29 09:52:54.399498	2015-12-29 09:52:54.399498
7016	180	4	7	7	0	0	2016	7	2015-12-29 09:52:54.414136	2015-12-29 09:52:54.414136
7017	180	5	5	5	0	0	2016	5	2015-12-29 09:52:54.427958	2015-12-29 09:52:54.427958
7018	180	6	84	84	0	0	2016	84	2015-12-29 09:52:54.441452	2015-12-29 09:52:54.441452
7019	180	7	7	7	0	0	2016	7	2015-12-29 09:52:54.456108	2015-12-29 09:52:54.456108
7020	180	8	5	5	0	0	2016	5	2015-12-29 09:52:54.469735	2015-12-29 09:52:54.469735
7021	180	9	0	0	0	0	2016	0	2015-12-29 09:52:54.483356	2015-12-29 09:52:54.483356
7023	188	2	15	15	0	0	2016	15	2015-12-29 09:52:54.511697	2015-12-29 09:52:54.511697
7024	188	3	7	7	0	0	2016	7	2015-12-29 09:52:54.525324	2015-12-29 09:52:54.525324
7025	188	4	7	7	0	0	2016	7	2015-12-29 09:52:54.539997	2015-12-29 09:52:54.539997
7028	188	7	7	7	0	0	2016	7	2015-12-29 09:52:54.592844	2015-12-29 09:52:54.592844
7029	188	8	5	5	0	0	2016	5	2015-12-29 09:52:54.619255	2015-12-29 09:52:54.619255
7030	188	9	0	0	0	0	2016	0	2015-12-29 09:52:54.633881	2015-12-29 09:52:54.633881
7031	190	1	5	5	0	0	2016	5	2015-12-29 09:52:54.647592	2015-12-29 09:52:54.647592
7032	190	2	15	15	0	0	2016	15	2015-12-29 09:52:54.662193	2015-12-29 09:52:54.662193
7033	190	3	7	7	0	0	2016	7	2015-12-29 09:52:54.675891	2015-12-29 09:52:54.675891
7034	190	4	7	7	0	0	2016	7	2015-12-29 09:52:54.689484	2015-12-29 09:52:54.689484
7035	190	5	5	5	0	0	2016	5	2015-12-29 09:52:54.70416	2015-12-29 09:52:54.70416
7037	190	7	7	7	0	0	2016	7	2015-12-29 09:52:54.731413	2015-12-29 09:52:54.731413
7038	190	8	5	5	0	0	2016	5	2015-12-29 09:52:54.746042	2015-12-29 09:52:54.746042
7039	190	9	0	0	0	0	2016	0	2015-12-29 09:52:54.759729	2015-12-29 09:52:54.759729
6982	183	6	84	0	0	0	2016	0	2015-12-29 09:52:53.867605	2015-12-29 09:53:13.695041
6991	200	6	84	0	0	0	2016	0	2015-12-29 09:52:54.033747	2015-12-29 09:53:13.722934
7000	204	6	84	0	0	0	2016	0	2015-12-29 09:52:54.179795	2015-12-29 09:53:13.761985
7009	191	6	84	0	0	0	2016	0	2015-12-29 09:52:54.305556	2015-12-29 09:53:13.800962
7027	188	6	84	0	0	0	2016	0	2015-12-29 09:52:54.567212	2015-12-29 09:53:13.829719
7036	190	6	84	0	0	0	2016	0	2015-12-29 09:52:54.717777	2015-12-29 09:53:13.857538
7026	188	5	5	4.5	0.5	0	2016	5	2015-12-29 09:52:54.553583	2016-01-08 08:19:01.710833
7022	188	1	5	4	1	0	2016	5	2015-12-29 09:52:54.497996	2016-01-27 11:57:05.02849
7043	198	4	7	7	0	0	2016	7	2015-12-29 09:52:54.815263	2015-12-29 09:52:54.815263
7044	198	5	5	5	0	0	2016	5	2015-12-29 09:52:54.829908	2015-12-29 09:52:54.829908
39879	151	4	7	7	0	0	2017	7	2017-01-02 04:46:59.337444	2017-01-02 04:46:59.337444
7046	198	7	7	7	0	0	2016	7	2015-12-29 09:52:54.857212	2015-12-29 09:52:54.857212
7048	198	9	0	0	0	0	2016	0	2015-12-29 09:52:54.88554	2015-12-29 09:52:54.88554
7051	187	3	7	7	0	0	2016	7	2015-12-29 09:52:54.927445	2015-12-29 09:52:54.927445
7052	187	4	7	7	0	0	2016	7	2015-12-29 09:52:54.942043	2015-12-29 09:52:54.942043
7055	187	7	7	7	0	0	2016	7	2015-12-29 09:52:54.984039	2015-12-29 09:52:54.984039
7057	187	9	0	0	0	0	2016	0	2015-12-29 09:52:55.011287	2015-12-29 09:52:55.011287
7058	184	1	5	5	0	0	2016	5	2015-12-29 09:52:55.025901	2015-12-29 09:52:55.025901
7059	184	2	15	15	0	0	2016	15	2015-12-29 09:52:55.03963	2015-12-29 09:52:55.03963
7060	184	3	7	7	0	0	2016	7	2015-12-29 09:52:55.053239	2015-12-29 09:52:55.053239
7061	184	4	7	7	0	0	2016	7	2015-12-29 09:52:55.06791	2015-12-29 09:52:55.06791
7062	184	5	5	5	0	0	2016	5	2015-12-29 09:52:55.081516	2015-12-29 09:52:55.081516
7064	184	7	7	7	0	0	2016	7	2015-12-29 09:52:55.109766	2015-12-29 09:52:55.109766
7065	184	8	5	5	0	0	2016	5	2015-12-29 09:52:55.123441	2015-12-29 09:52:55.123441
7066	184	9	0	0	0	0	2016	0	2015-12-29 09:52:55.137079	2015-12-29 09:52:55.137079
7067	175	1	5	5	0	0	2016	5	2015-12-29 09:52:55.152819	2015-12-29 09:52:55.152819
7068	175	2	15	15	0	0	2016	15	2015-12-29 09:52:55.166315	2015-12-29 09:52:55.166315
7069	175	3	7	7	0	0	2016	7	2015-12-29 09:52:55.179877	2015-12-29 09:52:55.179877
7070	175	4	7	7	0	0	2016	7	2015-12-29 09:52:55.19431	2015-12-29 09:52:55.19431
7071	175	5	5	5	0	0	2016	5	2015-12-29 09:52:55.20787	2015-12-29 09:52:55.20787
7073	175	7	7	7	0	0	2016	7	2015-12-29 09:52:55.246143	2015-12-29 09:52:55.246143
7074	175	8	5	5	0	0	2016	5	2015-12-29 09:52:55.259742	2015-12-29 09:52:55.259742
7075	175	9	0	0	0	0	2016	0	2015-12-29 09:52:55.273153	2015-12-29 09:52:55.273153
7078	196	3	7	7	0	0	2016	7	2015-12-29 09:52:55.324849	2015-12-29 09:52:55.324849
7079	196	4	7	7	0	0	2016	7	2015-12-29 09:52:55.339271	2015-12-29 09:52:55.339271
7082	196	7	7	7	0	0	2016	7	2015-12-29 09:52:55.390741	2015-12-29 09:52:55.390741
7084	196	9	0	0	0	0	2016	0	2015-12-29 09:52:55.428833	2015-12-29 09:52:55.428833
7085	181	1	5	5	0	0	2016	5	2015-12-29 09:52:55.442339	2015-12-29 09:52:55.442339
7086	181	2	15	15	0	0	2016	15	2015-12-29 09:52:55.456271	2015-12-29 09:52:55.456271
7087	181	3	7	7	0	0	2016	7	2015-12-29 09:52:55.470533	2015-12-29 09:52:55.470533
7088	181	4	7	7	0	0	2016	7	2015-12-29 09:52:55.484029	2015-12-29 09:52:55.484029
7089	181	5	5	5	0	0	2016	5	2015-12-29 09:52:55.497398	2015-12-29 09:52:55.497398
7091	181	7	7	7	0	0	2016	7	2015-12-29 09:52:55.525429	2015-12-29 09:52:55.525429
7092	181	8	5	5	0	0	2016	5	2015-12-29 09:52:55.549113	2015-12-29 09:52:55.549113
7093	181	9	0	0	0	0	2016	0	2015-12-29 09:52:55.563495	2015-12-29 09:52:55.563495
7094	199	1	5	5	0	0	2016	5	2015-12-29 09:52:55.577328	2015-12-29 09:52:55.577328
7095	199	2	15	15	0	0	2016	15	2015-12-29 09:52:55.5907	2015-12-29 09:52:55.5907
7096	199	3	7	7	0	0	2016	7	2015-12-29 09:52:55.605192	2015-12-29 09:52:55.605192
7097	199	4	7	7	0	0	2016	7	2015-12-29 09:52:55.618677	2015-12-29 09:52:55.618677
7098	199	5	5	5	0	0	2016	5	2015-12-29 09:52:55.632288	2015-12-29 09:52:55.632288
7100	199	7	7	7	0	0	2016	7	2015-12-29 09:52:55.66027	2015-12-29 09:52:55.66027
7101	199	8	5	5	0	0	2016	5	2015-12-29 09:52:55.673724	2015-12-29 09:52:55.673724
7102	199	9	0	0	0	0	2016	0	2015-12-29 09:52:55.688288	2015-12-29 09:52:55.688288
7103	170	1	5	5	0	0	2016	5	2015-12-29 09:52:55.701774	2015-12-29 09:52:55.701774
7104	170	2	15	15	0	0	2016	15	2015-12-29 09:52:55.71522	2015-12-29 09:52:55.71522
7105	170	3	7	7	0	0	2016	7	2015-12-29 09:52:55.729724	2015-12-29 09:52:55.729724
7106	170	4	7	7	0	0	2016	7	2015-12-29 09:52:55.743272	2015-12-29 09:52:55.743272
7107	170	5	5	5	0	0	2016	5	2015-12-29 09:52:55.756769	2015-12-29 09:52:55.756769
7109	170	7	7	7	0	0	2016	7	2015-12-29 09:52:55.785065	2015-12-29 09:52:55.785065
7110	170	8	5	5	0	0	2016	5	2015-12-29 09:52:55.798556	2015-12-29 09:52:55.798556
7111	170	9	0	0	0	0	2016	0	2015-12-29 09:52:55.81282	2015-12-29 09:52:55.81282
7112	202	1	5	5	0	0	2016	5	2015-12-29 09:52:55.826294	2015-12-29 09:52:55.826294
7113	202	2	15	15	0	0	2016	15	2015-12-29 09:52:55.839858	2015-12-29 09:52:55.839858
7114	202	3	7	7	0	0	2016	7	2015-12-29 09:52:55.854303	2015-12-29 09:52:55.854303
7054	187	6	84	0	0	0	2016	0	2015-12-29 09:52:54.969357	2015-12-29 09:53:13.925444
7063	184	6	84	0	0	0	2016	0	2015-12-29 09:52:55.095174	2015-12-29 09:53:13.95434
7072	175	6	84	0	0	0	2016	0	2015-12-29 09:52:55.222326	2015-12-29 09:53:13.982207
7081	196	6	84	0	0	0	2016	0	2015-12-29 09:52:55.377395	2015-12-29 09:53:14.011083
7090	181	6	84	0	0	0	2016	0	2015-12-29 09:52:55.511961	2015-12-29 09:53:14.040034
7099	199	6	84	0	0	0	2016	0	2015-12-29 09:52:55.646715	2015-12-29 09:53:14.078948
7108	170	6	84	0	0	0	2016	0	2015-12-29 09:52:55.77126	2015-12-29 09:53:14.1069
7083	196	8	5	2	3	0	2016	5	2015-12-29 09:52:55.414395	2016-10-12 14:05:46.836867
7041	198	2	15	0	15	0	2016	15	2015-12-29 09:52:54.78807	2016-12-23 12:45:07.60897
7053	187	5	5	0	5	0	2016	5	2015-12-29 09:52:54.955728	2016-11-15 14:24:47.748479
7056	187	8	5	0	5	0	2016	5	2015-12-29 09:52:54.997656	2016-03-30 12:50:53.460168
7080	196	5	5	3	2	0	2016	5	2015-12-29 09:52:55.36294	2016-12-08 12:44:29.526849
7040	198	1	5	2	3	0	2016	5	2015-12-29 09:52:54.77337	2016-10-17 13:57:05.057335
7047	198	8	5	3	2	0	2016	5	2015-12-29 09:52:54.871849	2016-12-23 12:44:42.344207
7042	198	3	7	6	1	0	2016	7	2015-12-29 09:52:54.801624	2016-07-26 08:11:49.006177
7050	187	2	15	0	15	0	2016	15	2015-12-29 09:52:54.91377	2016-10-31 07:23:06.755221
7049	187	1	5	0	5	0	2016	5	2015-12-29 09:52:54.899151	2016-11-15 14:23:43.867614
7076	196	1	5	0	5	0	2016	5	2015-12-29 09:52:55.287697	2016-12-27 05:19:14.220598
7115	202	4	7	7	0	0	2016	7	2015-12-29 09:52:55.86769	2015-12-29 09:52:55.86769
7116	202	5	5	5	0	0	2016	5	2015-12-29 09:52:55.881157	2015-12-29 09:52:55.881157
7118	202	7	7	7	0	0	2016	7	2015-12-29 09:52:55.909203	2015-12-29 09:52:55.909203
7119	202	8	5	5	0	0	2016	5	2015-12-29 09:52:55.922741	2015-12-29 09:52:55.922741
7120	202	9	0	0	0	0	2016	0	2015-12-29 09:52:55.937195	2015-12-29 09:52:55.937195
7121	193	1	5	5	0	0	2016	5	2015-12-29 09:52:55.950706	2015-12-29 09:52:55.950706
7122	193	2	15	15	0	0	2016	15	2015-12-29 09:52:55.964232	2015-12-29 09:52:55.964232
7123	193	3	7	7	0	0	2016	7	2015-12-29 09:52:55.978692	2015-12-29 09:52:55.978692
7124	193	4	7	7	0	0	2016	7	2015-12-29 09:52:55.992278	2015-12-29 09:52:55.992278
7125	193	5	5	5	0	0	2016	5	2015-12-29 09:52:56.00573	2015-12-29 09:52:56.00573
7126	193	6	84	84	0	0	2016	84	2015-12-29 09:52:56.020248	2015-12-29 09:52:56.020248
7127	193	7	7	7	0	0	2016	7	2015-12-29 09:52:56.033734	2015-12-29 09:52:56.033734
7128	193	8	5	5	0	0	2016	5	2015-12-29 09:52:56.047264	2015-12-29 09:52:56.047264
7129	193	9	0	0	0	0	2016	0	2015-12-29 09:52:56.061747	2015-12-29 09:52:56.061747
7130	194	1	5	5	0	0	2016	5	2015-12-29 09:52:56.075254	2015-12-29 09:52:56.075254
7131	194	2	15	15	0	0	2016	15	2015-12-29 09:52:56.088771	2015-12-29 09:52:56.088771
7132	194	3	7	7	0	0	2016	7	2015-12-29 09:52:56.103276	2015-12-29 09:52:56.103276
7133	194	4	7	7	0	0	2016	7	2015-12-29 09:52:56.116775	2015-12-29 09:52:56.116775
7134	194	5	5	5	0	0	2016	5	2015-12-29 09:52:56.130281	2015-12-29 09:52:56.130281
7135	194	6	84	84	0	0	2016	84	2015-12-29 09:52:56.144785	2015-12-29 09:52:56.144785
7137	194	8	5	5	0	0	2016	5	2015-12-29 09:52:56.171875	2015-12-29 09:52:56.171875
7138	194	9	0	0	0	0	2016	0	2015-12-29 09:52:56.186291	2015-12-29 09:52:56.186291
7139	189	1	5	5	0	0	2016	5	2015-12-29 09:52:56.199888	2015-12-29 09:52:56.199888
7140	189	2	15	15	0	0	2016	15	2015-12-29 09:52:56.213346	2015-12-29 09:52:56.213346
7141	189	3	7	7	0	0	2016	7	2015-12-29 09:52:56.227846	2015-12-29 09:52:56.227846
7142	189	4	7	7	0	0	2016	7	2015-12-29 09:52:56.251497	2015-12-29 09:52:56.251497
7143	189	5	5	5	0	0	2016	5	2015-12-29 09:52:56.264974	2015-12-29 09:52:56.264974
7145	189	7	7	7	0	0	2016	7	2015-12-29 09:52:56.292978	2015-12-29 09:52:56.292978
7146	189	8	5	5	0	0	2016	5	2015-12-29 09:52:56.306458	2015-12-29 09:52:56.306458
7147	189	9	0	0	0	0	2016	0	2015-12-29 09:52:56.321044	2015-12-29 09:52:56.321044
7148	203	1	5	5	0	0	2016	5	2015-12-29 09:52:56.334493	2015-12-29 09:52:56.334493
7149	203	2	15	15	0	0	2016	15	2015-12-29 09:52:56.348051	2015-12-29 09:52:56.348051
7150	203	3	7	7	0	0	2016	7	2015-12-29 09:52:56.362761	2015-12-29 09:52:56.362761
7151	203	4	7	7	0	0	2016	7	2015-12-29 09:52:56.376066	2015-12-29 09:52:56.376066
7152	203	5	5	5	0	0	2016	5	2015-12-29 09:52:56.390305	2015-12-29 09:52:56.390305
7154	203	7	7	7	0	0	2016	7	2015-12-29 09:52:56.417541	2015-12-29 09:52:56.417541
7155	203	8	5	5	0	0	2016	5	2015-12-29 09:52:56.431034	2015-12-29 09:52:56.431034
7156	203	9	0	0	0	0	2016	0	2015-12-29 09:52:56.445531	2015-12-29 09:52:56.445531
7157	206	1	5	5	0	0	2016	5	2015-12-29 09:52:56.45904	2015-12-29 09:52:56.45904
7158	206	2	15	15	0	0	2016	15	2015-12-29 09:52:56.472563	2015-12-29 09:52:56.472563
7159	206	3	7	7	0	0	2016	7	2015-12-29 09:52:56.487066	2015-12-29 09:52:56.487066
7160	206	4	7	7	0	0	2016	7	2015-12-29 09:52:56.50059	2015-12-29 09:52:56.50059
7161	206	5	5	5	0	0	2016	5	2015-12-29 09:52:56.514095	2015-12-29 09:52:56.514095
7163	206	7	7	7	0	0	2016	7	2015-12-29 09:52:56.542094	2015-12-29 09:52:56.542094
7164	206	8	5	5	0	0	2016	5	2015-12-29 09:52:56.556595	2015-12-29 09:52:56.556595
7165	206	9	0	0	0	0	2016	0	2015-12-29 09:52:56.570127	2015-12-29 09:52:56.570127
7169	178	4	7	7	0	0	2016	7	2015-12-29 09:52:56.625166	2015-12-29 09:52:56.625166
7172	178	7	7	7	0	0	2016	7	2015-12-29 09:52:56.666652	2015-12-29 09:52:56.666652
7175	107	1	5	5	0	0	2016	5	2015-12-29 09:52:56.708183	2015-12-29 09:52:56.708183
7176	107	2	15	15	0	0	2016	15	2015-12-29 09:52:56.722699	2015-12-29 09:52:56.722699
7177	107	3	7	7	0	0	2016	7	2015-12-29 09:52:56.736233	2015-12-29 09:52:56.736233
7178	107	4	7	7	0	0	2016	7	2015-12-29 09:52:56.749702	2015-12-29 09:52:56.749702
7179	107	5	5	5	0	0	2016	5	2015-12-29 09:52:56.764228	2015-12-29 09:52:56.764228
7181	107	7	7	7	0	0	2016	7	2015-12-29 09:52:56.791225	2015-12-29 09:52:56.791225
7182	107	8	5	5	0	0	2016	5	2015-12-29 09:52:56.805746	2015-12-29 09:52:56.805746
7183	107	9	0	0	0	0	2016	0	2015-12-29 09:52:56.819253	2015-12-29 09:52:56.819253
7185	197	2	15	15	0	0	2016	15	2015-12-29 09:52:56.868405	2015-12-29 09:52:56.868405
7186	197	3	7	7	0	0	2016	7	2015-12-29 09:52:56.901454	2015-12-29 09:52:56.901454
7187	197	4	7	7	0	0	2016	7	2015-12-29 09:52:56.914834	2015-12-29 09:52:56.914834
7188	197	5	5	5	0	0	2016	5	2015-12-29 09:52:56.929537	2015-12-29 09:52:56.929537
7117	202	6	84	0	0	0	2016	0	2015-12-29 09:52:55.895704	2015-12-29 09:53:14.135821
7144	189	6	84	0	0	0	2016	0	2015-12-29 09:52:56.279455	2015-12-29 09:53:14.174772
7153	203	6	84	0	0	0	2016	0	2015-12-29 09:52:56.404052	2015-12-29 09:53:14.203645
7162	206	6	84	0	0	0	2016	0	2015-12-29 09:52:56.528592	2015-12-29 09:53:14.242592
7171	178	6	84	0	0	0	2016	0	2015-12-29 09:52:56.653173	2015-12-29 09:53:14.285437
7180	107	6	84	0	0	0	2016	0	2015-12-29 09:52:56.777732	2015-12-29 09:53:14.328246
7189	197	6	84	0	0	0	2016	0	2015-12-29 09:52:56.94285	2015-12-29 09:53:14.357104
7168	178	3	7	5	2	0	2016	7	2015-12-29 09:52:56.611687	2016-08-03 05:20:45.13504
7166	178	1	5	0	5	0	2016	5	2015-12-29 09:52:56.583685	2016-12-29 12:36:31.13179
7170	178	5	5	0	5	0	2016	5	2015-12-29 09:52:56.639689	2016-12-30 08:09:26.25871
7184	197	1	5	0	5	0	2016	5	2015-12-29 09:52:56.853085	2016-06-01 13:52:39.941928
7167	178	2	15	0	15	0	2016	15	2015-12-29 09:52:56.598122	2016-11-29 17:18:57.256904
7174	178	9	2	0	2	0	2016	2	2015-12-29 09:52:56.695129	2016-04-13 10:40:20.994835
7173	178	8	5	0	5	0	2016	5	2015-12-29 09:52:56.681201	2016-12-23 08:56:33.515503
7190	197	7	7	7	0	0	2016	7	2015-12-29 09:52:56.956367	2015-12-29 09:52:56.956367
39880	151	5	5	5	0	0	2017	5	2017-01-02 04:46:59.347462	2017-01-02 04:46:59.347462
7192	197	9	0	0	0	0	2016	0	2015-12-29 09:52:57.004617	2015-12-29 09:52:57.004617
7193	195	1	5	5	0	0	2016	5	2015-12-29 09:52:57.018077	2015-12-29 09:52:57.018077
7194	195	2	15	15	0	0	2016	15	2015-12-29 09:52:57.042661	2015-12-29 09:52:57.042661
7195	195	3	7	7	0	0	2016	7	2015-12-29 09:52:57.05621	2015-12-29 09:52:57.05621
7196	195	4	7	7	0	0	2016	7	2015-12-29 09:52:57.069692	2015-12-29 09:52:57.069692
7197	195	5	5	5	0	0	2016	5	2015-12-29 09:52:57.084074	2015-12-29 09:52:57.084074
7199	195	7	7	7	0	0	2016	7	2015-12-29 09:52:57.111047	2015-12-29 09:52:57.111047
7200	195	8	5	5	0	0	2016	5	2015-12-29 09:52:57.12556	2015-12-29 09:52:57.12556
7201	195	9	0	0	0	0	2016	0	2015-12-29 09:52:57.139082	2015-12-29 09:52:57.139082
7204	201	3	7	7	0	0	2016	7	2015-12-29 09:52:57.18062	2015-12-29 09:52:57.18062
7205	201	4	7	7	0	0	2016	7	2015-12-29 09:52:57.194119	2015-12-29 09:52:57.194119
7207	201	6	84	84	0	0	2016	84	2015-12-29 09:52:57.232652	2015-12-29 09:52:57.232652
7210	201	9	0	0	0	0	2016	0	2015-12-29 09:52:57.274159	2015-12-29 09:52:57.274159
7211	205	1	5	5	0	0	2016	5	2015-12-29 09:52:57.287297	2015-12-29 09:52:57.287297
7212	205	2	15	15	0	0	2016	15	2015-12-29 09:52:57.301911	2015-12-29 09:52:57.301911
7213	205	3	7	7	0	0	2016	7	2015-12-29 09:52:57.315435	2015-12-29 09:52:57.315435
7214	205	4	7	7	0	0	2016	7	2015-12-29 09:52:57.32896	2015-12-29 09:52:57.32896
7215	205	5	5	5	0	0	2016	5	2015-12-29 09:52:57.343489	2015-12-29 09:52:57.343489
7216	205	6	84	84	0	0	2016	84	2015-12-29 09:52:57.356973	2015-12-29 09:52:57.356973
7217	205	7	7	7	0	0	2016	7	2015-12-29 09:52:57.370449	2015-12-29 09:52:57.370449
7218	205	8	5	5	0	0	2016	5	2015-12-29 09:52:57.384962	2015-12-29 09:52:57.384962
7219	205	9	0	0	0	0	2016	0	2015-12-29 09:52:57.398369	2015-12-29 09:52:57.398369
7220	179	1	5	5	0	0	2016	5	2015-12-29 09:52:57.411845	2015-12-29 09:52:57.411845
7221	179	2	15	15	0	0	2016	15	2015-12-29 09:52:57.426301	2015-12-29 09:52:57.426301
7222	179	3	7	7	0	0	2016	7	2015-12-29 09:52:57.439881	2015-12-29 09:52:57.439881
7223	179	4	7	7	0	0	2016	7	2015-12-29 09:52:57.453669	2015-12-29 09:52:57.453669
7224	179	5	5	5	0	0	2016	5	2015-12-29 09:52:57.468067	2015-12-29 09:52:57.468067
7226	179	7	7	7	0	0	2016	7	2015-12-29 09:52:57.494998	2015-12-29 09:52:57.494998
7227	179	8	5	5	0	0	2016	5	2015-12-29 09:52:57.509524	2015-12-29 09:52:57.509524
7228	179	9	0	0	0	0	2016	0	2015-12-29 09:52:57.523052	2015-12-29 09:52:57.523052
7231	185	3	7	7	0	0	2016	7	2015-12-29 09:52:57.574682	2015-12-29 09:52:57.574682
7232	185	4	7	7	0	0	2016	7	2015-12-29 09:52:57.588032	2015-12-29 09:52:57.588032
7233	185	5	5	5	0	0	2016	5	2015-12-29 09:52:57.602477	2015-12-29 09:52:57.602477
7235	185	7	7	7	0	0	2016	7	2015-12-29 09:52:57.629511	2015-12-29 09:52:57.629511
7237	185	9	0	0	0	0	2016	0	2015-12-29 09:52:57.657546	2015-12-29 09:52:57.657546
7238	224	1	5	5	0	0	2016	5	2015-12-29 09:52:57.671099	2015-12-29 09:52:57.671099
7239	224	2	15	15	0	0	2016	15	2015-12-29 09:52:57.685541	2015-12-29 09:52:57.685541
7240	224	3	7	7	0	0	2016	7	2015-12-29 09:52:57.699053	2015-12-29 09:52:57.699053
7241	224	4	7	7	0	0	2016	7	2015-12-29 09:52:57.712552	2015-12-29 09:52:57.712552
7242	224	5	5	5	0	0	2016	5	2015-12-29 09:52:57.727055	2015-12-29 09:52:57.727055
7244	224	7	7	7	0	0	2016	7	2015-12-29 09:52:57.754085	2015-12-29 09:52:57.754085
7245	224	8	5	5	0	0	2016	5	2015-12-29 09:52:57.768583	2015-12-29 09:52:57.768583
7246	224	9	0	0	0	0	2016	0	2015-12-29 09:52:57.79231	2015-12-29 09:52:57.79231
7249	210	3	7	7	0	0	2016	7	2015-12-29 09:52:57.843947	2015-12-29 09:52:57.843947
7250	210	4	7	7	0	0	2016	7	2015-12-29 09:52:57.858363	2015-12-29 09:52:57.858363
7253	210	7	7	7	0	0	2016	7	2015-12-29 09:52:57.986328	2015-12-29 09:52:57.986328
7255	210	9	0	0	0	0	2016	0	2015-12-29 09:52:58.01434	2015-12-29 09:52:58.01434
7256	231	1	5	5	0	0	2016	5	2015-12-29 09:52:58.027912	2015-12-29 09:52:58.027912
7257	231	2	15	15	0	0	2016	15	2015-12-29 09:52:58.042349	2015-12-29 09:52:58.042349
7258	231	3	7	7	0	0	2016	7	2015-12-29 09:52:58.055913	2015-12-29 09:52:58.055913
7259	231	4	7	7	0	0	2016	7	2015-12-29 09:52:58.069385	2015-12-29 09:52:58.069385
7260	231	5	5	5	0	0	2016	5	2015-12-29 09:52:58.083973	2015-12-29 09:52:58.083973
7262	231	7	7	7	0	0	2016	7	2015-12-29 09:52:58.138915	2015-12-29 09:52:58.138915
7263	231	8	5	5	0	0	2016	5	2015-12-29 09:52:58.172691	2015-12-29 09:52:58.172691
7264	231	9	0	0	0	0	2016	0	2015-12-29 09:52:58.187108	2015-12-29 09:52:58.187108
7198	195	6	84	0	0	0	2016	0	2015-12-29 09:52:57.09756	2015-12-29 09:53:14.385027
7225	179	6	84	0	0	0	2016	0	2015-12-29 09:52:57.481534	2015-12-29 09:53:14.413879
7234	185	6	84	0	0	0	2016	0	2015-12-29 09:52:57.616016	2015-12-29 09:53:14.44278
7243	224	6	84	0	0	0	2016	0	2015-12-29 09:52:57.74058	2015-12-29 09:53:14.49189
7252	210	6	84	0	0	0	2016	0	2015-12-29 09:52:57.958568	2015-12-29 09:53:14.519789
7261	231	6	84	0	0	0	2016	0	2015-12-29 09:52:58.110899	2015-12-29 09:53:14.548644
7229	185	1	5	3	2	0	2016	5	2015-12-29 09:52:57.536555	2016-06-07 05:34:19.192851
7203	201	2	15	10	5	0	2016	15	2015-12-29 09:52:57.167162	2016-02-09 13:14:24.526378
7209	201	8	5	3	2	0	2016	5	2015-12-29 09:52:57.260393	2016-01-14 12:59:01.75532
7236	185	8	5	4	1	0	2016	5	2015-12-29 09:52:57.644016	2016-03-21 06:34:34.492626
7230	185	2	15	13	2	0	2016	15	2015-12-29 09:52:57.551018	2016-02-18 06:07:49.734749
7254	210	8	5	4	1	0	2016	5	2015-12-29 09:52:58.00083	2016-12-21 05:41:14.785273
7202	201	1	5	4	1	0	2016	5	2015-12-29 09:52:57.152975	2016-03-17 06:41:05.394907
7206	201	5	5	4	1	0	2016	5	2015-12-29 09:52:57.218715	2016-03-17 06:42:27.851013
7248	210	2	15	4	11	0	2016	15	2015-12-29 09:52:57.820266	2016-12-22 07:35:49.81244
7247	210	1	5	1	4	0	2016	5	2015-12-29 09:52:57.806691	2016-12-21 05:35:18.450524
7251	210	5	5	0.5	4.5	0	2016	5	2015-12-29 09:52:57.871889	2016-12-21 07:08:30.492411
7265	207	1	5	5	0	0	2016	5	2015-12-29 09:52:58.20063	2015-12-29 09:52:58.20063
7266	207	2	15	15	0	0	2016	15	2015-12-29 09:52:58.214121	2015-12-29 09:52:58.214121
7267	207	3	7	7	0	0	2016	7	2015-12-29 09:52:58.228639	2015-12-29 09:52:58.228639
7268	207	4	7	7	0	0	2016	7	2015-12-29 09:52:58.24216	2015-12-29 09:52:58.24216
7269	207	5	5	5	0	0	2016	5	2015-12-29 09:52:58.265819	2015-12-29 09:52:58.265819
7271	207	7	7	7	0	0	2016	7	2015-12-29 09:52:58.293759	2015-12-29 09:52:58.293759
7272	207	8	5	5	0	0	2016	5	2015-12-29 09:52:58.307271	2015-12-29 09:52:58.307271
7273	207	9	0	0	0	0	2016	0	2015-12-29 09:52:58.321838	2015-12-29 09:52:58.321838
7274	208	1	5	5	0	0	2016	5	2015-12-29 09:52:58.335279	2015-12-29 09:52:58.335279
7275	208	2	15	15	0	0	2016	15	2015-12-29 09:52:58.348808	2015-12-29 09:52:58.348808
7276	208	3	7	7	0	0	2016	7	2015-12-29 09:52:58.363595	2015-12-29 09:52:58.363595
7277	208	4	7	7	0	0	2016	7	2015-12-29 09:52:58.376993	2015-12-29 09:52:58.376993
7278	208	5	5	5	0	0	2016	5	2015-12-29 09:52:58.391003	2015-12-29 09:52:58.391003
7280	208	7	7	7	0	0	2016	7	2015-12-29 09:52:58.418343	2015-12-29 09:52:58.418343
7281	208	8	5	5	0	0	2016	5	2015-12-29 09:52:58.432176	2015-12-29 09:52:58.432176
7282	208	9	0	0	0	0	2016	0	2015-12-29 09:52:58.456547	2015-12-29 09:52:58.456547
7285	211	3	7	7	0	0	2016	7	2015-12-29 09:52:58.497998	2015-12-29 09:52:58.497998
7286	211	4	7	7	0	0	2016	7	2015-12-29 09:52:58.511794	2015-12-29 09:52:58.511794
7289	211	7	7	7	0	0	2016	7	2015-12-29 09:52:58.553284	2015-12-29 09:52:58.553284
7292	228	1	5	5	0	0	2016	5	2015-12-29 09:52:58.594804	2015-12-29 09:52:58.594804
7295	228	4	7	7	0	0	2016	7	2015-12-29 09:52:58.636225	2015-12-29 09:52:58.636225
7296	228	5	5	5	0	0	2016	5	2015-12-29 09:52:58.649558	2015-12-29 09:52:58.649558
7298	228	7	7	7	0	0	2016	7	2015-12-29 09:52:58.677568	2015-12-29 09:52:58.677568
7299	228	8	5	5	0	0	2016	5	2015-12-29 09:52:58.701261	2015-12-29 09:52:58.701261
7300	228	9	0	0	0	0	2016	0	2015-12-29 09:52:58.715727	2015-12-29 09:52:58.715727
7304	218	4	7	7	0	0	2016	7	2015-12-29 09:52:58.770703	2015-12-29 09:52:58.770703
7307	218	7	7	7	0	0	2016	7	2015-12-29 09:52:58.812283	2015-12-29 09:52:58.812283
39881	151	6	84	84	0	0	2017	84	2017-01-02 04:46:59.357488	2017-01-02 04:46:59.357488
7312	230	3	7	7	0	0	2016	7	2015-12-29 09:52:58.891924	2015-12-29 09:52:58.891924
7313	230	4	7	7	0	0	2016	7	2015-12-29 09:52:58.905628	2015-12-29 09:52:58.905628
7315	230	6	84	84	0	0	2016	84	2015-12-29 09:52:58.933396	2015-12-29 09:52:58.933396
7318	230	9	0	0	0	0	2016	0	2015-12-29 09:52:58.974891	2015-12-29 09:52:58.974891
7322	221	4	7	7	0	0	2016	7	2015-12-29 09:52:59.121244	2015-12-29 09:52:59.121244
7323	221	5	5	5	0	0	2016	5	2015-12-29 09:52:59.144492	2015-12-29 09:52:59.144492
7325	221	7	7	7	0	0	2016	7	2015-12-29 09:52:59.172526	2015-12-29 09:52:59.172526
7327	221	9	0	0	0	0	2016	0	2015-12-29 09:52:59.200505	2015-12-29 09:52:59.200505
7330	220	3	7	7	0	0	2016	7	2015-12-29 09:52:59.242482	2015-12-29 09:52:59.242482
7331	220	4	7	7	0	0	2016	7	2015-12-29 09:52:59.255592	2015-12-29 09:52:59.255592
7334	220	7	7	7	0	0	2016	7	2015-12-29 09:52:59.297094	2015-12-29 09:52:59.297094
7336	220	9	0	0	0	0	2016	0	2015-12-29 09:52:59.325111	2015-12-29 09:52:59.325111
7337	213	1	5	5	0	0	2016	5	2015-12-29 09:52:59.338556	2015-12-29 09:52:59.338556
7338	213	2	15	15	0	0	2016	15	2015-12-29 09:52:59.353327	2015-12-29 09:52:59.353327
7339	213	3	7	7	0	0	2016	7	2015-12-29 09:52:59.367034	2015-12-29 09:52:59.367034
7270	207	6	84	0	0	0	2016	0	2015-12-29 09:52:58.280252	2015-12-29 09:53:14.577558
7279	208	6	84	0	0	0	2016	0	2015-12-29 09:52:58.405122	2015-12-29 09:53:14.606408
7288	211	6	84	0	0	0	2016	0	2015-12-29 09:52:58.539498	2015-12-29 09:53:14.634288
7297	228	6	84	0	0	0	2016	0	2015-12-29 09:52:58.664049	2015-12-29 09:53:14.673352
7306	218	6	84	0	0	0	2016	0	2015-12-29 09:52:58.798738	2015-12-29 09:53:14.71619
7324	221	6	84	0	0	0	2016	0	2015-12-29 09:52:59.15899	2015-12-29 09:53:14.745011
7333	220	6	84	0	0	0	2016	0	2015-12-29 09:52:59.28364	2015-12-29 09:53:14.784039
7320	221	2	15	2	13	0	2016	15	2015-12-29 09:52:59.001911	2016-12-30 05:41:32.284513
7283	211	1	5	0	5	0	2016	5	2015-12-29 09:52:58.469964	2016-09-26 04:04:39.167805
7335	220	8	5	0	5	0	2016	5	2015-12-29 09:52:59.311552	2016-10-28 13:29:11.673779
7332	220	5	5	0	5	0	2016	5	2015-12-29 09:52:59.270056	2016-12-28 14:12:32.479884
7308	218	8	5	1	4	0	2016	5	2015-12-29 09:52:58.825725	2016-05-14 16:09:49.943521
7290	211	8	5	0	5	0	2016	5	2015-12-29 09:52:58.566511	2016-11-23 04:20:19.002731
7301	218	1	5	1	4	0	2016	5	2015-12-29 09:52:58.729199	2016-07-14 18:53:47.665867
7310	230	1	5	1	4	0	2016	5	2015-12-29 09:52:58.864207	2016-12-28 09:25:32.941539
7305	218	5	5	0	5	0	2016	5	2015-12-29 09:52:58.784212	2016-08-12 08:05:40.364452
7328	220	1	5	0	5	0	2016	5	2015-12-29 09:52:59.214022	2016-11-22 14:31:02.551523
7311	230	2	15	0	15	0	2016	15	2015-12-29 09:52:58.877624	2016-12-26 08:59:01.258516
7302	218	2	15	1	14	0	2016	15	2015-12-29 09:52:58.742676	2016-08-23 15:25:23.024364
7303	218	3	7	6	1	0	2016	7	2015-12-29 09:52:58.757238	2016-06-21 13:50:31.866343
7329	220	2	15	0	15	0	2016	15	2015-12-29 09:52:59.228534	2016-10-28 13:31:57.273039
7284	211	2	15	0	15	0	2016	15	2015-12-29 09:52:58.483763	2016-05-09 04:43:14.976362
7314	230	5	5	0.5	4.5	0	2016	5	2015-12-29 09:52:58.91913	2016-12-26 08:59:31.79646
7321	221	3	7	3	4	0	2016	7	2015-12-29 09:52:59.016398	2016-10-20 03:04:38.802472
7294	228	3	7	2	5	0	2016	7	2015-12-29 09:52:58.622528	2016-03-29 11:51:36.004282
7293	228	2	15	10	5	0	2016	15	2015-12-29 09:52:58.608072	2016-05-10 13:27:44.521166
7287	211	5	5	0	5	0	2016	5	2015-12-29 09:52:58.525308	2016-11-23 04:19:07.207211
7319	221	1	5	3	2	0	2016	5	2015-12-29 09:52:58.988422	2016-06-17 03:30:05.194624
7326	221	8	5	-1	6	0	2016	5	2015-12-29 09:52:59.18601	2016-10-09 04:18:25.371809
7317	230	8	5	0	5	0	2016	5	2015-12-29 09:52:58.960387	2016-09-22 05:48:44.981313
7291	211	9	1	0	1	0	2016	1	2015-12-29 09:52:58.581034	2016-11-23 04:19:40.876375
7340	213	4	7	7	0	0	2016	7	2015-12-29 09:52:59.380464	2015-12-29 09:52:59.380464
7341	213	5	5	5	0	0	2016	5	2015-12-29 09:52:59.394593	2015-12-29 09:52:59.394593
7343	213	7	7	7	0	0	2016	7	2015-12-29 09:52:59.421615	2015-12-29 09:52:59.421615
7344	213	8	5	5	0	0	2016	5	2015-12-29 09:52:59.43616	2015-12-29 09:52:59.43616
7345	213	9	0	0	0	0	2016	0	2015-12-29 09:52:59.449626	2015-12-29 09:52:59.449626
7348	215	3	7	7	0	0	2016	7	2015-12-29 09:52:59.491135	2015-12-29 09:52:59.491135
7349	215	4	7	7	0	0	2016	7	2015-12-29 09:52:59.504661	2015-12-29 09:52:59.504661
7352	215	7	7	7	0	0	2016	7	2015-12-29 09:52:59.556326	2015-12-29 09:52:59.556326
7354	215	9	0	0	0	0	2016	0	2015-12-29 09:52:59.604597	2015-12-29 09:52:59.604597
7355	87	1	5	5	0	0	2016	5	2015-12-29 09:52:59.629521	2015-12-29 09:52:59.629521
7356	87	2	15	15	0	0	2016	15	2015-12-29 09:52:59.656206	2015-12-29 09:52:59.656206
7357	87	3	7	7	0	0	2016	7	2015-12-29 09:52:59.669606	2015-12-29 09:52:59.669606
7358	87	4	7	7	0	0	2016	7	2015-12-29 09:52:59.684149	2015-12-29 09:52:59.684149
7359	87	5	5	5	0	0	2016	5	2015-12-29 09:52:59.697629	2015-12-29 09:52:59.697629
7361	87	7	7	7	0	0	2016	7	2015-12-29 09:52:59.735771	2015-12-29 09:52:59.735771
7362	87	8	5	5	0	0	2016	5	2015-12-29 09:52:59.749277	2015-12-29 09:52:59.749277
7363	87	9	0	0	0	0	2016	0	2015-12-29 09:52:59.762737	2015-12-29 09:52:59.762737
7364	99	1	5	5	0	0	2016	5	2015-12-29 09:52:59.777267	2015-12-29 09:52:59.777267
7365	99	2	15	15	0	0	2016	15	2015-12-29 09:52:59.790771	2015-12-29 09:52:59.790771
7366	99	3	7	7	0	0	2016	7	2015-12-29 09:52:59.804273	2015-12-29 09:52:59.804273
7367	99	4	7	7	0	0	2016	7	2015-12-29 09:52:59.81876	2015-12-29 09:52:59.81876
7368	99	5	5	5	0	0	2016	5	2015-12-29 09:52:59.832295	2015-12-29 09:52:59.832295
7370	99	7	7	7	0	0	2016	7	2015-12-29 09:52:59.870394	2015-12-29 09:52:59.870394
7371	99	8	5	5	0	0	2016	5	2015-12-29 09:52:59.884008	2015-12-29 09:52:59.884008
7372	99	9	0	0	0	0	2016	0	2015-12-29 09:52:59.897442	2015-12-29 09:52:59.897442
7373	214	1	5	5	0	0	2016	5	2015-12-29 09:52:59.911981	2015-12-29 09:52:59.911981
7374	214	2	15	15	0	0	2016	15	2015-12-29 09:52:59.925461	2015-12-29 09:52:59.925461
7375	214	3	7	7	0	0	2016	7	2015-12-29 09:52:59.93892	2015-12-29 09:52:59.93892
7376	214	4	7	7	0	0	2016	7	2015-12-29 09:52:59.953443	2015-12-29 09:52:59.953443
7379	214	7	7	7	0	0	2016	7	2015-12-29 09:52:59.994938	2015-12-29 09:52:59.994938
7381	214	9	0	0	0	0	2016	0	2015-12-29 09:53:00.021988	2015-12-29 09:53:00.021988
7382	216	1	5	5	0	0	2016	5	2015-12-29 09:53:00.036461	2015-12-29 09:53:00.036461
7383	216	2	15	15	0	0	2016	15	2015-12-29 09:53:00.050007	2015-12-29 09:53:00.050007
7384	216	3	7	7	0	0	2016	7	2015-12-29 09:53:00.063496	2015-12-29 09:53:00.063496
7385	216	4	7	7	0	0	2016	7	2015-12-29 09:53:00.07799	2015-12-29 09:53:00.07799
7386	216	5	5	5	0	0	2016	5	2015-12-29 09:53:00.091499	2015-12-29 09:53:00.091499
7388	216	7	7	7	0	0	2016	7	2015-12-29 09:53:00.119497	2015-12-29 09:53:00.119497
7389	216	8	5	5	0	0	2016	5	2015-12-29 09:53:00.13304	2015-12-29 09:53:00.13304
7390	216	9	0	0	0	0	2016	0	2015-12-29 09:53:00.146522	2015-12-29 09:53:00.146522
7393	177	3	7	7	0	0	2016	7	2015-12-29 09:53:00.188089	2015-12-29 09:53:00.188089
7394	177	4	7	7	0	0	2016	7	2015-12-29 09:53:00.202565	2015-12-29 09:53:00.202565
7395	177	5	5	5	0	0	2016	5	2015-12-29 09:53:00.216098	2015-12-29 09:53:00.216098
7397	177	7	7	7	0	0	2016	7	2015-12-29 09:53:00.244068	2015-12-29 09:53:00.244068
7399	177	9	0	0	0	0	2016	0	2015-12-29 09:53:00.271097	2015-12-29 09:53:00.271097
7403	217	4	7	7	0	0	2016	7	2015-12-29 09:53:00.327252	2015-12-29 09:53:00.327252
7406	217	7	7	7	0	0	2016	7	2015-12-29 09:53:00.368646	2015-12-29 09:53:00.368646
7408	217	9	0	0	0	0	2016	0	2015-12-29 09:53:00.395758	2015-12-29 09:53:00.395758
7409	54	1	5	5	0	0	2016	5	2015-12-29 09:53:00.410172	2015-12-29 09:53:00.410172
7410	54	2	15	15	0	0	2016	15	2015-12-29 09:53:00.423769	2015-12-29 09:53:00.423769
7411	54	3	7	7	0	0	2016	7	2015-12-29 09:53:00.438166	2015-12-29 09:53:00.438166
7412	54	4	7	7	0	0	2016	7	2015-12-29 09:53:00.451749	2015-12-29 09:53:00.451749
7413	54	5	5	5	0	0	2016	5	2015-12-29 09:53:00.465241	2015-12-29 09:53:00.465241
7414	54	6	84	84	0	0	2016	84	2015-12-29 09:53:00.479752	2015-12-29 09:53:00.479752
7351	215	6	84	0	0	0	2016	0	2015-12-29 09:52:59.542765	2015-12-29 09:53:14.840753
7360	87	6	84	0	0	0	2016	0	2015-12-29 09:52:59.711128	2015-12-29 09:53:14.869612
7369	99	6	84	0	0	0	2016	0	2015-12-29 09:52:59.845801	2015-12-29 09:53:14.898473
7378	214	6	84	0	0	0	2016	0	2015-12-29 09:52:59.980449	2015-12-29 09:53:14.927359
7387	216	6	84	0	0	0	2016	0	2015-12-29 09:53:00.105036	2015-12-29 09:53:14.95532
7396	177	6	84	0	0	0	2016	0	2015-12-29 09:53:00.229571	2015-12-29 09:53:14.984175
7405	217	6	84	0	0	0	2016	0	2015-12-29 09:53:00.354131	2015-12-29 09:53:15.013044
7380	214	8	5	4	1	0	2016	5	2015-12-29 09:53:00.008489	2016-04-07 11:37:51.70615
7392	177	2	15	5	10	0	2016	15	2015-12-29 09:53:00.174557	2016-12-22 14:30:12.86957
7353	215	8	5	1	4	0	2016	5	2015-12-29 09:52:59.570749	2016-12-27 04:33:26.397371
7391	177	1	5	1	4	0	2016	5	2015-12-29 09:53:00.161041	2016-12-26 05:12:30.402891
7407	217	8	5	0	5	0	2016	5	2015-12-29 09:53:00.382163	2016-09-25 15:48:53.401894
7401	217	2	15	2	13	0	2016	15	2015-12-29 09:53:00.299114	2016-11-04 13:33:39.941941
7346	215	1	5	1	4	0	2016	5	2015-12-29 09:52:59.46312	2016-12-27 04:32:50.904664
7377	214	5	5	3	2	0	2016	5	2015-12-29 09:52:59.966969	2016-04-18 05:16:06.645632
7350	215	5	5	1.5	3.5	0	2016	5	2015-12-29 09:52:59.529254	2016-12-30 07:57:39.102886
7402	217	3	7	1	6	0	2016	7	2015-12-29 09:53:00.312612	2016-09-23 06:19:26.465709
7400	217	1	5	1	4	0	2016	5	2015-12-29 09:53:00.28558	2016-11-30 04:14:37.680263
7404	217	5	5	2.5	2.5	0	2016	5	2015-12-29 09:53:00.340612	2016-11-08 13:21:40.714818
7398	177	8	5	0	5	0	2016	5	2015-12-29 09:53:00.257601	2016-10-28 12:04:08.20265
39883	151	8	5	5	0	0	2017	5	2017-01-02 04:46:59.377538	2017-01-02 04:46:59.377538
7416	54	8	5	5	0	0	2016	5	2015-12-29 09:53:00.506727	2015-12-29 09:53:00.506727
7417	54	9	0	0	0	0	2016	0	2015-12-29 09:53:00.521238	2015-12-29 09:53:00.521238
7418	222	1	5	5	0	0	2016	5	2015-12-29 09:53:00.534767	2015-12-29 09:53:00.534767
7419	222	2	15	15	0	0	2016	15	2015-12-29 09:53:00.548259	2015-12-29 09:53:00.548259
7420	222	3	7	7	0	0	2016	7	2015-12-29 09:53:00.572847	2015-12-29 09:53:00.572847
7421	222	4	7	7	0	0	2016	7	2015-12-29 09:53:00.586362	2015-12-29 09:53:00.586362
7422	222	5	5	5	0	0	2016	5	2015-12-29 09:53:00.610294	2015-12-29 09:53:00.610294
7424	222	7	7	7	0	0	2016	7	2015-12-29 09:53:00.637966	2015-12-29 09:53:00.637966
7425	222	8	5	5	0	0	2016	5	2015-12-29 09:53:00.655557	2015-12-29 09:53:00.655557
7426	222	9	0	0	0	0	2016	0	2015-12-29 09:53:00.676848	2015-12-29 09:53:00.676848
7427	232	1	5	5	0	0	2016	5	2015-12-29 09:53:00.69981	2015-12-29 09:53:00.69981
7428	232	2	15	15	0	0	2016	15	2015-12-29 09:53:00.713291	2015-12-29 09:53:00.713291
7429	232	3	7	7	0	0	2016	7	2015-12-29 09:53:00.727787	2015-12-29 09:53:00.727787
7430	232	4	7	7	0	0	2016	7	2015-12-29 09:53:00.741228	2015-12-29 09:53:00.741228
7431	232	5	5	5	0	0	2016	5	2015-12-29 09:53:00.754712	2015-12-29 09:53:00.754712
7433	232	7	7	7	0	0	2016	7	2015-12-29 09:53:00.792919	2015-12-29 09:53:00.792919
7434	232	8	5	5	0	0	2016	5	2015-12-29 09:53:00.806339	2015-12-29 09:53:00.806339
7435	232	9	0	0	0	0	2016	0	2015-12-29 09:53:00.820828	2015-12-29 09:53:00.820828
7438	209	3	7	7	0	0	2016	7	2015-12-29 09:53:00.892637	2015-12-29 09:53:00.892637
7439	209	4	7	7	0	0	2016	7	2015-12-29 09:53:00.906223	2015-12-29 09:53:00.906223
7441	209	6	84	84	0	0	2016	84	2015-12-29 09:53:00.944275	2015-12-29 09:53:00.944275
7444	209	9	0	0	0	0	2016	0	2015-12-29 09:53:01.016203	2015-12-29 09:53:01.016203
7445	212	1	5	5	0	0	2016	5	2015-12-29 09:53:01.039808	2015-12-29 09:53:01.039808
7447	212	3	7	7	0	0	2016	7	2015-12-29 09:53:01.077882	2015-12-29 09:53:01.077882
7448	212	4	7	7	0	0	2016	7	2015-12-29 09:53:01.091685	2015-12-29 09:53:01.091685
7451	212	7	7	7	0	0	2016	7	2015-12-29 09:53:01.132872	2015-12-29 09:53:01.132872
7453	212	9	0	0	0	0	2016	0	2015-12-29 09:53:01.170987	2015-12-29 09:53:01.170987
7459	226	6	84	84	0	0	2016	84	2015-12-29 09:53:01.254006	2015-12-29 09:53:01.254006
7462	226	9	0	0	0	0	2016	0	2015-12-29 09:53:01.295575	2015-12-29 09:53:01.295575
7466	227	4	7	7	0	0	2016	7	2015-12-29 09:53:01.350572	2015-12-29 09:53:01.350572
7469	227	7	7	7	0	0	2016	7	2015-12-29 09:53:01.392165	2015-12-29 09:53:01.392165
7471	227	9	0	0	0	0	2016	0	2015-12-29 09:53:01.430299	2015-12-29 09:53:01.430299
7472	225	1	5	5	0	0	2016	5	2015-12-29 09:53:01.443775	2015-12-29 09:53:01.443775
7473	225	2	15	15	0	0	2016	15	2015-12-29 09:53:01.45724	2015-12-29 09:53:01.45724
7474	225	3	7	7	0	0	2016	7	2015-12-29 09:53:01.481824	2015-12-29 09:53:01.481824
7475	225	4	7	7	0	0	2016	7	2015-12-29 09:53:01.495319	2015-12-29 09:53:01.495319
7476	225	5	5	5	0	0	2016	5	2015-12-29 09:53:01.508834	2015-12-29 09:53:01.508834
7478	225	7	7	7	0	0	2016	7	2015-12-29 09:53:01.536846	2015-12-29 09:53:01.536846
7479	225	8	5	5	0	0	2016	5	2015-12-29 09:53:01.550362	2015-12-29 09:53:01.550362
7480	225	9	0	0	0	0	2016	0	2015-12-29 09:53:01.564855	2015-12-29 09:53:01.564855
7481	223	1	5	5	0	0	2016	5	2015-12-29 09:53:01.578392	2015-12-29 09:53:01.578392
7482	223	2	15	15	0	0	2016	15	2015-12-29 09:53:01.591954	2015-12-29 09:53:01.591954
7483	223	3	7	7	0	0	2016	7	2015-12-29 09:53:01.606359	2015-12-29 09:53:01.606359
7484	223	4	7	7	0	0	2016	7	2015-12-29 09:53:01.619978	2015-12-29 09:53:01.619978
7485	223	5	5	5	0	0	2016	5	2015-12-29 09:53:01.633428	2015-12-29 09:53:01.633428
7487	223	7	7	7	0	0	2016	7	2015-12-29 09:53:01.661437	2015-12-29 09:53:01.661437
7488	223	8	5	5	0	0	2016	5	2015-12-29 09:53:01.674926	2015-12-29 09:53:01.674926
7489	223	9	0	0	0	0	2016	0	2015-12-29 09:53:01.689449	2015-12-29 09:53:01.689449
7442	209	7	7	0	0	0	2016	0	2015-12-29 09:53:00.968708	2015-12-29 09:53:10.541954
7460	226	7	7	0	0	0	2016	0	2015-12-29 09:53:01.267582	2015-12-29 09:53:10.570798
7423	222	6	84	0	0	0	2016	0	2015-12-29 09:53:00.624487	2015-12-29 09:53:15.041921
7432	232	6	84	0	0	0	2016	0	2015-12-29 09:53:00.769237	2015-12-29 09:53:15.069791
7450	212	6	84	0	0	0	2016	0	2015-12-29 09:53:01.119356	2015-12-29 09:53:15.098691
7468	227	6	84	0	0	0	2016	0	2015-12-29 09:53:01.378998	2015-12-29 09:53:15.127623
7477	225	6	84	0	0	0	2016	0	2015-12-29 09:53:01.523349	2015-12-29 09:53:15.156472
7486	223	6	84	0	0	0	2016	0	2015-12-29 09:53:01.647913	2015-12-29 09:53:15.184624
7458	226	5	5	4.5	0.5	0	2016	5	2015-12-29 09:53:01.239514	2016-03-09 08:54:25.776848
7452	212	8	5	4	1	0	2016	5	2015-12-29 09:53:01.146386	2016-01-19 05:30:46.484564
7436	209	1	5	0	5	0	2016	5	2015-12-29 09:53:00.844507	2016-04-27 03:49:58.512324
7443	209	8	5	0	5	0	2016	5	2015-12-29 09:53:00.991608	2016-05-13 11:53:19.731955
7467	227	5	5	2	3	0	2016	5	2015-12-29 09:53:01.364134	2016-11-29 05:41:05.353557
7464	227	2	15	1	14	0	2016	15	2015-12-29 09:53:01.322605	2016-12-27 05:26:32.558039
7457	226	4	7	5	2	0	2016	7	2015-12-29 09:53:01.226077	2016-04-29 05:14:27.100458
7437	209	2	15	0	15	0	2016	15	2015-12-29 09:53:00.86839	2016-05-30 07:56:15.667344
7449	212	5	5	4	1	0	2016	5	2015-12-29 09:53:01.105196	2016-01-28 13:17:26.628718
7446	212	2	15	10	5	0	2016	15	2015-12-29 09:53:01.053229	2016-03-03 14:03:31.549744
7455	226	2	15	12	3	0	2016	15	2015-12-29 09:53:01.198019	2016-03-01 13:11:50.458624
7461	226	8	5	3	2	0	2016	5	2015-12-29 09:53:01.281097	2016-03-24 11:49:35.377767
7463	227	1	5	1	4	0	2016	5	2015-12-29 09:53:01.309066	2016-11-29 05:41:24.78298
7465	227	3	7	7	0	0	2016	7	2015-12-29 09:53:01.337076	2016-03-28 10:29:30.687677
7456	226	3	7	3	4	0	2016	7	2015-12-29 09:53:01.212541	2016-04-05 04:18:04.858467
7440	209	5	5	0	5	0	2016	5	2015-12-29 09:53:00.919716	2016-07-20 04:21:58.696936
7470	227	8	5	-1	6	0	2016	5	2015-12-29 09:53:01.405671	2016-10-12 05:58:06.50289
7492	219	3	7	7	0	0	2016	7	2015-12-29 09:53:01.73096	2015-12-29 09:53:01.73096
7493	219	4	7	7	0	0	2016	7	2015-12-29 09:53:01.744485	2015-12-29 09:53:01.744485
7494	219	5	5	5	0	0	2016	5	2015-12-29 09:53:01.758962	2015-12-29 09:53:01.758962
7496	219	7	7	7	0	0	2016	7	2015-12-29 09:53:01.785992	2015-12-29 09:53:01.785992
7498	219	9	0	0	0	0	2016	0	2015-12-29 09:53:01.814004	2015-12-29 09:53:01.814004
7499	144	1	5	5	0	0	2016	5	2015-12-29 09:53:01.827515	2015-12-29 09:53:01.827515
7500	144	2	15	15	0	0	2016	15	2015-12-29 09:53:01.841996	2015-12-29 09:53:01.841996
7501	144	3	7	7	0	0	2016	7	2015-12-29 09:53:01.855518	2015-12-29 09:53:01.855518
7502	144	4	7	7	0	0	2016	7	2015-12-29 09:53:01.869046	2015-12-29 09:53:01.869046
7503	144	5	5	5	0	0	2016	5	2015-12-29 09:53:01.883549	2015-12-29 09:53:01.883549
7505	144	7	7	7	0	0	2016	7	2015-12-29 09:53:01.910539	2015-12-29 09:53:01.910539
7506	144	8	5	5	0	0	2016	5	2015-12-29 09:53:01.925142	2015-12-29 09:53:01.925142
7507	144	9	0	0	0	0	2016	0	2015-12-29 09:53:01.938579	2015-12-29 09:53:01.938579
7510	235	3	7	7	0	0	2016	7	2015-12-29 09:53:01.980232	2015-12-29 09:53:01.980232
39884	151	9	0	0	0	0	2017	0	2017-01-02 04:46:59.387574	2017-01-02 04:46:59.387574
7513	235	6	84	84	0	0	2016	84	2015-12-29 09:53:02.021628	2015-12-29 09:53:02.021628
39885	156	1	5	5	0	0	2017	5	2017-01-02 04:46:59.397588	2017-01-02 04:46:59.397588
7516	235	9	0	0	0	0	2016	0	2015-12-29 09:53:02.073452	2015-12-29 09:53:02.073452
7519	237	3	7	7	0	0	2016	7	2015-12-29 09:53:02.114915	2015-12-29 09:53:02.114915
7520	237	4	7	7	0	0	2016	7	2015-12-29 09:53:02.128455	2015-12-29 09:53:02.128455
7522	237	6	84	84	0	0	2016	84	2015-12-29 09:53:02.166424	2015-12-29 09:53:02.166424
7526	243	1	5	5	0	0	2016	5	2015-12-29 09:53:02.221442	2015-12-29 09:53:02.221442
7527	243	2	15	15	0	0	2016	15	2015-12-29 09:53:02.236015	2015-12-29 09:53:02.236015
7528	243	3	7	7	0	0	2016	7	2015-12-29 09:53:02.249429	2015-12-29 09:53:02.249429
7529	243	4	7	7	0	0	2016	7	2015-12-29 09:53:02.2629	2015-12-29 09:53:02.2629
7530	243	5	5	5	0	0	2016	5	2015-12-29 09:53:02.277443	2015-12-29 09:53:02.277443
7531	243	6	84	84	0	0	2016	84	2015-12-29 09:53:02.290946	2015-12-29 09:53:02.290946
7533	243	8	5	5	0	0	2016	5	2015-12-29 09:53:02.320354	2015-12-29 09:53:02.320354
7534	243	9	0	0	0	0	2016	0	2015-12-29 09:53:02.342577	2015-12-29 09:53:02.342577
7535	241	1	5	5	0	0	2016	5	2015-12-29 09:53:02.35609	2015-12-29 09:53:02.35609
7536	241	2	15	15	0	0	2016	15	2015-12-29 09:53:02.370564	2015-12-29 09:53:02.370564
7537	241	3	7	7	0	0	2016	7	2015-12-29 09:53:02.384132	2015-12-29 09:53:02.384132
7538	241	4	7	7	0	0	2016	7	2015-12-29 09:53:02.397616	2015-12-29 09:53:02.397616
7539	241	5	5	5	0	0	2016	5	2015-12-29 09:53:02.412151	2015-12-29 09:53:02.412151
7541	241	7	7	7	0	0	2016	7	2015-12-29 09:53:02.449232	2015-12-29 09:53:02.449232
7542	241	8	5	5	0	0	2016	5	2015-12-29 09:53:02.463714	2015-12-29 09:53:02.463714
7543	241	9	0	0	0	0	2016	0	2015-12-29 09:53:02.477243	2015-12-29 09:53:02.477243
7544	262	1	5	5	0	0	2016	5	2015-12-29 09:53:02.490734	2015-12-29 09:53:02.490734
7545	262	2	15	15	0	0	2016	15	2015-12-29 09:53:02.505839	2015-12-29 09:53:02.505839
7546	262	3	7	7	0	0	2016	7	2015-12-29 09:53:02.529037	2015-12-29 09:53:02.529037
7547	262	4	7	7	0	0	2016	7	2015-12-29 09:53:02.542526	2015-12-29 09:53:02.542526
7548	262	5	5	5	0	0	2016	5	2015-12-29 09:53:02.556942	2015-12-29 09:53:02.556942
7550	262	7	7	7	0	0	2016	7	2015-12-29 09:53:02.583893	2015-12-29 09:53:02.583893
7551	262	8	5	5	0	0	2016	5	2015-12-29 09:53:02.598369	2015-12-29 09:53:02.598369
7552	262	9	0	0	0	0	2016	0	2015-12-29 09:53:02.611945	2015-12-29 09:53:02.611945
7555	245	3	7	7	0	0	2016	7	2015-12-29 09:53:02.653427	2015-12-29 09:53:02.653427
7556	245	4	7	7	0	0	2016	7	2015-12-29 09:53:02.666896	2015-12-29 09:53:02.666896
7559	245	7	7	7	0	0	2016	7	2015-12-29 09:53:02.70843	2015-12-29 09:53:02.70843
7561	245	9	0	0	0	0	2016	0	2015-12-29 09:53:02.73644	2015-12-29 09:53:02.73644
7562	239	1	5	5	0	0	2016	5	2015-12-29 09:53:02.749964	2015-12-29 09:53:02.749964
7563	239	2	15	15	0	0	2016	15	2015-12-29 09:53:02.764445	2015-12-29 09:53:02.764445
7564	239	3	7	7	0	0	2016	7	2015-12-29 09:53:02.777952	2015-12-29 09:53:02.777952
7523	237	7	7	0	0	0	2016	0	2015-12-29 09:53:02.180097	2015-12-29 09:53:10.637668
7532	243	7	7	0	0	0	2016	0	2015-12-29 09:53:02.304437	2015-12-29 09:53:10.676747
7495	219	6	84	0	0	0	2016	0	2015-12-29 09:53:01.772498	2015-12-29 09:53:15.213235
7504	144	6	84	0	0	0	2016	0	2015-12-29 09:53:01.897055	2015-12-29 09:53:15.242185
7540	241	6	84	0	0	0	2016	0	2015-12-29 09:53:02.435856	2015-12-29 09:53:15.270975
7549	262	6	84	0	0	0	2016	0	2015-12-29 09:53:02.570351	2015-12-29 09:53:15.299907
7558	245	6	84	0	0	0	2016	0	2015-12-29 09:53:02.694924	2015-12-29 09:53:15.327808
7560	245	8	5	1	4	0	2016	5	2015-12-29 09:53:02.722924	2016-12-26 04:03:51.474887
7508	235	1	5	4	1	0	2016	5	2015-12-29 09:53:01.952082	2016-01-05 07:26:00.493139
7491	219	2	15	2	13	0	2016	15	2015-12-29 09:53:01.716497	2016-10-05 13:13:30.635406
7497	219	8	5	2	3	0	2016	5	2015-12-29 09:53:01.800578	2016-11-07 09:59:59.082279
7517	237	1	5	0	5	0	2016	5	2015-12-29 09:53:02.087168	2016-06-07 05:23:57.133501
7554	245	2	15	0	15	0	2016	15	2015-12-29 09:53:02.63993	2016-12-03 07:34:35.952861
7509	235	2	15	11	4	0	2016	15	2015-12-29 09:53:01.966568	2016-04-13 05:34:31.977758
7512	235	5	5	1	4	0	2016	5	2015-12-29 09:53:02.008106	2016-04-01 05:33:34.264711
7515	235	8	5	2	3	0	2016	5	2015-12-29 09:53:02.059998	2016-04-04 07:47:46.525815
7518	237	2	15	0	15	0	2016	15	2015-12-29 09:53:02.101434	2016-03-09 06:33:42.549218
7521	237	5	5	0	5	0	2016	5	2015-12-29 09:53:02.153467	2016-03-09 06:35:35.097601
7557	245	5	5	0.5	4.5	0	2016	5	2015-12-29 09:53:02.681412	2016-12-29 07:49:17.276297
7524	237	8	5	0	5	0	2016	5	2015-12-29 09:53:02.194523	2016-11-04 10:01:18.593353
7490	219	1	5	1	4	0	2016	5	2015-12-29 09:53:01.702942	2016-11-14 05:25:47.256855
7525	237	9	1	0	1	0	2016	1	2015-12-29 09:53:02.208226	2016-12-23 09:03:58.409648
7565	239	4	7	7	0	0	2016	7	2015-12-29 09:53:02.791459	2015-12-29 09:53:02.791459
7566	239	5	5	5	0	0	2016	5	2015-12-29 09:53:02.805961	2015-12-29 09:53:02.805961
7568	239	7	7	7	0	0	2016	7	2015-12-29 09:53:02.833007	2015-12-29 09:53:02.833007
7569	239	8	5	5	0	0	2016	5	2015-12-29 09:53:02.847513	2015-12-29 09:53:02.847513
7570	239	9	0	0	0	0	2016	0	2015-12-29 09:53:02.861028	2015-12-29 09:53:02.861028
7574	253	4	7	7	0	0	2016	7	2015-12-29 09:53:02.956496	2015-12-29 09:53:02.956496
39886	156	2	15	15	0	0	2017	15	2017-01-02 04:46:59.417648	2017-01-02 04:46:59.417648
7576	253	6	84	84	0	0	2016	84	2015-12-29 09:53:02.984471	2015-12-29 09:53:02.984471
7616	247	1	5	0	5	0	2016	5	2015-12-29 09:53:03.677982	2017-01-02 05:05:18.320171
7579	253	9	0	0	0	0	2016	0	2015-12-29 09:53:03.025994	2015-12-29 09:53:03.025994
7580	238	1	5	5	0	0	2016	5	2015-12-29 09:53:03.040479	2015-12-29 09:53:03.040479
7581	238	2	15	15	0	0	2016	15	2015-12-29 09:53:03.054011	2015-12-29 09:53:03.054011
7582	238	3	7	7	0	0	2016	7	2015-12-29 09:53:03.067518	2015-12-29 09:53:03.067518
7583	238	4	7	7	0	0	2016	7	2015-12-29 09:53:03.081997	2015-12-29 09:53:03.081997
7584	238	5	5	5	0	0	2016	5	2015-12-29 09:53:03.095519	2015-12-29 09:53:03.095519
7586	238	7	7	7	0	0	2016	7	2015-12-29 09:53:03.123517	2015-12-29 09:53:03.123517
7587	238	8	5	5	0	0	2016	5	2015-12-29 09:53:03.137061	2015-12-29 09:53:03.137061
7588	238	9	0	0	0	0	2016	0	2015-12-29 09:53:03.160991	2015-12-29 09:53:03.160991
7589	259	1	5	5	0	0	2016	5	2015-12-29 09:53:03.175161	2015-12-29 09:53:03.175161
7590	259	2	15	15	0	0	2016	15	2015-12-29 09:53:03.198836	2015-12-29 09:53:03.198836
7591	259	3	7	7	0	0	2016	7	2015-12-29 09:53:03.212264	2015-12-29 09:53:03.212264
7592	259	4	7	7	0	0	2016	7	2015-12-29 09:53:03.226755	2015-12-29 09:53:03.226755
7593	259	5	5	5	0	0	2016	5	2015-12-29 09:53:03.240303	2015-12-29 09:53:03.240303
7595	259	7	7	7	0	0	2016	7	2015-12-29 09:53:03.2683	2015-12-29 09:53:03.2683
7596	259	8	5	5	0	0	2016	5	2015-12-29 09:53:03.281803	2015-12-29 09:53:03.281803
7597	259	9	0	0	0	0	2016	0	2015-12-29 09:53:03.295313	2015-12-29 09:53:03.295313
7598	256	1	5	5	0	0	2016	5	2015-12-29 09:53:03.309809	2015-12-29 09:53:03.309809
7599	256	2	15	15	0	0	2016	15	2015-12-29 09:53:03.323332	2015-12-29 09:53:03.323332
7600	256	3	7	7	0	0	2016	7	2015-12-29 09:53:03.33682	2015-12-29 09:53:03.33682
7601	256	4	7	7	0	0	2016	7	2015-12-29 09:53:03.361439	2015-12-29 09:53:03.361439
7602	256	5	5	5	0	0	2016	5	2015-12-29 09:53:03.374956	2015-12-29 09:53:03.374956
7604	256	7	7	7	0	0	2016	7	2015-12-29 09:53:03.402941	2015-12-29 09:53:03.402941
7605	256	8	5	5	0	0	2016	5	2015-12-29 09:53:03.417367	2015-12-29 09:53:03.417367
7606	256	9	0	0	0	0	2016	0	2015-12-29 09:53:03.440377	2015-12-29 09:53:03.440377
7607	233	1	5	5	0	0	2016	5	2015-12-29 09:53:03.454744	2015-12-29 09:53:03.454744
7609	233	3	7	7	0	0	2016	7	2015-12-29 09:53:03.491905	2015-12-29 09:53:03.491905
7610	233	4	7	7	0	0	2016	7	2015-12-29 09:53:03.5747	2015-12-29 09:53:03.5747
7613	233	7	7	7	0	0	2016	7	2015-12-29 09:53:03.634353	2015-12-29 09:53:03.634353
7614	233	8	5	5	0	0	2016	5	2015-12-29 09:53:03.650359	2015-12-29 09:53:03.650359
7615	233	9	0	0	0	0	2016	0	2015-12-29 09:53:03.66412	2015-12-29 09:53:03.66412
7618	247	3	7	7	0	0	2016	7	2015-12-29 09:53:03.727448	2015-12-29 09:53:03.727448
7619	247	4	7	7	0	0	2016	7	2015-12-29 09:53:03.742173	2015-12-29 09:53:03.742173
7622	247	7	7	7	0	0	2016	7	2015-12-29 09:53:03.78501	2015-12-29 09:53:03.78501
7624	247	9	0	0	0	0	2016	0	2015-12-29 09:53:03.81287	2015-12-29 09:53:03.81287
7625	244	1	5	5	0	0	2016	5	2015-12-29 09:53:03.827905	2015-12-29 09:53:03.827905
7626	244	2	15	15	0	0	2016	15	2015-12-29 09:53:03.841778	2015-12-29 09:53:03.841778
7627	244	3	7	7	0	0	2016	7	2015-12-29 09:53:03.856715	2015-12-29 09:53:03.856715
7628	244	4	7	7	0	0	2016	7	2015-12-29 09:53:03.870657	2015-12-29 09:53:03.870657
7629	244	5	5	5	0	0	2016	5	2015-12-29 09:53:03.884591	2015-12-29 09:53:03.884591
7630	244	6	84	84	0	0	2016	84	2015-12-29 09:53:03.899646	2015-12-29 09:53:03.899646
7632	244	8	5	5	0	0	2016	5	2015-12-29 09:53:03.928436	2015-12-29 09:53:03.928436
7633	244	9	0	0	0	0	2016	0	2015-12-29 09:53:03.942364	2015-12-29 09:53:03.942364
7634	240	1	5	5	0	0	2016	5	2015-12-29 09:53:03.956321	2015-12-29 09:53:03.956321
7635	240	2	15	15	0	0	2016	15	2015-12-29 09:53:03.971121	2015-12-29 09:53:03.971121
7636	240	3	7	7	0	0	2016	7	2015-12-29 09:53:03.985077	2015-12-29 09:53:03.985077
7637	240	4	7	7	0	0	2016	7	2015-12-29 09:53:03.998991	2015-12-29 09:53:03.998991
7638	240	5	5	5	0	0	2016	5	2015-12-29 09:53:04.013928	2015-12-29 09:53:04.013928
7631	244	7	7	0	0	0	2016	0	2015-12-29 09:53:03.913521	2015-12-29 09:53:10.734421
7567	239	6	84	0	0	0	2016	0	2015-12-29 09:53:02.819498	2015-12-29 09:53:15.36675
7585	238	6	84	0	0	0	2016	0	2015-12-29 09:53:03.109053	2015-12-29 09:53:15.395685
7594	259	6	84	0	0	0	2016	0	2015-12-29 09:53:03.253797	2015-12-29 09:53:15.434623
7603	256	6	84	0	0	0	2016	0	2015-12-29 09:53:03.388444	2015-12-29 09:53:15.472599
7612	233	6	84	0	0	0	2016	0	2015-12-29 09:53:03.620839	2015-12-29 09:53:15.521763
7621	247	6	84	0	0	0	2016	0	2015-12-29 09:53:03.770042	2015-12-29 09:53:15.677138
7639	240	6	84	0	0	0	2016	0	2015-12-29 09:53:04.02792	2015-12-29 09:53:15.726181
7623	247	8	5	2	3	0	2016	5	2015-12-29 09:53:03.799016	2016-12-23 14:25:23.642922
7573	253	3	7	0	7	0	2016	7	2015-12-29 09:53:02.943294	2016-10-12 04:55:14.455284
7571	253	1	5	2	3	0	2016	5	2015-12-29 09:53:02.878026	2016-11-07 04:46:22.45724
7617	247	2	15	5	10	0	2016	15	2015-12-29 09:53:03.692939	2016-11-08 13:45:05.883413
7578	253	8	5	0	5	0	2016	5	2015-12-29 09:53:03.012502	2016-10-21 03:20:18.252482
7611	233	5	5	4.5	0.5	0	2016	5	2015-12-29 09:53:03.607359	2016-07-28 06:41:35.961397
7608	233	2	15	7	8	0	2016	15	2015-12-29 09:53:03.4785	2016-08-11 11:02:51.752276
7572	253	2	15	1	14	0	2016	15	2015-12-29 09:53:02.911989	2016-12-23 12:19:57.005685
7640	240	7	7	7	0	0	2016	7	2015-12-29 09:53:04.042786	2015-12-29 09:53:04.042786
7641	240	8	5	5	0	0	2016	5	2015-12-29 09:53:04.056759	2015-12-29 09:53:04.056759
7642	240	9	0	0	0	0	2016	0	2015-12-29 09:53:04.070684	2015-12-29 09:53:04.070684
7643	236	1	5	5	0	0	2016	5	2015-12-29 09:53:04.085614	2015-12-29 09:53:04.085614
7644	236	2	15	15	0	0	2016	15	2015-12-29 09:53:04.099697	2015-12-29 09:53:04.099697
7645	236	3	7	7	0	0	2016	7	2015-12-29 09:53:04.130425	2015-12-29 09:53:04.130425
7646	236	4	7	7	0	0	2016	7	2015-12-29 09:53:04.182857	2015-12-29 09:53:04.182857
7647	236	5	5	5	0	0	2016	5	2015-12-29 09:53:04.197747	2015-12-29 09:53:04.197747
7649	236	7	7	7	0	0	2016	7	2015-12-29 09:53:04.225633	2015-12-29 09:53:04.225633
7650	236	8	5	5	0	0	2016	5	2015-12-29 09:53:04.240554	2015-12-29 09:53:04.240554
7651	236	9	0	0	0	0	2016	0	2015-12-29 09:53:04.264695	2015-12-29 09:53:04.264695
7654	248	3	7	7	0	0	2016	7	2015-12-29 09:53:04.307611	2015-12-29 09:53:04.307611
7655	248	4	7	7	0	0	2016	7	2015-12-29 09:53:04.332487	2015-12-29 09:53:04.332487
7658	248	7	7	7	0	0	2016	7	2015-12-29 09:53:04.3753	2015-12-29 09:53:04.3753
7663	246	3	7	7	0	0	2016	7	2015-12-29 09:53:04.447012	2015-12-29 09:53:04.447012
7664	246	4	7	7	0	0	2016	7	2015-12-29 09:53:04.460964	2015-12-29 09:53:04.460964
7667	246	7	7	7	0	0	2016	7	2015-12-29 09:53:04.503854	2015-12-29 09:53:04.503854
7670	258	1	5	5	0	0	2016	5	2015-12-29 09:53:04.546596	2015-12-29 09:53:04.546596
7671	258	2	15	15	0	0	2016	15	2015-12-29 09:53:04.561554	2015-12-29 09:53:04.561554
7672	258	3	7	7	0	0	2016	7	2015-12-29 09:53:04.575498	2015-12-29 09:53:04.575498
7673	258	4	7	7	0	0	2016	7	2015-12-29 09:53:04.589446	2015-12-29 09:53:04.589446
7674	258	5	5	5	0	0	2016	5	2015-12-29 09:53:04.60436	2015-12-29 09:53:04.60436
7676	258	7	7	7	0	0	2016	7	2015-12-29 09:53:04.63329	2015-12-29 09:53:04.63329
7677	258	8	5	5	0	0	2016	5	2015-12-29 09:53:04.64779	2015-12-29 09:53:04.64779
7678	258	9	0	0	0	0	2016	0	2015-12-29 09:53:04.686188	2015-12-29 09:53:04.686188
7679	254	1	5	5	0	0	2016	5	2015-12-29 09:53:04.700194	2015-12-29 09:53:04.700194
7680	254	2	15	15	0	0	2016	15	2015-12-29 09:53:04.715065	2015-12-29 09:53:04.715065
7681	254	3	7	7	0	0	2016	7	2015-12-29 09:53:04.729053	2015-12-29 09:53:04.729053
7682	254	4	7	7	0	0	2016	7	2015-12-29 09:53:04.753142	2015-12-29 09:53:04.753142
7683	254	5	5	5	0	0	2016	5	2015-12-29 09:53:04.768046	2015-12-29 09:53:04.768046
7685	254	7	7	7	0	0	2016	7	2015-12-29 09:53:04.795945	2015-12-29 09:53:04.795945
7686	254	8	5	5	0	0	2016	5	2015-12-29 09:53:04.810833	2015-12-29 09:53:04.810833
7687	254	9	0	0	0	0	2016	0	2015-12-29 09:53:04.824782	2015-12-29 09:53:04.824782
7688	257	1	5	5	0	0	2016	5	2015-12-29 09:53:04.839727	2015-12-29 09:53:04.839727
7689	257	2	15	15	0	0	2016	15	2015-12-29 09:53:04.863938	2015-12-29 09:53:04.863938
7690	257	3	7	7	0	0	2016	7	2015-12-29 09:53:04.887931	2015-12-29 09:53:04.887931
7691	257	4	7	7	0	0	2016	7	2015-12-29 09:53:04.902711	2015-12-29 09:53:04.902711
7692	257	5	5	5	0	0	2016	5	2015-12-29 09:53:04.916683	2015-12-29 09:53:04.916683
7694	257	7	7	7	0	0	2016	7	2015-12-29 09:53:04.94555	2015-12-29 09:53:04.94555
7695	257	8	5	5	0	0	2016	5	2015-12-29 09:53:04.959509	2015-12-29 09:53:04.959509
7696	257	9	0	0	0	0	2016	0	2015-12-29 09:53:04.974447	2015-12-29 09:53:04.974447
39887	156	3	7	7	0	0	2017	7	2017-01-02 04:46:59.42764	2017-01-02 04:46:59.42764
7700	249	4	7	7	0	0	2016	7	2015-12-29 09:53:05.051514	2015-12-29 09:53:05.051514
7703	249	7	7	7	0	0	2016	7	2015-12-29 09:53:05.09425	2015-12-29 09:53:05.09425
7705	249	9	0	0	0	0	2016	0	2015-12-29 09:53:05.123177	2015-12-29 09:53:05.123177
7708	260	3	7	7	0	0	2016	7	2015-12-29 09:53:05.176136	2015-12-29 09:53:05.176136
7709	260	4	7	7	0	0	2016	7	2015-12-29 09:53:05.190998	2015-12-29 09:53:05.190998
7711	260	6	84	84	0	0	2016	84	2015-12-29 09:53:05.320079	2015-12-29 09:53:05.320079
7714	260	9	0	0	0	0	2016	0	2015-12-29 09:53:05.362794	2015-12-29 09:53:05.362794
7648	236	6	84	0	0	0	2016	0	2015-12-29 09:53:04.211741	2015-12-29 09:53:15.755047
7657	248	6	84	0	0	0	2016	0	2015-12-29 09:53:04.360374	2015-12-29 09:53:15.783886
7666	246	6	84	0	0	0	2016	0	2015-12-29 09:53:04.489842	2015-12-29 09:53:15.812768
7675	258	6	84	0	0	0	2016	0	2015-12-29 09:53:04.618339	2015-12-29 09:53:15.840645
7684	254	6	84	0	0	0	2016	0	2015-12-29 09:53:04.781941	2015-12-29 09:53:15.869545
7693	257	6	84	0	0	0	2016	0	2015-12-29 09:53:04.930676	2015-12-29 09:53:15.898423
7702	249	6	84	0	0	0	2016	0	2015-12-29 09:53:05.080362	2015-12-29 09:53:15.937483
7656	248	5	5	3	2	0	2016	5	2015-12-29 09:53:04.346426	2016-12-29 06:35:33.697743
7662	246	2	15	6	9	0	2016	15	2015-12-29 09:53:04.432136	2016-12-29 15:29:17.064025
7713	260	8	5	1	4	0	2016	5	2015-12-29 09:53:05.348817	2016-10-20 06:50:19.001473
7669	246	9	1	0	1	0	2016	1	2015-12-29 09:53:04.532675	2016-04-05 05:02:21.847245
7706	260	1	5	0	5	0	2016	5	2015-12-29 09:53:05.137105	2016-07-29 07:12:09.267289
7660	248	9	1	0	1	0	2016	1	2015-12-29 09:53:04.404234	2016-09-26 06:56:43.117644
7665	246	5	5	1.5	3.5	0	2016	5	2015-12-29 09:53:04.474938	2016-12-29 15:28:51.193244
7659	248	8	5	0	5	0	2016	5	2015-12-29 09:53:04.389275	2016-12-04 16:45:48.199162
7710	260	5	5	0.5	4.5	0	2016	5	2015-12-29 09:53:05.29638	2016-08-27 06:11:19.660985
7701	249	5	5	2.5	2.5	0	2016	5	2015-12-29 09:53:05.066384	2016-10-12 04:40:40.668489
7668	246	8	5	1	4	0	2016	5	2015-12-29 09:53:04.518726	2016-09-02 14:13:32.778205
7653	248	2	15	0	15	0	2016	15	2015-12-29 09:53:04.293503	2016-12-21 02:57:55.20124
7707	260	2	15	7	8	0	2016	15	2015-12-29 09:53:05.162127	2016-10-20 06:51:32.268829
7704	249	8	5	0	5	0	2016	5	2015-12-29 09:53:05.109227	2016-09-15 11:46:07.492453
7661	246	1	5	1	4	0	2016	5	2015-12-29 09:53:04.418121	2016-12-20 14:17:15.967173
7699	249	3	7	3	4	0	2016	7	2015-12-29 09:53:05.027359	2016-10-12 04:42:48.495811
7652	248	1	5	0	5	0	2016	5	2015-12-29 09:53:04.279597	2016-12-29 06:35:13.230294
7697	249	1	5	3	2	0	2016	5	2015-12-29 09:53:04.989188	2016-12-19 04:33:38.092244
7715	261	1	5	5	0	0	2016	5	2015-12-29 09:53:05.377688	2015-12-29 09:53:05.377688
7716	261	2	15	15	0	0	2016	15	2015-12-29 09:53:05.391715	2015-12-29 09:53:05.391715
7717	261	3	7	7	0	0	2016	7	2015-12-29 09:53:05.406584	2015-12-29 09:53:05.406584
7718	261	4	7	7	0	0	2016	7	2015-12-29 09:53:05.420544	2015-12-29 09:53:05.420544
7719	261	5	5	5	0	0	2016	5	2015-12-29 09:53:05.434476	2015-12-29 09:53:05.434476
39888	156	4	7	7	0	0	2017	7	2017-01-02 04:46:59.437556	2017-01-02 04:46:59.437556
7721	261	7	7	7	0	0	2016	7	2015-12-29 09:53:05.463368	2015-12-29 09:53:05.463368
7722	261	8	5	5	0	0	2016	5	2015-12-29 09:53:05.478292	2015-12-29 09:53:05.478292
7723	261	9	0	0	0	0	2016	0	2015-12-29 09:53:05.492339	2015-12-29 09:53:05.492339
7724	252	1	5	5	0	0	2016	5	2015-12-29 09:53:05.516339	2015-12-29 09:53:05.516339
7725	252	2	15	15	0	0	2016	15	2015-12-29 09:53:05.531207	2015-12-29 09:53:05.531207
7726	252	3	7	7	0	0	2016	7	2015-12-29 09:53:05.545194	2015-12-29 09:53:05.545194
7727	252	4	7	7	0	0	2016	7	2015-12-29 09:53:05.559078	2015-12-29 09:53:05.559078
7728	252	5	5	5	0	0	2016	5	2015-12-29 09:53:05.574032	2015-12-29 09:53:05.574032
7730	252	7	7	7	0	0	2016	7	2015-12-29 09:53:05.602897	2015-12-29 09:53:05.602897
7731	252	8	5	5	0	0	2016	5	2015-12-29 09:53:05.616875	2015-12-29 09:53:05.616875
7732	252	9	0	0	0	0	2016	0	2015-12-29 09:53:05.630812	2015-12-29 09:53:05.630812
7736	250	4	7	7	0	0	2016	7	2015-12-29 09:53:05.708763	2015-12-29 09:53:05.708763
7739	250	7	7	7	0	0	2016	7	2015-12-29 09:53:05.751683	2015-12-29 09:53:05.751683
7741	250	9	0	0	0	0	2016	0	2015-12-29 09:53:05.780454	2015-12-29 09:53:05.780454
7742	265	1	5	5	0	0	2016	5	2015-12-29 09:53:05.794432	2015-12-29 09:53:05.794432
7743	265	2	15	15	0	0	2016	15	2015-12-29 09:53:05.809365	2015-12-29 09:53:05.809365
7744	265	3	7	7	0	0	2016	7	2015-12-29 09:53:05.823293	2015-12-29 09:53:05.823293
7745	265	4	7	7	0	0	2016	7	2015-12-29 09:53:05.837267	2015-12-29 09:53:05.837267
7746	265	5	5	5	0	0	2016	5	2015-12-29 09:53:05.852225	2015-12-29 09:53:05.852225
7748	265	7	7	7	0	0	2016	7	2015-12-29 09:53:05.880096	2015-12-29 09:53:05.880096
7749	265	8	5	5	0	0	2016	5	2015-12-29 09:53:05.894977	2015-12-29 09:53:05.894977
7750	265	9	0	0	0	0	2016	0	2015-12-29 09:53:05.908981	2015-12-29 09:53:05.908981
7757	229	7	7	7	0	0	2016	7	2015-12-29 09:53:06.029719	2015-12-29 09:53:06.029719
7759	229	9	0	0	0	0	2016	0	2015-12-29 09:53:06.05863	2015-12-29 09:53:06.05863
7760	264	1	5	5	0	0	2016	5	2015-12-29 09:53:06.072556	2015-12-29 09:53:06.072556
7761	264	2	15	15	0	0	2016	15	2015-12-29 09:53:06.086512	2015-12-29 09:53:06.086512
7762	264	3	7	7	0	0	2016	7	2015-12-29 09:53:06.111657	2015-12-29 09:53:06.111657
7763	264	4	7	7	0	0	2016	7	2015-12-29 09:53:06.125503	2015-12-29 09:53:06.125503
7764	264	5	5	5	0	0	2016	5	2015-12-29 09:53:06.139428	2015-12-29 09:53:06.139428
7766	264	7	7	7	0	0	2016	7	2015-12-29 09:53:06.16832	2015-12-29 09:53:06.16832
7767	264	8	5	5	0	0	2016	5	2015-12-29 09:53:06.183242	2015-12-29 09:53:06.183242
7768	264	9	0	0	0	0	2016	0	2015-12-29 09:53:06.197225	2015-12-29 09:53:06.197225
7771	251	3	7	7	0	0	2016	7	2015-12-29 09:53:06.240039	2015-12-29 09:53:06.240039
7772	251	4	7	7	0	0	2016	7	2015-12-29 09:53:06.265903	2015-12-29 09:53:06.265903
7775	251	7	7	7	0	0	2016	7	2015-12-29 09:53:06.338252	2015-12-29 09:53:06.338252
7777	251	9	0	0	0	0	2016	0	2015-12-29 09:53:06.376277	2015-12-29 09:53:06.376277
7780	266	3	7	7	0	0	2016	7	2015-12-29 09:53:06.420044	2015-12-29 09:53:06.420044
7781	266	4	7	7	0	0	2016	7	2015-12-29 09:53:06.433954	2015-12-29 09:53:06.433954
7784	266	7	7	7	0	0	2016	7	2015-12-29 09:53:06.476797	2015-12-29 09:53:06.476797
7786	266	9	0	0	0	0	2016	0	2015-12-29 09:53:06.525902	2015-12-29 09:53:06.525902
7789	242	3	7	7	0	0	2016	7	2015-12-29 09:53:06.578869	2015-12-29 09:53:06.578869
7729	252	6	84	0	0	0	2016	0	2015-12-29 09:53:05.588025	2015-12-29 09:53:15.994175
7738	250	6	84	0	0	0	2016	0	2015-12-29 09:53:05.737635	2015-12-29 09:53:16.023044
7747	265	6	84	0	0	0	2016	0	2015-12-29 09:53:05.866139	2015-12-29 09:53:16.051983
7756	229	6	84	0	0	0	2016	0	2015-12-29 09:53:06.004736	2015-12-29 09:53:16.079863
7765	264	6	84	0	0	0	2016	0	2015-12-29 09:53:06.154358	2015-12-29 09:53:16.108716
7774	251	6	84	0	0	0	2016	0	2015-12-29 09:53:06.313228	2015-12-29 09:53:16.230558
7783	266	6	84	0	0	0	2016	0	2015-12-29 09:53:06.462839	2015-12-29 09:53:16.26769
7776	251	8	5	1	4	0	2016	5	2015-12-29 09:53:06.362319	2016-11-02 09:06:20.190098
7740	250	8	5	0	5	0	2016	5	2015-12-29 09:53:05.765554	2016-12-27 05:56:32.7854
7769	251	1	5	1	4	0	2016	5	2015-12-29 09:53:06.211171	2016-12-21 07:01:58.724356
7773	251	5	5	3	2	0	2016	5	2015-12-29 09:53:06.289223	2016-08-08 11:00:54.452463
7734	250	2	15	0	15	0	2016	15	2015-12-29 09:53:05.679997	2016-12-27 12:42:16.052601
7733	250	1	5	0	5	0	2016	5	2015-12-29 09:53:05.645735	2016-09-23 10:52:59.100157
7735	250	3	7	4	3	0	2016	7	2015-12-29 09:53:05.693832	2016-05-26 05:19:35.990928
7785	266	8	5	2	3	0	2016	5	2015-12-29 09:53:06.500888	2016-12-27 07:03:55.899702
7752	229	2	15	0	15	0	2016	15	2015-12-29 09:53:05.937825	2016-12-27 05:04:42.228525
7770	251	2	15	2	13	0	2016	15	2015-12-29 09:53:06.226094	2016-12-28 05:27:35.314891
7754	229	4	7	7	0	0	2016	7	2015-12-29 09:53:05.976878	2016-04-26 08:00:07.997533
7758	229	8	5	2	3	0	2016	5	2015-12-29 09:53:06.043749	2016-10-13 04:53:36.036568
7755	229	5	5	0.5	4.5	0	2016	5	2015-12-29 09:53:05.990736	2016-12-27 05:05:23.267715
7787	242	1	5	0	5	0	2016	5	2015-12-29 09:53:06.539877	2016-04-11 05:32:00.857323
7788	242	2	15	6	9	0	2016	15	2015-12-29 09:53:06.554732	2016-04-26 07:20:41.281987
7751	229	1	5	2	3	0	2016	5	2015-12-29 09:53:05.923953	2016-06-09 05:32:52.247385
7778	266	1	5	0	5	0	2016	5	2015-12-29 09:53:06.391125	2016-09-22 12:51:07.010146
7782	266	5	5	1	4	0	2016	5	2015-12-29 09:53:06.447945	2016-12-27 07:04:44.976214
7779	266	2	15	2	13	0	2016	15	2015-12-29 09:53:06.40508	2016-11-28 05:02:16.672627
7790	242	4	7	7	0	0	2016	7	2015-12-29 09:53:06.592727	2015-12-29 09:53:06.592727
39889	156	5	5	5	0	0	2017	5	2017-01-02 04:46:59.447647	2017-01-02 04:46:59.447647
7795	242	9	0	0	0	0	2016	0	2015-12-29 09:53:06.674548	2015-12-29 09:53:06.674548
7796	268	1	5	5	0	0	2016	5	2015-12-29 09:53:06.689491	2015-12-29 09:53:06.689491
7797	268	2	15	15	0	0	2016	15	2015-12-29 09:53:06.703445	2015-12-29 09:53:06.703445
7798	268	3	7	7	0	0	2016	7	2015-12-29 09:53:06.717388	2015-12-29 09:53:06.717388
7799	268	4	7	7	0	0	2016	7	2015-12-29 09:53:06.732304	2015-12-29 09:53:06.732304
7800	268	5	5	5	0	0	2016	5	2015-12-29 09:53:06.746253	2015-12-29 09:53:06.746253
7801	268	6	84	84	0	0	2016	84	2015-12-29 09:53:06.761216	2015-12-29 09:53:06.761216
7802	268	7	7	7	0	0	2016	7	2015-12-29 09:53:06.785331	2015-12-29 09:53:06.785331
7803	268	8	5	5	0	0	2016	5	2015-12-29 09:53:06.799192	2015-12-29 09:53:06.799192
7804	268	9	0	0	0	0	2016	0	2015-12-29 09:53:06.814113	2015-12-29 09:53:06.814113
7805	274	1	5	5	0	0	2016	5	2015-12-29 09:53:06.828101	2015-12-29 09:53:06.828101
7806	274	2	15	15	0	0	2016	15	2015-12-29 09:53:06.841985	2015-12-29 09:53:06.841985
7807	274	3	7	7	0	0	2016	7	2015-12-29 09:53:06.867026	2015-12-29 09:53:06.867026
7808	274	4	7	7	0	0	2016	7	2015-12-29 09:53:06.881008	2015-12-29 09:53:06.881008
7809	274	5	5	5	0	0	2016	5	2015-12-29 09:53:06.895979	2015-12-29 09:53:06.895979
7811	274	7	7	7	0	0	2016	7	2015-12-29 09:53:06.923866	2015-12-29 09:53:06.923866
7812	274	8	5	5	0	0	2016	5	2015-12-29 09:53:06.938746	2015-12-29 09:53:06.938746
7813	274	9	0	0	0	0	2016	0	2015-12-29 09:53:06.952689	2015-12-29 09:53:06.952689
7814	273	1	5	5	0	0	2016	5	2015-12-29 09:53:06.977711	2015-12-29 09:53:06.977711
7815	273	2	15	15	0	0	2016	15	2015-12-29 09:53:06.991753	2015-12-29 09:53:06.991753
7816	273	3	7	7	0	0	2016	7	2015-12-29 09:53:07.005616	2015-12-29 09:53:07.005616
7817	273	4	7	7	0	0	2016	7	2015-12-29 09:53:07.020579	2015-12-29 09:53:07.020579
7818	273	5	5	5	0	0	2016	5	2015-12-29 09:53:07.034502	2015-12-29 09:53:07.034502
7820	273	7	7	7	0	0	2016	7	2015-12-29 09:53:07.063432	2015-12-29 09:53:07.063432
7821	273	8	5	5	0	0	2016	5	2015-12-29 09:53:07.077372	2015-12-29 09:53:07.077372
7822	273	9	0	0	0	0	2016	0	2015-12-29 09:53:07.092307	2015-12-29 09:53:07.092307
7823	255	1	5	5	0	0	2016	5	2015-12-29 09:53:07.106237	2015-12-29 09:53:07.106237
7824	255	2	15	15	0	0	2016	15	2015-12-29 09:53:07.120206	2015-12-29 09:53:07.120206
7825	255	3	7	7	0	0	2016	7	2015-12-29 09:53:07.135098	2015-12-29 09:53:07.135098
7826	255	4	7	7	0	0	2016	7	2015-12-29 09:53:07.149089	2015-12-29 09:53:07.149089
7827	255	5	5	5	0	0	2016	5	2015-12-29 09:53:07.162991	2015-12-29 09:53:07.162991
7829	255	7	7	7	0	0	2016	7	2015-12-29 09:53:07.191948	2015-12-29 09:53:07.191948
7830	255	8	5	5	0	0	2016	5	2015-12-29 09:53:07.206811	2015-12-29 09:53:07.206811
7831	255	9	0	0	0	0	2016	0	2015-12-29 09:53:07.220771	2015-12-29 09:53:07.220771
7832	267	1	5	5	0	0	2016	5	2015-12-29 09:53:07.234704	2015-12-29 09:53:07.234704
7833	267	2	15	15	0	0	2016	15	2015-12-29 09:53:07.249645	2015-12-29 09:53:07.249645
7834	267	3	7	7	0	0	2016	7	2015-12-29 09:53:07.263621	2015-12-29 09:53:07.263621
7835	267	4	7	7	0	0	2016	7	2015-12-29 09:53:07.278583	2015-12-29 09:53:07.278583
7836	267	5	5	5	0	0	2016	5	2015-12-29 09:53:07.292475	2015-12-29 09:53:07.292475
7837	267	6	84	84	0	0	2016	84	2015-12-29 09:53:07.306413	2015-12-29 09:53:07.306413
7838	267	7	7	7	0	0	2016	7	2015-12-29 09:53:07.321369	2015-12-29 09:53:07.321369
7839	267	8	5	5	0	0	2016	5	2015-12-29 09:53:07.33532	2015-12-29 09:53:07.33532
7840	267	9	0	0	0	0	2016	0	2015-12-29 09:53:07.349275	2015-12-29 09:53:07.349275
7841	278	1	5	5	0	0	2016	5	2015-12-29 09:53:07.364214	2015-12-29 09:53:07.364214
7842	278	2	15	15	0	0	2016	15	2015-12-29 09:53:07.388303	2015-12-29 09:53:07.388303
7843	278	3	7	7	0	0	2016	7	2015-12-29 09:53:07.403166	2015-12-29 09:53:07.403166
7844	278	4	7	7	0	0	2016	7	2015-12-29 09:53:07.417142	2015-12-29 09:53:07.417142
7845	278	5	5	5	0	0	2016	5	2015-12-29 09:53:07.441257	2015-12-29 09:53:07.441257
7846	278	6	84	84	0	0	2016	84	2015-12-29 09:53:07.456166	2015-12-29 09:53:07.456166
7847	278	7	7	7	0	0	2016	7	2015-12-29 09:53:07.470042	2015-12-29 09:53:07.470042
7848	278	8	5	5	0	0	2016	5	2015-12-29 09:53:07.48403	2015-12-29 09:53:07.48403
7849	278	9	0	0	0	0	2016	0	2015-12-29 09:53:07.498918	2015-12-29 09:53:07.498918
7850	279	1	5	5	0	0	2016	5	2015-12-29 09:53:07.523054	2015-12-29 09:53:07.523054
7851	279	2	15	15	0	0	2016	15	2015-12-29 09:53:07.53797	2015-12-29 09:53:07.53797
7852	279	3	7	7	0	0	2016	7	2015-12-29 09:53:07.551931	2015-12-29 09:53:07.551931
7853	279	4	7	7	0	0	2016	7	2015-12-29 09:53:07.565802	2015-12-29 09:53:07.565802
7854	279	5	5	5	0	0	2016	5	2015-12-29 09:53:07.580729	2015-12-29 09:53:07.580729
7855	279	6	84	84	0	0	2016	84	2015-12-29 09:53:07.604842	2015-12-29 09:53:07.604842
7856	279	7	7	7	0	0	2016	7	2015-12-29 09:53:07.618718	2015-12-29 09:53:07.618718
7857	279	8	5	5	0	0	2016	5	2015-12-29 09:53:07.633649	2015-12-29 09:53:07.633649
7858	279	9	0	0	0	0	2016	0	2015-12-29 09:53:07.657781	2015-12-29 09:53:07.657781
7859	271	1	5	5	0	0	2016	5	2015-12-29 09:53:07.672653	2015-12-29 09:53:07.672653
7860	271	2	15	15	0	0	2016	15	2015-12-29 09:53:07.686595	2015-12-29 09:53:07.686595
7861	271	3	7	7	0	0	2016	7	2015-12-29 09:53:07.700554	2015-12-29 09:53:07.700554
7862	271	4	7	7	0	0	2016	7	2015-12-29 09:53:07.715456	2015-12-29 09:53:07.715456
7863	271	5	5	5	0	0	2016	5	2015-12-29 09:53:07.729443	2015-12-29 09:53:07.729443
7810	274	6	84	0	0	0	2016	0	2015-12-29 09:53:06.909867	2015-12-29 09:53:16.324303
7819	273	6	84	0	0	0	2016	0	2015-12-29 09:53:07.048461	2015-12-29 09:53:16.35323
7828	255	6	84	0	0	0	2016	0	2015-12-29 09:53:07.177933	2015-12-29 09:53:16.382067
7864	271	6	84	0	0	0	2016	0	2015-12-29 09:53:07.744356	2015-12-29 09:53:16.409921
7791	242	5	5	3.5	1.5	0	2016	5	2015-12-29 09:53:06.617749	2016-03-24 07:30:31.577261
7793	242	7	7	3	4	0	2016	7	2015-12-29 09:53:06.646659	2016-01-08 06:52:31.476645
7794	242	8	5	2	3	0	2016	5	2015-12-29 09:53:06.660613	2016-04-26 07:21:14.970957
7865	271	7	7	7	0	0	2016	7	2015-12-29 09:53:07.758318	2015-12-29 09:53:07.758318
7866	271	8	5	5	0	0	2016	5	2015-12-29 09:53:07.772274	2015-12-29 09:53:07.772274
7867	271	9	0	0	0	0	2016	0	2015-12-29 09:53:07.787193	2015-12-29 09:53:07.787193
7870	269	3	7	7	0	0	2016	7	2015-12-29 09:53:07.830014	2015-12-29 09:53:07.830014
7871	269	4	7	7	0	0	2016	7	2015-12-29 09:53:07.843958	2015-12-29 09:53:07.843958
7874	269	7	7	7	0	0	2016	7	2015-12-29 09:53:07.886777	2015-12-29 09:53:07.886777
7876	269	9	0	0	0	0	2016	0	2015-12-29 09:53:07.915671	2015-12-29 09:53:07.915671
7879	281	3	7	7	0	0	2016	7	2015-12-29 09:53:07.968594	2015-12-29 09:53:07.968594
7880	281	4	7	7	0	0	2016	7	2015-12-29 09:53:07.993628	2015-12-29 09:53:07.993628
7883	281	7	7	7	0	0	2016	7	2015-12-29 09:53:08.036433	2015-12-29 09:53:08.036433
7885	281	9	0	0	0	0	2016	0	2015-12-29 09:53:08.065368	2015-12-29 09:53:08.065368
7886	272	1	5	5	0	0	2016	5	2015-12-29 09:53:08.07928	2015-12-29 09:53:08.07928
7887	272	2	15	15	0	0	2016	15	2015-12-29 09:53:08.093242	2015-12-29 09:53:08.093242
7888	272	3	7	7	0	0	2016	7	2015-12-29 09:53:08.108202	2015-12-29 09:53:08.108202
7889	272	4	7	7	0	0	2016	7	2015-12-29 09:53:08.12213	2015-12-29 09:53:08.12213
7890	272	5	5	5	0	0	2016	5	2015-12-29 09:53:08.136105	2015-12-29 09:53:08.136105
7892	272	7	7	7	0	0	2016	7	2015-12-29 09:53:08.164961	2015-12-29 09:53:08.164961
7893	272	8	5	5	0	0	2016	5	2015-12-29 09:53:08.189972	2015-12-29 09:53:08.189972
7894	272	9	0	0	0	0	2016	0	2015-12-29 09:53:08.203979	2015-12-29 09:53:08.203979
7896	270	2	15	15	0	0	2016	15	2015-12-29 09:53:08.232806	2015-12-29 09:53:08.232806
7897	270	3	7	7	0	0	2016	7	2015-12-29 09:53:08.256936	2015-12-29 09:53:08.256936
7898	270	4	7	7	0	0	2016	7	2015-12-29 09:53:08.270787	2015-12-29 09:53:08.270787
7900	270	6	84	84	0	0	2016	84	2015-12-29 09:53:08.319986	2015-12-29 09:53:08.319986
7902	270	8	5	5	0	0	2016	5	2015-12-29 09:53:08.348768	2015-12-29 09:53:08.348768
7903	270	9	0	0	0	0	2016	0	2015-12-29 09:53:08.372868	2015-12-29 09:53:08.372868
7904	280	1	5	5	0	0	2016	5	2015-12-29 09:53:08.387818	2015-12-29 09:53:08.387818
7905	280	2	15	15	0	0	2016	15	2015-12-29 09:53:08.411933	2015-12-29 09:53:08.411933
7906	280	3	7	7	0	0	2016	7	2015-12-29 09:53:08.436812	2015-12-29 09:53:08.436812
7907	280	4	7	7	0	0	2016	7	2015-12-29 09:53:08.450793	2015-12-29 09:53:08.450793
7908	280	5	5	5	0	0	2016	5	2015-12-29 09:53:08.474903	2015-12-29 09:53:08.474903
7910	280	7	7	7	0	0	2016	7	2015-12-29 09:53:08.524019	2015-12-29 09:53:08.524019
7911	280	8	5	5	0	0	2016	5	2015-12-29 09:53:08.53785	2015-12-29 09:53:08.53785
7912	280	9	0	0	0	0	2016	0	2015-12-29 09:53:08.552835	2015-12-29 09:53:08.552835
7913	276	1	5	5	0	0	2016	5	2015-12-29 09:53:08.58699	2015-12-29 09:53:08.58699
7915	276	3	7	7	0	0	2016	7	2015-12-29 09:53:08.625934	2015-12-29 09:53:08.625934
7916	276	4	7	7	0	0	2016	7	2015-12-29 09:53:08.639884	2015-12-29 09:53:08.639884
7918	276	6	84	84	0	0	2016	84	2015-12-29 09:53:08.678826	2015-12-29 09:53:08.678826
7921	276	9	0	0	0	0	2016	0	2015-12-29 09:53:08.760677	2015-12-29 09:53:08.760677
7924	282	3	7	7	0	0	2016	7	2015-12-29 09:53:08.823778	2015-12-29 09:53:08.823778
7925	282	4	7	7	0	0	2016	7	2015-12-29 09:53:08.838607	2015-12-29 09:53:08.838607
7928	282	7	7	7	0	0	2016	7	2015-12-29 09:53:08.881453	2015-12-29 09:53:08.881453
7930	282	9	0	0	0	0	2016	0	2015-12-29 09:53:08.90934	2015-12-29 09:53:08.90934
7933	275	3	7	7	0	0	2016	7	2015-12-29 09:53:08.953465	2015-12-29 09:53:08.953465
7934	275	4	7	7	0	0	2016	7	2015-12-29 09:53:08.967354	2015-12-29 09:53:08.967354
7935	275	5	5	5	0	0	2016	5	2015-12-29 09:53:08.991219	2015-12-29 09:53:08.991219
7937	275	7	7	7	0	0	2016	7	2015-12-29 09:53:09.020079	2015-12-29 09:53:09.020079
7939	275	9	0	0	0	0	2016	0	2015-12-29 09:53:09.048937	2015-12-29 09:53:09.048937
7919	276	7	7	0	0	0	2016	0	2015-12-29 09:53:08.703413	2015-12-29 09:53:10.82009
7873	269	6	84	0	0	0	2016	0	2015-12-29 09:53:07.872851	2015-12-29 09:53:16.43884
7882	281	6	84	0	0	0	2016	0	2015-12-29 09:53:08.021513	2015-12-29 09:53:16.467722
7891	272	6	84	0	0	0	2016	0	2015-12-29 09:53:08.150992	2015-12-29 09:53:16.506693
7909	280	6	84	0	0	0	2016	0	2015-12-29 09:53:08.499995	2015-12-29 09:53:16.534553
7927	282	6	84	0	0	0	2016	0	2015-12-29 09:53:08.866502	2015-12-29 09:53:16.563456
7936	275	6	84	0	0	0	2016	0	2015-12-29 09:53:09.006071	2015-12-29 09:53:16.59233
7869	269	2	15	8	7	0	2016	15	2015-12-29 09:53:07.815081	2016-12-30 09:17:35.985594
7899	270	5	5	4.5	0.5	0	2016	5	2015-12-29 09:53:08.295911	2016-01-22 08:47:15.287028
7931	275	1	5	0	5	0	2016	5	2015-12-29 09:53:08.924277	2016-09-14 05:39:55.809929
7868	269	1	5	2	3	0	2016	5	2015-12-29 09:53:07.80119	2016-08-09 15:12:36.569076
7895	270	1	5	2	3	0	2016	5	2015-12-29 09:53:08.217871	2016-02-19 06:45:39.659187
7877	281	1	5	3	2	0	2016	5	2015-12-29 09:53:07.929599	2016-05-26 05:17:48.611002
7923	282	2	15	0	15	0	2016	15	2015-12-29 09:53:08.799679	2016-10-12 04:40:39.818861
7881	281	5	5	4	1	0	2016	5	2015-12-29 09:53:08.007643	2016-02-17 09:40:48.814509
7922	282	1	5	0	5	0	2016	5	2015-12-29 09:53:08.784769	2016-12-07 16:14:06.460369
7884	281	8	5	2	3	0	2016	5	2015-12-29 09:53:08.050445	2016-05-26 05:17:34.28477
7878	281	2	15	6	9	0	2016	15	2015-12-29 09:53:07.95462	2016-05-26 05:16:53.744185
7872	269	5	5	4.5	0.5	0	2016	5	2015-12-29 09:53:07.858875	2016-07-14 08:01:59.517514
7917	276	5	5	3.5	1.5	0	2016	5	2015-12-29 09:53:08.664888	2016-12-29 06:20:30.598736
7920	276	8	5	3	2	0	2016	5	2015-12-29 09:53:08.746824	2016-10-03 04:23:58.63261
7932	275	2	15	2	13	0	2016	15	2015-12-29 09:53:08.938221	2016-12-28 05:43:44.36601
7929	282	8	5	3	2	0	2016	5	2015-12-29 09:53:08.895711	2016-10-30 18:04:01.917716
7938	275	8	5	3	2	0	2016	5	2015-12-29 09:53:09.033971	2016-10-09 17:07:52.994951
7926	282	5	5	3	2	0	2016	5	2015-12-29 09:53:08.852577	2016-12-22 07:20:18.04215
7875	269	8	5	3	2	0	2016	5	2015-12-29 09:53:07.90171	2016-11-07 04:45:00.260069
7942	277	3	7	7	0	0	2016	7	2015-12-29 09:53:09.091759	2015-12-29 09:53:09.091759
7943	277	4	7	7	0	0	2016	7	2015-12-29 09:53:09.105945	2015-12-29 09:53:09.105945
7946	277	7	7	7	0	0	2016	7	2015-12-29 09:53:09.148512	2015-12-29 09:53:09.148512
7948	277	9	0	0	0	0	2016	0	2015-12-29 09:53:09.197595	2015-12-29 09:53:09.197595
5867	53	7	7	0	0	0	2016	0	2015-12-29 09:52:35.877295	2015-12-29 09:53:09.439219
5921	70	7	7	0	0	0	2016	0	2015-12-29 09:52:36.72181	2015-12-29 09:53:09.487766
6101	97	7	7	0	0	0	2016	0	2015-12-29 09:52:39.644573	2015-12-29 09:53:09.54431
6155	52	7	7	0	0	0	2016	0	2015-12-29 09:52:40.539922	2015-12-29 09:53:09.602119
6236	85	7	7	0	0	0	2016	0	2015-12-29 09:52:42.040865	2015-12-29 09:53:09.683985
6317	98	7	7	0	0	0	2016	0	2015-12-29 09:52:43.254825	2015-12-29 09:53:09.774193
6371	109	7	7	0	0	0	2016	0	2015-12-29 09:52:44.131874	2015-12-29 09:53:09.917551
6470	128	7	7	0	0	0	2016	0	2015-12-29 09:52:45.753561	2015-12-29 09:53:10.01448
6551	110	7	7	0	0	0	2016	0	2015-12-29 09:52:47.216389	2015-12-29 09:53:10.072148
6623	140	7	7	0	0	0	2016	0	2015-12-29 09:52:48.276288	2015-12-29 09:53:10.157787
6785	131	7	7	0	0	0	2016	0	2015-12-29 09:52:50.695752	2015-12-29 09:53:10.186657
6839	139	7	7	0	0	0	2016	0	2015-12-29 09:52:51.506967	2015-12-29 09:53:10.21458
6938	147	7	7	0	0	0	2016	0	2015-12-29 09:52:53.231134	2015-12-29 09:53:10.330066
7136	194	7	7	0	0	0	2016	0	2015-12-29 09:52:56.158318	2015-12-29 09:53:10.397181
7208	201	7	7	0	0	0	2016	0	2015-12-29 09:52:57.245896	2015-12-29 09:53:10.425864
7316	230	7	7	0	0	0	2016	0	2015-12-29 09:52:58.947167	2015-12-29 09:53:10.454747
7415	54	7	7	0	0	0	2016	0	2015-12-29 09:53:00.493234	2015-12-29 09:53:10.513154
7514	235	7	7	0	0	0	2016	0	2015-12-29 09:53:02.036018	2015-12-29 09:53:10.599817
7577	253	7	7	0	0	0	2016	0	2015-12-29 09:53:02.998988	2015-12-29 09:53:10.705543
7712	260	7	7	0	0	0	2016	0	2015-12-29 09:53:05.334874	2015-12-29 09:53:10.762338
7901	270	7	7	0	0	0	2016	0	2015-12-29 09:53:08.334807	2015-12-29 09:53:10.791256
5992	30	6	84	0	0	0	2016	0	2015-12-29 09:52:37.819452	2015-12-29 09:53:11.305552
6667	172	6	84	0	0	0	2016	0	2015-12-29 09:52:48.952321	2015-12-29 09:53:13.022639
6973	192	6	84	0	0	0	2016	0	2015-12-29 09:52:53.73068	2015-12-29 09:53:13.666221
7045	198	6	84	0	0	0	2016	0	2015-12-29 09:52:54.843566	2015-12-29 09:53:13.896555
7342	213	6	84	0	0	0	2016	0	2015-12-29 09:52:59.40816	2015-12-29 09:53:14.81284
7720	261	6	84	0	0	0	2016	0	2015-12-29 09:53:05.449458	2015-12-29 09:53:15.965332
7792	242	6	84	0	0	0	2016	0	2015-12-29 09:53:06.631766	2015-12-29 09:53:16.29541
7945	277	6	84	0	0	0	2016	0	2015-12-29 09:53:09.134538	2015-12-29 09:53:16.621221
5127	212	5	5	2	3	0	2015	5	\N	2015-12-30 10:10:22.502653
7972	285	6	84	0	0	0	2016	0	2016-02-01 09:53:35.108202	2016-02-01 09:53:35.188858
7511	235	4	7	3	4	0	2016	7	2015-12-29 09:53:01.993599	2016-01-21 06:39:38.819448
7949	283	1	5	5	0	0	2016	5	2016-01-21 10:47:44.856815	2016-01-21 10:47:44.856815
7950	283	2	15	15	0	0	2016	15	2016-01-21 10:47:44.881423	2016-01-21 10:47:44.881423
7951	283	3	7	7	0	0	2016	7	2016-01-21 10:47:44.89521	2016-01-21 10:47:44.89521
7952	283	4	7	7	0	0	2016	7	2016-01-21 10:47:44.90917	2016-01-21 10:47:44.90917
7953	283	5	5	5	0	0	2016	5	2016-01-21 10:47:44.9241	2016-01-21 10:47:44.9241
7955	283	7	7	7	0	0	2016	7	2016-01-21 10:47:44.97315	2016-01-21 10:47:44.97315
7956	283	8	5	5	0	0	2016	5	2016-01-21 10:47:44.997999	2016-01-21 10:47:44.997999
7957	283	9	0	0	0	0	2016	0	2016-01-21 10:47:45.022258	2016-01-21 10:47:45.022258
7954	283	6	84	0	0	0	2016	0	2016-01-21 10:47:44.94917	2016-01-21 10:47:45.049002
7309	218	9	1	0	1	0	2016	1	2015-12-29 09:52:58.850318	2016-01-21 11:45:22.28954
7960	284	3	7	7	0	0	2016	7	2016-01-27 05:29:29.541205	2016-01-27 05:29:29.541205
7961	284	4	7	7	0	0	2016	7	2016-01-27 05:29:29.55581	2016-01-27 05:29:29.55581
7962	284	5	5	5	0	0	2016	5	2016-01-27 05:29:29.569487	2016-01-27 05:29:29.569487
7964	284	7	7	7	0	0	2016	7	2016-01-27 05:29:29.597769	2016-01-27 05:29:29.597769
7966	284	9	0	0	0	0	2016	0	2016-01-27 05:29:29.625109	2016-01-27 05:29:29.625109
7963	284	6	84	0	0	0	2016	0	2016-01-27 05:29:29.583091	2016-01-27 05:29:29.663352
7969	285	3	7	7	0	0	2016	7	2016-02-01 09:53:35.066433	2016-02-01 09:53:35.066433
7970	285	4	7	7	0	0	2016	7	2016-02-01 09:53:35.080954	2016-02-01 09:53:35.080954
7971	285	5	5	5	0	0	2016	5	2016-02-01 09:53:35.094566	2016-02-01 09:53:35.094566
7973	285	7	7	7	0	0	2016	7	2016-02-01 09:53:35.122864	2016-02-01 09:53:35.122864
39891	156	7	7	7	0	0	2017	7	2017-01-02 04:46:59.467646	2017-01-02 04:46:59.467646
7975	285	9	0	0	0	0	2016	0	2016-02-01 09:53:35.150146	2016-02-01 09:53:35.150146
7967	285	1	5	0	5	0	2016	5	2016-02-01 09:53:35.018689	2016-12-06 04:54:55.103817
7977	286	2	15	14	1	0	2016	15	2016-02-11 11:08:23.45384	2016-07-20 11:10:31.578283
7979	286	4	7	7	0	0	2016	7	2016-02-11 11:08:23.491449	2016-02-11 11:08:23.491449
7980	286	5	5	5	0	0	2016	5	2016-02-11 11:08:23.505417	2016-02-11 11:08:23.505417
7959	284	2	15	14	1	0	2016	15	2016-01-27 05:29:29.518375	2016-03-31 03:56:35.951928
7978	286	3	7	6	1	0	2016	7	2016-02-11 11:08:23.476646	2016-04-28 04:57:00.637732
7965	284	8	5	4	1	0	2016	5	2016-01-27 05:29:29.611423	2016-04-08 02:21:27.14492
7958	284	1	5	2	3	0	2016	5	2016-01-27 05:29:29.493408	2016-04-15 04:55:16.905962
6735	171	2	15	0	15	0	2016	15	2015-12-29 09:52:49.996479	2016-12-26 09:02:24.842574
7944	277	5	5	4	1	0	2016	5	2015-12-29 09:53:09.120611	2016-11-23 05:24:07.529354
7454	226	1	5	1	4	0	2016	5	2015-12-29 09:53:01.184503	2016-04-29 05:12:58.282342
7968	285	2	15	8	7	0	2016	15	2016-02-01 09:53:35.044634	2016-12-30 05:51:51.930832
7947	277	8	5	3	2	0	2016	5	2015-12-29 09:53:09.183775	2016-11-02 05:13:55.530454
6852	143	2	15	1	14	0	2016	15	2015-12-29 09:52:51.749011	2016-10-01 17:37:51.988903
7940	277	1	5	0	5	0	2016	5	2015-12-29 09:53:09.062894	2016-10-27 04:47:32.489288
7941	277	2	15	9	6	0	2016	15	2015-12-29 09:53:09.077802	2016-12-21 12:59:38.14152
7981	286	6	84	84	0	0	2016	84	2016-02-11 11:08:23.519312	2016-02-11 11:08:23.519312
39892	156	8	5	5	0	0	2017	5	2017-01-02 04:46:59.477649	2017-01-02 04:46:59.477649
7984	286	9	0	0	0	0	2016	0	2016-02-11 11:08:23.593458	2016-02-11 11:08:23.593458
7982	286	7	7	0	0	0	2016	0	2016-02-11 11:08:23.564563	2016-02-11 11:08:23.631402
7985	287	1	5	5	0	0	2016	5	2016-02-11 11:09:08.945564	2016-02-11 11:09:08.945564
7986	287	2	15	15	0	0	2016	15	2016-02-11 11:09:08.960216	2016-02-11 11:09:08.960216
7987	287	3	7	7	0	0	2016	7	2016-02-11 11:09:08.98533	2016-02-11 11:09:08.98533
7988	287	4	7	7	0	0	2016	7	2016-02-11 11:09:08.999276	2016-02-11 11:09:08.999276
7989	287	5	5	5	0	0	2016	5	2016-02-11 11:09:09.013018	2016-02-11 11:09:09.013018
7991	287	7	7	7	0	0	2016	7	2016-02-11 11:09:09.041829	2016-02-11 11:09:09.041829
7992	287	8	5	5	0	0	2016	5	2016-02-11 11:09:09.056835	2016-02-11 11:09:09.056835
7993	287	9	0	0	0	0	2016	0	2016-02-11 11:09:09.070778	2016-02-11 11:09:09.070778
7990	287	6	84	0	0	0	2016	0	2016-02-11 11:09:09.027894	2016-02-11 11:09:09.087963
7994	288	1	5	5	0	0	2016	5	2016-02-11 11:11:50.761161	2016-02-11 11:11:50.761161
7995	288	2	15	15	0	0	2016	15	2016-02-11 11:11:50.782274	2016-02-11 11:11:50.782274
7996	288	3	7	7	0	0	2016	7	2016-02-11 11:11:50.796046	2016-02-11 11:11:50.796046
7997	288	4	7	7	0	0	2016	7	2016-02-11 11:11:50.811786	2016-02-11 11:11:50.811786
7998	288	5	5	5	0	0	2016	5	2016-02-11 11:11:50.835233	2016-02-11 11:11:50.835233
8000	288	7	7	7	0	0	2016	7	2016-02-11 11:11:50.864201	2016-02-11 11:11:50.864201
8001	288	8	5	5	0	0	2016	5	2016-02-11 11:11:50.878002	2016-02-11 11:11:50.878002
8002	288	9	0	0	0	0	2016	0	2016-02-11 11:11:50.89296	2016-02-11 11:11:50.89296
7999	288	6	84	0	0	0	2016	0	2016-02-11 11:11:50.849168	2016-02-11 11:11:50.909382
8003	289	1	5	5	0	0	2016	5	2016-02-11 11:12:18.986526	2016-02-11 11:12:18.986526
8004	289	2	15	15	0	0	2016	15	2016-02-11 11:12:19.007638	2016-02-11 11:12:19.007638
8005	289	3	7	7	0	0	2016	7	2016-02-11 11:12:19.022428	2016-02-11 11:12:19.022428
8006	289	4	7	7	0	0	2016	7	2016-02-11 11:12:19.037058	2016-02-11 11:12:19.037058
8007	289	5	5	5	0	0	2016	5	2016-02-11 11:12:19.06151	2016-02-11 11:12:19.06151
8009	289	7	7	7	0	0	2016	7	2016-02-11 11:12:19.089498	2016-02-11 11:12:19.089498
8010	289	8	5	5	0	0	2016	5	2016-02-11 11:12:19.104214	2016-02-11 11:12:19.104214
8011	289	9	0	0	0	0	2016	0	2016-02-11 11:12:19.118148	2016-02-11 11:12:19.118148
8008	289	6	84	0	0	0	2016	0	2016-02-11 11:12:19.07542	2016-02-11 11:12:19.136179
8012	290	1	5	5	0	0	2016	5	2016-02-11 11:12:48.656933	2016-02-11 11:12:48.656933
8013	290	2	15	15	0	0	2016	15	2016-02-11 11:12:48.679341	2016-02-11 11:12:48.679341
8014	290	3	7	7	0	0	2016	7	2016-02-11 11:12:48.693147	2016-02-11 11:12:48.693147
8015	290	4	7	7	0	0	2016	7	2016-02-11 11:12:48.708011	2016-02-11 11:12:48.708011
8016	290	5	5	5	0	0	2016	5	2016-02-11 11:12:48.721962	2016-02-11 11:12:48.721962
8018	290	7	7	7	0	0	2016	7	2016-02-11 11:12:48.750905	2016-02-11 11:12:48.750905
8019	290	8	5	5	0	0	2016	5	2016-02-11 11:12:48.764838	2016-02-11 11:12:48.764838
8020	290	9	0	0	0	0	2016	0	2016-02-11 11:12:48.779728	2016-02-11 11:12:48.779728
8017	290	6	84	0	0	0	2016	0	2016-02-11 11:12:48.736902	2016-02-11 11:12:48.79621
39893	156	9	0	0	0	0	2017	0	2017-01-02 04:46:59.487817	2017-01-02 04:46:59.487817
8023	291	3	7	7	0	0	2016	7	2016-02-18 12:25:14.362425	2016-02-18 12:25:14.362425
8024	291	4	7	7	0	0	2016	7	2016-02-18 12:25:14.38649	2016-02-18 12:25:14.38649
8027	291	7	7	7	0	0	2016	7	2016-02-18 12:25:14.42915	2016-02-18 12:25:14.42915
8029	291	9	0	0	0	0	2016	0	2016-02-18 12:25:14.458737	2016-02-18 12:25:14.458737
8026	291	6	84	0	0	0	2016	0	2016-02-18 12:25:14.415216	2016-02-18 12:25:14.506938
8032	292	3	7	7	0	0	2016	7	2016-02-18 12:32:30.575668	2016-02-18 12:32:30.575668
8033	292	4	7	7	0	0	2016	7	2016-02-18 12:32:30.599729	2016-02-18 12:32:30.599729
8035	292	6	84	84	0	0	2016	84	2016-02-18 12:32:30.647639	2016-02-18 12:32:30.647639
8038	292	9	0	0	0	0	2016	0	2016-02-18 12:32:30.690403	2016-02-18 12:32:30.690403
8036	292	7	7	0	0	0	2016	0	2016-02-18 12:32:30.661565	2016-02-18 12:32:30.707174
8040	293	2	15	15	0	0	2016	15	2016-02-25 10:51:06.997028	2016-02-25 10:51:06.997028
8041	293	3	7	7	0	0	2016	7	2016-02-25 10:51:07.010917	2016-02-25 10:51:07.010917
8042	293	4	7	7	0	0	2016	7	2016-02-25 10:51:07.025718	2016-02-25 10:51:07.025718
8047	293	9	0	0	0	0	2016	0	2016-02-25 10:51:07.097528	2016-02-25 10:51:07.097528
8044	293	6	84	0	0	0	2016	0	2016-02-25 10:51:07.054763	2016-02-25 10:51:07.114468
8050	294	3	7	7	0	0	2016	7	2016-02-25 10:51:36.173223	2016-02-25 10:51:36.173223
8051	294	4	7	7	0	0	2016	7	2016-02-25 10:51:36.197861	2016-02-25 10:51:36.197861
8022	291	2	15	11	4	0	2016	15	2016-02-18 12:25:14.34768	2016-12-26 09:32:03.655599
8120	302	1	5	5	0	0	2016	5	2016-03-24 04:17:42.331772	2016-03-24 04:17:42.331772
7737	250	5	5	3.5	1.5	0	2016	5	2015-12-29 09:53:05.722752	2016-12-27 05:55:41.256252
8030	292	1	5	1	4	0	2016	5	2016-02-18 12:32:30.528851	2016-12-22 04:39:28.736278
8046	293	8	5	4	1	0	2016	5	2016-02-25 10:51:07.082563	2016-09-26 06:03:04.787179
8066	296	1	5	3	2	0	2016	5	2016-03-03 07:43:03.409152	2016-09-29 05:05:01.024451
7698	249	2	15	0	15	0	2016	15	2015-12-29 09:53:05.012512	2016-12-19 04:32:30.084791
8045	293	7	7	7	0	0	2016	7	2016-02-25 10:51:07.068558	2016-05-30 10:24:53.040602
8049	294	2	15	0	15	0	2016	15	2016-02-25 10:51:36.158856	2016-11-30 13:56:36.557928
8021	291	1	5	2	3	0	2016	5	2016-02-18 12:25:14.330563	2016-12-09 02:37:51.696896
8037	292	8	5	3	2	0	2016	5	2016-02-18 12:32:30.676685	2016-09-07 04:42:01.220463
8028	291	8	5	-1	6	0	2016	5	2016-02-18 12:25:14.444014	2016-10-26 08:48:47.118159
8025	291	5	5	4.5	0.5	0	2016	5	2016-02-18 12:25:14.401642	2016-10-18 04:37:07.325708
8039	293	1	5	1	4	0	2016	5	2016-02-25 10:51:06.978661	2016-09-26 06:04:00.986078
8034	292	5	5	4	1	0	2016	5	2016-02-18 12:32:30.633965	2016-10-26 09:51:30.68026
8048	294	1	5	5	0	0	2016	5	2016-02-25 10:51:36.13806	2016-11-28 12:12:27.701557
8054	294	7	7	7	0	0	2016	7	2016-02-25 10:51:36.241412	2016-02-25 10:51:36.241412
8056	294	9	0	0	0	0	2016	0	2016-02-25 10:51:36.279461	2016-02-25 10:51:36.279461
8053	294	6	84	0	0	0	2016	0	2016-02-25 10:51:36.226713	2016-02-25 10:51:36.318497
8059	295	3	7	7	0	0	2016	7	2016-02-25 12:46:13.224834	2016-02-25 12:46:13.224834
8063	295	7	7	7	0	0	2016	7	2016-02-25 12:46:13.28162	2016-02-25 12:46:13.28162
8065	295	9	0	0	0	0	2016	0	2016-02-25 12:46:13.310519	2016-02-25 12:46:13.310519
8062	295	6	84	0	0	0	2016	0	2016-02-25 12:46:13.267662	2016-02-25 12:46:13.349399
8075	297	1	5	5	0	0	2016	5	2016-03-03 07:43:52.463708	2016-03-03 07:43:52.463708
8077	297	3	7	7	0	0	2016	7	2016-03-03 07:43:52.500994	2016-03-03 07:43:52.500994
8078	297	4	7	7	0	0	2016	7	2016-03-03 07:43:52.514947	2016-03-03 07:43:52.514947
8079	297	5	5	5	0	0	2016	5	2016-03-03 07:43:52.529852	2016-03-03 07:43:52.529852
8081	297	7	7	7	0	0	2016	7	2016-03-03 07:43:52.559267	2016-03-03 07:43:52.559267
8082	297	8	5	5	0	0	2016	5	2016-03-03 07:43:52.582924	2016-03-03 07:43:52.582924
8083	297	9	0	0	0	0	2016	0	2016-03-03 07:43:52.596873	2016-03-03 07:43:52.596873
8080	297	6	84	0	0	0	2016	0	2016-03-03 07:43:52.543748	2016-03-03 07:43:52.614944
8086	298	3	7	7	0	0	2016	7	2016-03-03 07:44:21.441968	2016-03-03 07:44:21.441968
8087	298	4	7	7	0	0	2016	7	2016-03-03 07:44:21.456943	2016-03-03 07:44:21.456943
8090	298	7	7	7	0	0	2016	7	2016-03-03 07:44:21.499708	2016-03-03 07:44:21.499708
8092	298	9	0	0	0	0	2016	0	2016-03-03 07:44:21.52859	2016-03-03 07:44:21.52859
8089	298	6	84	0	0	0	2016	0	2016-03-03 07:44:21.485761	2016-03-03 07:44:21.545181
8093	299	1	5	5	0	0	2016	5	2016-03-14 07:15:44.165927	2016-03-14 07:15:44.165927
8095	299	3	7	7	0	0	2016	7	2016-03-14 07:15:44.203417	2016-03-14 07:15:44.203417
8096	299	4	7	7	0	0	2016	7	2016-03-14 07:15:44.217364	2016-03-14 07:15:44.217364
8097	299	5	5	5	0	0	2016	5	2016-03-14 07:15:44.231259	2016-03-14 07:15:44.231259
8099	299	7	7	7	0	0	2016	7	2016-03-14 07:15:44.260007	2016-03-14 07:15:44.260007
8100	299	8	5	5	0	0	2016	5	2016-03-14 07:15:44.273919	2016-03-14 07:15:44.273919
8101	299	9	0	0	0	0	2016	0	2016-03-14 07:15:44.28887	2016-03-14 07:15:44.28887
8098	299	6	84	0	0	0	2016	0	2016-03-14 07:15:44.246102	2016-03-14 07:15:44.305335
39894	157	1	5	5	0	0	2017	5	2017-01-02 04:46:59.497816	2017-01-02 04:46:59.497816
8043	293	5	5	1	4	0	2016	5	2016-02-25 10:51:07.039715	2016-08-29 12:09:19.652497
39895	157	2	15	15	0	0	2017	15	2017-01-02 04:46:59.507867	2017-01-02 04:46:59.507867
8132	303	4	7	7	0	0	2016	7	2016-03-28 13:43:52.643823	2016-03-28 13:43:52.643823
8134	303	6	84	84	0	0	2016	84	2016-03-28 13:43:52.681322	2016-03-28 13:43:52.681322
8137	303	9	0	0	0	0	2016	0	2016-03-28 13:43:52.723124	2016-03-28 13:43:52.723124
8135	303	7	7	0	0	0	2016	0	2016-03-28 13:43:52.695826	2016-03-28 13:43:52.761463
39896	157	3	7	7	0	0	2017	7	2017-01-02 04:46:59.517812	2017-01-02 04:46:59.517812
8076	297	2	15	13	2	0	2016	15	2016-03-03 07:43:52.487116	2016-04-21 10:01:51.257042
39897	157	4	7	7	0	0	2017	7	2017-01-02 04:46:59.527912	2017-01-02 04:46:59.527912
8057	295	1	5	5	0	0	2016	5	2016-02-25 12:46:13.186931	2016-10-18 12:38:12.309448
8131	303	3	7	6	1	0	2016	7	2016-03-28 13:43:52.629239	2016-05-11 06:33:10.360395
8060	295	4	7	7	0	0	2016	7	2016-02-25 12:46:13.238812	2016-09-26 07:31:43.044407
8129	303	1	5	2	3	0	2016	5	2016-03-28 13:43:52.592384	2016-12-19 04:25:53.805832
8058	295	2	15	10	5	0	2016	15	2016-02-25 12:46:13.210114	2016-10-18 12:38:47.073416
7347	215	2	15	0	15	0	2016	15	2015-12-29 09:52:59.477618	2016-12-20 13:07:13.802863
8052	294	5	5	2	3	0	2016	5	2016-02-25 10:51:36.211774	2016-12-21 07:06:55.440321
39898	157	5	5	5	0	0	2017	5	2017-01-02 04:46:59.539392	2017-01-02 04:46:59.539392
8094	299	2	15	13	2	0	2016	15	2016-03-14 07:15:44.188717	2016-07-16 08:09:07.122816
8091	298	8	5	2	3	0	2016	5	2016-03-03 07:44:21.513645	2016-12-22 05:07:36.138526
8130	303	2	15	12	3	0	2016	15	2016-03-28 13:43:52.615763	2016-12-23 12:38:45.193473
8136	303	8	5	3	2	0	2016	5	2016-03-28 13:43:52.709504	2016-11-04 04:44:56.275288
8061	295	5	5	4	1	0	2016	5	2016-02-25 12:46:13.253735	2016-11-08 08:25:55.569863
8088	298	5	5	1	4	0	2016	5	2016-03-03 07:44:21.470848	2016-12-30 10:26:00.096451
7983	286	8	5	2	3	0	2016	5	2016-02-11 11:08:23.578529	2016-08-25 05:51:37.33069
39900	157	7	7	7	0	0	2017	7	2017-01-02 04:46:59.558435	2017-01-02 04:46:59.558435
39901	157	8	5	5	0	0	2017	5	2017-01-02 04:46:59.568469	2017-01-02 04:46:59.568469
39902	157	9	0	0	0	0	2017	0	2017-01-02 04:46:59.578098	2017-01-02 04:46:59.578098
39903	234	1	5	5	0	0	2017	5	2017-01-02 04:46:59.588669	2017-01-02 04:46:59.588669
8085	298	2	15	2	13	0	2016	15	2016-03-03 07:44:21.428197	2016-09-22 11:20:23.574691
39904	234	2	15	15	0	0	2017	15	2017-01-02 04:46:59.598338	2017-01-02 04:46:59.598338
39905	234	3	7	7	0	0	2017	7	2017-01-02 04:46:59.608337	2017-01-02 04:46:59.608337
8064	295	8	5	5	0	0	2016	5	2016-02-25 12:46:13.296509	2016-10-11 04:42:51.851836
39906	234	4	7	7	0	0	2017	7	2017-01-02 04:46:59.618238	2017-01-02 04:46:59.618238
8133	303	5	5	4	1	0	2016	5	2016-03-28 13:43:52.659464	2016-11-15 06:57:16.326886
8055	294	8	5	0	5	0	2016	5	2016-02-25 10:51:36.264548	2016-11-25 03:13:35.435784
8084	298	1	5	0	5	0	2016	5	2016-03-03 07:44:21.4052	2016-11-29 11:39:07.895795
39907	234	5	5	5	0	0	2017	5	2017-01-02 04:46:59.62897	2017-01-02 04:46:59.62897
39908	234	6	84	84	0	0	2017	84	2017-01-02 04:46:59.638166	2017-01-02 04:46:59.638166
39909	234	7	7	7	0	0	2017	7	2017-01-02 04:46:59.648157	2017-01-02 04:46:59.648157
39910	234	8	5	5	0	0	2017	5	2017-01-02 04:46:59.658174	2017-01-02 04:46:59.658174
39911	234	9	0	0	0	0	2017	0	2017-01-02 04:46:59.668226	2017-01-02 04:46:59.668226
39912	169	1	5	5	0	0	2017	5	2017-01-02 04:46:59.678185	2017-01-02 04:46:59.678185
39913	169	2	15	15	0	0	2017	15	2017-01-02 04:46:59.68823	2017-01-02 04:46:59.68823
39914	169	3	7	7	0	0	2017	7	2017-01-02 04:46:59.69824	2017-01-02 04:46:59.69824
8069	296	4	7	7	0	0	2016	7	2016-03-03 07:43:03.455809	2016-03-03 07:43:03.455809
8070	296	5	5	5	0	0	2016	5	2016-03-03 07:43:03.470808	2016-03-03 07:43:03.470808
8072	296	7	7	7	0	0	2016	7	2016-03-03 07:43:03.499739	2016-03-03 07:43:03.499739
8074	296	9	0	0	0	0	2016	0	2016-03-03 07:43:03.537734	2016-03-03 07:43:03.537734
8071	296	6	84	0	0	0	2016	0	2016-03-03 07:43:03.484764	2016-03-03 07:43:03.645869
7191	197	8	5	1	4	0	2016	5	2015-12-29 09:52:56.980989	2016-04-25 14:00:23.803076
39915	169	4	7	7	0	0	2017	7	2017-01-02 04:46:59.718359	2017-01-02 04:46:59.718359
39916	169	5	5	5	0	0	2017	5	2017-01-02 04:46:59.72832	2017-01-02 04:46:59.72832
39918	169	7	7	7	0	0	2017	7	2017-01-02 04:46:59.748408	2017-01-02 04:46:59.748408
39919	169	8	5	5	0	0	2017	5	2017-01-02 04:46:59.758483	2017-01-02 04:46:59.758483
8068	296	3	7	2	5	0	2016	7	2016-03-03 07:43:03.441896	2016-10-17 03:54:39.160318
8073	296	8	5	1	4	0	2016	5	2016-03-03 07:43:03.523829	2016-11-02 04:53:33.521225
8067	296	2	15	10	5	0	2016	15	2016-03-03 07:43:03.42726	2016-12-19 05:07:55.364094
39920	169	9	0	0	0	0	2017	0	2017-01-02 04:46:59.768464	2017-01-02 04:46:59.768464
39923	159	3	7	7	0	0	2017	7	2017-01-02 04:46:59.798581	2017-01-02 04:46:59.798581
39924	159	4	7	7	0	0	2017	7	2017-01-02 04:46:59.808568	2017-01-02 04:46:59.808568
39927	159	7	7	7	0	0	2017	7	2017-01-02 04:46:59.838632	2017-01-02 04:46:59.838632
39928	159	8	5	5	0	0	2017	5	2017-01-02 04:46:59.848673	2017-01-02 04:46:59.848673
39929	159	9	0	0	0	0	2017	0	2017-01-02 04:46:59.858677	2017-01-02 04:46:59.858677
39930	173	1	5	5	0	0	2017	5	2017-01-02 04:46:59.868774	2017-01-02 04:46:59.868774
39931	173	2	15	15	0	0	2017	15	2017-01-02 04:46:59.878718	2017-01-02 04:46:59.878718
39932	173	3	7	7	0	0	2017	7	2017-01-02 04:46:59.888784	2017-01-02 04:46:59.888784
39933	173	4	7	7	0	0	2017	7	2017-01-02 04:46:59.898803	2017-01-02 04:46:59.898803
39934	173	5	5	5	0	0	2017	5	2017-01-02 04:46:59.90884	2017-01-02 04:46:59.90884
39935	173	6	84	84	0	0	2017	84	2017-01-02 04:46:59.918853	2017-01-02 04:46:59.918853
39936	173	7	7	7	0	0	2017	7	2017-01-02 04:46:59.928882	2017-01-02 04:46:59.928882
39937	173	8	5	5	0	0	2017	5	2017-01-02 04:46:59.938863	2017-01-02 04:46:59.938863
39938	173	9	0	0	0	0	2017	0	2017-01-02 04:46:59.948978	2017-01-02 04:46:59.948978
39939	145	1	5	5	0	0	2017	5	2017-01-02 04:46:59.958949	2017-01-02 04:46:59.958949
39940	145	2	15	15	0	0	2017	15	2017-01-02 04:46:59.968988	2017-01-02 04:46:59.968988
39941	145	3	7	7	0	0	2017	7	2017-01-02 04:46:59.978986	2017-01-02 04:46:59.978986
39942	145	4	7	7	0	0	2017	7	2017-01-02 04:46:59.989257	2017-01-02 04:46:59.989257
39943	145	5	5	5	0	0	2017	5	2017-01-02 04:46:59.999051	2017-01-02 04:46:59.999051
39945	145	7	7	7	0	0	2017	7	2017-01-02 04:47:00.029239	2017-01-02 04:47:00.029239
39946	145	8	5	5	0	0	2017	5	2017-01-02 04:47:00.039178	2017-01-02 04:47:00.039178
39947	145	9	0	0	0	0	2017	0	2017-01-02 04:47:00.049232	2017-01-02 04:47:00.049232
39948	149	1	5	5	0	0	2017	5	2017-01-02 04:47:00.059258	2017-01-02 04:47:00.059258
39949	149	2	15	15	0	0	2017	15	2017-01-02 04:47:00.069284	2017-01-02 04:47:00.069284
39950	149	3	7	7	0	0	2017	7	2017-01-02 04:47:00.079304	2017-01-02 04:47:00.079304
39951	149	4	7	7	0	0	2017	7	2017-01-02 04:47:00.090564	2017-01-02 04:47:00.090564
39952	149	5	5	5	0	0	2017	5	2017-01-02 04:47:00.100094	2017-01-02 04:47:00.100094
39954	149	7	7	7	0	0	2017	7	2017-01-02 04:47:00.119902	2017-01-02 04:47:00.119902
39955	149	8	5	5	0	0	2017	5	2017-01-02 04:47:00.129869	2017-01-02 04:47:00.129869
39956	149	9	0	0	0	0	2017	0	2017-01-02 04:47:00.139929	2017-01-02 04:47:00.139929
39959	142	3	7	7	0	0	2017	7	2017-01-02 04:47:00.169716	2017-01-02 04:47:00.169716
39960	142	4	7	7	0	0	2017	7	2017-01-02 04:47:00.179776	2017-01-02 04:47:00.179776
39963	142	7	7	7	0	0	2017	7	2017-01-02 04:47:00.209817	2017-01-02 04:47:00.209817
39965	142	9	0	0	0	0	2017	0	2017-01-02 04:47:00.22986	2017-01-02 04:47:00.22986
39966	165	1	5	5	0	0	2017	5	2017-01-02 04:47:00.239934	2017-01-02 04:47:00.239934
39967	165	2	15	15	0	0	2017	15	2017-01-02 04:47:00.249924	2017-01-02 04:47:00.249924
39968	165	3	7	7	0	0	2017	7	2017-01-02 04:47:00.260421	2017-01-02 04:47:00.260421
39969	165	4	7	7	0	0	2017	7	2017-01-02 04:47:00.26998	2017-01-02 04:47:00.26998
39970	165	5	5	5	0	0	2017	5	2017-01-02 04:47:00.280011	2017-01-02 04:47:00.280011
39972	165	7	7	7	0	0	2017	7	2017-01-02 04:47:00.300003	2017-01-02 04:47:00.300003
39973	165	8	5	5	0	0	2017	5	2017-01-02 04:47:00.309974	2017-01-02 04:47:00.309974
39974	165	9	0	0	0	0	2017	0	2017-01-02 04:47:00.320116	2017-01-02 04:47:00.320116
39975	139	1	5	5	0	0	2017	5	2017-01-02 04:47:00.330101	2017-01-02 04:47:00.330101
39976	139	2	15	15	0	0	2017	15	2017-01-02 04:47:00.340175	2017-01-02 04:47:00.340175
39977	139	3	7	7	0	0	2017	7	2017-01-02 04:47:00.350169	2017-01-02 04:47:00.350169
39978	139	4	7	7	0	0	2017	7	2017-01-02 04:47:00.360198	2017-01-02 04:47:00.360198
39979	139	5	5	5	0	0	2017	5	2017-01-02 04:47:00.370208	2017-01-02 04:47:00.370208
39980	139	6	84	84	0	0	2017	84	2017-01-02 04:47:00.380268	2017-01-02 04:47:00.380268
39926	159	6	84	0	0	0	2017	0	2017-01-02 04:46:59.828586	2017-01-02 04:47:25.095642
39944	145	6	84	0	0	0	2017	0	2017-01-02 04:47:00.009105	2017-01-02 04:47:25.11569
39953	149	6	84	0	0	0	2017	0	2017-01-02 04:47:00.109936	2017-01-02 04:47:25.135666
39962	142	6	84	0	0	0	2017	0	2017-01-02 04:47:00.199825	2017-01-02 04:47:25.15575
39971	165	6	84	0	0	0	2017	0	2017-01-02 04:47:00.28994	2017-01-02 04:47:25.175811
39961	142	5	5	1.5	3.5	0	2017	5	2017-01-02 04:47:00.189773	2017-06-23 07:55:59.179331
39922	159	2	15	14	1	0	2017	15	2017-01-02 04:46:59.788546	2017-01-09 10:41:58.916627
39957	142	1	5	0	5	0	2017	5	2017-01-02 04:47:00.149782	2017-07-17 06:59:45.743826
39964	142	8	5	2	3	0	2017	5	2017-01-02 04:47:00.21988	2017-08-07 10:03:13.475362
39925	159	5	5	4	1	0	2017	5	2017-01-02 04:46:59.818582	2017-01-27 06:31:17.441
39921	159	1	5	3	2	0	2017	5	2017-01-02 04:46:59.7785	2017-01-31 04:25:18.032965
8104	300	3	7	7	0	0	2016	7	2016-03-14 10:58:15.531441	2016-03-14 10:58:15.531441
8105	300	4	7	7	0	0	2016	7	2016-03-14 10:58:15.545066	2016-03-14 10:58:15.545066
8108	300	7	7	7	0	0	2016	7	2016-03-14 10:58:15.587029	2016-03-14 10:58:15.587029
8110	300	9	0	0	0	0	2016	0	2016-03-14 10:58:15.615291	2016-03-14 10:58:15.615291
8107	300	6	84	0	0	0	2016	0	2016-03-14 10:58:15.573383	2016-03-14 10:58:15.63163
8113	301	3	7	7	0	0	2016	7	2016-03-16 06:16:22.806254	2016-03-16 06:16:22.806254
8114	301	4	7	7	0	0	2016	7	2016-03-16 06:16:22.820211	2016-03-16 06:16:22.820211
8116	301	6	84	84	0	0	2016	84	2016-03-16 06:16:22.849146	2016-03-16 06:16:22.849146
8119	301	9	0	0	0	0	2016	0	2016-03-16 06:16:22.902199	2016-03-16 06:16:22.902199
8117	301	7	7	0	0	0	2016	0	2016-03-16 06:16:22.86402	2016-03-16 06:16:22.9204
8140	304	3	7	7	0	0	2016	7	2016-03-31 09:15:54.661533	2016-03-31 09:15:54.661533
8141	304	4	7	7	0	0	2016	7	2016-03-31 09:15:54.675721	2016-03-31 09:15:54.675721
8143	304	6	84	84	0	0	2016	84	2016-03-31 09:15:54.71268	2016-03-31 09:15:54.71268
8146	304	9	0	0	0	0	2016	0	2016-03-31 09:15:54.754185	2016-03-31 09:15:54.754185
8144	304	7	7	0	0	0	2016	0	2016-03-31 09:15:54.727174	2016-03-31 09:15:54.77162
39982	139	8	5	5	0	0	2017	5	2017-01-02 04:47:00.400292	2017-01-02 04:47:00.400292
39983	139	9	0	0	0	0	2017	0	2017-01-02 04:47:00.480891	2017-01-02 04:47:00.480891
39984	143	1	5	5	0	0	2017	5	2017-01-02 04:47:00.491084	2017-01-02 04:47:00.491084
39985	143	2	15	15	0	0	2017	15	2017-01-02 04:47:00.504382	2017-01-02 04:47:00.504382
39986	143	3	7	7	0	0	2017	7	2017-01-02 04:47:00.510796	2017-01-02 04:47:00.510796
39987	143	4	7	7	0	0	2017	7	2017-01-02 04:47:00.521022	2017-01-02 04:47:00.521022
39988	143	5	5	5	0	0	2017	5	2017-01-02 04:47:00.530836	2017-01-02 04:47:00.530836
39990	143	7	7	7	0	0	2017	7	2017-01-02 04:47:00.550825	2017-01-02 04:47:00.550825
39991	143	8	5	5	0	0	2017	5	2017-01-02 04:47:00.560863	2017-01-02 04:47:00.560863
8138	304	1	5	0	5	0	2016	5	2016-03-31 09:15:54.615119	2016-09-21 05:13:24.056918
39992	143	9	0	0	0	0	2017	0	2017-01-02 04:47:00.570901	2017-01-02 04:47:00.570901
39993	163	1	5	5	0	0	2017	5	2017-01-02 04:47:00.580959	2017-01-02 04:47:00.580959
8142	304	5	5	4	1	0	2016	5	2016-03-31 09:15:54.689929	2016-09-29 07:49:19.525838
39996	163	4	7	7	0	0	2017	7	2017-01-02 04:47:00.610927	2017-01-02 04:47:00.610927
39999	163	7	7	7	0	0	2017	7	2017-01-02 04:47:00.641052	2017-01-02 04:47:00.641052
40000	163	8	5	1	4	0	2017	5	2017-01-02 04:47:00.65092	2017-08-17 11:56:39.729229
40001	163	9	0	0	0	0	2017	0	2017-01-02 04:47:00.681123	2017-01-02 04:47:00.681123
40002	146	1	5	5	0	0	2017	5	2017-01-02 04:47:00.690928	2017-01-02 04:47:00.690928
40003	146	2	15	15	0	0	2017	15	2017-01-02 04:47:00.701417	2017-01-02 04:47:00.701417
8102	300	1	5	1	4	0	2016	5	2016-03-14 10:58:15.494468	2016-11-22 04:51:17.030804
8111	301	1	5	2	3	0	2016	5	2016-03-16 06:16:22.768039	2016-11-22 08:18:29.811841
8118	301	8	5	2	3	0	2016	5	2016-03-16 06:16:22.878862	2016-11-29 04:39:50.551208
8106	300	5	5	4	1	0	2016	5	2016-03-14 10:58:15.558707	2016-12-07 04:28:21.659996
40004	146	3	7	7	0	0	2017	7	2017-01-02 04:47:00.711025	2017-01-02 04:47:00.711025
8139	304	2	15	6	9	0	2016	15	2016-03-31 09:15:54.638406	2016-12-15 09:26:13.606183
40005	146	4	7	7	0	0	2017	7	2017-01-02 04:47:00.721101	2017-01-02 04:47:00.721101
8109	300	8	5	0	5	0	2016	5	2016-03-14 10:58:15.600686	2016-12-20 05:16:04.619263
8103	300	2	15	0	15	0	2016	15	2016-03-14 10:58:15.516897	2016-12-20 05:18:03.453272
8112	301	2	15	10	5	0	2016	15	2016-03-16 06:16:22.792505	2017-01-02 09:35:09.647149
8145	304	8	5	3	2	0	2016	5	2016-03-31 09:15:54.740689	2016-12-30 10:58:47.534657
40006	146	5	5	5	0	0	2017	5	2017-01-02 04:47:00.762324	2017-01-02 04:47:00.762324
40007	146	6	84	84	0	0	2017	84	2017-01-02 04:47:00.771304	2017-01-02 04:47:00.771304
40009	146	8	5	5	0	0	2017	5	2017-01-02 04:47:00.791256	2017-01-02 04:47:00.791256
40010	146	9	0	0	0	0	2017	0	2017-01-02 04:47:00.801348	2017-01-02 04:47:00.801348
40011	155	1	5	5	0	0	2017	5	2017-01-02 04:47:00.83143	2017-01-02 04:47:00.83143
40012	155	2	15	15	0	0	2017	15	2017-01-02 04:47:00.841688	2017-01-02 04:47:00.841688
40013	155	3	7	7	0	0	2017	7	2017-01-02 04:47:00.851755	2017-01-02 04:47:00.851755
40014	155	4	7	7	0	0	2017	7	2017-01-02 04:47:00.86149	2017-01-02 04:47:00.86149
40015	155	5	5	5	0	0	2017	5	2017-01-02 04:47:00.871773	2017-01-02 04:47:00.871773
40017	155	7	7	7	0	0	2017	7	2017-01-02 04:47:00.891696	2017-01-02 04:47:00.891696
40018	155	8	5	5	0	0	2017	5	2017-01-02 04:47:00.901732	2017-01-02 04:47:00.901732
40019	155	9	0	0	0	0	2017	0	2017-01-02 04:47:00.911612	2017-01-02 04:47:00.911612
40022	131	3	7	7	0	0	2017	7	2017-01-02 04:47:00.941575	2017-01-02 04:47:00.941575
40023	131	4	7	7	0	0	2017	7	2017-01-02 04:47:00.951609	2017-01-02 04:47:00.951609
40025	131	6	84	84	0	0	2017	84	2017-01-02 04:47:00.971687	2017-01-02 04:47:00.971687
40008	146	7	7	0	0	0	2017	0	2017-01-02 04:47:00.781493	2017-01-02 04:47:22.534252
40026	131	7	7	0	0	0	2017	0	2017-01-02 04:47:00.981669	2017-01-02 04:47:22.55919
39989	143	6	84	0	0	0	2017	0	2017-01-02 04:47:00.540802	2017-01-02 04:47:25.195825
39998	163	6	84	0	0	0	2017	0	2017-01-02 04:47:00.63137	2017-01-02 04:47:25.216658
40016	155	6	84	0	0	0	2017	0	2017-01-02 04:47:00.881678	2017-01-02 04:47:25.236456
8115	301	5	5	3	2	0	2016	5	2016-03-16 06:16:22.835141	2017-01-02 09:34:20.437844
40021	131	2	15	1	14	0	2017	15	2017-01-02 04:47:00.931581	2017-01-10 04:52:05.749478
39995	163	3	7	4	3	0	2017	7	2017-01-02 04:47:00.600889	2017-08-07 05:22:50.433278
40024	131	5	5	3	2	0	2017	5	2017-01-02 04:47:00.961624	2017-03-30 12:06:22.617491
40027	131	8	5	4	1	0	2017	5	2017-01-02 04:47:00.99161	2017-02-28 05:58:08.645155
39997	163	5	5	2	3	0	2017	5	2017-01-02 04:47:00.622412	2017-07-21 05:18:51.872511
39994	163	2	15	0	15	0	2017	15	2017-01-02 04:47:00.590937	2017-08-17 12:05:02.168911
40020	131	1	5	1	4	0	2017	5	2017-01-02 04:47:00.921555	2017-03-27 08:17:30.160136
8121	302	2	15	15	0	0	2016	15	2016-03-24 04:17:42.35603	2016-03-24 04:17:42.35603
8122	302	3	7	7	0	0	2016	7	2016-03-24 04:17:42.370283	2016-03-24 04:17:42.370283
8124	302	5	5	5	0	0	2016	5	2016-03-24 04:17:42.397305	2016-03-24 04:17:42.397305
8125	302	6	84	84	0	0	2016	84	2016-03-24 04:17:42.41251	2016-03-24 04:17:42.41251
8127	302	8	5	5	0	0	2016	5	2016-03-24 04:17:42.448871	2016-03-24 04:17:42.448871
8128	302	9	0	0	0	0	2016	0	2016-03-24 04:17:42.463235	2016-03-24 04:17:42.463235
8126	302	7	7	0	0	0	2016	0	2016-03-24 04:17:42.435263	2016-03-24 04:17:42.500496
8148	305	2	15	15	0	0	2016	15	2016-04-12 09:41:02.467264	2016-04-12 09:41:02.467264
8149	305	3	7	7	0	0	2016	7	2016-04-12 09:41:02.477023	2016-04-12 09:41:02.477023
8150	305	4	7	7	0	0	2016	7	2016-04-12 09:41:02.487297	2016-04-12 09:41:02.487297
8151	305	5	5	5	0	0	2016	5	2016-04-12 09:41:02.497716	2016-04-12 09:41:02.497716
8153	305	7	7	7	0	0	2016	7	2016-04-12 09:41:02.517237	2016-04-12 09:41:02.517237
8154	305	8	5	5	0	0	2016	5	2016-04-12 09:41:02.527243	2016-04-12 09:41:02.527243
8155	305	9	0	0	0	0	2016	0	2016-04-12 09:41:02.537273	2016-04-12 09:41:02.537273
8152	305	6	84	0	0	0	2016	0	2016-04-12 09:41:02.507244	2016-04-12 09:41:02.557256
8158	306	3	7	7	0	0	2016	7	2016-04-22 05:08:47.593197	2016-04-22 05:08:47.593197
8159	306	4	7	7	0	0	2016	7	2016-04-22 05:08:47.603053	2016-04-22 05:08:47.603053
8161	306	6	84	84	0	0	2016	84	2016-04-22 05:08:47.622994	2016-04-22 05:08:47.622994
8164	306	9	0	0	0	0	2016	0	2016-04-22 05:08:47.653053	2016-04-22 05:08:47.653053
8162	306	7	7	0	0	0	2016	0	2016-04-22 05:08:47.633029	2016-04-22 05:08:47.667103
8167	307	3	7	7	0	0	2016	7	2016-04-22 05:09:17.517144	2016-04-22 05:09:17.517144
8168	307	4	7	7	0	0	2016	7	2016-04-22 05:09:17.527353	2016-04-22 05:09:17.527353
8171	307	7	7	7	0	0	2016	7	2016-04-22 05:09:17.557204	2016-04-22 05:09:17.557204
8173	307	9	0	0	0	0	2016	0	2016-04-22 05:09:17.577243	2016-04-22 05:09:17.577243
8170	307	6	84	0	0	0	2016	0	2016-04-22 05:09:17.54718	2016-04-22 05:09:17.590836
8165	307	1	5	3	2	0	2016	5	2016-04-22 05:09:17.499621	2016-12-16 04:51:42.894316
8197	310	6	84	0	0	0	2016	0	2016-05-07 05:27:23.965522	2016-05-07 05:27:24.015439
8169	307	5	5	4	1	0	2016	5	2016-04-22 05:09:17.537145	2016-10-10 09:05:49.531841
8147	305	1	5	4	1	0	2016	5	2016-04-12 09:41:02.450338	2016-04-28 10:05:07.792313
6311	98	1	5	0	5	0	2016	5	2015-12-29 09:52:43.170962	2016-05-03 04:35:09.485527
8176	308	3	7	7	0	0	2016	7	2016-05-04 11:04:12.848344	2016-05-04 11:04:12.848344
8177	308	4	7	7	0	0	2016	7	2016-05-04 11:04:12.914648	2016-05-04 11:04:12.914648
8178	308	5	5	5	0	0	2016	5	2016-05-04 11:04:12.92848	2016-05-04 11:04:12.92848
8180	308	7	7	7	0	0	2016	7	2016-05-04 11:04:12.948667	2016-05-04 11:04:12.948667
8181	308	8	5	5	0	0	2016	5	2016-05-04 11:04:12.958417	2016-05-04 11:04:12.958417
8182	308	9	0	0	0	0	2016	0	2016-05-04 11:04:12.968507	2016-05-04 11:04:12.968507
8179	308	6	84	0	0	0	2016	0	2016-05-04 11:04:12.938317	2016-05-04 11:04:12.981443
8185	309	3	7	7	0	0	2016	7	2016-05-07 05:26:49.509738	2016-05-07 05:26:49.509738
8186	309	4	7	7	0	0	2016	7	2016-05-07 05:26:49.519726	2016-05-07 05:26:49.519726
8189	309	7	7	7	0	0	2016	7	2016-05-07 05:26:49.549792	2016-05-07 05:26:49.549792
8190	309	8	5	5	0	0	2016	5	2016-05-07 05:26:49.559846	2016-05-07 05:26:49.559846
8191	309	9	0	0	0	0	2016	0	2016-05-07 05:26:49.569821	2016-05-07 05:26:49.569821
8188	309	6	84	0	0	0	2016	0	2016-05-07 05:26:49.539764	2016-05-07 05:26:49.5834
8194	310	3	7	7	0	0	2016	7	2016-05-07 05:27:23.935328	2016-05-07 05:27:23.935328
8195	310	4	7	7	0	0	2016	7	2016-05-07 05:27:23.945367	2016-05-07 05:27:23.945367
8198	310	7	7	7	0	0	2016	7	2016-05-07 05:27:23.975523	2016-05-07 05:27:23.975523
8202	311	2	15	15	0	0	2016	15	2016-05-07 05:27:43.49461	2016-05-07 05:27:43.49461
8203	311	3	7	7	0	0	2016	7	2016-05-07 05:27:43.504478	2016-05-07 05:27:43.504478
8204	311	4	7	7	0	0	2016	7	2016-05-07 05:27:43.514521	2016-05-07 05:27:43.514521
8205	311	5	5	5	0	0	2016	5	2016-05-07 05:27:43.524585	2016-05-07 05:27:43.524585
8207	311	7	7	7	0	0	2016	7	2016-05-07 05:27:43.544666	2016-05-07 05:27:43.544666
8208	311	8	5	5	0	0	2016	5	2016-05-07 05:27:43.554566	2016-05-07 05:27:43.554566
8209	311	9	0	0	0	0	2016	0	2016-05-07 05:27:43.564693	2016-05-07 05:27:43.564693
8206	311	6	84	0	0	0	2016	0	2016-05-07 05:27:43.534577	2016-05-07 05:27:43.584536
7914	276	2	15	3	12	0	2016	15	2015-12-29 09:53:08.612013	2016-12-29 06:19:55.664732
8123	302	4	7	7	0	0	2016	7	2016-03-24 04:17:42.383779	2016-05-10 10:23:20.216737
8172	307	8	5	1	4	0	2016	5	2016-04-22 05:09:17.567226	2016-12-27 07:19:58.818386
8156	306	1	5	3	2	0	2016	5	2016-04-22 05:08:47.574814	2016-08-31 11:32:37.737903
8196	310	5	5	1	4	0	2016	5	2016-05-07 05:27:23.955478	2016-12-16 05:25:24.154383
8201	311	1	5	4	1	0	2016	5	2016-05-07 05:27:43.479988	2016-07-05 12:26:44.987001
8192	310	1	5	0	5	0	2016	5	2016-05-07 05:27:23.916055	2016-12-26 03:42:31.031672
40028	131	9	0	0	0	0	2017	0	2017-01-02 04:47:01.001744	2017-01-02 04:47:01.001744
6954	176	5	5	0	5	0	2016	5	2015-12-29 09:52:53.465456	2016-12-22 12:26:57.077901
8184	309	2	15	12	3	0	2016	15	2016-05-07 05:26:49.499932	2016-12-29 09:49:02.562337
8174	308	1	5	1	4	0	2016	5	2016-05-04 11:04:12.821631	2016-08-08 06:41:24.788966
8175	308	2	15	14	1	0	2016	15	2016-05-04 11:04:12.838413	2016-08-26 04:42:51.773565
8183	309	1	5	4	1	0	2016	5	2016-05-07 05:26:49.484852	2016-11-22 06:08:04.879738
8199	310	8	5	1	4	0	2016	5	2016-05-07 05:27:23.985599	2016-10-25 13:45:26.136337
8187	309	5	5	5	0	0	2016	5	2016-05-07 05:26:49.529757	2016-09-14 04:22:47.874884
8160	306	5	5	3.5	1.5	0	2016	5	2016-04-22 05:08:47.613109	2016-12-26 09:28:03.341489
8166	307	2	15	10	5	0	2016	15	2016-04-22 05:09:17.507979	2016-12-27 07:19:11.621597
8157	306	2	15	8	7	0	2016	15	2016-04-22 05:08:47.58328	2016-12-12 04:52:29.612805
8163	306	8	5	3	2	0	2016	5	2016-04-22 05:08:47.642994	2016-10-18 03:22:06.640972
8193	310	2	15	1	14	0	2016	15	2016-05-07 05:27:23.925427	2016-12-13 06:54:22.849009
8200	310	9	0	0	0	0	2016	0	2016-05-07 05:27:23.995591	2016-05-07 05:27:23.995591
8212	312	3	7	7	0	0	2016	7	2016-05-20 07:50:55.755283	2016-05-20 07:50:55.755283
8213	312	4	7	7	0	0	2016	7	2016-05-20 07:50:55.765286	2016-05-20 07:50:55.765286
8216	312	7	7	7	0	0	2016	7	2016-05-20 07:50:55.795279	2016-05-20 07:50:55.795279
8217	312	8	5	5	0	0	2016	5	2016-05-20 07:50:55.805262	2016-05-20 07:50:55.805262
8218	312	9	0	0	0	0	2016	0	2016-05-20 07:50:55.815347	2016-05-20 07:50:55.815347
8215	312	6	84	0	0	0	2016	0	2016-05-20 07:50:55.785263	2016-05-20 07:50:55.828691
6023	45	1	5	3	2	0	2016	5	2015-12-29 09:52:38.327663	2016-05-24 05:15:38.314267
8269	318	6	84	0	0	0	2016	0	2016-06-10 11:24:02.922086	2016-06-10 11:24:02.982141
8211	312	2	15	14	1	0	2016	15	2016-05-20 07:50:55.745657	2016-07-22 05:48:02.098655
8210	312	1	5	1	4	0	2016	5	2016-05-20 07:50:55.729133	2016-07-13 07:23:37.526751
8219	313	1	5	5	0	0	2016	5	2016-06-03 07:53:00.495495	2016-06-03 07:53:00.495495
8220	313	2	15	15	0	0	2016	15	2016-06-03 07:53:00.544008	2016-06-03 07:53:00.544008
8221	313	3	7	7	0	0	2016	7	2016-06-03 07:53:00.553235	2016-06-03 07:53:00.553235
8222	313	4	7	7	0	0	2016	7	2016-06-03 07:53:00.563253	2016-06-03 07:53:00.563253
8223	313	5	5	5	0	0	2016	5	2016-06-03 07:53:00.57306	2016-06-03 07:53:00.57306
8225	313	7	7	7	0	0	2016	7	2016-06-03 07:53:00.593147	2016-06-03 07:53:00.593147
8226	313	8	5	5	0	0	2016	5	2016-06-03 07:53:00.603168	2016-06-03 07:53:00.603168
8227	313	9	0	0	0	0	2016	0	2016-06-03 07:53:00.613092	2016-06-03 07:53:00.613092
8224	313	6	84	0	0	0	2016	0	2016-06-03 07:53:00.583196	2016-06-03 07:53:00.62658
40029	158	1	5	5	0	0	2017	5	2017-01-02 04:47:01.011773	2017-01-02 04:47:01.011773
8230	314	3	7	7	0	0	2016	7	2016-06-07 07:32:28.781055	2016-06-07 07:32:28.781055
8231	314	4	7	7	0	0	2016	7	2016-06-07 07:32:28.791137	2016-06-07 07:32:28.791137
8232	314	5	5	5	0	0	2016	5	2016-06-07 07:32:28.832061	2016-06-07 07:32:28.832061
8234	314	7	7	7	0	0	2016	7	2016-06-07 07:32:28.872132	2016-06-07 07:32:28.872132
8235	314	8	5	5	0	0	2016	5	2016-06-07 07:32:28.881906	2016-06-07 07:32:28.881906
8236	314	9	0	0	0	0	2016	0	2016-06-07 07:32:28.892224	2016-06-07 07:32:28.892224
8233	314	6	84	0	0	0	2016	0	2016-06-07 07:32:28.861996	2016-06-07 07:32:28.905872
40030	158	2	15	15	0	0	2017	15	2017-01-02 04:47:01.021774	2017-01-02 04:47:01.021774
8238	315	2	15	15	0	0	2016	15	2016-06-07 09:24:19.033427	2016-06-07 09:24:19.033427
8239	315	3	7	7	0	0	2016	7	2016-06-07 09:24:19.043232	2016-06-07 09:24:19.043232
8240	315	4	7	7	0	0	2016	7	2016-06-07 09:24:19.053738	2016-06-07 09:24:19.053738
8242	315	6	84	84	0	0	2016	84	2016-06-07 09:24:19.073635	2016-06-07 09:24:19.073635
8245	315	9	0	0	0	0	2016	0	2016-06-07 09:24:19.103106	2016-06-07 09:24:19.103106
8243	315	7	7	0	0	0	2016	0	2016-06-07 09:24:19.083581	2016-06-07 09:24:19.116616
8246	316	1	5	5	0	0	2016	5	2016-06-08 05:21:55.597024	2016-06-08 05:21:55.597024
8247	316	2	15	15	0	0	2016	15	2016-06-08 05:21:55.610573	2016-06-08 05:21:55.610573
8248	316	3	7	7	0	0	2016	7	2016-06-08 05:21:55.62045	2016-06-08 05:21:55.62045
8249	316	4	7	7	0	0	2016	7	2016-06-08 05:21:55.630439	2016-06-08 05:21:55.630439
8250	316	5	5	5	0	0	2016	5	2016-06-08 05:21:55.641524	2016-06-08 05:21:55.641524
8252	316	7	7	7	0	0	2016	7	2016-06-08 05:21:55.661103	2016-06-08 05:21:55.661103
8253	316	8	5	5	0	0	2016	5	2016-06-08 05:21:55.671105	2016-06-08 05:21:55.671105
8254	316	9	0	0	0	0	2016	0	2016-06-08 05:21:55.68104	2016-06-08 05:21:55.68104
8251	316	6	84	0	0	0	2016	0	2016-06-08 05:21:55.651199	2016-06-08 05:21:55.695371
8256	317	2	15	15	0	0	2016	15	2016-06-09 09:26:17.963933	2016-06-09 09:26:17.963933
8257	317	3	7	7	0	0	2016	7	2016-06-09 09:26:17.973787	2016-06-09 09:26:17.973787
8258	317	4	7	7	0	0	2016	7	2016-06-09 09:26:17.983828	2016-06-09 09:26:17.983828
8259	317	5	5	5	0	0	2016	5	2016-06-09 09:26:17.993787	2016-06-09 09:26:17.993787
8261	317	7	7	7	0	0	2016	7	2016-06-09 09:26:18.013874	2016-06-09 09:26:18.013874
8262	317	8	5	5	0	0	2016	5	2016-06-09 09:26:18.024097	2016-06-09 09:26:18.024097
8263	317	9	0	0	0	0	2016	0	2016-06-09 09:26:18.033884	2016-06-09 09:26:18.033884
8260	317	6	84	0	0	0	2016	0	2016-06-09 09:26:18.003874	2016-06-09 09:26:18.047169
8266	318	3	7	7	0	0	2016	7	2016-06-10 11:24:02.891988	2016-06-10 11:24:02.891988
8267	318	4	7	7	0	0	2016	7	2016-06-10 11:24:02.902042	2016-06-10 11:24:02.902042
8268	318	5	5	5	0	0	2016	5	2016-06-10 11:24:02.912061	2016-06-10 11:24:02.912061
8270	318	7	7	7	0	0	2016	7	2016-06-10 11:24:02.932086	2016-06-10 11:24:02.932086
8271	318	8	5	5	0	0	2016	5	2016-06-10 11:24:02.942171	2016-06-10 11:24:02.942171
7976	286	1	5	1	4	0	2016	5	2016-02-11 11:08:23.428341	2016-06-14 06:32:32.330422
8283	320	2	15	15	0	0	2016	15	2016-06-15 12:22:34.631077	2016-06-15 12:22:34.631077
8284	320	3	7	7	0	0	2016	7	2016-06-15 12:22:34.640159	2016-06-15 12:22:34.640159
8285	320	4	7	7	0	0	2016	7	2016-06-15 12:22:34.650066	2016-06-15 12:22:34.650066
8286	320	5	5	5	0	0	2016	5	2016-06-15 12:22:34.660162	2016-06-15 12:22:34.660162
8288	320	7	7	7	0	0	2016	7	2016-06-15 12:22:34.680173	2016-06-15 12:22:34.680173
8289	320	8	5	5	0	0	2016	5	2016-06-15 12:22:34.690519	2016-06-15 12:22:34.690519
8290	320	9	0	0	0	0	2016	0	2016-06-15 12:22:34.700883	2016-06-15 12:22:34.700883
8214	312	5	5	4	1	0	2016	5	2016-05-20 07:50:55.775251	2016-07-21 06:52:00.412397
8229	314	2	15	13	2	0	2016	15	2016-06-07 07:32:28.771169	2016-10-24 09:00:50.147886
6240	31	2	15	1	14	0	2016	15	2015-12-29 09:52:42.09644	2016-10-21 08:06:42.009981
8244	315	8	5	2	3	0	2016	5	2016-06-07 09:24:19.093098	2016-12-19 06:42:21.105626
8282	320	1	5	3	2	0	2016	5	2016-06-15 12:22:34.621377	2016-11-02 05:09:30.731936
8265	318	2	15	14	1	0	2016	15	2016-06-10 11:24:02.882082	2016-12-22 06:49:49.275554
8241	315	5	5	1	4	0	2016	5	2016-06-07 09:24:19.063631	2016-12-23 07:09:34.302516
8264	318	1	5	1	4	0	2016	5	2016-06-10 11:24:02.869627	2016-12-22 06:51:06.375973
8272	318	9	0	0	0	0	2016	0	2016-06-10 11:24:02.952124	2016-06-10 11:24:02.952124
8274	319	2	15	15	0	0	2016	15	2016-06-15 12:22:17.74808	2016-06-15 12:22:17.74808
8275	319	3	7	7	0	0	2016	7	2016-06-15 12:22:17.757919	2016-06-15 12:22:17.757919
8276	319	4	7	7	0	0	2016	7	2016-06-15 12:22:17.767982	2016-06-15 12:22:17.767982
8277	319	5	5	5	0	0	2016	5	2016-06-15 12:22:17.777971	2016-06-15 12:22:17.777971
8279	319	7	7	7	0	0	2016	7	2016-06-15 12:22:17.7981	2016-06-15 12:22:17.7981
8280	319	8	5	5	0	0	2016	5	2016-06-15 12:22:17.808065	2016-06-15 12:22:17.808065
8281	319	9	0	0	0	0	2016	0	2016-06-15 12:22:17.818078	2016-06-15 12:22:17.818078
8278	319	6	84	0	0	0	2016	0	2016-06-15 12:22:17.788023	2016-06-15 12:22:17.831496
8292	321	2	15	15	0	0	2016	15	2016-06-15 12:22:48.665521	2016-06-15 12:22:48.665521
8293	321	3	7	7	0	0	2016	7	2016-06-15 12:22:48.675467	2016-06-15 12:22:48.675467
8294	321	4	7	7	0	0	2016	7	2016-06-15 12:22:48.685127	2016-06-15 12:22:48.685127
8295	321	5	5	5	0	0	2016	5	2016-06-15 12:22:48.695794	2016-06-15 12:22:48.695794
8297	321	7	7	7	0	0	2016	7	2016-06-15 12:22:48.715394	2016-06-15 12:22:48.715394
8298	321	8	5	5	0	0	2016	5	2016-06-15 12:22:48.725345	2016-06-15 12:22:48.725345
8299	321	9	0	0	0	0	2016	0	2016-06-15 12:22:48.735347	2016-06-15 12:22:48.735347
8296	321	6	84	0	0	0	2016	0	2016-06-15 12:22:48.705286	2016-06-15 12:22:48.755277
8301	322	2	15	15	0	0	2016	15	2016-06-15 12:23:00.264304	2016-06-15 12:23:00.264304
8302	322	3	7	7	0	0	2016	7	2016-06-15 12:23:00.274111	2016-06-15 12:23:00.274111
8303	322	4	7	7	0	0	2016	7	2016-06-15 12:23:00.284137	2016-06-15 12:23:00.284137
8304	322	5	5	5	0	0	2016	5	2016-06-15 12:23:00.294178	2016-06-15 12:23:00.294178
8306	322	7	7	7	0	0	2016	7	2016-06-15 12:23:00.314249	2016-06-15 12:23:00.314249
8307	322	8	5	5	0	0	2016	5	2016-06-15 12:23:00.324276	2016-06-15 12:23:00.324276
8308	322	9	0	0	0	0	2016	0	2016-06-15 12:23:00.334284	2016-06-15 12:23:00.334284
8305	322	6	84	0	0	0	2016	0	2016-06-15 12:23:00.304157	2016-06-15 12:23:00.347603
40031	158	3	7	7	0	0	2017	7	2017-01-02 04:47:01.031902	2017-01-02 04:47:01.031902
40032	158	4	7	7	0	0	2017	7	2017-01-02 04:47:01.041951	2017-01-02 04:47:01.041951
40033	158	5	5	5	0	0	2017	5	2017-01-02 04:47:01.052039	2017-01-02 04:47:01.052039
40035	158	7	7	7	0	0	2017	7	2017-01-02 04:47:01.072058	2017-01-02 04:47:01.072058
40047	171	1	5	2	3	0	2017	5	2017-01-02 04:47:01.197252	2017-07-11 12:27:42.358421
40036	158	8	5	5	0	0	2017	5	2017-01-02 04:47:01.08203	2017-01-02 04:47:01.08203
40037	158	9	0	0	0	0	2017	0	2017-01-02 04:47:01.092081	2017-01-02 04:47:01.092081
40038	164	1	5	5	0	0	2017	5	2017-01-02 04:47:01.102106	2017-01-02 04:47:01.102106
40039	164	2	15	15	0	0	2017	15	2017-01-02 04:47:01.112136	2017-01-02 04:47:01.112136
40040	164	3	7	7	0	0	2017	7	2017-01-02 04:47:01.122141	2017-01-02 04:47:01.122141
8273	319	1	5	1	4	0	2016	5	2016-06-15 12:22:17.736314	2016-12-31 06:35:38.26683
8291	321	1	5	1	4	0	2016	5	2016-06-15 12:22:48.65084	2017-01-02 03:53:02.099496
40041	164	4	7	7	0	0	2017	7	2017-01-02 04:47:01.132278	2017-01-02 04:47:01.132278
40042	164	5	5	5	0	0	2017	5	2017-01-02 04:47:01.142253	2017-01-02 04:47:01.142253
40044	164	7	7	7	0	0	2017	7	2017-01-02 04:47:01.162319	2017-01-02 04:47:01.162319
40045	164	8	5	5	0	0	2017	5	2017-01-02 04:47:01.172352	2017-01-02 04:47:01.172352
40046	164	9	0	0	0	0	2017	0	2017-01-02 04:47:01.18234	2017-01-02 04:47:01.18234
40049	171	3	7	7	0	0	2017	7	2017-01-02 04:47:01.222442	2017-01-02 04:47:01.222442
40050	171	4	7	7	0	0	2017	7	2017-01-02 04:47:01.232362	2017-01-02 04:47:01.232362
40053	171	7	7	7	0	0	2017	7	2017-01-02 04:47:01.262546	2017-01-02 04:47:01.262546
40056	174	1	5	5	0	0	2017	5	2017-01-02 04:47:01.302671	2017-01-02 04:47:01.302671
40057	174	2	15	15	0	0	2017	15	2017-01-02 04:47:01.312924	2017-01-02 04:47:01.312924
40058	174	3	7	7	0	0	2017	7	2017-01-02 04:47:01.326026	2017-01-02 04:47:01.326026
40059	174	4	7	7	0	0	2017	7	2017-01-02 04:47:01.342726	2017-01-02 04:47:01.342726
40060	174	5	5	5	0	0	2017	5	2017-01-02 04:47:01.359602	2017-01-02 04:47:01.359602
40061	174	6	84	84	0	0	2017	84	2017-01-02 04:47:01.372905	2017-01-02 04:47:01.372905
40062	174	7	7	7	0	0	2017	7	2017-01-02 04:47:01.382835	2017-01-02 04:47:01.382835
40063	174	8	5	5	0	0	2017	5	2017-01-02 04:47:01.392779	2017-01-02 04:47:01.392779
40064	174	9	0	0	0	0	2017	0	2017-01-02 04:47:01.402755	2017-01-02 04:47:01.402755
40065	148	1	5	5	0	0	2017	5	2017-01-02 04:47:01.412773	2017-01-02 04:47:01.412773
40066	148	2	15	15	0	0	2017	15	2017-01-02 04:47:01.422796	2017-01-02 04:47:01.422796
40067	148	3	7	7	0	0	2017	7	2017-01-02 04:47:01.432847	2017-01-02 04:47:01.432847
40068	148	4	7	7	0	0	2017	7	2017-01-02 04:47:01.443067	2017-01-02 04:47:01.443067
40069	148	5	5	5	0	0	2017	5	2017-01-02 04:47:01.453116	2017-01-02 04:47:01.453116
40034	158	6	84	0	0	0	2017	0	2017-01-02 04:47:01.062071	2017-01-02 04:47:25.256384
40043	164	6	84	0	0	0	2017	0	2017-01-02 04:47:01.152274	2017-01-02 04:47:25.276368
40052	171	6	84	0	0	0	2017	0	2017-01-02 04:47:01.252463	2017-01-02 04:47:25.296395
8300	322	1	5	1	4	0	2016	5	2016-06-15 12:23:00.254866	2017-01-02 05:30:40.310529
40048	171	2	15	5	10	0	2017	15	2017-01-02 04:47:01.212381	2017-08-07 05:28:26.580755
40054	171	8	5	3	2	0	2017	5	2017-01-02 04:47:01.278408	2017-03-28 13:09:07.188556
40055	171	9	1	0	1	0	2017	1	2017-01-02 04:47:01.292586	2017-04-13 04:57:20.808046
40051	171	5	5	1	4	0	2017	5	2017-01-02 04:47:01.242511	2017-07-31 08:42:53.244588
42271	416	2	15	15	0	0	2017	15	2017-07-03 10:49:00.186722	2017-07-03 10:49:00.186722
42272	416	3	7	7	0	0	2017	7	2017-07-03 10:49:00.196337	2017-07-03 10:49:00.196337
42273	416	4	7	7	0	0	2017	7	2017-07-03 10:49:00.206175	2017-07-03 10:49:00.206175
42274	416	5	5	5	0	0	2017	5	2017-07-03 10:49:00.21651	2017-07-03 10:49:00.21651
42275	416	6	84	84	0	0	2017	84	2017-07-03 10:49:00.226018	2017-07-03 10:49:00.226018
42277	416	8	5	5	0	0	2017	5	2017-07-03 10:49:00.24604	2017-07-03 10:49:00.24604
42270	416	1	5	4	1	0	2017	5	2017-07-03 10:49:00.177083	2017-08-07 09:15:27.68114
8287	320	6	84	0	0	0	2016	0	2016-06-15 12:22:34.670142	2016-06-15 12:22:34.714634
8374	330	3	7	4	3	0	2016	7	2016-08-09 04:51:50.885239	2016-12-26 05:25:58.434177
8310	323	2	15	15	0	0	2016	15	2016-07-29 09:43:00.238023	2016-07-29 09:43:00.238023
8311	323	3	7	7	0	0	2016	7	2016-07-29 09:43:00.248024	2016-07-29 09:43:00.248024
8312	323	4	7	7	0	0	2016	7	2016-07-29 09:43:00.258713	2016-07-29 09:43:00.258713
8313	323	5	5	5	0	0	2016	5	2016-07-29 09:43:00.268651	2016-07-29 09:43:00.268651
8315	323	7	7	7	0	0	2016	7	2016-07-29 09:43:00.288568	2016-07-29 09:43:00.288568
8316	323	8	5	5	0	0	2016	5	2016-07-29 09:43:00.298541	2016-07-29 09:43:00.298541
8317	323	9	0	0	0	0	2016	0	2016-07-29 09:43:00.308502	2016-07-29 09:43:00.308502
8314	323	6	84	0	0	0	2016	0	2016-07-29 09:43:00.278619	2016-07-29 09:43:00.328232
8319	324	2	15	15	0	0	2016	15	2016-08-08 10:27:25.876113	2016-08-08 10:27:25.876113
8320	324	3	7	7	0	0	2016	7	2016-08-08 10:27:25.88582	2016-08-08 10:27:25.88582
8321	324	4	7	7	0	0	2016	7	2016-08-08 10:27:25.8959	2016-08-08 10:27:25.8959
8324	324	7	7	7	0	0	2016	7	2016-08-08 10:27:25.92585	2016-08-08 10:27:25.92585
8326	324	9	0	0	0	0	2016	0	2016-08-08 10:27:25.945896	2016-08-08 10:27:25.945896
8323	324	6	84	0	0	0	2016	0	2016-08-08 10:27:25.915972	2016-08-08 10:27:25.959571
8328	325	2	15	15	0	0	2016	15	2016-08-08 10:28:15.740227	2016-08-08 10:28:15.740227
8329	325	3	7	7	0	0	2016	7	2016-08-08 10:28:15.750085	2016-08-08 10:28:15.750085
8330	325	4	7	7	0	0	2016	7	2016-08-08 10:28:15.760129	2016-08-08 10:28:15.760129
8332	325	6	84	84	0	0	2016	84	2016-08-08 10:28:15.78013	2016-08-08 10:28:15.78013
8334	325	8	5	5	0	0	2016	5	2016-08-08 10:28:15.800191	2016-08-08 10:28:15.800191
8335	325	9	0	0	0	0	2016	0	2016-08-08 10:28:15.810217	2016-08-08 10:28:15.810217
8333	325	7	7	0	0	0	2016	0	2016-08-08 10:28:15.790192	2016-08-08 10:28:15.82341
40070	148	6	84	84	0	0	2017	84	2017-01-02 04:47:01.463159	2017-01-02 04:47:01.463159
8337	326	2	15	15	0	0	2016	15	2016-08-08 10:28:31.148645	2016-08-08 10:28:31.148645
8338	326	3	7	7	0	0	2016	7	2016-08-08 10:28:31.15851	2016-08-08 10:28:31.15851
8339	326	4	7	7	0	0	2016	7	2016-08-08 10:28:31.169371	2016-08-08 10:28:31.169371
8340	326	5	5	5	0	0	2016	5	2016-08-08 10:28:31.179278	2016-08-08 10:28:31.179278
8341	326	6	84	84	0	0	2016	84	2016-08-08 10:28:31.189242	2016-08-08 10:28:31.189242
8343	326	8	5	5	0	0	2016	5	2016-08-08 10:28:31.209187	2016-08-08 10:28:31.209187
8344	326	9	0	0	0	0	2016	0	2016-08-08 10:28:31.21924	2016-08-08 10:28:31.21924
8342	326	7	7	0	0	0	2016	0	2016-08-08 10:28:31.199245	2016-08-08 10:28:31.233281
8346	327	2	15	15	0	0	2016	15	2016-08-08 10:28:48.712919	2016-08-08 10:28:48.712919
8347	327	3	7	7	0	0	2016	7	2016-08-08 10:28:48.722544	2016-08-08 10:28:48.722544
8348	327	4	7	7	0	0	2016	7	2016-08-08 10:28:48.732584	2016-08-08 10:28:48.732584
8349	327	5	5	5	0	0	2016	5	2016-08-08 10:28:48.742574	2016-08-08 10:28:48.742574
8350	327	6	84	84	0	0	2016	84	2016-08-08 10:28:48.752608	2016-08-08 10:28:48.752608
8352	327	8	5	5	0	0	2016	5	2016-08-08 10:28:48.772666	2016-08-08 10:28:48.772666
8353	327	9	0	0	0	0	2016	0	2016-08-08 10:28:48.853531	2016-08-08 10:28:48.853531
8351	327	7	7	0	0	0	2016	0	2016-08-08 10:28:48.762599	2016-08-08 10:28:48.899332
8355	328	2	15	15	0	0	2016	15	2016-08-08 10:29:21.304717	2016-08-08 10:29:21.304717
8356	328	3	7	7	0	0	2016	7	2016-08-08 10:29:21.314422	2016-08-08 10:29:21.314422
8357	328	4	7	7	0	0	2016	7	2016-08-08 10:29:21.324411	2016-08-08 10:29:21.324411
8358	328	5	5	5	0	0	2016	5	2016-08-08 10:29:21.3342	2016-08-08 10:29:21.3342
8359	328	6	84	84	0	0	2016	84	2016-08-08 10:29:21.344272	2016-08-08 10:29:21.344272
8361	328	8	5	5	0	0	2016	5	2016-08-08 10:29:21.364209	2016-08-08 10:29:21.364209
8362	328	9	0	0	0	0	2016	0	2016-08-08 10:29:21.374214	2016-08-08 10:29:21.374214
8360	328	7	7	0	0	0	2016	0	2016-08-08 10:29:21.354195	2016-08-08 10:29:21.387631
8364	329	2	15	15	0	0	2016	15	2016-08-08 10:29:35.851964	2016-08-08 10:29:35.851964
8365	329	3	7	7	0	0	2016	7	2016-08-08 10:29:35.860277	2016-08-08 10:29:35.860277
8366	329	4	7	7	0	0	2016	7	2016-08-08 10:29:35.87078	2016-08-08 10:29:35.87078
8367	329	5	5	5	0	0	2016	5	2016-08-08 10:29:35.880251	2016-08-08 10:29:35.880251
8368	329	6	84	84	0	0	2016	84	2016-08-08 10:29:35.890286	2016-08-08 10:29:35.890286
8370	329	8	5	5	0	0	2016	5	2016-08-08 10:29:35.910348	2016-08-08 10:29:35.910348
8371	329	9	0	0	0	0	2016	0	2016-08-08 10:29:35.920374	2016-08-08 10:29:35.920374
8369	329	7	7	0	0	0	2016	0	2016-08-08 10:29:35.900436	2016-08-08 10:29:35.94015
8373	330	2	15	15	0	0	2016	15	2016-08-09 04:51:50.875461	2016-08-09 04:51:50.875461
8375	330	4	7	7	0	0	2016	7	2016-08-09 04:51:50.895315	2016-08-09 04:51:50.895315
8377	330	6	84	84	0	0	2016	84	2016-08-09 04:51:50.91535	2016-08-09 04:51:50.91535
8379	330	8	5	5	0	0	2016	5	2016-08-09 04:51:50.935418	2016-08-09 04:51:50.935418
8309	323	1	5	4	1	0	2016	5	2016-07-29 09:43:00.21784	2016-12-29 03:36:46.847063
6078	95	2	15	0	15	0	2016	15	2015-12-29 09:52:39.238384	2016-09-01 07:34:44.913859
8345	327	1	5	0	5	0	2016	5	2016-08-08 10:28:48.579407	2016-10-24 06:01:17.96287
8331	325	5	5	4.5	0.5	0	2016	5	2016-08-08 10:28:15.77015	2016-09-27 05:14:21.407957
8325	324	8	5	4	1	0	2016	5	2016-08-08 10:27:25.935907	2016-10-10 15:31:55.005032
8322	324	5	5	3	2	0	2016	5	2016-08-08 10:27:25.905821	2016-11-21 06:36:04.619967
8327	325	1	5	1	4	0	2016	5	2016-08-08 10:28:15.728793	2016-12-30 03:55:44.293255
8354	328	1	5	1	4	0	2016	5	2016-08-08 10:29:21.289791	2016-12-27 05:52:45.185054
8372	330	1	5	0	5	0	2016	5	2016-08-09 04:51:50.855929	2016-11-07 09:34:12.100494
8381	331	1	5	1	4	0	2016	5	2016-08-09 04:52:45.128115	2016-12-21 11:29:29.876183
7974	285	8	5	1	4	0	2016	5	2016-02-01 09:53:35.136485	2016-12-12 05:43:43.714248
8318	324	1	5	2	3	0	2016	5	2016-08-08 10:27:25.860494	2016-12-22 07:22:42.296836
5919	70	5	5	2.5	2.5	0	2016	5	2015-12-29 09:52:36.692797	2016-12-27 05:42:57.566823
8363	329	1	5	3	2	0	2016	5	2016-08-08 10:29:35.839601	2016-12-29 07:11:13.086471
8380	330	9	0	0	0	0	2016	0	2016-08-09 04:51:50.94539	2016-08-09 04:51:50.94539
8378	330	7	7	0	0	0	2016	0	2016-08-09 04:51:50.925327	2016-08-09 04:51:50.958605
40071	148	7	7	7	0	0	2017	7	2017-01-02 04:47:01.473134	2017-01-02 04:47:01.473134
40072	148	8	5	5	0	0	2017	5	2017-01-02 04:47:01.4832	2017-01-02 04:47:01.4832
40073	148	9	0	0	0	0	2017	0	2017-01-02 04:47:01.493217	2017-01-02 04:47:01.493217
40074	147	1	5	5	0	0	2017	5	2017-01-02 04:47:01.503278	2017-01-02 04:47:01.503278
40075	147	2	15	15	0	0	2017	15	2017-01-02 04:47:01.51326	2017-01-02 04:47:01.51326
40076	147	3	7	7	0	0	2017	7	2017-01-02 04:47:01.523315	2017-01-02 04:47:01.523315
40077	147	4	7	7	0	0	2017	7	2017-01-02 04:47:01.533316	2017-01-02 04:47:01.533316
40078	147	5	5	5	0	0	2017	5	2017-01-02 04:47:01.543361	2017-01-02 04:47:01.543361
40079	147	6	84	84	0	0	2017	84	2017-01-02 04:47:01.553507	2017-01-02 04:47:01.553507
40081	147	8	5	5	0	0	2017	5	2017-01-02 04:47:01.573298	2017-01-02 04:47:01.573298
40082	147	9	0	0	0	0	2017	0	2017-01-02 04:47:01.583453	2017-01-02 04:47:01.583453
40083	126	1	5	5	0	0	2017	5	2017-01-02 04:47:01.593491	2017-01-02 04:47:01.593491
40084	126	2	15	15	0	0	2017	15	2017-01-02 04:47:01.6035	2017-01-02 04:47:01.6035
40085	126	3	7	7	0	0	2017	7	2017-01-02 04:47:01.614241	2017-01-02 04:47:01.614241
40086	126	4	7	7	0	0	2017	7	2017-01-02 04:47:01.624266	2017-01-02 04:47:01.624266
40087	126	5	5	5	0	0	2017	5	2017-01-02 04:47:01.634112	2017-01-02 04:47:01.634112
40088	126	6	84	84	0	0	2017	84	2017-01-02 04:47:01.644281	2017-01-02 04:47:01.644281
40089	126	7	7	7	0	0	2017	7	2017-01-02 04:47:01.654032	2017-01-02 04:47:01.654032
40090	126	8	5	5	0	0	2017	5	2017-01-02 04:47:01.664093	2017-01-02 04:47:01.664093
40091	126	9	0	0	0	0	2017	0	2017-01-02 04:47:01.673986	2017-01-02 04:47:01.673986
40094	176	3	7	7	0	0	2017	7	2017-01-02 04:47:01.704134	2017-01-02 04:47:01.704134
40095	176	4	7	7	0	0	2017	7	2017-01-02 04:47:01.714022	2017-01-02 04:47:01.714022
40097	176	6	84	84	0	0	2017	84	2017-01-02 04:47:01.734038	2017-01-02 04:47:01.734038
40100	176	9	0	0	0	0	2017	0	2017-01-02 04:47:01.764178	2017-01-02 04:47:01.764178
40101	182	1	5	5	0	0	2017	5	2017-01-02 04:47:01.774154	2017-01-02 04:47:01.774154
40102	182	2	15	15	0	0	2017	15	2017-01-02 04:47:01.784201	2017-01-02 04:47:01.784201
40103	182	3	7	7	0	0	2017	7	2017-01-02 04:47:01.794216	2017-01-02 04:47:01.794216
40104	182	4	7	7	0	0	2017	7	2017-01-02 04:47:01.804255	2017-01-02 04:47:01.804255
40105	182	5	5	5	0	0	2017	5	2017-01-02 04:47:01.814246	2017-01-02 04:47:01.814246
40107	182	7	7	7	0	0	2017	7	2017-01-02 04:47:01.834211	2017-01-02 04:47:01.834211
40108	182	8	5	5	0	0	2017	5	2017-01-02 04:47:01.844249	2017-01-02 04:47:01.844249
40109	182	9	0	0	0	0	2017	0	2017-01-02 04:47:01.854278	2017-01-02 04:47:01.854278
40110	192	1	5	5	0	0	2017	5	2017-01-02 04:47:01.864317	2017-01-02 04:47:01.864317
40111	192	2	15	15	0	0	2017	15	2017-01-02 04:47:01.87432	2017-01-02 04:47:01.87432
40112	192	3	7	7	0	0	2017	7	2017-01-02 04:47:01.884338	2017-01-02 04:47:01.884338
40113	192	4	7	7	0	0	2017	7	2017-01-02 04:47:01.894375	2017-01-02 04:47:01.894375
40114	192	5	5	5	0	0	2017	5	2017-01-02 04:47:01.904432	2017-01-02 04:47:01.904432
40116	192	7	7	7	0	0	2017	7	2017-01-02 04:47:01.924449	2017-01-02 04:47:01.924449
40117	192	8	5	5	0	0	2017	5	2017-01-02 04:47:01.934477	2017-01-02 04:47:01.934477
40118	192	9	0	0	0	0	2017	0	2017-01-02 04:47:01.944495	2017-01-02 04:47:01.944495
40119	183	1	5	5	0	0	2017	5	2017-01-02 04:47:01.954569	2017-01-02 04:47:01.954569
40120	183	2	15	15	0	0	2017	15	2017-01-02 04:47:01.964598	2017-01-02 04:47:01.964598
40121	183	3	7	7	0	0	2017	7	2017-01-02 04:47:01.974608	2017-01-02 04:47:01.974608
40122	183	4	7	7	0	0	2017	7	2017-01-02 04:47:01.98462	2017-01-02 04:47:01.98462
40123	183	5	5	5	0	0	2017	5	2017-01-02 04:47:01.994628	2017-01-02 04:47:01.994628
40125	183	7	7	7	0	0	2017	7	2017-01-02 04:47:02.014614	2017-01-02 04:47:02.014614
40126	183	8	5	5	0	0	2017	5	2017-01-02 04:47:02.024616	2017-01-02 04:47:02.024616
40127	183	9	0	0	0	0	2017	0	2017-01-02 04:47:02.034546	2017-01-02 04:47:02.034546
40128	200	1	5	5	0	0	2017	5	2017-01-02 04:47:02.044609	2017-01-02 04:47:02.044609
40129	200	2	15	15	0	0	2017	15	2017-01-02 04:47:02.054561	2017-01-02 04:47:02.054561
40130	200	3	7	7	0	0	2017	7	2017-01-02 04:47:02.068667	2017-01-02 04:47:02.068667
40131	200	4	7	7	0	0	2017	7	2017-01-02 04:47:02.085578	2017-01-02 04:47:02.085578
40132	200	5	5	5	0	0	2017	5	2017-01-02 04:47:02.094728	2017-01-02 04:47:02.094728
40134	200	7	7	7	0	0	2017	7	2017-01-02 04:47:02.114821	2017-01-02 04:47:02.114821
40135	200	8	5	5	0	0	2017	5	2017-01-02 04:47:02.124837	2017-01-02 04:47:02.124837
40136	200	9	0	0	0	0	2017	0	2017-01-02 04:47:02.134827	2017-01-02 04:47:02.134827
40137	204	1	5	5	0	0	2017	5	2017-01-02 04:47:02.144994	2017-01-02 04:47:02.144994
40138	204	2	15	15	0	0	2017	15	2017-01-02 04:47:02.154983	2017-01-02 04:47:02.154983
40139	204	3	7	7	0	0	2017	7	2017-01-02 04:47:02.186085	2017-01-02 04:47:02.186085
40140	204	4	7	7	0	0	2017	7	2017-01-02 04:47:02.216122	2017-01-02 04:47:02.216122
40141	204	5	5	5	0	0	2017	5	2017-01-02 04:47:02.224948	2017-01-02 04:47:02.224948
40143	204	7	7	7	0	0	2017	7	2017-01-02 04:47:02.245199	2017-01-02 04:47:02.245199
40098	176	7	7	0	0	0	2017	0	2017-01-02 04:47:01.744119	2017-01-02 04:47:22.599329
40106	182	6	84	0	0	0	2017	0	2017-01-02 04:47:01.824261	2017-01-02 04:47:25.316892
40115	192	6	84	0	0	0	2017	0	2017-01-02 04:47:01.914425	2017-01-02 04:47:25.336662
40124	183	6	84	0	0	0	2017	0	2017-01-02 04:47:02.004629	2017-01-02 04:47:25.356567
40133	200	6	84	0	0	0	2017	0	2017-01-02 04:47:02.105056	2017-01-02 04:47:25.376552
40142	204	6	84	0	0	0	2017	0	2017-01-02 04:47:02.235111	2017-01-02 04:47:25.396571
40099	176	8	5	0	5	0	2017	5	2017-01-02 04:47:01.754136	2017-08-10 14:07:19.630074
40092	176	1	5	4	1	0	2017	5	2017-01-02 04:47:01.684042	2017-06-14 04:42:19.588042
40093	176	2	15	10	5	0	2017	15	2017-01-02 04:47:01.694184	2017-08-10 14:07:05.461624
40096	176	5	5	3	2	0	2017	5	2017-01-02 04:47:01.724077	2017-06-16 05:40:10.20074
8382	331	2	15	15	0	0	2016	15	2016-08-09 04:52:45.140894	2016-08-09 04:52:45.140894
8383	331	3	7	7	0	0	2016	7	2016-08-09 04:52:45.151511	2016-08-09 04:52:45.151511
8384	331	4	7	7	0	0	2016	7	2016-08-09 04:52:45.161421	2016-08-09 04:52:45.161421
8385	331	5	5	5	0	0	2016	5	2016-08-09 04:52:45.171413	2016-08-09 04:52:45.171413
8386	331	6	84	84	0	0	2016	84	2016-08-09 04:52:45.273778	2016-08-09 04:52:45.273778
8388	331	8	5	5	0	0	2016	5	2016-08-09 04:52:45.301004	2016-08-09 04:52:45.301004
8389	331	9	0	0	0	0	2016	0	2016-08-09 04:52:45.311916	2016-08-09 04:52:45.311916
8387	331	7	7	0	0	0	2016	0	2016-08-09 04:52:45.291309	2016-08-09 04:52:45.326545
40144	204	8	5	5	0	0	2017	5	2017-01-02 04:47:02.255259	2017-01-02 04:47:02.255259
40145	204	9	0	0	0	0	2017	0	2017-01-02 04:47:02.26521	2017-01-02 04:47:02.26521
40146	191	1	5	5	0	0	2017	5	2017-01-02 04:47:02.275325	2017-01-02 04:47:02.275325
40147	191	2	15	15	0	0	2017	15	2017-01-02 04:47:02.374731	2017-01-02 04:47:02.374731
40148	191	3	7	7	0	0	2017	7	2017-01-02 04:47:02.406252	2017-01-02 04:47:02.406252
40149	191	4	7	7	0	0	2017	7	2017-01-02 04:47:02.415693	2017-01-02 04:47:02.415693
40150	191	5	5	5	0	0	2017	5	2017-01-02 04:47:02.426359	2017-01-02 04:47:02.426359
40152	191	7	7	7	0	0	2017	7	2017-01-02 04:47:02.446233	2017-01-02 04:47:02.446233
40153	191	8	5	5	0	0	2017	5	2017-01-02 04:47:02.456343	2017-01-02 04:47:02.456343
40154	191	9	0	0	0	0	2017	0	2017-01-02 04:47:02.466182	2017-01-02 04:47:02.466182
40155	180	1	5	5	0	0	2017	5	2017-01-02 04:47:02.47613	2017-01-02 04:47:02.47613
40156	180	2	15	15	0	0	2017	15	2017-01-02 04:47:02.486092	2017-01-02 04:47:02.486092
40157	180	3	7	7	0	0	2017	7	2017-01-02 04:47:02.496165	2017-01-02 04:47:02.496165
40158	180	4	7	7	0	0	2017	7	2017-01-02 04:47:02.506089	2017-01-02 04:47:02.506089
40159	180	5	5	5	0	0	2017	5	2017-01-02 04:47:02.516171	2017-01-02 04:47:02.516171
40160	180	6	84	84	0	0	2017	84	2017-01-02 04:47:02.526142	2017-01-02 04:47:02.526142
40161	180	7	7	7	0	0	2017	7	2017-01-02 04:47:02.536208	2017-01-02 04:47:02.536208
40162	180	8	5	5	0	0	2017	5	2017-01-02 04:47:02.546177	2017-01-02 04:47:02.546177
40163	180	9	0	0	0	0	2017	0	2017-01-02 04:47:02.556236	2017-01-02 04:47:02.556236
40164	201	1	5	5	0	0	2017	5	2017-01-02 04:47:02.566216	2017-01-02 04:47:02.566216
40165	201	2	15	15	0	0	2017	15	2017-01-02 04:47:02.576293	2017-01-02 04:47:02.576293
40166	201	3	7	7	0	0	2017	7	2017-01-02 04:47:02.586326	2017-01-02 04:47:02.586326
40167	201	4	7	7	0	0	2017	7	2017-01-02 04:47:02.596323	2017-01-02 04:47:02.596323
40168	201	5	5	5	0	0	2017	5	2017-01-02 04:47:02.606256	2017-01-02 04:47:02.606256
40169	201	6	84	84	0	0	2017	84	2017-01-02 04:47:02.616344	2017-01-02 04:47:02.616344
40171	201	8	5	5	0	0	2017	5	2017-01-02 04:47:02.636398	2017-01-02 04:47:02.636398
40172	201	9	0	0	0	0	2017	0	2017-01-02 04:47:02.646487	2017-01-02 04:47:02.646487
40173	190	1	5	5	0	0	2017	5	2017-01-02 04:47:02.656444	2017-01-02 04:47:02.656444
40174	190	2	15	15	0	0	2017	15	2017-01-02 04:47:02.666472	2017-01-02 04:47:02.666472
40175	190	3	7	7	0	0	2017	7	2017-01-02 04:47:02.676527	2017-01-02 04:47:02.676527
40176	190	4	7	7	0	0	2017	7	2017-01-02 04:47:02.686593	2017-01-02 04:47:02.686593
40177	190	5	5	5	0	0	2017	5	2017-01-02 04:47:02.696531	2017-01-02 04:47:02.696531
40179	190	7	7	7	0	0	2017	7	2017-01-02 04:47:02.716568	2017-01-02 04:47:02.716568
40180	190	8	5	5	0	0	2017	5	2017-01-02 04:47:02.726649	2017-01-02 04:47:02.726649
40181	190	9	0	0	0	0	2017	0	2017-01-02 04:47:02.736714	2017-01-02 04:47:02.736714
40185	198	4	7	7	0	0	2017	7	2017-01-02 04:47:02.776836	2017-01-02 04:47:02.776836
40186	198	5	5	5	0	0	2017	5	2017-01-02 04:47:02.786812	2017-01-02 04:47:02.786812
40188	198	7	7	7	0	0	2017	7	2017-01-02 04:47:02.80685	2017-01-02 04:47:02.80685
40190	198	9	0	0	0	0	2017	0	2017-01-02 04:47:02.826873	2017-01-02 04:47:02.826873
40193	196	3	7	7	0	0	2017	7	2017-01-02 04:47:02.856919	2017-01-02 04:47:02.856919
40194	196	4	7	7	0	0	2017	7	2017-01-02 04:47:02.866936	2017-01-02 04:47:02.866936
40195	196	5	5	5	0	0	2017	5	2017-01-02 04:47:02.877022	2017-01-02 04:47:02.877022
40197	196	7	7	7	0	0	2017	7	2017-01-02 04:47:02.897068	2017-01-02 04:47:02.897068
40199	196	9	0	0	0	0	2017	0	2017-01-02 04:47:02.917117	2017-01-02 04:47:02.917117
40200	184	1	5	5	0	0	2017	5	2017-01-02 04:47:02.9271	2017-01-02 04:47:02.9271
40201	184	2	15	15	0	0	2017	15	2017-01-02 04:47:02.937112	2017-01-02 04:47:02.937112
40202	184	3	7	7	0	0	2017	7	2017-01-02 04:47:02.947138	2017-01-02 04:47:02.947138
40203	184	4	7	7	0	0	2017	7	2017-01-02 04:47:02.957137	2017-01-02 04:47:02.957137
40204	184	5	5	5	0	0	2017	5	2017-01-02 04:47:02.967156	2017-01-02 04:47:02.967156
40206	184	7	7	7	0	0	2017	7	2017-01-02 04:47:02.987322	2017-01-02 04:47:02.987322
40207	184	8	5	5	0	0	2017	5	2017-01-02 04:47:02.997316	2017-01-02 04:47:02.997316
40208	184	9	0	0	0	0	2017	0	2017-01-02 04:47:03.007315	2017-01-02 04:47:03.007315
40209	175	1	5	5	0	0	2017	5	2017-01-02 04:47:03.017348	2017-01-02 04:47:03.017348
40210	175	2	15	15	0	0	2017	15	2017-01-02 04:47:03.027404	2017-01-02 04:47:03.027404
40151	191	6	84	0	0	0	2017	0	2017-01-02 04:47:02.43632	2017-01-02 04:47:25.416588
40178	190	6	84	0	0	0	2017	0	2017-01-02 04:47:02.706591	2017-01-02 04:47:25.436698
40187	198	6	84	0	0	0	2017	0	2017-01-02 04:47:02.79687	2017-01-02 04:47:25.456716
40196	196	6	84	0	0	0	2017	0	2017-01-02 04:47:02.887009	2017-01-02 04:47:25.476777
40205	184	6	84	0	0	0	2017	0	2017-01-02 04:47:02.97727	2017-01-02 04:47:25.496843
40191	196	1	5	2	3	0	2017	5	2017-01-02 04:47:02.836916	2017-07-18 04:54:46.272421
40192	196	2	15	9	6	0	2017	15	2017-01-02 04:47:02.846879	2017-07-07 13:42:03.62228
40183	198	2	15	6	9	0	2017	15	2017-01-02 04:47:02.756756	2017-07-27 11:41:14.416388
40182	198	1	5	3	2	0	2017	5	2017-01-02 04:47:02.746708	2017-02-21 05:58:29.138834
40189	198	8	5	3	2	0	2017	5	2017-01-02 04:47:02.817044	2017-08-17 11:38:31.342706
40184	198	3	7	3	4	0	2017	7	2017-01-02 04:47:02.76675	2017-07-24 12:15:30.160879
40198	196	8	5	3	2	0	2017	5	2017-01-02 04:47:02.90704	2017-08-16 04:58:46.159806
8391	332	2	15	15	0	0	2016	15	2016-08-09 07:04:39.21626	2016-08-09 07:04:39.21626
8392	332	3	7	7	0	0	2016	7	2016-08-09 07:04:39.226191	2016-08-09 07:04:39.226191
8393	332	4	7	7	0	0	2016	7	2016-08-09 07:04:39.236168	2016-08-09 07:04:39.236168
8394	332	5	5	5	0	0	2016	5	2016-08-09 07:04:39.24627	2016-08-09 07:04:39.24627
8395	332	6	84	84	0	0	2016	84	2016-08-09 07:04:39.256316	2016-08-09 07:04:39.256316
8397	332	8	5	5	0	0	2016	5	2016-08-09 07:04:39.277046	2016-08-09 07:04:39.277046
8398	332	9	0	0	0	0	2016	0	2016-08-09 07:04:39.287025	2016-08-09 07:04:39.287025
8396	332	7	7	0	0	0	2016	0	2016-08-09 07:04:39.267586	2016-08-09 07:04:39.302113
8399	333	1	5	5	0	0	2016	5	2016-08-17 07:14:07.263914	2016-08-17 07:14:07.263914
8401	333	3	7	7	0	0	2016	7	2016-08-17 07:14:07.28309	2016-08-17 07:14:07.28309
8402	333	4	7	7	0	0	2016	7	2016-08-17 07:14:07.293078	2016-08-17 07:14:07.293078
8403	333	5	5	5	0	0	2016	5	2016-08-17 07:14:07.303259	2016-08-17 07:14:07.303259
8405	333	7	7	7	0	0	2016	7	2016-08-17 07:14:07.323202	2016-08-17 07:14:07.323202
8406	333	8	5	5	0	0	2016	5	2016-08-17 07:14:07.333208	2016-08-17 07:14:07.333208
8407	333	9	0	0	0	0	2016	0	2016-08-17 07:14:07.343181	2016-08-17 07:14:07.343181
8404	333	6	84	0	0	0	2016	0	2016-08-17 07:14:07.31312	2016-08-17 07:14:07.356521
8408	334	1	5	5	0	0	2016	5	2016-08-19 10:47:42.100334	2016-08-19 10:47:42.100334
8409	334	2	15	15	0	0	2016	15	2016-08-19 10:47:42.111766	2016-08-19 10:47:42.111766
8410	334	3	7	7	0	0	2016	7	2016-08-19 10:47:42.121704	2016-08-19 10:47:42.121704
8411	334	4	7	7	0	0	2016	7	2016-08-19 10:47:42.131765	2016-08-19 10:47:42.131765
8412	334	5	5	5	0	0	2016	5	2016-08-19 10:47:42.141775	2016-08-19 10:47:42.141775
8414	334	7	7	7	0	0	2016	7	2016-08-19 10:47:42.161846	2016-08-19 10:47:42.161846
8415	334	8	5	5	0	0	2016	5	2016-08-19 10:47:42.171829	2016-08-19 10:47:42.171829
8416	334	9	0	0	0	0	2016	0	2016-08-19 10:47:42.181896	2016-08-19 10:47:42.181896
8413	334	6	84	0	0	0	2016	0	2016-08-19 10:47:42.151994	2016-08-19 10:47:42.201787
8417	335	1	5	5	0	0	2016	5	2016-08-19 10:48:06.162206	2016-08-19 10:48:06.162206
8418	335	2	15	15	0	0	2016	15	2016-08-19 10:48:06.172102	2016-08-19 10:48:06.172102
8419	335	3	7	7	0	0	2016	7	2016-08-19 10:48:06.181967	2016-08-19 10:48:06.181967
8420	335	4	7	7	0	0	2016	7	2016-08-19 10:48:06.191962	2016-08-19 10:48:06.191962
8421	335	5	5	5	0	0	2016	5	2016-08-19 10:48:06.201966	2016-08-19 10:48:06.201966
8423	335	7	7	7	0	0	2016	7	2016-08-19 10:48:06.222012	2016-08-19 10:48:06.222012
8424	335	8	5	5	0	0	2016	5	2016-08-19 10:48:06.232031	2016-08-19 10:48:06.232031
8425	335	9	0	0	0	0	2016	0	2016-08-19 10:48:06.242068	2016-08-19 10:48:06.242068
8422	335	6	84	0	0	0	2016	0	2016-08-19 10:48:06.211936	2016-08-19 10:48:06.255386
8426	336	1	5	5	0	0	2016	5	2016-08-19 10:48:27.059984	2016-08-19 10:48:27.059984
8427	336	2	15	15	0	0	2016	15	2016-08-19 10:48:27.075726	2016-08-19 10:48:27.075726
8428	336	3	7	7	0	0	2016	7	2016-08-19 10:48:27.084603	2016-08-19 10:48:27.084603
8429	336	4	7	7	0	0	2016	7	2016-08-19 10:48:27.094645	2016-08-19 10:48:27.094645
8430	336	5	5	5	0	0	2016	5	2016-08-19 10:48:27.104596	2016-08-19 10:48:27.104596
8432	336	7	7	7	0	0	2016	7	2016-08-19 10:48:27.124515	2016-08-19 10:48:27.124515
8433	336	8	5	5	0	0	2016	5	2016-08-19 10:48:27.134488	2016-08-19 10:48:27.134488
8434	336	9	0	0	0	0	2016	0	2016-08-19 10:48:27.144483	2016-08-19 10:48:27.144483
8431	336	6	84	0	0	0	2016	0	2016-08-19 10:48:27.114583	2016-08-19 10:48:27.158289
8435	337	1	5	5	0	0	2016	5	2016-08-19 10:49:11.638942	2016-08-19 10:49:11.638942
8436	337	2	15	15	0	0	2016	15	2016-08-19 10:49:11.655171	2016-08-19 10:49:11.655171
8437	337	3	7	7	0	0	2016	7	2016-08-19 10:49:11.665201	2016-08-19 10:49:11.665201
8438	337	4	7	7	0	0	2016	7	2016-08-19 10:49:11.675162	2016-08-19 10:49:11.675162
8439	337	5	5	5	0	0	2016	5	2016-08-19 10:49:11.685194	2016-08-19 10:49:11.685194
8441	337	7	7	7	0	0	2016	7	2016-08-19 10:49:11.705309	2016-08-19 10:49:11.705309
8442	337	8	5	5	0	0	2016	5	2016-08-19 10:49:11.715278	2016-08-19 10:49:11.715278
8443	337	9	0	0	0	0	2016	0	2016-08-19 10:49:11.725335	2016-08-19 10:49:11.725335
8440	337	6	84	0	0	0	2016	0	2016-08-19 10:49:11.695241	2016-08-19 10:49:11.738168
8444	338	1	5	5	0	0	2016	5	2016-08-19 10:51:07.09648	2016-08-19 10:51:07.09648
8445	338	2	15	15	0	0	2016	15	2016-08-19 10:51:07.113315	2016-08-19 10:51:07.113315
8446	338	3	7	7	0	0	2016	7	2016-08-19 10:51:07.123223	2016-08-19 10:51:07.123223
8447	338	4	7	7	0	0	2016	7	2016-08-19 10:51:07.133278	2016-08-19 10:51:07.133278
8448	338	5	5	5	0	0	2016	5	2016-08-19 10:51:07.143282	2016-08-19 10:51:07.143282
8450	338	7	7	7	0	0	2016	7	2016-08-19 10:51:07.163511	2016-08-19 10:51:07.163511
8451	338	8	5	5	0	0	2016	5	2016-08-19 10:51:07.173318	2016-08-19 10:51:07.173318
8452	338	9	0	0	0	0	2016	0	2016-08-19 10:51:07.183325	2016-08-19 10:51:07.183325
8449	338	6	84	0	0	0	2016	0	2016-08-19 10:51:07.153349	2016-08-19 10:51:07.203209
8376	330	5	5	4.5	0.5	0	2016	5	2016-08-09 04:51:50.905293	2016-08-29 08:51:47.215785
8454	339	2	15	15	0	0	2016	15	2016-08-29 10:22:29.933739	2016-08-29 10:22:29.933739
8455	339	3	7	7	0	0	2016	7	2016-08-29 10:22:29.943463	2016-08-29 10:22:29.943463
8456	339	4	7	7	0	0	2016	7	2016-08-29 10:22:29.953502	2016-08-29 10:22:29.953502
8457	339	5	5	5	0	0	2016	5	2016-08-29 10:22:29.963546	2016-08-29 10:22:29.963546
8459	339	7	7	7	0	0	2016	7	2016-08-29 10:22:29.983503	2016-08-29 10:22:29.983503
8460	339	8	5	5	0	0	2016	5	2016-08-29 10:22:29.993576	2016-08-29 10:22:29.993576
8458	339	6	84	0	0	0	2016	0	2016-08-29 10:22:29.973544	2016-08-29 10:22:30.033589
7575	253	5	5	4	1	0	2016	5	2015-12-29 09:53:02.970946	2016-12-05 04:56:17.640846
8471	341	1	5	4	1	0	2016	5	2016-09-01 10:28:33.287991	2016-12-23 09:25:25.254033
8453	339	1	5	0	5	0	2016	5	2016-08-29 10:22:29.918657	2016-12-01 05:00:41.601896
8400	333	2	15	12	3	0	2016	15	2016-08-17 07:14:07.273157	2016-12-07 09:31:31.987726
7077	196	2	15	2	13	0	2016	15	2015-12-29 09:52:55.301248	2016-12-27 05:21:37.022308
8461	339	9	0	0	0	0	2016	0	2016-08-29 10:22:30.003639	2016-08-29 10:22:30.003639
8463	340	2	15	15	0	0	2016	15	2016-09-01 10:09:29.768489	2016-09-01 10:09:29.768489
8464	340	3	7	7	0	0	2016	7	2016-09-01 10:09:29.778442	2016-09-01 10:09:29.778442
8465	340	4	7	7	0	0	2016	7	2016-09-01 10:09:29.78858	2016-09-01 10:09:29.78858
8467	340	6	84	84	0	0	2016	84	2016-09-01 10:09:29.808611	2016-09-01 10:09:29.808611
8470	340	9	0	0	0	0	2016	0	2016-09-01 10:09:29.838664	2016-09-01 10:09:29.838664
8468	340	7	7	0	0	0	2016	0	2016-09-01 10:09:29.818604	2016-09-01 10:09:29.851742
8481	342	2	15	15	0	0	2016	15	2016-09-01 10:31:06.954892	2016-09-01 10:31:06.954892
8482	342	3	7	7	0	0	2016	7	2016-09-01 10:31:06.964882	2016-09-01 10:31:06.964882
8486	342	7	7	7	0	0	2016	7	2016-09-01 10:31:07.005013	2016-09-01 10:31:07.005013
8488	342	9	0	0	0	0	2016	0	2016-09-01 10:31:07.025023	2016-09-01 10:31:07.025023
8485	342	6	84	0	0	0	2016	0	2016-09-01 10:31:06.994903	2016-09-01 10:31:07.038091
8499	344	2	15	15	0	0	2016	15	2016-09-01 10:33:31.12469	2016-09-01 10:33:31.12469
8500	344	3	7	7	0	0	2016	7	2016-09-01 10:33:31.134561	2016-09-01 10:33:31.134561
8501	344	4	7	7	0	0	2016	7	2016-09-01 10:33:31.144489	2016-09-01 10:33:31.144489
8503	344	6	84	84	0	0	2016	84	2016-09-01 10:33:31.164776	2016-09-01 10:33:31.164776
8506	344	9	0	0	0	0	2016	0	2016-09-01 10:33:31.19474	2016-09-01 10:33:31.19474
8504	344	7	7	0	0	0	2016	0	2016-09-01 10:33:31.174687	2016-09-01 10:33:31.207762
40211	175	3	7	7	0	0	2017	7	2017-01-02 04:47:03.037368	2017-01-02 04:47:03.037368
40212	175	4	7	7	0	0	2017	7	2017-01-02 04:47:03.04743	2017-01-02 04:47:03.04743
40213	175	5	5	5	0	0	2017	5	2017-01-02 04:47:03.057451	2017-01-02 04:47:03.057451
8462	340	1	5	4	1	0	2016	5	2016-09-01 10:09:29.75774	2016-10-20 06:54:15.634135
40215	175	7	7	7	0	0	2017	7	2017-01-02 04:47:03.07751	2017-01-02 04:47:03.07751
8505	344	8	5	4	1	0	2016	5	2016-09-01 10:33:31.184717	2016-10-28 06:34:17.637208
8237	315	1	5	1	4	0	2016	5	2016-06-07 09:24:19.015438	2016-11-02 05:18:19.67767
8498	344	1	5	3	2	0	2016	5	2016-09-01 10:33:31.117714	2016-11-02 06:36:51.394717
40216	175	8	5	5	0	0	2017	5	2017-01-02 04:47:03.087556	2017-01-02 04:47:03.087556
8483	342	4	7	5	2	0	2016	7	2016-09-01 10:31:06.974844	2016-11-18 13:41:28.038793
8502	344	5	5	4	1	0	2016	5	2016-09-01 10:33:31.154613	2016-11-22 09:25:19.676744
8480	342	1	5	4	1	0	2016	5	2016-09-01 10:31:06.945052	2016-11-22 11:42:15.433022
40217	175	9	0	0	0	0	2017	0	2017-01-02 04:47:03.097526	2017-01-02 04:47:03.097526
8466	340	5	5	4	1	0	