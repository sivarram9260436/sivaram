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
    office_contact_no character varying(255)
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
    updated_at timestamp without time zone
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

COPY employee_details (id, title, emp_name, last_name, middle_name, pan_number, pf_number, gender, martial_status, dob, date_of_join, role_id, contact_no, official_mailid, password, manager_mailid, empl_id, tl_mailid, created_at, updated_at, reset_password_code, active_resetcode, active, office_type_id, office_contact_no) FROM stdin;
40	Mr	Rabindra	Maharana	Kumar	AUXPM2023Q		Male	Married	1984-05-17	2007-11-24	1	9972933684	rabindrak@kreatio.com	a415ffe43a6712aa58dbaa92455af706	souvik@kreatio.com	12032		2012-09-18 10:18:07.784413	2015-04-22 11:04:20.466851	6f229ed8	true	Active	1	
73	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	abhinayc@kreatio.com	36d4ecf5ab9139daa0308a9f92f69253	\N	\N	\N	2012-09-21 09:27:08.301696	2013-04-24 08:45:07.911129	\N	false	Deactivated	1	\N
43	Mr	Ramesh	P				Male	Married	1981-09-14	2010-10-20	3	8147211726	rameshp@kreatio.com	77975e33d2088571de01e8f32d7b7a3a	bala@kreatio.com	KR11042		2012-09-18 10:20:31.426579	2013-04-24 08:46:12.888766	6f960d09	false	Deactivated	1	\N
83	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	niteshnayan@kreatio.com	284d4038bcc67dc18ce0b3c26ce56dc1	\N	\N	\N	2012-09-26 06:54:34.616953	2013-04-24 08:47:35.99948	\N	false	Deactivated	1	\N
62	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	akasha@kreatio.com	e344b69ebd9557a6fe9fa81350b7fc2d	\N	\N	\N	2012-09-18 10:45:37.167856	2014-03-26 06:45:16.14795	\N	false	Deactivated	1	\N
38	Mr	Praveen 	Pasala	Reddy			Male	Married	1981-03-20	\N	3	9986737436	praveen@kreatio.com	7ee604dcda94ec2f89ab6d99627ed81b	ramkumar@kreatio.com			2012-09-18 10:07:35.773916	2014-01-16 09:25:53.684267	\N	false	Deactivated	1	\N
60	Mr	upal	byani		BAXPB4116Q		Male	Unmarried	1989-11-29	2012-08-01	3	9739769114	upalb@kreatio.com	869aa5ce3f59eb8255e6eab17a1d2ee5	ramkumar@kreatio.com	12060	ramkumar@kreatio.com	2012-09-18 10:40:21.26252	2015-02-06 05:47:05.29165	\N	false	Active	1	
42	Mr	Ramesh	Kumar				Male	Unmarried	1989-08-31	2010-12-15	3	8951115696	rameshkumar@kreatio.com	d97604dedda42ea20d6713e253d3baa1	Senthilkumar@kreatio.com	12034	Senthilkumar@kreatio.com	2012-09-18 10:19:49.272885	2014-05-14 05:35:06.063321	ff2e9820	false	Deactivated	1	\N
53	Ms	Sivasankari					Female	Unmarried	1988-02-02	2010-08-25	3	9738233142	sivasankari@kreatio.com	4f9b5a64aec1089cf10f4ef39b13988f	ramkumar@kreatio.com		alamelu@kreatio.com	2012-09-18 10:31:56.263379	2013-09-10 14:26:06.015205	\N	false	Deactivated	1	\N
71	Mr	Girish	Krishna				Male	Married	1984-11-10	2012-01-01	3	+919686450946	girishk@kreatio.com	10d8cb123e79540345d54961d95a2980	deepak@kreatio.com	12015	deepak@kreatio.com	2012-09-21 09:18:33.588109	2015-02-06 05:16:45.202637	06767cd4	false	Active	1	
91	Mr	Rajesh	V	Kannan	BIQPR3277M	PY/BOM/60812/068	Male	Unmarried	1989-06-10	2012-11-26	3	9742665400	kannan@kreatio.com	d155f675a9487811096dc87597426f8e	senthilkumar@kreatio.com	12070	senthilkumar@kreatio.com	2012-11-27 06:22:58.728971	2015-10-09 10:05:23.661761	\N	false	Active	1	
10	Mr	Dhanabal	Thangavel				Male	Unmarried	1989-08-09	2011-09-07	3	9986571862	dhanabalt@kreatio.com	827ccb0eea8a706c4c34a16891f84e7b	bala@kreatio.com	KR11014	vijayaprakash@kreatio.com,senthilkumar@kreatio.com	2012-09-18 06:08:12.520257	2013-11-13 12:14:59.421962	61423b6f	true	Deactivated	1	\N
2	Mrs	hr	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	hr@kreatio.com	ceaca781044e072a236cb716d56012b3	\N	\N	\N	\N	2015-10-30 04:42:53.156835	2c570f6a	false	Active	1	\N
75	Mr	Kailash					Male	Unmarried	1988-07-20	2010-12-01	3	9538478119	kailashpatil@kreatio.com	94b9ab429cfe89ee39297f840212a669	ramkumar@kreatio.com			2012-09-21 09:29:24.411456	2013-12-06 10:12:48.695476	\N	false	Deactivated	1	\N
77	Mr	Arun	M	Kumar	avjpm7144d	PY/BOM/60812/004	Male	Married	1986-06-20	2008-06-23	1	9742479425	arunkumar@kreatio.com	dbe5994caaf37aaa163186c78ac5e4b9	dipti@webnish.com	12003	arif@webnish.com	2012-09-21 09:31:32.630534	2015-12-07 12:07:11.249223	\N	false	Active	2	
48	Mr	Senthil	Kumar		AITPJ7332F		Male	Unmarried	1983-04-24	2005-05-23	1	9902183388	senthilkumar@kreatio.com	28f2ee7d5773831deba15a779b6cf518	deepak@kreatio.com	12038		2012-09-18 10:26:53.685288	2015-07-27 10:17:33.05373	7478d284	false	Active	1	
81	Mrs	Chandrala 	Albur	Anandrao			Female	Married	1986-09-03	2012-08-09	2	9739103364	chandrala@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	souvik@kreatio.com			2012-09-24 05:53:44.098752	2013-07-24 07:05:21.236743	3a04e0a7	false	Deactivated	1	\N
47	Mr	Selva Chezhian					Male	Married	1987-06-30	2010-11-26	3	9535626928	selvachezhian@kreatio.com	53aac1f589797d36a4bc6e1c84e5a5d9	senthilkumar@kreatio.com		senthilkumar@kreatio.com	2012-09-18 10:26:13.287154	2014-04-28 07:07:29.919949	\N	false	Deactivated	1	\N
44	Mr	RAHUL	M.R		BKQPR2775c 		Male	Unmarried	1986-10-22	2012-04-09	3	8123533534	rahulmr@kreatio.com	4929bc8abeb552be5a427901ae0083dc	arif@webnish.com	12055		2012-09-18 10:21:16.54601	2015-06-12 10:33:06.946888	\N	false	Deactivated	1	\N
70	Mrs	Deepa	Adiga	Sukeerthi	BMIPS0745P	PY/BOM/60812/012	Female	Married	1984-10-25	2007-05-14	1	9986356028	deepa@kreatio.com	3c9b17349fb89456f1d1707b0d2d656d	souvik@kreatio.com	12012		2012-09-21 09:17:42.394437	2015-03-26 09:32:20.425533	9ab26e98	false	Active	1	
57	Mr	Vinod	Naik	D			Male	Married	1987-09-14	2011-01-25	3	9620730461	vinodnaik@kreatio.com	c335cf18bb4e31664a2004b6d6a8330c	vijayaprakash@kreatio.com		senthilkumar@kreatio.com	2012-09-18 10:36:46.288891	2013-09-11 12:29:31.016869	\N	false	Deactivated	1	\N
33	Mr	Michael	Wins		BDRPM7374L		Male	Unmarried	1987-04-27	2012-03-21	1	8050953164	michaelwins@kreatio.com	6c62425e5dcd9db48bca4753991d19e5	dipti@webnish.com	12053	arif@webnish.com	2012-09-18 10:00:45.853242	2015-12-22 11:18:20.901182	d0ee4524	true	Active	2	
30	Mr	Kavin	Murugesan	Kumar	CECPK6530F		Male	Unmarried	1988-09-04	2012-07-23	3	+918880802168	kavinkumar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	ramkumar@kreatio.com	12059	ramkumar@kreatio.com	2012-09-18 09:55:17.236775	2015-09-17 05:38:50.314825	6ba264a4	false	Active	1	
67	Mr	Bharath					Male	Married	1987-01-24	2010-12-17	3	9980772322	bharathr@kreatio.com	4616affdd46b8fe97e6a87de68667cb0	deepa@kreatio.com		souvik@kreatio.com	2012-09-21 09:14:57.334442	2014-01-16 09:25:53.646625	\N	false	Deactivated	1	\N
41	Mr	Rajeev 	Kumar		CEBPK9561D		Male	Unmarried	1988-11-12	2010-07-05	3	9731199433	rajeevk@kreatio.com	c1e8b3edd8c77fbe26d3655be0823201	Souvik@kreatio.com	12033	Souvik@kreatio.com	2012-09-18 10:18:56.565373	2015-12-23 06:13:05.412947	\N	false	Active	1	
94	Mr	Mohan Kumar 	C		BNZPM6854P	PY/BOM/60812/073	Male	Unmarried	1989-04-16	2012-11-28	3	8147908780	mohankumarc@kreatio.com	7e6a0547e24e24ee9948a3e869415c69	jagadeeswar@kreatio.com	12075	souvik@kreatio.com	2012-11-29 06:25:15.420828	2015-11-20 13:20:10.564731	\N	false	Active	1	
45	Mr	Ramkumar	P		AWOPP8668H		Male	Married	1982-06-25	2012-04-02	1	9845577115	ramkumar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	senthilkumar@kreatio.com	12054		2012-09-18 10:24:38.84823	2014-12-22 09:29:05.541366	f06e4fd0	false	Active	1	9900089703
76	Mr	Kannan	Doss		BFBPM4099G		Male	Unmarried	1989-05-11	2011-11-09	3	+918197707147	kannan1@kreatio.com	d155f675a9487811096dc87597426f8e	jagadeeswar@kreatio.com	KR11023	souvik@kreatio.com	2012-09-21 09:29:59.615896	2014-08-19 11:22:26.570025	65d4f700	false	Deactivated	1	\N
34	Mr	Nanthakumar					Male	Unmarried	1983-05-09	2011-08-08	3	9379163231	nantha@kreatio.com	77975e33d2088571de01e8f32d7b7a3a	ramkumar@kreatio.com			2012-09-18 10:01:26.858813	2014-01-16 09:25:53.711132	\N	false	Deactivated	1	\N
36	Mr	nitin					Male	Unmarried	1989-04-05	\N	3	9008422668	nitinnayan@kreatio.com	3006d843fceb1599f1b190168ddcd63d	ajaykumar@kreatio.com			2012-09-18 10:04:29.842316	2014-05-14 05:35:06.10538	\N	false	Deactivated	1	\N
55	Mr	Thendralvanan					Male	Unmarried	1987-01-08	2010-10-11	3	8884755007	thendralvanan@kreatio.com	ef4d44352caab8699e9de49a6f0cee81	sumitha@kreatio.com		souvik@kreatio.com	2012-09-18 10:35:07.691929	2015-01-30 10:27:24.606824	9a4faa93	false	Deactivated	1	\N
50	Mr	Srikanth	KR				Male	Unmarried	1987-06-29	2010-12-19	3	9886116318	srikanthkp@kreatio.com	79faf151e99526c9f4bdb215b98a3aa0	pankaj@kreatio.com			2012-09-18 10:29:45.930046	2013-04-24 08:43:41.995981	\N	false	Deactivated	1	\N
95	Mr	vishnu	prabhakar				Male	Unmarried	1990-06-11	2012-11-26	1	9632929186	vishnuprabhakar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	souvik@kreatio.com	12072	souvik@kreatio.com	2012-11-29 06:49:30.39028	2015-12-18 21:56:13.162362	f4a57554	false	Active	1	
32	Mr	Lal 	Sahab		AESPL5197H		Male	Married	1983-12-21	2010-09-27	3	8095202640	lalsahab@kreatio.com	8a098328d943a33ee84e897978f7a3d0	ramkumar@kreatio.com	KR11027	nantha@kreatio.com	2012-09-18 09:59:56.208265	2013-04-24 08:45:08.007464	\N	false	Deactivated	1	\N
97	Ms	Eisha	Sethi				Female	Unmarried	1983-10-21	2012-12-03	3	9538033703	eishasethi@kreatio.com	87ca7962c197ed7c9289b87add396c6f	souvik@kreatio.com			2012-12-03 06:19:09.47287	2013-09-10 14:26:06.149629	af2f17a2	false	Deactivated	1	\N
96	Mr	Vishal	Badave		AOLPB8602G		Male	Unmarried	1986-02-19	2012-11-26	3	8904875554	vishalmbadve@kreatio.com	e304a769d6be2014e9df89abf08cb1ca	javeedb@kreatio.com		souvik@kreatio.com	2012-11-29 08:56:08.23087	2013-04-24 08:45:08.055716	\N	false	Deactivated	1	\N
82	Mr	Bala	Loganathan	Chandran		PY/BOM/60812/007	Male	Married	1984-02-27	2007-03-20	1	9916669979	bala@kreatio.com	f70ce94302908f238959e38ebfe1782e	senthilkumar@kreatio.com	KR11008	senthilkumar@kreatio.com	2012-09-26 05:45:54.709137	2013-11-13 12:14:59.472598	c0d4b40d	false	Deactivated	1	\N
74	Mr	Javeed			ASQPR0693E		Male	Unmarried	1985-06-25	2011-03-01	1	9986884740	javeedb@kreatio.com	6694acd2499e403221897de2c78a7c5c	souvik@kreatio.com			2012-09-21 09:28:41.550078	2013-12-06 10:12:22.608501	6ad756db	false	Deactivated	1	\N
51	Mrs	Sumitha		k	BAOPK1938A		Female	Married	1986-02-18	2007-08-06	1	9480580571	sumitha@kreatio.com	304d4e202cc28498cf3492d9eb98baed	souvik@kreatio.com	12042	souvik@kreatio.com	2012-09-18 10:30:24.048634	2014-10-09 07:17:16.313131	\N	false	Active	1	
102	Mr	MADHAVAN			BBLPM4646P		Male	Unmarried	1986-07-31	2013-01-16	3	7411637638	madhavanr@kreatio.com	6fa235630452932fd60a7d09175b53ee	vishnuprabhakar@kreatio.com	12082	suhana@kreatio.com,gprabhu@kreatio.com	2013-01-17 06:55:03.49907	2015-11-03 11:25:14.829372	\N	false	Active	1	
52	Ms	Swapnil	Shilpa				Female	Married	1986-10-03	2009-07-01	3	9916389639	swapnil@kreatio.com	8792e0e9a62e7f99de85741e294cc68e	souvik@kreatio.com	12043		2012-09-18 10:31:11.854008	2015-08-12 06:50:54.893846	\N	false	Active	1	
29	Mr	Kingston			BSUPK7271E	PY/BOM/60812/022	Male	Unmarried	1989-05-09	2011-01-13	3	9902454743	kingston@kreatio.com	172ab87e9505db726b1621655bd813ed	arunkumar@kreatio.com	12022	arif@webnish.com	2012-09-18 09:49:34.352532	2015-12-01 10:00:46.226391	153e7f5c	false	Deactivated	2	
46	Mr	Samir	Pani	Kumar			Male	Unmarried	1987-01-15	2011-05-12	3	8884917339	samir@kreatio.com	0a240d47e2ff8a2fd770f947b6c724c8	swapnil@kreatio.com		souvik@kreatio.com	2012-09-18 10:25:31.076072	2014-02-20 07:35:21.845944	\N	false	Deactivated	1	\N
28	Mr	Karthikeyan	Siva				Male	Unmarried	1986-11-23	2010-11-24	3	9916839256	karthikeyan@kreatio.com	10b54d87f59230e49bf7b0a821de4db1	ramkumar@kreatio.com		nantha@kreatio.com	2012-09-18 09:48:54.162872	2014-03-11 08:48:51.987228	\N	false	Deactivated	1	\N
68	Mr	Gurudath	BN				Male	Unmarried	1989-03-30	2011-10-19	3	8105213004	gurudath@kreatio.com	533bc93d6feca6d7e6b5ee96158c0f82	suhana@kreatio.com	12009	suhana@kreatio.com	2012-09-21 09:15:53.529927	2015-01-30 10:23:26.917967	a44fbdca	false	Deactivated	1	
106	Mrs	priya	darshini.R				Female	Married	2013-06-06	2013-03-13	2	8722699214	priyap@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	 \tsouvik@kreatio.com			2013-03-14 05:54:40.620297	2013-09-10 14:29:05.157416	6aa68259	true	Deactivated	1	\N
100	Mr	venkatesh	chowdary				Male	Unmarried	1988-05-10	2013-01-07	3	9916289808	kvenkatesh@kreatio.com	433e9f75a647687387eb607c821c6fc8	rabindrak@kreatio.com		souvik@kreatio.com	2013-01-07 07:25:25.108863	2013-09-10 14:26:06.11129	b9514af9	false	Deactivated	1	\N
79	Mr	Vijendra	Kargudri	Shashikant	AHOPK8895L		Male	Unmarried	1966-11-18	2012-08-02	3	9538297328	vijendras@kreatio.com	c83ce9c1dd895a8ed6b39bb17f29af35	souvik@kreatio.com			2012-09-21 09:39:22.855522	2013-09-25 05:18:18.893274	\N	false	Deactivated	1	\N
80	Mr	prabu			BXMPP9488H		Male	Married	1989-08-11	2011-11-18	1	8951378379	gprabhu@kreatio.com	f70ce94302908f238959e38ebfe1782e	souvik@kreatio.com	12031		2012-09-21 10:02:54.07806	2015-12-18 10:20:05.595766	76f232ee	false	Deactivated	1	
85	Mrs	Alamelu			AHCPN9298A		Female	Married	1984-07-20	2007-08-16	3	9986739669	alamelu@kreatio.com	697e5a62f333214228a2ae5f23dfb345	ramkumar@kreatio.com			2012-10-04 09:59:05.666704	2013-12-19 11:47:29.748222	7ee54f61	false	Deactivated	1	\N
31	Mr	kumar	k		CNTPK2646E		Male	Unmarried	1987-09-19	2012-08-13	3	9742763167	kumark@kreatio.com	5eb3eeb3ae728c44226df75ae9e43a55	souvik@kreatio.com	12063	 jagadeeswar@kreatio.com	2012-09-18 09:58:23.392262	2014-08-01 07:32:47.616483	\N	false	Active	1	\N
103	Mr	Manivannan	A		BKAPM1928E		Male	Unmarried	1986-09-03	2013-01-10	3	8050786637	manivannan@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	bala@kreatio.com			2013-01-18 12:00:44.422042	2013-12-06 10:13:43.806607	\N	false	Deactivated	1	\N
56	Mr	Vijayaprakash	Balan		AFMPV8729A	PY/BOM/0024445/000/0000268	Male	Married	1981-04-08	2006-07-20	1	9886692957	vijayaprakash@kreatio.com	8235b0c21ca4a96f92238628fd2aca8a	senthilkumar@kreatio.com	KR11054	senthilkumar@kreatio.com	2012-09-18 10:35:55.910239	2013-12-24 11:43:30.7817	\N	false	Deactivated	1	\N
37	Mr	Prakash	Natarajan				Male	Unmarried	1986-07-10	2011-03-16	3	9535200641	prakash@kreatio.com	b3f2f9e72f767faf12c1a017eab991b7	antony@kreatio.com		souvik@kreatio.com	2012-09-18 10:06:53.244054	2014-04-28 07:07:29.956401	\N	false	Deactivated	1	\N
104	Mr	Muniraju	R				Male	Married	1983-07-10	2013-01-16	3	09620204510	munirajur@kreatio.com	e79ba52bad10bf6fe5705800f943a38f	arif@webnish.com		arif@webnish.com	2013-01-23 08:17:28.732791	2014-02-20 07:35:21.812799	c1b430fc	false	Deactivated	1	\N
72	Mr	Jagadeeswar	Devalla		ASZPD0566F		Male	Unmarried	1988-06-13	2011-01-17	3	8904461344	jagadeeswar@kreatio.com	cfbe7e96741be7f2aa8928e43eae313a	giri@kreatio.com	12017	souvik@kreatio.com	2012-09-21 09:19:33.274221	2015-05-28 06:01:57.764724	7d76d43a	true	Active	1	
49	Mr	Souvik	Mukherjee				Male	Married	1982-06-09	2012-03-01	1	9980755144	souvik@kreatio.com	7be38d2855d25fdeea58e00db0d84922	deepak@kreatio.com	12040		2012-09-18 10:29:03.617962	2015-08-31 09:21:24.505839	\N	false	Active	1	
89	Mr	Anudeep	D				Male	Unmarried	1988-05-10	2012-10-03	3	9739806119	anudeepd@kreatio.com	8e1c7a1a0c9217680b46d4c427250b42	pankaj@kreatio.com			2012-10-19 04:36:07.7215	2014-01-16 09:25:53.739325	\N	false	Deactivated	1	\N
98	Ms	sameena	s		DPOPS2605F	PY/BOM/60812/067	Female	Unmarried	1988-06-22	2012-11-26	3	7411551135	shaiksameena@kreatio.com	5824fb795d721f88e9a6a5ec161525e5	sumitha@kreatio.com	12069		2012-12-04 06:30:12.605344	2015-09-28 05:27:15.73988	\N	false	Active	1	
101	Mr	Ragavendaran	N		AKJPR9503Q		Male	Unmarried	1987-04-26	2013-01-17	3	7411466961	ragavendaran@kreatio.com	77a4a48f8d115a0cd69d50d30c5298d7	arunkumar@kreatio.com	12083	arif@webnish.com	2013-01-17 06:53:14.848724	2015-12-08 09:40:53.508322	f2f941a8	false	Deactivated	2	
90	Mr	AJAY	KARN	KUMAR	ASOPK0161E		Male	Married	1976-02-20	2006-08-01	1	+919900089707	ajaykumar@kreatio.com	6c10c5b62232e2af39dbfb39d8914861	kdeepak@kreatio.com	12001	kdeepak@kreatio.com	2012-11-02 09:54:22.436927	2015-12-01 05:36:46.813619	b2eb4069	false	Active	1	+919845949353
64	Mr	Dharmender 	Kumar		CRRPK1048J		Male	Unmarried	1987-03-07	2012-09-11	3	9008422668	dharmender@kreatio.com	213e3b3f95efc938ae842774ce5ce636	ajaykumar@kreatio.com	12065	ajaykumar@kreatio.com	2012-09-18 10:47:02.083314	2015-02-02 07:46:28.86368	3177d364	false	Active	1	
136	Mr	SHARANABASAPPA	NAMANE	SHRIMANTH			Male	Unmarried	1989-06-01	2013-08-26	3	9739616570	sharanabasappa@webnish.com	62763ded5709006ac36c88b552247ab9	chetanac@webnish.com		arif@webnish.com	2013-08-26 08:36:03.180857	2014-01-16 09:25:53.794239	\N	false	Deactivated	2	\N
111	Mr	Manjunath 	H.S				Male	Unmarried	1987-02-22	2013-04-08	3	  9901088112	manjunath@kreatio.com	cf7d1d3861a6e7e20cfe45b35bb68e2b	rabindrak@kreatio.com	12087		2013-04-08 09:10:48.443073	2015-02-06 05:19:58.048991	521fc727	true	Deactivated	1	\N
109	Ms	pavan	kadwadkar		DQBPK9818L		Female	Unmarried	1989-12-24	2013-03-26	3	8722477566	pavank@kreatio.com	141bc86dfd5c40e3cc37219c18d471ca	arunprasath@webnish.com	12090	arif@webnish.com	2013-04-03 04:46:58.732283	2015-06-22 11:14:36.844437	\N	false	Active	1	
35	Mr	Neetin	Kumar				Male	Married	1979-09-17	2007-09-04	1	9686448189	neetinkumar@kreatio.com	1c9e6b9f5f0fb2f87485f87c70b64674	senthilkumar@kreatio.com		souvik@kreatio.com	2012-09-18 10:02:37.157516	2013-04-24 09:24:53.142832	\N	false	Deactivated	1	\N
127	Mr	Manu	Dwivedi		CCFPM5596J		Male	Unmarried	1991-07-29	2013-06-26	3	8147326329	manud@kreatio.com	f3bbd7173a1257fbfe3f297766723afc	giri@kreatio.com	12096	senthilkumar@kreatio.com	2013-06-26 10:13:21.562659	2014-09-26 12:22:55.74888	f1b61b09	false	Deactivated	1	
123	Ms	Srisakthi	R				Female	Unmarried	1991-08-30	2013-06-24	3	9003652224	srisakthi@kreatio.com	26588e932c7ccfa1df309280702fe1b5	senthilkumar@kreatio.com			2013-06-24 07:31:19.075977	2014-06-23 11:04:49.904111	\N	false	Deactivated	1	\N
117	Ms	Chetana	C		ASJPC4387P		Female	Married	1990-06-18	2013-05-02	3	9901308914	chetanac@kreatio.com	92d748ffb43efaa04082b51420f2ed21	michaelwins@kreatio.com	12089	 arif@webnish.com	2013-05-02 09:12:37.289794	2015-02-03 03:50:18.955974	\N	false	Active	1	
118	Mr	Arif	Imam		AAWPI3472Q		Male	Married	1970-10-16	2013-05-27	1	09620204513	arif@webnish.com	0f4c639894a6bbdefd65b7b884b2ed40	dipti@webnish.com	12092		2013-05-30 07:14:42.818522	2015-12-18 06:28:38.299158	\N	false	Deactivated	2	
121	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	senthil@kreatio.com	d00c31e00c24466aa156fe7d05181e57	\N	\N	\N	2013-06-19 09:59:20.54319	2013-12-06 10:16:33.346069	\N	false	Deactivated	1	\N
116	Mrs	Anupama	Ankalagi				Male	Married	1983-06-04	2013-04-15	3	9480764214	anupama@kreatio.com	d01a2e82d9ba8408b9b1010dd7987be2	vijendras@kreatio.com		vijendras@kreatio.com	2013-04-15 09:21:40.543686	2013-09-17 10:02:08.182642	6a8cf96e	false	Deactivated	1	\N
129	Mr	fazuluddin	farook	mohammed			Male	Unmarried	1992-06-12	2013-07-01	3	9900751572	fazuluddin@kreatio.com	dc22027617228a37b1e61a264a40abfa	rameshkumar@kreatio.com			2013-07-02 04:24:24.754694	2013-12-06 10:11:50.257607	\N	false	Deactivated	1	\N
119	Mrs	Sujatha					Male	Married	1976-09-10	2013-06-10	3	9845142060	sujatha@kreatio.com	ad4ed9220f5fb220f1fcf64723a90efa	arif@webnish.com		arif@webnish.com	2013-06-11 05:21:56.00172	2013-10-03 06:53:20.703537	\N	false	Deactivated	1	\N
134	Mr	KUMAR	MANISH		CJIPK3462P		Male	Unmarried	1988-02-20	1988-08-14	3	+918050970828	manish@webnish.com	2277ba2700fa2f336466b4d3cd9a2b67	arunkumar@kreatio.com	12103	arif@webnish.com	2013-08-14 06:53:08.479141	2015-04-24 04:58:02.988401	22ffbdd1	false	Active	2	
128	Ms	swathi hk			DFEPS5994M		Female	Unmarried	1990-08-21	2013-06-27	3	7411219203	swathi@kreatio.com	ac28b0c8090ca9983ab1fec417fee707	gprabhu@kreatio.com	12097	senthilkumar@kreatio.com	2013-06-27 11:40:50.474097	2015-06-15 10:58:28.893733	8d5117f3	true	Deactivated	1	
112	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mallikarjunr@webnish.com	21478d26f6c79ab900d0375d42f4ea02	\N	\N	\N	2013-04-09 10:58:23.567259	2014-01-16 09:25:53.552546	\N	false	Deactivated	2	\N
78	Mrs	Chaya					Female	Married	1987-11-04	2011-01-20	3	9483961534	chaya@kreatio.com	77975e33d2088571de01e8f32d7b7a3a	arif@webnish.com		arif@webnish.com	2012-09-21 09:33:00.442289	2013-10-03 06:53:56.325804	5523124c	false	Deactivated	1	\N
132	Mr	Vinay	HS				Male	Unmarried	1990-05-28	2013-07-15	3	9739946143	vinayhs@kreatio.com	bfa6fd630165dff7ea1cd1969a73fd0c	rabindrak@kreatio.com			2013-07-15 09:49:27.000321	2013-11-04 09:31:53.5508	\N	false	Deactivated	1	\N
133	Mr	Tamilarasu	arasu		ARXPT3505F		Male	Unmarried	1992-01-27	2013-08-01	3	8867499695	tamilarasu@webnish.com	dca501909c97dfbe4dac37d037aebead	arunkumar@kreatio.com	12104		2013-08-01 09:37:27.1562	2015-02-05 04:03:28.813644	\N	false	Active	2	
135	Mrs	kajal	Bhutoria 		BNBPM7194J		Male	Married	1990-12-20	2013-08-26	3	8029821066	kajal@webnish.com	d9455a622330a5095c7bb5bc5f7372f3	sujatha@webnish.com		arif@webnish.com	2013-08-26 06:46:08.808243	2015-06-29 06:28:18.234521	\N	false	Deactivated	2	\N
130	Mr	Tamil Eniyan D					Male	Unmarried	1992-04-02	2013-07-01	3	+919591893421	tamileniyan@kreatio.com	fb36314dcd153965b031809e252f5e75	vijayaprakash@kreatio.com		Senthilkumar@kreatio.com	2013-07-02 04:27:39.428667	2013-12-06 10:15:18.476097	\N	false	Deactivated	1	\N
137	Ms	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	anita	272cdaf4b3ae8cc0c766c1989ca2aa8e	\N	\N	\N	2013-09-10 06:43:02.778163	2013-09-10 06:47:55.139402	\N	false	Deactivated	1	\N
63	Mr	Umesh		Balasubramanyam	AAYPU8129J	PY/BOM/60812/064	Male	Unmarried	1982-12-28	2012-09-07	3	9620204509	umeshb@kreatio.com	8d9d2695d4345cdd3fd11c9078545ade	vishnu@kreatio.com	12064		2012-09-18 10:46:21.061395	2015-04-27 06:20:35.127735	72d31b0d	false	Active	1	08032568466
110	Ms	chethana	ht				Female	Unmarried	1989-12-09	2013-04-08	3	7829664550	chethana@kreatio.com	538a0d6740b31353605af99845bc59a2	rabindrak@kreatio.com			2013-04-08 09:10:19.28683	2013-09-10 14:27:40.931247	\N	false	Deactivated	1	\N
122	Mrs	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	manali@kreatio.com	58572dc40ec04534f764b5783e8d3c9d	\N	\N	\N	2013-06-20 13:05:14.587678	2013-10-03 06:56:32.276423	\N	false	Deactivated	1	\N
114	Mr	Saleem	Khan C H				Male	Unmarried	1989-05-03	2013-02-11	3	9880003649	saleemkhan@webnish.com	a91ffb7e326e113ae085e51e17281719	eishasethi@kreatio.com		arif@webnish.com	2013-04-09 10:59:34.371893	2014-01-16 09:25:53.604809	\N	false	Deactivated	2	\N
138	Ms	Anita	Ratha				Female	Unmarried	1989-07-10	2013-09-04	2	7411837929	anita@kreatio.com	788eb80664c558236791b9260d52e2e3	souvik@kreatio.com			2013-09-10 06:43:47.883702	2014-05-16 09:26:49.088926	\N	false	Deactivated	1	\N
108	Mrs	Manjula					Female	Married	1985-11-09	2013-03-14	3	9591881232	manjulak@kreatio.com	62457d6f8cf0e71d686b8f56c63f325f	souvik@kreatio.com	12085		2013-03-28 10:08:17.683535	2015-09-02 10:12:04.340731	\N	false	Deactivated	1	9620204508
120	Mr	Gupta					Male	Unmarried	1987-06-06	2013-07-10	3	9986728620	guptap@kreatio.com	de1a6736858820104d5e5edb3773b2be	rabindrak@kreatio.com			2013-06-11 05:54:47.80983	2014-04-28 07:07:29.871082	c824fc04	false	Deactivated	1	\N
125	Mr	Rituraj			BFAPR8899L		Male	Unmarried	1989-10-29	2013-06-26	3	9449614380	rituraj@kreatio.com	4f2854f62ceeec67194ee9acce3a70c3	giri@kreatio.com	12095	giri@kreatio.com	2013-06-26 09:49:14.357889	2014-09-09 04:46:44.387101	ca2e9db9	false	Deactivated	1	
113	Mr	Mallikarjuna	R				Male	Unmarried	1988-12-30	2013-02-11	3	9742143612	mallikarjunar@webnish.com	f5af7150ac26802490d7a25f2d50abf7	eishasethi@kreatio.com		arif@webnish.com	2013-04-09 10:59:07.396564	2014-01-16 09:25:53.767078	85d663d5	false	Deactivated	2	\N
140	Mrs	N.Bharathi	Devi		BUYPD4431P		Female	Married	1989-05-16	2013-09-16	3	9731897756	bharathi@webnish.com	0ce284d552663331bd8300d8d3cf438c	vishnu@kreatio.com	12110	arif@webnish.com	2013-10-08 10:20:29.805177	2015-12-11 07:54:15.419407	4cd03000	false	Active	2	9900089710
166	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	sharath@kreatio.com	75f30dd28e465e12cf2b3b6f15f91fff	\N	\N	\N	2014-02-17 10:24:24.805894	2014-08-08 06:17:17.006912	\N	false	Deactivated	1	\N
161	Mr	Gopinadha	Reddy		AVFPG1218C		Male	Unmarried	1990-12-08	2013-12-19	3	8095979146	gopinadha@webnish.com	29d43616152a018e7b23b51104d25b0d	arif@webnish.com		arif@webnish.com	2013-12-23 05:30:02.745581	2014-03-26 06:45:16.036854	\N	false	Deactivated	2	\N
58	Mr	Virendra	Mulkeepatil	shiddnagowda	BCEPM604611		Male	Married	1983-06-01	2009-12-17	3	7760228833	virendra@kreatio.com	d1a699089d3fff1d03ce5d134748d07f	rabindrak@kreatio.com	KR11056		2012-09-18 10:37:32.563154	2013-09-11 12:29:07.874908	\N	false	Deactivated	1	\N
105	Mr	Prem	V M	Nath	BVHPP9764P		Male	Unmarried	1990-07-28	2013-02-14	3	8553855247	premnathvm@kreatio.com	b0e0001673557210cb7344e04ef56fe7	arunkumar@kreatio.com	12080	arunkumar@kreatio.com	2013-02-25 07:14:04.119767	2013-12-06 10:14:09.678118	\N	false	Deactivated	1	\N
172	Mr	Vineet	Panicker	Venugopalan	AQOPV0018R		Male	Unmarried	1987-08-10	2014-03-12	3	8147728123	vineet@webnish.com	fe6a01301cdd5b6d1e89ef5df37c9c57	arif@webnish.com			2014-03-13 10:12:56.70637	2014-06-16 07:08:29.930185	\N	false	Deactivated	2	\N
162	Mr	Rakesh		Kumar			Male	Unmarried	1989-11-15	2013-12-26	3	+919742480832	rakeshkumar@kreatio.com	17495678a66d807fff30c2e6f2b3d310	sumitha@kreatio.com	12125		2013-12-26 11:08:22.965076	2015-05-13 06:07:57.776296	\N	false	Deactivated	1	\N
141	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	ashoka@webnish.com	24809280a5b227ed194adcd3f3839658	\N	\N	\N	2013-10-11 10:14:41.170338	2014-01-16 09:25:53.632496	\N	false	Deactivated	2	\N
59	Mr	Vijayakumar	velusamy		ATBPV2441G		Male	Unmarried	1990-09-21	2012-06-22	3	9916761624	vijayakumar@kreatio.com	c029f49ea1024ad6dd9b760ce75b810e	gprabhu@kreatio.com	12058	gprabhu@kreatio.com	2012-09-18 10:39:25.208565	2015-09-10 07:04:18.140072	372501a0	true	Deactivated	1	
154	Mr	Vikram	Roy		ASXPR9393J		Male	Unmarried	1988-04-10	2013-11-08	3	9663450587	vikram@webnish.com	abd921b6712c9fe2c95a39d7c050f6e6	hr@webnish.com	12118	arif@webnish.com	2013-11-15 07:13:35.192947	2014-12-02 10:42:34.144949	3f3b8384	false	Deactivated	2	\N
169	Mr	HemaKumar	Reddy	kumar	AUTPA2062R		Male	Unmarried	1992-05-29	2014-02-26	3	9886671511	hemakumar@kreatio.com	4bd5ed65712126c0eb9a441881673cda	sumitha@kreatio.com	12128	souvik@kreatio.com	2014-02-28 10:14:37.907985	2015-09-16 10:18:26.828766	4534683e	false	Active	1	
155	Mr	Manjunath Surpur	Surpur		BBAPM9955Q		Male	Unmarried	1987-07-20	2013-11-08	3	9916560596	manjunath@webnish.com	49d40c436ec88c54cfa57b275ab1295f	arif@webnish.com	 12117	arif@webnish.com	2013-11-15 07:14:27.654108	2015-12-22 09:21:59.717562	ccfd3bb5	false	Active	2	
171	Mr	Raghavendra	V		BIMPR1186H	PY/BOM/60812/126	Male	Unmarried	1991-03-19	2014-03-05	3	8095250130	raghavendrav@kreatio.com	990c12eb7f68cde5a2553d92f22ad23c	senthilkumar@kreatio.com	12130	gprabhu@kreatio.com	2014-03-06 06:09:35.081136	2015-08-06 04:48:06.07777	\N	false	Active	1	
156	Mr	ALBERT	SREEDHARAN	PETTUPARAYIL			Male	Married	1981-05-20	\N	3	09446929171	albert@webnish.com	a034a3d3ad46c0881158319b58a00bd8	arif@webnish.com			2013-11-20 05:28:59.032859	2014-03-26 06:45:16.065493	\N	false	Deactivated	2	\N
157	Mr	Mahesh	Gajendra				Male	Unmarried	1988-09-10	2013-11-25	3	9900909932	maheshg@webnish.com	ed1325e1c8fdf4f3e5609000e44b6c57	arif@webnish.com		arif@webnish.com	2013-11-26 12:09:23.848471	2014-03-26 06:45:16.094121	\N	false	Deactivated	2	\N
234	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	abubakker@webnish.com	4f86ac586dd9d28ddc4e2eef80f58279	\N	\N	\N	2015-04-09 11:07:09.138218	2015-04-13 08:35:36.195775	\N	false	Deactivated	2	\N
150	Mrs	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	dipti@kreatio.com	ba0a7b33dd9e577aaafc57e9110b7c4e	\N	\N	\N	2013-11-06 05:20:04.063818	2013-11-06 05:20:04.063818	\N	false	Active	1	\N
131	Mrs	Priyali	Hooda				Female	Married	1980-02-28	2013-07-15	3	9900089709	priyali@kreatio.com	78434d12d0de52042013ea881c5aea44	souvik@kreatio.com	12099	souvik@kreatio.com	2013-07-15 09:48:52.701253	2015-09-03 09:00:09.952285	658c76bf	false	Active	1	
173	Ms	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mounishas@kreatio.com	479f5dd617fa803368e1cee7e82443f7	\N	\N	\N	2014-03-26 06:34:23.891754	2015-02-23 07:23:43.02166	\N	false	Deactivated	1	\N
145	Mr	Vinay	Gupta	Kumar	ASGPG8920		Male	Unmarried	1990-06-26	2013-10-30	3	8867165476	vinay@kreatio.com	202cb962ac59075b964b07152d234b70	gprabhu@kreatio.com	12114	vishnuprabhakar@kreatio.com	2013-10-30 11:20:17.321883	2015-07-22 06:23:25.770808	eac16d48	false	Deactivated	1	8867165476
149	Mr	Sudeep	D				Male	Unmarried	1988-05-26	2013-10-10	3	9886376097	sudeep@webnish.com	98ca91e09e1c540a579bb3b5ea394daf	arif@webnish.com			2013-11-05 05:50:00.203971	2014-03-26 06:45:16.132202	\N	false	Deactivated	2	\N
165	Mr	Rohit	KUMAR		BTQPK1134B		Male	Unmarried	1989-01-15	2014-01-20	3	8123078952	rohitkumar@webnish.com	69f31c3d4955467802c30dba8df1befe	srikanthvasuraj@webnish.com	12126	arif@webnish.com	2014-02-04 09:51:51.833275	2015-01-05 11:46:10.651394	6f0ebea4	false	Active	2	9591125986
158	Mr	YUVARAJA	RAMASAMY		AEXPY0781P	PY/BOM/60812/118	Male	Unmarried	1990-07-02	2013-12-02	3	9743728845	yuvaraja@kreatio.com	78754dd5364d457a79eff7f85a5537e0	ramkumar@kreatio.com	12122		2013-12-03 05:42:30.644216	2015-07-02 04:40:57.747497	\N	false	Active	1	
139	Mrs	Sarala Devi					Female	Married	1987-10-11	\N	3	9902817022	sarala@kreatio.com	01d51bdf54a4bd28bba341b3fb7680d3	manjulak@kreatio.com			2013-10-08 10:06:00.709943	2014-11-05 10:16:52.566494	\N	false	Deactivated	1	\N
163	Mr	Presith	Prakash		BVZPP4664G	PY/BOM/60812/123	Male	Unmarried	1987-04-12	2014-01-27	3	9482086082	presithprakash@kreatio.com	73c3b0b7441fc14617eb4c14214fa73b	rabindrak@kreatio.com	12127	rabindrak@kreatio.com	2014-01-27 06:22:38.353382	2014-12-22 12:56:46.720828	ca17046e	false	Active	1	
143	Mr	Nitesh	Nayan		AIIPN5562C		Male	Unmarried	1985-09-26	2013-10-28	3	8880345568	nitesh@kreatio.com	6692556d7e635946a036df830d35a9ac	gprabhu@kreatio.com	12112		2013-10-28 10:52:39.962352	2014-07-30 08:21:11.917389	\N	false	Active	1	\N
146	Ms	ravali	mulukalla				Female	Married	1991-08-31	2013-10-31	3	9164167897	ravali@kreatio.com	6eb0486a0783f18cd91e6c1d805d589d	rabindrak@kreatio.com		souvik@kreatio.com	2013-11-04 05:28:48.28838	2014-07-28 04:25:12.289822	\N	false	Deactivated	1	\N
168	Ms	Swathi					Female	Unmarried	1991-06-11	2014-02-26	3	8095640546	bswathi@webnish.com	d5988e5cd7eed2b4e46b2ac5898d75d3	arunkumar@kreatio.com	12131	arif@webnish.com	2014-02-27 09:08:39.212156	2015-01-05 15:09:03.313551	10aa85b7	false	Active	2	\N
151	Ms	Nagaswapna	R	N	ATWPN5429P	PY/BOM/60812/112	Female	Unmarried	1991-07-30	2013-11-05	3	9620106472	nagaswapna@kreatio.com	79d58bb5a1de3c6a2627f1a0696f451d	sumitha@kreatio.com	12116		2013-11-06 05:21:50.423113	2015-09-16 10:23:28.798507	b3ae34a7	false	Active	1	
142	Mr	Abhishek	Kumar		CJBPK2644E		Male	Unmarried	1990-09-17	2013-10-15	3	8050708104	abhishek@kreatio.com	f9d6fccb8176d5388964f887e3091813	vishnuprabhakar@kreatio.com	12111	gprabhu@kreatio.com	2013-10-21 08:36:17.462659	2015-10-16 07:29:11.408428	\N	false	Active	1	
164	Mr	Abhishek					Male	Unmarried	1991-04-26	2014-02-03	3	8105607595	abhishek@webnish.com	c1511612f0ff50ea6a8db5837414c991	abhishek.webnish@gmail.com			2014-02-04 09:51:16.499967	2014-07-14 07:12:50.300977	\N	false	Deactivated	2	\N
160	Mr	K.V.V.Seshagiri Rao			ATJPK8692A		Male	Married	1981-06-02	2013-12-16	1	9945455505	giri@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	souvik@kreatio.com	12124		2013-12-04 12:00:38.238999	2014-06-02 11:25:45.116469	d954744e	false	Active	1	\N
159	Mr	Rajkumar			BJFPR5242A	PY/BOM/60812/119	Male	Unmarried	1988-09-18	2013-12-02	3	9036163860	rajkumarp@kreatio.com	474f94809b991279fb81d77a45ad1d89	ramkumar@kreatio.com	12123		2013-12-03 05:42:51.474828	2014-08-04 04:35:14.643255	0e9f7781	false	Active	1	\N
174	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	kpridhvikanth@kreatio.com	ac9e308c9cf18560013d0a69029a9c18	\N	\N	\N	2014-03-26 06:39:10.956111	2014-03-26 07:45:50.777686	\N	false	Deactivated	1	\N
148	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	hr@webnish.com	87ca7962c197ed7c9289b87add396c6f	\N	\N	\N	2013-11-05 05:19:14.072107	2014-09-12 05:30:53.145113	fdd6157f	false	Active	2	\N
147	Ms	sumanjali	N		ATWPN5430G		Female	Unmarried	1992-08-27	2013-10-31	3	9964390198	sumanjali@kreatio.com	70e68dbb3f2fc2fdc87b8e19c6ea24ea	sumitha@kreatio.com	12115	souvik@kreatio.com	2013-11-04 05:31:32.874044	2015-03-04 04:27:28.781781	\N	false	Deactivated	1	
126	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mohanvs@kreatio.com	c95c7f0e377aec1b646bdb4dec0e41f9	\N	\N	\N	2013-06-26 10:12:58.41899	2014-03-26 06:45:44.792154	\N	false	Deactivated	1	\N
176	Ms	mounisha	kannapureddy		BJRPR5504F		Female	Unmarried	1992-06-18	2014-03-26	3	8105508882	mounisha@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	swapnil@kreatio.com	12134	souvik@kreatio.com	2014-03-26 10:33:50.875137	2015-02-23 07:27:11.976011	\N	false	Active	1	
182	Mr	Krishna	Payazhi	Kumar	BEIPK1729R		Male	Married	1985-11-21	2014-05-05	3	7676754092	krishna@webnish.com	5545cbf6ef51d614c385b44eb6b39ad8	venu@webnish.com	12141	arif@webnish.com	2014-05-05 06:57:31.95708	2014-11-04 10:36:46.638251	\N	false	Deactivated	2	\N
192	Mr	PANKAJ	KUMAR		CNPPK1873H		Male	Unmarried	1987-08-23	2014-07-01	3	7204906310	pankajkumar@kreatio.com	4534e1cf4a4eee03b433704ce2e3b99e	suhana@kreatio.com	12146	suhana@kreatio.com	2014-07-09 05:55:12.248763	2015-01-15 09:46:08.931181	2ab14667	true	Deactivated	1	
183	Mr	subbarao	katakam				Male	Unmarried	1986-06-01	2014-05-15	2	9663676251	subbarao@kreatio.com	b8dbaf31ce728e11d67fdebee0b19fcb	souvik@kreatio.com		souvik@kreatio.com	2014-05-16 05:59:51.830157	2014-08-07 09:31:13.017062	\N	false	Deactivated	1	\N
200	Mr	Abhishek	kumar		BFTPK0453E		Male	Unmarried	1981-08-08	2014-06-18	3	9620204514	abhishekp@kreatio.com	dd39b4d05a2e19bb9443c3cd23d3aff1	ajay@kreatio.com	12142		2014-08-08 04:52:24.244253	2015-01-19 07:55:55.10908	\N	false	Deactivated	1	9620204514
204	Mr	Venu	H	Somaiah	CJQPS3231Q		Male	Unmarried	1985-10-05	2014-04-10	2	9964051805	venu2@kreatio.com	399c1673c32d55a84e09c534f7cee188	souvik@kreatio.com	12138	souvik@kreatio.com	2014-09-04 08:42:00.887111	2014-09-04 09:54:05.323999	\N	false	Deactivated	1	9739103364
191	Mr	Akshay	Gondhali	Ramakant	BOCPG9370Q 		Male	Unmarried	1992-09-29	2014-07-01	3	08904670016	akshay@kreatio.com	2de1b2d6a6738df78c5f9733853bd170	gprabhu@kreatio.com	12145		2014-07-09 05:46:02.999242	2015-10-30 09:01:37.562418	\N	false	Deactivated	1	
180	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mithun@webnish.com 	475988e4653b5303df3903526599a176	\N	\N	\N	2014-04-24 05:54:39.195545	2014-04-24 06:05:30.721497	\N	false	Deactivated	2	\N
188	Mr	VIPUL	GUPTA		BOBPG6254C		Male	Unmarried	1991-03-13	2014-07-01	3	8904670150	vipul@webnish.com	6c62425e5dcd9db48bca4753991d19e5	arunkumar@kreatio.com	12151	 venu@webnish.com	2014-07-02 10:32:31.115065	2015-07-31 06:54:45.788622	0bb57857	false	Active	2	
190	Mr	Brajesh	Patidar		CDGPP7148P		Male	Unmarried	1991-12-28	2014-07-01	3	08904670042	brajesh@kreatio.com	8fff19c623838375f529557b325c5ce4	giri@kreatio.com	12144	hr@kreatio.com	2014-07-09 05:38:58.839756	2014-09-26 04:20:34.162928	\N	false	Deactivated	1	
198	Mr	Vinoth Kumar s			AUSPV0500C	PY/BOM/60812/151	Male	Unmarried	1986-05-31	1986-05-31	3	9916539324	vinoths@kreatio.com	89bf93fbba5bdf134d1056a2b56edbe3	sumitha@kreatio.com	12154		2014-08-05 06:56:09.856154	2015-11-19 12:31:27.700624	\N	false	Active	1	
187	Mr	KAMAL	KISHOR		CCKPK9409H		Male	Unmarried	1991-06-10	2014-07-01	3	8867151741	kamal@webnish.com	4d4f5d65180fdbcd4c29e93ee5de73f6	arunkumar@kreatio.com	12150	arif@webnish.com	2014-07-02 10:19:24.931362	2014-12-24 05:20:58.971936	eb6e954a	true	Active	2	
184	Mr	Abhishek kumar					Male	Unmarried	1981-08-08	2014-06-18	3	9620204514	abhishekkumarp@kreatio.com	dd39b4d05a2e19bb9443c3cd23d3aff1	-		-	2014-06-30 06:31:34.661385	2014-08-08 04:52:10.307815	\N	false	Deactivated	1	\N
175	Mr	PRIDHVI KANTH	KAVERIPAKAM		CCFPK9304L		Male	Unmarried	1991-09-22	2014-03-27	3	9908750875	pridhvi@kreatio.com	3529da717c5690edb5fbac21eb98afe0	antony@kreatio.com		souvik@kreatio.com	2014-03-26 07:45:17.264456	2014-08-19 12:17:30.055058	\N	false	Deactivated	1	\N
196	Mr	VINOTHKUMAR			AVOPV6224C		Male	Unmarried	1990-05-28	2014-07-29	3	9738397428	vinoth@kreatio.com	ab000d8a066eccf0c9988958ac353c2b	sumitha@kreatio.com	12152 		2014-07-29 08:56:31.476045	2015-09-19 05:30:15.914587	\N	false	Active	1	
181	Mr	Mithun	J B		BBHPM1822R		Male	Unmarried	1986-10-01	2014-04-17	3	9591124621	mithun@webnish.com	edf478aeff9166d778860bc2693c889e	arif@webnish.com	12139		2014-04-24 06:06:18.575757	2014-08-22 06:00:25.279887	\N	false	Deactivated	2	\N
199	Mr	Sharath	Ramesh				Male	Unmarried	1992-11-02	2014-08-06	3	9035009933	sharathramesh@kreatio.com	6d13ed22fda142adba49bc2ed78d70dd	antony@kreatio.com			2014-08-08 04:41:19.752317	2014-09-09 05:13:56.992893	\N	false	Deactivated	1	
170	Mr	Solipuram Sujit	Reddy	Pranav	ENLPS6578B	100011563107	Male	Unmarried	1991-02-06	2014-03-03	3	08792616479	sujitpranav@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	deepa@kreatio.com	12129	souvik@kreatio.com	2014-03-04 11:21:07.679302	2015-06-12 05:10:02.497953	e33ec820	false	Deactivated	1	
202	Mr	Mathiyalagan	A		BMKPA9773M		Male	Unmarried	1990-05-15	2014-08-25	3	+918147492634	mathiyalagan@kreatio.com	529006e3094a9449bc80506e34e824d6	sumitha@kreatio.com		souvik@kreatio.com	2014-08-25 07:51:51.633355	2015-01-06 11:37:09.746383	\N	false	Deactivated	1	
193	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	krishnap@kreatio.com	fe4d75685ddd5b5a63cd4c615eccc9fe	\N	\N	\N	2014-07-09 06:01:37.920017	2014-08-11 08:06:06.565114	\N	false	Deactivated	1	\N
194	Mrs	Suhana	A		ALQPA5269A		Female	Married	1982-04-15	2014-07-01	1	9342414148	suhana@kreatio.com	a356446b79ecda0ad10c339db195262e	senthilkumar@kreatio.com	12147		2014-07-10 08:56:57.803745	2015-09-02 10:11:44.297794	53e71f8f	false	Deactivated	1	
189	Mr	KSHITIZ 	RASTOGI		BFDPR5952P		Male	Unmarried	1992-12-28	2014-07-01	3	9791761280	kshitiz@kreatio.com	5fec3b66c0cc9c87049fb55901399426	suhana@kreatio.com	12143	suhana@kreatio.com	2014-07-09 05:22:09.147835	2015-02-03 11:07:51.894444	\N	false	Deactivated	1	
203	Mr	P.N.Ravindra			BSYPR4104F	PY/BOM/60812/153	Male	Unmarried	1992-07-04	2014-08-25	3	9964435807	pnravindra@kreatio.com	d1370c35041c3b760c264a751ee92b55	rabindrak@kreatio.com	12156	rabindrak@kreatio.com	2014-08-25 07:52:30.500058	2015-08-19 12:53:45.106372	7e8b11f9	true	Deactivated	1	
206	Mr	Jagannatha	K A		AVQPA3995F		Male	Unmarried	1991-05-25	2014-09-24	3	9008021475	jagannatha@webnish.com	b55bd5e64bb6ec9a06c0c1dc19f9386a	arif@webnish.com		arif@webnish.com	2014-09-25 06:18:13.067968	2014-12-16 06:24:52.329341	\N	false	Deactivated	2	
178	Mr	Venu	H	Somaiah	CJQPS3231Q		Male	Unmarried	1985-10-05	2014-04-10	3	9964051805	venu@kreatio.com	399c1673c32d55a84e09c534f7cee188	souvik@kreatio.com	12138		2014-04-10 11:25:56.224038	2014-09-05 04:52:01.30537	7ad64b92	false	Active	2	9739103364
107	Mr	Antony	Prakash	Aloy			Male	Married	1983-06-30	2007-04-02	3	09916711621	antony@kreatio.com	9c4b6521a34c86938cfbe2cfb87e451d	souvik@kreatio.com	12024		2013-03-28 04:50:25.039599	2014-09-02 03:43:45.357083	da687c34	false	Deactivated	1	
197	Mr	Sujit	Padhi	Kumar	CNFPP8710G	PY/BOM/60812/150	Male	Unmarried	1991-04-27	2014-08-04	3	8553186648	sujitkumar@kreatio.com	bf419c8405d0bedea6eec7ac2d7d2f32	rabindrak@kreatio.com	12153	rabindrak@kreatio.com	2014-08-04 09:00:08.817532	2014-12-22 13:00:02.852178	\N	false	Active	1	
195	Mr	BHUBNESHWAR	PASWAN		CODPP3691F	PY/BOM/60812/145	Male	Unmarried	1990-10-05	2014-07-04	3	8867151250	bhubneshwar@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	senthilkumar@kreatio.com	12148	souvik@kreatio.com	2014-07-14 06:21:21.693467	2014-09-26 04:20:34.122316	\N	false	Deactivated	1	
201	Ms	MAHADEVI	KOLAKAR		CAPPK4267G		Female	Unmarried	1989-07-10	2014-08-11	3	8884369938	mahadevi@webnish.com	3d80f62043e5f1d0e9696b18572a6482	manjunath@webnish.com	12155	arif@webnish.com	2014-08-11 06:54:34.202947	2015-07-09 12:53:10.809235	\N	false	Active	2	
205	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	jagannatha	3535762ca8095d23e1b985353d16b1ac	\N	\N	\N	2014-09-25 06:17:00.043881	2014-10-09 05:30:06.722344	\N	false	Deactivated	2	\N
179	Mr	Subrat	Sahoo	Kumar	CVHPS2822J	PY/BOM/60812/134	Male	Married	1988-04-03	2014-04-10	3	7829844840	subrat@webnish.com	87ca7962c197ed7c9289b87add396c6f	srikanthvasuraj@webnish.com	12137	arif@webnish.com	2014-04-10 11:26:48.172149	2015-04-13 08:36:59.823921	7e6086da	false	Deactivated	2	9632203654
185	Mr	prashant	P	V	AOZPP4628Q		Male	Married	1967-05-12	2014-07-01	3	 9972706742  	prashant@webnish.com	25d55ad283aa400af464c76d713c07ad	srikanthvasuraj@webnish.com	12149		2014-07-01 07:30:51.227564	2015-03-05 04:44:13.588125	26b661b0	true	Active	2	arif@webnish.com
224	Mr	mohammed	khaleel		cdbpk5279h		Male	Unmarried	1990-08-18	2015-02-10	3	9945752131	khaleel@webnish.com	1b1159564e0e00ba8f2f733ad8d19a70	SRIKANTHVASURAJ@WEBNISH.COM		\N	2015-02-17 06:05:08.704789	2015-02-18 05:57:52.834793	\N	false	Active	2	08041227462/3/4
210	Mr	ravishankar	kumar		BRCPK8857M		Male	Unmarried	1991-02-05	2014-11-17	3	8892871216	ravishankar@kreatio.com	931cb4e14b1cb29c47207334f1b19359	rajeevk@kreatio.com	12162	 senthilkumar@kreatio.com 	2014-11-17 10:45:00.50288	2015-12-21 08:55:15.857965	\N	false	Active	1	
231	Mr	Dharmendra kumar	Butani		BLNPD7185A		Male	Unmarried	1986-04-28	2015-03-12	3	9916968832	dharmendrak@webnish.com	d9b46cfbbaf7aa700e46d58f76de6c04	srikanthvasuraj@webnish.com	12182	\N	2015-03-13 04:52:04.703868	2015-09-07 11:17:37.262598	\N	false	Active	2	
207	Mr	Manda	Kumar	Praveen	CEZPM4224H		Male	Unmarried	1988-04-14	2014-10-06	3	8880644445	praveenkumar@webnish.com	87ca7962c197ed7c9289b87add396c6f	hr@webnish.com		arif@webnish.com	2014-10-06 09:34:58.854106	2014-11-17 09:50:13.49237	de3da30f	false	Deactivated	2	
208	Mr	Mutra	Reddy	Masthan	CEXPM3542Q		Male	Unmarried	1990-04-28	2014-10-08	3	9620460667	masthanm@webnish.com	498b4ddc9f957eca6473923163dd117f	rahulmr@webnish.com, 		Arif Imam <arif@webnish.com>	2014-10-07 08:41:36.925035	2014-11-26 10:43:07.28492	\N	false	Deactivated	2	
211	Mr	Piyush	Raj		ANVPR5036M	PY/BOM/60812/160	Male	Unmarried	1990-02-23	2014-11-17	3	07411839544	piyushraj@kreatio.com	d3ef2e5b346ab8e82b9fac03421f5eda	rabindrak@kreatio.com	12163	rabindrak@kreatio.com	2014-11-17 10:45:14.309252	2015-06-24 10:10:08.162059	595e8031	false	Active	1	
228	Mrs	Vemula	Kumar	Santhosh	AGDPV6480E		Male	Married	1980-01-04	2015-03-02	3	9885584769	santhosh@webnish.com	8b10cbe262e02a8e0478b685b5c6e057	srikanthvasuraj@webnish.com		\N	2015-03-04 05:10:39.845252	2015-03-05 09:48:12.061994	\N	false	Active	2	
218	Mr	Chokkappan	Srinivasan		CSFPS 1611 C		Male	Unmarried	1984-07-18	2015-01-19	3	9916213114	chokkappan@kreatio.com	c55635375fe47236f3748a84dbbc0ecf	souvik@kreatio.com	12170	\N	2015-01-19 09:12:43.556416	2015-03-16 09:45:33.335282	\N	false	Active	1	
230	Ms	Apoorva	SG		na	na	Female	Unmarried	1990-10-08	2015-03-09	3	8970402384	apoorva@webnish.com	e318437eb52bd8b3773e372dc9559c6f	hr@webnish.com	12180	\N	2015-03-13 04:51:17.930669	2015-12-22 07:07:18.860273	851ba9c9	false	Active	2	8970402384
221	Mr	Jeevan	Gathoo	Prakash	AFGPG6596J		Male	Married	1960-10-26	2012-02-13	1	+919867186457	jeevanp@kreatio.com	408ccd2b8709be0335aa70a73bd053b3	deepak@kreatio.com	12051	\N	2015-02-02 07:50:58.549871	2015-02-02 09:38:58.843124	\N	false	Active	1	+912512354121
220	Mr	Siddhartha	Mani		BQBPM5337A	PY/BOM/60812/169	Male	Unmarried	1991-11-03	2015-01-22	3	9448228857	siddhartha@kreatio.com	5a8451078fb98e820e965d3be71487bd	priyali@kreatio.com	12172	\N	2015-01-22 06:56:42.294075	2015-04-02 05:08:50.046163	\N	false	Active	1	
213	Mr	shaik	taj	hamid	DIOP1203L		Male	Unmarried	1989-08-13	2014-11-26	3	8099010583	hamidtaj@webnish.com	6ac575879ee303eccb176c1de1237acd	srikanthvasuraj@webnish.com	12164	arif@webnish.com	2014-12-01 06:56:06.946701	2015-09-15 11:38:21.377966	7795604b	false	Deactivated	2	
215	Mr	Sathish	Kumar		FCHPS8884Q		Male	Unmarried	1991-10-21	2014-12-17	3	9886524011	sathishp@kreatio.com	aa2e58f670c5b86ebbde9f25f9e5224e	rabindrak@kreatio.com	12167	hr@kreatio.com	2014-12-17 10:53:41.912446	2015-07-21 03:50:19.833151	\N	false	Active	1	
87	Mr	Merlin	C	JeyaKumar	CEOPM3687K	PY/BOM/60812/056	Male	Unmarried	1989-03-15	2012-06-20	3	9686560798	merlinjeya@kreatio.com	5d000b30d9066030e69fa98c9505e7e6	gprabhu@kreatio.com	12056	senthilkumar@kreatio.com	2012-10-08 09:19:55.194012	2015-07-31 08:08:09.972529	\N	false	Deactivated	1	9972703082
99	Mr	Manvendra	Tripathi		AUQPT2974C		Male	Unmarried	1991-01-19	2012-12-29	3	8867766027	manvendra@kreatio.com	c2272a21bcda593b30f085b337d97ea6	souvik@kreatio.com	12073	souvik@kreatio.com	2012-12-04 09:05:21.918952	2015-12-04 07:37:49.52983	\N	false	Deactivated	1	09686448189
214	Mr	Srikanth	Vasuraj		ABPV7976R		Male	Married	1955-11-11	2014-12-01	1	9591124316	srikanthvasuraj@webnish.com	b9b4b4d9d835a581b683ee5d30b4aa0f	dipti@webnish.com	12166	dipti@webnish.com	2014-12-02 05:57:38.816608	2015-02-04 09:51:53.570453	d8b6e12f	true	Active	2	
216	Mr	Dibyajyoti	Nath		AWFPN8411K		Male	Unmarried	1991-06-27	2015-01-05	3	08754500831	dibyajyoti@kreatio.com	a029f664fee3837ad1740e102e2ff5de	gprabhu@kreatio.com	12168	\N	2015-01-05 06:57:43.472042	2015-10-29 04:16:57.472055	\N	false	Deactivated	1	
177	Mr	kumaresan	kesavan		CBWPK9248R	PY/BOM/60812/133	Male	Unmarried	1986-08-03	2014-03-28	3	9008876523	kumaresan@kreatio.com	39862c54d8c0b10c623dfdaaa9a06ea3	gprabhu@kreatio.com , vishnuprabhakar@kreatio.com	12136	senthilkumar@kreatio.com	2014-04-04 10:30:26.765585	2015-11-09 14:26:40.896117	\N	false	Active	1	
217	Mr	Basavana Gowda 	G	K	BNYPB2115H	PY/BOM/60812/166	Male	Unmarried	1987-12-03	2015-01-05	3	9036891660	basavana@webnish.com	87ca7962c197ed7c9289b87add396c6f	manjunath@webnish.com	12169	\N	2015-01-09 10:30:22.552131	2015-02-24 04:33:50.334215	\N	false	Active	2	
54	Ms	Shabrin	Syed		DPOPS3908P	PY/BOM/60812/057	Female	Unmarried	1989-02-16	2012-06-21	3	9035909516	shabrin@kreatio.com	7d38165975ddfafe599569b48e2b27fc	arunkumar@kreatio.com	12057	arif@webnish.com	2012-09-18 10:34:14.137382	2015-11-13 09:54:15.400928	ac6b2c29	false	Deactivated	1	
222	Mr	Manjunatha	C				Male	Unmarried	1990-10-14	2015-02-02	3	9738214523	cmanjunath@webnish.com	059d21546cde5f208b96a9d8ec5f4596	srikanthvasuraj@webnish.com	12173	\N	2015-02-02 10:46:12.153897	2015-12-22 10:13:10.001392	97fe052f	false	Deactivated	2	
232	Mr	Manoj	Patil	Madhu			Male	Unmarried	1986-05-22	2015-03-12	3	8904590053	manojpatil@webnish.com	8a0643acaf07e4d36e117eed1a629ae7	srikanthvasuraj@webnish.com		\N	2015-03-23 04:23:27.933042	2015-09-15 11:38:21.423904	\N	false	Deactivated	2	
209	Ms	T	Deepa		BRKPD2281A		Female	Unmarried	1989-12-06	2014-11-10	3	8050091771	deepat@webnish.com	c7114c09b73ba5a22fb0db200d20498c	michael@webnish.com	12161	arif@webnish.com	2014-11-10 11:16:49.536363	2015-11-20 10:12:50.067434	\N	false	Active	2	
212	Mr	SALINAN	GAJENDRAN		AZGPG0400R	PY/BOM/60812/162	Male	Married	1985-07-11	2014-11-27	3	9942272288	gsalinan@webnish.com	850e73266a7ea04bac6a01c29064de02	srikanthvasuraj@webnish.com	12165	ARIF@WEBNISH.COM	2014-12-01 06:55:40.864561	2015-08-12 08:58:40.85907	f0b4cc01	false	Active	2	
226	Ms	Sanober	Sultana				Female	Unmarried	1990-03-25	2015-02-16	3	9739103564	sultana@webnish.com	87ca7962c197ed7c9289b87add396c6f	arif@webnish.com	12177	\N	2015-02-17 06:44:50.99127	2015-06-09 11:25:16.533766	\N	false	Active	2	
227	Mr	Pavan	Nedium	Kumar	AMBPN0553A		Male	Unmarried	1992-02-12	2015-02-16	3	+919739892527	nediumpavan@kreatio.com	e9876b7e4e0cc1264609e680c974b152	sumitha@kreatio.com	12178	\N	2015-02-19 04:21:28.387508	2015-09-16 10:23:35.217889	\N	false	Active	1	
225	Mr	SATHISH	B				Male	Unmarried	1990-03-26	2015-02-09	3	8553316544	sathish@webnish.com	50e62ffa25b1ce3fd735cfdfec5cb805	sathish@webnish.com		\N	2015-02-17 06:06:15.607933	2015-04-13 08:36:26.448195	\N	false	Deactivated	2	
223	Mr	venkata	krishna.T	manoj			Male	Unmarried	1989-04-17	2015-02-11	3	8553063441	manojkrishna@kreatio.com	7957446b21e45c21eb022459fc3657fd	priyali@kreatio.com	12176	\N	2015-02-12 05:21:39.055694	2015-05-11 10:42:33.651194	\N	false	Deactivated	1	
219	Mr	samykkannu	azhagu		GEKPS5277D		Male	Unmarried	1991-06-25	2015-01-19	3	9538751710	samykkannu@kreatio.com	ebc1bdf1b0cf60660efdd619a7c007a3	sumitha@kreatio.com	12171	\N	2015-01-19 11:04:46.137906	2015-10-08 04:38:04.447545	a478d0b9	false	Active	1	9538751710
144	Mr	Anjaneyulu	Egavinti	Reddy	ABJPE2216J		Male	Unmarried	1992-05-11	2013-10-29	3	8892576065	anjaneyulu@kreatio.com	2e7888a48eb0fa1e219258d08ad8a511	sumitha@kreatio.com	12113		2013-10-30 07:49:19.432647	2015-10-01 10:30:02.9998	eac5f15b	false	Deactivated	1	
235	Ms	Apoorva	R				Female	Unmarried	1993-10-23	2015-04-01	3	8867906038	 rapoorva@webnish.com 	5a1a5593623cdde561bacff4477aec78	arunprasath@webnish.com	12185	\N	2015-04-13 08:34:38.090927	2015-06-18 05:29:43.248554	\N	false	Active	2	
237	Ms	Rachna	Kumari		DYFPK7911A		Female	Unmarried	1991-06-08	2015-04-23	3	9632622366	rachna@kreatio.com	280dd443f81c028f4472d48462953bf1	swapnil@kreatio.com	12188	\N	2015-04-23 06:57:52.687174	2015-07-09 09:20:31.333501	5aac332d	false	Active	1	
243	Ms	Keerthana	C				Female	Unmarried	1993-07-06	2015-06-08	3	8012323961	keerthana@kreatio.com	97bc57fdec6e19a7ffa7ad6fff495931	sumitha@kreatio.com	12196	\N	2015-06-17 10:18:50.308746	2015-10-29 04:16:57.503348	\N	false	Deactivated	1	
241	Mr	Melhi 	Daniel	Joshua	BDRPM1655C		Male	Unmarried	1985-12-12	2015-06-01	3	8144653446	joshuadaniel@webnish.com	804579265571c83a15a9408e41b158a5	srikanthvasuraj@webnish.com		\N	2015-06-09 09:46:15.059148	2015-07-17 04:48:37.899528	\N	false	Active	2	8041227462
262	Mr	Kannan	Jeyabal		BSMPK0779F		Male	Unmarried	1988-01-29	\N	3	8124354281	jkannan@webnish.com	63c1d68f3f7bc75a151715e3bdfae479	sriksrikanthvasuraj@webnish.com		\N	2015-08-24 05:07:19.610739	2015-11-20 05:03:46.057003	\N	false	Active	2	
245	Mr	Tamilarasan	C		APYPT2560H		Male	Unmarried	1993-10-16	2015-06-08	3	+919788007626	tamilarasanc@kreatio.com	d45054a6b1700c01d217b017e4a2216f	vishnuprabhakar@kreatio.com	12194	\N	2015-06-17 10:21:08.609589	2015-12-04 07:20:45.535847	f479df36	false	Active	1	
239	Mr	Kannan	M		CGVPK5775M		Male	Unmarried	1992-06-28	2015-05-26	3	9042939879	mkannan@webnish.com	193364fc2eba60687ab9394b2293b79c	srikanthvasuraj@webnish.com		\N	2015-06-01 10:40:11.419867	2015-09-15 11:38:21.438161	\N	false	Deactivated	2	
253	Mrs	Shilpa	T R		BDYPR8671Q	PY/BOM/60812/202	Female	Married	1987-02-09	2015-07-27	3	9900621062	shilpatr@kreatio.com	9b4d96642440765fef488d7f37340acd	priyali@kreatio.com	12205	\N	2015-07-27 07:36:57.675015	2015-09-28 09:22:39.487623	\N	false	Active	1	
238	Mr	prasanna					Male	Unmarried	1984-01-25	2015-04-15	3	8884332018	prasanna@webnish.com	f0204cb98ee36579dae4fef0933c8ce2	prasanna@webnish.com	12187	\N	2015-04-24 11:19:40.619757	2015-06-09 10:05:52.521435	\N	false	Active	2	08041227463
259	Mr	Naresh	Gunayathi		AEQPN1788Q		Male	Unmarried	1982-04-06	2015-08-03	3	9945308666	naresh@webnish.com	7bb1be8a78498a9de40098a593199819	srikanthvasuraj@webnish.com		\N	2015-08-06 05:24:35.246214	2015-08-06 05:56:40.109733	\N	false	Active	2	
256	Mr	Vishwanath	Devni		BIRPD3561P	MH/BAN/211273/110575	Male	Married	1989-08-23	2015-08-03	3	8880699909	vishwanath@webnish.com	a43538291b06979cdf6ff3f5ddcc0161	srikanthvasuraj@webnish.com		\N	2015-08-05 09:39:01.766717	2015-08-20 11:30:51.838527	\N	false	Active	2	
233	Mr	Harshavardhan D			ADZPH5640P		Male	Unmarried	1988-02-02	2015-04-06	3	9740928656	harshavardhan@webnish.com	ab41566ec49f3a16762f296fa5f37928	srikanthvasuraj@webnish.com	12186	\N	2015-04-09 11:06:10.158155	2015-07-27 10:30:44.954985	e0e336f9	false	Active	2	
247	Mr	Loganathan	G		AJTPL3409L	PY/BOM/60812/189	Male	Unmarried	1993-06-11	2015-06-08	3	9629493467	loganathan@kreatio.com	1f8ac6eb9724abeecaef8841323d50db	ramkumar@kreatio.com	12192	\N	2015-06-17 10:21:58.900553	2015-09-10 07:17:55.920067	\N	false	Active	1	
244	Ms	vijayalakshmi	m		AMOPV6428K		Female	Unmarried	1991-12-19	2015-06-08	3	9715103684	vijayalakshmi@kreatio.com	3075ea112eb6202388c3373ce0f7830d	giri@kreatio.com		\N	2015-06-17 10:20:46.132442	2015-07-09 06:55:43.392659	ee36df83	false	Deactivated	1	8098298125
240	Mr	Jayasheelan	G		AXJPJ0540Q		Male	Unmarried	1985-07-05	2015-06-01	3	9886706711	jayasheelan@kreatio.com	b89c360e8f352747cb3afc3c7d7f8b54	priyali@kreatio.com		\N	2015-06-02 05:43:42.32319	2015-07-09 06:55:43.417292	\N	false	Deactivated	1	
236	Mr	danthukallu	srinivas		AUHPD1314M		Male	Married	1988-04-05	2015-04-01	3	8977255510	srinivas@webnish.com	64c61dda744b311b51c064ea7760a968	 srikanthvasuraj@webnish.com		\N	2015-04-20 06:44:13.752257	2015-10-20 15:10:09.21161	6f604a29	false	Active	2	
248	Mr	Lokeshwaran			AMPPL6305E		Male	Unmarried	1993-11-27	2015-06-08	3	+918903008023	lokeshwaran@kreatio.com	32f5c35fb999831d7c167000535c9e69	vishnuprabhakar@kreatio.com	12191	\N	2015-06-17 10:22:13.774193	2015-11-10 10:16:58.74765	\N	false	Active	1	
246	Mr	Jegan 	R		BBQPJ8840P		Male	Unmarried	1994-05-04	2015-06-08	3	+919789435354	jeganr@kreatio.com	6d94c3713410a3da78fea39b3b13311f	vishnuprabhakar@kreatio.com	12193	\N	2015-06-17 10:21:32.688593	2015-12-07 06:20:57.994303	5e78ae94	false	Active	1	
258	Mr	Mohana	ruban				Male	Married	1990-07-11	2015-08-03	3	9790230579	mohanaruban@webnish.com	1f4216733a85b8d118beca818a6f5fb8	bharathi@webnish.com		\N	2015-08-05 09:41:06.253003	2015-08-06 06:54:59.025177	\N	false	Active	2	
254	Mr	Nikhil TP			AIWPN7987P		Male	Unmarried	1989-02-07	2015-07-14	3	9447724791	nikhil@webnish.com	7d400ae45a92f9aaff8fa463cc5e6a92	sriksrikanthvasuraj@webnish.com		\N	2015-07-28 05:08:44.614833	2015-10-06 11:31:47.249467	\N	false	Deactivated	2	9447724791
257	Mr	Roshan	Naik	Devadatta	AJSPN5965G		Male	Unmarried	1991-12-02	2015-07-22	3	8884184141	roshannaik@webnish.com	8cf0698c5856d817b1645604c62d4bbb	roshannaik@webnish.com		\N	2015-08-05 09:40:22.203834	2015-08-20 17:02:02.722546	\N	false	Active	2	
249	Mr	A.Mohammed	Hakkim	Fazil	CIFPM6343B		Male	Unmarried	1993-08-20	2015-06-08	3	9600740796	amohammed@webnish.com	0bec506c379ec36255e110bdde9c182f	arunkumar@kreatio.com	12199	\N	2015-06-23 04:42:37.547248	2015-07-31 05:48:58.706172	\N	false	Active	2	
260	Mrs	Husna	Ara				Female	Married	1988-08-20	2015-08-10	3	9742253490	husnaara@webnish.com	85d0fd8fc1d3c8a0be8875aff8b794e7	srikanth Vasuraj <srikanthvasuraj@webnish.com>		\N	2015-08-12 05:52:47.916468	2015-08-18 04:59:15.242026	\N	false	Active	2	
261	Mr	vyshakh	krishnan		ALTPV3391H		Male	Unmarried	1991-10-30	2015-08-12	3	9526129276	vyshakh@webnish.com	2a92a3c8be396fcd737a7caeab2a8f9d	sreekanthvasuraj@webnish.com		\N	2015-08-18 10:02:58.83652	2015-10-27 09:13:30.696357	\N	false	Deactivated	2	
252	Mr	Dinesh Babu					Male	Unmarried	1990-02-17	2015-07-09	3	9597118777	dinesh@webnish.com	d43e7c966e0fe1ee8eb307fb79b66d03	srikanthvasuraj@webnish.com		\N	2015-07-14 05:28:05.385867	2015-10-09 14:39:34.325485	16b557ce	false	Active	2	
250	Mr	VISHAL	DHARSUN V M			PY/BOM/60812/195	Male	Unmarried	1993-12-23	2015-06-08	3	8940676325	vishal@webnish.com	160968b7d9a143eb0d87dcda530b8fe8	arunkumar@kreatio.com	12198	\N	2015-06-23 04:43:36.014112	2015-10-28 05:22:50.180676	\N	false	Active	2	9443031293
265	Mr	ARUN	KUMAR		CRXPK6386F		Male	Unmarried	1990-10-24	2015-08-24	3	9620338806	kumararun@kreatio.com	eb8f7f332c4b1b925ae76d27af089e2f	vishnuprabhakar@kreatio.com	1221	\N	2015-08-26 10:34:50.631992	2015-11-19 10:13:31.749646	62a5433e	false	Active	1	
229	Mr	B Sathish	Kumar		FQXPS8834Q		Male	Unmarried	1992-02-16	2015-03-05	3	+918099964567	bsathish@kreatio.com	000a2cac95b42a49652d66b2f1b14ebc	sumitha@kreatio.com	12183	\N	2015-03-05 08:03:58.479398	2015-08-25 12:42:20.579285	\N	false	Active	1	8099964567
264	Mr	Muralidaran	R		CTVPM5657F		Male	Unmarried	1990-04-11	2015-08-10	3	9043469486	muralidaran@webnish.com	ff685c0d9bb585637f99dd7ca940f612	muralidaran725@gmail.com		\N	2015-08-24 10:44:56.440196	2015-08-25 07:49:46.389093	\N	false	Active	2	9003888722
251	Mr	Harish	Jarra	Naidu	AWMPN7607A	PY/BOM/60812/197	Male	Unmarried	1992-01-01	2015-07-09	3	7795817547	harishnaidu@kreatio.com	ca7e961abb6fa6d2fd1a60b1eb40ac6c	sumitha@kreatio.com	12200	\N	2015-07-09 13:33:40.108113	2015-11-19 12:29:35.497988	7a3774bb	true	Active	1	7795817547
266	Mr	Sujith	Seenivasan	Raj			Male	Unmarried	1988-07-28	\N	3	9500570207	sujithraj@webnish.com	cf448b68fbb35083a9be958c437813cd	srikanthvasuraj@webnish.com		\N	2015-08-27 06:17:21.650498	2015-09-02 11:18:45.157026	\N	false	Active	2	
242	Mr	X. ARUN	PRASATH		BLPPA6694D		Male	Married	1984-04-19	2015-06-08	1	9066261048	arunprasath@webnish.com	b0496432c8acca87af4474d9e189505e	arif@webnish.com	12197	\N	2015-06-16 09:10:25.358508	2015-09-03 07:15:06.656487	\N	false	Active	2	
268	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	mahmood@webnish.com	44ab1370eb802e0fd277ebf9be94547b	\N	\N	\N	2015-09-24 08:57:57.243014	2015-09-24 08:57:57.243014	\N	false	Active	2	\N
274	Mr	Jayachandra	Yenkepally				Male	Married	1984-08-16	2015-10-14	3	9949254565	jayachandra@webnish.com	e5e36ae4fe3137092d21bec4e612b642	sriksrikanthvasuraj@webnish.com		\N	2015-11-02 09:32:21.485291	2015-11-20 05:14:58.570961	\N	false	Active	2	
273	Mr	Arunprakash	jeyapal		BCUPA8203N		Male	Unmarried	1989-09-19	2015-10-07	3	9962013988 	arunprakash@webnish.com	a621cbb3d54df7ae1f8e6d278f290d02	sriksrikanthvasuraj@webnish.com		\N	2015-11-02 09:31:00.219509	2015-11-20 05:29:14.5105	\N	false	Active	2	
255	Mr	Sudheer	Chinnam	kumar	BDOPC8112P		Male	Unmarried	1991-01-20	0015-07-15	3	7207092252	sudheer@webnish.com	d980d660b929617480ed96fd19f128ee	srikanthvasuraj@webnish.com		\N	2015-07-28 05:09:16.921425	2015-11-23 07:15:30.555259	\N	false	Deactivated	2	080-41227462
267	\N	test	\N	\N	\N	\N	male	\N	1988-07-28	\N	3	9903820246	test@test.com	77975e33d2088571de01e8f32d7b7a3a	dibyajyoti@kreatio.com	\N	\N	2015-09-04 12:25:57.85212	2015-09-15 07:44:14.517756	\N	false	Deactivated	\N	\N
278	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	abisonjohn@webnish.com	d5e8990b847e840849da5a40e429bc23	\N	\N	\N	2015-11-23 07:25:35.494869	2015-11-23 07:25:35.494869	\N	false	Active	2	\N
279	Mr	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	adarshvl@webnish.com	f7c80dd7c328088ab2bda5d35d01f7a5	\N	\N	\N	2015-11-23 07:25:58.482769	2015-11-23 07:25:58.482769	\N	false	Active	2	\N
271	Mr	VASUDEVA	DODDAMANI	KHIMENDRA	BLNPD5521J		Male	Unmarried	1990-04-24	2015-10-14	3	8088840480	vasudeva@webnish.com	227084baf2534f7a4c94737940e3bbfc	vasudoddamani94@gmail.com		\N	2015-11-02 09:29:59.712937	2015-11-03 05:23:26.854899	\N	false	Active	2	
269	Mr	Vaidheeswaran 	D		AOUPV6922N		Male	Unmarried	2015-10-13	2015-10-19	3	8973285001	vaidheeswaran@kreatio.com	1758d78b3862dd259e4101308bd110f0	vishnuprabhakar@kreatio.com		\N	2015-10-20 05:05:41.961138	2015-11-03 11:51:55.245758	ab2835f4	false	Active	1	
281	Mr	Ragavendaran	N		AKJPR9503Q		Male	Unmarried	1987-04-26	2013-01-17	3	7411466961	ragavendaran@webnish.com	77a4a48f8d115a0cd69d50d30c5298d7	arunkumar@kreatio.com	12083	\N	2015-12-08 09:19:40.519828	2015-12-08 09:37:00.292239	\N	false	Active	2	
272	Mr	SHYAM	SUNDAR		CZHPK0661H		Male	Married	1982-06-06	\N	3	9951242895	koshikas@webnish.com	a6de5743a9be6280ac7943a95c5eb332	vasudeva@webnish.com		\N	2015-11-02 09:30:38.331261	2015-11-05 14:47:00.119274	\N	false	Active	2	
270	Ms	Sowmya	S		EETPS3230H		Female	Unmarried	1990-04-15	2015-10-26	3	9686301158	sowmya@webnish.com	3e0251920180fb902354adf9af234c56	srikanthvasuraj@webnish.com		\N	2015-11-02 09:29:25.81036	2015-11-10 07:41:02.887873	\N	false	Active	2	
280	Mr	karthikeyan	p				Male	Unmarried	1987-05-27	2015-11-03	3	9443025442	karthikeyan@webnish.com	f035dbc9fd0f0da2261057133582483a	karthikeyan@webnish.com		\N	2015-11-23 07:26:46.646416	2015-12-10 11:21:57.546056	\N	false	Active	2	9739103364
277	Mr	Ravikumar	A				Male	Unmarried	1991-03-05	2015-11-16	3	7411251990	ravikumar@kreatio.com	8eecba9238915d713c67d8746e832471	ramkumar@kreatio.com		\N	2015-11-17 07:29:22.003272	2015-11-17 11:22:44.166468	\N	false	Active	1	
276	Ms	Kaveri	Moger	Timmappa	BSDPM9068E		Female	Unmarried	1991-04-19	2015-11-16	3	9632516431	kaverimojer@kreatio.com	1e00effe80e855807c34948d717b068f	kaverimojer@kreatio.com		\N	2015-11-17 07:29:01.350105	2015-11-17 12:19:04.781684	c31dfb3c	true	Active	1	
282	Mr	Atul	Chandra		AOEPC2198H		Male	Unmarried	1990-01-12	2015-12-09	3	+919810483834	atulchandra@kreatio.com	0aca4b2d4e9a1d0c9410549abe24f090	ajay@kreatio.com		\N	2015-12-10 05:00:16.182376	2015-12-15 06:32:37.560295	a23b7f45	false	Active	1	+919620204514
275	Mr	Adarsh	singh	kumar	GKVPS3359R	PY/BOM/60812/214	Male	Unmarried	1991-01-10	2015-11-06	3	9066335793	adarshkumar@kreatio.com	48a1a5a2d765edfeac9dfd2f292ddb9a	vishnuprabhakar@kreatio.com	12217	\N	2015-11-09 05:35:53.702195	2015-12-17 04:51:23.475828	\N	false	Active	1	9066335793
\.


--
-- Name: employee_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_details_id_seq', 282, true);


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
903	60	2	15	2	13	0	2013	15	\N	\N
889	91	6	84	0	0	0	2013	0	\N	\N
898	94	6	84	0	0	0	2013	0	\N	\N
909	60	8	5	0	5	0	2013	5	\N	\N
906	60	5	5	4.5	0.5	0	2013	5	\N	\N
897	94	5	5	0	5	0	2013	5	\N	\N
888	91	5	5	3.5	1	0	2013	5	\N	\N
912	36	2	15	0	15	0	2013	15	\N	\N
895	94	3	7	6	1	0	2013	7	\N	\N
911	36	1	5	3.5	1.5	0	2013	5	\N	\N
900	94	8	5	0	5	0	2013	5	\N	\N
884	91	1	5	1.5	3.5	0	2013	5	\N	\N
891	91	8	5	1	4	0	2013	5	\N	\N
917	36	7	7	7	0	0	2013	7	\N	\N
919	36	9	0	0	0	0	2013	0	\N	\N
922	76	3	7	7	0	0	2013	7	\N	\N
923	76	4	7	7	0	0	2013	7	\N	\N
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
3242	173	1	5	5	0	0	2014	5	\N	\N
3243	173	2	15	15	0	0	2014	15	\N	\N
3244	173	3	7	7	0	0	2014	7	\N	\N
3245	173	4	7	7	0	0	2014	7	\N	\N
3246	173	5	5	5	0	0	2014	5	\N	\N
3247	173	6	84	84	0	0	2014	84	\N	\N
3249	173	8	5	5	0	0	2014	5	\N	\N
3250	173	9	0	0	0	0	2014	0	\N	\N
3248	173	7	7	0	0	0	2014	0	\N	\N
3170	165	1	5	0	5	0	2014	5	\N	\N
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
3435	194	5	5	2	3	0	2014	5	\N	\N
3431	194	1	5	2	3	0	2014	5	\N	\N
3432	194	2	15	5	10	0	2014	15	\N	\N
3438	194	8	5	0	5	0	2014	5	\N	2015-01-05 09:08:06.187845
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
3630	40	2	15	2	13	0	2015	15	\N	2015-06-26 05:58:42.618025
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
3684	41	2	15	4	11	0	2015	15	\N	2015-11-02 14:00:39.663046
3632	40	4	7	6	1	0	2015	7	\N	2015-04-22 12:07:00.515191
3683	41	1	5	0	5	0	2015	5	\N	2015-08-26 10:03:17.579167
3636	40	8	5	0	5	0	2015	5	\N	2015-11-13 07:20:56.016286
3691	41	9	1	0	1	0	2015	1	\N	2015-11-24 04:56:28.093641
3687	41	5	5	0	5	0	2015	5	\N	2015-12-17 05:37:01.984392
3633	40	5	5	3	2	0	2015	5	\N	2015-08-24 07:45:39.340638
3629	40	1	5	3	2	0	2015	5	\N	2015-11-13 07:20:29.40417
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
3756	48	2	15	4	11	0	2015	15	\N	2015-09-23 08:45:09.659741
3753	70	8	5	3	2	0	2015	5	\N	2015-04-07 06:38:12.685806
3768	44	5	5	4	1	0	2015	5	\N	2015-04-14 06:57:45.37504
3721	71	3	7	6	1	0	2015	7	\N	2015-01-20 12:32:23.421677
3714	33	5	5	4	1	0	2015	5	\N	2015-11-30 10:40:15.767758
3750	70	5	5	0	5	0	2015	5	\N	2015-09-09 08:44:03.302211
3762	48	8	5	4	1	0	2015	5	\N	2015-09-16 12:30:41.727213
3719	71	1	5	0	5	0	2015	5	\N	2015-11-18 05:59:17.334788
3723	71	5	5	0	5	0	2015	5	\N	2015-12-07 12:35:39.096988
3755	48	1	5	2	3	0	2015	5	\N	2015-10-16 06:19:36.450585
3765	44	2	15	10	5	0	2015	15	\N	2015-04-09 13:47:00.286555
3726	71	8	5	0	5	0	2015	5	\N	2015-11-18 05:58:36.661048
3751	70	6	84	24	60	0	2015	84	\N	2015-09-10 09:46:59.87482
3710	33	1	5	0	5	0	2015	5	\N	2015-08-12 12:56:10.696446
3746	70	1	5	0	5	0	2015	5	\N	2015-09-09 08:46:02.036437
3711	33	2	15	1	14	0	2015	15	\N	2015-10-20 15:35:50.847826
3720	71	2	15	0	15	0	2015	15	\N	2015-12-07 12:29:17.280617
3763	48	9	4	0	4	0	2015	4	\N	2015-11-12 06:42:58.019262
3725	71	7	7	0	7	0	2015	7	\N	2015-12-07 12:24:23.233404
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
3834	54	8	5	3	2	0	2015	5	\N	2015-03-11 04:59:54.958616
3831	54	5	5	2	3	0	2015	5	\N	2015-09-04 07:34:03.318276
3804	91	5	5	1.5	3.5	0	2015	5	\N	2015-10-09 10:05:44.934794
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
3849	94	5	5	0.5	4.5	0	2015	5	\N	2015-11-17 05:42:59.360535
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
4035	90	2	15	3	12	0	2015	15	\N	2015-12-10 08:43:37.127248
4015	95	9	2	0	2	0	2015	2	\N	2015-07-01 12:44:00.768709
4014	95	8	5	2	3	0	2015	5	\N	2015-10-21 09:19:44.156403
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
4221	63	8	5	1	4	0	2015	5	\N	2015-04-27 06:21:57.849257
4143	101	2	15	1	14	0	2015	15	\N	2015-11-30 04:48:06.702009
4149	101	8	5	3	2	0	2015	5	\N	2015-09-23 12:54:59.872688
4194	102	8	5	1	4	0	2015	5	\N	2015-10-26 07:38:07.82977
4170	29	2	15	4	11	0	2015	15	\N	2015-07-06 15:12:07.768917
4197	52	2	15	0	15	0	2015	15	\N	2015-03-30 07:03:52.232496
4218	63	5	5	0	5	0	2015	5	\N	2015-12-21 10:56:29.130833
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
4437	133	8	5	5	0	0	2015	5	\N	\N
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
4434	133	5	5	3	2	0	2015	5	\N	2015-12-22 08:07:10.204764
4431	133	2	15	2	13	0	2015	15	\N	2015-11-06 13:58:26.105076
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
4551	131	5	5	0.5	4.5	0	2015	5	\N	2015-12-21 12:25:26.637779
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
4592	143	1	5	0	5	0	2015	5	\N	2015-10-13 07:01:01.446874
4596	143	5	5	1	4	0	2015	5	\N	2015-12-21 08:20:40.150593
4582	59	9	2	1	1	0	2015	2	\N	2015-06-30 06:11:51.747042
4646	151	1	5	2	3	0	2015	5	\N	2015-12-17 09:11:57.361236
4645	142	9	3	0	3	0	2015	3	\N	2015-08-31 04:47:09.718715
4657	158	3	7	4	3	0	2015	7	\N	2015-02-19 04:57:12.891383
4584	145	2	15	0	15	0	2015	15	\N	2015-05-28 05:17:53.090087
4637	142	1	5	1	4	0	2015	5	\N	2015-12-07 04:21:47.887329
4626	171	8	5	1	4	0	2015	5	\N	2015-11-10 13:35:52.672238
4655	158	1	5	4	1	0	2015	5	\N	2015-07-10 03:33:38.306923
4644	142	8	5	1	4	0	2015	5	\N	2015-12-23 13:46:22.789648
4600	143	9	1	0	1	0	2015	1	\N	2015-02-24 05:25:16.219664
4650	151	5	5	0.5	4.5	0	2015	5	\N	2015-12-17 09:12:27.239097
4583	145	1	5	0	5	0	2015	5	\N	2015-03-26 08:46:43.975805
4620	171	2	15	7	8	0	2015	15	\N	2015-08-06 04:49:09.621201
4599	143	8	5	2	3	0	2015	5	\N	2015-10-27 07:11:11.397856
4587	145	5	5	1	4	0	2015	5	\N	2015-07-12 16:16:37.24094
4623	171	5	5	2.5	2.5	0	2015	5	\N	2015-10-12 09:00:33.234116
4667	149	4	7	7	0	0	2015	7	\N	\N
4668	149	5	5	5	0	0	2015	5	\N	\N
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
4682	163	1	5	0	5	0	2015	5	\N	2015-03-09 08:57:49.495486
4729	169	3	7	5	2	0	2015	7	\N	2015-11-05 07:27:12.251114
4725	168	8	5	4	1	0	2015	5	\N	2015-04-02 10:43:45.424227
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
4761	160	8	5	2	3	0	2015	5	\N	2015-10-27 05:32:34.029813
4767	159	5	5	3.5	1.5	0	2015	5	\N	2015-08-20 09:07:35.834452
4758	160	5	5	2	3	0	2015	5	\N	2015-03-16 05:05:31.234725
4762	160	9	3	1	2	0	2015	3	\N	2015-08-27 13:01:39.8999
4815	176	8	5	2	3	0	2015	5	\N	2015-10-27 06:39:14.541147
4809	176	2	15	7	8	0	2015	15	\N	2015-10-27 06:40:48.297722
4808	176	1	5	2	3	0	2015	5	\N	2015-06-22 07:27:39.897507
4765	159	3	7	4	3	0	2015	7	\N	2015-07-16 04:35:15.798463
4764	159	2	15	9	6	0	2015	15	\N	2015-11-06 15:48:09.821174
4763	159	1	5	0	5	0	2015	5	\N	2015-11-16 03:45:16.573329
4843	183	9	0	0	0	0	2015	0	\N	\N
4844	192	1	5	5	0	0	2015	5	\N	\N
4845	192	2	15	15	0	0	2015	15	\N	\N
4846	192	3	7	7	0	0	2015	7	\N	\N
4847	192	4	7	7	0	0	2015	7	\N	\N
4848	192	5	5	5	0	0	2015	5	\N	\N
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
5004	177	8	5	4	1	0	2015	5	\N	2015-01-09 13:24:42.252185
5013	179	8	5	4	1	0	2015	5	\N	2015-01-05 13:46:06.337857
4970	191	1	5	0	5	0	2015	5	\N	2015-07-07 04:01:46.473011
5007	179	2	15	6	9	0	2015	15	\N	2015-01-09 09:46:13.144803
5005	177	9	6	5	1	0	2015	6	\N	2015-06-30 06:10:52.841193
4995	194	8	5	3	2	0	2015	5	\N	2015-01-14 07:58:50.688796
4943	203	1	5	2	3	0	2015	5	\N	2015-02-05 03:33:59.982446
5001	177	5	5	4.5	0.5	0	2015	5	\N	2015-09-25 04:14:04.299192
4988	194	1	5	1	4	0	2015	5	\N	2015-03-05 05:06:50.096912
4997	177	1	5	1	4	0	2015	5	\N	2015-05-27 05:05:25.564808
4947	203	5	5	4	1	0	2015	5	\N	2015-04-30 08:16:28.80702
4998	177	2	15	8	7	0	2015	15	\N	2015-11-09 14:30:42.831329
5019	189	5	5	5	0	0	2015	5	\N	\N
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
5088	196	2	15	1	14	0	2015	15	\N	2015-11-06 10:48:49.484444
5106	215	2	15	3	12	0	2015	15	\N	2015-12-18 10:59:34.647588
5091	196	5	5	4.5	0.5	0	2015	5	\N	2015-06-25 09:48:06.860311
5037	178	5	5	2	3	0	2015	5	\N	2015-11-24 10:41:07.407554
5033	178	1	5	1	4	0	2015	5	\N	2015-10-13 11:06:15.303395
5040	178	8	5	0	5	0	2015	5	\N	2015-10-13 10:53:37.11519
5069	201	1	5	0	5	0	2015	5	\N	2015-05-19 12:47:44.477896
5052	197	2	15	0	15	0	2015	15	\N	2015-08-12 04:50:41.161618
5087	196	1	5	2	3	0	2015	5	\N	2015-09-04 05:46:41.452909
5073	201	5	5	0	5	0	2015	5	\N	2015-12-23 13:20:32.906741
5051	197	1	5	0	5	0	2015	5	\N	2015-07-02 06:49:20.618155
5105	215	1	5	1	4	0	2015	5	\N	2015-12-07 04:21:31.044563
5058	197	8	5	2	3	0	2015	5	\N	2015-11-30 07:13:17.921098
5094	196	8	5	3	2	0	2015	5	\N	2015-11-06 10:49:18.721133
5107	215	3	7	7	0	0	2015	7	\N	\N
5108	215	4	7	7	0	0	2015	7	\N	\N
5111	215	7	7	7	0	0	2015	7	\N	\N
5113	215	9	0	0	0	0	2015	0	\N	\N
5116	99	3	7	7	0	0	2015	7	\N	\N
5117	99	4	7	7	0	0	2015	7	\N	\N
5120	99	7	7	7	0	0	2015	7	\N	\N
5125	212	3	7	7	0	0	2015	7	\N	\N
5126	212	4	7	7	0	0	2015	7	\N	\N
5127	212	5	5	5	0	0	2015	5	\N	\N
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
5184	211	8	5	1	4	0	2015	5	\N	2015-11-26 04:15:47.611077
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
5159	210	1	5	1	4	0	2015	5	\N	2015-11-03 04:51:18.583687
5189	213	4	7	0	7	0	2015	7	\N	2015-04-23 04:54:34.397223
5112	215	8	5	4	1	0	2015	5	\N	2015-12-18 10:59:57.297064
5143	209	3	7	4	3	0	2015	7	\N	2015-09-01 04:52:46.01806
5141	209	1	5	0	5	0	2015	5	\N	2015-09-21 11:55:09.422249
5133	214	2	15	12	3	0	2015	15	\N	2015-11-23 07:32:14.842595
5123	212	1	5	0	5	0	2015	5	\N	2015-12-08 06:02:01.905467
5163	210	5	5	2	3	0	2015	5	\N	2015-12-21 08:56:25.359053
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
5220	218	8	5	2	3	0	2015	5	2015-01-19 09:12:43.877103	2015-11-10 18:20:24.727718
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
4593	143	2	15	2	13	0	2015	15	\N	2015-12-21 08:22:16.19653
4689	163	8	5	1	4	0	2015	5	\N	2015-08-12 04:42:31.433081
4196	52	1	5	1	4	0	2015	5	\N	2015-10-27 07:32:05.46686
5195	216	1	5	0	5	0	2015	5	2015-01-05 06:57:43.507713	2015-09-28 09:00:56.90793
5196	216	2	15	4	11	0	2015	15	2015-01-05 06:57:43.572094	2015-09-28 09:08:13.733634
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
5208	217	5	5	4	1	0	2015	5	2015-01-09 10:30:22.655518	2015-09-14 06:44:48.500811
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
5286	226	2	15	2	13	0	2015	15	2015-02-17 06:44:51.147953	2015-12-11 12:09:44.276474
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
5235	220	5	5	4	1	0	2015	5	2015-01-22 06:56:42.399614	2015-09-30 06:51:20.152226
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
5238	220	8	5	3	2	0	2015	5	2015-01-22 06:56:42.442433	2015-11-30 09:01:50.93461
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
4203	52	8	5	1	4	0	2015	5	\N	2015-10-27 07:32:23.852367
4870	170	9	1	1	0	0	2015	1	\N	2015-04-09 05:16:16.138045
4392	140	8	5	0	5	0	2015	5	\N	2015-09-16 05:26:00.781609
4007	95	1	5	1	4	0	2015	5	\N	2015-11-30 06:40:48.403031
5292	226	8	5	1	4	0	2015	5	2015-02-17 06:44:51.261017	2015-11-28 12:32:37.011235
5296	227	3	7	5	2	0	2015	7	2015-02-19 04:21:28.47821	2015-11-05 09:29:36.545288
5181	211	5	5	0	5	0	2015	5	\N	2015-07-08 03:48:53.197635
4641	142	5	5	0.5	4.5	0	2015	5	\N	2015-09-14 07:37:39.445095
5313	229	2	15	4	11	0	2015	15	2015-03-05 08:03:58.576285	2015-11-30 12:55:53.102553
4754	160	1	5	0	5	0	2015	5	\N	2015-11-24 09:28:05.190879
5331	231	2	15	5	10	0	2015	15	2015-03-13 04:52:04.861982	2015-10-27 09:31:42.976774
4653	151	8	5	1	26	0	2015	5	\N	2015-10-07 07:39:33.938234
3864	45	2	15	2	13	0	2015	15	\N	2015-10-27 13:38:26.029057
5294	227	1	5	4	1	0	2015	5	2015-02-19 04:21:28.442375	2015-09-22 06:29:14.03688
5298	227	5	5	4	1	0	2015	5	2015-02-19 04:21:28.507128	2015-12-07 09:18:43.600715
4554	131	8	5	0	5	0	2015	5	\N	2015-12-21 12:19:56.53922
5316	229	5	5	4.5	0.5	0	2015	5	2015-03-05 08:03:58.618055	2015-09-22 06:47:06.775724
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
5369	235	4	7	7	0	0	2015	7	2015-04-13 08:34:38.31077	2015-04-13 08:34:38.31077
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
5370	235	5	5	3.5	1.5	0	2015	5	2015-04-13 08:34:38.325643	2015-12-09 06:40:08.446736
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
5034	178	2	15	1	14	0	2015	15	\N	2015-11-24 10:40:48.548586
3846	94	2	15	0	15	0	2015	15	\N	2015-09-30 08:02:45.953133
5373	235	8	5	1	4	0	2015	5	2015-04-13 08:34:38.368453	2015-11-09 09:54:30.928198
4896	188	8	5	0	5	0	2015	5	\N	2015-08-31 13:35:16.580507
5352	233	5	5	1.5	3.5	0	2015	5	2015-04-09 11:06:10.432414	2015-08-20 08:59:36.764714
5367	235	2	15	9	6	0	2015	15	2015-04-13 08:34:38.270895	2015-11-24 07:59:14.157792
5355	233	8	5	4	1	0	2015	5	2015-04-09 11:06:10.476412	2015-09-28 06:44:42.052493
3900	30	2	15	4	11	0	2015	15	\N	2015-09-29 05:20:34.629331
5385	237	2	15	5	10	0	2015	15	2015-04-23 06:57:52.763636	2015-10-05 06:06:59.358093
5349	233	2	15	13	2	0	2015	15	2015-04-09 11:06:10.365912	2015-11-30 12:29:55.298811
5391	237	8	5	1	4	0	2015	5	2015-04-23 06:57:52.857493	2015-12-23 11:50:52.224145
5410	239	9	0	0	0	0	2015	0	2015-06-01 10:40:11.714934	2015-06-01 10:40:11.714934
5145	209	5	5	0	5	0	2015	5	\N	2015-11-30 07:34:01.161537
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
5460	245	5	5	5	0	0	2015	5	2015-06-17 10:21:08.811066	2015-06-17 10:21:08.811066
5462	245	7	7	7	0	0	2015	7	2015-06-17 10:21:08.839944	2015-06-17 10:21:08.839944
5463	245	8	5	5	0	0	2015	5	2015-06-17 10:21:08.85389	2015-06-17 10:21:08.85389
5464	245	9	0	0	0	0	2015	0	2015-06-17 10:21:08.868838	2015-06-17 10:21:08.868838
5461	245	6	84	0	0	0	2015	0	2015-06-17 10:21:08.825037	2015-06-17 10:21:08.886074
5465	246	1	5	5	0	0	2015	5	2015-06-17 10:21:32.735527	2015-06-17 10:21:32.735527
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
5484	248	2	15	15	0	0	2015	15	2015-06-17 10:22:13.922586	2015-06-17 10:22:13.922586
5486	248	4	7	7	0	0	2015	7	2015-06-17 10:22:13.951298	2015-06-17 10:22:13.951298
5488	248	6	84	0	0	0	2015	0	2015-06-17 10:22:13.979211	2015-06-17 10:22:14.061011
5501	250	1	5	5	0	0	2015	5	2015-06-23 04:43:36.168331	2015-06-23 04:43:36.168331
5421	241	2	15	12	3	0	2015	15	2015-06-09 09:46:15.243225	2015-07-29 02:43:06.420996
5485	248	3	7	5	2	0	2015	7	2015-06-17 10:22:13.9364	2015-10-05 13:46:23.991654
5487	248	5	5	4.5	0.5	0	2015	5	2015-06-17 10:22:13.965221	2015-08-21 08:50:53.020251
5429	242	1	5	4	1	0	2015	5	2015-06-16 09:10:25.426732	2015-12-04 04:22:44.379241
5436	242	8	5	1	4	0	2015	5	2015-06-16 09:10:25.532215	2015-12-16 08:24:31.332408
5469	246	5	5	4.5	0.5	0	2015	5	2015-06-17 10:21:32.892893	2015-09-08 09:44:02.93648
5475	247	2	15	14	1	0	2015	15	2015-06-17 10:21:59.042427	2015-11-05 05:28:52.575004
5433	242	5	5	0.5	4.5	0	2015	5	2015-06-16 09:10:25.49028	2015-12-02 06:58:52.510066
5466	246	2	15	13	2	0	2015	15	2015-06-17 10:21:32.750644	2015-12-21 13:10:46.746335
5456	245	1	5	2	3	0	2015	5	2015-06-17 10:21:08.75337	2015-12-04 07:21:34.652229
5489	248	7	7	7	0	0	2015	7	2015-06-17 10:22:13.994222	2015-06-17 10:22:13.994222
5490	248	8	5	5	0	0	2015	5	2015-06-17 10:22:14.008168	2015-06-17 10:22:14.008168
5491	248	9	0	0	0	0	2015	0	2015-06-17 10:22:14.022011	2015-06-17 10:22:14.022011
5493	249	2	15	15	0	0	2015	15	2015-06-23 04:42:37.694342	2015-06-23 04:42:37.694342
5494	249	3	7	7	0	0	2015	7	2015-06-23 04:42:37.707804	2015-06-23 04:42:37.707804
5495	249	4	7	7	0	0	2015	7	2015-06-23 04:42:37.72246	2015-06-23 04:42:37.72246
5496	249	5	5	5	0	0	2015	5	2015-06-23 04:42:37.73607	2015-06-23 04:42:37.73607
5498	249	7	7	7	0	0	2015	7	2015-06-23 04:42:37.765362	2015-06-23 04:42:37.765362
5500	249	9	0	0	0	0	2015	0	2015-06-23 04:42:37.80194	2015-06-23 04:42:37.80194
5497	249	6	84	0	0	0	2015	0	2015-06-23 04:42:37.749693	2015-06-23 04:42:37.819364
5492	249	1	5	4	1	0	2015	5	2015-06-23 04:42:37.679511	2015-07-28 05:08:39.388818
5366	235	1	5	0	5	0	2015	5	2015-04-13 08:34:38.252344	2015-08-31 06:43:55.316385
5499	249	8	5	4	1	0	2015	5	2015-06-23 04:42:37.788369	2015-09-23 12:20:21.289052
5503	250	3	7	7	0	0	2015	7	2015-06-23 04:43:36.204933	2015-06-23 04:43:36.204933
5504	250	4	7	7	0	0	2015	7	2015-06-23 04:43:36.21971	2015-06-23 04:43:36.21971
5507	250	7	7	7	0	0	2015	7	2015-06-23 04:43:36.261442	2015-06-23 04:43:36.261442
5508	250	8	5	5	0	0	2015	5	2015-06-23 04:43:36.275113	2015-06-23 04:43:36.275113
5509	250	9	0	0	0	0	2015	0	2015-06-23 04:43:36.288783	2015-06-23 04:43:36.288783
5506	250	6	84	0	0	0	2015	0	2015-06-23 04:43:36.246868	2015-06-23 04:43:36.305942
5505	250	5	5	4	1	0	2015	5	2015-06-23 04:43:36.23319	2015-11-30 11:37:50.356123
5502	250	2	15	12	3	0	2015	15	2015-06-23 04:43:36.191292	2015-12-23 13:18:17.822714
3984	51	5	5	0	5	0	2015	5	\N	2015-09-02 07:16:45.484157
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
5430	242	2	15	9	6	0	2015	15	2015-06-16 09:10:25.4486	2015-12-16 08:24:01.742789
5573	258	1	5	4	1	0	2015	5	2015-08-05 09:41:06.318508	2015-09-10 16:56:26.352268
5528	253	1	5	4	1	0	2015	5	2015-07-27 07:36:57.741606	2015-09-28 03:45:43.204328
5526	252	8	5	4	1	0	2015	5	2015-07-14 05:28:05.556551	2015-11-09 12:29:42.354783
5520	252	2	15	13	2	0	2015	15	2015-07-14 05:28:05.472865	2015-11-09 12:30:10.130553
5581	258	9	0	0	0	0	2015	0	2015-08-05 09:41:06.441569	2015-08-05 09:41:06.441569
5583	259	2	15	15	0	0	2015	15	2015-08-06 05:24:35.358786	2015-08-06 05:24:35.358786
5584	259	3	7	7	0	0	2015	7	2015-08-06 05:24:35.389601	2015-08-06 05:24:35.389601
5585	259	4	7	7	0	0	2015	7	2015-08-06 05:24:35.417564	2015-08-06 05:24:35.417564
5586	259	5	5	5	0	0	2015	5	2015-08-06 05:24:35.431731	2015-08-06 05:24:35.431731
5588	259	7	7	7	0	0	2015	7	2015-08-06 05:24:35.469017	2015-08-06 05:24:35.469017
5589	259	8	5	5	0	0	2015	5	2015-08-06 05:24:35.482536	2015-08-06 05:24:35.482536
5590	259	9	0	0	0	0	2015	0	2015-08-06 05:24:35.497039	2015-08-06 05:24:35.497039
5587	259	6	84	0	0	0	2015	0	2015-08-06 05:24:35.455545	2015-08-06 05:24:35.523966
4215	63	2	15	1	14	0	2015	15	\N	2015-08-11 12:29:49.143264
5592	260	2	15	15	0	0	2015	15	2015-08-12 05:52:47.997128	2015-08-12 05:52:47.997128
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
5646	266	2	15	15	0	0	2015	15	2015-08-27 06:17:21.730993	2015-08-27 06:17:21.730993
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
5645	266	1	5	3	2	0	2015	5	2015-08-27 06:17:21.707478	2015-11-30 07:04:44.674415
5636	265	1	5	4	1	0	2015	5	2015-08-26 10:34:50.80874	2015-11-03 09:23:34.943247
5591	260	1	5	4	1	0	2015	5	2015-08-12 05:52:47.975916	2015-12-10 04:44:46.133852
5595	260	5	5	3	2	0	2015	5	2015-08-12 05:52:48.039004	2015-10-26 05:29:17.173863
5598	260	8	5	3	2	0	2015	5	2015-08-12 05:52:48.182065	2015-11-30 06:06:25.36321
5097	185	2	15	8	7	0	2015	15	\N	2015-12-16 08:35:45.782566
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
4728	169	2	15	0	15	0	2015	15	\N	2015-12-17 09:06:35.871754
5753	279	1	5	5	0	0	2015	5	2015-11-23 07:25:58.620779	2015-11-23 07:25:58.620779
5754	279	2	15	15	0	0	2015	15	2015-11-23 07:25:58.647146	2015-11-23 07:25:58.647146
5755	279	3	7	7	0	0	2015	7	2015-11-23 07:25:58.681196	2015-11-23 07:25:58.681196
5756	279	4	7	7	0	0	2015	7	2015-11-23 07:25:58.695207	2015-11-23 07:25:58.695207
5757	279	5	5	5	0	0	2015	5	2015-11-23 07:25:58.709963	2015-11-23 07:25:58.709963
5759	279	7	7	7	0	0	2015	7	2015-11-23 07:25:58.737994	2015-11-23 07:25:58.737994
5760	279	8	5	5	0	0	2015	5	2015-11-23 07:25:58.763194	2015-11-23 07:25:58.763194
5761	279	9	0	0	0	0	2015	0	2015-11-23 07:25:58.776862	2015-11-23 07:25:58.776862
5758	279	6	84	0	0	0	2015	0	2015-11-23 07:25:58.72411	2015-11-23 07:25:58.804394
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
5241	221	2	15	9	6	0	2015	15	2015-02-02 07:50:58.599824	2015-11-26 12:59:57.142391
5772	281	2	15	15	0	0	2015	15	2015-12-08 09:19:40.595636	2015-12-08 09:19:40.595636
5773	281	3	7	7	0	0	2015	7	2015-12-08 09:19:40.608742	2015-12-08 09:19:40.608742
5774	281	4	7	7	0	0	2015	7	2015-12-08 09:19:40.622099	2015-12-08 09:19:40.622099
5777	281	7	7	7	0	0	2015	7	2015-12-08 09:19:40.663622	2015-12-08 09:19:40.663622
5778	281	8	5	5	0	0	2015	5	2015-12-08 09:19:40.678117	2015-12-08 09:19:40.678117
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
5775	281	5	5	4.5	0.5	0	2015	5	2015-12-08 09:19:40.636575	2015-12-23 08:25:41.155395
\.


--
-- Name: leave_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('leave_details_id_seq', 5788, true);


--
-- Data for Name: leave_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY leave_records (id, leave_type_id, no_of_days, employee_detail_id, year, from_date, to_date, reason, status, created_at, updated_at) FROM stdin;
1	2	2	7	2012	2012-09-21	2012-09-24	home	approved	\N	\N
2	2	4	29	2012	2012-10-23	2012-10-28	going to native.	cancelled	\N	\N
16	1	1	28	2012	2012-11-02	2012-11-02	Ear Operation	cancelled	\N	\N
21	2	1	68	2012	2012-10-12	2012-10-12	Need to go hospital	cancelled	\N	\N
24	2	1	68	2012	2012-10-12	2012-10-12	Need to go to hospital	approved	\N	\N
27	8	1	10	2012	2012-10-27	2012-10-27	As availed optional leave	cancelled	\N	\N
25	2	2	34	2012	2012-10-18	2012-10-19	personal	cancelled	\N	\N
6	2	4	52	2012	2012-10-17	2012-10-22	I will be out of station.	cancelled	\N	\N
8	2	2	52	2012	2012-10-25	2012-10-26	I will be out of station.	cancelled	\N	\N
2690	8	1	29	2014	2014-12-25	2014-12-25	For Christmas festival 	approved	\N	\N
37	5	1	44	2012	2012-10-19	2012-10-19	My train is at 4 pm for going native	cancelled	\N	\N
38	1	0.5	44	2012	2012-10-19	2012-10-19	My train is at 4 pm for going native	cancelled	\N	\N
58	5	0.5	54	2012	2012-10-29	2012-10-29	Personal Issue	approved	\N	\N
42	8	3	33	2012	2012-10-24	2012-10-26	going native.	cancelled	\N	\N
43	2	1	33	2012	2012-10-25	2012-10-25	going native	approved	\N	\N
47	8	1	89	2012	2012-10-23	2012-10-23	Festival	approved	\N	\N
48	8	1	54	2012	2012-10-26	2012-10-26	Going Home for festival	approved	\N	\N
41	5	1	43	2012	2012-10-29	2012-10-29	Due to Uncle Marriage Function.	approved	\N	\N
28	9	2	10	2012	2012-10-29	2012-10-30	Sister Marriage	approved	\N	\N
29	2	1	10	2012	2012-10-31	2012-10-31	Sister Marriage	approved	\N	\N
32	8	1	10	2012	2012-10-26	2012-10-26	As availed optional leave	approved	\N	\N
2065	8	1	101	2014	2014-08-29	2014-08-29	Festival	approved	\N	\N
44	8	1	59	2012	2012-10-26	2012-10-26	available optional leave	approved	\N	\N
56	2	1	47	2012	2012-10-29	2012-10-29	To go to my hometown.	approved	\N	\N
31	5	0.5	59	2012	2012-10-15	2012-10-15	Not feeling well	approved	\N	\N
45	2	1	59	2012	2012-10-29	2012-10-29	going for sister marriage	approved	\N	\N
57	5	0	54	2012	2012-10-29	2012-10-29	Personal issue	cancelled	\N	\N
60	2	1	34	2012	2012-10-29	2012-10-29	personal work	cancelled	\N	\N
62	1	1	89	2012	2012-10-29	2012-10-29	Sick	approved	\N	\N
51	5	0.5	51	2012	2012-10-23	2012-10-23	For festival	approved	\N	\N
3	8	2	29	2012	2012-10-23	2012-10-24	going to native	approved	\N	\N
40	9	1	51	2012	2012-11-02	2012-11-02	Having some personal work	approved	\N	\N
78	3	1	59	2012	2012-10-31	2012-10-31	not feeling well	approved	\N	\N
11	2	1	28	2012	2012-10-22	2012-10-22	Ear Operation	approved	\N	\N
12	8	2	28	2012	2012-10-23	2012-10-24	Ear Operation	approved	\N	\N
19	2	1	28	2012	2012-11-02	2012-11-02	Ear Operation	approved	\N	\N
14	8	1	28	2012	2012-10-26	2012-10-26	Ear Operation	approved	\N	\N
15	2	3	28	2012	2012-10-29	2012-10-31	Ear Operation	approved	\N	\N
18	2	5	28	2012	2012-11-05	2012-11-09	Ear Operation	approved	\N	\N
75	2	1	47	2012	2012-11-14	2012-11-14	Deepavali Festival	approved	\N	\N
85	2	1	34	2012	2012-11-12	2012-11-12	deepavali	approved	\N	\N
69	8	1	67	2012	2012-10-24	2012-10-24	going to temple	approved	\N	\N
86	8	1	34	2012	2012-11-13	2012-11-13	deepavali	approved	\N	\N
83	2	1	44	2012	2012-11-12	2012-11-12	going to native	approved	\N	\N
88	9	1	53	2012	2012-11-12	2012-11-12	going home for festival	approved	\N	\N
79	2	1	38	2012	2012-11-12	2012-11-12	Going Home	approved	\N	\N
80	8	1	38	2012	2012-11-13	2012-11-13	Diwali	approved	\N	\N
87	2	1	34	2012	2012-11-14	2012-11-14	deepavali	cancelled	\N	\N
68	2	2	67	2012	2012-10-18	2012-10-19	Not feeling will	approved	\N	\N
17	5	0	67	2012	2012-10-09	2012-10-09	Going to hospital 	approved	\N	\N
76	1	1	77	2012	2012-10-30	2012-10-30	Not feel well	approved	\N	\N
54	5	0.5	50	2012	2012-10-24	2012-10-24	Personal Work	approved	\N	\N
26	5	0.5	50	2012	2012-10-12	2012-10-12	Personal Work	approved	\N	\N
61	2	0.5	34	2012	2012-10-29	2012-10-29	personal work	approved	\N	\N
22	2	1	44	2012	2012-10-22	2012-10-22	going to native	approved	\N	\N
39	5	0.5	44	2012	2012-10-19	2012-10-19	My train is at 4 pm for going native\r\n	approved	\N	\N
33	8	1	38	2012	2012-10-24	2012-10-24	vijayadasami festival	approved	\N	\N
23	8	2	44	2012	2012-10-23	2012-10-24	festival	approved	\N	\N
35	2	5	42	2012	2012-11-12	2012-11-16	I will go to my home down.	approved	\N	\N
77	1	0.5	37	2012	2012-11-02	2012-11-02	Due to Eye paining	approved	\N	\N
20	1	0	81	2012	2012-10-09	2012-10-09	Not feeling well 	approved	\N	\N
55	5	0.5	81	2012	2012-10-24	2012-10-24	Pooja preparations	approved	\N	\N
9	2	1	70	2012	2012-10-09	2012-10-09	Due to Some Urgent Personal Work.	approved	\N	\N
71	2	1	70	2012	2012-11-02	2012-11-02	I need to go my native  place due to some urgent work.	approved	\N	\N
7	8	2	52	2012	2012-10-23	2012-10-24	Festival Dusshera.	approved	\N	\N
34	1	0.5	52	2012	2012-10-17	2012-10-17	I am not feeling well.	approved	\N	\N
10	2	11	46	2012	2012-11-06	2012-11-20	Diwali vacation	approved	\N	\N
65	8	1	31	2012	2012-11-13	2012-11-13	for diwali festival	approved	\N	\N
66	2	1	31	2012	2012-11-14	2012-11-14	for diwali festival	approved	\N	\N
64	2	1	31	2012	2012-11-12	2012-11-12	for diwali festival	approved	\N	\N
70	2	3	72	2012	2012-10-12	2012-10-16	Going Native for Festival	approved	\N	\N
73	2	1	78	2012	2012-10-30	2012-10-30	Was not well.	approved	\N	\N
50	8	1	78	2012	2012-10-23	2012-10-23	Dasara festival.	approved	\N	\N
59	2	1	80	2012	2012-11-02	2012-11-02	As I am Going to My Native.	approved	\N	\N
5	2	1	29	2012	2012-10-25	2012-10-25	Going to native	approved	\N	\N
49	5	1	29	2012	2012-10-22	2012-10-22	Going to native	approved	\N	\N
84	5	0.5	29	2012	2012-11-05	2012-11-05	Not feeling well	approved	\N	\N
4	8	1	29	2012	2012-10-26	2012-10-26	Going to native	approved	\N	\N
30	8	1	76	2012	2012-10-26	2012-10-26	Bakrid	approved	\N	\N
46	2	1	29	2012	2012-10-29	2012-10-29	Going to native	approved	\N	\N
53	8	1	82	2012	2012-10-26	2012-10-26	As Availed Optional Leave	approved	\N	\N
67	2	1	71	2012	2012-11-02	2012-11-02	Out of Station	approved	\N	\N
72	5	1	76	2012	2012-10-29	2012-10-29	went to native	approved	\N	\N
81	8	1	56	2012	2012-11-13	2012-11-13	I am going to my native place.	approved	\N	\N
82	8	1	56	2012	2012-11-15	2012-11-15	As I am going  to my  native place.	approved	\N	\N
13	2	1	28	2012	2012-10-25	2012-10-25	Ear Operation	approved	\N	\N
74	8	1	47	2012	2012-11-13	2012-11-13	Deepavali Festival	approved	\N	\N
101	8	1	85	2012	2012-11-13	2012-11-13	Diwali Festival	approved	\N	\N
108	8	1	50	2012	2012-11-13	2012-11-13	Festival	approved	\N	\N
103	2	7	52	2012	2012-12-14	2012-12-24	I will be out of station.	approved	\N	\N
2068	5	0.5	80	2014	2014-08-26	2014-08-26	AS i have some personal work.	approved	\N	\N
2069	3	1	102	2014	2014-08-25	2014-08-25	Grandfather passed away	approved	\N	\N
2079	5	1	131	2014	2014-08-18	2014-08-18	Time off	approved	\N	\N
2082	8	1	33	2014	2014-08-29	2014-08-29	Optional	approved	\N	\N
2066	2	1	87	2014	2014-09-01	2014-09-01	Going to my native for family function.	approved	\N	\N
2077	8	1	171	2014	2014-08-29	2014-08-29	On eve of Ganesh Chathurthi	approved	\N	\N
2070	8	1	51	2014	2014-08-29	2014-08-29	For Ganesha festival	approved	\N	\N
2074	8	1	94	2014	2014-08-29	2014-08-29	Ganesha fest	approved	\N	\N
94	2	3	82	2012	2012-11-14	2012-11-16	Going Home Town.	approved	\N	\N
2640	8	1	59	2014	2014-12-31	2014-12-31	As available optional leave	approved	\N	\N
2641	5	2	170	2014	2014-12-15	2014-12-16	Went to home town.	approved	\N	\N
2645	2	3	30	2014	2014-12-25	2014-12-29	personal work	cancelled	\N	\N
2691	1	2	212	2014	2014-12-16	2014-12-17	Met with an accident	approved	\N	\N
2705	9	1	40	2014	2014-12-29	2014-12-29	Availing my Comp off leave	approved	\N	\N
2711	8	1	91	2014	2014-12-16	2014-12-16	deducted for not applying leave 	approved	\N	\N
2716	8	1	101	2014	2014-12-26	2014-12-26	Going Native	approved	\N	\N
2722	1	1	188	2014	2014-12-24	2014-12-24	operated	approved	\N	\N
2727	8	2	52	2014	2014-12-25	2014-12-26	Christmas	approved	\N	\N
2737	8	1	163	2014	2014-12-25	2014-12-25	for not applying leave It has been deducted	approved	\N	\N
2749	2	1	200	2014	2014-12-31	2014-12-31	To celebration New Year.	cancelled	\N	\N
2750	2	2	200	2015	2015-01-01	2015-01-02	To celebration New Year.	cancelled	\N	\N
2728	2	1	134	2014	2014-12-30	2014-12-30	Going out of Bangalore. 	approved	\N	\N
2744	8	1	168	2014	2014-12-31	2014-12-31	End Of Year\r\n	approved	\N	\N
2729	8	1	134	2014	2014-12-31	2014-12-31	Going out of Bangalore. 	approved	\N	\N
2757	1	1	140	2014	2014-12-29	2014-12-29	Not feeling well	approved	\N	\N
2768	1	2	29	2014	2014-12-29	2014-12-30	going to native for Christmas.	approved	\N	\N
2773	2	5	41	2015	2015-01-26	2015-01-30	Going to Native..	cancelled	\N	\N
2776	5	2	111	2014	2014-12-30	2014-12-31	Went to Native	approved	\N	2015-01-05 09:07:09.703831
2779	1	1	189	2015	2015-01-01	2015-01-01	Sick	approved	\N	2015-01-05 09:08:39.16003
2778	1	1	171	2015	2015-01-01	2015-01-01	Not feeling well	approved	\N	2015-01-05 09:08:45.810914
2783	8	1	72	2015	2015-01-01	2015-01-01	New Year	approved	\N	2015-01-05 09:08:50.494227
2780	3	2	59	2014	2014-12-29	2014-12-30	As my grand father (mother's father) passed away.	approved	\N	2015-01-05 09:08:54.751946
2774	2	1	111	2014	2014-12-26	2014-12-26	Went to Native	approved	\N	2015-01-05 09:09:01.892721
2770	8	1	155	2015	2015-01-01	2015-01-01	new year	approved	\N	2015-01-05 09:37:54.439303
2762	8	1	213	2015	2015-01-01	2015-01-01	 Am applying holiday for new year celebration.	approved	\N	2015-01-08 07:28:58.371284
2925	5	0.5	94	2015	2015-01-23	2015-01-23	personal work	approved	2015-01-23 07:52:38.478075	2015-01-27 09:32:01.535628
3125	5	0.5	99	2015	2015-03-13	2015-03-13	work	cancelled	2015-03-13 07:37:01.701784	2015-03-13 11:28:29.236874
3131	1	1	59	2015	2015-03-11	2015-03-11	I was Suffered by fever	approved	2015-03-16 04:59:06.402894	2015-03-16 05:03:19.202966
3149	2	6	188	2015	2015-02-09	2015-02-16	Operated	approved	2015-03-18 06:59:59.340102	2015-03-18 07:04:39.065531
3129	2	5	203	2015	2015-03-23	2015-03-27	Going to village 	approved	2015-03-13 13:44:59.512768	2015-03-18 07:08:21.796789
3117	5	0.5	210	2015	2015-03-10	2015-03-10	fever	approved	2015-03-11 04:56:32.375197	2015-03-18 09:52:35.164741
3163	2	1	60	2015	2015-03-19	2015-03-19	Personal work	approved	2015-03-20 11:02:37.411372	2015-03-23 05:27:08.246466
3157	5	0.5	95	2015	2015-03-19	2015-03-19	Taking brother to hospital.	approved	2015-03-19 07:37:36.579758	2015-03-23 11:24:46.05239
3160	2	1	209	2015	2015-03-20	2015-03-20	Due to bank work.	approved	2015-03-19 13:29:26.719662	2015-03-30 10:26:47.492878
3119	8	2	54	2015	2015-04-14	2015-04-15	Going Home	approved	2015-03-11 04:59:54.928589	2015-04-03 06:19:31.60519
3610	5	0.5	142	2015	2015-07-24	2015-07-24	personal work	approved	2015-07-23 03:23:45.650126	2015-07-24 09:23:23.772456
3594	2	9	63	2015	2015-06-24	2015-07-06	Marriage Leave	approved	2015-07-17 07:39:02.070075	2015-08-21 11:29:45.690456
3596	3	1	63	2015	2015-07-16	2015-07-16	Uncle expired.	approved	2015-07-17 07:42:22.003871	2015-08-21 11:30:31.349042
3599	2	1	176	2015	2015-07-17	2015-07-17	out of station 	approved	2015-07-20 04:46:28.068772	2015-08-25 05:33:45.337216
89	8	1	53	2012	2012-11-13	2012-11-13	going home for festival	approved	\N	\N
63	2	2	57	2012	2012-11-16	2012-11-19	Going to Native.	cancelled	\N	\N
109	9	1	50	2012	2012-11-14	2012-11-14	Festival	approved	\N	\N
97	8	1	67	2012	2012-11-13	2012-11-13	Going to native place	approved	\N	\N
99	5	1	67	2012	2012-11-14	2012-11-14	going to native place	approved	\N	\N
110	2	1	89	2012	2012-11-14	2012-11-14	festival	approved	\N	\N
96	2	5	55	2012	2012-11-12	2012-11-16	Festival	approved	\N	\N
114	8	1	30	2012	2012-11-13	2012-11-13	Diwali 	approved	\N	\N
90	8	1	78	2012	2012-11-13	2012-11-13	Diwali festival.	approved	\N	\N
115	2	2	57	2012	2012-11-19	2012-11-20	Going to native place.	approved	\N	\N
2067	1	1	99	2014	2014-08-25	2014-08-25	Not felling well.	approved	\N	\N
2075	8	1	200	2014	2014-08-29	2014-08-29	I need leave on Ganesh Chathurti.\r\n	approved	\N	\N
2083	2	1	176	2014	2014-08-28	2014-08-28	cousin marriage	approved	\N	\N
113	2	1	76	2012	2012-11-19	2012-11-19	Going to Native	approved	\N	\N
116	8	1	90	2012	2012-11-13	2012-11-13	Diwali	approved	\N	\N
2700	2	1	70	2014	2014-12-11	2014-12-11	Was not well.	approved	\N	\N
2698	8	2	51	2014	2014-12-25	2014-12-26	Optional leaves	approved	\N	\N
2699	2	3	51	2014	2014-12-29	2014-12-31	Applying for year end leaves	approved	\N	\N
2692	2	5	160	2014	2014-12-25	2014-12-31	Personal	approved	\N	\N
2714	2	1	200	2015	2015-01-02	2015-01-02	To celebrate New Year.	cancelled	\N	\N
2708	3	7	90	2014	2014-12-02	2014-12-10	Papa's Funereal.	approved	\N	\N
2736	2	4	41	2014	2014-12-22	2014-12-25	for not applying leave It has been deducted	approved	\N	\N
2694	5	2	44	2014	2014-12-29	2014-12-30	going to native	approved	\N	\N
2733	1	2	151	2014	2014-12-30	2014-12-31	I'm not feeling well	approved	\N	\N
2724	9	3	95	2014	2014-12-29	2014-12-31	personal.	approved	\N	\N
2721	5	0.5	147	2014	2014-12-26	2014-12-26	personal work	approved	\N	\N
2647	8	2	209	2014	2014-12-25	2014-12-26	I'm going home for two days. So please kindly approve my leave.	approved	\N	\N
2734	1	1	98	2014	2014-12-24	2014-12-24	Went native	approved	\N	\N
2765	3	1	117	2014	2014-12-30	2014-12-30	My granny passed away	approved	\N	\N
2747	8	1	144	2014	2014-12-31	2014-12-31	Personal work 	approved	\N	2015-01-05 09:05:07.258502
2784	2	3	147	2015	2015-01-12	2015-01-14	festival	cancelled	\N	2015-01-05 09:05:37.803057
2752	2	2	200	2015	2015-01-01	2015-01-02	To Celebrate New Year.	approved	\N	2015-01-05 09:06:31.07035
2717	8	1	171	2014	2014-12-26	2014-12-26	Post Christmas	approved	\N	2015-01-05 09:07:38.937245
2751	2	1	200	2014	2014-12-31	2014-12-31	To Celebrate New Year.	approved	\N	2015-01-05 09:07:49.959669
2715	5	0.5	128	2014	2014-12-25	2014-12-25	Head ache	approved	\N	2015-01-21 09:15:09.709804
2928	2	2	101	2015	2015-01-27	2015-01-28	Going Native	approved	2015-01-23 11:18:59.993311	2015-01-23 11:54:44.085794
3127	2	1	170	2015	2015-03-09	2015-03-09	Personal work	approved	2015-03-13 09:37:39.755868	2015-03-13 09:42:16.224741
3132	5	2	160	2015	2015-03-02	2015-03-03	Personal.	approved	2015-03-16 05:05:31.01441	2015-03-18 09:53:33.393277
3143	1	1	63	2015	2015-02-27	2015-02-27	Not Well visited hospital.	approved	2015-03-17 07:35:35.395072	2015-03-18 09:53:43.858661
3123	2	1	177	2015	2015-03-13	2015-03-13	Going to hospital	approved	2015-03-12 05:38:17.292816	2015-03-18 09:54:21.194277
3136	5	0.5	91	2015	2015-03-16	2015-03-16	Bank work	approved	2015-03-16 07:53:07.10388	2015-03-18 09:54:33.510228
3151	5	0.5	218	2015	2015-03-16	2015-03-16	Medical emergency for a friend.	approved	2015-03-18 07:25:19.997251	2015-03-18 09:54:41.729591
3152	5	0.5	44	2015	2015-03-18	2015-03-18	Not feeling well	approved	2015-03-18 07:27:35.606538	2015-03-19 06:16:51.978774
3168	1	2	162	2015	2015-03-19	2015-03-20	My father got expired so I was at my home	cancelled	2015-03-23 04:52:27.412171	2015-03-23 05:30:24.308068
3155	1	1	143	2015	2015-03-02	2015-03-02	Was not keeping well.	approved	2015-03-18 11:51:01.138445	2015-03-23 11:24:53.311572
3159	1	1	45	2015	2015-03-20	2015-03-20	medical checkup	approved	2015-03-19 10:10:42.417869	2015-03-27 06:52:58.520227
3118	2	1	54	2015	2015-04-13	2015-04-13	Going Home	approved	2015-03-11 04:59:27.41509	2015-04-03 06:19:39.560745
3595	1	3	63	2015	2015-07-08	2015-07-10	Not well.	approved	2015-07-17 07:41:11.205891	2015-08-21 11:30:23.361305
100	2	1	34	2012	2012-11-19	2012-11-19	For My Engagement	approved	\N	\N
105	8	1	32	2012	2012-11-13	2012-11-13	Dipawali 	approved	\N	\N
102	2	0.5	85	2012	2012-11-12	2012-11-12	Diwali	approved	\N	\N
98	8	1	89	2012	2012-11-13	2012-11-13	festival	approved	\N	\N
95	8	1	65	2012	2012-11-13	2012-11-13	Dewali Festival	cancelled	\N	\N
104	5	1	31	2012	2012-11-09	2012-11-09	for go to native	approved	\N	\N
92	8	1	58	2012	2012-11-13	2012-11-13	Due to Deepavali Festival	approved	\N	\N
91	2	1	78	2012	2012-11-14	2012-11-14	Diwali festival.	approved	\N	\N
106	2	1	68	2012	2012-11-14	2012-11-14	For Festival	approved	\N	\N
2080	7	7	77	2014	2014-08-18	2014-08-26	Paternity	approved	\N	\N
2073	8	1	49	2014	2014-08-29	2014-08-29	For ganesh chaturthi.	approved	\N	\N
2071	8	1	160	2014	2014-08-29	2014-08-29	Ganesh Chathurti	approved	\N	\N
2076	2	1	171	2014	2014-08-28	2014-08-28	Personal work	approved	\N	\N
93	8	1	82	2012	2012-11-13	2012-11-13	As Availed Optional Leave.	approved	\N	\N
2648	5	0.5	94	2014	2014-12-04	2014-12-04	personal work	approved	\N	\N
2585	9	1	99	2014	2014-12-22	2014-12-22	Personal Work.	approved	\N	\N
2718	8	1	54	2014	2014-12-26	2014-12-26	Going Home 	approved	\N	\N
2719	2	3	133	2014	2014-12-29	2014-12-31	i am going to native.	approved	\N	\N
2709	4	7	90	2014	2014-12-11	2014-12-19	Papa's Funereal.	cancelled	\N	\N
2710	2	1	90	2014	2014-12-19	2014-12-20	Papa's Funereal.	approved	\N	\N
2660	8	2	142	2014	2014-12-25	2014-12-26	For celebrating Christmas with friends	approved	\N	\N
2720	8	1	147	2014	2014-12-25	2014-12-25	festival celebration	approved	\N	\N
2745	2	1	60	2014	2014-12-29	2014-12-29	Sick	approved	\N	\N
2697	1	2	213	2014	2014-12-25	2014-12-26	because of conjuctivities i need the holiday.	approved	\N	\N
2693	8	2	44	2014	2014-12-25	2014-12-26	going to native	approved	\N	\N
2766	2	6	135	2014	2014-12-24	2014-12-31	Personal Appointments	approved	\N	\N
2753	5	0.5	176	2014	2014-12-30	2014-12-30	Had some work 	approved	\N	\N
2772	3	2	80	2014	2014-12-26	2014-12-29	As My Grand Mother Died.	approved	\N	\N
2769	8	2	131	2014	2014-12-25	2014-12-26	Christmas Holidays	approved	\N	\N
2695	8	1	44	2014	2014-12-31	2014-12-31	going to native	approved	\N	\N
2781	8	1	59	2015	2015-01-01	2015-01-01	As available optional leave	approved	\N	2015-01-05 09:06:33.955563
2756	8	1	52	2014	2014-12-31	2014-12-31	New Year's eve.	approved	\N	2015-01-05 09:06:54.157093
2760	2	2	128	2014	2014-12-29	2014-12-30	Went to home town	approved	\N	2015-01-05 09:06:57.674107
2741	2	1	163	2014	2014-12-31	2014-12-31	Went to Native for Cristmas	approved	\N	2015-01-05 09:07:57.737056
2754	8	1	176	2014	2014-12-31	2014-12-31	Year end 	approved	\N	2015-01-05 09:08:01.84702
2758	2	1	201	2014	2014-12-31	2014-12-31	personal work	approved	\N	2015-01-07 06:42:03.393628
2764	8	1	165	2015	2015-01-01	2015-01-01	Optional leave	approved	\N	2015-01-08 07:28:55.391976
2763	2	6	189	2015	2015-01-16	2015-01-23	Urgent work at home. 	cancelled	\N	2015-01-23 04:51:43.334771
2930	1	1	59	2015	2015-01-23	2015-01-23	I had suffered from fever.	approved	2015-01-27 05:16:18.831509	2015-01-27 09:31:58.357833
3147	5	0.5	41	2015	2015-03-16	2015-03-16	Went to RTO office 	approved	2015-03-18 06:18:14.161852	2015-03-18 07:08:45.256125
3122	1	1	99	2015	2015-03-09	2015-03-09	Fever.	approved	2015-03-12 04:04:37.347676	2015-03-18 09:52:26.023404
3121	5	0.5	52	2015	2015-03-11	2015-03-11	I have some work.	approved	2015-03-11 05:37:29.475667	2015-03-18 09:52:52.70389
3140	1	1	51	2015	2015-03-13	2015-03-13	Due to hospital work	approved	2015-03-16 13:35:59.472918	2015-03-18 09:53:01.277552
3153	9	1	171	2015	2015-03-19	2015-03-19	personal work	approved	2015-03-18 07:48:21.64377	2015-03-18 09:55:21.696064
3139	8	1	140	2015	2015-04-03	2015-04-03	Going to native place	approved	2015-03-16 10:52:24.290772	2015-03-19 06:17:12.7088
3166	3	7	162	2015	2015-02-26	2015-03-06	My Father got expired 	approved	2015-03-23 04:49:01.359369	2015-03-23 05:33:20.633953
3173	1	1	223	2015	2015-03-20	2015-03-20	health problem	approved	2015-03-23 07:30:00.824801	2015-03-23 07:37:32.721664
3133	5	1	87	2015	2015-03-23	2015-03-23	Going to home for some personal work.	approved	2015-03-16 07:04:28.641993	2015-03-23 11:25:13.603689
3142	5	1	31	2015	2015-03-06	2015-03-06	I was not feeling well.	approved	2015-03-17 07:19:06.021127	2015-03-24 05:45:31.089194
3137	2	4	91	2015	2015-05-27	2015-06-01	Home function	cancelled	2015-03-16 07:54:07.987385	2015-04-06 05:13:01.198337
3171	5	1	214	2015	2015-03-24	2015-03-24	Attend to some personal work.	approved	2015-03-23 06:06:37.905595	2015-04-17 11:29:10.518529
3597	1	1	109	2015	2015-07-16	2015-07-16	Health was not good.	approved	2015-07-17 09:54:12.561044	2015-07-21 07:07:58.917661
3600	2	1	218	2015	2015-07-20	2015-07-20	Mother's medical treatment.	approved	2015-07-20 05:06:15.093092	2015-07-22 10:27:16.90217
3605	2	2	101	2015	2015-07-27	2015-07-28	Banking Settlement	approved	2015-07-21 07:59:39.851285	2015-07-31 10:00:37.605526
3606	5	0.5	209	2015	2015-07-21	2015-07-21	I am not feeling well.	approved	2015-07-21 08:03:20.81782	2015-08-20 07:28:36.936
111	8	1	51	2012	2012-11-12	2012-11-12	For festival	approved	\N	\N
112	2	2	51	2012	2012-11-12	2012-11-13	For festival	approved	\N	\N
119	4	0.5	51	2012	2012-11-15	2012-11-15	For my exam	approved	\N	\N
121	5	0.5	80	2012	2012-11-23	2012-11-23	As I have a Personal Work.	cancelled	\N	\N
117	2	1	85	2012	2012-11-30	2012-11-30	Family Function	approved	\N	\N
142	5	0.5	51	2012	2012-11-28	2012-11-28	Having some personal work	approved	\N	\N
147	2	1	77	2012	2012-11-30	2012-11-30	Going for friend marriage 	approved	\N	\N
146	2	1	96	2012	2012-11-30	2012-11-30	personal work	approved	\N	\N
149	4	1	59	2012	2012-12-03	2012-12-03	want to get certificates from college	approved	\N	\N
120	2	1	47	2012	2012-12-10	2012-12-10	Brother's Marriage	approved	\N	\N
153	2	5	29	2012	2012-12-24	2013-01-02	Going to native	cancelled	\N	\N
137	1	1	47	2012	2012-11-26	2012-11-26	Not feeling well	approved	\N	\N
118	3	1	47	2012	2012-11-12	2012-11-12	Cousin's death	approved	\N	\N
133	7	6	43	2012	2012-11-12	2012-11-19	Due to born new baby for me.	approved	\N	\N
145	5	0.5	59	2012	2012-11-27	2012-11-27	personal	approved	\N	\N
162	1	1	51	2012	2012-12-07	2012-12-07	I was not feeling well.	approved	\N	\N
134	1	1	89	2012	2012-11-23	2012-11-23	sick	approved	\N	\N
124	2	1	67	2012	2012-11-22	2012-11-22	Some personal work is there	approved	\N	\N
139	1	1	55	2012	2012-11-26	2012-11-26	Personal	approved	\N	\N
107	2	3	77	2012	2012-11-12	2012-11-14	For Diwali festival	approved	\N	\N
151	2	1	50	2012	2012-12-04	2012-12-04	Personal Work	approved	\N	\N
140	5	2	54	2012	2012-12-03	2012-12-04	Going Home 	approved	\N	\N
143	1	2	54	2012	2012-12-06	2012-12-07	Going Home for function	approved	\N	\N
141	2	1	54	2012	2012-12-05	2012-12-05	Going Home	approved	\N	\N
164	2	1	67	2012	2012-12-10	2012-12-10	not feeling well 	approved	\N	\N
165	5	1	67	2012	2012-12-11	2012-12-11	Going to hospital\r\n	approved	\N	\N
167	2	3	31	2012	2012-12-17	2012-12-19	going to native	cancelled	\N	\N
152	1	1	96	2012	2012-12-03	2012-12-03	sick leave	approved	\N	\N
122	2	0.5	34	2012	2012-11-20	2012-11-20	personal work	approved	\N	\N
155	2	3	44	2012	2012-12-20	2012-12-24	Sister's engagement 	approved	\N	\N
156	8	2	44	2012	2012-12-25	2012-12-26	Sister's engagement 	approved	\N	\N
138	2	1	34	2012	2012-11-23	2012-11-23	personal work	approved	\N	\N
171	1	1	34	2012	2012-12-10	2012-12-10	Not feeling well	approved	\N	\N
157	2	2	85	2012	2012-12-20	2012-12-21	Family Function	approved	\N	\N
179	2	1	85	2012	2012-12-19	2012-12-19	Going to native to see my baby	approved	\N	\N
129	7	7	32	2012	2012-11-12	2012-11-20	To become father of a baby girl.	approved	\N	\N
52	2	1	30	2012	2012-10-29	2012-10-29	My brother Engagement is going to held on 29th-Oct-12. So Please grant me leave for one day.	approved	\N	\N
181	1	1	30	2012	2012-12-17	2012-12-17	I Took leave on 17-12-12 because of fever and headache.I informed to Mrs.Alamelu.	approved	\N	\N
185	2	1	78	2012	2012-12-21	2012-12-21	Going out of station	cancelled	\N	\N
128	2	1	82	2012	2012-11-30	2012-11-30	Personal.	approved	\N	\N
188	5	1	38	2012	2012-12-21	2012-12-21	Due to health reasons half day leave	approved	\N	\N
130	4	2	32	2012	2012-11-26	2012-11-27	For examination.	approved	\N	\N
131	1	1	38	2012	2012-11-22	2012-11-22	Fever	approved	\N	\N
192	1	1	82	2012	2012-12-21	2012-12-22	'GO'	cancelled	\N	\N
135	5	1	49	2012	2012-11-29	2012-11-29	Personal	approved	\N	\N
136	2	1	76	2012	2012-12-03	2012-12-03	Going to Native	approved	\N	\N
184	1	1	96	2012	2012-12-19	2012-12-19	Sick leave	approved	\N	\N
173	1	1	50	2012	2012-12-12	2012-12-12	not feeling well	approved	\N	\N
183	2	2	50	2012	2012-12-24	2012-12-25	Personal Work	approved	\N	\N
174	5	0.5	67	2012	2012-12-14	2012-12-14	some personal family problem is there.	approved	\N	\N
161	1	0.5	43	2012	2012-12-10	2012-12-10	Due to i am not feeling well.	approved	\N	\N
148	2	6	70	2012	2012-12-03	2012-12-10	As I need to go my native place due to some urgent works.	approved	\N	\N
163	8	1	52	2012	2012-12-25	2012-12-25	Christmas	approved	\N	\N
168	2	2	31	2012	2012-12-17	2012-12-18	going to native	approved	\N	\N
144	1	1	74	2012	2012-11-27	2012-11-27	Cough and Cold	approved	\N	\N
150	2	1	74	2012	2012-12-04	2012-12-04	Personal Work	approved	\N	\N
158	2	0.5	74	2012	2012-12-07	2012-12-07	Visiting a doctor for thumb injury	approved	\N	\N
186	5	1	78	2012	2012-12-21	2012-12-21	Going out of station.	approved	\N	\N
159	2	1	78	2012	2012-12-11	2012-12-11	Personal work.	approved	\N	\N
126	5	0.5	78	2012	2012-11-22	2012-11-22	Have personal work,	approved	\N	\N
123	2	1	78	2012	2012-11-23	2012-11-23	Going out of station.	approved	\N	\N
178	8	1	74	2012	2012-12-25	2012-12-25	Going for family trip.	approved	\N	\N
177	2	4	74	2012	2012-12-19	2012-12-24	Going to family trip.	approved	\N	\N
197	8	1	80	2013	2013-01-01	2013-01-01	As  I am Going to Native	approved	\N	\N
125	9	1	80	2012	2012-11-23	2012-11-23	As I have a Personal Work.	approved	\N	\N
175	2	1	68	2012	2012-12-24	2012-12-24	To attend grandfather death ceremony.	approved	\N	\N
187	5	0.5	57	2012	2012-12-21	2012-12-21	Personal work.	approved	\N	\N
127	5	0.5	57	2012	2012-11-23	2012-11-23	personal work.	approved	\N	\N
182	2	1	60	2012	2012-12-17	2012-12-17	i want to go thirumala sir.	approved	\N	\N
169	8	1	31	2012	2013-01-14	2013-01-14	going to native	approved	\N	\N
170	2	2	31	2012	2013-01-15	2013-01-16	going to native	approved	\N	\N
189	1	0.5	29	2012	2012-12-21	2012-12-21	not feeling well	approved	\N	\N
132	2	10	41	2012	2012-11-26	2012-12-07	Going to my Native 	approved	\N	\N
191	2	3	77	2012	2012-12-24	2012-12-26	Going for Native	approved	\N	\N
154	2	5	29	2012	2012-12-24	2012-12-28	Going to native	approved	\N	\N
172	2	1	76	2012	2012-12-14	2012-12-14	Going to native	approved	\N	\N
176	8	2	76	2012	2012-12-28	2012-12-31	Optional Leave	approved	\N	\N
180	2	4	71	2012	2012-12-26	2012-12-31	Out Of Station	approved	\N	\N
193	2	2	82	2012	2012-12-27	2012-12-28	Personal	approved	\N	\N
194	2	2	49	2012	2012-12-26	2012-12-27	Year end family get together plan.	approved	\N	\N
195	8	2	49	2012	2012-12-28	2012-12-31	Year end family get together plan.	approved	\N	\N
2696	2	1	71	2014	2014-12-26	2014-12-26	Out of Station	approved	\N	\N
166	2	3	42	2012	2012-11-29	2012-12-03	I going to my native.	approved	\N	\N
199	5	0.5	35	2012	2012-12-24	2012-12-24	Going to hospital	cancelled	\N	\N
208	5	1	28	2013	2013-01-01	2013-01-01	Medical Checkup	cancelled	\N	\N
190	2	3	33	2012	2012-12-24	2012-12-26	Christmas holidays	approved	\N	\N
217	2	1	96	2012	2012-12-24	2012-12-24	personal work	approved	\N	\N
218	8	1	96	2012	2012-12-25	2012-12-25	personal work	approved	\N	\N
215	2	1	34	2012	2012-12-28	2012-12-28	personal	approved	\N	\N
207	5	1	28	2012	2012-12-31	2012-12-31	Medical Checkup	approved	\N	\N
273	5	0.5	96	2013	2013-01-10	2013-01-10	Not feeling well	approved	\N	\N
227	8	1	91	2012	2012-12-31	2012-12-31	going to home	cancelled	\N	\N
210	8	1	55	2012	2012-12-31	2012-12-31	Going to Native	approved	\N	\N
211	8	1	55	2013	2013-01-01	2013-01-01	Going to Native	approved	\N	\N
219	9	1	67	2012	2012-12-31	2012-12-31	going to native place	approved	\N	\N
231	8	1	38	2013	2013-01-01	2013-01-01	New Year	approved	\N	\N
216	8	1	32	2012	2012-12-25	2012-12-25	Chrismus	approved	\N	\N
237	8	1	30	2013	2013-01-01	2013-01-01	going to temple on that day.	approved	\N	\N
233	5	0.5	34	2013	2013-01-01	2013-01-01	personal	approved	\N	\N
220	8	1	67	2013	2013-01-01	2013-01-01	going to native place	approved	\N	\N
234	8	1	54	2013	2013-01-01	2013-01-01	Personal Issue	approved	\N	\N
221	5	0.5	67	2012	2012-12-28	2012-12-28	going to native place	approved	\N	\N
201	8	1	51	2012	2012-12-25	2012-12-25	For some pooja in home	approved	\N	\N
202	2	2	51	2012	2012-12-27	2012-12-28	Having some personal work	approved	\N	\N
203	5	0.5	51	2012	2012-12-24	2012-12-24	Going native	approved	\N	\N
214	8	1	37	2012	2012-12-31	2012-12-31	Going to Temple	approved	\N	\N
241	8	1	37	2013	2013-01-01	2013-01-01	I was in Temple(Tirupati)	approved	\N	\N
228	8	1	91	2013	2013-01-01	2013-01-01	going to home	approved	\N	\N
213	2	1	59	2012	2012-12-28	2012-12-28	going to native	approved	\N	\N
212	2	1	10	2012	2012-12-28	2012-12-28	Festival in native	approved	\N	\N
235	8	1	98	2013	2013-01-01	2013-01-01	celebration	approved	\N	\N
223	8	1	95	2013	2013-01-01	2013-01-01	going to elders brothers house.	approved	\N	\N
204	8	1	99	2012	2012-12-25	2012-12-25	christmas celebration	approved	\N	\N
225	8	1	99	2013	2013-01-01	2013-01-01	New Year	approved	\N	\N
224	8	1	99	2012	2012-12-31	2012-12-31	New Year	approved	\N	\N
200	8	1	56	2012	2012-12-25	2012-12-25	As I am going to my native.	approved	\N	\N
229	8	1	52	2012	2012-12-31	2012-12-31	Optional Leave	approved	\N	\N
239	8	1	31	2013	2013-01-01	2013-01-01	new year celebration	approved	\N	\N
232	8	1	72	2013	2013-01-01	2013-01-01	New Year	approved	\N	\N
247	5	0.5	78	2013	2013-01-04	2013-01-04	Not feeling well.	approved	\N	\N
243	8	1	78	2013	2013-01-01	2013-01-01	New year.	approved	\N	\N
230	8	1	79	2013	2013-01-01	2013-01-01	Optional Off	approved	\N	\N
205	8	1	79	2012	2012-12-25	2012-12-25	Optional off	approved	\N	\N
255	2	3	72	2013	2013-01-14	2013-01-16	Going to native 	approved	\N	\N
222	5	1	76	2012	2012-12-27	2012-12-27	Going to native	approved	\N	\N
259	2	4	59	2013	2013-01-15	2013-01-18	going home for pongal and sister's engagement	cancelled	\N	\N
264	2	0.5	70	2013	2013-01-17	2013-01-17	For Personal occasion.	cancelled	\N	\N
270	8	1	43	2013	2013-01-14	2013-01-14	Due to Pongal.	approved	\N	\N
271	2	1	43	2013	2013-01-15	2013-01-15	Due to Pongal.	approved	\N	\N
275	8	1	67	2013	2013-01-14	2013-01-14	Going to temple	approved	\N	\N
283	8	1	55	2013	2013-01-14	2013-01-14	Festival	approved	\N	\N
274	2	3	30	2013	2013-01-16	2013-01-18	Pongal leave and Friend Marriage is going to held on 17th. so Please approval my leave.	approved	\N	\N
261	8	1	28	2013	2013-01-14	2013-01-14	Pongal Festival	approved	\N	\N
253	8	1	85	2013	2013-01-14	2013-01-14	Pongal Festival	approved	\N	\N
254	2	1	85	2013	2013-01-15	2013-01-15	Pongal Festival	approved	\N	\N
249	8	1	38	2013	2013-01-14	2013-01-14	Sankranti	approved	\N	\N
256	1	1	32	2013	2013-01-07	2013-01-07	No feeling well	approved	\N	\N
260	5	0.5	85	2013	2013-01-08	2013-01-08	personal work	approved	\N	\N
285	2	1	91	2013	2013-01-15	2013-01-15	personal	approved	\N	\N
198	2	4	80	2013	2013-01-15	2013-01-18	As i am going for sister engagement	approved	\N	\N
272	8	1	68	2013	2013-01-14	2013-01-14	To celebrate festival .	approved	\N	\N
236	1	1	68	2012	2012-12-28	2012-12-28	As i needed to go to hospital	approved	\N	\N
263	2	1	57	2013	2013-01-15	2013-01-15	going to native for festival.	approved	\N	\N
262	8	1	57	2013	2013-01-14	2013-01-14	festival	approved	\N	\N
250	2	2	38	2013	2013-01-15	2013-01-16	Sankranti	approved	\N	\N
278	2	1	60	2013	2013-02-01	2013-02-01	i have cousin brothers marriage.	cancelled	\N	\N
238	8	1	60	2013	2013-01-01	2013-01-01	Due to new year	approved	\N	\N
277	8	2	60	2013	2013-01-14	2013-01-15	for festival occation	approved	\N	\N
226	8	1	96	2012	2012-12-31	2012-12-31	personal reason	approved	\N	\N
265	2	1	70	2013	2013-01-18	2013-01-18	For Personal occasion.	approved	\N	\N
266	5	0.5	70	2013	2013-01-17	2013-01-17	For Personal occasion.	approved	\N	\N
290	8	1	81	2013	2013-01-25	2013-01-25	Going to native	approved	\N	\N
279	1	0.5	58	2013	2013-01-11	2013-01-11	Half day due to sic	approved	\N	\N
246	2	1	47	2013	2013-01-15	2013-01-15	Pongal	approved	\N	\N
245	8	1	47	2013	2013-01-14	2013-01-14	Pongal	approved	\N	\N
240	8	1	47	2012	2012-12-31	2012-12-31	Optional Holiday	approved	\N	\N
242	8	1	76	2013	2013-01-01	2013-01-01	Optional	approved	\N	\N
252	2	3	76	2013	2013-01-14	2013-01-16	Going to native	approved	\N	\N
244	8	1	82	2013	2013-01-01	2013-01-01	Availed Optional Leave.	approved	\N	\N
267	8	1	82	2013	2013-01-14	2013-01-14	As Availed Optional leave.	approved	\N	\N
268	2	2	82	2013	2013-01-15	2013-01-16	Going Home Down.	approved	\N	\N
248	8	1	56	2013	2013-01-14	2013-01-14	I am going to my native place.	approved	\N	\N
280	2	1	77	2013	2013-01-15	2013-01-15	For pongal	approved	\N	\N
281	8	1	77	2013	2013-01-14	2013-01-14	for pongal	approved	\N	\N
276	8	1	94	2013	2013-01-14	2013-01-14	Travelling to native for pongal celebration	approved	\N	\N
209	5	0.5	28	2013	2013-01-01	2013-01-01	Personal	approved	\N	\N
282	8	1	91	2013	2013-01-14	2013-01-14	going to home	approved	\N	\N
284	2	1	55	2013	2013-01-15	2013-01-15	Festival	approved	\N	\N
257	8	1	34	2013	2013-01-14	2013-01-14	pongal festival	approved	\N	\N
258	2	1	34	2013	2013-01-15	2013-01-15	pongal festival	approved	\N	\N
303	2	3	102	2013	2013-01-28	2013-01-30	SISTER MARRIAGE	approved	\N	\N
287	5	0.5	32	2013	2013-01-14	2013-01-14	For Puja	approved	\N	\N
206	1	1	80	2012	2012-12-25	2012-12-25	As i am not feeling well.	approved	\N	\N
288	8	1	96	2013	2013-01-14	2013-01-14	Festival Sankranti	approved	\N	\N
289	8	1	81	2013	2013-01-04	2013-01-04	Sankranti Festival 	approved	\N	\N
291	1	1	65	2013	2013-01-15	2013-01-15	Back pain	approved	\N	\N
293	2	3	31	2013	2013-01-18	2013-01-22	going to native	approved	\N	\N
295	2	1	32	2013	2013-01-29	2013-01-29	For personal work	approved	\N	\N
2084	8	1	176	2014	2014-08-29	2014-08-29	festival	approved	\N	\N
2650	2	1	144	2014	2014-12-18	2014-12-18	I have personal work. 	approved	\N	\N
2654	8	1	162	2014	2014-12-31	2014-12-31	end of the year	approved	\N	\N
2656	2	1	202	2014	2014-12-22	2014-12-22	Going to College For Apply Convocation.	cancelled	\N	\N
2668	2	3	49	2014	2014-12-29	2014-12-31	Year end leave. But I will be in Bangalore, so if require I can come to office any time.	Pending	\N	\N
2649	2	1	158	2014	2014-12-22	2014-12-22	going to native	approved	\N	\N
2707	2	1	90	2014	2014-11-30	2014-12-01	Papa's Funereal.	Pending	\N	\N
2702	8	2	40	2014	2014-12-25	2014-12-26	Availing the Optional Leave	approved	\N	\N
2703	8	1	40	2014	2014-12-31	2014-12-31	Availing the optional Leave	approved	\N	\N
2706	2	1	40	2014	2014-12-30	2014-12-30	Going out of station	approved	\N	\N
2666	5	2	143	2014	2014-12-11	2014-12-12	Was not keeping well.	approved	\N	\N
2726	8	2	98	2014	2014-12-25	2014-12-26	Going to Native	approved	\N	\N
2735	2	4	111	2014	2014-12-22	2014-12-25	for not applying leave It has been deducted	approved	\N	\N
2712	8	1	200	2014	2014-12-31	2014-12-31	To celebrate New Year.	cancelled	\N	\N
2713	8	1	200	2015	2015-01-01	2015-01-01	To celebrate New Year.	cancelled	\N	\N
2755	5	0.5	168	2014	2014-12-30	2014-12-30	sick	approved	\N	\N
2731	8	1	188	2014	2014-12-25	2014-12-25	festival	approved	\N	\N
2761	2	1	155	2015	2015-01-01	2015-01-01	For New Year	cancelled	\N	\N
2732	2	1	159	2014	2014-12-30	2014-12-30	personal work	approved	\N	\N
2746	5	0.5	144	2014	2014-12-30	2014-12-30	Personal work.	approved	\N	\N
2661	9	1	142	2014	2014-12-29	2014-12-29	Personal work	approved	\N	\N
2739	8	2	163	2014	2014-12-25	2014-12-26	Went to Native for Cristmas	approved	\N	\N
2701	8	1	151	2014	2014-12-25	2014-12-25	christmas holidy	approved	\N	\N
2659	5	1	140	2014	2014-12-26	2014-12-26	Going to tirupati	approved	\N	\N
2767	8	2	29	2014	2014-12-25	2014-12-26	going to native for Christmas.	approved	\N	\N
2775	2	1	111	2014	2014-12-29	2014-12-29	Went to Native	approved	\N	2015-01-05 09:07:13.606473
2782	3	2	72	2014	2014-12-30	2014-12-31	uncle expired	approved	\N	2015-01-05 09:07:25.639578
2931	2	1	128	2015	2015-01-23	2015-01-23	Personal Work	approved	2015-01-27 05:17:26.020634	2015-01-27 09:32:08.582177
2748	2	6	179	2015	2015-01-16	2015-01-24	Going to my Native	approved	\N	2015-02-04 07:25:21.597871
3174	2	15	118	2015	2015-04-07	2015-04-27	Going Native Place along with family for Vacation.	approved	2015-03-23 10:25:27.482375	2015-05-04 07:44:01.773652
3598	5	1	221	2015	2015-07-20	2015-07-20	Postponed the Road Journey  by one day through MP due to flood like situation and record rains.	Pending	2015-07-20 03:23:26.63025	2015-07-20 03:23:26.63025
3604	1	1	209	2015	2015-07-16	2015-07-16	I was not feeling Well.	approved	2015-07-21 05:19:16.289729	2015-08-20 07:29:44.418401
304	4	0.5	51	2013	2013-01-22	2013-01-22	For my MBA exam	approved	\N	\N
300	2	1	43	2013	2013-01-23	2013-01-23	Due to attend my uncle marriage function. 	approved	\N	\N
269	2	6	10	2013	2013-01-23	2013-01-30	Festival in native..	approved	\N	\N
292	2	2	59	2013	2013-01-17	2013-01-18	going to native	approved	\N	\N
294	2	0.5	34	2013	2013-01-16	2013-01-16	personal work	approved	\N	\N
196	2	1	80	2012	2012-12-31	2012-12-31	As i am Going to Native	approved	\N	\N
298	2	1	44	2013	2013-01-28	2013-01-28	Going to native.	approved	\N	\N
301	1	1	81	2013	2013-01-21	2013-01-21	Was suffering from fever 	approved	\N	\N
286	2	7	52	2013	2013-03-08	2013-03-18	I will be out of station.	approved	\N	\N
296	5	0.5	32	2013	2013-01-28	2013-01-28	For Personal Work	approved	\N	\N
299	5	0.5	99	2013	2013-01-21	2013-01-21	Not feeling well...head is aching.	approved	\N	\N
2085	8	1	159	2014	2014-08-29	2014-08-29	festival	approved	\N	\N
2094	8	1	128	2014	2014-08-29	2014-08-29	Festival	approved	\N	\N
2097	8	1	198	2014	2014-08-29	2014-08-29	I am going to my native place,so you have accepted sir	cancelled	\N	\N
2100	8	1	145	2014	2014-08-29	2014-08-29	Going to celebrate Ganesha  Festival with family.	approved	\N	\N
2653	8	2	162	2014	2014-12-25	2014-12-26	christmas	approved	\N	\N
2655	8	1	162	2014	2014-12-31	2014-12-31	end of the year	cancelled	\N	\N
2657	1	1	151	2014	2014-12-18	2014-12-18	I was not feeling well	approved	\N	\N
2651	1	2	163	2014	2014-12-16	2014-12-17	Due to Stomach cache and Fever.	approved	\N	\N
2665	5	1	29	2014	2014-12-23	2014-12-23	Going to native 	cancelled	\N	\N
2704	8	1	40	2015	2015-01-01	2015-01-01	Availing the Optional Leave	approved	\N	\N
2740	2	2	163	2014	2014-12-29	2014-12-30	Went to Native for Cristmas	approved	\N	\N
2723	8	1	95	2014	2014-12-25	2014-12-25	christmas	approved	\N	\N
2725	2	2	98	2014	2014-12-22	2014-12-23	Going to Native	approved	\N	\N
2658	8	1	140	2014	2014-12-25	2014-12-25	Going to tirupati	approved	\N	\N
2777	8	1	102	2015	2015-01-01	2015-01-01	Personal Work	approved	\N	2015-01-05 04:42:30.477563
2759	5	0.5	145	2014	2014-12-31	2014-12-31	Going to celebrate New Year Party with Brothers friends.	approved	\N	2015-01-05 04:42:33.386927
2738	8	1	143	2014	2014-12-31	2014-12-31	Going out of station with family.	approved	\N	2015-01-05 04:42:35.658619
2743	2	1	163	2015	2015-01-02	2015-01-02	Went to Native for Cristmas	approved	\N	2015-01-05 09:06:14.448365
2730	8	1	94	2015	2015-01-01	2015-01-01	New Year	approved	\N	2015-01-05 09:06:24.756659
2771	5	0.5	128	2014	2014-12-31	2014-12-31	personal work	approved	\N	2015-01-05 09:08:12.022146
2742	8	1	163	2015	2015-01-01	2015-01-01	Went to Native for Cristmas	approved	\N	2015-01-05 09:08:18.548624
2932	8	1	33	2015	2015-01-01	2015-01-01	I Was on leave, forgot to apply. Apologies for the inconvenience.	approved	2015-01-27 09:42:50.817936	2015-01-28 10:59:22.145444
2933	2	1	33	2015	2015-01-02	2015-01-02	Was on leave, forgot to apply. Apologies for the inconvenience.	approved	2015-01-27 09:43:04.374785	2015-01-28 10:59:23.410233
3175	2	1	144	2015	2015-03-23	2015-03-23	I have personal work.	approved	2015-03-24 03:52:17.429796	2015-03-24 04:53:54.931848
3187	2	1	159	2015	2015-03-27	2015-03-27	personal work	approved	2015-03-26 07:16:36.316168	2015-03-26 07:32:22.017597
3192	5	0.5	51	2015	2015-03-19	2015-03-19	Due to some work	approved	2015-03-27 09:02:09.77468	2015-03-27 09:05:05.847092
3197	1	1	30	2015	2015-04-06	2015-04-06	Going to Home.	cancelled	2015-03-30 04:32:40.721158	2015-03-30 04:42:31.295688
3179	5	1	226	2015	2015-03-25	2015-03-25	Personal reason	approved	2015-03-24 08:46:47.528587	2015-03-30 10:26:28.842161
3184	8	1	178	2015	2015-04-02	2015-04-02	going native	approved	2015-03-25 09:39:20.594972	2015-03-31 06:44:25.02755
3185	2	1	178	2015	2015-04-03	2015-04-03	going native	approved	2015-03-25 09:39:42.725073	2015-03-31 06:44:47.155936
3215	8	1	30	2015	2015-04-03	2015-04-03	Going to home.	approved	2015-03-31 15:55:40.689937	2015-04-02 13:25:50.309806
3230	2	9	187	2015	2015-04-20	2015-04-30	Going home.	cancelled	2015-04-02 13:51:54.915644	2015-04-03 10:00:12.945074
3176	2	1	212	2015	2015-03-23	2015-03-23	Going to Home Town	approved	2015-03-24 04:40:09.437078	2015-04-17 10:44:02.459984
3195	1	1	212	2015	2015-03-27	2015-03-27	Severe cold	approved	2015-03-30 03:53:37.835794	2015-04-17 11:17:19.896236
3224	5	0.5	31	2015	2015-04-02	2015-04-02	Brother's engagement.	approved	2015-04-02 09:33:29.221849	2015-04-22 12:08:58.203291
3201	8	1	99	2015	2015-04-03	2015-04-03	Work.	approved	2015-03-30 06:40:42.32844	2015-04-24 11:18:46.108663
3212	2	3	176	2015	2015-04-02	2015-04-06	going home	approved	2015-03-31 06:34:11.52711	2015-04-25 05:49:32.424725
3206	1	1	222	2015	2015-03-23	2015-03-23	I was not feeling well 	approved	2015-03-30 10:42:47.572426	2015-04-27 05:00:32.523318
3218	8	1	71	2015	2015-04-03	2015-04-03	Out of Station	approved	2015-04-01 10:14:05.559225	2015-04-27 09:43:00.209533
3601	5	0.5	155	2015	2015-07-20	2015-07-20	Personal Work	approved	2015-07-20 06:44:20.182772	2015-07-21 07:07:52.045996
3609	5	1	49	2015	2015-07-24	2015-07-24	My Parents are coming	Pending	2015-07-22 10:30:26.07529	2015-07-22 10:30:26.07529
3602	5	0.5	102	2015	2015-07-20	2015-07-20	Fever	approved	2015-07-20 07:44:04.294837	2015-07-24 09:23:11.082991
3607	1	1	102	2015	2015-07-21	2015-07-21	Stomach Pain	approved	2015-07-22 04:33:54.563285	2015-07-24 09:23:13.139466
3608	2	2	54	2015	2015-07-20	2015-07-21	Went Home for Festival	approved	2015-07-22 05:35:02.58952	2015-07-31 10:00:49.888461
3603	1	1	133	2015	2015-07-20	2015-07-20	I am not feeling well	approved	2015-07-21 04:28:14.545926	2015-07-31 10:00:58.844792
302	1	1	59	2013	2013-01-21	2013-01-21	suffered by fever	approved	\N	\N
310	2	0.5	91	2013	2013-01-25	2013-01-25	personal	cancelled	\N	\N
307	4	0.5	51	2013	2013-01-24	2013-01-24	For MBA exam	approved	\N	\N
306	1	1	38	2013	2013-01-24	2013-01-24	Not feeling well	approved	\N	\N
297	8	1	44	2013	2013-01-25	2013-01-25	Going to native.	approved	\N	\N
309	1	1	30	2013	2013-01-23	2013-01-23	Cold and fever and headache.	approved	\N	\N
320	2	1	51	2013	2013-01-31	2013-01-31	Having function in home	approved	\N	\N
319	2	1	67	2013	2013-01-31	2013-01-31	Going to hospital..	approved	\N	\N
321	1	1	67	2013	2013-01-29	2013-01-29	Not feeling will	approved	\N	\N
316	2	1	34	2013	2013-02-01	2013-02-01	personal	approved	\N	\N
317	2	10	34	2013	2013-02-11	2013-02-22	For my marriage	approved	\N	\N
313	5	0.5	34	2013	2013-01-25	2013-01-25	personal work	approved	\N	\N
318	2	2	60	2013	2013-01-31	2013-02-01	Due my brothers marriage.	approved	\N	\N
333	1	1	91	2013	2013-02-06	2013-02-06	fever	approved	\N	\N
328	1	3	33	2013	2013-02-06	2013-02-08	For medical check up	approved	\N	\N
331	1	1	96	2013	2013-02-06	2013-02-06	suffering from cold.	approved	\N	\N
314	1	1	96	2013	2013-01-28	2013-01-28	suffering from fever	approved	\N	\N
330	2	1	57	2013	2013-02-11	2013-02-11	Function(cousins marriage)	approved	\N	\N
340	2	2	55	2013	2013-02-14	2013-02-15	Going to Home town	approved	\N	\N
341	2	5	95	2013	2013-02-25	2013-03-01	brothers marriage	approved	\N	\N
336	2	1	85	2013	2013-02-25	2013-02-25	I have to go tirupati temple	cancelled	\N	\N
349	1	1	95	2013	2013-02-14	2013-02-14	cough and cold	approved	\N	\N
350	5	0.5	51	2013	2013-02-15	2013-02-15	I need to take care my kid	approved	\N	\N
342	2	5	95	2013	2013-02-25	2013-03-01	brothers marriage	cancelled	\N	\N
354	2	1	96	2013	2013-02-19	2013-02-19	personal work	cancelled	\N	\N
360	2	1	96	2013	2013-02-20	2013-02-20	transportation problem	approved	\N	\N
362	1	1	33	2013	2013-02-25	2013-02-25	For check-up	approved	\N	\N
358	7	6	104	2013	2013-02-11	2013-02-18	Paternity	approved	\N	\N
329	2	1	78	2013	2013-02-05	2013-02-05	Personal work.	approved	\N	\N
346	2	1	79	2013	2013-02-15	2013-02-15	Parent's Wedding Anniversary Celebration	approved	\N	\N
345	5	0.5	74	2013	2013-02-12	2013-02-12	Thumb injury. Have an appointment with doctor. Request for half day leave.	approved	\N	\N
312	1	1	65	2013	2013-01-24	2013-01-24	Personal Reason.	approved	\N	\N
339	2	1	65	2013	2013-02-19	2013-02-19	I am taking Leave due to person reason.\r\n	approved	\N	\N
308	1	1	31	2013	2013-01-23	2013-01-23	for treatment	approved	\N	\N
334	1	2	31	2013	2013-02-06	2013-02-07	fever	approved	\N	\N
347	2	2	72	2013	2013-02-11	2013-02-12	Mother's health was not good.	approved	\N	\N
335	1	4	74	2013	2013-02-04	2013-02-07	Viral Fever	approved	\N	\N
364	1	1	91	2013	2013-02-25	2013-02-25	dysentery problem	approved	\N	\N
359	2	1	37	2013	2013-02-22	2013-02-22	Will Go My cousin's Marriage	approved	\N	\N
305	2	11	74	2013	2013-02-28	2013-03-15	Testing for future leave	cancelled	\N	\N
361	2	11	74	2013	2013-03-01	2013-03-15	My marriage is scheduled in March 3rd.	cancelled	\N	\N
366	2	12	74	2013	2013-02-28	2013-03-15	My Marriage	approved	\N	\N
368	1	1	33	2013	2013-02-26	2013-02-26	sick	approved	\N	\N
372	2	1	28	2013	2013-03-01	2013-03-01	Medical Checkup	approved	\N	\N
326	2	4	30	2013	2013-02-20	2013-02-25	My own brother marriage on 22/02/13. Please approval my leave days. 	approved	\N	\N
332	2	1	34	2013	2013-02-06	2013-02-06	personal work	approved	\N	\N
322	5	0.5	32	2013	2013-01-28	2013-01-28	For personal work	approved	\N	\N
323	2	2	32	2013	2013-01-30	2013-01-31	For Personal work	approved	\N	\N
356	5	0.5	85	2013	2013-02-18	2013-02-18	personal work	approved	\N	\N
357	5	0.5	85	2013	2013-02-22	2013-02-22	personal work	approved	\N	\N
374	1	1	32	2013	2013-03-25	2013-03-25	Fever	cancelled	\N	\N
378	1	1	32	2013	2013-02-25	2013-02-25	Fever	approved	\N	\N
352	2	2	59	2013	2013-02-19	2013-02-20	I need to go for my sister's marriage.	approved	\N	\N
355	1	0.5	87	2013	2013-02-18	2013-02-18	Not Feeling well	approved	\N	\N
373	2	1	96	2013	2013-03-01	2013-03-01	Personal work	approved	\N	\N
369	2	2	31	2013	2013-02-28	2013-03-01	For Mother's operation	approved	\N	\N
365	2	1	78	2013	2013-03-01	2013-03-01	Personal work.	approved	\N	\N
379	2	1	78	2013	2013-02-28	2013-02-28	Personal work.	approved	\N	\N
380	2	6	97	2013	2013-03-19	2013-03-26	personal	approved	\N	\N
381	8	1	97	2013	2013-03-27	2013-03-27	Festival	approved	\N	\N
382	2	1	97	2013	2013-03-28	2013-03-28	personal	approved	\N	\N
383	8	1	97	2013	2013-03-29	2013-03-29	Good Friday	approved	\N	\N
384	2	5	97	2013	2013-04-01	2013-04-05	Personal	approved	\N	\N
395	2	2	65	2013	2013-03-25	2013-03-26	Going Home.	approved	\N	\N
367	1	5	47	2013	2013-02-19	2013-02-25	Fever	approved	\N	\N
375	2	8	44	2013	2013-04-01	2013-04-10	Sister's Marriage	approved	\N	\N
376	8	1	44	2013	2013-04-11	2013-04-11	Sister's Marriage	approved	\N	\N
377	2	1	44	2013	2013-04-12	2013-04-12	Sister's Marriage	approved	\N	\N
324	2	3	80	2013	2013-02-13	2013-02-15	Sister Marriage	approved	\N	\N
325	2	2	82	2013	2013-02-22	2013-02-25	Sister Marriage.	approved	\N	\N
338	2	1	56	2013	2013-02-15	2013-02-15	As I am Going to native place for personal work.	approved	\N	\N
315	1	1	77	2013	2013-01-28	2013-01-28	Due to Cold and cough	approved	\N	\N
344	5	0.5	77	2013	2013-02-13	2013-02-13	For personal work 	approved	\N	\N
337	2	1	68	2013	2013-02-11	2013-02-11	To go temple	approved	\N	\N
343	1	0.5	29	2013	2013-02-12	2013-02-12	not feeling well	approved	\N	\N
385	8	1	29	2013	2013-03-27	2013-03-27	Going to native	approved	\N	\N
386	2	1	29	2013	2013-03-28	2013-03-28	Going to native	approved	\N	\N
389	2	2	29	2013	2013-04-01	2013-04-02	Going to native	approved	\N	\N
348	2	1	94	2013	2013-02-14	2013-02-14	Going to college to collect markscard and degree cerftificates	approved	\N	\N
351	5	0.5	94	2013	2013-02-15	2013-02-15	need to report to the college	approved	\N	\N
363	1	3	94	2013	2013-02-20	2013-02-22	viral fever	approved	\N	\N
371	2	1	42	2013	2013-03-01	2013-03-01	I will going to madurai.	approved	\N	\N
311	5	0.5	91	2013	2013-01-25	2013-01-25	personal	approved	\N	\N
388	1	2	29	2013	2013-04-01	2013-04-02	Going to native	cancelled	\N	\N
398	1	1	72	2013	2013-03-04	2013-03-04	Fever	approved	\N	\N
2095	8	1	125	2014	2014-08-29	2014-08-29	Ganesh Chathurti\r\n	approved	\N	\N
2103	5	1	127	2014	2014-08-22	2014-08-22	Personal Emergency	approved	\N	\N
2086	8	1	155	2014	2014-08-29	2014-08-29	Optional Holiday Ganesha Festival	approved	\N	\N
2104	8	1	134	2014	2014-08-29	2014-08-29	Due to Ganesh Chathurti \r\nfestival.	approved	\N	\N
2108	8	1	111	2014	2014-08-29	2014-08-29	On behalf of Ganesh Chathurti.	approved	\N	\N
2106	2	1	191	2014	2014-09-01	2014-09-01	Regarding Loan I have to be present at the bank at my native place.	cancelled	\N	\N
2118	1	1	71	2014	2014-09-01	2014-09-01	Cough and Cold	approved	\N	\N
2087	1	1	30	2014	2014-08-27	2014-08-27	Not feeling well	approved	\N	\N
2111	2	5	177	2014	2014-08-25	2014-08-29	typhoid fever	approved	\N	\N
2125	2	3	44	2014	2014-09-08	2014-09-10	Going to home for Onam festival.	approved	\N	\N
2109	9	1	80	2014	2014-09-11	2014-09-11	As I have some personal work.	approved	\N	\N
2127	2	1	59	2014	2014-09-03	2014-09-03	I went to my native.	approved	\N	\N
2092	8	2	179	2014	2014-10-03	2014-10-06	For Festival	approved	\N	\N
2093	2	6	179	2014	2014-10-07	2014-10-14	Going to home town	approved	\N	\N
2122	2	3	145	2014	2014-10-17	2014-10-27	Going to native , to celebrate the Diwali Festival with family.	approved	\N	\N
2663	2	2	128	2014	2014-12-18	2014-12-19	Personal work	approved	\N	\N
2652	1	2	213	2014	2014-12-16	2014-12-17	Due to fever i disn't came.	approved	\N	\N
2786	2	1	147	2015	2015-01-16	2015-01-16	festival	cancelled	\N	2015-01-05 09:05:35.191415
2662	8	1	142	2014	2014-12-31	2014-12-31	Personal work	approved	\N	2015-01-05 09:07:53.514516
2935	2	1	147	2015	2015-01-23	2015-01-23	going home	approved	2015-01-28 05:26:46.523207	2015-01-28 10:43:55.877706
2787	8	1	179	2015	2015-01-15	2015-01-15	Optional Holiday	approved	\N	2015-02-04 07:25:24.346631
3189	1	3	145	2015	2015-03-23	2015-03-25	Suffered from cold, cough and fever.	approved	2015-03-26 08:46:43.680497	2015-03-27 04:42:10.722607
3190	1	1	191	2015	2015-03-26	2015-03-26	Due to rigorous body pain I was not able to attend the office on that day.	approved	2015-03-27 05:10:14.00165	2015-03-27 06:31:04.715181
3183	2	1	59	2015	2015-03-26	2015-03-26	Personal work	approved	2015-03-25 05:50:42.83159	2015-03-27 09:10:11.447582
3207	2	1	29	2015	2015-04-03	2015-04-03	Going to native	cancelled	2015-03-30 13:31:25.317729	2015-03-30 13:33:07.764013
3210	2	1	144	2015	2015-03-27	2015-03-27	I went to my hometown.	approved	2015-03-31 04:16:48.108773	2015-03-31 04:47:11.488177
3211	2	1	144	2015	2015-03-30	2015-03-30	I went to my hometown	approved	2015-03-31 04:17:14.923208	2015-03-31 04:47:13.631724
3208	2	3	29	2015	2015-04-06	2015-04-08	Going to native	approved	2015-03-30 13:33:03.113897	2015-03-31 04:50:55.086195
3202	2	4	52	2015	2015-04-27	2015-04-30	I will be out of station.	approved	2015-03-30 06:56:56.403431	2015-03-31 06:44:33.349174
3228	8	1	188	2015	2015-04-03	2015-04-03	medical terms	approved	2015-04-02 13:43:20.523676	2015-04-03 06:12:08.643279
3226	8	1	95	2015	2015-04-03	2015-04-03	some personal work.	approved	2015-04-02 13:21:07.837652	2015-04-08 08:18:12.024509
3217	5	0.5	102	2015	2015-04-01	2015-04-01	Going to bank.	approved	2015-04-01 07:52:26.677872	2015-04-08 08:18:23.418229
3219	8	1	87	2015	2015-04-03	2015-04-03	Good Friday....	approved	2015-04-01 11:30:10.97281	2015-04-08 08:18:33.060189
3177	1	2	225	2015	2015-03-10	2015-03-11	not feeling well	approved	2015-03-24 04:46:46.76971	2015-04-17 11:03:33.849716
3621	2	5	45	2015	2015-07-09	2015-07-15	Sick	cancelled	2015-07-27 06:26:53.464752	2015-07-27 09:58:59.302942
3626	1	2	45	2015	2015-07-21	2015-07-22	Sick	approved	2015-07-27 10:08:05.73895	2015-07-27 10:14:26.57458
3650	5	0.5	188	2015	2015-07-31	2015-07-31	is sick	approved	2015-07-31 06:55:43.071237	2015-07-31 10:00:54.156406
3623	2	1	134	2015	2015-07-21	2015-07-21	Personal issue.	approved	2015-07-27 08:37:25.787176	2015-07-31 10:01:02.569381
3633	1	1	143	2015	2015-07-17	2015-07-17	Was not well.	approved	2015-07-27 10:59:15.206073	2015-08-03 06:00:12.783549
3655	2	1	177	2015	2015-08-03	2015-08-03	Going to chennai	approved	2015-07-31 12:42:55.157764	2015-08-03 06:00:36.892088
3673	5	0.5	109	2015	2015-08-07	2015-08-07	Personal reason.	approved	2015-08-07 04:47:10.881463	2015-08-07 07:00:32.460461
3660	3	1	102	2015	2015-08-03	2015-08-03	MY Grandfather kicked the bucket.	approved	2015-08-04 05:35:14.008221	2015-08-08 06:39:40.950459
3666	1	2	59	2015	2015-08-03	2015-08-04	Suffered by fever.	approved	2015-08-05 04:57:21.131935	2015-08-08 06:39:45.941038
3711	5	1	221	2015	2015-08-24	2015-08-24	Board meeting of Quinnox at 5.30 PM onwards.	Pending	2015-08-15 05:59:24.06976	2015-08-15 05:59:24.06976
3611	5	1	60	2015	2015-07-21	2015-07-21	My sister health is not good so i went to hospital	approved	2015-07-23 04:50:00.848032	2015-08-17 13:03:48.677798
3704	2	4	134	2015	2015-08-17	2015-08-20	Going home for some  personal work.	approved	2015-08-12 14:21:49.762266	2015-08-19 06:22:58.285306
3644	2	1	241	2015	2015-08-14	2015-08-14	Due to Personal reasons going to Coimbatore...	approved	2015-07-29 02:42:21.841512	2015-08-20 07:20:53.474344
3658	5	0.5	201	2015	2015-08-03	2015-08-03	Iam unwell	approved	2015-08-03 08:00:20.152915	2015-08-20 07:27:57.988692
3690	8	1	163	2015	2015-08-28	2015-08-28	Going native for Onam	approved	2015-08-12 04:42:31.415419	2015-08-21 10:21:20.81712
3691	2	4	163	2015	2015-08-24	2015-08-27	Going native for Onam	approved	2015-08-12 04:43:13.758947	2015-08-21 10:21:37.650681
3693	8	1	197	2015	2015-08-28	2015-08-28	Going for ONAM festival	approved	2015-08-12 04:49:19.687294	2015-08-21 10:21:46.262899
3694	2	6	197	2015	2015-08-20	2015-08-27	Going to native	approved	2015-08-12 04:50:03.183149	2015-08-21 10:21:53.790081
3642	9	1	72	2015	2015-07-29	2015-07-29	Personal Work	approved	2015-07-28 11:54:03.273601	2015-08-21 11:01:57.15902
3639	2	2	131	2015	2015-06-29	2015-06-30	not well	approved	2015-07-28 05:29:53.685726	2015-08-21 11:29:12.993536
3713	1	1	218	2015	2015-08-17	2015-08-17	Viral fever.	approved	2015-08-17 02:34:51.856474	2015-08-24 04:16:35.58403
3696	1	1	72	2015	2015-08-11	2015-08-11	Not feeling well	approved	2015-08-12 05:10:41.157254	2015-08-24 04:16:41.370231
3685	1	1	63	2015	2015-07-31	2015-08-02	Not Feeling well. Admitted in hospital	approved	2015-08-11 11:14:13.68422	2015-08-25 05:31:20.876275
3687	5	1	63	2015	2015-08-05	2015-08-05	Not feeling well. 	approved	2015-08-11 12:31:01.648615	2015-08-25 05:31:30.442828
3628	1	1	48	2015	2015-07-21	2015-07-21	Sick	approved	2015-07-27 10:20:52.890314	2015-08-25 05:33:32.749343
390	2	3	34	2013	2013-02-25	2013-02-27	personal	approved	\N	\N
370	2	2	51	2013	2013-02-28	2013-03-01	For my sister marriage	approved	\N	\N
392	8	1	65	2013	2013-03-27	2013-03-27	Optional Leave for Holi.	approved	\N	\N
394	8	1	65	2013	2013-03-29	2013-03-29	Optional Leave for Good Friday. 	approved	\N	\N
2102	5	1	127	2014	2014-08-27	2014-08-27	Personal emergency.	approved	\N	\N
2090	8	1	77	2014	2014-08-29	2014-08-29	Optional	approved	\N	\N
2098	2	1	55	2014	2014-09-01	2014-09-01	Festival	cancelled	\N	\N
2088	8	1	31	2014	2014-08-29	2014-08-29	Ganesh Chathurti festival	approved	\N	\N
2091	8	1	48	2014	2014-08-29	2014-08-29	 Ganesha Festival	approved	\N	\N
2117	1	1	158	2014	2014-09-02	2014-09-02	fever	approved	\N	\N
2114	5	0.5	77	2014	2014-09-01	2014-09-01	Due to personal illness	approved	\N	\N
2020	8	1	109	2014	2014-08-29	2014-08-29	I want to visit hometown for festival.	approved	\N	\N
2115	2	1	163	2014	2014-09-02	2014-09-02	Because of family matter.	approved	\N	\N
2116	2	2	163	2014	2014-09-05	2014-09-08	Going to Native for Onam celebration	approved	\N	\N
2131	2	7	178	2014	2014-09-11	2014-09-19	my nephew's son naming ceremony at coorg.	approved	\N	\N
2667	2	1	52	2014	2014-12-08	2014-12-08	I had some personal work.	approved	\N	\N
2664	8	2	143	2014	2014-12-25	2014-12-26	Going to Chennai for Christmas celebration with family.	approved	\N	\N
2791	1	1	178	2015	2015-01-02	2015-01-02	I was ill	approved	\N	2015-01-05 09:06:09.365314
2788	5	0.5	72	2015	2015-01-02	2015-01-02	Not feeling well	approved	\N	2015-01-05 09:06:13.552555
2936	2	1	147	2015	2015-01-27	2015-01-27	going home	approved	2015-01-28 05:26:59.79968	2015-01-30 10:19:07.460979
3178	1	1	51	2015	2015-03-20	2015-03-20	I was not feeling well	approved	2015-03-24 04:53:21.3527	2015-03-24 05:20:35.190214
3188	5	0.5	143	2015	2015-03-26	2015-03-26	Not Well.	approved	2015-03-26 08:23:40.710796	2015-03-27 04:42:23.053578
3209	8	1	29	2015	2015-04-03	2015-04-03	Going to native	approved	2015-03-30 13:33:37.901861	2015-03-31 04:50:51.419687
3204	5	0.5	188	2015	2015-03-30	2015-03-30	Appointment with a doctor	approved	2015-03-30 07:52:51.863153	2015-03-31 04:51:02.971205
3229	4	1	187	2015	2015-04-17	2015-04-17	Sister's Examination.	cancelled	2015-04-02 13:47:24.215753	2015-04-03 06:11:53.75687
3225	8	1	168	2015	2015-04-03	2015-04-03	good friday	approved	2015-04-02 10:43:45.385358	2015-04-03 06:12:21.132907
3231	2	10	187	2015	2015-04-17	2015-04-30	Going home.	approved	2015-04-03 10:01:27.087758	2015-04-15 09:31:44.20181
3205	7	3	212	2015	2015-03-09	2015-03-11	Child Born	approved	2015-03-30 10:28:04.746573	2015-04-17 11:20:32.427938
3222	8	1	185	2015	2015-04-03	2015-04-03	Good Friday	approved	2015-04-02 04:54:12.010916	2015-04-17 11:26:14.188145
3221	1	1	224	2015	2015-03-31	2015-03-31	I WANT GO TO HOSPITAL BECAUSE MOTHER NOT WELL.	approved	2015-04-02 04:49:17.344819	2015-04-17 11:27:36.86967
3213	1	1	218	2015	2015-03-30	2015-03-30	Food poisoning.	approved	2015-03-31 06:53:05.920043	2015-04-22 12:08:52.844355
3232	2	3	128	2015	2015-04-23	2015-04-27	Going to Hometown	approved	2015-04-03 10:19:37.207431	2015-04-24 10:46:44.155057
3616	1	1	171	2015	2015-07-23	2015-07-23	not feeling well	approved	2015-07-24 10:41:35.351999	2015-07-27 05:14:25.431573
3627	5	3	45	2015	2015-07-13	2015-07-15	Sick	approved	2015-07-27 10:08:54.965863	2015-07-27 10:14:29.642147
3688	5	1	63	2015	2015-08-07	2015-08-07	Worked on Saturday ie... 11/08/2015	Pending	2015-08-11 12:36:21.585562	2015-08-11 12:36:21.585562
3683	2	4	151	2015	2015-08-03	2015-08-06	Went home town	approved	2015-08-11 10:41:41.020189	2015-08-12 06:05:22.81252
3612	5	1	60	2015	2015-07-22	2015-07-22	My sister health is not good so i went to hospital	approved	2015-07-23 04:51:00.943684	2015-08-17 13:03:57.711439
3710	5	0.5	60	2015	2015-08-13	2015-08-13	Sister's health problem	approved	2015-08-14 05:26:52.058916	2015-08-17 13:04:01.197101
3619	2	2	158	2015	2015-08-03	2015-08-04	Festival 	approved	2015-07-27 04:48:41.022874	2015-08-17 13:04:28.191454
3667	2	1	117	2015	2015-08-04	2015-08-04	Not feeling well	approved	2015-08-05 05:09:16.496679	2015-08-20 07:27:38.126604
3641	2	1	94	2015	2015-07-29	2015-07-29	personal work	approved	2015-07-28 10:23:22.201109	2015-08-21 11:17:34.524876
3674	5	0.5	72	2015	2015-08-07	2015-08-07	personal work	approved	2015-08-07 08:17:22.850915	2015-08-21 11:18:40.145379
3712	2	3	72	2015	2015-08-20	2015-08-24	Going home	approved	2015-08-15 11:32:52.620066	2015-08-24 04:16:15.631693
3681	5	0.5	178	2015	2015-08-12	2015-08-12	personal work	approved	2015-08-11 07:45:44.018074	2015-08-24 10:55:09.185911
393	1	1	65	2013	2013-03-29	2013-03-29	Optional Leave for Good Friday. 	cancelled	\N	\N
391	5	0.5	85	2013	2013-03-05	2013-03-05	I went to Aadhaar centre  to get card	approved	\N	\N
400	5	0.5	44	2013	2013-03-08	2013-03-08	Sick	approved	\N	\N
396	2	1	65	2013	2013-03-28	2013-03-28	Going Home.	approved	\N	\N
2099	8	1	133	2014	2014-08-29	2014-08-29	i am going to native.	approved	\N	\N
2089	8	1	68	2014	2014-08-29	2014-08-29	For Festival	approved	\N	\N
2096	8	1	55	2014	2014-08-29	2014-08-29	Festival	approved	\N	\N
2101	8	1	45	2014	2014-08-29	2014-08-29	optional	approved	\N	\N
2119	2	1	125	2014	2014-09-02	2014-09-02	Personal reason	approved	\N	\N
2121	1	1	142	2014	2014-09-01	2014-09-01	Suffering from cold and cough.	approved	\N	\N
2105	5	0.5	117	2014	2014-08-29	2014-08-29	Festival	approved	\N	\N
2107	8	1	144	2014	2014-08-29	2014-08-29	Festival	approved	\N	\N
2110	1	1	139	2014	2014-08-28	2014-08-28	Not Well	approved	\N	\N
2113	5	0.5	99	2014	2014-08-27	2014-08-27	Not Well.	approved	\N	\N
2123	2	2	31	2014	2014-09-04	2014-09-05	Going to native 	approved	\N	\N
2129	2	7	140	2014	2014-07-23	2014-07-31	Iam in maternity leave	cancelled	\N	\N
2669	5	1	143	2014	2014-11-28	2014-11-28	Was not well.	Pending	\N	\N
2790	1	1	200	2015	2015-01-02	2015-01-02	Due to not feeling well.	approved	\N	2015-01-05 09:06:11.368172
2789	8	1	200	2015	2015-01-01	2015-01-01	To Celebrate New Year.	approved	\N	2015-01-05 09:06:18.352445
2937	5	0.5	140	2015	2015-01-28	2015-01-28	Personal Work	approved	2015-01-28 06:25:27.010999	2015-01-28 10:59:36.941475
2944	3	2	44	2015	2015-01-27	2015-01-28	To attend a funeral of a close relative	approved	2015-01-29 08:28:40.509502	2015-02-06 05:35:35.420821
3182	1	1	142	2015	2015-03-24	2015-03-24	Suffering from cold and cough.	approved	2015-03-25 04:20:14.785634	2015-03-27 04:42:14.797201
3193	2	2	196	2015	2015-03-30	2015-03-31	going to my friend marriage	approved	2015-03-27 12:02:41.272771	2015-03-30 06:37:04.698019
3203	2	7	52	2015	2015-05-04	2015-05-12	I will be out of station.	approved	2015-03-30 07:03:52.007829	2015-03-31 06:44:39.842312
3186	1	2	197	2015	2015-03-16	2015-03-17	viral fever	approved	2015-03-26 06:01:17.741483	2015-03-31 13:18:49.185844
3198	2	1	30	2015	2015-04-06	2015-04-06	Going to home.	approved	2015-03-30 04:43:07.080633	2015-04-02 13:25:52.290478
3223	2	2	101	2015	2015-04-06	2015-04-07	Temple Festival	approved	2015-04-02 07:20:15.969574	2015-04-03 06:12:15.153491
3180	5	0.5	54	2015	2015-03-24	2015-03-24	Not feeling well	approved	2015-03-24 10:49:59.263129	2015-04-03 06:19:10.183562
3214	2	5	163	2015	2015-04-13	2015-04-17	Going to Native.	cancelled	2015-03-31 13:18:22.788488	2015-04-04 08:10:33.38113
3196	5	0.5	142	2015	2015-03-30	2015-03-30	personal work	approved	2015-03-30 03:55:13.573237	2015-04-08 08:18:00.569638
3181	1	1	230	2015	2015-03-23	2015-03-23	cold flue	approved	2015-03-24 12:36:04.557637	2015-04-17 11:03:05.776932
3220	8	1	31	2015	2015-04-03	2015-04-03	Brother's engagement.	approved	2015-04-01 13:13:28.187943	2015-04-22 12:08:55.482198
3629	5	1	45	2015	2015-07-06	2015-07-06	Sick	approved	2015-07-27 10:23:24.078954	2015-07-27 12:10:09.008761
3636	2	1	90	2015	2015-07-28	2015-07-28	For attending a family function.	Pending	2015-07-27 13:06:40.305186	2015-07-27 13:06:40.305186
3670	2	2	54	2015	2015-08-07	2015-08-10	Going Home for My Brother Marriage	cancelled	2015-08-06 04:57:51.074318	2015-08-06 04:58:24.28905
3680	5	1	49	2015	2015-08-14	2015-08-14	Personal commitment	Pending	2015-08-11 07:14:36.245621	2015-08-11 07:14:36.245621
3613	2	3	30	2015	2015-07-31	2015-08-04	Personal work.	approved	2015-07-23 11:25:10.380859	2015-08-17 13:04:37.634453
3708	2	1	117	2015	2015-08-28	2015-08-28	Festival - Varamahalaxmi	cancelled	2015-08-13 06:54:00.74144	2015-08-18 05:46:54.360912
3705	5	1	134	2015	2015-08-21	2015-08-21	Going home for some  personal work.	approved	2015-08-12 14:22:15.997493	2015-08-19 06:23:03.548208
3672	5	2	54	2015	2015-08-13	2015-08-14	Going Home For My Brother Marriage	approved	2015-08-06 04:59:41.478735	2015-08-19 06:24:01.686408
3645	2	1	241	2015	2015-08-17	2015-08-17	Due to personal reasons going to Coimbatore..	approved	2015-07-29 02:43:06.110481	2015-08-20 07:21:36.436814
3699	2	3	212	2015	2015-08-19	2015-08-21	Going to Sister-in-law Marriage 	approved	2015-08-12 09:01:36.629881	2015-08-20 07:23:04.204152
3646	5	0.5	209	2015	2015-07-30	2015-07-30	I am going home.	approved	2015-07-29 12:48:24.617879	2015-08-20 07:27:10.5836
3649	2	1	211	2015	2015-07-28	2015-07-28	injured.	approved	2015-07-31 04:51:47.271678	2015-08-21 09:58:36.198033
3692	5	1	163	2015	2015-08-21	2015-08-21	Going native for Onam	approved	2015-08-12 04:44:12.518008	2015-08-21 10:21:28.071182
3659	1	1	31	2015	2015-08-03	2015-08-03	I was not feeling well.	approved	2015-08-04 04:48:28.026979	2015-08-21 11:10:36.328163
3701	1	4	33	2015	2015-08-17	2015-08-20	Back - pain treatment	approved	2015-08-12 12:56:10.380944	2015-08-24 06:50:46.835689
3702	2	1	33	2015	2015-08-21	2015-08-21	Back pain treatment	approved	2015-08-12 12:56:47.669786	2015-08-24 06:50:49.893785
3669	2	5	171	2015	2015-08-24	2015-08-28	Personal Vacation	approved	2015-08-06 04:49:09.307724	2015-08-24 09:50:53.960965
3682	2	2	178	2015	2015-08-17	2015-08-18	Out of station (coorg)	approved	2015-08-11 07:49:38.709038	2015-08-24 10:55:27.406209
397	2	5	65	2013	2013-04-01	2013-04-05	Going Home.	approved	\N	\N
2081	5	1	33	2014	2014-09-01	2014-09-01	Personal	approved	\N	\N
2112	5	0.5	158	2014	2014-09-01	2014-09-01	fever	approved	\N	\N
2072	8	1	70	2014	2014-08-29	2014-08-29	For Ganesh Festival.	approved	\N	\N
2120	2	1	30	2014	2014-09-04	2014-09-04	Personal work	approved	\N	\N
2130	2	2	140	2014	2014-09-01	2014-09-02	Iam in maternity leave	approved	\N	\N
2124	2	1	125	2014	2014-09-04	2014-09-04	medical appointment	cancelled	\N	\N
2128	8	1	169	2014	2014-08-29	2014-08-29	Festival	approved	\N	\N
2126	2	1	59	2014	2014-08-26	2014-08-26	I went to my native.	approved	\N	\N
2670	5	1	147	2014	2014-12-22	2014-12-22	Not feeling well	approved	\N	\N
2672	5	1	165	2014	2014-12-19	2014-12-19	Not well	approved	\N	\N
2689	2	7	179	2015	2015-01-15	2015-01-24	Going to my native	cancelled	\N	\N
2681	2	3	118	2014	2014-12-24	2014-12-26	Vacation with family	approved	\N	\N
2792	8	1	144	2015	2015-01-01	2015-01-01	New year celebration.	approved	2015-01-05 04:16:23.69518	2015-01-05 09:05:05.448214
2674	5	2	71	2014	2014-12-29	2014-12-30	Out of station	approved	\N	2015-01-21 09:14:43.959717
2943	9	1	80	2015	2015-01-30	2015-01-30	As I have some personal work.	approved	2015-01-29 06:42:18.221425	2015-01-29 08:48:28.662398
2938	1	1	211	2015	2015-01-27	2015-01-27	Due to fever.	approved	2015-01-28 06:54:21.397101	2015-02-03 10:26:42.217755
3199	1	1	211	2015	2015-03-27	2015-03-27	Having fever and diarrhea.	approved	2015-03-30 05:00:11.877204	2015-03-31 13:18:34.415019
3227	8	1	191	2015	2015-04-03	2015-04-03	Personal Work.	approved	2015-04-02 13:21:57.545185	2015-04-08 08:18:29.718337
3194	8	2	33	2015	2015-04-02	2015-04-03	Easter Holidays	approved	2015-03-27 14:10:12.591187	2015-04-17 11:25:20.835733
3200	1	1	213	2015	2015-03-27	2015-03-27	i was suffering from head ache 	approved	2015-03-30 05:56:03.896279	2015-04-17 11:28:54.573011
3216	2	1	128	2015	2015-04-02	2015-04-02	Persoanl Work	approved	2015-04-01 04:42:55.538286	2015-04-24 10:46:52.021053
3191	5	0.5	99	2015	2015-03-27	2015-03-27	Urgent issue.	approved	2015-03-27 08:05:54.652351	2015-04-24 11:16:02.915806
3615	1	1	216	2015	2015-07-24	2015-07-24	Not well	approved	2015-07-24 05:07:49.529442	2015-07-24 09:23:26.730783
3617	5	1	242	2015	2015-07-27	2015-07-27	For my Wife Maternity Emergency Checkup. I need one day time off. Kindly grand me leave.	approved	2015-07-26 18:33:41.166527	2015-07-30 08:57:40.034596
3648	2	1	203	2015	2015-07-30	2015-07-30	Personal  Work	Pending	2015-07-31 03:26:45.116021	2015-07-31 03:26:45.116021
3638	1	1	249	2015	2015-07-27	2015-07-27	As my grandfather passed away on 26-07-2015, I went to my hometown to attend the funeral.hence,I was unable to come to office on 27-06-2015 .	approved	2015-07-28 05:08:39.190015	2015-07-31 10:01:19.91839
3652	5	0.5	191	2015	2015-07-31	2015-07-31	Having very bad neck pain.	approved	2015-07-31 08:28:20.61508	2015-08-03 06:00:24.914313
3624	5	1	226	2015	2015-07-20	2015-07-20	Out of station	approved	2015-07-27 09:07:25.787229	2015-08-07 07:00:22.384844
3661	1	1	230	2015	2015-08-03	2015-08-03	food infection	approved	2015-08-04 05:58:03.143721	2015-08-07 07:00:41.755742
3651	9	1	142	2015	2015-08-04	2015-08-04	personal work	approved	2015-07-31 07:51:28.372379	2015-08-08 06:39:53.125758
3689	5	1	63	2015	2015-08-06	2015-08-06	Not feeling well. Admitted to hospital. 	Pending	2015-08-11 12:38:06.051941	2015-08-11 12:38:06.051941
3714	1	1	30	2015	2015-08-14	2015-08-14	Not Feeling Well(headache).	approved	2015-08-17 05:22:38.79469	2015-08-17 13:04:32.391384
3678	1	1	187	2015	2015-08-07	2015-08-07	Sick	approved	2015-08-11 04:37:08.512036	2015-08-19 06:23:25.371737
3703	5	0.5	191	2015	2015-08-12	2015-08-12	Not well.	approved	2015-08-12 13:53:56.999523	2015-08-19 06:56:46.769898
3707	5	0.5	235	2015	2015-08-13	2015-08-13	I had work in bank.	approved	2015-08-13 06:44:35.037525	2015-08-20 07:22:51.480067
3677	2	1	185	2015	2015-08-14	2015-08-14	Family Function	approved	2015-08-10 09:28:08.544978	2015-08-20 07:23:21.472783
3675	2	1	117	2015	2015-08-06	2015-08-06	Not feeling well	approved	2015-08-07 09:30:47.594209	2015-08-20 07:24:08.681756
3647	2	1	209	2015	2015-07-31	2015-07-31	I am going home.	approved	2015-07-29 12:48:41.455919	2015-08-20 07:27:02.329848
3614	2	2	217	2015	2015-07-30	2015-07-31	personal work	approved	2015-07-24 04:14:52.913976	2015-08-20 07:28:55.642431
3643	2	1	241	2015	2015-07-14	2015-07-14	Due to Personal reasons going to Coimbatore.. 	approved	2015-07-29 02:40:36.127302	2015-08-20 07:30:11.207541
3700	2	2	198	2015	2015-08-17	2015-08-18	I am going to native	approved	2015-08-12 11:56:25.759411	2015-08-21 06:15:14.913654
3634	5	0.5	40	2015	2015-07-17	2015-07-17	Personal work!	approved	2015-07-27 11:31:55.143358	2015-08-21 09:55:15.515364
3653	5	1	218	2015	2015-07-31	2015-07-31	Emergency situation.	approved	2015-07-31 10:16:57.550426	2015-08-21 09:58:51.837617
3695	2	5	197	2015	2015-08-31	2015-09-04	Going to Native	approved	2015-08-12 04:50:40.98076	2015-08-21 10:22:03.28389
3662	2	2	215	2015	2015-08-10	2015-08-11	Personal work at home	approved	2015-08-04 06:57:16.180196	2015-08-21 10:22:11.981794
3668	5	1	72	2015	2015-08-10	2015-08-10	Attending friend's wedding	approved	2015-08-05 12:00:31.868893	2015-08-21 11:07:51.273655
3709	3	2	60	2015	2015-08-11	2015-08-12	Sister's health problem	approved	2015-08-14 05:24:56.662645	2015-08-21 11:11:26.989261
3698	5	2	91	2015	2015-08-20	2015-08-21	Brother marriage	approved	2015-08-12 06:47:53.726374	2015-08-24 09:56:02.631339
3676	9	1	80	2015	2015-08-11	2015-08-11	Personal work.	approved	2015-08-08 06:42:37.393983	2015-08-24 10:54:54.823144
3706	1	1	80	2015	2015-08-12	2015-08-12	As I was not feeling well.	approved	2015-08-13 05:13:02.168604	2015-08-24 10:54:58.906702
353	2	1	43	2013	2013-02-22	2013-02-22	Due to my personnel work.	approved	\N	\N
327	1	0.5	59	2013	2013-02-05	2013-02-05	Iam suffering from fever and throat pain.	approved	\N	\N
403	1	1	59	2013	2013-03-08	2013-03-08	suffered from fever	approved	\N	\N
399	3	1	102	2013	2013-03-04	2013-03-04	Death	approved	\N	\N
404	5	0	58	2013	2013-03-12	2013-03-12	Due some personal work.\r\n2nd half\r\n	approved	\N	\N
401	1	1	105	2013	2013-03-08	2013-03-08	Not feeling well.	approved	\N	\N
420	3	1	47	2013	2013-03-18	2013-03-18	Grand father's death	approved	\N	\N
419	2	2	105	2013	2013-02-20	2013-02-21	Bharath bandh	approved	\N	\N
405	2	6	36	2013	2013-03-22	2013-03-31	Holi Festival	cancelled	\N	\N
431	9	1	59	2013	2013-03-26	2013-03-26	going to native	cancelled	\N	\N
418	1	1	59	2013	2013-03-19	2013-03-19	suffered from fever	approved	\N	\N
424	2	1	103	2013	2013-03-22	2013-03-22	To collect my experience letter in previous company.	approved	\N	\N
433	1	1	105	2013	2013-03-25	2013-03-25	Not feeling well.	approved	\N	\N
412	3	7	96	2013	2013-03-19	2013-03-27	Occasioned death of my grandmother.	approved	\N	\N
408	2	1	87	2013	2013-03-28	2013-03-28	Going home for easter	approved	\N	\N
409	8	1	87	2013	2013-03-29	2013-03-29	Good friday	approved	\N	\N
426	8	1	43	2013	2013-03-27	2013-03-27	Due to festival	approved	\N	\N
427	2	1	43	2013	2013-03-28	2013-03-28	Due to Festival	approved	\N	\N
428	8	1	43	2013	2013-03-29	2013-03-29	Due to festival	approved	\N	\N
425	8	1	32	2013	2013-03-27	2013-03-27	Holi	approved	\N	\N
436	8	1	34	2013	2013-03-29	2013-03-29	personal	approved	\N	\N
438	8	1	99	2013	2013-03-29	2013-03-29	Good Friday	cancelled	\N	\N
402	1	3	34	2013	2013-03-06	2013-03-08	personal	approved	\N	\N
407	1	2	60	2013	2013-03-11	2013-03-12	My grandfather was expired.	approved	\N	\N
406	2	0.5	85	2013	2013-03-14	2013-03-14	pooja	approved	\N	\N
439	8	1	105	2013	2013-03-27	2013-03-27	Going to chennai.	approved	\N	\N
448	1	1	68	2013	2013-03-28	2013-03-28	Went to hospital	approved	\N	\N
387	8	1	29	2013	2013-03-29	2013-03-29	Going to native	approved	\N	\N
414	5	0.5	65	2013	2013-03-19	2013-03-19	taken due to personal work.	approved	\N	\N
434	8	1	78	2013	2013-03-29	2013-03-29	Optional holiday.	approved	\N	\N
451	5	0.5	78	2013	2013-04-02	2013-04-02	Personal work.	approved	\N	\N
423	2	5	36	2013	2013-03-24	2013-03-29	Holi Festival and Puja at home	approved	\N	\N
422	8	1	33	2013	2013-03-29	2013-03-29	easter	approved	\N	\N
421	8	1	33	2013	2013-03-27	2013-03-27	easter  	approved	\N	\N
416	2	1	33	2013	2013-03-28	2013-03-28	Easter holidays	approved	\N	\N
445	8	1	107	2013	2013-03-29	2013-03-29	good friday	approved	\N	\N
430	5	0.5	51	2013	2013-03-22	2013-03-22	First half I had my personal work.	approved	\N	\N
415	8	1	58	2013	2013-03-27	2013-03-27	Holi day.	approved	\N	\N
447	5	0.5	108	2013	2013-03-29	2013-03-29	Attend Function	approved	\N	\N
435	8	1	74	2013	2013-03-29	2013-03-29	1st Optional leave	approved	\N	\N
446	8	1	94	2013	2013-03-29	2013-03-29	good friday	approved	\N	\N
429	1	0.5	77	2013	2013-03-22	2013-03-22	not feeling well	approved	\N	\N
437	8	1	99	2013	2013-03-27	2013-03-27	Holi	approved	\N	\N
410	5	0.5	96	2013	2013-03-14	2013-03-14	urgent work	approved	\N	\N
450	1	1	105	2013	2013-03-29	2013-03-29	not feeling well.	approved	\N	\N
440	8	1	90	2013	2013-03-27	2013-03-27	For celebrating Holi festival	approved	\N	\N
411	2	2	47	2013	2013-04-29	2013-04-30	Personal	approved	\N	\N
251	5	0.5	76	2013	2013-01-07	2013-01-07	Not Feeling Well	approved	\N	\N
452	1	0.5	101	2013	2013-04-02	2013-04-02	Sick	approved	\N	\N
413	2	3	96	2013	2013-03-28	2013-04-01	Occasioned death of my grandmother.	approved	\N	\N
457	1	1	37	2013	2013-04-15	2013-04-15	Not feeling well	cancelled	\N	\N
417	2	1	29	2013	2013-04-03	2013-04-03	Going to native	approved	\N	\N
453	2	1	68	2013	2013-04-03	2013-04-03	Need to go Hospital	approved	\N	\N
454	2	1	104	2013	2013-04-03	2013-04-03	For Passport physical verification	approved	\N	\N
458	1	1	37	2013	2013-03-28	2013-03-28	Not feeling well	approved	\N	\N
459	1	1	37	2013	2013-03-15	2013-03-15	Not Feeling well	approved	\N	\N
462	8	1	54	2013	2013-04-11	2013-04-11	Going Home	cancelled	\N	\N
463	2	1	54	2013	2013-04-12	2013-04-12	Going Home	cancelled	\N	\N
470	2	4	96	2013	2013-04-02	2013-04-05	personal work	approved	\N	\N
460	8	1	78	2013	2013-04-11	2013-04-11	Ugadi festival.	approved	\N	\N
461	2	1	78	2013	2013-04-12	2013-04-12	Ugadi festival.	approved	\N	\N
455	8	1	72	2013	2013-04-11	2013-04-11	Ugadi	approved	\N	\N
456	2	1	72	2013	2013-04-12	2013-04-12	Going to native for Ugadi	approved	\N	\N
473	8	1	79	2013	2013-04-11	2013-04-11	New Year	approved	\N	\N
474	2	1	79	2013	2013-04-15	2013-04-15	Attending family function	approved	\N	\N
469	8	1	104	2013	2013-04-11	2013-04-11	For Ugadhi Festival	approved	\N	\N
477	8	1	108	2013	2013-04-11	2013-04-11	Leave for ugadi	approved	\N	\N
472	2	1	110	2013	2013-04-11	2013-04-11	Ugadi Festival	approved	\N	\N
479	8	1	51	2013	2013-04-11	2013-04-11	For ugadi festival	approved	\N	\N
466	8	1	98	2013	2013-04-11	2013-04-11	Going Home	approved	\N	\N
467	8	1	98	2013	2013-04-15	2013-04-15	Going Home	approved	\N	\N
468	2	1	98	2013	2013-04-12	2013-04-12	Going Home	approved	\N	\N
465	2	1	54	2013	2013-04-12	2013-04-12	Going Home	approved	\N	\N
464	8	1	54	2013	2013-04-11	2013-04-11	Going Home	approved	\N	\N
480	5	1	105	2013	2013-04-10	2013-04-10	Going for function.	cancelled	\N	\N
476	1	1	30	2013	2013-04-09	2013-04-09	I had cold and headache, so i enable to come.	approved	\N	\N
475	8	1	34	2013	2013-04-15	2013-04-15	personal	approved	\N	\N
478	2	3	60	2013	2013-04-03	2013-04-05	due to personal problem i took leave	approved	\N	\N
449	2	1	28	2013	2013-04-08	2013-04-08	Personal	approved	\N	\N
471	1	0.5	87	2013	2013-04-09	2013-04-09	Not Feeling Well.	approved	\N	\N
482	8	1	52	2013	2013-04-11	2013-04-11	Ugadi	approved	\N	\N
441	8	1	82	2013	2013-04-15	2013-04-15	As Availed Optional Leave.	approved	\N	\N
443	8	1	56	2013	2013-04-15	2013-04-15	Going to native.	approved	\N	\N
442	2	1	82	2013	2013-04-16	2013-04-16	Personal.	approved	\N	\N
444	2	1	56	2013	2013-04-16	2013-04-16	Going to native.	approved	\N	\N
2145	5	1	188	2014	2014-09-09	2014-09-09	passport 	approved	\N	\N
2156	3	1	101	2014	2014-09-11	2014-09-11	Family Relative Death	approved	\N	\N
2134	2	13	140	2014	2014-08-01	2014-08-20	Went for motherhood	cancelled	\N	\N
2152	5	0.5	117	2014	2014-09-12	2014-09-12	Out of station - Will not be there in second half	approved	\N	\N
2138	2	1	77	2014	2014-09-08	2014-09-08	going for native	approved	\N	\N
2166	1	1	77	2014	2014-09-15	2014-09-15	Due to illness\t	approved	\N	\N
2178	2	1	60	2014	2014-09-12	2014-09-12	fever	approved	\N	\N
2191	2	4	64	2014	2014-09-23	2014-09-26	Family Emergency	approved	\N	\N
2136	2	2	185	2014	2014-09-18	2014-09-19	Family function.	approved	\N	\N
2140	2	1	127	2014	2014-09-12	2014-09-12	Personal work.	approved	\N	\N
2197	2	7	131	2014	2014-09-08	2014-09-16	Father's treatment	cancelled	\N	\N
2196	2	5	131	2014	2014-09-01	2014-09-05	Father's medical treatment	cancelled	\N	\N
2153	2	2	142	2014	2014-09-17	2014-09-18	Personal Work	approved	\N	\N
2167	5	0.5	139	2014	2014-09-16	2014-09-16	Out of station	approved	\N	\N
2150	5	0.5	139	2014	2014-09-09	2014-09-09	Medical checkup	approved	\N	\N
2133	6	59	140	2014	2014-04-22	2014-07-14	Went for motherhood	approved	\N	\N
2161	2	1	94	2014	2014-10-03	2014-10-03	going to hometown	approved	\N	\N
2173	2	9	95	2014	2014-10-22	2014-11-03	Going home for diwali.	approved	\N	\N
2687	2	2	30	2014	2014-12-25	2014-12-26	Going to Home	approved	\N	\N
2671	1	1	171	2014	2014-12-22	2014-12-22	Fever	approved	\N	\N
2794	5	1	194	2015	2015-01-02	2015-01-02	Went to native	approved	2015-01-05 05:03:43.12324	2015-01-05 09:06:07.035176
2793	8	1	194	2015	2015-01-01	2015-01-01	Went to native	approved	2015-01-05 05:03:19.262247	2015-01-05 09:06:38.99799
2805	1	1	209	2014	2014-12-31	2014-12-31	I was not feeling well.	approved	2015-01-05 08:49:40.32858	2015-01-05 09:07:33.466744
2796	2	2	212	2015	2015-01-12	2015-01-13	Going To Hometown	cancelled	2015-01-05 06:51:43.741135	2015-01-27 10:37:19.306398
2940	2	1	60	2015	2015-01-29	2015-01-29	Friend marriage	approved	2015-01-28 14:05:49.202076	2015-01-29 03:47:59.28227
2939	1	1	151	2015	2015-01-22	2015-01-22	I was not feeling well	approved	2015-01-28 08:22:05.118403	2015-01-30 12:31:09.620955
2945	2	1	44	2015	2015-02-02	2015-02-02	going to native	approved	2015-01-29 08:43:13.130297	2015-02-06 05:35:41.345592
3625	1	1	212	2015	2015-07-14	2015-07-14	Not feeling Well	approved	2015-07-27 09:34:04.153405	2015-08-20 07:30:22.598371
3715	1	1	98	2015	2015-08-14	2015-08-14	not feeling well	approved	2015-08-17 05:40:17.451054	2015-08-21 06:15:18.449646
3620	5	5	45	2015	2015-07-02	2015-07-08	Sick	cancelled	2015-07-27 06:24:42.494964	2015-07-27 09:59:02.858746
3622	1	2	45	2015	2015-07-16	2015-07-17	Sick	cancelled	2015-07-27 07:01:08.141515	2015-07-27 09:59:09.006493
3630	5	1	45	2015	2015-07-10	2015-07-10	Sick	approved	2015-07-27 10:23:53.592295	2015-07-27 12:10:11.356402
3631	2	2	45	2015	2015-07-17	2015-07-20	Sick	approved	2015-07-27 10:24:47.918423	2015-07-27 12:10:14.213888
3635	2	2	63	2015	2015-07-20	2015-07-21	Personal Govt work	Pending	2015-07-27 12:26:33.606975	2015-07-27 12:26:33.606975
3654	2	1	177	2015	2015-08-03	2015-08-03	Going to chennai	cancelled	2015-07-31 12:42:54.95369	2015-07-31 12:44:44.898546
3664	5	0.5	144	2015	2015-08-04	2015-08-04	I have personal work.	approved	2015-08-04 07:47:50.851992	2015-08-04 13:47:15.088462
3684	1	1	151	2015	2015-08-07	2015-08-07	Was not feeling well	approved	2015-08-11 10:42:13.400134	2015-08-12 06:05:25.07939
3697	5	0.5	144	2015	2015-08-12	2015-08-12	I have personal work.	approved	2015-08-12 05:38:26.493097	2015-08-12 08:57:44.363793
3679	1	1	159	2015	2015-08-11	2015-08-11	fever	approved	2015-08-11 05:34:24.740876	2015-08-17 13:04:11.052128
3618	2	1	159	2015	2015-07-31	2015-07-31	festival in my home town	approved	2015-07-27 04:47:36.237131	2015-08-17 13:04:17.299622
3671	2	4	54	2015	2015-08-07	2015-08-12	Going Home For My Brother Marriage	approved	2015-08-06 04:59:05.434	2015-08-19 06:23:55.704927
3656	2	1	133	2015	2015-08-03	2015-08-03	I am going to native	approved	2015-07-31 13:40:36.315234	2015-08-19 06:24:15.032135
3716	9	1	102	2015	2015-08-19	2015-08-19	Going to home town	approved	2015-08-17 09:19:04.266107	2015-08-19 06:56:39.169724
3663	1	1	220	2015	2015-08-03	2015-08-03	struggling with a sore back	approved	2015-08-04 07:06:11.539744	2015-08-24 04:16:50.892484
3632	1	1	91	2015	2015-07-02	2015-07-02	Not feeling well	approved	2015-07-27 10:37:21.181821	2015-08-24 09:56:05.751453
3657	1	2	91	2015	2015-07-28	2015-07-29	Not feeling well	approved	2015-08-03 06:25:10.204522	2015-08-24 09:56:10.09061
3637	1	1	52	2015	2015-07-24	2015-07-24	I was unwell.	approved	2015-07-27 13:29:15.530643	2015-08-24 10:54:20.427071
3640	5	0.5	80	2015	2015-07-28	2015-07-28	Personal work.	approved	2015-07-28 06:40:01.344208	2015-08-24 10:55:01.522733
3686	2	2	63	2015	2015-08-03	2015-08-04	Not feeling well. Admitted to hospital.	approved	2015-08-11 12:29:48.816481	2015-08-25 05:31:25.460674
3665	2	2	165	2015	2015-08-27	2015-08-29	Going out of station.	approved	2015-08-04 13:19:38.44954	2015-09-28 07:34:38.343653
485	5	1	105	2013	2013-04-12	2013-04-12	Going out of station.\r\n	cancelled	\N	\N
484	2	2	59	2013	2013-04-04	2013-04-05	I went to native as my grand father met an accident.	approved	\N	\N
2135	5	0.5	52	2014	2014-09-02	2014-09-02	I had some personal work.	approved	\N	\N
2149	5	0.5	109	2014	2014-09-12	2014-09-12	Out of station	approved	\N	\N
2176	2	2	60	2014	2014-09-08	2014-09-09	Fever	approved	\N	\N
2154	2	1	55	2014	2014-09-12	2014-09-12	Going to Native	approved	\N	\N
2147	5	0.5	127	2014	2014-09-09	2014-09-09	Personal work.	approved	\N	\N
2187	5	0.5	128	2014	2014-09-10	2014-09-10	Going to Home Town	approved	\N	\N
2172	5	0.5	95	2014	2014-09-17	2014-09-17	personal.	approved	\N	\N
2137	1	1	143	2014	2014-09-02	2014-09-02	I was not well.	approved	\N	\N
2184	2	1	144	2014	2014-09-22	2014-09-22	I have personal work 	approved	\N	\N
2676	5	0.5	151	2014	2014-12-23	2014-12-23	Personal Work	approved	\N	\N
2190	2	2	94	2014	2014-09-23	2014-09-24	going to hometown 	approved	\N	\N
2182	2	1	68	2014	2014-09-22	2014-09-22	Personal Work	approved	\N	\N
2163	1	1	192	2014	2014-09-15	2014-09-15	sinus problem 	cancelled	\N	\N
2175	8	1	102	2014	2014-10-03	2014-10-03	Festival	approved	\N	\N
2180	5	0.25	154	2014	2014-09-18	2014-09-18	Personal work	cancelled	\N	\N
2679	5	1	29	2014	2014-12-24	2014-12-24	Going to native	approved	\N	\N
2678	1	1	63	2014	2014-12-19	2014-12-19	Not Feeling Well. Severe backache	approved	\N	\N
2685	9	1	95	2014	2014-12-02	2014-12-02	sick	approved	\N	\N
2680	8	1	117	2014	2014-12-25	2014-12-25	Christmas	approved	\N	\N
2688	8	1	179	2014	2014-12-25	2014-12-25	Christmas Optional Holiday	approved	\N	\N
2673	8	1	165	2014	2014-12-25	2014-12-25	Christmas optional Leave	approved	\N	\N
2795	1	1	52	2015	2015-01-02	2015-01-02	I had fever.	approved	2015-01-05 05:50:41.820577	2015-01-05 09:06:10.54084
2804	1	1	140	2015	2015-01-02	2015-01-02	 \tNot feeling well	approved	2015-01-05 07:59:05.195347	2015-01-05 09:06:16.576804
2806	2	5	54	2015	2015-01-05	2015-01-09	Going to native	approved	2015-01-05 09:10:08.579755	2015-01-05 09:22:54.790435
2942	5	0.5	171	2015	2015-01-29	2015-01-29	personal work	approved	2015-01-29 05:25:39.548315	2015-01-29 08:48:26.33051
2941	2	1	209	2015	2015-01-28	2015-01-28	Emergency Situation I went for admitting my friend to hospital.	approved	2015-01-29 04:02:09.494646	2015-02-19 11:05:54.366124
3726	2	2	169	2015	2015-08-20	2015-08-21	Brother's Marriage	approved	2015-08-19 12:09:33.972507	2015-08-21 06:15:10.55155
3717	5	1	218	2015	2015-08-18	2015-08-18	Viral fever.	approved	2015-08-18 03:16:31.12027	2015-08-21 09:57:59.97146
3734	5	0.5	248	2015	2015-08-19	2015-08-19	Viral fever went to see doctor.	approved	2015-08-21 08:50:52.795493	2015-08-21 10:29:16.516043
3731	5	0.5	233	2015	2015-07-31	2015-07-31	Due to function at my school	approved	2015-08-20 08:59:36.554232	2015-08-25 09:34:20.921873
481	1	1	105	2013	2013-04-05	2013-04-05	Went for Medical check up.	approved	\N	\N
488	5	0.5	105	2013	2013-04-12	2013-04-12	Going out of station.	approved	\N	\N
486	8	1	91	2013	2013-04-11	2013-04-11	not feeling well	approved	\N	\N
489	5	3	65	2013	2013-04-08	2013-04-10	Due to Last minute unavoidable reason and Train Accident.	approved	\N	\N
490	1	0.5	105	2013	2013-04-15	2013-04-15	Went for check up.	approved	\N	\N
487	8	1	74	2013	2013-04-15	2013-04-15	Optional leave	approved	\N	\N
494	1	2	46	2013	2013-04-01	2013-04-02	Allergic conjunctivitis	approved	\N	\N
496	1	2	46	2013	2013-04-11	2013-04-12	Allergic conjunctivitis	approved	\N	\N
495	5	1	46	2013	2013-04-10	2013-04-10	Allergic conjunctivitis	approved	\N	\N
491	5	0.5	67	2013	2013-04-16	2013-04-16	Not feeling will	approved	\N	\N
493	1	0.5	37	2013	2013-04-16	2013-04-16	I will going to hospital, due to abdominal pain	approved	\N	\N
497	2	2	107	2013	2013-03-21	2013-03-22	went to native	approved	\N	\N
492	5	0.5	94	2013	2013-04-16	2013-04-16	Bday	approved	\N	\N
498	8	1	77	2013	2013-04-15	2013-04-15	To went for eye check up.	approved	\N	\N
499	1	1	87	2013	2013-04-18	2013-04-18	Fever	approved	\N	\N
504	2	14	64	2013	2013-05-06	2013-05-23	My Sister Marriage 	approved	\N	\N
500	8	0.5	85	2013	2013-04-19	2013-04-19	Due to pooja got late.	approved	\N	\N
502	2	1	101	2013	2013-04-22	2013-04-22	Going To Native	approved	\N	\N
501	5	0.5	71	2013	2013-04-19	2013-04-19	Out of station	approved	\N	\N
506	1	1	78	2013	2013-04-22	2013-04-22	Was not feeling well.	approved	\N	\N
507	5	1	77	2013	2013-04-22	2013-04-22	for personal work. 	approved	\N	\N
510	1	1	94	2013	2013-04-22	2013-04-22	Not well	approved	\N	\N
508	1	1	34	2013	2013-04-22	2013-04-22	not feeling well	approved	\N	\N
512	2	0.5	51	2013	2013-04-23	2013-04-23	For some urgent work	approved	\N	\N
523	1	0.5	36	2013	2013-04-30	2013-04-30	stomach pain	approved	\N	\N
520	2	1	94	2013	2013-04-30	2013-04-30	Going to Shree Kshetra Dharmasthala	approved	\N	\N
503	2	2	103	2013	2013-04-25	2013-04-26	Sister Marriage.	approved	\N	\N
513	2	1	77	2013	2013-04-29	2013-04-29	For personal work.	approved	\N	\N
515	2	2	31	2013	2013-04-29	2013-04-30	Going to native	approved	\N	\N
516	9	2	57	2013	2013-04-29	2013-04-30	Going to native.	approved	\N	\N
519	2	1	85	2013	2013-04-22	2013-04-22	personal work	approved	\N	\N
521	2	0.5	37	2013	2013-04-30	2013-04-30	Will go to Native place	approved	\N	\N
522	5	0.5	74	2013	2013-04-30	2013-04-30	Personal reason	approved	\N	\N
525	1	1	34	2013	2013-04-01	2013-04-01	not feeling well	approved	\N	\N
524	5	0.5	78	2013	2013-04-30	2013-04-30	Personal work.	approved	\N	\N
526	5	1	34	2013	2013-04-02	2013-04-02	not feeling well	approved	\N	\N
505	9	2	80	2013	2013-05-02	2013-05-03	As I am going to My Native	approved	\N	\N
511	2	1	113	2013	2013-05-02	2013-05-02	I am going to home town,	approved	\N	\N
517	2	2	109	2013	2013-05-02	2013-05-03	I have to go to my native place for some personal work.	approved	\N	\N
518	2	2	70	2013	2013-05-02	2013-05-03	For My Marriage Works.	approved	\N	\N
528	7	5	56	2013	2013-04-01	2013-04-05	As my wife admitted in hospital.	approved	\N	\N
514	2	1	30	2013	2013-05-03	2013-05-03	Personal	approved	\N	\N
529	2	1	67	2013	2013-05-03	2013-05-03	personal problem \r\n	approved	\N	\N
530	2	4	67	2013	2013-04-22	2013-04-25	personal problem 	approved	\N	\N
531	5	0.5	44	2013	2013-05-06	2013-05-06	consulting doctor on the injured shoulder	approved	\N	\N
535	1	3	99	2013	2013-05-15	2013-05-17	Personal	cancelled	\N	\N
534	2	2	79	2013	2013-05-13	2013-05-14	Family re-union	cancelled	\N	\N
537	1	1	102	2013	2013-04-29	2013-04-29	Suffering from fever.	approved	\N	\N
538	5	0.5	117	2013	2013-05-08	2013-05-08	Not keeping well fever	approved	\N	\N
541	1	0.5	101	2013	2013-05-09	2013-05-09	Sick	approved	\N	\N
540	2	2	33	2013	2013-05-13	2013-05-14	going native	cancelled	\N	\N
550	5	0.5	44	2013	2013-05-14	2013-05-14	Pain on injured shoulder	approved	\N	\N
551	2	1.5	105	2013	2013-05-14	2013-05-15	Went to hospital as grandmother is been admitted.	approved	\N	\N
527	2	2	85	2013	2013-05-16	2013-05-17	Family Function	approved	\N	\N
509	2	1	100	2013	2013-05-10	2013-05-10	Going to Tirumala Tirupathi temple	approved	\N	\N
548	2	1	87	2013	2013-05-13	2013-05-13	Went for some general checkup for my parents. 	approved	\N	\N
547	5	0.5	70	2013	2013-05-13	2013-05-13	Due to some Urgent Personal Work..	approved	\N	\N
539	2	1	79	2013	2013-05-13	2013-05-13	Family visit	approved	\N	\N
536	2	3	99	2013	2013-05-15	2013-05-17	Personal	approved	\N	\N
542	1	1	72	2013	2013-05-08	2013-05-08	Not feeling well	approved	\N	\N
549	5	0.5	47	2013	2013-05-07	2013-05-07	Not feeling well	approved	\N	\N
560	4	7	63	2013	2013-05-19	2013-05-28	MBA I Year Exams.	cancelled	\N	\N
563	2	3	33	2013	2013-05-27	2013-05-29	Going native	cancelled	\N	\N
554	5	0.5	70	2013	2013-05-17	2013-05-17	For My Marriage.	approved	\N	\N
533	5	0.5	70	2013	2013-05-17	2013-05-17	For My Marriage.	approved	\N	\N
532	2	10	70	2013	2013-05-20	2013-05-31	For My Marriage.	approved	\N	\N
552	2	2	79	2013	2013-05-16	2013-05-17	Traveling out of station	approved	\N	\N
555	2	1	29	2013	2013-05-17	2013-05-17	Go to native	approved	\N	\N
556	2	2	29	2013	2013-05-20	2013-05-21	Go to native	approved	\N	\N
558	5	1	31	2013	2013-05-16	2013-05-16	Some work in bank.	approved	\N	\N
559	2	0.5	37	2013	2013-05-17	2013-05-17	I will Go to My Native place	approved	\N	\N
561	4	7	63	2013	2013-05-19	2013-05-28	MBA I Year Exams	approved	\N	\N
565	2	1	33	2013	2013-05-20	2013-05-20	Fever	approved	\N	\N
566	1	1	116	2013	2013-05-16	2013-05-16	Sick	approved	\N	\N
562	2	1	113	2013	2013-05-22	2013-05-22	i am going to hospital, 22nd may i took appointment with docter	approved	\N	\N
564	5	1	110	2013	2013-05-29	2013-05-29	Marriage	approved	\N	\N
553	2	12	110	2013	2013-05-30	2013-06-14	Marriage	approved	\N	\N
543	4	2	87	2013	2013-06-20	2013-06-21	Going for my post graduate(M.tech) exams.	approved	\N	\N
544	4	1	87	2013	2013-06-26	2013-06-26	 Going for my post graduate(M.tech) exams.	approved	\N	\N
545	4	1	87	2013	2013-07-01	2013-07-01	 Going for my post graduate(M.tech) exams.	approved	\N	\N
546	4	2	87	2013	2013-07-08	2013-07-09	 Going for my post graduate(M.tech) exams.	approved	\N	\N
557	1	1	113	2013	2013-05-16	2013-05-16	I'm not feeling well.	approved	\N	\N
568	1	1	78	2013	2013-05-20	2013-05-20	Was not feeling wel.	approved	\N	\N
573	5	0.5	85	2013	2013-05-22	2013-05-22	Morning I am having my baby school work 	approved	\N	\N
570	2	0.5	51	2013	2013-05-22	2013-05-22	First half i am having my daughter school work	approved	\N	\N
567	5	1	31	2013	2013-05-21	2013-05-21	Not feeling well	approved	\N	\N
575	5	1	108	2013	2013-05-17	2013-05-17	Room mate was not well and there was no one to take care of her	approved	\N	\N
574	5	0.5	85	2013	2013-05-22	2013-05-22	Morning i am having my baby school work	approved	\N	\N
577	1	1	31	2013	2013-05-22	2013-05-22	Fever	approved	\N	\N
569	2	3	102	2013	2013-05-27	2013-05-29	Brother Marriage	approved	\N	\N
571	2	0.5	51	2013	2013-05-23	2013-05-23	First half i am having my daughter school work	approved	\N	\N
579	5	0.5	109	2013	2013-05-27	2013-05-27	Request for permission to go home as i am not keeping well.	approved	\N	\N
576	2	1	71	2013	2013-05-23	2013-05-23	Cousin Marriage 	approved	\N	\N
578	1	1	116	2013	2013-05-22	2013-05-22	Sick	approved	\N	\N
580	4	5	82	2013	2013-05-20	2013-05-24	Went for writing M.Tech Exam.	approved	\N	\N
2946	5	0.5	60	2015	2015-01-23	2015-01-23	Personal Work	approved	2015-01-30 05:24:46.056101	2015-01-30 05:24:54.814295
585	2	3	91	2013	2013-05-22	2013-05-24	going to home	approved	\N	\N
583	2	1	78	2013	2013-06-07	2013-06-07	Going out of station.	approved	\N	\N
572	9	3	56	2013	2013-05-29	2013-05-31	As I am going to my native place for personal work.	approved	\N	\N
586	2	2	55	2013	2013-05-28	2013-05-29	Marriage function	approved	\N	\N
582	9	1	10	2013	2013-05-29	2013-05-29	Going to native place	approved	\N	\N
588	1	5	98	2013	2013-05-21	2013-05-27	suffering from fever	approved	\N	\N
589	2	1	67	2013	2013-05-27	2013-05-27	personal works	approved	\N	\N
590	5	1	98	2013	2013-05-20	2013-05-20	Suffering from fever	approved	\N	\N
591	2	1	105	2013	2013-05-27	2013-05-27	Not Feeling well.	approved	\N	\N
592	2	1	114	2013	2013-05-27	2013-05-27	I had to go my native.	approved	\N	\N
581	2	2	33	2013	2013-05-30	2013-05-31	going native	approved	\N	\N
593	5	1	52	2013	2013-05-31	2013-05-31	I have some personal work.	approved	\N	\N
594	2	0.5	107	2013	2013-05-31	2013-05-31	For personal work i want leave on second half	cancelled	\N	\N
597	1	5	64	2013	2013-06-03	2013-06-07	Family Emergency	cancelled	\N	\N
598	1	5	64	2013	2013-06-03	2013-06-07	Family Emergency	approved	\N	\N
2143	5	0.5	139	2014	2014-09-09	2014-09-09	Medical Checkup	approved	\N	\N
595	5	0.5	44	2013	2013-05-31	2013-05-31	Going to native.	approved	\N	\N
605	3	3	87	2013	2013-06-04	2013-06-06	Grand ma passed away.\r\nSo went to my home town for funeral.	approved	\N	\N
615	5	1	113	2013	2013-06-14	2013-06-14	Personal work	cancelled	\N	\N
596	2	11	90	2013	2013-06-03	2013-06-17	Going Delhi for medical treatment. 	approved	\N	\N
599	2	0.5	107	2013	2013-06-04	2013-06-04	For personal work.Can you give leave on second half.	approved	\N	\N
600	1	0.5	37	2013	2013-06-03	2013-06-03	Will Go to Hospital, due to not feeling well	approved	\N	\N
601	5	1	108	2013	2013-06-05	2013-06-05	Shifting	approved	\N	\N
602	2	1	67	2013	2013-06-05	2013-06-05	some personal work 	approved	\N	\N
603	1	1	79	2013	2013-05-29	2013-05-29	Down with diahhorea	approved	\N	\N
606	5	1	47	2013	2013-05-30	2013-05-30	Not Well	approved	\N	\N
607	2	1	114	2013	2013-06-13	2013-06-13	To attend my close friend's marriage.	approved	\N	\N
608	2	1	67	2013	2013-06-12	2013-06-12	Some Personal Work	approved	\N	\N
611	2	1	31	2013	2013-06-14	2013-06-14	Going to native	approved	\N	\N
612	5	0.5	117	2013	2013-06-13	2013-06-13	Have to go to my college to collect my convocation certifcate	approved	\N	\N
613	1	1	107	2013	2013-06-12	2013-06-12	not feeling well	approved	\N	\N
614	2	4	105	2013	2013-06-04	2013-06-07	As my father got fire accident,so i was looking after him.	approved	\N	\N
616	1	1	104	2013	2013-06-14	2013-06-14	Not feeling well.	approved	\N	\N
618	2	1	78	2013	2013-06-14	2013-06-14	Personal work.	approved	\N	\N
623	2	4	54	2013	2013-06-20	2013-06-25	going to Native	cancelled	\N	\N
624	2	4	54	2013	2013-06-20	2013-06-25	Going to Native	cancelled	\N	\N
625	2	4	54	2013	2013-06-24	2013-06-27	Going to Native	approved	\N	\N
617	2	2	104	2013	2013-07-04	2013-07-05	For my Daughter naming ceremony.	cancelled	\N	\N
629	1	1	77	2013	2013-06-17	2013-06-17	Due to personal illness.	approved	\N	\N
621	2	1	102	2013	2013-06-19	2013-06-19	Marriage	approved	\N	\N
637	2	1	87	2013	2013-06-19	2013-06-19	Went to college for some work..	approved	\N	\N
634	1	1	40	2013	2013-06-19	2013-06-19	Was Sick	approved	\N	\N
635	5	0.5	40	2013	2013-06-21	2013-06-21	Personal Work	approved	\N	\N
636	2	2	107	2013	2013-06-25	2013-06-26	going to native	approved	\N	\N
628	2	1	60	2013	2013-06-17	2013-06-17	Due to funeral of my relative	approved	\N	\N
609	2	3	42	2013	2013-06-19	2013-06-21	I am going to my native.	approved	\N	\N
610	9	2	47	2013	2013-07-15	2013-07-16	Sister's Marriage	approved	\N	\N
619	1	1	113	2013	2013-06-17	2013-06-17	Feeling not well	approved	\N	\N
620	2	1	67	2013	2013-06-17	2013-06-17	Some Personal Work	approved	\N	\N
626	2	2	104	2013	2013-07-04	2013-07-05	For my Daughter Naming Ceremony.	approved	\N	\N
627	5	0.5	109	2013	2013-06-20	2013-06-20	As i have to attend exam in the afternoon.	approved	\N	\N
632	2	0.5	37	2013	2013-06-21	2013-06-21	To get pan card	approved	\N	\N
638	5	0.5	67	2013	2013-06-24	2013-06-24	going to hospital 	approved	\N	\N
639	1	1	114	2013	2013-06-25	2013-06-25	I have fever and head ache. 	approved	\N	\N
640	2	1	94	2013	2013-06-26	2013-06-26	going to hometown	approved	\N	\N
641	2	1	82	2013	2013-06-28	2013-06-28	Personal.	approved	\N	\N
642	2	2	36	2013	2013-06-27	2013-06-28	Out of station for personal work	approved	\N	\N
633	5	0.5	94	2013	2013-06-21	2013-06-21	personal work	approved	\N	\N
622	2	2	55	2013	2013-06-20	2013-06-21	personal	approved	\N	\N
643	1	1	80	2013	2013-06-26	2013-06-26	As i am not feeling well.	approved	\N	\N
647	1	1	114	2013	2013-06-26	2013-06-26	High Fever and Head ache.	approved	\N	\N
646	2	1	68	2013	2013-07-01	2013-07-01	Need to go for personal work	approved	\N	\N
644	2	2	29	2013	2013-08-01	2013-08-02	Going to native place	approved	\N	\N
645	2	3	29	2013	2013-08-05	2013-08-07	Going to native place	approved	\N	\N
584	2	3	91	2013	2013-05-22	2013-05-24	going to home	cancelled	\N	\N
653	5	0.5	52	2013	2013-06-04	2013-06-04	I had some work.	approved	\N	\N
655	2	11	101	2013	2013-06-05	2013-06-19	Chicken pox	approved	\N	\N
667	2	1	111	2013	2013-07-05	2013-07-05	Going to Native.	approved	\N	\N
682	2	1	79	2013	2013-07-14	2013-07-14	Going out of station	cancelled	\N	\N
648	1	1	95	2013	2013-06-25	2013-06-25	went to hospital.	approved	\N	\N
681	2	1	79	2013	2013-07-12	2013-07-12	Going out of station	approved	\N	\N
676	2	5	120	2013	2013-07-08	2013-07-12	Going to Native	approved	\N	\N
672	2	1	67	2013	2013-07-03	2013-07-03	I went to hospital	approved	\N	\N
662	2	1	103	2013	2013-07-01	2013-07-01	Personal Issuse.	approved	\N	\N
678	2	1	54	2013	2013-06-28	2013-06-28	Went to Native 	approved	\N	\N
693	2	3	98	2013	2013-08-12	2013-08-14	Going Native 	approved	\N	\N
694	2	1	98	2013	2013-08-16	2013-08-16	Going native	approved	\N	\N
664	9	1	10	2013	2013-08-16	2013-08-16	Festival in Native	approved	\N	\N
2142	2	1	139	2014	2014-09-09	2014-09-09	Medical Checkup	cancelled	\N	\N
2155	1	1	168	2014	2014-09-11	2014-09-11	sick	approved	\N	\N
2148	1	1	185	2014	2014-09-08	2014-09-08	I was suffering from fever .	approved	\N	\N
2170	1	1	168	2014	2014-09-16	2014-09-16	sick	approved	\N	\N
2141	5	0.5	99	2014	2014-09-09	2014-09-09	Personal work	approved	\N	\N
2146	1	1	108	2014	2014-09-08	2014-09-08	Not Well	approved	\N	\N
2195	1	0.5	87	2014	2014-09-22	2014-09-22	Due to sickness...	approved	\N	\N
2188	2	1	70	2014	2014-09-26	2014-09-26	Due to some unavoidable personal works.	approved	\N	\N
2168	2	1	111	2014	2014-10-03	2014-10-03	Going to Native on behalf Navami.	approved	\N	\N
2682	8	2	144	2014	2014-12-25	2014-12-26	I am going to home town.	approved	\N	\N
2683	2	1	144	2014	2014-12-29	2014-12-29	I am going to home town.	approved	\N	\N
2684	5	0.5	31	2014	2014-12-23	2014-12-23	I am not feeling well.	approved	\N	\N
2802	8	1	41	2015	2015-01-01	2015-01-01	Optional Leave 	approved	2015-01-05 07:56:04.965571	2015-01-05 09:08:32.954709
2803	8	1	140	2015	2015-01-01	2015-01-01	New Year Celebration	approved	2015-01-05 07:57:47.114417	2015-01-05 09:37:43.270726
2797	8	1	212	2015	2015-01-15	2015-01-15	going to hometown	approved	2015-01-05 06:54:15.344732	2015-01-21 05:56:05.350081
2675	2	1	71	2014	2014-12-31	2014-12-31	Out of station	approved	\N	2015-01-21 09:14:33.506939
2948	1	1	169	2015	2015-01-29	2015-01-29	Fever	approved	2015-01-30 09:05:09.814344	2015-01-30 12:31:11.162973
2949	5	0.5	128	2015	2015-01-30	2015-01-30	Not feeling Well 	approved	2015-01-30 09:37:02.48773	2015-02-03 04:14:40.151715
2947	5	0.5	140	2015	2015-01-30	2015-01-30	Personal Work	approved	2015-01-30 07:34:35.192536	2015-02-06 05:35:58.839593
3720	5	0.5	142	2015	2015-08-19	2015-08-19	personal work	approved	2015-08-18 11:46:11.400416	2015-08-19 06:56:43.290404
3733	5	0.5	94	2015	2015-08-21	2015-08-21	personal work	approved	2015-08-21 08:47:05.398228	2015-08-25 05:35:07.21107
3730	2	1	233	2015	2015-08-19	2015-08-19	Important family work 	approved	2015-08-20 08:57:59.906656	2015-08-25 09:32:07.365806
3718	8	1	117	2015	2015-08-28	2015-08-28	Festival	approved	2015-08-18 05:47:46.121355	2015-09-15 10:00:29.084017
651	2	0.5	51	2013	2013-06-28	2013-06-28	Having some work	approved	\N	\N
654	1	2	101	2013	2013-06-03	2013-06-04	Chicken Pox	approved	\N	\N
656	2	1	101	2013	2013-06-14	2013-06-14	Chicken pox	approved	\N	\N
666	2	1	111	2013	2013-07-06	2013-07-06	Going to Native.	cancelled	\N	\N
675	5	0.5	85	2013	2013-07-05	2013-07-05	personal work	cancelled	\N	\N
660	1	1	30	2013	2013-07-01	2013-07-01	head ache.	approved	\N	\N
679	5	0.5	85	2013	2013-07-09	2013-07-09	To pick up my baby from school	approved	\N	\N
674	2	2	72	2013	2013-07-11	2013-07-12	Going to native	approved	\N	\N
665	1	1	95	2013	2013-07-02	2013-07-02	was not feeling well.	approved	\N	\N
661	1	1	72	2013	2013-07-01	2013-07-01	fever	approved	\N	\N
649	2	1	99	2013	2013-06-25	2013-06-25	Personal	approved	\N	\N
650	1	1	99	2013	2013-06-11	2013-06-11	sick	approved	\N	\N
670	1	2	67	2013	2013-07-01	2013-07-02	Not feeling well 	approved	\N	\N
677	2	2	113	2013	2013-07-08	2013-07-09	I am going to home town.	approved	\N	\N
686	2	2	29	2013	2013-07-09	2013-07-10	Going to native	approved	\N	\N
687	5	0.5	71	2013	2013-07-12	2013-07-12	Ears Popping	approved	\N	\N
690	2	1	87	2013	2013-07-12	2013-07-12	Went to home town for some personal reason.	approved	\N	\N
688	2	3	52	2013	2013-07-29	2013-07-31	I will be out of station.	approved	\N	\N
692	2	1	98	2013	2013-08-08	2013-08-08	Going native for celebrating festival	approved	\N	\N
2144	1	1	159	2014	2014-09-08	2014-09-08	fever	approved	\N	\N
2177	5	0.5	60	2014	2014-09-11	2014-09-11	fever	approved	\N	\N
2164	2	12	140	2014	2014-07-15	2014-07-30	Went for motherhood	approved	\N	\N
2193	8	1	128	2014	2014-10-03	2014-10-03	Navami\r\n	approved	\N	\N
2169	5	0.5	72	2014	2014-09-17	2014-09-17	Have work at RPO	approved	\N	\N
2159	5	1	72	2014	2014-09-15	2014-09-15	Have an appointment at PSK.	approved	\N	\N
2192	5	0.5	139	2014	2014-09-24	2014-09-24	Out of city	approved	\N	\N
2157	2	7	187	2014	2014-10-20	2014-10-28	Function.	cancelled	\N	\N
2183	8	1	154	2014	2014-10-03	2014-10-03	Navami	approved	\N	\N
2174	2	1	102	2014	2014-10-01	2014-10-01	Personal Work	approved	\N	\N
2151	2	13	162	2014	2014-10-27	2014-11-12	Going home	approved	\N	\N
2686	5	0.5	176	2014	2014-12-11	2014-12-11	had some work 	approved	\N	\N
2677	2	3	63	2014	2014-11-26	2014-11-29	Visit to Sabari male temple	approved	\N	\N
2785	8	1	147	2015	2015-01-15	2015-01-15	festival	cancelled	\N	2015-01-05 09:05:36.859613
2801	1	1	41	2015	2015-01-02	2015-01-02	Due to Fever.	approved	2015-01-05 07:55:36.591839	2015-01-05 09:06:07.998657
2800	8	1	52	2015	2015-01-01	2015-01-01	New Year	approved	2015-01-05 07:30:02.591375	2015-01-05 09:06:49.269706
2798	2	1	212	2015	2015-01-14	2015-01-14	going to hometown	cancelled	2015-01-05 06:55:03.838004	2015-01-27 10:37:05.1281
2951	5	0.5	70	2015	2015-01-29	2015-01-29	Was not feeling well.	approved	2015-01-30 12:30:59.490439	2015-02-03 04:14:52.732052
3719	2	2	77	2015	2015-08-14	2015-08-17	 went to home town	approved	2015-08-18 09:21:03.624737	2015-08-20 07:24:24.996197
3724	2	2	227	2015	2015-08-20	2015-08-21	Brothers marriage	approved	2015-08-19 10:32:42.365742	2015-08-21 06:15:07.67553
3723	5	0.5	51	2015	2015-08-20	2015-08-20	Need to take care of my daughter	approved	2015-08-18 13:08:44.207946	2015-08-21 09:56:35.223303
3725	2	1	211	2015	2015-08-18	2015-08-18	due to Sickness.	approved	2015-08-19 10:45:04.213613	2015-08-21 09:58:08.887424
3735	1	1	217	2015	2015-08-20	2015-08-20	Not feeling well	approved	2015-08-21 09:54:04.50963	2015-08-25 09:33:44.225219
657	5	0.5	101	2013	2013-06-13	2013-06-13	Chicken pox	approved	\N	\N
663	1	0.5	29	2013	2013-07-02	2013-07-02	not feeling well	approved	\N	\N
658	1	0.5	29	2013	2013-06-26	2013-06-26	not feeling well	approved	\N	\N
659	2	3	113	2013	2013-07-05	2013-07-09	I am going to home town, 	cancelled	\N	\N
684	1	1	28	2013	2013-07-09	2013-07-09	Fever	approved	\N	\N
699	3	3	67	2013	2013-07-16	2013-07-18	My father passed away	approved	\N	\N
697	2	1	82	2013	2013-07-19	2013-07-19	Going Native	approved	\N	\N
668	5	0.5	10	2013	2013-07-03	2013-07-03	Fever	approved	\N	\N
652	1	1	55	2013	2013-06-24	2013-06-24	personal work	approved	\N	\N
671	2	1	67	2013	2013-06-28	2013-06-28	I went to hospital	approved	\N	\N
722	1	1	120	2013	2013-07-25	2013-07-25	Suffering from fever and throat infection	approved	\N	\N
680	1	1	78	2013	2013-07-08	2013-07-08	Was not feeling wel.	approved	\N	\N
673	1	0.5	91	2013	2013-07-04	2013-07-04	fever	approved	\N	\N
685	2	1	105	2013	2013-07-08	2013-07-08	Not Feeling Well 	approved	\N	\N
695	1	1	44	2013	2013-07-15	2013-07-15	went to hospital	approved	\N	\N
696	2	1	80	2013	2013-07-19	2013-07-19	As I have some personal work.	approved	\N	\N
698	5	0.5	94	2013	2013-07-18	2013-07-18	not well	approved	\N	\N
683	2	1	79	2013	2013-07-15	2013-07-15	Going out of station.	approved	\N	\N
705	1	1	97	2013	2013-07-03	2013-07-03	Due to ill health	approved	\N	\N
700	5	1	51	2013	2013-07-05	2013-07-05	My uncle expired	approved	\N	\N
702	1	1	56	2013	2013-07-08	2013-07-08	Not feeling well.	approved	\N	\N
701	1	1	37	2013	2013-07-18	2013-07-18	Went to Hospital due to leg painful well	approved	\N	\N
709	2	1	51	2013	2013-07-24	2013-07-24	Having some personal work.	approved	\N	\N
689	2	2	131	2013	2013-07-25	2013-07-26	Sister's Engagement	approved	\N	\N
712	5	1	99	2013	2013-07-19	2013-07-19	I had an appointment with doctor for dental care. 	approved	\N	\N
711	1	2	99	2013	2013-07-22	2013-07-23	Because of a small surgery(root canal) in teeth.	approved	\N	\N
757	8	1	45	2013	2013-09-16	2013-09-16	 optional holiday	approved	\N	\N
708	1	2	71	2013	2013-07-19	2013-07-22	Ear and Nasal Treatement	approved	\N	\N
704	5	1	95	2013	2013-07-22	2013-07-22	going hospital.	approved	\N	\N
713	5	1	95	2013	2013-07-24	2013-07-24	suffering from high fever.	approved	\N	\N
710	2	2	67	2013	2013-07-24	2013-07-25	Death ceremony(rituals) for 11th day	approved	\N	\N
703	2	1	119	2013	2013-07-23	2013-07-23	Personal	approved	\N	\N
718	2	1	94	2013	2013-07-25	2013-07-25	accompanying mother to hospital	approved	\N	\N
721	2	0.5	68	2013	2013-07-25	2013-07-25	Have some personal work	approved	\N	\N
724	1	1	95	2013	2013-07-25	2013-07-25	high fever..	approved	\N	\N
720	5	0.5	78	2013	2013-07-25	2013-07-25	Personal work.	approved	\N	\N
728	2	1	78	2013	2013-07-26	2013-07-26	Personal work.	approved	\N	\N
727	5	1	104	2013	2013-07-26	2013-07-26	Not keeping well	approved	\N	\N
729	1	1	108	2013	2013-07-15	2013-07-15	Not well	approved	\N	\N
716	2	1	129	2013	2013-08-08	2013-08-08	returning home for eid-ul-fitr.	cancelled	\N	\N
731	4	2	129	2013	2013-08-01	2013-08-02	convocation- issues regarding degree presentation.	cancelled	\N	\N
725	4	1	123	2013	2013-08-02	2013-08-02	convocation 	cancelled	\N	\N
735	4	1	130	2013	2013-08-02	2013-08-02	To attend convocation.	cancelled	\N	\N
746	1	1	30	2013	2013-08-05	2013-08-05	headache and little fever	approved	\N	\N
754	2	1	54	2013	2013-08-08	2013-08-08	Going home for Festival	approved	\N	\N
755	8	1	54	2013	2013-08-09	2013-08-09	Going Home for festival	approved	\N	\N
743	1	1	132	2013	2013-07-31	2013-07-31	Due to fever and cold.	approved	\N	\N
739	8	1	40	2013	2013-08-09	2013-08-09	Taking my optional leave!	cancelled	\N	\N
706	5	1	49	2013	2013-07-29	2013-07-29	To see off my parents	approved	\N	\N
717	8	1	129	2013	2013-08-09	2013-08-09	day of eid-ul-fitr	approved	\N	\N
714	2	1	60	2013	2013-08-09	2013-08-09	My cousin's marriage.	approved	\N	\N
726	8	1	63	2013	2013-07-30	2013-07-30	Personal reasons	approved	\N	\N
723	2	2	33	2013	2013-08-01	2013-08-02	going Home	approved	\N	\N
732	2	1	36	2013	2013-07-01	2013-07-01	Had some personal work	approved	\N	\N
734	2	2	102	2013	2013-08-08	2013-08-09	Personal Work	approved	\N	\N
733	5	1	31	2013	2013-07-29	2013-07-29	personal work	approved	\N	\N
736	2	2	129	2013	2013-08-01	2013-08-02	convocation issues	approved	\N	\N
737	2	1	123	2013	2013-08-02	2013-08-02	convocation	approved	\N	\N
738	2	1	130	2013	2013-08-02	2013-08-02	To attend convocation.	approved	\N	\N
740	2	1	79	2013	2013-08-01	2013-08-01	Dad's 75th B'day.	approved	\N	\N
744	1	1	55	2013	2013-08-01	2013-08-01	Not Feeling well	approved	\N	\N
745	2	1	107	2013	2013-08-12	2013-08-12	personal work	approved	\N	\N
747	8	1	130	2013	2013-08-09	2013-08-09	For Ramzan.	approved	\N	\N
748	8	1	46	2013	2013-08-09	2013-08-09	Festival Celebration. 	approved	\N	\N
749	5	0.5	60	2013	2013-08-06	2013-08-06	due to distributing wedding cards of my sisters marriage.	approved	\N	\N
750	8	1	99	2013	2013-08-09	2013-08-09	Ramzan	approved	\N	\N
752	2	3	94	2013	2013-08-02	2013-08-06	viral fever and cough	approved	\N	\N
751	8	1	56	2013	2013-08-09	2013-08-09	As i am going to my native place.	approved	\N	\N
756	8	1	45	2013	2013-08-09	2013-08-09	optional leave	approved	\N	\N
760	5	0.5	77	2013	2013-08-08	2013-08-08	Personal issue.	approved	\N	\N
761	1	3	119	2013	2013-08-05	2013-08-07	Not well.	approved	\N	\N
762	1	2	10	2013	2013-08-02	2013-08-05	Fever	approved	\N	\N
742	2	1	85	2013	2013-08-16	2013-08-16	Varalakshmi Pooja	approved	\N	\N
758	2	1	28	2013	2013-08-16	2013-08-16	Personal	approved	\N	\N
759	2	1	101	2013	2013-08-16	2013-08-16	Going to Native for banking process.	approved	\N	\N
715	2	1	60	2013	2013-08-19	2013-08-19	My sister's marriage.	approved	\N	\N
763	8	1	51	2013	2013-08-16	2013-08-16	For varamahalaxmi festival 	approved	\N	\N
753	2	1	78	2013	2013-08-16	2013-08-16	Festival	approved	\N	\N
2160	5	0.5	101	2014	2014-09-12	2014-09-12	Sick	approved	\N	\N
2162	5	0.5	168	2014	2014-09-15	2014-09-15	sick	approved	\N	\N
2171	2	0.5	51	2014	2014-09-17	2014-09-17	Having some personal work	approved	\N	\N
2165	1	1	98	2014	2014-09-15	2014-09-15	Not feeling well	approved	\N	\N
2158	2	1	68	2014	2014-09-15	2014-09-15	Personal Work	approved	\N	\N
769	2	1	36	2013	2013-08-19	2013-08-19	Going out of station	approved	\N	\N
764	2	0.5	45	2013	2013-08-12	2013-08-12	personal, leaving around 4PM	approved	\N	\N
788	2	1	120	2013	2013-08-16	2013-08-16	Personal	approved	\N	\N
784	5	1	108	2013	2013-08-16	2013-08-16	leave regarding outing	approved	\N	\N
787	5	0.5	94	2013	2013-08-16	2013-08-16	Going to hometown for festival celebration	approved	\N	\N
795	8	1	59	2013	2013-08-20	2013-08-20	As available optional leave.	approved	\N	\N
800	3	1	37	2013	2013-08-20	2013-08-20	My grandfather had been expired, so I went my native place	approved	\N	\N
804	1	1	70	2013	2013-08-21	2013-08-21	I was Sick.	approved	\N	\N
809	2	0.5	51	2013	2013-08-22	2013-08-22	First off i was on leave due to my daughter illness	approved	\N	\N
801	2	3	77	2013	2013-09-04	2013-09-06	for My wedding	approved	\N	\N
791	9	1	128	2013	2013-09-10	2013-09-10	Comp Off	approved	\N	\N
2179	5	0.5	30	2014	2014-09-11	2014-09-11	personal work.	approved	\N	\N
2185	1	1	48	2014	2014-09-10	2014-09-10	With reference to your mail marked reason -viral fever 	approved	\N	\N
2194	1	1	87	2014	2014-09-22	2014-09-22	0.5	Cancelled	\N	\N
2181	8	1	99	2014	2014-10-03	2014-10-03	personal work.	approved	\N	\N
2186	8	1	72	2014	2014-10-03	2014-10-03	Dussehra	approved	\N	\N
2189	8	1	70	2014	2014-10-03	2014-10-03	Travelling to my native for some function.	approved	\N	\N
2950	2	4	196	2015	2015-02-02	2015-02-05	going to my brother marriage	approved	2015-01-30 10:31:31.908787	2015-01-30 12:44:18.604929
2955	1	1	214	2015	2015-01-28	2015-01-28	Unwell	approved	2015-02-02 08:50:44.148443	2015-02-19 11:05:32.774475
2799	2	1	212	2015	2015-01-16	2015-01-16	going to hometown	approved	2015-01-05 06:56:12.320398	2015-02-19 11:06:02.779078
3722	5	0.5	51	2015	2015-08-19	2015-08-19	Need to take care of my daughter	approved	2015-08-18 13:08:20.008522	2015-08-21 09:56:49.234763
3732	5	0.5	159	2015	2015-08-20	2015-08-20	feeling sick	approved	2015-08-20 09:07:35.634831	2015-08-21 11:11:10.240822
3729	5	2	233	2015	2015-08-17	2015-08-18	Due to Emergency work at my native.	approved	2015-08-20 08:56:49.761874	2015-08-25 09:34:07.678135
3736	8	1	217	2015	2015-08-28	2015-08-28	Personal Reason	approved	2015-08-21 09:55:46.395297	2015-09-15 10:00:11.23099
770	8	1	36	2013	2013-08-20	2013-08-20	Raksha bandhan celebration	approved	\N	\N
767	5	0.5	85	2013	2013-08-14	2013-08-14	Pick up and drop my baby from school	approved	\N	\N
808	2	2	78	2013	2013-08-21	2013-08-22	Was not feeling wel.	approved	\N	\N
765	5	1	49	2013	2013-08-16	2013-08-16	Going out with family	approved	\N	\N
775	2	1	31	2013	2013-08-16	2013-08-16	for going to native	approved	\N	\N
777	2	1	87	2013	2013-08-16	2013-08-16	Going to my home town.	approved	\N	\N
782	2	1	80	2013	2013-08-16	2013-08-16	As I have some Personal work.	approved	\N	\N
785	5	0.5	71	2013	2013-08-16	2013-08-16	Out Of Station	approved	\N	\N
789	2	1	104	2013	2013-08-16	2013-08-16	For Festival	approved	\N	\N
792	8	1	46	2013	2013-08-20	2013-08-20	Raksha Bandhan Celebration.	approved	\N	\N
805	1	1	130	2013	2013-08-21	2013-08-21	due to headache and fever.	approved	\N	\N
794	2	2	91	2013	2013-08-26	2013-08-27	going to sister marriage 	approved	\N	\N
771	9	1	47	2013	2013-09-06	2013-09-06	Housewarming ceremony	approved	\N	\N
2198	1	1	48	2014	2014-09-11	2014-09-11	Not applied leave in EDMS, so we deducted a sick leave with reference to earlier  mail dated 10th Sept 2014. 	approved	\N	\N
2208	5	1	165	2014	2014-09-23	2014-09-23	Fever, Not feeling well.	approved	\N	\N
2210	8	1	140	2014	2014-08-29	2014-08-29	Ganesh Chaturthi - Optional Leave taken for festival	approved	\N	\N
2204	8	1	30	2014	2014-10-03	2014-10-03	Personal work.	approved	\N	\N
2807	2	2	109	2015	2015-01-01	2015-01-02	I Went for Brother marriage.	approved	2015-01-05 09:22:56.117042	2015-01-07 06:31:18.731354
2810	8	1	60	2015	2015-01-15	2015-01-15	Sankranthi	approved	2015-01-05 11:14:47.95491	2015-01-13 12:45:14.260004
2811	2	1	60	2015	2015-01-16	2015-01-16	Sankranthi	approved	2015-01-05 11:15:27.309434	2015-01-13 12:45:15.672179
2952	2	1	198	2015	2015-02-02	2015-02-02	my brother reception function	approved	2015-01-30 13:02:25.111371	2015-01-30 13:07:43.206315
2953	2	1	87	2015	2015-01-27	2015-01-27	Personal Work...	approved	2015-02-02 04:20:35.7487	2015-02-03 04:15:02.268637
3721	2	1	201	2015	2015-08-17	2015-08-17	I was unwell	approved	2015-08-18 12:38:35.273298	2015-08-20 07:21:11.6146
3727	2	2	196	2015	2015-08-20	2015-08-21	Going to my brother marriage	approved	2015-08-19 12:15:44.680473	2015-08-21 09:59:56.390416
3728	5	1	64	2015	2015-08-20	2015-08-20	Not feeling well	approved	2015-08-20 07:31:47.978871	2015-08-24 04:16:24.866823
778	2	1	132	2013	2013-08-16	2013-08-16	Cousin marriage.	cancelled	\N	\N
691	8	1	98	2013	2013-08-09	2013-08-09	Festival	approved	\N	\N
741	3	2	59	2013	2013-07-29	2013-07-30	my grand Father passed away.	approved	\N	\N
766	5	0.5	85	2013	2013-08-13	2013-08-13	Pick up and drop my baby from school	approved	\N	\N
781	2	1	42	2013	2013-08-05	2013-08-05	I went to my native place.	approved	\N	\N
780	2	1	111	2013	2013-08-16	2013-08-16	Going Out-of station.	approved	\N	\N
774	5	0.5	67	2013	2013-08-14	2013-08-14	Some personal work is there.	approved	\N	\N
786	5	0.5	67	2013	2013-08-16	2013-08-16	Going to native 	approved	\N	\N
799	8	1	90	2013	2013-08-21	2013-08-21	For Raksha Bandhan.	approved	\N	\N
806	1	1	67	2013	2013-08-20	2013-08-20	I am not feeling will.	approved	\N	\N
772	8	1	47	2013	2013-09-09	2013-09-09	Optional Holiday	approved	\N	\N
2078	2	2	128	2014	2014-09-11	2014-09-12	Going to Home Town	approved	\N	\N
2202	2	9	134	2014	2014-10-22	2014-11-03	Going home for Chhath puja.	approved	\N	\N
2808	5	1	211	2015	2015-01-01	2015-01-01	Urgent work.	approved	2015-01-05 09:51:04.452414	2015-01-20 13:36:21.530586
2954	5	0.5	203	2015	2015-02-02	2015-02-02	Headache & fatigue	approved	2015-02-02 07:57:52.515779	2015-02-16 14:19:57.017735
3747	8	1	242	2015	2015-08-28	2015-08-28	As I am going to my hometown for the festival, I request you to grant me leave on  August 28, 2015.	approved	2015-08-24 10:26:16.382539	2015-08-24 11:38:54.414138
3738	5	1	218	2015	2015-08-24	2015-08-24	Dengue.	approved	2015-08-23 17:15:22.191925	2015-08-25 05:35:35.72786
3740	1	2	29	2015	2015-08-20	2015-08-21	Not feeling well.	approved	2015-08-24 05:09:47.530422	2015-08-25 09:31:15.835939
3737	2	2	30	2015	2015-08-27	2015-08-28	Going to Chennai for friend's marriage.	cancelled	2015-08-23 13:53:51.351694	2015-08-25 14:07:12.57147
3759	2	2	99	2015	2015-08-27	2015-08-28	Urgent work -> going to native.	approved	2015-08-26 05:38:35.522696	2015-08-27 13:18:24.492386
3761	1	1	220	2015	2015-08-24	2015-08-24	Viral Fever	approved	2015-08-26 10:09:12.580439	2015-08-28 05:12:04.923426
3781	5	0.5	51	2015	2015-08-31	2015-08-31	Need to take care of my daughter	approved	2015-08-31 07:19:25.150639	2015-08-31 09:21:51.332945
3766	8	1	52	2015	2015-08-28	2015-08-28	Festival	approved	2015-08-27 09:15:37.880926	2015-08-31 09:21:56.57708
3775	9	1	142	2015	2015-09-01	2015-09-01	personal work	approved	2015-08-31 04:47:09.410017	2015-09-01 07:41:43.041404
3804	5	0.5	54	2015	2015-09-04	2015-09-04	Going to Bank	approved	2015-09-04 07:34:03.105447	2015-09-16 10:23:17.804445
3860	2	2	169	2015	2015-09-21	2015-09-22	Bank Work 	cancelled	2015-09-14 06:17:54.03529	2015-09-16 10:44:58.943466
3863	5	0.5	102	2015	2015-09-14	2015-09-14	Going to hospital	approved	2015-09-14 08:16:54.00071	2015-09-16 12:04:35.492116
3886	2	1	215	2015	2015-09-18	2015-09-18	Checkup	approved	2015-09-16 13:42:11.569792	2015-09-16 13:47:15.096815
3888	8	1	221	2015	2015-09-17	2015-09-17	Ganesh Chaturthi	Pending	2015-09-17 04:10:15.759062	2015-09-17 04:10:15.759062
3891	1	1	30	2015	2015-09-16	2015-09-16	Headache	approved	2015-09-17 05:40:27.471705	2015-09-19 07:36:13.958629
3851	8	1	155	2015	2015-09-17	2015-09-17	Ganesha Chathurthi	approved	2015-09-10 12:42:25.464169	2015-09-21 07:27:01.790509
3895	5	1	216	2015	2015-09-18	2015-09-18	not well.	approved	2015-09-18 09:11:40.596132	2015-09-24 05:11:20.55925
3838	5	0.5	71	2015	2015-09-10	2015-09-10	Second half due to personal work	approved	2015-09-10 04:55:22.497574	2015-09-25 10:53:49.838022
3910	8	1	176	2015	2015-09-17	2015-09-17	festival 	approved	2015-09-22 08:55:20.231414	2015-09-25 10:58:43.744587
3903	5	0.5	197	2015	2015-09-09	2015-09-09	Fever and headache	approved	2015-09-21 10:37:49.274465	2015-09-25 12:51:17.230168
3887	8	1	211	2015	2015-09-17	2015-09-17	festival	approved	2015-09-16 14:08:07.709232	2015-09-25 12:51:24.854386
3927	5	2	197	2015	2015-09-10	2015-09-11	Viral fever	approved	2015-09-24 05:52:55.814314	2015-09-25 12:51:31.330965
3933	1	1	253	2015	2015-09-25	2015-09-25	I was suffering from dizziness	approved	2015-09-28 03:45:42.988921	2015-09-28 05:18:20.965042
3796	9	1	80	2015	2015-09-04	2015-09-04	Personal work.	approved	2015-09-03 05:20:04.066003	2015-09-28 05:20:53.768473
3930	5	0.5	177	2015	2015-09-24	2015-09-24	fever	approved	2015-09-25 04:14:04.007191	2015-09-28 05:28:00.775259
3882	8	1	212	2015	2015-09-17	2015-09-17	Vinayagar chadurthi	approved	2015-09-16 12:09:16.182029	2015-09-28 07:27:32.498369
3908	2	1	33	2015	2015-09-25	2015-09-25	Back pain treatment	approved	2015-09-22 07:41:19.84198	2015-09-28 07:28:17.425354
3901	8	1	118	2015	2015-09-24	2015-09-24	Id-ul-Zoha	approved	2015-09-21 07:32:18.617229	2015-09-28 07:29:07.883389
3916	8	1	242	2015	2015-09-24	2015-09-24	I was going to my hometown.	approved	2015-09-22 13:24:19.325259	2015-09-28 07:30:04.2214
3935	5	1	260	2015	2015-09-25	2015-09-25	Bakrid Festival 	approved	2015-09-28 05:01:10.257995	2015-09-28 07:30:40.115582
3909	8	1	33	2015	2015-09-24	2015-09-24	Back pain treatment	approved	2015-09-22 07:41:36.564406	2015-09-28 07:33:08.305495
3861	5	0.5	217	2015	2015-09-16	2015-09-16	Personal	approved	2015-09-14 06:44:48.219165	2015-09-28 07:33:39.866547
3936	8	1	201	2015	2015-09-24	2015-09-24	Personal work	approved	2015-09-28 05:07:20.084765	2015-09-28 07:33:48.385152
3947	2	1	216	2015	2015-09-25	2015-09-25	Sick	approved	2015-09-28 09:08:13.368427	2015-09-28 13:08:37.642224
3963	1	4	155	2015	2015-09-21	2015-09-24	Not well	cancelled	2015-10-05 05:22:06.213778	2015-10-05 05:37:43.018549
3977	3	1	248	2015	2015-10-01	2015-10-01	Friend's dad passed away.	approved	2015-10-05 13:46:23.626702	2015-10-06 05:05:06.252378
3985	1	1	90	2015	2015-10-07	2015-10-07	Not feeling well.	Pending	2015-10-07 04:47:34.829144	2015-10-07 04:47:34.829144
3991	2	1	169	2015	2015-10-05	2015-10-05	Personal work	approved	2015-10-07 07:40:54.697474	2015-10-07 08:53:15.122033
3990	5	1	151	2015	2015-10-23	2015-10-23	For Festival	approved	2015-10-07 07:40:13.203529	2015-10-07 08:55:16.209709
3986	5	1	99	2015	2015-09-29	2015-09-29	Personal Issue.	approved	2015-10-07 05:48:34.201493	2015-10-09 05:07:15.62438
3980	5	0.5	143	2015	2015-10-06	2015-10-06	An urgent work back home.	approved	2015-10-06 07:18:49.114352	2015-10-09 05:07:21.295402
3956	5	0.5	201	2015	2015-09-30	2015-09-30	Personal work	approved	2015-09-30 12:52:12.14443	2015-10-09 11:08:52.5653
4002	1	1	143	2015	2015-10-12	2015-10-12	Was not keeping well.	approved	2015-10-13 07:01:01.261746	2015-10-19 06:13:22.696852
3978	1	1	54	2015	2015-10-05	2015-10-05	Not Feeling Well	approved	2015-10-06 05:55:30.256816	2015-10-26 05:27:50.457689
4036	2	1	209	2015	2015-10-23	2015-10-23	Going Home.	approved	2015-10-20 12:17:54.770936	2015-10-26 09:58:08.838359
4042	2	2	33	2015	2015-10-22	2015-10-23	Going Home	approved	2015-10-20 15:35:50.653304	2015-10-26 09:59:45.589461
4034	8	1	226	2015	2015-10-22	2015-10-22	Personal reason	approved	2015-10-20 07:10:41.815433	2015-10-26 10:00:50.599334
4016	1	1	72	2015	2015-10-15	2015-10-15	Not well	approved	2015-10-16 05:48:24.241259	2015-10-26 10:14:19.342005
3954	5	1	220	2015	2015-09-30	2015-09-30	Not well	approved	2015-09-30 06:51:19.834859	2015-10-26 10:22:28.532994
4019	2	1	131	2015	2015-10-15	2015-10-15	Personal	approved	2015-10-17 10:33:33.970485	2015-10-26 10:42:23.344449
4005	1	1	51	2015	2015-10-12	2015-10-12	i was not comfortable.	approved	2015-10-13 10:46:58.723979	2015-10-26 10:43:36.759158
4030	2	1	253	2015	2015-10-23	2015-10-23	To Celebrate festival	approved	2015-10-20 05:25:30.701317	2015-10-26 11:17:00.004041
3955	2	1	94	2015	2015-09-29	2015-09-29	personal work	approved	2015-09-30 08:02:45.734018	2015-10-27 04:58:54.387981
4010	8	1	91	2015	2015-10-21	2015-10-21	Going to home	approved	2015-10-15 07:56:16.835059	2015-10-27 06:16:19.793055
4011	8	1	91	2015	2015-10-22	2015-10-22	Going to home	approved	2015-10-15 07:56:35.781641	2015-10-27 06:16:28.337175
4000	5	0.5	171	2015	2015-10-12	2015-10-12	personal work	approved	2015-10-12 09:00:32.970837	2015-10-27 06:16:37.447772
4053	8	1	171	2015	2015-10-22	2015-10-22	Ayuda Pooja	approved	2015-10-21 11:12:36.566875	2015-10-27 06:16:39.209291
4059	8	1	155	2015	2015-11-11	2015-11-11	For Divali	approved	2015-10-23 08:50:11.083173	2015-11-12 05:33:05.351309
3983	2	6	220	2015	2015-10-30	2015-11-06	Personal Reason	approved	2015-10-06 13:30:19.504828	2015-11-30 04:34:34.957496
768	2	1	117	2013	2013-08-16	2013-08-16	Festival	approved	\N	\N
773	2	1	123	2013	2013-08-16	2013-08-16	going to native place	approved	\N	\N
797	8	1	95	2013	2013-08-20	2013-08-20	raksha bandhan	approved	\N	\N
798	5	0.5	85	2013	2013-08-20	2013-08-20	Due to festival I got late. I reached office by 11.45am	approved	\N	\N
807	2	4	30	2013	2013-08-16	2013-08-21	Because of Viral Fever, am not able to come last four days to Office.	approved	\N	\N
803	8	1	77	2013	2013-09-09	2013-09-09	Ganesh Chathurti	approved	\N	\N
779	2	10	99	2013	2013-11-04	2013-11-15	Want to go  home for Deepawali.	approved	\N	\N
2139	3	2	80	2014	2014-09-04	2014-09-05	As my uncle passed away.	approved	\N	\N
2211	6	3	140	2014	2014-08-26	2014-08-28	ML Leave 	approved	\N	\N
2199	2	8	131	2014	2014-09-01	2014-09-10	For my papa's medical treatment	approved	\N	\N
2209	8	1	117	2014	2014-10-03	2014-10-03	Festival	approved	\N	\N
2809	5	0.5	77	2015	2015-01-05	2015-01-05	Due to illness	approved	2015-01-05 09:59:48.379018	2015-01-13 11:43:51.8297
2956	3	4	221	2015	2015-02-03	2015-02-06	Commemorating the death anniversary of Father-in-Law in Bhopal. Would be checking email every day and be available on Cell.	Pending	2015-02-02 09:19:41.71555	2015-02-02 09:19:41.71555
3746	2	1	242	2015	2015-08-27	2015-08-27	As I am going to my hometown for the festival, I request you to grant me leave.	approved	2015-08-24 10:24:59.655332	2015-08-24 11:38:57.740614
3739	1	1	144	2015	2015-08-21	2015-08-21	I am not feeling well.	approved	2015-08-24 04:38:43.26478	2015-08-25 12:35:31.406328
3800	1	1	155	2015	2015-09-02	2015-09-02	Not well	approved	2015-09-03 07:02:14.873438	2015-09-07 07:45:20.773001
3763	5	0.5	226	2015	2015-08-21	2015-08-21	Had to visit college	approved	2015-08-27 05:06:38.028167	2015-09-07 07:45:25.525061
3780	1	4	235	2015	2015-08-25	2015-08-28	I was suffering from Viral fever.	approved	2015-08-31 06:43:54.991308	2015-09-07 07:45:59.401619
3853	2	1	177	2015	2015-09-11	2015-09-11	Going to cousin's marriage	approved	2015-09-10 13:54:49.375214	2015-09-11 05:21:50.180084
3856	5	0.5	99	2015	2015-09-11	2015-09-11	Personal	approved	2015-09-11 05:03:30.154274	2015-09-11 05:21:55.564767
3842	2	1	33	2015	2015-09-09	2015-09-09	Personal	approved	2015-09-10 08:49:07.258178	2015-09-15 09:51:22.918414
3788	5	0.5	201	2015	2015-09-01	2015-09-01	Personal work	approved	2015-09-01 10:53:19.013609	2015-09-15 09:56:53.140498
3750	2	1	252	2015	2015-08-28	2015-08-28	Going to temple	approved	2015-08-25 07:07:45.928278	2015-09-15 09:58:10.171784
3777	8	1	201	2015	2015-08-28	2015-08-28	Personal work	approved	2015-08-31 05:43:22.485894	2015-09-15 09:59:38.063012
3799	2	1	217	2015	2015-09-02	2015-09-02	 Due to inconvenience in Transportation. 	approved	2015-09-03 07:01:59.864455	2015-09-15 09:59:48.996673
3786	3	2	209	2015	2015-08-27	2015-08-28	My Grandmother passed away.	approved	2015-09-01 04:52:45.785233	2015-09-15 10:00:42.733367
3768	8	1	101	2015	2015-08-28	2015-08-28	Going Native	approved	2015-08-27 12:35:28.84671	2015-09-16 10:22:51.901949
3862	5	0.5	142	2015	2015-09-14	2015-09-14	personal work	approved	2015-09-14 07:37:39.217437	2015-09-16 12:04:40.470252
3857	5	0.5	191	2015	2015-09-11	2015-09-11	Not well.	approved	2015-09-11 09:21:32.989184	2015-09-16 12:04:53.130594
3867	5	0.5	210	2015	2015-09-15	2015-09-15	fever	approved	2015-09-15 09:35:39.479013	2015-09-16 12:04:58.088209
3803	1	1	196	2015	2015-09-01	2015-09-01	fever	approved	2015-09-04 05:46:41.230031	2015-09-16 12:25:03.112358
3883	2	2	169	2015	2015-09-17	2015-09-18	festival and bank work	approved	2015-09-16 12:13:28.400928	2015-09-16 12:25:05.71892
3785	2	1	211	2015	2015-08-31	2015-08-31	urgent work	approved	2015-09-01 03:59:46.052166	2015-09-16 13:45:32.801502
3855	2	1	211	2015	2015-09-10	2015-09-10	urgent work	approved	2015-09-11 04:22:21.001634	2015-09-16 13:46:26.293624
3877	8	1	41	2015	2015-09-17	2015-09-17	Ganesh Puja	approved	2015-09-16 08:10:29.085241	2015-09-16 13:47:06.33676
3924	2	1	196	2015	2015-09-25	2015-09-25	Going to home 	approved	2015-09-23 13:59:16.755123	2015-09-25 05:54:48.137484
3929	2	2	151	2015	2015-09-30	2015-10-01	Going my home town	approved	2015-09-24 14:04:35.498449	2015-09-25 05:54:56.864289
3849	1	1	48	2015	2015-08-31	2015-08-31	Sick	approved	2015-09-10 10:03:02.103312	2015-09-25 10:34:21.778834
3885	8	1	94	2015	2015-09-17	2015-09-17	Ganesha Festival	approved	2015-09-16 12:55:18.401411	2015-09-25 10:59:19.436092
3839	8	1	71	2015	2015-09-17	2015-09-17	Ganesh Chathurti	approved	2015-09-10 04:56:41.81007	2015-09-25 10:59:28.048003
3840	2	1	71	2015	2015-09-18	2015-09-18	Out of station	approved	2015-09-10 04:57:21.209203	2015-09-25 11:00:26.16119
3894	5	0.5	163	2015	2015-09-18	2015-09-18	Due to Personal Work	approved	2015-09-18 08:26:21.371869	2015-09-25 12:51:08.75632
3904	5	0.5	197	2015	2015-09-14	2015-09-14	Vairal Fever	approved	2015-09-21 10:38:29.973263	2015-09-25 12:51:39.047959
3926	5	0.5	80	2015	2015-09-25	2015-09-25	Personal work.	approved	2015-09-24 05:12:20.287387	2015-09-28 05:19:00.45669
3801	5	0.5	31	2015	2015-09-02	2015-09-02	I had some work	approved	2015-09-03 12:23:28.388652	2015-09-28 05:20:31.407845
3931	2	1	235	2015	2015-09-21	2015-09-21	I was in native.	approved	2015-09-25 07:01:36.218739	2015-09-28 07:15:54.943954
3915	2	1	209	2015	2015-09-25	2015-09-25	Going home.	approved	2015-09-22 13:00:19.450639	2015-09-28 07:26:47.361224
3914	5	0.5	209	2015	2015-09-23	2015-09-23	Going home.	approved	2015-09-22 13:00:06.412711	2015-09-28 07:27:20.567747
3934	8	1	260	2015	2015-09-24	2015-09-24	Bakrid Festival 	approved	2015-09-28 05:00:36.023181	2015-09-28 07:31:27.640436
3941	8	1	233	2015	2015-09-17	2015-09-17	Optional Leave	approved	2015-09-28 06:44:42.032412	2015-09-28 07:33:21.216567
3773	2	10	216	2015	2015-11-23	2015-12-04	Going home for personal work.	approved	2015-08-28 05:23:44.402053	2015-09-28 13:08:39.778987
3953	3	1	248	2015	2015-09-30	2015-09-30	My Friends dad has passed away.	approved	2015-09-29 09:45:11.028833	2015-10-06 05:05:08.10377
3960	5	0.5	109	2015	2015-10-01	2015-10-01	Out of station	approved	2015-10-01 04:17:24.87821	2015-10-09 11:08:24.470405
3952	2	3	230	2015	2015-09-24	2015-09-28	Pooja function at Native	approved	2015-09-29 06:03:03.539672	2015-10-09 11:13:11.451223
3979	2	1	245	2015	2015-10-16	2015-10-16	I have an important ritual at my native place.	approved	2015-10-06 07:03:41.435481	2015-10-19 06:14:11.263096
4024	2	1	230	2015	2015-10-08	2015-10-08	Birthday celebration	approved	2015-10-19 10:04:31.783355	2015-10-20 05:56:22.833534
4022	2	2	99	2015	2015-10-22	2015-10-23	Navaratra	approved	2015-10-19 06:09:55.147984	2015-10-21 08:31:00.908516
4039	5	1	187	2015	2015-10-23	2015-10-23	Outstation because of Dussehra festival.	approved	2015-10-20 12:21:12.306727	2015-10-26 05:27:47.268141
4035	8	1	209	2015	2015-10-22	2015-10-22	Going Home.	approved	2015-10-20 12:17:06.861239	2015-10-26 09:55:50.643754
4017	1	1	48	2015	2015-10-15	2015-10-15	Fever	approved	2015-10-16 06:19:36.163749	2015-10-26 10:02:32.971317
4025	2	1	201	2015	2015-10-20	2015-10-20	Going to Native place for personal work.	approved	2015-10-19 13:07:42.123097	2015-10-26 10:03:09.415871
4049	8	1	94	2015	2015-10-22	2015-10-22	ayudha pooje	approved	2015-10-21 09:50:49.6319	2015-10-26 10:12:45.235138
4023	5	0.5	94	2015	2015-10-19	2015-10-19	personal work	approved	2015-10-19 08:04:17.561784	2015-10-26 10:15:51.030508
4004	2	1	71	2015	2015-10-23	2015-10-23	out of station	approved	2015-10-13 08:21:58.052368	2015-10-26 10:16:10.754929
3918	2	5	48	2015	2015-10-05	2015-10-09	Travelling	approved	2015-09-23 08:45:09.445	2015-10-26 10:21:03.298886
3982	1	1	220	2015	2015-10-01	2015-10-01	Not well	approved	2015-10-06 13:09:03.474842	2015-10-26 10:22:19.061675
4045	8	1	235	2015	2015-10-22	2015-10-22	Vijaya Dashami	approved	2015-10-21 08:47:45.767725	2015-10-26 10:27:13.641406
3999	5	0.5	91	2015	2015-09-25	2015-09-25	Going to home	approved	2015-10-09 10:05:44.437736	2015-10-27 06:16:30.527336
3948	5	0.5	94	2015	2015-09-28	2015-09-28	personal work	approved	2015-09-28 09:08:43.778747	2015-10-27 06:24:24.84626
4032	8	1	165	2015	2015-11-11	2015-11-11	Optional	approved	2015-10-20 06:09:00.955655	2015-11-12 05:33:38.393288
3843	6	60	70	2015	2015-10-09	2015-12-31	Maternity leaves.	approved	2015-09-10 09:46:59.595141	2015-11-24 08:13:23.009452
3921	8	1	178	2015	2015-09-24	2015-09-24	personal work	approved	2015-09-23 12:26:11.036419	2015-11-24 08:15:19.878478
776	5	0.5	28	2013	2013-08-14	2013-08-14	I want to go my home town,so i will start early(2nd half)	approved	\N	\N
783	2	1	60	2013	2013-08-20	2013-08-20	sisters marriage	approved	\N	\N
793	2	1	79	2013	2013-08-20	2013-08-20	Visit to doctor	approved	\N	\N
796	1	1	40	2013	2013-08-16	2013-08-16	Not Well	approved	\N	\N
811	3	1	94	2013	2013-08-23	2013-08-23	Grandfather Expired	approved	\N	\N
812	5	0.5	94	2013	2013-08-22	2013-08-22	Grandfather Expired	approved	\N	\N
810	3	2	37	2013	2013-08-26	2013-08-27	I will go to my native place for my grandfather's bereavement ritual	approved	\N	\N
827	8	1	56	2013	2013-08-29	2013-08-29	I am going to my native place.	cancelled	\N	\N
831	1	1	36	2013	2013-08-16	2013-08-16	Not well	approved	\N	\N
817	8	1	70	2013	2013-09-09	2013-09-09	For Ganesh Chathurti I need to go my native.	approved	\N	\N
825	2	0.5	51	2013	2013-08-28	2013-08-28	First half i need to attend my daughter school function	approved	\N	\N
830	5	0.5	108	2013	2013-08-28	2013-08-28	Household work	approved	\N	\N
829	1	2	52	2013	2013-08-26	2013-08-27	I was not feeling well.	approved	\N	\N
822	1	1	108	2013	2013-08-13	2013-08-13	Not well	approved	\N	\N
821	1	1	129	2013	2013-08-26	2013-08-26	sick - migraine	approved	\N	\N
819	2	1	103	2013	2013-08-16	2013-08-16	Going to Native Place.	approved	\N	\N
820	1	1	103	2013	2013-08-19	2013-08-19	Due to not feeling well.	approved	\N	\N
823	2	0.5	119	2013	2013-08-19	2013-08-19	Personal	approved	\N	\N
824	2	0.5	119	2013	2013-08-27	2013-08-27	Personal	approved	\N	\N
832	3	1	42	2013	2013-08-26	2013-08-26	I went hospital	approved	\N	\N
816	5	0.5	78	2013	2013-08-27	2013-08-27	Personal work.	approved	\N	\N
802	2	9	77	2013	2013-09-10	2013-09-20	for my wedding	approved	\N	\N
815	5	1	46	2013	2013-08-27	2013-08-27	coughing, Headache weakness/fatigue and general discomfort	approved	\N	\N
813	1	0.5	68	2013	2013-08-27	2013-08-27	Need to go to hospital	approved	\N	\N
818	1	1	42	2013	2013-07-29	2013-07-29	I was fever 	approved	\N	\N
826	2	1	85	2013	2013-08-28	2013-08-28	personal work	approved	\N	\N
833	2	1	87	2013	2013-08-28	2013-08-28	Due to some personal reason...	approved	\N	\N
842	1	1	95	2013	2013-09-02	2013-09-02	was not feeling well..	approved	\N	\N
849	1	1	37	2013	2013-09-14	2013-09-14	I will go to My Native place	cancelled	\N	\N
853	8	1	51	2013	2013-09-09	2013-09-09	For Ganesha Festival	approved	\N	\N
837	8	1	111	2013	2013-09-09	2013-09-09	Ganesh Chathurti Festival	approved	\N	\N
848	1	1	108	2013	2013-09-04	2013-09-04	Not well	approved	\N	\N
834	3	1	111	2013	2013-08-30	2013-08-30	One of my Relatives passed off, please Consider my leave.	approved	\N	\N
840	2	1	132	2013	2013-09-02	2013-09-02	Grand parent not well.	approved	\N	\N
844	8	1	85	2013	2013-09-09	2013-09-09	ganesh chaturthi	approved	\N	\N
2200	5	2	131	2014	2014-09-11	2014-09-12	Time off	approved	\N	\N
843	8	1	132	2013	2013-09-09	2013-09-09	Ganesha Festival.	approved	\N	\N
875	2	5	78	2013	2013-09-02	2013-09-06	Was not well.	approved	\N	\N
878	5	2	78	2013	2013-08-29	2013-08-30	Was not wel.	approved	\N	\N
877	1	1	78	2013	2013-09-11	2013-09-11	Was not wel.	approved	\N	\N
838	8	1	44	2013	2013-09-16	2013-09-16	onam 	approved	\N	\N
839	2	4	44	2013	2013-09-17	2013-09-20	onam	approved	\N	\N
862	8	1	135	2013	2013-09-09	2013-09-09	Festival 	approved	\N	\N
847	8	1	119	2013	2013-09-09	2013-09-09	Festival - Want to avail the optional holiday.	approved	\N	\N
841	5	0.5	77	2013	2013-09-03	2013-09-03	For personal work	approved	\N	\N
882	2	1	132	2013	2013-09-18	2013-09-18	On account of Last Anantha Chathurdasi fest in home.	cancelled	\N	\N
861	8	1	67	2013	2013-09-09	2013-09-09	Going to native for festival 	approved	\N	\N
874	2	1	67	2013	2013-09-10	2013-09-10	Not feeling will	approved	\N	\N
864	8	1	94	2013	2013-09-09	2013-09-09	Ganesha Chaturthi	approved	\N	\N
879	2	1	94	2013	2013-09-13	2013-09-13	Going to attend DL test(driving license)	approved	\N	\N
850	8	1	37	2013	2013-09-09	2013-09-09	I will go to My Native place	approved	\N	\N
863	8	1	68	2013	2013-09-09	2013-09-09	For festival	approved	\N	\N
872	1	1	31	2013	2013-09-03	2013-09-03	Leg Pain	approved	\N	\N
886	8	1	103	2013	2013-09-09	2013-09-09	Optional Leave	approved	\N	\N
790	8	1	128	2013	2013-09-09	2013-09-09	Festival	approved	\N	\N
855	5	0.5	109	2013	2013-09-06	2013-09-06	I have to go to my hometown.	approved	\N	\N
814	2	5	109	2013	2013-09-09	2013-09-13	I want to visit hometown for festival.	approved	\N	\N
835	8	1	33	2013	2013-09-09	2013-09-09	Optional holiday	approved	\N	\N
836	2	1	33	2013	2013-09-10	2013-09-10	going native.	approved	\N	\N
876	8	2	78	2013	2013-09-09	2013-09-10	Was not wel.	approved	\N	\N
846	8	1	117	2013	2013-09-09	2013-09-09	Festival-Ganesh Chathurti	approved	\N	\N
851	8	1	123	2013	2013-09-09	2013-09-09	Ganesh Chathurti	approved	\N	\N
852	2	0.5	123	2013	2013-09-06	2013-09-06	going to native	approved	\N	\N
854	5	0.5	128	2013	2013-09-06	2013-09-06	I have to go to home town	approved	\N	\N
857	5	0.5	129	2013	2013-09-06	2013-09-06	doctor appointment	approved	\N	\N
858	8	1	129	2013	2013-09-09	2013-09-09	ganesh chaturthi	approved	\N	\N
865	8	1	91	2013	2013-09-09	2013-09-09	going to home	approved	\N	\N
868	5	0.5	95	2013	2013-09-09	2013-09-09	ganesh festival.	approved	\N	\N
869	2	3	55	2013	2013-09-11	2013-09-13	Personal work	approved	\N	\N
870	9	3	59	2013	2013-09-04	2013-09-06	I went to native.	approved	\N	\N
871	5	1	90	2013	2013-09-11	2013-09-11	Medical checkup 	approved	\N	\N
885	8	1	117	2013	2013-09-16	2013-09-16	Not feeling well- Fever and Stomach Pain	approved	\N	\N
880	5	0.5	129	2013	2013-09-16	2013-09-16	not well	approved	\N	\N
866	8	1	87	2013	2013-09-16	2013-09-16	Going home for cousin marriage.....	approved	\N	\N
867	2	1	87	2013	2013-09-17	2013-09-17	Going home for cousin marriage.....	approved	\N	\N
828	9	1	56	2013	2013-08-29	2013-08-29	I am going to my native place.	approved	\N	\N
845	2	2	85	2013	2013-10-03	2013-10-04	personal work	cancelled	\N	\N
881	2	4	72	2013	2013-09-30	2013-10-04	Going to native	approved	\N	\N
884	2	2	111	2013	2013-10-03	2013-10-04	On behalf of Mahalaya Amavasya	approved	\N	\N
856	2	4	52	2013	2013-10-08	2013-10-11	I will be out of station.	approved	\N	\N
1003	2	1	87	2013	2013-10-25	2013-10-25	Personal reasons...	approved	\N	\N
887	1	1	103	2013	2013-09-10	2013-09-10	Sick	approved	\N	\N
889	1	1	133	2013	2013-09-16	2013-09-16	I am not feeling well	approved	\N	\N
894	8	1	136	2013	2013-09-09	2013-09-09	Ganesh chaturthi	approved	\N	\N
895	1	2	136	2013	2013-09-10	2013-09-11	I am not feeling well	approved	\N	\N
707	2	5	127	2013	2013-09-23	2013-09-27	Due to the unfortunate demise of my grandfather last year, there are some rituals that need to be performed during the period mentioned above.\r\n\r\nI, being the eldest grandson, have to be present.\r\n\r\nKindly grant me leave for the above mentioned period.	approved	\N	\N
883	2	1	132	2013	2013-09-19	2013-09-19	On account of Anantha Padmanabha chathurdasi fest in home.	approved	\N	\N
916	1	1	99	2013	2013-08-30	2013-08-30	Accident on bike.	approved	\N	\N
917	2	1	119	2013	2013-09-23	2013-09-23	Personal	approved	\N	\N
918	5	1	111	2013	2013-09-27	2013-09-27	Personal Work.	cancelled	\N	\N
929	1	1	42	2013	2013-09-30	2013-09-30	Not Feeling well.	approved	\N	\N
928	1	1	87	2013	2013-10-01	2013-10-01	Not Feeling well....	approved	\N	\N
902	2	5	138	2013	2013-10-14	2013-10-18	I am going to Native place.	approved	\N	\N
891	2	2	98	2013	2013-10-14	2013-10-15	Going Native	approved	\N	\N
892	8	1	98	2013	2013-10-16	2013-10-16	Celebration of Festival	approved	\N	\N
926	2	6	36	2013	2013-10-28	2013-11-06	Going home town in Deepawali 	approved	\N	\N
2132	2	2	63	2014	2014-09-01	2014-09-02	Own Housewarming function	approved	\N	\N
2205	5	0.5	51	2014	2014-09-24	2014-09-24	Need to take care my daughter	approved	\N	\N
2207	5	1	165	2014	2014-09-19	2014-09-19	Fever, not feeling well.	approved	\N	\N
2201	8	1	91	2014	2014-10-03	2014-10-03	dasara	approved	\N	\N
2813	8	1	214	2015	2015-01-01	2015-01-01	New Year celeberations	approved	2015-01-06 04:15:50.012772	2015-01-27 09:04:22.458472
2957	2	3	155	2015	2015-02-09	2015-02-11	Sister Marriage	approved	2015-02-02 09:28:07.341974	2015-02-06 05:36:03.566017
3745	5	0.5	40	2015	2015-08-24	2015-08-24	Personal work	approved	2015-08-24 07:45:39.141994	2015-08-24 10:40:42.518828
3743	5	0.5	70	2015	2015-08-24	2015-08-24	Not feeling well.	approved	2015-08-24 06:49:14.243082	2015-08-24 10:40:53.424432
3741	1	1	31	2015	2015-08-21	2015-08-21	went to hospital for checkup.	approved	2015-08-24 05:34:06.292437	2015-08-24 10:54:29.32338
3752	1	1	222	2015	2015-08-14	2015-08-14	I was not feeling well	approved	2015-08-25 07:35:41.702594	2015-08-25 09:33:12.027093
3770	8	1	160	2015	2015-08-28	2015-08-28	Onam.	approved	2015-08-27 13:02:34.941179	2015-08-31 09:21:59.195916
3791	2	5	229	2015	2015-09-07	2015-09-11	study purpose and goto home	approved	2015-09-01 14:21:11.486296	2015-09-04 05:45:36.68463
3790	2	1	229	2015	2015-09-04	2015-09-04	goto home	cancelled	2015-09-01 14:19:05.725645	2015-09-04 06:07:04.545558
3784	8	1	77	2015	2015-08-28	2015-08-28	Took Optional leave	approved	2015-09-01 03:00:55.765178	2015-09-07 07:44:54.069891
3748	1	1	140	2015	2015-08-21	2015-08-21	Not Well	approved	2015-08-24 11:42:50.743582	2015-09-07 07:45:07.446632
3797	1	1	230	2015	2015-09-01	2015-09-01	Fever and weakness 	approved	2015-09-03 06:29:03.611736	2015-09-07 07:45:37.74053
3806	2	1	98	2015	2015-09-23	2015-09-23	Going Native	cancelled	2015-09-04 09:23:31.715507	2015-09-08 08:13:17.711729
3807	8	1	98	2015	2015-09-24	2015-09-24	Going Native	cancelled	2015-09-04 09:24:01.029524	2015-09-08 08:13:19.55767
3808	2	1	98	2015	2015-09-25	2015-09-25	Going Native	cancelled	2015-09-04 09:24:28.629715	2015-09-08 08:13:21.76903
3782	9	1	30	2015	2015-09-04	2015-09-04	Going to temple.	approved	2015-08-31 10:19:13.543865	2015-09-08 18:03:59.970983
3841	5	0.5	109	2015	2015-09-10	2015-09-10	feeling feverish.	approved	2015-09-10 07:13:57.877551	2015-09-10 07:22:23.906608
3864	1	1	159	2015	2015-09-11	2015-09-11	fever	approved	2015-09-15 04:42:27.487674	2015-09-15 05:29:25.633468
3865	1	1	159	2015	2015-09-14	2015-09-14	fever	approved	2015-09-15 04:42:58.061725	2015-09-15 05:29:28.105834
3850	2	1	201	2015	2015-09-11	2015-09-11	Personal work	approved	2015-09-10 12:26:14.935929	2015-09-15 09:46:10.504128
3764	5	0.5	117	2015	2015-08-27	2015-08-27	Will not be there in second half-Festival 	approved	2015-08-27 05:14:33.160738	2015-09-15 09:59:13.559747
3794	5	0.5	133	2015	2015-09-02	2015-09-02	I am not feeling well	approved	2015-09-02 08:11:27.083337	2015-09-16 10:23:04.675094
3772	8	1	187	2015	2015-08-28	2015-08-28	Festival	approved	2015-08-27 13:33:01.088875	2015-09-16 10:23:14.774868
3774	5	1	163	2015	2015-08-31	2015-08-31	Onam Celebration...	approved	2015-08-29 15:54:25.324354	2015-09-16 13:46:56.436065
3896	2	1	158	2015	2015-09-21	2015-09-21	Bank loan purpose	approved	2015-09-18 13:23:02.183085	2015-09-19 07:36:16.187915
3897	1	1	221	2015	2015-09-21	2015-09-21	High Fever & Cough	Pending	2015-09-21 02:35:26.622923	2015-09-21 02:35:26.622923
3756	2	3	109	2015	2015-09-14	2015-09-16	I want to visit hometown for festival.	approved	2015-08-26 05:18:04.310754	2015-09-21 10:01:10.574701
3845	2	1	117	2015	2015-09-16	2015-09-16	Festival - Gowri	approved	2015-09-10 09:57:56.24169	2015-09-22 07:38:02.854373
3890	1	2	216	2015	2015-09-10	2015-09-11	Fever	approved	2015-09-17 05:23:31.565052	2015-09-24 05:11:27.638815
3787	5	1	176	2015	2015-08-31	2015-08-31	out of station 	approved	2015-09-01 09:56:07.252718	2015-09-25 10:55:52.950027
3878	8	1	51	2015	2015-09-17	2015-09-17	For Ganesha Festival	approved	2015-09-16 08:55:27.069956	2015-09-25 10:59:38.009352
3884	8	1	48	2015	2015-09-17	2015-09-17	Ganesha Chaturthy	approved	2015-09-16 12:30:41.680635	2015-09-25 11:02:20.708644
3848	9	1	48	2015	2015-09-11	2015-09-11	Travelling	approved	2015-09-10 10:01:34.956951	2015-09-28 05:17:24.975823
3928	1	1	226	2015	2015-09-25	2015-09-25	Due to festival	approved	2015-09-24 08:52:35.061701	2015-09-28 07:26:42.843588
3937	8	1	77	2015	2015-09-24	2015-09-24	optional leave	approved	2015-09-28 05:27:07.23698	2015-09-28 07:31:35.381439
3940	2	3	98	2015	2015-09-23	2015-09-25	My Grand Father Passed Away ...	approved	2015-09-28 05:47:20.350418	2015-09-28 07:42:27.588075
3944	1	2	198	2015	2015-09-30	2015-10-01	Going to native for some personal works.	cancelled	2015-09-28 08:48:20.220051	2015-09-28 08:49:03.604331
3975	5	0.5	210	2015	2015-10-05	2015-10-05	due to backbone pain	approved	2015-10-05 08:37:37.084215	2015-10-06 05:05:02.87765
3988	8	1	151	2015	2015-10-21	2015-10-21	For Festival	approved	2015-10-07 07:39:12.336928	2015-10-07 08:55:14.156461
3997	5	0.5	102	2015	2015-10-08	2015-10-08	Going to hospital	approved	2015-10-08 08:56:36.567535	2015-10-09 05:07:27.674933
3971	5	0.5	155	2015	2015-09-29	2015-09-29	dad got hospitalised	approved	2015-10-05 05:51:16.927868	2015-10-09 11:11:39.075355
3976	5	0.5	226	2015	2015-10-09	2015-10-09	going out of station	approved	2015-10-05 13:17:46.994963	2015-10-09 11:14:58.893065
4001	5	1	98	2015	2015-10-12	2015-10-12	Went native due to some personal reason .	approved	2015-10-13 05:10:52.447869	2015-10-13 10:47:09.19139
3992	5	1	41	2015	2015-10-05	2015-10-05	Due to fever 	approved	2015-10-07 09:26:10.345317	2015-10-26 08:58:58.125975
3995	8	1	217	2015	2015-10-22	2015-10-22	Dhasara festival	approved	2015-10-07 12:01:11.478922	2015-10-26 09:59:02.008098
3996	2	1	217	2015	2015-10-23	2015-10-23	DAsara festival 	approved	2015-10-07 12:01:48.84408	2015-10-26 09:59:09.361696
3957	8	1	72	2015	2015-10-21	2015-10-21	Optional	approved	2015-09-30 13:04:18.779867	2015-10-26 10:14:43.423633
3964	2	7	237	2015	2015-10-12	2015-10-20	Marriage Function	approved	2015-10-05 05:32:27.023431	2015-10-26 10:17:41.329324
3917	9	2	48	2015	2015-09-30	2015-10-01	Travelling 	approved	2015-09-23 08:32:57.345621	2015-10-26 10:21:16.577043
4009	5	0.5	72	2015	2015-10-14	2015-10-14	not feeling well	approved	2015-10-14 09:03:12.686386	2015-10-26 10:42:37.265612
3868	8	1	171	2015	2015-09-17	2015-09-17	Ganesh Chathurti \r\n	approved	2015-09-15 09:51:45.736232	2015-10-27 06:16:40.611966
4007	1	2	178	2015	2015-10-22	2015-10-23	Traveling 	approved	2015-10-13 11:06:15.117196	2015-11-24 08:14:30.160279
3875	8	1	266	2015	2015-09-17	2015-09-17	Ganesh Chathurthi	approved	2015-09-16 06:33:10.569353	2015-11-25 10:00:42.095819
888	2	2	103	2013	2013-09-11	2013-09-12	Personal Reason	approved	\N	\N
898	1	1	108	2013	2013-09-17	2013-09-17	Not well	approved	\N	\N
901	1	5	138	2013	2013-10-14	2013-10-18	I am going to Native Place.	cancelled	\N	\N
903	5	0.5	40	2013	2013-09-19	2013-09-19	Have personal work	approved	\N	\N
897	1	0.5	28	2013	2013-09-18	2013-09-18	Fever	approved	\N	\N
924	1	1	132	2013	2013-09-27	2013-09-27	For being sick.	approved	\N	\N
921	2	0.5	85	2013	2013-09-30	2013-09-30	pick up and drop my baby from school.	approved	\N	\N
907	8	2	54	2013	2013-10-14	2013-10-15	Going home for festival	cancelled	\N	\N
906	2	2	33	2013	2013-09-30	2013-10-01	Going native	approved	\N	\N
914	8	1	52	2013	2013-10-14	2013-10-14	Dasehra	approved	\N	\N
2206	5	1	77	2014	2014-09-22	2014-09-22	personal work	approved	\N	\N
2817	5	0.5	109	2015	2015-01-06	2015-01-06	Personal reason.	approved	2015-01-06 04:32:24.231202	2015-01-07 06:40:21.012626
2821	2	2	30	2015	2015-01-16	2015-01-19	going to home	approved	2015-01-06 04:49:21.87712	2015-01-13 12:45:17.720157
2814	1	1	203	2015	2015-01-05	2015-01-05	Food Allergy 	approved	2015-01-06 04:25:07.629913	2015-01-20 13:36:13.009736
2958	2	1	117	2015	2015-02-02	2015-02-02	Sister In Law delivered baby so had to be in hospital.	approved	2015-02-03 04:25:08.701026	2015-03-06 07:06:10.50978
3742	8	1	109	2015	2015-08-28	2015-08-28	Festival	approved	2015-08-24 06:47:09.645478	2015-08-24 06:51:14.79117
3771	5	1	49	2015	2015-09-02	2015-09-02	Need to take my parents for check up.	Pending	2015-08-27 13:07:22.017793	2015-08-27 13:07:22.017793
3753	1	2	245	2015	2015-08-20	2015-08-21	I am not well,so i go to my native for check up.	approved	2015-08-25 09:30:29.625055	2015-08-27 13:18:33.252177
3844	5	0.5	191	2015	2015-09-10	2015-09-10	Not feeling well.	approved	2015-09-10 09:50:20.974303	2015-09-11 05:21:48.234797
3805	2	1	99	2015	2015-09-02	2015-09-02	Personal	approved	2015-09-04 08:27:10.79148	2015-09-11 05:21:57.52872
3854	1	1	258	2015	2015-09-10	2015-09-10	Stomach pain	approved	2015-09-10 16:56:26.113423	2015-09-15 09:51:55.51081
3876	8	1	187	2015	2015-09-17	2015-09-17	Meeting Brother	approved	2015-09-16 08:02:12.282541	2015-09-16 10:23:16.307666
3898	2	1	30	2015	2015-09-18	2015-09-18	went to meet my uncle.	approved	2015-09-21 04:49:48.816043	2015-09-21 05:12:07.955584
3870	8	1	33	2015	2015-09-17	2015-09-17	Personal	approved	2015-09-16 04:14:43.40519	2015-09-21 07:26:30.00017
3871	2	1	33	2015	2015-09-18	2015-09-18	Personal	approved	2015-09-16 04:14:59.764237	2015-09-21 07:26:34.108997
3852	5	1	155	2015	2015-09-18	2015-09-18	Personal Work	approved	2015-09-10 12:42:56.448801	2015-09-21 07:27:15.181271
3758	2	1	109	2015	2015-09-18	2015-09-18	I want to visit hometown for festival.	approved	2015-08-26 05:18:59.585332	2015-09-21 10:01:14.721428
3906	1	1	227	2015	2015-09-21	2015-09-21	fever	approved	2015-09-22 06:29:13.758911	2015-09-22 06:30:03.133112
3923	8	1	196	2015	2015-09-24	2015-09-24	Going to home	approved	2015-09-23 13:58:40.083482	2015-09-25 05:54:50.622282
3907	5	0.5	229	2015	2015-09-22	2015-09-22	i have an important work this afternoon 	approved	2015-09-22 06:47:06.468928	2015-09-25 05:54:53.183346
3779	8	1	218	2015	2015-08-28	2015-08-28	Onam. Viral fever.	approved	2015-08-31 06:26:17.217574	2015-09-25 10:32:58.832239
3793	2	1	51	2015	2015-09-03	2015-09-03	My grandmothers 11 days rituals going to my home.	approved	2015-09-02 07:28:19.95147	2015-09-25 10:41:24.567821
3869	2	3	160	2015	2015-09-21	2015-09-23	Going Home	approved	2015-09-15 11:32:16.518276	2015-09-25 10:54:59.076187
3925	8	1	218	2015	2015-09-24	2015-09-24	Bakr-Id.	approved	2015-09-24 01:20:41.361996	2015-09-25 10:56:26.447262
3792	5	0.5	51	2015	2015-09-02	2015-09-02	Need to take care of my daughter	approved	2015-09-02 07:16:45.169935	2015-09-25 11:02:10.015631
3911	5	1	176	2015	2015-09-18	2015-09-18	out of station	approved	2015-09-22 08:56:03.638351	2015-09-28 05:19:43.505886
3912	3	3	31	2015	2015-09-16	2015-09-18	Grandmother's funeral	approved	2015-09-22 09:54:57.2246	2015-09-28 05:21:13.365147
3920	8	1	249	2015	2015-09-24	2015-09-24	As i am going to my hometown for Bakrith celebration i need leave for one day	approved	2015-09-23 12:20:21.210528	2015-09-28 05:26:23.326415
3943	2	1	226	2015	2015-09-02	2015-09-02	Due to bandh no no transportation	approved	2015-09-28 07:11:42.692067	2015-09-28 07:11:42.692067
3913	8	1	209	2015	2015-09-24	2015-09-24	Going home.	approved	2015-09-22 12:59:48.815184	2015-09-28 07:26:58.557001
3902	5	1	118	2015	2015-09-25	2015-09-25	Id-ul-Zoha	approved	2015-09-21 07:33:08.255571	2015-09-28 07:29:16.433985
3938	2	1	77	2015	2015-09-25	2015-09-25	personal work	approved	2015-09-28 05:27:45.977345	2015-09-28 07:30:30.630011
3859	2	1	217	2015	2015-09-18	2015-09-18	personal reasons 	approved	2015-09-11 09:23:58.728666	2015-09-28 07:32:06.081461
3874	8	1	214	2015	2015-09-17	2015-09-17	Ganesh Puja	approved	2015-09-16 05:40:33.142748	2015-09-28 07:32:18.291961
3873	1	1	214	2015	2015-09-08	2015-09-08	Unwell	approved	2015-09-16 05:40:01.014684	2015-09-28 07:32:59.782113
3939	3	5	98	2015	2015-09-16	2015-09-22	My Grand Father Passed Away ...	approved	2015-09-28 05:46:35.767102	2015-09-28 07:42:24.55928
3950	1	1	30	2015	2015-09-25	2015-09-25	Not feeling well(headache).	approved	2015-09-29 05:19:52.684771	2015-09-29 05:29:20.263846
3945	2	2	198	2015	2015-09-30	2015-10-01	Going to native for some personal works.	approved	2015-09-28 08:49:37.759813	2015-09-29 12:40:52.995558
3949	1	2	101	2015	2015-09-25	2015-09-28	Treatment For knee Problem	approved	2015-09-29 05:14:40.850267	2015-09-30 05:11:46.230218
3962	2	1	133	2015	2015-10-05	2015-10-05	i am going to native.	approved	2015-10-01 12:37:57.350086	2015-10-05 05:13:50.798239
3973	2	7	64	2015	2015-10-12	2015-10-20	Personal Work	approved	2015-10-05 06:21:37.320371	2015-10-07 04:48:27.846144
3989	8	1	151	2015	2015-10-22	2015-10-22	For Festival	approved	2015-10-07 07:39:33.888021	2015-10-07 08:55:12.146314
3994	2	1	217	2015	2015-10-22	2015-10-22	dhasara festival	cancelled	2015-10-07 12:00:15.097829	2015-10-07 12:00:38.756359
3987	9	1	99	2015	2015-10-01	2015-10-01	Sick	approved	2015-10-07 05:49:32.98695	2015-10-09 05:07:11.656726
3974	2	1	117	2015	2015-10-01	2015-10-01	Suffering from fever and cold	approved	2015-10-05 06:30:54.971408	2015-10-09 11:07:48.328114
3967	1	3	155	2015	2015-09-21	2015-09-23	Not Well	approved	2015-10-05 05:40:16.676107	2015-10-09 11:13:26.948405
4015	2	1	77	2015	2015-10-09	2015-10-09	went to bank for Loan 	approved	2015-10-16 05:18:15.413163	2015-10-20 05:53:10.608179
4052	2	1	169	2015	2015-10-23	2015-10-23	festival	approved	2015-10-21 10:02:05.38027	2015-10-21 11:00:35.116349
4018	2	1	159	2015	2015-10-26	2015-10-26	brother marriage	approved	2015-10-16 09:52:53.760973	2015-10-22 11:31:10.221247
4058	8	1	211	2015	2015-10-22	2015-10-22	festival leave.	approved	2015-10-23 05:03:19.177228	2015-10-26 08:48:43.797425
4027	8	1	201	2015	2015-10-21	2015-10-21	Going to Native place for personal work.	approved	2015-10-19 13:11:20.193095	2015-10-26 10:02:14.05309
4055	8	1	212	2015	2015-10-21	2015-10-21	Navami, Ayudha Pooja	approved	2015-10-22 05:38:46.401733	2015-10-26 10:02:44.102455
4003	8	1	71	2015	2015-10-22	2015-10-22	Vijaya Dashami	approved	2015-10-13 08:21:24.280937	2015-10-26 10:10:02.463774
3958	8	1	72	2015	2015-10-22	2015-10-22	Optional	approved	2015-09-30 13:04:47.071894	2015-10-26 10:13:27.73328
4046	2	1	235	2015	2015-10-23	2015-10-23	Going to my native.	approved	2015-10-21 08:48:40.53923	2015-10-26 10:27:04.959387
3966	8	1	237	2015	2015-10-22	2015-10-22	Dasmi	approved	2015-10-05 05:34:24.277576	2015-10-27 06:18:54.751838
3972	2	3	237	2015	2015-10-23	2015-10-27	Marriage function	approved	2015-10-05 06:06:59.036487	2015-10-27 11:09:56.405127
3965	8	1	237	2015	2015-10-21	2015-10-21	 navmi	approved	2015-10-05 05:33:59.963888	2015-10-27 11:10:12.128321
4021	8	1	142	2015	2015-10-21	2015-10-21	personal work	approved	2015-10-19 05:43:51.079549	2015-11-03 10:02:31.424391
3892	2	1	178	2015	2015-09-18	2015-09-18	personal work.	approved	2015-09-17 10:07:29.27438	2015-11-24 08:14:32.063755
4006	8	1	178	2015	2015-10-21	2015-10-21	Traveling	approved	2015-10-13 10:53:37.086785	2015-11-24 08:14:36.943814
4033	2	6	165	2015	2015-11-09	2015-11-16	Privlaged leave for diwali.	approved	2015-10-20 06:09:41.784289	2015-12-07 11:26:47.77478
3942	1	1	266	2015	2015-09-18	2015-09-18	Need to go hospital.	approved	2015-09-28 07:10:26.425288	2015-12-11 09:54:22.868771
859	5	0.5	70	2013	2013-09-06	2013-09-06	Not feeling well.	approved	\N	\N
913	8	1	60	2013	2013-09-16	2013-09-16	Optional	approved	\N	\N
911	5	0.5	70	2013	2013-09-27	2013-09-27	Due to some personal works I need to travel.	approved	\N	\N
920	5	1	101	2013	2013-10-01	2013-10-01	For Dad's Hospital Check up.	approved	\N	\N
922	2	1	28	2013	2013-10-01	2013-10-01	Personal	approved	\N	\N
927	1	1	40	2013	2013-09-20	2013-09-20	Was Sick	approved	\N	\N
893	2	2	98	2013	2013-10-17	2013-10-18	Going Native	approved	\N	\N
2223	5	0.5	95	2014	2014-09-29	2014-09-29	Personal.	approved	\N	\N
2212	2	1	71	2014	2014-09-25	2014-09-25	Father Funeral Ceremony	approved	\N	\N
2216	1	1	99	2014	2014-09-25	2014-09-25	Fever	approved	\N	\N
2235	2	1	144	2014	2014-09-30	2014-09-30	I have personal work. 	approved	\N	\N
2222	8	1	33	2014	2014-10-03	2014-10-03	Optional	approved	\N	\N
2252	8	1	185	2014	2014-10-03	2014-10-05	Going to out of station	approved	\N	\N
2215	8	1	171	2014	2014-10-03	2014-10-03	on eve of Dasara	approved	\N	\N
2229	8	1	139	2014	2014-10-03	2014-10-03	Festival	approved	\N	\N
2242	8	1	177	2014	2014-10-03	2014-10-03	Optional	approved	\N	\N
2233	5	1	118	2014	2014-10-07	2014-10-07	Bakrid	approved	\N	\N
2818	8	1	191	2015	2015-01-01	2015-01-01	New year.	approved	2015-01-06 04:33:42.224642	2015-01-06 04:52:31.290678
2815	1	2	191	2014	2014-12-29	2014-12-30	Not feeling well.	approved	2015-01-06 04:27:40.90779	2015-01-21 09:14:52.42038
2959	2	1	176	2015	2015-02-02	2015-02-02	out of station	approved	2015-02-03 05:11:24.99917	2015-03-05 09:52:22.145489
3749	5	0.5	169	2015	2015-08-24	2015-08-24	Sick	approved	2015-08-25 06:40:55.14817	2015-08-25 06:42:48.987093
3751	1	2	222	2015	2015-08-19	2015-08-20	I was not feeling well	approved	2015-08-25 07:34:23.112289	2015-08-25 09:34:00.231272
3762	9	1	52	2015	2015-07-29	2015-07-29	Deducted for not applying leave... 	approved	2015-08-26 13:06:24.861399	2015-08-26 13:06:24.861399
3765	5	0.5	30	2015	2015-08-27	2015-08-27	Not Feeling well(headache)	approved	2015-08-27 08:19:16.149399	2015-08-27 10:08:46.968747
3769	9	1	160	2015	2015-08-28	2015-08-28	Personal Work.	cancelled	2015-08-27 12:45:50.705232	2015-08-27 13:01:39.853517
3755	3	1	51	2015	2015-08-24	2015-08-24	My Grandmother passed away.	approved	2015-08-25 12:35:55.788008	2015-08-28 05:12:10.703311
3776	8	1	191	2015	2015-08-28	2015-08-28	Due to some urgent work.	approved	2015-08-31 05:20:46.605803	2015-09-01 07:41:46.065653
3767	8	1	140	2015	2015-08-28	2015-08-28	To celebrate varalakshmi festival	approved	2015-08-27 10:09:38.784485	2015-09-07 07:45:10.982717
3798	2	1	230	2015	2015-09-02	2015-09-02	BMTC bandh buses autos not available	approved	2015-09-03 07:00:17.141253	2015-09-07 07:45:45.030595
3880	8	1	90	2015	2015-09-17	2015-09-17	Sri Ganesha Chaturthi.	Pending	2015-09-16 10:22:29.518763	2015-09-16 10:22:29.518763
3879	8	1	134	2015	2015-09-17	2015-09-17	Going sister's home for ganesh Puja.	approved	2015-09-16 09:19:30.353994	2015-09-16 10:23:01.536418
3754	5	1.5	188	2015	2015-08-20	2015-08-21	Personal reason	approved	2015-08-25 09:55:36.076768	2015-09-16 10:23:09.373003
3783	8	1	188	2015	2015-08-28	2015-08-28	festival	approved	2015-08-31 13:35:16.509878	2015-09-16 10:23:10.929385
3744	2	1	211	2015	2015-08-24	2015-08-24	Urgent work	approved	2015-08-24 07:42:03.204346	2015-09-16 13:46:08.81325
3760	1	1	41	2015	2015-08-14	2015-08-14	Due to fever 	approved	2015-08-26 10:03:17.066131	2015-09-16 13:47:02.834928
3889	1	1	54	2015	2015-09-16	2015-09-16	Not Feeling Well	approved	2015-09-17 05:04:03.846914	2015-09-18 06:12:02.154327
3893	8	1	77	2015	2015-09-17	2015-09-17	Took Optional Leave	approved	2015-09-18 06:11:54.214136	2015-09-21 07:26:38.767191
3872	8	1	140	2015	2015-09-17	2015-09-17	Ganesh Chaturthi	approved	2015-09-16 05:26:00.738903	2015-09-21 07:26:45.53219
3866	8	1	235	2015	2015-09-17	2015-09-17	Ganesh Chathurthi.	approved	2015-09-15 05:26:34.948175	2015-09-21 07:27:28.328129
3900	1	1	140	2015	2015-09-18	2015-09-18	Not feeling well	approved	2015-09-21 05:31:29.631926	2015-09-21 10:00:57.846105
3757	8	1	109	2015	2015-09-17	2015-09-17	I want to visit hometown for festival.	approved	2015-08-26 05:18:24.417647	2015-09-21 10:01:12.672703
3899	2	5	219	2015	2015-09-14	2015-09-18	going to native	approved	2015-09-21 05:12:51.334479	2015-09-22 06:27:00.041955
3846	8	1	117	2015	2015-09-17	2015-09-17	Festival - Ganesha	approved	2015-09-10 09:58:27.995533	2015-09-22 07:38:00.441598
3847	2	5	117	2015	2015-10-12	2015-10-16	Vacation	approved	2015-09-10 09:58:54.624697	2015-09-22 07:38:14.954099
3778	2	3	218	2015	2015-08-25	2015-08-27	Viral fever.	approved	2015-08-31 06:25:28.165182	2015-09-25 10:32:17.349017
3881	8	1	80	2015	2015-09-17	2015-09-17	Personal Work.	approved	2015-09-16 12:05:21.6438	2015-09-28 05:20:03.686932
3802	2	1	218	2015	2015-09-04	2015-09-04	Medical check-up.	approved	2015-09-04 03:49:30.150617	2015-09-28 05:20:19.168248
3795	1	1	94	2015	2015-09-02	2015-09-02	Not Well	approved	2015-09-03 05:04:03.757442	2015-09-28 05:20:42.096722
3922	8	1	101	2015	2015-09-24	2015-09-24	going for medical check up	approved	2015-09-23 12:54:59.840921	2015-09-28 05:26:20.702517
3932	2	1	102	2015	2015-09-28	2015-09-28	Personal Work	approved	2015-09-25 07:52:06.868657	2015-09-28 05:27:57.901565
3905	1	1	209	2015	2015-09-15	2015-09-15	I was not feeling well.	approved	2015-09-21 11:55:09.222599	2015-09-28 07:04:29.563431
3858	8	1	217	2015	2015-09-17	2015-09-17	Ganesh festival	approved	2015-09-11 09:23:14.95824	2015-09-28 07:32:00.172724
3951	2	1	30	2015	2015-09-28	2015-09-28	Not feeling well.	approved	2015-09-29 05:20:34.421243	2015-09-29 05:29:22.623991
3961	5	0.5	187	2015	2015-10-01	2015-10-01	Meeting Brother.	approved	2015-10-01 05:36:30.207556	2015-10-05 05:13:48.57368
3981	2	5	49	2015	2015-10-19	2015-10-23	Going to Shirdi.	Pending	2015-10-06 11:28:15.03917	2015-10-06 11:28:15.03917
3970	2	1	155	2015	2015-09-28	2015-09-28	Dad got hospitalized .	approved	2015-10-05 05:48:34.28598	2015-10-09 11:10:30.548347
3969	1	1	155	2015	2015-09-25	2015-09-25	Not well	approved	2015-10-05 05:41:48.916125	2015-10-09 11:12:21.628497
3968	8	1	155	2015	2015-09-24	2015-09-24	Not Well	approved	2015-10-05 05:40:46.882797	2015-10-09 11:12:40.253299
3959	5	0.5	242	2015	2015-09-01	2015-09-01	Shifting Home.	approved	2015-09-30 14:01:20.783128	2015-10-09 11:14:13.13798
3789	2	7	140	2015	2015-10-15	2015-10-23	Going to native place 	approved	2015-09-01 11:05:38.965683	2015-10-20 05:56:44.243972
4012	8	1	242	2015	2015-10-22	2015-10-22	I need to attend family function in home town.	approved	2015-10-15 12:09:16.124053	2015-10-20 05:58:40.091035
4013	2	1	242	2015	2015-10-23	2015-10-23	I need to attend Family function in home town.	approved	2015-10-15 12:10:40.297361	2015-10-20 05:58:43.113242
4051	8	1	169	2015	2015-10-22	2015-10-22	Festival	approved	2015-10-21 09:59:54.895811	2015-10-21 11:00:38.257993
4040	8	1	60	2015	2015-10-22	2015-10-22	Dussera	approved	2015-10-20 13:12:34.141387	2015-10-22 11:30:44.262156
4057	2	1	221	2015	2015-10-23	2015-10-23	Personal reasons 	Pending	2015-10-23 04:26:06.847494	2015-10-23 04:26:06.847494
4026	2	1	201	2015	2015-10-23	2015-10-23	Going to Native place for personal work.	approved	2015-10-19 13:08:49.827636	2015-10-26 09:56:29.133636
3993	2	1	217	2015	2015-10-21	2015-10-21	dhasara festival	approved	2015-10-07 11:58:01.892138	2015-10-26 10:01:45.594436
4029	8	1	253	2015	2015-10-22	2015-10-22	To celebrate festival	approved	2015-10-20 05:25:04.882918	2015-10-26 10:12:22.131325
3984	1	1	160	2015	2015-10-06	2015-10-06	Fever	approved	2015-10-07 04:14:12.759473	2015-10-27 05:59:06.794784
4014	1	1	31	2015	2015-10-09	2015-10-09	i was not feeling well	approved	2015-10-15 14:01:31.810862	2015-10-27 06:28:49.997414
4031	2	1	109	2015	2015-10-21	2015-10-21	Fastival	approved	2015-10-20 05:49:49.076009	2015-10-30 04:37:13.41817
873	8	1	31	2013	2013-09-09	2013-09-09	For Ganesh chadurthi celebration.	approved	\N	\N
890	1	1	51	2013	2013-09-13	2013-09-13	I was not feeling well	approved	\N	\N
896	1	1	102	2013	2013-09-16	2013-09-16	Fever	approved	\N	\N
899	2	1	47	2013	2013-09-17	2013-09-17	Fever	approved	\N	\N
904	3	2	132	2013	2013-09-18	2013-09-19	My grand father passed away.	approved	\N	\N
900	1	1	67	2013	2013-09-17	2013-09-17	not feeling will	approved	\N	\N
905	1	1	136	2013	2013-09-18	2013-09-18	My brother was not feeling well so 	approved	\N	\N
909	5	1.5	101	2013	2013-09-16	2013-09-17	Dad Hospitalised	approved	\N	\N
910	2	2	123	2013	2013-09-23	2013-09-24	going to hospital for my brother operation	approved	\N	\N
912	1	1	60	2013	2013-09-24	2013-09-24	Due to fever	approved	\N	\N
919	5	0.5	111	2013	2013-09-27	2013-09-27	Personal Work.	approved	\N	\N
915	1	0.5	68	2013	2013-09-26	2013-09-26	Not feeling well	approved	\N	\N
923	1	0.5	85	2013	2013-09-30	2013-09-30	I am not well now. I am leaving by 6	approved	\N	\N
931	1	1	85	2013	2013-10-01	2013-10-01	i was not well	approved	\N	\N
925	5	1	99	2013	2013-09-30	2013-09-30	Personal	approved	\N	\N
908	2	3	54	2013	2013-10-16	2013-10-18	Going to Native	approved	\N	\N
933	1	1	46	2013	2013-09-12	2013-09-12	Fever	approved	\N	\N
939	8	1	127	2013	2013-09-09	2013-09-09	Ganesh Chaturthi. Optional.	approved	\N	\N
940	1	1	127	2013	2013-08-30	2013-08-30	Sick leave.	approved	\N	\N
938	8	1	125	2013	2013-09-09	2013-09-09	Ganesh Chaturthi - optional	approved	\N	\N
943	9	2	59	2013	2013-10-03	2013-10-04	Went to native	approved	\N	\N
936	1	1	87	2013	2013-10-04	2013-10-04	Not Feeling well...	approved	\N	\N
935	5	0.5	108	2013	2013-10-04	2013-10-04	outing	approved	\N	\N
934	5	0.5	129	2013	2013-10-04	2013-10-04	personal	approved	\N	\N
945	5	1	67	2013	2013-10-08	2013-10-08	Some personal work	approved	\N	\N
944	2	2	94	2013	2013-10-08	2013-10-09	Going to native for personal work	approved	\N	\N
951	8	1	139	2013	2013-10-14	2013-10-14	Festival	cancelled	\N	\N
946	1	0.5	42	2013	2013-10-09	2013-10-09	I am not feeling well. I have a little bit of fever and headache.	approved	\N	\N
962	8	1	60	2013	2013-10-16	2013-10-16	optional	approved	\N	\N
963	2	2	60	2013	2013-10-17	2013-10-18	cousin's marriage	approved	\N	\N
2219	5	0.5	31	2014	2014-09-26	2014-09-26	i'm not feeling well	approved	\N	\N
980	2	2	54	2013	2013-10-14	2013-10-15	Went to Native	approved	\N	\N
2213	8	2	71	2014	2014-10-03	2014-10-06	Out of station	approved	\N	\N
987	5	1	67	2013	2013-10-21	2013-10-21	some personal work 	approved	\N	\N
978	2	1	68	2013	2013-10-21	2013-10-21	Need to attend function	approved	\N	\N
976	2	1	31	2013	2013-10-18	2013-10-18	Family function	approved	\N	\N
961	9	1	51	2013	2013-10-14	2013-10-14	Festival	approved	\N	\N
975	9	1	51	2013	2013-10-16	2013-10-16	i had some personal work	approved	\N	\N
981	2	1	52	2013	2013-10-15	2013-10-15	I was out of station.	approved	\N	\N
982	9	1	52	2013	2013-10-16	2013-10-16	I was out of station.	approved	\N	\N
966	5	1	68	2013	2013-10-16	2013-10-16	Need to attend function.	approved	\N	\N
974	8	1	87	2013	2013-10-16	2013-10-16	optional..	approved	\N	\N
968	5	0.5	94	2013	2013-10-16	2013-10-16	to attend allergy rhinitis test	approved	\N	\N
959	5	0.5	94	2013	2013-10-14	2013-10-14	festival	approved	\N	\N
969	5	0.5	94	2013	2013-10-18	2013-10-18	to attend allergy rhinits test	approved	\N	\N
937	2	1	99	2013	2013-10-14	2013-10-14	Personal	approved	\N	\N
942	2	1	123	2013	2013-10-11	2013-10-11	going to native	approved	\N	\N
947	8	1	129	2013	2013-10-16	2013-10-16	eid	approved	\N	\N
948	2	1	129	2013	2013-10-15	2013-10-15	travel	approved	\N	\N
949	2	2	129	2013	2013-10-17	2013-10-18	going home	approved	\N	\N
950	5	0.5	129	2013	2013-10-10	2013-10-10	personal	approved	\N	\N
941	8	1	70	2013	2013-10-14	2013-10-14	Traveling out of station for personal works.	approved	\N	\N
932	2	3	49	2013	2013-10-11	2013-10-15	For Durgapuja, (I will be in bangalore)	approved	\N	\N
977	1	1	117	2013	2013-10-17	2013-10-17	Stomach Pain	approved	\N	\N
958	8	1	111	2013	2013-10-16	2013-10-16	Personal Work.	approved	\N	\N
964	2	1	85	2013	2013-10-14	2013-10-14	Vijaya Dashami	approved	\N	\N
972	9	1	120	2013	2013-10-14	2013-10-14	Information Week Release on Sep 21st	approved	\N	\N
973	2	1	120	2013	2013-10-15	2013-10-15	Personal 	approved	\N	\N
960	1	2	44	2013	2013-10-11	2013-10-14	Neck pain.	approved	\N	\N
2228	8	1	154	2014	2014-10-23	2014-10-23	Diwali	approved	\N	\N
995	5	1	95	2013	2013-10-28	2013-10-28	personal reason.	approved	\N	\N
965	8	1	77	2013	2013-10-16	2013-10-16	Optional Holiday	approved	\N	\N
955	5	0.5	139	2013	2013-10-11	2013-10-11	Fever	approved	\N	\N
952	8	1	139	2013	2013-10-14	2013-10-14	Festival	approved	\N	\N
953	8	1	108	2013	2013-10-14	2013-10-14	Festival	approved	\N	\N
954	2	1	45	2013	2013-10-11	2013-10-11	Sister's daughter first b'day.	approved	\N	\N
970	9	2	46	2013	2013-10-21	2013-10-22	Friend's Wedding	approved	\N	\N
983	5	0.5	131	2013	2013-10-21	2013-10-21	not well	approved	\N	\N
984	5	0.5	131	2013	2013-10-22	2013-10-22	Karva Chauth Fast	approved	\N	\N
990	5	0.5	87	2013	2013-10-24	2013-10-24	Due to some personal reason....	approved	\N	\N
991	5	0.5	111	2013	2013-10-25	2013-10-25	Personal Work.	approved	\N	\N
993	2	0.5	51	2013	2013-10-28	2013-10-28	i need to take care of my daughter	approved	\N	\N
997	1	1	55	2013	2013-10-14	2013-10-14	Not Feeling well	approved	\N	\N
998	1	1	37	2013	2013-10-14	2013-10-14	Went to hospital, due to not feeling well	approved	\N	\N
1000	2	1	37	2013	2013-10-18	2013-10-18	Went to Native place	approved	\N	\N
1010	5	0.5	30	2013	2013-10-31	2013-10-31	Going to home for Diwali.	approved	\N	\N
957	2	3	28	2013	2013-11-04	2013-11-06	Diwali Festival	approved	\N	\N
1020	5	0.5	77	2013	2013-10-31	2013-10-31	for Diwali festival	approved	\N	\N
1029	8	1	118	2013	2013-10-16	2013-10-16	Due to Bakhrid.	approved	\N	\N
989	2	2	70	2013	2013-11-04	2013-11-05	Going to native place for Diwali.	approved	\N	\N
986	2	1	102	2013	2013-11-04	2013-11-04	Festival	approved	\N	\N
930	2	5	42	2013	2013-11-01	2013-11-08	I am going to my native.	approved	\N	\N
971	2	15	46	2013	2013-12-11	2013-12-31	Going Home on Christmas and New year Eve.	cancelled	\N	\N
994	5	0.5	95	2013	2013-10-18	2013-10-18	sick	approved	\N	\N
996	2	1	95	2013	2013-10-21	2013-10-21	sick	approved	\N	\N
1001	2	1	37	2013	2013-10-28	2013-10-28	Went to hospital, due to eye paining	approved	\N	\N
999	1	1	125	2013	2013-10-29	2013-10-29	Headache and fever.	approved	\N	\N
985	2	1	80	2013	2013-11-04	2013-11-04	As i have some personal work.	approved	\N	\N
1021	5	0.5	101	2013	2013-10-31	2013-10-31	going to native	approved	\N	\N
1013	1	1	123	2013	2013-11-04	2013-11-04	eye check_up	cancelled	\N	\N
1017	5	0.5	91	2013	2013-10-31	2013-10-31	going to home	approved	\N	\N
1030	8	1	118	2013	2013-08-09	2013-08-09	Due to EID	approved	\N	\N
1006	2	5	143	2013	2013-11-11	2013-11-15	An important function at home.	approved	\N	\N
1024	2	1	94	2013	2013-11-04	2013-11-04	Deepavali	approved	\N	\N
1026	2	1	55	2013	2013-11-04	2013-11-04	Going for Festival	approved	\N	\N
1031	2	1	71	2013	2013-11-04	2013-11-04	Out of Station	approved	\N	\N
2203	8	1	131	2014	2014-08-29	2014-08-29	Ganesh Chathurti	cancelled	\N	\N
2214	5	0.5	163	2014	2014-09-26	2014-09-26	I have personal work.	approved	\N	\N
2243	8	1	60	2014	2014-10-06	2014-10-06	ocassion	approved	\N	\N
2227	8	2	44	2014	2014-10-03	2014-10-06	Optional leave	approved	\N	\N
2250	8	1	77	2014	2014-10-03	2014-10-03	Optional	approved	\N	\N
2238	2	1	155	2014	2014-10-06	2014-10-06	Come Back from native	approved	\N	\N
2244	8	1	196	2014	2014-10-03	2014-10-03	I am going to my native place,because when will joining the company, this is first time going to home.so pls accepted the leave be alone sir,\r\nthanks;\r\nvinoth	cancelled	\N	\N
2221	8	1	49	2014	2014-10-03	2014-10-03	For Durgapuja	approved	\N	\N
2819	2	2	191	2015	2015-01-02	2015-01-05	Due to some important work.	approved	2015-01-06 04:34:57.429927	2015-01-06 04:52:33.310917
2820	8	1	30	2015	2015-01-15	2015-01-15	going to home	approved	2015-01-06 04:48:45.797315	2015-01-13 12:45:18.780018
2960	1	1	218	2015	2015-02-02	2015-02-02	Cold and fever.	approved	2015-02-03 05:55:43.407593	2015-02-05 07:32:08.578867
3809	3	3	117	2015	2015-09-01	2015-09-03	My husbands grandmother passed away.	approved	2015-09-04 11:52:56.239008	2015-09-15 09:56:35.376334
3946	1	1	216	2015	2015-09-24	2015-09-24	Viral fever	approved	2015-09-28 09:00:56.712521	2015-10-19 06:13:24.280951
4044	2	2	229	2015	2015-10-19	2015-10-20	goto home	approved	2015-10-21 07:08:46.877622	2015-10-21 07:10:37.299694
4048	5	1	95	2015	2015-10-21	2015-10-21	0.5	cancelled	2015-10-21 09:20:01.650638	2015-10-21 10:49:31.70022
4050	2	2	227	2015	2015-10-22	2015-10-23	festival	approved	2015-10-21 09:54:23.48377	2015-10-21 11:00:29.247572
4047	8	1	95	2015	2015-10-22	2015-10-22	Dussehera	approved	2015-10-21 09:19:44.119754	2015-10-21 12:55:07.805535
4056	8	1	221	2015	2015-10-22	2015-10-22	Dashahera	Pending	2015-10-22 05:46:13.153389	2015-10-22 05:46:13.153389
4041	2	1	158	2015	2015-10-23	2015-10-23	Going to home	approved	2015-10-20 13:28:41.395541	2015-10-22 11:30:59.252159
4060	2	1	133	2015	2015-10-26	2015-10-26	I am going to native\r\n	approved	2015-10-23 10:45:57.790662	2015-10-26 05:27:41.340265
4038	8	1	187	2015	2015-10-22	2015-10-22	Outstation because of Dussehra festival.	approved	2015-10-20 12:20:28.600856	2015-10-26 05:27:49.083306
4054	5	1	163	2015	2015-10-23	2015-10-23	Going to Native.	approved	2015-10-22 03:38:23.598129	2015-10-26 08:44:13.943883
4043	2	2	215	2015	2015-10-26	2015-10-27	Going for cousin marriage	approved	2015-10-21 04:47:36.978076	2015-10-26 08:48:58.830347
4020	5	0.5	218	2015	2015-10-19	2015-10-19	Time off	approved	2015-10-19 02:03:42.954959	2015-10-26 10:17:02.244385
1005	2	3	143	2013	2013-11-11	2013-11-13	An important function at home.	cancelled	\N	\N
992	1	0.5	77	2013	2013-10-25	2013-10-25	Due to personal illness	approved	\N	\N
1007	2	1	85	2013	2013-10-31	2013-10-31	going to native for diwali	approved	\N	\N
1011	5	2	30	2013	2013-11-04	2013-11-05	Going to home for diwali.	approved	\N	\N
1015	2	1	111	2013	2013-10-28	2013-10-28	Due to some personal work couldn't come.	approved	\N	\N
1027	2	2	31	2013	2013-10-10	2013-10-11	My close relative passed away.	approved	\N	\N
2218	8	1	108	2014	2014-10-03	2014-10-03	Leave for festival	approved	\N	\N
2236	1	1	169	2014	2014-10-03	2014-10-03	festival	cancelled	\N	\N
2251	8	2	54	2014	2014-10-03	2014-10-06	Going Home for Festival	approved	\N	\N
2225	1	1	189	2014	2014-09-26	2014-09-26	Sick due to high fever and stomach ache.	cancelled	\N	\N
2217	2	2	135	2014	2014-09-23	2014-09-24	Personal appointments	approved	\N	\N
2239	8	1	80	2014	2014-10-06	2014-10-06	As I have some personal work.	approved	\N	\N
2969	1	2	213	2015	2015-02-02	2015-02-03	due to food poison i took holiday  	approved	2015-02-04 04:47:20.063197	2015-02-04 07:25:26.230604
2961	2	1	72	2015	2015-02-06	2015-02-06	Going to friend's wedding.	approved	2015-02-03 09:15:46.87341	2015-02-05 07:32:02.480864
2976	5	0.5	95	2015	2015-02-05	2015-02-05	some personal work.	approved	2015-02-05 08:24:58.991502	2015-02-05 16:10:38.864684
2979	5	0.5	170	2015	2015-02-06	2015-02-06	Personal Work	approved	2015-02-05 12:32:55.067527	2015-02-06 06:53:54.945991
2970	1	2	203	2015	2015-02-03	2015-02-04	Fever	approved	2015-02-05 03:33:59.582588	2015-02-16 14:19:58.936013
2822	8	1	158	2015	2015-01-15	2015-01-15	Pongal festival 	cancelled	2015-01-06 04:55:08.47411	2015-02-19 05:02:36.957512
2982	2	1	30	2015	2015-03-02	2015-03-02	cousin marriage	cancelled	2015-02-06 04:27:02.740289	2015-02-24 03:55:08.129715
2967	2	2	201	2015	2015-02-12	2015-02-13	personal work	approved	2015-02-04 03:40:17.071258	2015-03-03 06:36:55.837837
2962	1	1	41	2015	2015-02-02	2015-02-02	Due to Fever 	approved	2015-02-03 11:14:14.881945	2015-03-05 07:13:25.492067
3811	2	1	235	2015	2015-09-02	2015-09-02	Due to strike buses were not available.	approved	2015-09-07 07:48:54.53999	2015-09-10 07:22:39.490021
3810	1	3	215	2015	2015-09-02	2015-09-04	Viral Fever	approved	2015-09-07 04:16:14.35106	2015-09-16 13:45:42.7058
4061	1	1	218	2015	2015-10-26	2015-10-26	Severe back strain.	approved	2015-10-26 04:15:50.680401	2015-11-24 08:14:48.896263
1004	2	1	42	2013	2013-10-14	2013-10-14	I went to mysore.\r\n	approved	\N	\N
1009	9	2	47	2013	2013-10-28	2013-10-29	Not feeling well	approved	\N	\N
1023	2	1	117	2013	2013-11-04	2013-11-04	Festival - Diwali	cancelled	\N	\N
1014	1	1	123	2013	2013-10-31	2013-10-31	eye check_up	approved	\N	\N
1008	2	1	133	2013	2013-11-04	2013-11-04	i am going to native.	approved	\N	\N
1019	2	1	77	2013	2013-11-04	2013-11-04	for Diwali festival	approved	\N	\N
1025	2	1	103	2013	2013-11-04	2013-11-04	Going to Native.	approved	\N	\N
1032	1	1	91	2013	2013-11-04	2013-11-04	not feeling well	approved	\N	\N
1018	2	2	139	2013	2013-11-04	2013-11-05	Going to my native.	approved	\N	\N
2220	2	2	134	2014	2014-09-29	2014-09-30	Going chennai for sister-in-law surgery. 	approved	\N	\N
2224	1	1	188	2014	2014-09-26	2014-09-26	Suffering from fever	approved	\N	\N
2231	1	1	155	2014	2014-10-06	2014-10-06	Going for native	cancelled	\N	\N
2240	1	1	51	2014	2014-09-29	2014-09-29	I was not well	approved	\N	\N
2246	1	1	147	2014	2014-09-30	2014-09-30	Not feeling well	approved	\N	\N
2247	8	1	101	2014	2014-10-03	2014-10-03	Festival	approved	\N	\N
2245	5	0.5	155	2014	2014-10-01	2014-10-01	Going to native	approved	\N	\N
2241	8	1	194	2014	2014-10-06	2014-10-06	Eid	approved	\N	\N
2230	8	1	98	2014	2014-10-06	2014-10-06	Going Native for festival celebration	approved	\N	\N
2232	8	1	118	2014	2014-10-06	2014-10-06	Bakrid	approved	\N	\N
2823	2	1	158	2015	2015-01-14	2015-01-14	Pongal festival 	approved	2015-01-06 04:55:42.369978	2015-01-13 12:20:36.084146
2963	1	1	60	2015	2015-02-02	2015-02-02	sick	approved	2015-02-03 11:16:30.110667	2015-02-03 11:17:48.974156
2968	2	2	201	2015	2015-02-12	2015-02-13	personal work	cancelled	2015-02-04 03:40:17.073834	2015-02-04 03:58:02.888376
2934	1	1	31	2015	2015-01-23	2015-01-23	I'm not feeling well.	approved	2015-01-27 11:12:58.131701	2015-02-04 07:52:57.226843
2972	1	1	102	2015	2015-02-04	2015-02-04	Fever	approved	2015-02-05 04:36:09.145238	2015-02-05 04:42:31.167514
2973	5	0.5	72	2015	2015-02-05	2015-02-05	Going to friend's wedding.	approved	2015-02-05 07:31:11.613919	2015-02-05 07:32:04.070243
2971	5	0.5	142	2015	2015-02-06	2015-02-06	personal work	approved	2015-02-05 04:25:23.373649	2015-02-05 16:10:50.146538
2980	2	1	163	2015	2015-02-09	2015-02-09	Going to Native for urgent Personal matter.	approved	2015-02-05 13:57:39.443797	2015-02-16 14:19:50.019845
4008	2	2	101	2015	2015-10-12	2015-10-13	Affected with hamstring pain. and grand father admitted in hospital.	approved	2015-10-14 05:34:25.10667	2015-10-26 05:27:32.450653
4037	8	1	187	2015	2015-10-21	2015-10-21	Outstation because of Dussehra festival.	approved	2015-10-20 12:19:35.806413	2015-10-26 05:27:43.353244
3998	1	1	134	2015	2015-10-05	2015-10-05	Health was not good.	approved	2015-10-09 04:51:17.145657	2015-10-26 05:27:45.405528
4066	2	2	102	2015	2015-11-09	2015-11-10	Going to hometown	approved	2015-10-26 07:35:27.854137	2015-11-03 13:04:17.865593
4067	8	1	102	2015	2015-11-11	2015-11-11	Personal work	approved	2015-10-26 07:38:07.794761	2015-11-03 13:04:19.822228
4064	2	1	242	2015	2015-10-26	2015-10-26	For my wife's Maternity checkup. I need leave.	approved	2015-10-26 06:20:40.067893	2015-11-09 10:25:13.092509
4072	8	1	160	2015	2015-11-11	2015-11-11	Diwali	approved	2015-10-27 05:32:33.981072	2015-11-24 08:14:18.477367
4073	2	2	160	2015	2015-11-12	2015-11-13	Going home for Diwali	approved	2015-10-27 05:33:06.383222	2015-11-24 08:14:26.619258
3812	5	0.5	178	2015	2015-09-07	2015-09-07	feeling sick.	approved	2015-09-07 08:19:35.991759	2015-11-24 08:14:40.753988
1012	5	1	136	2013	2013-10-29	2013-10-29	I had some personal problem	approved	\N	\N
1016	1	1	80	2013	2013-10-24	2013-10-24	As I was not feeling well.	approved	\N	\N
1028	2	12	108	2013	2013-11-15	2013-12-02	Visit Home	approved	\N	\N
1034	1	1	131	2013	2013-11-04	2013-11-04	Sick leave	approved	\N	\N
2248	8	1	168	2014	2014-10-06	2014-10-06	Bakrid \r\n	approved	\N	\N
2249	8	1	140	2014	2014-10-03	2014-10-03	For Dasara Celebration	approved	\N	\N
2237	2	1	169	2014	2014-10-03	2014-10-03	Festival	approved	\N	\N
2234	1	1	203	2014	2014-10-03	2014-10-03	\r\n i am travelling to my home town due to celebrate Dessara festival along with my family. I would kindly request you to grand me leave for  1 day. 	cancelled	\N	\N
2825	8	1	162	2015	2015-01-01	2015-01-01	new year	approved	2015-01-06 05:13:48.895637	2015-01-06 05:14:54.737071
2824	2	1	158	2015	2015-01-16	2015-01-16	Pongal festival 	approved	2015-01-06 04:55:57.201951	2015-01-13 12:20:34.762042
2965	2	2	191	2015	2015-02-05	2015-02-06	Personal work at home.	approved	2015-02-03 13:24:09.755896	2015-02-05 16:10:43.361971
2975	2	1	95	2015	2015-02-04	2015-02-04	personal work.	approved	2015-02-05 08:24:28.304662	2015-02-05 16:11:04.571081
2964	2	1	77	2015	2015-02-04	2015-02-04	for personal work	approved	2015-02-03 11:42:20.333988	2015-02-06 05:35:47.164069
2978	2	1	95	2015	2015-02-09	2015-02-09	marriage function.	approved	2015-02-05 08:26:02.002903	2015-02-06 07:38:54.054841
3813	2	1	140	2015	2015-09-08	2015-09-08	Need to take care of my daughter 	approved	2015-09-07 11:31:37.60504	2015-09-10 07:21:41.798795
4062	5	1	260	2015	2015-10-23	2015-10-23	Out of station	approved	2015-10-26 05:29:17.008503	2015-10-26 09:58:17.794922
4069	9	1	91	2015	2015-10-23	2015-10-23	Dasara holidays 	approved	2015-10-27 05:28:26.473048	2015-10-27 06:16:35.763618
1038	5	1	77	2013	2013-11-05	2013-11-05	for Diwali festival	approved	\N	\N
1041	1	1	44	2013	2013-11-06	2013-11-06	cold and fever	approved	\N	\N
979	8	2	54	2013	2013-10-14	2013-10-15	Went for Bakrid festival	approved	\N	\N
1036	5	0.5	117	2013	2013-11-06	2013-11-06	Personal Reason	approved	\N	\N
1039	8	1	33	2013	2013-11-14	2013-11-14	optional	cancelled	\N	\N
1040	2	1	33	2013	2013-11-15	2013-11-15	going native	cancelled	\N	\N
1046	1	1	149	2013	2013-11-07	2013-11-07	sick	approved	\N	\N
1059	1	1	111	2013	2013-11-11	2013-11-11	Not feeling well.	approved	\N	\N
1062	1	1	111	2013	2013-11-15	2013-11-15	Not feeling well.	approved	\N	\N
1033	5	1	51	2013	2013-11-04	2013-11-04	For festival	approved	\N	\N
1060	2	1	51	2013	2013-11-15	2013-11-15	For my cousin sister marriage	approved	\N	\N
1047	2	2	138	2013	2013-11-11	2013-11-12	Going to home town for personal work.	approved	\N	\N
1061	5	0.5	138	2013	2013-11-15	2013-11-15	Not feeling well.	approved	\N	\N
1055	2	1	95	2013	2013-11-04	2013-11-04	personal.	approved	\N	\N
1054	2	1	125	2013	2013-11-04	2013-11-04	Out of station	approved	\N	\N
1050	2	1	68	2013	2013-11-11	2013-11-11	Going to native	approved	\N	\N
1037	2	1	59	2013	2013-11-04	2013-11-04	Went home for diwali	approved	\N	\N
1065	2	2	147	2013	2013-11-04	2013-11-05	went home	approved	\N	\N
1066	2	3	146	2013	2013-11-04	2013-11-06	went hometown	approved	\N	\N
1067	5	0.5	37	2013	2013-11-15	2013-11-15	Some Personal Work	approved	\N	\N
1053	2	1	94	2013	2013-11-13	2013-11-13	Going to home town for marriage	approved	\N	\N
1069	2	1	37	2013	2013-11-04	2013-11-04	Go to native place for festival	approved	\N	\N
1045	8	1	67	2013	2013-11-06	2013-11-06	some personal work	approved	\N	\N
1070	1	1	139	2013	2013-11-12	2013-11-12	Not well	approved	\N	\N
1071	1	2	101	2013	2013-11-21	2013-11-22	going to temple	cancelled	\N	\N
1072	5	0.5	29	2013	2013-11-15	2013-11-15	not felling well	approved	\N	\N
1075	5	1	101	2013	2013-11-22	2013-11-22	going to temple	approved	\N	\N
1074	2	1	101	2013	2013-11-21	2013-11-21	going to temple	approved	\N	\N
1073	5	1	54	2013	2013-11-15	2013-11-15	Festival	approved	\N	\N
1076	5	0.5	29	2013	2013-11-15	2013-11-15	Not feeling well	approved	\N	\N
1043	8	1	109	2013	2013-11-14	2013-11-14	Visiting Hometown.	approved	\N	\N
1042	8	1	117	2013	2013-11-14	2013-11-14	Cousin's Engagement	approved	\N	\N
1056	5	0.5	71	2013	2013-11-11	2013-11-11	Out Of Station	approved	\N	\N
1057	2	1	71	2013	2013-11-12	2013-11-12	Out of station	approved	\N	\N
1078	2	1	60	2013	2013-11-14	2013-11-14	Personal Work	approved	\N	\N
1068	5	1	52	2013	2013-11-19	2013-11-19	I have some personal work.	approved	\N	\N
1048	4	1	87	2013	2013-11-18	2013-11-18	To attend my post graduate exam	approved	\N	\N
1049	2	1	87	2013	2013-11-19	2013-11-19	To attend my postgraduate exams 	approved	\N	\N
1081	2	2	55	2013	2013-11-05	2013-11-06	Went to home town	approved	\N	\N
1044	9	1	109	2013	2013-11-15	2013-11-15	Visiting Hometown.	approved	\N	\N
1089	5	0.5	127	2013	2013-11-25	2013-11-25	sick	cancelled	\N	\N
1063	1	3	123	2013	2013-11-19	2013-11-21	fever	approved	\N	\N
1080	1	1	72	2013	2013-11-19	2013-11-19	Not feeling well	approved	\N	\N
1079	1	1	120	2013	2013-11-18	2013-11-18	Unwell	approved	\N	\N
1077	5	0.5	140	2013	2013-11-18	2013-11-18	\r\nPersonal Work	approved	\N	\N
1092	1	2	51	2013	2013-11-25	2013-11-26	I was suffering from typoid fever	approved	\N	\N
1091	5	1	80	2013	2013-11-26	2013-11-26	I have some Personal Work.	approved	\N	\N
1090	1	0.5	70	2013	2013-11-26	2013-11-26	Due to some health issue I am taking half day leave.	approved	\N	\N
1083	5	0.5	95	2013	2013-11-22	2013-11-22	personal	approved	\N	\N
1051	2	1	87	2013	2013-11-27	2013-11-27	Going to attend my PG exams	approved	\N	\N
1082	2	2	87	2013	2013-11-25	2013-11-26	Going For PG Exams...	approved	\N	\N
2812	2	5	147	2015	2015-01-05	2015-01-09	going home	approved	2015-01-06 04:00:25.614248	2015-01-06 05:14:56.955512
1096	3	1.5	101	2013	2013-11-27	2013-11-28	Friend died	approved	\N	\N
1095	2	1	87	2013	2013-11-28	2013-11-28	Due to some pg works...	approved	\N	\N
1094	5	0.5	59	2013	2013-11-28	2013-11-28	I went hospital	approved	\N	\N
1058	9	2	128	2013	2013-11-28	2013-11-29	Going to hometown 	approved	\N	\N
1035	2	3	63	2013	2013-11-11	2013-11-13	Traveling Outstation for Personal reasons	approved	\N	\N
1100	2	2	54	2013	2013-11-28	2013-11-29	Went to Native	approved	\N	\N
1101	1	1	102	2013	2013-11-22	2013-11-22	Fever	approved	\N	\N
1102	1	1	55	2013	2013-11-21	2013-11-21	not feeling wel 	approved	\N	\N
1088	8	2	29	2013	2013-12-25	2013-12-26	Going to native 	approved	\N	\N
1087	2	1	29	2013	2013-12-23	2013-12-23	Going to native	approved	\N	\N
2257	2	3	201	2014	2014-09-29	2014-10-01	personal work	approved	\N	\N
2253	8	1	90	2014	2014-10-03	2014-10-03	Durga Pooja.	approved	\N	\N
1086	5	0.5	111	2013	2013-11-26	2013-11-26	Personal work.	approved	\N	\N
1117	1	1	139	2013	2013-12-06	2013-12-06	Tooth ache	approved	\N	\N
1108	2	1	108	2013	2013-12-03	2013-12-03	was not feeling well	approved	\N	\N
1107	1	1	71	2013	2013-12-02	2013-12-02	Not well	approved	\N	\N
1114	2	2	94	2013	2013-12-05	2013-12-06	Shifting the house	approved	\N	\N
1052	5	0.5	33	2013	2013-11-12	2013-11-12	Visit Doctor	approved	\N	\N
1084	5	0.5	77	2013	2013-11-21	2013-11-21	personal work	approved	\N	\N
1122	5	0.5	77	2013	2013-12-05	2013-12-05	RTO work	approved	\N	\N
1093	3	3	44	2013	2013-11-25	2013-11-27	To attend the funeral of my grandmother.	approved	\N	\N
1064	5	2	149	2013	2013-11-28	2013-11-29	brother's engagement	approved	\N	\N
1109	2	1	149	2013	2013-11-27	2013-11-27	family function	approved	\N	\N
1110	1	1	149	2013	2013-12-02	2013-12-02	family function	approved	\N	\N
1099	2	1	109	2013	2013-12-04	2013-12-04	Personal Reason	approved	\N	\N
1112	5	0.5	117	2013	2013-12-05	2013-12-05	Personal Reason	approved	\N	\N
1115	2	1	125	2013	2013-12-06	2013-12-06	Going out of station	approved	\N	\N
1106	2	1	80	2013	2013-12-06	2013-12-06	As I have some personal work.	approved	\N	\N
1118	2	7	71	2013	2013-12-25	2013-12-31	Out Of Station	approved	\N	\N
1113	2	3	139	2013	2013-12-27	2013-12-31	Out of city	approved	\N	\N
1103	2	5	33	2013	2013-12-23	2013-12-27	christmas 	approved	\N	\N
1104	8	1	33	2013	2013-12-31	2013-12-31	New year eve	approved	\N	\N
1105	5	1	33	2013	2013-12-30	2013-12-30	Going home	approved	\N	\N
1123	2	4	131	2013	2013-12-10	2013-12-13	vacation	approved	\N	\N
2255	2	6	165	2014	2014-10-22	2014-10-29	Gooing to home town.	cancelled	\N	\N
2254	8	1	165	2014	2014-10-23	2014-10-23	For diwali	approved	\N	\N
2265	1	1	170	2014	2014-10-01	2014-10-01	sick	approved	\N	\N
2260	1	1	133	2014	2014-10-03	2014-10-03	I am not feeling well	approved	\N	\N
2278	2	1	68	2014	2014-10-13	2014-10-13	Personal Work	cancelled	\N	\N
2282	1	1	68	2014	2014-10-13	2014-10-13	Personal Work	cancelled	\N	\N
2286	1	1	54	2014	2014-10-07	2014-10-07	Not Feeling Well	approved	\N	\N
2290	5	0.5	151	2014	2014-10-10	2014-10-10	personal work.	approved	\N	\N
2293	2	11	64	2014	2014-10-20	2014-11-03	Personal Work	approved	\N	\N
2263	5	0.5	176	2014	2014-10-06	2014-10-06	It became late To reach office due to delay by train as I am coming from my home town.	approved	\N	\N
2287	2	1	54	2014	2014-10-08	2014-10-08	Not Feeling Well	approved	\N	\N
2299	5	0.5	163	2014	2014-10-14	2014-10-14	Personal Matter	approved	\N	\N
2310	1	1	111	2014	2014-10-13	2014-10-13	I was not feeling well.	approved	\N	\N
2326	8	1	187	2014	2014-10-23	2014-10-23	Function	approved	\N	\N
2306	1	1	208	2014	2014-10-15	2014-10-15	My Sister coming from AP so I need go pick-up her in Bus stand 	cancelled	\N	\N
2296	2	3	55	2014	2014-10-22	2014-10-24	Diwali festival	approved	\N	\N
2329	5	0.5	117	2014	2014-10-17	2014-10-17	Personal work - will not be there 2nd half	approved	\N	\N
2316	2	2	159	2014	2014-10-23	2014-10-24	home festival	approved	\N	\N
2350	9	1	99	2014	2014-10-24	2014-10-24	Personal Work.	approved	\N	\N
2340	8	1	200	2014	2014-10-23	2014-10-23	Diwali Celebration	approved	\N	\N
2322	2	1	71	2014	2014-11-03	2014-11-03	Out of station	approved	\N	\N
2341	2	1	200	2014	2014-10-24	2014-10-24	Diwali Celebration	approved	\N	\N
2292	2	5	91	2014	2014-10-22	2014-10-28	going to home for diwali festival	approved	\N	\N
2279	2	2	102	2014	2014-10-21	2014-10-22	Personal work	approved	\N	\N
2318	9	1	41	2014	2014-10-09	2014-10-09	Went to Doctor for Health Check up	approved	\N	\N
2323	2	1	71	2014	2014-11-05	2014-11-05	out of station	approved	\N	\N
2826	2	2	162	2015	2015-01-02	2015-01-05	Not well Due to accident 	approved	2015-01-06 05:15:19.489267	2015-01-06 10:07:30.14696
2827	8	1	51	2015	2015-01-01	2015-01-01	For new year	approved	2015-01-06 05:15:25.17972	2015-01-13 11:54:17.361362
2983	1	1	162	2015	2015-02-05	2015-02-05	Emergency 	approved	2015-02-06 04:49:56.387089	2015-02-06 04:55:30.190333
2981	5	0.5	155	2015	2015-02-06	2015-02-06	Going for Native	approved	2015-02-06 04:05:44.86364	2015-02-06 05:36:05.434594
2977	2	1	95	2015	2015-02-06	2015-02-06	marriage function.	approved	2015-02-05 08:25:37.962535	2015-02-06 07:38:51.892712
2966	2	1	87	2015	2015-02-09	2015-02-09	Personal Work	approved	2015-02-03 13:49:00.778525	2015-02-06 07:38:55.904726
2974	5	0.5	91	2015	2015-02-05	2015-02-05	Not feeling well fever.	approved	2015-02-05 08:05:45.483507	2015-02-19 06:00:36.744031
3814	5	1	221	2015	2015-09-30	2015-09-30	Attending Board Meeting at 5 PM.	cancelled	2015-09-07 11:32:29.83314	2015-09-29 12:41:48.010976
4063	9	1	102	2015	2015-11-02	2015-11-02	Personal work	approved	2015-10-26 06:16:17.897844	2015-11-03 13:04:22.264207
4071	8	1	41	2015	2015-10-22	2015-10-22	Puja vacction	approved	2015-10-27 05:31:51.275878	2015-11-24 08:15:12.862966
4070	8	1	41	2015	2015-10-21	2015-10-21	Puja vaccation	approved	2015-10-27 05:31:25.191117	2015-11-24 08:16:00.860187
1116	2	1	28	2013	2013-12-06	2013-12-06	Personal	cancelled	\N	\N
1126	1	1	51	2013	2013-12-05	2013-12-05	I was not feeling well	approved	\N	\N
1124	9	1	47	2013	2013-12-05	2013-12-05	Not Well	approved	\N	\N
1111	5	0.5	87	2013	2013-12-04	2013-12-04	Not feeling well....	approved	\N	\N
1132	2	2	102	2013	2013-12-05	2013-12-06	Personal work 	approved	\N	\N
1127	1	0.5	70	2013	2013-12-06	2013-12-06	Due to some personal work.	approved	\N	\N
1121	5	0.5	134	2013	2013-12-06	2013-12-06	I am going to chennai for knee check up.	approved	\N	\N
1138	1	1	70	2013	2013-12-09	2013-12-09	I was not feeling well.	approved	\N	\N
1139	2	1	87	2013	2013-12-06	2013-12-06	Due to some personal emergency..	approved	\N	\N
1141	1	1	55	2013	2013-12-06	2013-12-06	Personal work	approved	\N	\N
1142	2	1	55	2013	2013-12-09	2013-12-09	Marriage Function	approved	\N	\N
1128	2	1	59	2013	2013-12-09	2013-12-09	Going to native	approved	\N	\N
1137	2	1	87	2013	2013-12-09	2013-12-09	Due to some personal emergency...	approved	\N	\N
1131	2	1	123	2013	2013-11-29	2013-11-29	fracture	approved	\N	\N
1130	2	5	123	2013	2013-12-02	2013-12-06	Fracture	approved	\N	\N
1149	2	7	107	2013	2013-12-23	2013-12-31	Christmas celebration 	cancelled	\N	\N
2256	2	5	165	2014	2014-10-22	2014-10-29	Going to home town.	approved	\N	\N
1144	2	1	134	2013	2013-12-09	2013-12-09	I was in chennai for knee check up.	approved	\N	\N
1125	9	2	47	2013	2013-12-12	2013-12-13	Personal	approved	\N	\N
1134	5	1	31	2013	2013-12-09	2013-12-09	personal work	approved	\N	\N
1135	5	1	28	2013	2013-12-10	2013-12-10	Personal	approved	\N	\N
1143	2	2	111	2013	2013-12-12	2013-12-13	Cousin marriage.	approved	\N	\N
1145	2	0.5	51	2013	2013-12-11	2013-12-11	Due some bank work	approved	\N	\N
1150	1	1	138	2013	2013-12-11	2013-12-11	caught with cold fever.	approved	\N	\N
1151	2	1	68	2013	2013-12-13	2013-12-13	Going to native	approved	\N	\N
1154	2	1	95	2013	2013-12-12	2013-12-12	sick	approved	\N	\N
1158	1	1	52	2013	2013-12-13	2013-12-13	I had fever.	approved	\N	\N
1161	5	0.5	37	2013	2013-12-17	2013-12-17	I'll go to Hospital due to Stomach pain 	approved	\N	\N
1173	2	6	40	2013	2013-12-06	2013-12-13	Personal Work	approved	\N	\N
1162	2	4	59	2013	2013-12-11	2013-12-16	As I have faced some problem in my family.	approved	\N	\N
1166	1	1	131	2013	2013-12-03	2013-12-03	SICK LEAVE	approved	\N	\N
1169	1	1	151	2013	2013-12-17	2013-12-17	I Was not feeling well	approved	\N	\N
1171	1	1	123	2013	2013-12-18	2013-12-18	fever	approved	\N	\N
1179	2	6	91	2013	2013-12-06	2013-12-13	going to native	approved	\N	\N
1180	5	1	29	2013	2013-12-24	2013-12-24	Going to native	approved	\N	\N
1181	5	1	29	2013	2013-12-27	2013-12-27	Going to native	approved	\N	\N
1155	8	2	70	2013	2013-12-25	2013-12-26	Having pooja at home and need to attend my cousin sister's marriage.	approved	\N	\N
1157	8	1	70	2013	2013-12-31	2013-12-31	Having pooja at home and need to attend my cousin sister's marriage.	approved	\N	\N
1148	2	9	107	2013	2013-12-23	2013-12-31	Christmas celebration  	approved	\N	\N
1163	8	2	131	2013	2013-12-25	2013-12-26	CHRISTMAS	approved	\N	\N
1164	8	1	131	2013	2013-12-31	2013-12-31	NEW YEARS EVE	approved	\N	\N
1167	2	2	131	2013	2013-12-29	2013-12-30	LEAVE	approved	\N	\N
1165	2	2	131	2013	2013-12-27	2013-12-28	LEAVE	approved	\N	\N
1186	8	2	143	2013	2013-12-25	2013-12-26	Need to go to chennai for christmas celebration with my family.	cancelled	\N	\N
1189	5	1	102	2013	2013-12-20	2013-12-20	Bank Work	cancelled	\N	\N
1136	1	1	117	2013	2013-12-09	2013-12-09	Fever, Cold and Cough	approved	\N	\N
1159	1	2	77	2013	2013-12-12	2013-12-13	Due to personal illness.	approved	\N	\N
1168	5	0.5	44	2013	2013-12-18	2013-12-18	not feeling well.	approved	\N	\N
1200	8	2	95	2013	2013-12-25	2013-12-26	Christmas holiday.	approved	\N	\N
1193	5	0.5	125	2013	2013-12-23	2013-12-23	sick	approved	\N	\N
1199	8	1	145	2013	2013-12-25	2013-12-25	To celebrate the festival	approved	\N	\N
1140	4	5	42	2013	2013-12-25	2013-12-31	Going for my pg( MBA ) exams. 	approved	\N	\N
1203	8	2	125	2013	2013-12-25	2013-12-26	Optional for Christmas	approved	\N	\N
1152	8	2	87	2013	2013-12-25	2013-12-26	Going to my native for Christmas...	approved	\N	\N
1184	5	1	87	2013	2013-12-24	2013-12-24	Going home for Christmas....	approved	\N	\N
1182	2	2	102	2013	2013-12-23	2013-12-24	Personal Work	approved	\N	\N
1183	8	1	102	2013	2013-12-25	2013-12-25	Personal Work	approved	\N	\N
1185	9	4	128	2013	2013-12-23	2013-12-26	Christmas holidays	approved	\N	\N
1190	5	0.5	102	2013	2013-12-20	2013-12-20	Bank Work	approved	\N	\N
1176	5	0.5	139	2013	2013-12-19	2013-12-19	Not Feeling Well	approved	\N	\N
1202	8	1	143	2013	2013-12-25	2013-12-25	For Christmas celebration	approved	\N	\N
1201	8	1	138	2013	2013-12-25	2013-12-25	christmas	approved	\N	\N
1172	5	0.5	128	2013	2013-12-20	2013-12-20	Personal Reason	approved	\N	\N
1177	5	1	145	2013	2013-12-20	2013-12-20	Hi,\r\n To receive friend i have to go yeswanthpura railway station. So please consider ...\r\n\r\nThanks \r\n  	approved	\N	\N
1198	5	0.5	44	2013	2013-12-24	2013-12-24	Going to native by train at 5 pm.	approved	\N	\N
1191	5	0.5	29	2013	2013-12-20	2013-12-20	Going to native	approved	\N	\N
1178	5	0.5	117	2013	2013-12-20	2013-12-20	Personal Reason	approved	\N	\N
1146	8	2	44	2013	2013-12-25	2013-12-26	Going to native.	approved	\N	\N
1147	2	1	44	2013	2013-12-27	2013-12-27	Going to native	approved	\N	\N
1153	5	3	87	2013	2013-12-27	2013-12-31	Going to my native for Christmas...	approved	\N	\N
1129	2	2	37	2013	2013-12-30	2013-12-31	I will go to the Temple	approved	\N	\N
1192	1	1.5	140	2013	2013-12-19	2013-12-20	 I was suffered from throat pain and cold	approved	\N	\N
1174	2	2	149	2013	2013-12-12	2013-12-13	health issue	approved	\N	\N
1175	2	1	149	2013	2013-12-11	2013-12-11	health issue	approved	\N	\N
1187	8	2	117	2013	2013-12-25	2013-12-26	Going to native	approved	\N	\N
1188	2	1	117	2013	2013-12-27	2013-12-27	Going to native	approved	\N	\N
1194	1	2	156	2013	2013-12-16	2013-12-17	fever	approved	\N	\N
1195	8	1	140	2013	2013-12-25	2013-12-25	Going to my native place	approved	\N	\N
1196	2	2	140	2013	2013-12-26	2013-12-27	Going to my native place	approved	\N	\N
1170	5	0.5	109	2013	2013-12-25	2013-12-25	Going to native. Bus at 6PM.	approved	\N	\N
1160	2	4	109	2013	2013-12-26	2013-12-31	Cousin's marriage. Going to home town.	approved	\N	\N
1204	2	2	31	2013	2013-12-12	2013-12-13	I was suffering from fever.	approved	\N	\N
1205	8	1	37	2013	2013-12-25	2013-12-25	I will going to native place	approved	\N	\N
2258	5	0.5	51	2014	2014-10-03	2014-10-03	For festival	approved	\N	\N
2259	8	1	176	2014	2014-10-03	2014-10-03	festival	approved	\N	\N
2285	2	1	68	2014	2014-10-13	2014-10-13	Personal Work	approved	\N	\N
2264	8	1	170	2014	2014-10-06	2014-10-06	Bakrid	approved	\N	\N
2280	1	1	117	2014	2014-10-08	2014-10-08	Cold and fever	approved	\N	\N
2274	2	8	52	2014	2014-09-25	2014-10-07	I was out of station.	approved	\N	\N
2298	5	0.5	102	2014	2014-10-14	2014-10-14	Going to hospital	approved	\N	\N
2330	5	1	162	2014	2014-10-16	2014-10-16	Due to accident	approved	\N	\N
2266	1	1	77	2014	2014-10-06	2014-10-06	Due to illness	approved	\N	\N
2346	1	1	87	2014	2014-10-20	2014-10-20	Not felt well.	approved	\N	\N
2343	2	1	31	2014	2014-10-22	2014-10-22	Diwali celebration.	cancelled	\N	\N
2294	2	10	41	2014	2014-10-20	2014-10-31	Going to Native for Diwali Vacation.	cancelled	\N	\N
2313	5	1	160	2014	2014-10-24	2014-10-24	Going Home for Diwali.	approved	\N	\N
2270	2	1	111	2014	2014-10-24	2014-10-24	On behalf of Diwali going to native.	approved	\N	\N
2338	8	1	109	2014	2014-10-23	2014-10-23	diwali festival	cancelled	\N	\N
2300	1	1	140	2014	2014-10-13	2014-10-13	Not feeling well	approved	\N	\N
2339	1	2	111	2014	2014-10-16	2014-10-17	I was Not Feeling Well.	approved	\N	\N
2334	5	0.5	142	2014	2014-10-17	2014-10-17	Personal work	approved	\N	\N
2317	1	2	41	2014	2014-10-07	2014-10-08	Due to fever 	approved	\N	\N
2320	8	1	71	2014	2014-11-04	2014-11-04	Out of station	approved	\N	\N
2834	2	1	87	2015	2015-01-02	2015-01-02	Went to native for Christmas & new year vacation.	approved	2015-01-06 11:28:43.159241	2015-01-06 14:17:33.478526
2829	2	2	99	2014	2014-12-30	2014-12-31	Personal	approved	2015-01-06 05:27:13.429367	2015-01-09 07:35:14.781056
2987	5	0.5	187	2015	2015-02-06	2015-02-06	Eye check-up appointment.	approved	2015-02-06 07:48:12.37706	2015-02-09 09:10:04.447278
2992	2	1	51	2015	2015-02-09	2015-02-09	For my brother marriage	approved	2015-02-06 13:25:47.673292	2015-02-19 06:00:11.195873
2985	5	0.5	99	2015	2015-02-06	2015-02-06	Personal Work.	approved	2015-02-06 06:23:27.246603	2015-02-19 06:00:17.588951
2993	2	4	91	2015	2015-02-10	2015-02-13	Going to home	approved	2015-02-08 10:13:46.914671	2015-02-24 04:27:52.142965
3819	8	1	151	2015	2015-09-17	2015-09-17	Going my native for festival	cancelled	2015-09-08 09:00:25.887812	2015-09-16 06:24:31.593613
3815	1	1	133	2015	2015-09-07	2015-09-07	I am not feeling well	approved	2015-09-08 04:31:08.572718	2015-09-16 10:23:06.563631
4065	1	1	72	2015	2015-10-23	2015-10-23	Not well	approved	2015-10-26 07:25:23.192624	2015-10-26 10:13:33.060966
4068	5	1	98	2015	2015-10-26	2015-10-26	Went Native due to some personal reason.	approved	2015-10-27 05:27:26.911817	2015-10-27 05:35:05.645254
4074	5	0.5	41	2015	2015-10-20	2015-10-20	Due to Cold.	approved	2015-10-27 06:06:31.2793	2015-11-24 08:16:02.89991
1206	8	1	142	2013	2013-12-25	2013-12-25	For celebrating Christmas with friends	approved	\N	\N
2261	1	1	133	2014	2014-10-03	2014-10-03	I am not feeling well	approved	\N	\N
2267	1	1	94	2014	2014-10-06	2014-10-06	Not Well	approved	\N	\N
2277	2	1	68	2014	2014-10-10	2014-10-10	Personal Work	cancelled	\N	\N
2271	2	1	169	2014	2014-10-06	2014-10-06	Bank work	approved	\N	\N
2276	5	0.5	144	2014	2014-10-09	2014-10-09	I am going to Hospital.	approved	\N	\N
2289	5	0.5	147	2014	2014-10-10	2014-10-10	personal work	approved	\N	\N
2295	2	2	178	2014	2014-10-17	2014-10-20	Regarding temple visit. 	approved	\N	\N
2304	5	0.5	165	2014	2014-10-14	2014-10-14	Fever and cold...	approved	\N	\N
2336	8	1	188	2014	2014-10-23	2014-10-23	home	approved	\N	\N
2315	2	2	60	2014	2014-10-23	2014-10-24	diwali	cancelled	\N	\N
2342	5	1	208	2014	2014-10-15	2014-10-15	My Sister coming from AP so I need go pick-up her in Bus stand.	approved	\N	\N
2344	8	1	31	2014	2014-10-23	2014-10-23	Diwali celebration.	cancelled	\N	\N
2314	2	3	30	2014	2014-10-22	2014-10-24	Diwali	approved	\N	\N
2348	2	1	171	2014	2014-10-24	2014-10-24	Personal Work	approved	\N	\N
2347	8	1	171	2014	2014-10-23	2014-10-23	On eve of Deepavali	approved	\N	\N
2349	8	1	99	2014	2014-10-23	2014-10-23	Diwali	approved	\N	\N
2324	2	2	71	2014	2014-11-07	2014-11-10	Out of station	approved	\N	\N
2833	8	1	87	2015	2015-01-01	2015-01-01	Went to native for Christmas & new year vacation.	approved	2015-01-06 11:28:15.302873	2015-01-06 14:17:37.588398
2831	2	1	99	2015	2015-01-02	2015-01-02	Personal	approved	2015-01-06 05:28:07.680183	2015-01-13 12:21:59.383612
2830	8	1	99	2015	2015-01-01	2015-01-01	Personal.	approved	2015-01-06 05:27:42.301421	2015-01-13 12:22:14.73147
2986	1	3	198	2015	2015-02-03	2015-02-05	I met an accident and was hospitalised.	approved	2015-02-06 06:55:30.121833	2015-02-06 06:56:53.148203
2984	2	1	168	2015	2015-02-09	2015-02-09	sister marriage	approved	2015-02-06 06:21:58.564246	2015-02-09 09:10:06.469247
2995	5	0.5	101	2015	2015-02-09	2015-02-09	Sick	approved	2015-02-09 08:23:33.775528	2015-02-09 09:10:09.74155
2997	2	1	45	2015	2015-02-09	2015-02-09	Wedding Anniversary	approved	2015-02-10 03:14:58.07864	2015-02-19 06:00:43.403731
2989	2	1	117	2015	2015-02-16	2015-02-16	Pooja at home	approved	2015-02-06 10:40:28.221799	2015-03-06 07:05:24.473129
2990	2	1	117	2015	2015-02-23	2015-02-23	Cousins wedding	approved	2015-02-06 10:41:02.865907	2015-03-06 07:05:54.812486
3816	1	1	98	2015	2015-09-07	2015-09-07	Not feeling well	approved	2015-09-08 05:05:02.988185	2015-09-28 07:42:22.426746
4028	8	1	201	2015	2015-10-22	2015-10-22	Going to Native place for personal work.	approved	2015-10-19 13:12:04.938841	2015-10-26 09:59:53.401531
1207	8	2	108	2013	2013-12-25	2013-12-26	Festival holiday	approved	\N	\N
2262	8	0.5	176	2014	2014-10-06	2014-10-06	It became late To reach office due to delay by train as I am coming from my home town.	cancelled	\N	\N
2272	8	1	48	2014	2014-10-03	2014-10-03	For Dhasara. leave has been already taken, applying in EDMS.	approved	\N	\N
2281	1	1	68	2014	2014-10-10	2014-10-10	Personal Work	cancelled	\N	\N
2284	1	1	68	2014	2014-10-13	2014-10-13	Personal Work	cancelled	\N	\N
2226	8	1	170	2014	2014-10-03	2014-10-03	Navami	approved	\N	\N
2268	8	1	55	2014	2014-10-03	2014-10-03	Went to Native	approved	\N	\N
2297	1	1	94	2014	2014-10-10	2014-10-10	minor injury	approved	\N	\N
2303	5	1	165	2014	2014-10-14	2014-10-14	Not feeling well..\r\nCold and fever...	cancelled	\N	\N
2273	3	5	52	2014	2014-09-18	2014-09-24	My grandfather had passed away.	approved	\N	\N
2302	1	1	31	2014	2014-10-13	2014-10-13	I'm not feeling well	approved	\N	\N
2301	1	0.5	70	2014	2014-10-14	2014-10-14	Not feeling well.	approved	\N	\N
2309	1	1	94	2014	2014-10-14	2014-10-14	fever	approved	\N	\N
2325	5	0.5	165	2014	2014-10-15	2014-10-15	Not well.	approved	\N	\N
2332	8	1	80	2014	2014-10-23	2014-10-23	Diwali festival celebration.	approved	\N	\N
2333	5	0.5	133	2014	2014-10-17	2014-10-17	i am going to hospital	approved	\N	\N
2335	2	2	188	2014	2014-10-20	2014-10-21	home	approved	\N	\N
2312	8	1	160	2014	2014-10-23	2014-10-23	Going Home for Diwali.	approved	\N	\N
2269	8	1	111	2014	2014-10-23	2014-10-23	On Behalf of Diwali.	approved	\N	\N
2337	2	2	187	2014	2014-10-21	2014-10-22	Function	approved	\N	\N
2308	8	1	59	2014	2014-10-23	2014-10-23	As available optional leave	approved	\N	\N
2345	2	1	31	2014	2014-10-24	2014-10-24	Diwali celebration.	approved	\N	\N
2328	2	2	177	2014	2014-10-23	2014-10-24	Going home for Diwali	approved	\N	\N
2321	8	1	71	2014	2014-11-06	2014-11-06	Out of station	approved	\N	\N
2307	2	2	163	2014	2014-11-14	2014-11-17	Going to native for Friend's Marriage	approved	\N	\N
2832	1	1	145	2015	2015-01-02	2015-01-02	Not well.	approved	2015-01-06 08:45:48.216767	2015-01-06 14:17:42.291827
2988	5	0.5	144	2015	2015-02-06	2015-02-06	I have personal work.	approved	2015-02-06 08:20:25.106884	2015-02-06 13:26:04.085067
3007	5	2	168	2015	2015-02-12	2015-02-13	health problem	approved	2015-02-16 05:14:19.784646	2015-02-16 11:26:35.736382
3004	3	5	147	2015	2015-02-02	2015-02-06	My grandfather expired 	approved	2015-02-16 04:16:10.523022	2015-02-16 11:36:35.595301
2991	5	1	211	2015	2015-02-05	2015-02-05	urgent work.	approved	2015-02-06 13:04:10.092812	2015-02-16 14:20:17.293234
3245	2	1	151	2015	2015-04-06	2015-04-06	My grand-mother passed away 	approved	2015-04-07 07:17:35.232164	2015-04-07 09:03:51.901248
3250	5	0.5	145	2015	2015-04-08	2015-04-08	Not Well....	approved	2015-04-08 08:32:20.847955	2015-04-10 10:03:33.783019
3266	5	1	191	2015	2015-04-14	2015-04-14	Was not feeling well.	cancelled	2015-04-14 08:44:51.396301	2015-04-14 08:46:18.562222
3265	5	0.5	95	2015	2015-04-14	2015-04-14	Going to cousins place.	approved	2015-04-14 07:12:11.657237	2015-04-15 08:36:30.016577
3261	8	2	102	2015	2015-04-14	2015-04-15	Going to hometown	approved	2015-04-13 04:56:29.391695	2015-04-15 08:36:38.356321
3268	5	1	87	2015	2015-04-13	2015-04-13	Personal Work.	approved	2015-04-14 10:35:32.515272	2015-04-15 08:37:07.046919
3270	8	1	212	2015	2015-04-14	2015-04-14	Tamil New Year	approved	2015-04-15 04:56:27.511466	2015-04-17 11:24:03.78149
3263	5	0.5	222	2015	2015-04-13	2015-04-13	I am not feeling well	approved	2015-04-13 07:31:10.298823	2015-04-17 11:27:10.881634
3233	8	2	163	2015	2015-04-14	2015-04-15	Going to Native	approved	2015-04-04 08:11:46.21256	2015-04-22 11:58:06.423106
3260	5	0.5	51	2015	2015-04-10	2015-04-10	For Ankle pain	approved	2015-04-10 07:58:43.438279	2015-04-22 12:07:06.309185
3282	5	0.5	52	2015	2015-04-21	2015-04-21	I have some personal work.	approved	2015-04-21 07:23:57.149402	2015-04-22 12:07:18.994438
3292	4	1	40	2015	2015-04-21	2015-04-21	_	approved	2015-04-22 11:59:49.066035	2015-04-22 12:09:05.693353
3306	5	0.5	80	2015	2015-04-24	2015-04-24	As i have some personal work.	approved	2015-04-24 06:54:31.529938	2015-04-24 10:46:57.33913
3273	5	0.5	128	2015	2015-04-16	2015-04-16	Personal Work	approved	2015-04-15 14:00:45.133718	2015-04-24 10:47:21.452563
3299	5	0.5	99	2015	2015-04-16	2015-04-16	Personal issue.	approved	2015-04-24 04:36:35.941481	2015-04-24 11:17:26.907784
3301	5	0.5	134	2015	2015-04-24	2015-04-24	Going to chennai.	approved	2015-04-24 05:00:26.576367	2015-04-24 11:43:19.020332
3246	2	1	140	2015	2015-04-06	2015-04-06	Went to native place	approved	2015-04-07 09:12:20.614025	2015-05-05 16:07:59.231681
3276	1	1	201	2015	2015-04-20	2015-04-20	personal work	approved	2015-04-17 13:25:53.485762	2015-05-21 10:58:22.488999
3240	2	7	143	2015	2015-05-28	2015-06-05	Have an important ritual at my home.	approved	2015-04-06 12:02:22.851398	2015-05-28 05:11:28.491936
3817	5	0.5	101	2015	2015-09-08	2015-09-08	sick	approved	2015-09-08 07:35:44.722456	2015-09-16 10:22:56.713868
3818	2	3	98	2015	2015-09-23	2015-09-25	Going to Native	cancelled	2015-09-08 08:14:38.368101	2015-09-28 05:32:44.472863
4075	8	1	176	2015	2015-10-21	2015-10-21	festival	approved	2015-10-27 06:38:37.449786	2015-10-27 07:20:07.174949
4106	8	1	217	2015	2015-11-11	2015-11-11	Deepavali festival	cancelled	2015-11-04 04:44:18.683683	2015-11-04 15:21:54.636647
4116	3	2	169	2015	2015-11-03	2015-11-04	Grandmother expired	approved	2015-11-05 07:27:09.314867	2015-11-05 08:59:44.896313
4123	2	2	196	2015	2015-11-09	2015-11-10	festival	approved	2015-11-06 10:48:49.285398	2015-11-09 10:44:33.374784
4114	2	1	209	2015	2015-11-04	2015-11-04	I was not feeling well.	approved	2015-11-05 05:06:43.725862	2015-11-10 06:38:53.01427
4158	8	1	221	2015	2015-11-11	2015-11-11	Deepawali	Pending	2015-11-10 12:59:35.600872	2015-11-10 12:59:35.600872
4160	8	1	90	2015	2015-11-11	2015-11-11	Diwali festival.	Pending	2015-11-10 13:39:13.018947	2015-11-10 13:39:13.018947
4151	2	2	258	2015	2015-11-10	2015-11-11	Diwali function	approved	2015-11-10 02:24:54.545008	2015-11-12 05:35:29.147052
4146	2	1	201	2015	2015-11-10	2015-11-10	Personal Work	approved	2015-11-09 12:16:36.314416	2015-11-12 05:37:12.315911
4122	2	1	117	2015	2015-11-10	2015-11-10	Festival-Deepavali	approved	2015-11-06 09:43:45.370234	2015-11-12 05:37:49.309793
4154	2	1	242	2015	2015-11-16	2015-11-16	I am going to my hometown.	approved	2015-11-10 08:14:53.760327	2015-11-12 06:02:54.805921
4163	1	1	187	2015	2015-11-10	2015-11-10	Sick	approved	2015-11-12 05:31:51.63366	2015-11-20 05:29:23.35191
4164	5	1	214	2015	2015-11-10	2015-11-10	Personal Work	approved	2015-11-12 05:54:23.233167	2015-11-20 09:53:24.844493
4131	2	1	131	2015	2015-08-21	2015-08-21	Personal	approved	2015-11-06 12:51:24.187136	2015-11-24 08:13:49.076532
4161	8	1	218	2015	2015-11-11	2015-11-11	Deepavali.	approved	2015-11-10 18:20:24.67472	2015-11-24 08:14:55.101771
4184	5	1	72	2015	2015-11-17	2015-11-17	Not Feeling well	approved	2015-11-18 05:50:16.746998	2015-11-24 08:15:29.441388
4136	5	1.5	197	2015	2015-11-02	2015-11-03	Sick	approved	2015-11-09 04:45:44.185796	2015-11-24 08:15:46.150261
4168	8	1	197	2015	2015-11-11	2015-11-11	Diwali Celebration	approved	2015-11-13 07:18:20.117626	2015-11-24 08:15:50.371484
4119	2	1	51	2015	2015-11-16	2015-11-16	For my cousin sister marriage	approved	2015-11-05 08:43:58.814647	2015-11-24 08:16:25.748828
4196	1	1	226	2015	2015-11-10	2015-11-10	Sick	approved	2015-11-20 11:14:48.589183	2015-11-24 10:35:57.832077
4197	8	1	226	2015	2015-11-11	2015-11-11	unwell	approved	2015-11-20 11:15:22.928684	2015-11-24 10:36:03.365922
4171	1	1	159	2015	2015-11-16	2015-11-16	cold and fever	approved	2015-11-16 03:45:16.378123	2015-11-30 06:16:03.137712
4150	2	3	177	2015	2015-11-11	2015-11-13	Going native for Diwali.	approved	2015-11-09 14:30:42.547674	2015-11-30 07:04:19.511516
4090	2	3	45	2015	2015-10-12	2015-10-14	not feeling well	approved	2015-10-27 13:38:25.829811	2015-11-30 09:00:16.371698
4091	8	1	45	2015	2015-10-21	2015-10-21	went to hospital	approved	2015-10-27 13:39:02.122454	2015-11-30 09:00:19.614812
1208	2	1	108	2013	2013-12-27	2013-12-27	Outing	approved	\N	\N
2283	2	1	68	2014	2014-10-10	2014-10-10	Personal Work	approved	\N	\N
2291	5	0.5	142	2014	2014-10-10	2014-10-10	Suffering from cold and cough.	approved	\N	\N
2288	1	1	48	2014	2014-10-09	2014-10-09	Not well	approved	\N	\N
2275	2	3	70	2014	2014-10-23	2014-10-27	For Diwali festival and for cousin sister engagement.	approved	\N	\N
2311	1	1	63	2014	2014-10-09	2014-10-09	Suffering from Fever & Headache	approved	\N	\N
2331	9	1	80	2014	2014-10-22	2014-10-22	As i have Personal work.	approved	\N	\N
2327	2	2	187	2014	2014-10-27	2014-10-28	Function	cancelled	\N	\N
2305	2	6	49	2014	2014-10-24	2014-10-31	Going to native. 	approved	\N	\N
2319	5	0.5	99	2014	2014-10-16	2014-10-16	Personal Work.	approved	\N	\N
2835	1	1	80	2015	2015-01-05	2015-01-05	As I was not feeling well.	approved	2015-01-06 13:15:25.822025	2015-01-06 14:17:39.605404
2836	2	1	170	2015	2015-01-02	2015-01-02	personal work.	approved	2015-01-07 07:51:30.57323	2015-01-07 10:10:11.944636
2848	5	0.5	134	2015	2015-01-09	2015-01-09	Going to Chennai.	approved	2015-01-09 06:44:26.983039	2015-01-09 06:58:38.730667
2841	2	5	133	2015	2015-01-12	2015-01-16	i am going to native.	approved	2015-01-07 13:48:46.758207	2015-01-09 06:58:48.481413
2816	8	1	191	2014	2014-12-31	2014-12-31	Personal work.	cancelled	2015-01-06 04:29:54.268746	2015-01-13 06:15:17.985874
2871	5	0.5	162	2015	2015-01-12	2015-01-12	got late	approved	2015-01-13 12:21:52.075479	2015-01-13 12:22:18.152378
2872	2	3	162	2015	2015-01-14	2015-01-16	not well\r\n	approved	2015-01-13 12:52:17.914814	2015-01-13 12:54:38.600916
2850	8	1	209	2015	2015-01-15	2015-01-15	for Pongal	approved	2015-01-09 09:02:52.013712	2015-01-14 05:19:35.683108
2843	8	1	70	2015	2015-01-01	2015-01-01	For New Year.	approved	2015-01-08 16:58:07.958717	2015-01-20 13:35:16.31006
2855	2	1	31	2015	2015-01-14	2015-01-14	Pongal celebration.	approved	2015-01-09 14:03:06.151969	2015-01-20 13:35:51.697023
2845	8	1	70	2014	2014-12-25	2014-12-25	Personal work.	approved	2015-01-08 17:00:02.835538	2015-01-21 09:15:07.004723
2877	5	0.5	209	2015	2015-01-14	2015-01-14	Going Home	approved	2015-01-14 05:20:13.889955	2015-01-27 09:31:54.853332
2852	2	3	179	2015	2015-01-12	2015-01-14	Going to my native	approved	2015-01-09 09:46:12.937008	2015-02-04 07:25:22.812451
2994	1	1	169	2015	2015-02-06	2015-02-06	Teeth pain	approved	2015-02-09 04:41:48.905967	2015-02-09 05:13:49.32388
2996	1	1	196	2015	2015-02-06	2015-02-06	fever	approved	2015-02-09 14:33:23.335961	2015-02-10 05:19:13.120862
3008	2	2	144	2015	2015-02-19	2015-02-20	I have personal work.	approved	2015-02-16 09:09:11.414465	2015-02-16 10:44:32.952504
3006	2	3	147	2015	2015-02-11	2015-02-13	my grandfather expired	approved	2015-02-16 04:17:45.997562	2015-02-16 11:36:37.67193
3005	3	2	147	2015	2015-02-09	2015-02-10	my grandfather expired	approved	2015-02-16 04:16:52.919965	2015-02-18 07:30:17.08037
3244	3	7	151	2015	2015-03-28	2015-04-03	My grand-mother passed away 	approved	2015-04-07 07:16:24.805013	2015-04-07 09:03:53.389914
3249	5	0.5	91	2015	2015-04-08	2015-04-08	Personal work	cancelled	2015-04-08 04:54:28.914023	2015-04-08 09:11:47.094445
3254	1	2	212	2015	2015-04-06	2015-04-07	Food Poisoning	approved	2015-04-09 05:55:40.237133	2015-04-17 11:17:39.388059
3251	1	1	209	2015	2015-04-09	2015-04-09	Not feeling well	approved	2015-04-09 04:30:26.430812	2015-04-17 11:21:31.694584
3235	2	2	163	2015	2015-04-16	2015-04-17	Going to Native	approved	2015-04-04 08:12:53.131742	2015-04-22 11:57:59.980766
3234	2	1	163	2015	2015-04-13	2015-04-13	Going to Native	approved	2015-04-04 08:12:27.343199	2015-04-22 11:58:02.280759
3247	2	1	178	2015	2015-04-06	2015-04-06	Out of station	approved	2015-04-07 12:44:57.381064	2015-04-22 12:07:55.650205
3255	2	1	218	2015	2015-04-06	2015-04-06	Outstation travel.	approved	2015-04-09 12:22:08.115215	2015-04-22 12:08:50.815457
3296	9	1	142	2015	2015-04-30	2015-04-30	personal work	approved	2015-04-23 08:28:46.167608	2015-04-24 10:47:29.736976
3236	2	6	91	2015	2015-05-25	2015-06-01	Home Function	approved	2015-04-06 05:15:24.767459	2015-06-23 06:12:25.062381
3262	2	2	94	2015	2015-04-16	2015-04-17	Going to hometown	approved	2015-04-13 05:02:24.87019	2015-04-24 11:18:23.578227
3303	5	0.5	87	2015	2015-04-30	2015-04-30	Going to home town.	cancelled	2015-04-24 05:08:12.045595	2015-04-25 03:55:30.864215
3281	5	1	77	2015	2015-04-13	2015-04-13	Personal work	approved	2015-04-21 05:32:08.324314	2015-04-27 05:06:13.0214
3820	2	1	151	2015	2015-09-18	2015-09-18	Going my native for festival	cancelled	2015-09-08 09:00:55.435053	2015-09-16 06:24:33.581796
4076	8	1	176	2015	2015-10-22	2015-10-22	festival	approved	2015-10-27 06:39:14.500823	2015-10-27 07:18:50.15756
4077	2	1	176	2015	2015-10-23	2015-10-23	festival	approved	2015-10-27 06:40:48.045692	2015-10-27 07:18:56.517006
4086	2	2	245	2015	2015-11-09	2015-11-10	Diwali Festival	cancelled	2015-10-27 07:33:18.226586	2015-10-27 07:54:44.367965
4080	5	1	143	2015	2015-10-14	2015-10-14	Not well.	approved	2015-10-27 07:12:12.097902	2015-10-27 11:10:24.121012
4103	1	1	265	2015	2015-11-02	2015-11-02	Sore throat and body pain.	approved	2015-11-03 09:23:34.761218	2015-11-03 10:02:36.297129
4112	1	1	90	2015	2015-11-04	2015-11-04	Not feeling well.	Pending	2015-11-04 08:01:22.736691	2015-11-04 08:01:22.736691
4117	1	1	151	2015	2015-11-04	2015-11-04	I was not feeling well	approved	2015-11-05 08:32:52.151263	2015-11-05 08:59:40.626419
4115	2	1	247	2015	2015-11-04	2015-11-04	Owing to my Grand mother's illness, she is being hospitalized in serious condition. my presence is needed there. So please accept my request for leave.\r\n	approved	2015-11-05 05:28:52.381228	2015-11-07 07:55:31.684095
4097	2	1	224	2015	2015-10-27	2015-10-27	because mother was not well.	approved	2015-11-02 05:16:34.781872	2015-11-09 10:25:40.917856
4124	8	1	196	2015	2015-11-11	2015-11-11	festival	approved	2015-11-06 10:49:18.695241	2015-11-09 10:44:38.518939
4125	8	1	209	2015	2015-11-11	2015-11-11	Going Home for Diwali.	approved	2015-11-06 11:27:27.178314	2015-11-12 05:32:52.212128
4139	8	1	235	2015	2015-11-11	2015-11-11	Diwali	approved	2015-11-09 09:54:30.887075	2015-11-12 05:34:27.884413
4105	2	2	230	2015	2015-11-12	2015-11-13	Diwali celebrations	approved	2015-11-03 10:04:54.155716	2015-11-12 06:02:29.557443
4180	2	2	253	2015	2015-12-01	2015-12-02	To attend brother's marriage	Pending	2015-11-16 11:04:32.158375	2015-11-16 11:04:32.158375
4133	2	2	133	2015	2015-11-09	2015-11-10	I am going to native	approved	2015-11-06 13:58:25.906893	2015-11-20 05:29:31.361137
4149	2	14	142	2015	2015-11-13	2015-12-02	celebrating chhath puja	approved	2015-11-09 14:16:50.078663	2015-11-24 07:23:41.433218
4170	8	1	40	2015	2015-11-11	2015-11-11	Diwali Optional Leave	approved	2015-11-13 07:20:55.979438	2015-11-24 08:13:11.982159
4169	1	2	40	2015	2015-11-02	2015-11-03	Was Sick	approved	2015-11-13 07:20:29.112081	2015-11-24 08:13:18.331476
4128	2	1	131	2015	2015-08-06	2015-08-06	Personal	approved	2015-11-06 12:49:26.178264	2015-11-24 08:13:53.499778
4083	1	1	52	2015	2015-10-01	2015-10-01	I was unwell.	approved	2015-10-27 07:31:44.439292	2015-11-24 08:15:54.454953
4118	8	1	51	2015	2015-11-11	2015-11-11	For diwali	approved	2015-11-05 08:43:04.81393	2015-11-24 08:16:30.192012
4219	5	1	178	2015	2015-11-27	2015-11-27	out of station 	Pending	2015-11-24 10:41:07.101187	2015-11-24 10:41:07.101187
4193	5	0.5	101	2015	2015-11-20	2015-11-20	Sick	approved	2015-11-20 07:37:04.244582	2015-11-25 04:38:35.15483
4207	2	5	187	2015	2015-11-30	2015-12-04	Going home.	approved	2015-11-23 13:45:08.892069	2015-11-25 04:38:38.538794
4230	5	0.5	151	2015	2015-11-26	2015-11-26	Got some work	approved	2015-11-26 07:24:27.230118	2015-11-26 07:47:01.552281
4191	1	1	220	2015	2015-11-13	2015-11-13	Not Well	approved	2015-11-19 12:53:38.425131	2015-11-30 04:34:07.574928
4186	8	1	71	2015	2015-11-11	2015-11-11	Diwali	approved	2015-11-18 05:58:36.625808	2015-11-30 04:59:56.081587
4244	2	1	222	2015	2015-11-23	2015-11-23	Not Well	approved	2015-11-30 06:55:28.008188	2015-11-30 06:55:28.008188
4261	5	0.5	242	2015	2015-11-27	2015-11-27	I am leaving to home town.	approved	2015-12-02 06:58:52.298344	2015-12-02 07:00:10.901419
4262	5	0.5	131	2015	2015-12-02	2015-12-02	Travel	Pending	2015-12-02 08:35:23.956697	2015-12-02 08:35:23.956697
4222	2	1	222	2015	2015-11-16	2015-11-16	I was not feeling well	approved	2015-11-25 04:17:29.318558	2015-12-22 10:12:04.890126
1217	8	1	36	2013	2013-12-25	2013-12-25	festival	approved	\N	\N
1133	2	8	49	2013	2013-12-20	2013-12-31	Going to my native.	approved	\N	\N
1197	1	1	63	2013	2013-12-20	2013-12-20	Not feeling well. Fever, cough & cold	approved	\N	\N
1230	8	1	72	2013	2013-12-25	2013-12-25	Christmas	approved	\N	\N
1220	1	2	144	2013	2013-12-23	2013-12-24	accident	approved	\N	\N
1221	8	1	144	2013	2013-12-25	2013-12-25	Christmas 	approved	\N	\N
1219	5	0.5	52	2013	2013-12-25	2013-12-25	I have some personal work.	approved	\N	\N
1214	1	1	159	2013	2013-12-24	2013-12-24	sick	approved	\N	\N
1218	8	1	90	2013	2013-12-25	2013-12-25	Optional Leave	approved	\N	\N
1227	8	1	127	2013	2013-12-31	2013-12-31	Optional New Year.	cancelled	\N	\N
1228	8	1	127	2014	2014-01-01	2014-01-01	Optional New Year.	cancelled	\N	\N
1212	2	0.5	51	2013	2013-12-24	2013-12-24	Having some personal work	approved	\N	\N
1211	2	0.5	51	2013	2013-12-23	2013-12-23	Had some personal work	approved	\N	\N
1213	8	1	51	2013	2013-12-25	2013-12-25	For Christmas	approved	\N	\N
1232	8	1	127	2013	2013-12-25	2013-12-25	Christmas optional	approved	\N	\N
1216	5	0.5	131	2013	2013-12-24	2013-12-24	not feeling well	approved	\N	\N
1209	8	1	52	2013	2013-12-26	2013-12-26	Post Christmas	approved	\N	\N
1236	5	0.5	138	2013	2013-12-27	2013-12-27	Personal 	approved	\N	\N
1244	2	2	59	2013	2013-12-27	2013-12-30	As I am facing severe family problems in my life,I am not able to come to office.	approved	\N	\N
1243	8	2	59	2013	2013-12-25	2013-12-26	As available optional leave.	approved	\N	\N
1242	1	1	59	2013	2013-12-24	2013-12-24	As I was not feeling good,\r\nI took leave.	approved	\N	\N
1245	1	1	94	2013	2013-12-24	2013-12-24	out of station	approved	\N	\N
1247	1	1.5	101	2013	2013-12-26	2013-12-27	Sick	approved	\N	\N
1241	5	0.5	125	2013	2013-12-27	2013-12-27	not well	approved	\N	\N
1240	5	0.5	123	2013	2013-12-17	2013-12-17	fever	approved	\N	\N
1237	5	0.5	37	2013	2013-12-27	2013-12-27	Some personal work is there	approved	\N	\N
1229	2	1	127	2013	2013-12-30	2013-12-30	Going out of station.	approved	\N	\N
1215	2	1	95	2013	2013-12-27	2013-12-27	personal	approved	\N	\N
1231	2	1	55	2013	2013-12-27	2013-12-27	personal	approved	\N	\N
1156	5	2	70	2013	2013-12-27	2013-12-30	Having pooja at home and need to attend my cousin sister's marriage.	approved	\N	\N
1225	2	2	80	2013	2013-12-30	2013-12-31	As I have some personal work.	approved	\N	\N
1224	2	1	80	2013	2013-12-27	2013-12-27	I have some personal work.	approved	\N	\N
1256	2	1	60	2013	2013-12-30	2013-12-30	sick	approved	\N	\N
1222	2	3	98	2014	2014-01-15	2014-01-17	Going Native	cancelled	\N	\N
1210	8	1	52	2013	2013-12-31	2013-12-31	New Year's Eve	approved	\N	\N
1233	8	1	55	2013	2013-12-31	2013-12-31	going to native	approved	\N	\N
1234	8	1	127	2013	2013-12-31	2013-12-31	New Year.	approved	\N	\N
1238	8	1	143	2013	2013-12-31	2013-12-31	Going out of station with family for new year celebration	approved	\N	\N
1239	8	1	145	2013	2013-12-31	2013-12-31	Going to Mysore with family on new year.	approved	\N	\N
1249	8	1	95	2013	2013-12-31	2013-12-31	optional	approved	\N	\N
1281	8	1	111	2013	2013-12-31	2013-12-31	Personal work.\r\n	approved	\N	\N
1280	8	1	111	2013	2013-12-25	2013-12-25	On behalf of Christmas\r\n	approved	\N	\N
1275	8	1	120	2013	2013-12-31	2013-12-31	New year	approved	\N	\N
1274	8	1	120	2013	2013-12-25	2013-12-25	Optional leave- Christmas 	approved	\N	\N
1251	5	0.5	94	2013	2013-12-31	2013-12-31	year end celebration	approved	\N	\N
1257	5	1	68	2013	2013-12-19	2013-12-19	personal work	approved	\N	\N
1258	2	1	68	2013	2013-12-25	2013-12-25	To Attend Function 	approved	\N	\N
1253	8	1	108	2013	2013-12-31	2013-12-31	Year end leave	approved	\N	\N
1259	8	1	146	2013	2013-12-31	2013-12-31	new year celebration 	approved	\N	\N
1260	8	1	147	2013	2013-12-31	2013-12-31	new year celebration	approved	\N	\N
1263	1	1	143	2013	2013-12-30	2013-12-30	I was not well.Suffering from fever.	approved	\N	\N
1287	8	2	41	2013	2013-12-25	2013-12-26	Christmas Vacation  leave.	approved	\N	\N
1276	1	1	125	2013	2013-12-31	2013-12-31	Sick leave	approved	\N	\N
1270	1	1	102	2013	2013-12-31	2013-12-31	Fever	approved	\N	\N
1266	5	0.5	44	2014	2014-01-01	2014-01-01	I'm not feeling well	approved	\N	\N
1264	5	0.5	109	2014	2014-01-01	2014-01-01	Personal Reason	approved	\N	\N
1279	2	1	128	2014	2014-01-08	2014-01-08	Passport Appointment	cancelled	\N	\N
1226	2	1	80	2014	2014-01-01	2014-01-01	As I have some personal work.	approved	\N	\N
1285	8	1	42	2014	2014-01-01	2014-01-01	New Year.	approved	\N	\N
1283	8	1	87	2014	2014-01-01	2014-01-01	NewYear...	approved	\N	\N
1278	8	1	125	2014	2014-01-01	2014-01-01	New year- Optional	approved	\N	\N
1235	8	1	127	2014	2014-01-01	2014-01-01	New Year.	approved	\N	\N
1277	8	1	120	2014	2014-01-01	2014-01-01	New year	approved	\N	\N
1271	8	1	102	2014	2014-01-01	2014-01-01	Personal work	approved	\N	\N
1269	8	1	47	2014	2014-01-01	2014-01-01	Optional	approved	\N	\N
1268	8	1	144	2014	2014-01-01	2014-01-01	New Year celebrations 	approved	\N	\N
1265	5	1	147	2014	2014-01-01	2014-01-01	not feeling well	approved	\N	\N
1254	8	1	108	2014	2014-01-01	2014-01-01	New Year leave	approved	\N	\N
1252	8	1	94	2014	2014-01-01	2014-01-01	New Year	approved	\N	\N
1250	8	1	95	2014	2014-01-01	2014-01-01	optional	approved	\N	\N
1286	2	1	42	2014	2014-01-02	2014-01-02	I was on my native.	approved	\N	\N
1282	1	1	147	2014	2014-01-02	2014-01-02	not feeling well	approved	\N	\N
1267	2	2	68	2014	2014-01-02	2014-01-03	Going to native	approved	\N	\N
1284	2	1	87	2014	2014-01-02	2014-01-02	Went to my home-town....	approved	\N	\N
1246	2	5	72	2014	2014-01-13	2014-01-17	Going Native for Sankranti	approved	\N	\N
1261	8	1	98	2014	2014-01-15	2014-01-15	Going Native	approved	\N	\N
1262	2	2	98	2014	2014-01-16	2014-01-17	Going to Native	approved	\N	\N
1288	2	1	151	2014	2014-01-13	2014-01-13	festival celebration	approved	\N	\N
1289	8	2	151	2014	2014-01-14	2014-01-15	festival celebration	approved	\N	\N
1290	2	1	147	2014	2014-01-13	2014-01-13	for festival celebration	approved	\N	\N
1291	8	2	147	2014	2014-01-14	2014-01-15	for festival celebration	approved	\N	\N
1272	2	1	102	2014	2014-01-13	2014-01-13	Personal work	approved	\N	\N
1273	8	1	102	2014	2014-01-14	2014-01-14	Personal work	approved	\N	\N
1223	2	1	98	2014	2014-01-20	2014-01-20	Going Native	cancelled	\N	\N
1292	1	2	29	2013	2013-12-30	2013-12-31	Not feeling well	approved	\N	\N
1293	2	2	29	2014	2014-01-02	2014-01-03	for new year	approved	\N	\N
1299	8	1	29	2014	2014-01-01	2014-01-01	for new year	approved	\N	\N
1301	8	1	70	2014	2014-01-01	2014-01-01	For New Year	approved	\N	\N
1255	8	1	138	2014	2014-01-01	2014-01-01	New Year Celebration	approved	\N	\N
1302	8	1	40	2014	2014-01-01	2014-01-01	First Optional leave availed for this year!	approved	\N	\N
1303	8	1	51	2014	2014-01-01	2014-01-01	For new year	approved	\N	\N
1304	1	3	107	2014	2014-01-01	2014-01-03	not feeling well	approved	\N	\N
1308	8	1	55	2014	2014-01-01	2014-01-01	New Year	approved	\N	\N
1307	8	1	41	2014	2014-01-01	2014-01-01	New Year celebration !!!	approved	\N	\N
1306	8	1	72	2014	2014-01-01	2014-01-01	New Year	approved	\N	\N
1305	8	1	162	2014	2014-01-01	2014-01-01	new year	approved	\N	\N
1313	8	1	31	2014	2014-01-01	2014-01-01	new year celebration	approved	\N	\N
1311	8	1	71	2014	2014-01-01	2014-01-01	Out of station	approved	\N	\N
1310	8	1	45	2014	2014-01-01	2014-01-01	Personal	approved	\N	\N
1314	8	1	37	2014	2014-01-01	2014-01-01	New Year	approved	\N	\N
1312	2	2	71	2014	2014-01-02	2014-01-03	Out of station	approved	\N	\N
1319	8	1	111	2014	2014-01-01	2014-01-01	On Behalf of New Year	approved	\N	\N
1294	2	1	70	2014	2014-01-06	2014-01-06	I was in out of station.	approved	\N	\N
1329	8	2	101	2014	2014-01-14	2014-01-15	Pongal Festival	approved	\N	\N
1328	2	1	101	2014	2014-01-13	2014-01-13	Pongal festival	approved	\N	\N
1324	8	2	133	2014	2014-01-14	2014-01-15	I am going to native	approved	\N	\N
1323	2	1	133	2014	2014-01-13	2014-01-13	I am going to native	approved	\N	\N
1315	5	0.5	95	2014	2014-01-09	2014-01-09	personal work.	approved	\N	\N
1320	2	1	63	2014	2014-01-01	2014-01-01	Personal work. 	approved	\N	\N
1300	5	0.5	128	2014	2014-01-08	2014-01-08	Passport Appointment	approved	\N	\N
1333	8	1	42	2014	2014-01-14	2014-01-14	I will going to my native.	cancelled	\N	\N
1346	1	1	41	2014	2014-01-10	2014-01-10	Fever and cold 	approved	\N	\N
1337	8	1	111	2014	2014-01-15	2014-01-15	On Behalf of Sankranti festival.	approved	\N	\N
1322	2	5	99	2014	2014-01-20	2014-01-24	Need to go to shankar netralaya for father eye operation.	cancelled	\N	\N
1295	2	1	59	2014	2014-01-13	2014-01-13	Iam going to my native.	approved	\N	\N
1296	8	1	59	2014	2014-01-14	2014-01-14	As available optional leave.	approved	\N	\N
1297	2	1	87	2014	2014-01-13	2014-01-13	Due to some personal reasons....	approved	\N	\N
1298	8	1	87	2014	2014-01-14	2014-01-14	Due to some personal reasons....	approved	\N	\N
1309	2	2	55	2014	2014-01-13	2014-01-14	For Pongal festival	approved	\N	\N
1321	5	0.5	99	2014	2014-01-10	2014-01-10	personal	approved	\N	\N
1326	2	1	60	2014	2014-01-13	2014-01-13	pongal	approved	\N	\N
1327	8	1	60	2014	2014-01-14	2014-01-14	pongal	approved	\N	\N
1334	2	1	42	2014	2014-01-15	2014-01-15	I will going to my native.	approved	\N	\N
1339	8	1	49	2014	2014-01-14	2014-01-14	For Sankranti! 	approved	\N	\N
1353	2	1	80	2014	2014-01-16	2014-01-16	As i am going to my Native	approved	\N	\N
1352	8	1	139	2014	2014-01-14	2014-01-14	Festival	approved	\N	\N
1351	8	1	95	2014	2014-01-15	2014-01-15	optional.	approved	\N	\N
1350	8	1	51	2014	2014-01-15	2014-01-15	For sankratri festival	approved	\N	\N
1347	8	1	128	2014	2014-01-15	2014-01-15	For Sankranti Festival	approved	\N	\N
1343	2	3	158	2014	2014-01-14	2014-01-16	festival	approved	\N	\N
1338	2	2	159	2014	2014-01-13	2014-01-14	festival	approved	\N	\N
1325	2	2	133	2014	2014-01-16	2014-01-17	I am going to native	approved	\N	\N
1330	8	2	77	2014	2014-01-14	2014-01-15	For Pongal Festival	approved	\N	\N
1331	2	2	77	2014	2014-01-16	2014-01-17	For Pongal Festival	approved	\N	\N
1332	2	1	77	2014	2014-01-13	2014-01-13	For Pongal Festival	approved	\N	\N
1342	8	1	109	2014	2014-01-15	2014-01-15	Festival - Sankranthi	approved	\N	\N
1340	8	1	117	2014	2014-01-15	2014-01-15	Festival - Sankranti	approved	\N	\N
1349	8	1	140	2014	2014-01-15	2014-01-15	Festival Celebration	approved	\N	\N
1348	2	5	54	2014	2014-01-20	2014-01-24	Going Home for marriage	approved	\N	\N
1356	2	1	44	2014	2014-01-20	2014-01-20	Going to native.	approved	\N	\N
1372	2	1	72	2014	2014-01-20	2014-01-20	Going to RPO Office for Passport issue.	approved	\N	\N
1373	1	1	72	2014	2014-01-21	2014-01-21	Not feeling well	approved	\N	\N
1354	1	1	138	2014	2014-01-15	2014-01-15	I was not feeling well.	approved	\N	\N
1363	5	1	41	2014	2014-01-17	2014-01-17	Went RTO office to collect the Document.	approved	\N	\N
1316	8	2	146	2014	2014-01-14	2014-01-15	festival	approved	\N	\N
1317	2	1	146	2014	2014-01-13	2014-01-13	going to hometown	approved	\N	\N
1318	2	2	146	2014	2014-01-16	2014-01-17	going to hometown	approved	\N	\N
1336	8	2	123	2014	2014-01-14	2014-01-15	Pongal	approved	\N	\N
1335	2	1	123	2014	2014-01-13	2014-01-13	going to native	approved	\N	\N
1355	2	1	45	2014	2014-01-17	2014-01-17	Marriage purchase	approved	\N	\N
1341	2	2	145	2014	2014-01-20	2014-01-21	Going to attend close Friend's marriage	approved	\N	\N
1360	5	1	145	2014	2014-01-17	2014-01-17	Not well...	approved	\N	\N
1357	2	1	28	2014	2014-01-24	2014-01-24	Personal	approved	\N	\N
1358	5	0.5	94	2014	2014-01-17	2014-01-17	going to hometown	approved	\N	\N
1359	2	2	94	2014	2014-01-20	2014-01-21	going to homewtown	approved	\N	\N
1361	8	1	68	2014	2014-01-15	2014-01-15	For shrankathi	approved	\N	\N
1364	2	1	91	2014	2014-01-24	2014-01-24	personal work	approved	\N	\N
1365	2	1	146	2014	2014-01-20	2014-01-20	went home town	approved	\N	\N
1366	1	1	162	2014	2014-01-20	2014-01-20	I was not feeling well	approved	\N	\N
1374	2	1	98	2014	2014-01-21	2014-01-21	I have missed train	approved	\N	\N
1375	5	0.5	125	2014	2014-01-22	2014-01-22	Cold and fever	approved	\N	\N
1370	5	0.5	95	2014	2014-01-22	2014-01-22	personal	approved	\N	\N
1345	8	1	127	2014	2014-03-17	2014-03-17	Holi. Optional.	approved	\N	\N
1371	2	2	95	2014	2014-01-23	2014-01-24	personal reasons.	approved	\N	\N
1344	2	4	127	2014	2014-03-18	2014-03-21	Going Home for Holi.	approved	\N	\N
1368	8	1	143	2014	2014-03-17	2014-03-17	Going to native for Holi	approved	\N	\N
1369	2	4	143	2014	2014-03-18	2014-03-21	Going to native for Holi.	approved	\N	\N
1367	5	0.5	44	2014	2014-01-21	2014-01-21	personal	approved	\N	\N
1379	1	1	70	2014	2014-01-24	2014-01-24	I was not feeling well.	approved	\N	\N
1389	2	1	70	2014	2014-02-03	2014-02-03	Need to attend  marriage.	approved	\N	\N
1393	1	1	51	2014	2014-01-31	2014-01-31	I was not feeling well	approved	\N	\N
1386	1	1	72	2014	2014-01-30	2014-01-30	Not feeling well	approved	\N	\N
1380	5	0.5	52	2014	2014-01-28	2014-01-28	I have some personal work.	approved	\N	\N
1381	8	1	52	2014	2014-01-01	2014-01-01	New Year	approved	\N	\N
1390	8	1	131	2014	2014-01-01	2014-01-01	New Year	approved	\N	\N
1378	1	1	120	2014	2014-01-24	2014-01-24	Unwell	approved	\N	\N
1397	1	1	111	2014	2014-01-31	2014-01-31	Not Feeling well.	approved	\N	\N
1362	2	2	123	2014	2014-01-16	2014-01-17	going to temple	approved	\N	\N
1377	1	1	47	2014	2014-01-23	2014-01-23	Not well	approved	\N	\N
1384	1	1	94	2014	2014-01-27	2014-01-27	Not well	approved	\N	\N
1388	1	5	155	2014	2014-02-17	2014-02-21	Going for Surjery	cancelled	\N	\N
1387	5	0.5	123	2014	2014-01-31	2014-01-31	going to native	approved	\N	\N
1395	2	3	101	2014	2014-01-29	2014-01-31	Going Native	approved	\N	\N
1406	2	2	42	2014	2014-02-03	2014-02-04	Due to personal reason.	approved	\N	\N
1394	2	1	87	2014	2014-01-31	2014-01-31	Due to some personal reasons....	approved	\N	\N
1385	1	1	60	2014	2014-01-29	2014-01-29	sick	approved	\N	\N
1410	8	1	91	2014	2014-01-14	2014-01-14	Pongal	approved	\N	\N
1411	2	1	99	2014	2014-01-20	2014-01-20	Birthday	approved	\N	\N
1412	5	0.5	139	2014	2014-01-21	2014-01-21	Not well	approved	\N	\N
1413	1	1	139	2014	2014-01-22	2014-01-22	Not well	approved	\N	\N
1408	2	1	117	2014	2014-02-11	2014-02-11	Personal Work	cancelled	\N	\N
1416	2	5	120	2014	2014-02-17	2014-02-21	Going to Native 	cancelled	\N	\N
2359	1	1	147	2014	2014-10-21	2014-10-21	Not Feeling Well	approved	\N	\N
1401	1	1	154	2014	2014-02-03	2014-02-03	Sick	approved	\N	\N
1391	5	0.5	31	2014	2014-01-31	2014-01-31	Some personal work	approved	\N	\N
1376	2	1	77	2014	2014-01-24	2014-01-24	Going for personal work 	approved	\N	\N
1418	5	0.5	44	2014	2014-02-13	2014-02-13	Going to native	approved	\N	\N
1419	2	2	44	2014	2014-02-14	2014-02-17	Going to native	approved	\N	\N
1439	1	1	154	2014	2014-02-14	2014-02-14	Fever	approved	\N	\N
1440	1	1	154	2014	2014-02-17	2014-02-17	Fever	approved	\N	\N
1441	5	0.5	29	2014	2014-02-18	2014-02-18	Not feeling well	cancelled	\N	\N
1436	1	2	99	2014	2014-02-13	2014-02-14	cold&fever	approved	\N	\N
1435	1	1	145	2014	2014-02-14	2014-02-14	Not well ...fever	approved	\N	\N
1434	1	2	139	2014	2014-02-12	2014-02-13	Not feeling well	approved	\N	\N
1433	5	0.5	155	2014	2014-02-14	2014-02-14	Going Native for surgery.	approved	\N	\N
1392	2	2	91	2014	2014-02-10	2014-02-11	going to native	approved	\N	\N
1398	5	1	49	2014	2014-02-07	2014-02-07	As my few relative were coming.	approved	\N	\N
1396	5	0.5	123	2014	2014-02-03	2014-02-03	missed bus	approved	\N	\N
1407	1	1	37	2014	2014-02-07	2014-02-07	Will go to Hospital due to stomach pain	approved	\N	\N
1428	1	1	146	2014	2014-02-12	2014-02-12	fever	approved	\N	\N
1409	5	0.5	99	2014	2014-02-07	2014-02-07	Personal	approved	\N	\N
1414	2	3	55	2014	2014-02-10	2014-02-12	Marriage Function	approved	\N	\N
1422	5	0.5	102	2014	2014-02-11	2014-02-11	Personal work	approved	\N	\N
1423	1	5	144	2014	2014-02-03	2014-02-07	Viral Fever 	approved	\N	\N
1424	5	2	144	2014	2014-02-10	2014-02-11	Viral fever 	approved	\N	\N
1402	2	3	146	2014	2014-02-19	2014-02-21	marriage	approved	\N	\N
1443	2	3	146	2014	2014-03-10	2014-03-12	marriage	approved	\N	\N
1444	2	2	31	2014	2014-02-13	2014-02-14	some personal work	approved	\N	\N
1420	2	1	80	2014	2014-02-12	2014-02-12	As I have some personal work	approved	\N	\N
1421	2	0.5	51	2014	2014-02-11	2014-02-11	Due to some personal work i was absent in the first half.	approved	\N	\N
1417	1	0.5	28	2014	2014-02-10	2014-02-10	Not well	approved	\N	\N
1415	2	3	31	2014	2014-02-10	2014-02-12	Going to Native	approved	\N	\N
1445	1	1	41	2014	2014-02-17	2014-02-17	Cold and Cough 	approved	\N	\N
1450	5	0.5	87	2014	2014-02-10	2014-02-10	Due to sickness...	approved	\N	\N
1451	5	0.5	37	2014	2014-02-10	2014-02-10	Some personal work as there	approved	\N	\N
1452	5	0.5	72	2014	2014-02-18	2014-02-18	Personal Work	approved	\N	\N
1453	1	1	95	2014	2014-02-10	2014-02-10	sick	approved	\N	\N
1459	2	2	162	2014	2014-02-18	2014-02-19	Out of Station	approved	\N	\N
1457	2	3	102	2014	2014-02-17	2014-02-19	Personal work	approved	\N	\N
1456	1	1	68	2014	2014-02-10	2014-02-10	Not Feeling week, as i was suffering from fever.	approved	\N	\N
1455	1	1	60	2014	2014-02-18	2014-02-18	Fever	approved	\N	\N
1446	2	1	94	2014	2014-02-19	2014-02-19	Personal work	approved	\N	\N
1460	1	1	52	2014	2014-02-17	2014-02-17	I had fever.	approved	\N	\N
1430	2	1	111	2014	2014-02-28	2014-02-28	Going to Native	cancelled	\N	\N
1382	3	3	140	2014	2014-01-21	2014-01-23	My uncle passed away(My husband elder brother)	approved	\N	\N
1383	1	1	140	2014	2014-01-24	2014-01-24	I was suffered from fever	approved	\N	\N
1399	3	2	140	2014	2014-02-05	2014-02-06	To attend the funeral function of my uncle	approved	\N	\N
1400	2	1	140	2014	2014-02-07	2014-02-07	Going to native	approved	\N	\N
1449	5	0.5	29	2014	2014-02-19	2014-02-19	Not Felling well	approved	\N	\N
1425	2	6	52	2014	2014-03-03	2014-03-10	I will be out of station.	cancelled	\N	\N
1462	2	1	101	2014	2014-02-19	2014-02-19	Dad Hospitalised	approved	\N	\N
1454	2	0.5	107	2014	2014-02-20	2014-02-20	first half i am having personal work.	approved	\N	\N
1448	2	2	128	2014	2014-02-20	2014-02-21	Going to Home Town	approved	\N	\N
1437	2	2	98	2014	2014-02-20	2014-02-21	Going to Native	approved	\N	\N
1438	2	1	98	2014	2014-02-24	2014-02-24	Going to Native	approved	\N	\N
1458	2	1	33	2014	2014-02-24	2014-02-24	Going to my Hometown	approved	\N	\N
1447	2	2	164	2014	2014-02-17	2014-02-18	Cousin's Marriage	approved	\N	\N
1426	5	0.5	59	2014	2014-02-12	2014-02-12	Iam going to hospital	approved	\N	\N
1403	2	5	146	2014	2014-02-24	2014-02-28	marriage	approved	\N	\N
1431	2	3	155	2014	2014-02-17	2014-02-19	Going For Surgery	approved	\N	\N
1427	1	1	59	2014	2014-02-10	2014-02-10	As I suffered from fever.	approved	\N	\N
1461	5	0.5	29	2014	2014-02-20	2014-02-20	going for Medical check-up	approved	\N	\N
1478	1	2	47	2014	2014-02-24	2014-02-25	Not well	approved	\N	\N
1474	5	0.5	68	2014	2014-02-25	2014-02-25	Need to go for personal work	approved	\N	\N
1467	3	3	111	2014	2014-02-19	2014-02-21	My Grand Father Died.	approved	\N	\N
1469	1	1	72	2014	2014-02-21	2014-02-21	Not feeling well	approved	\N	\N
1463	5	0.5	162	2014	2014-02-21	2014-02-21	Not feeling Well	approved	\N	\N
1472	5	0.5	155	2014	2014-02-24	2014-02-24	came from native.	approved	\N	\N
2354	8	1	94	2014	2014-10-23	2014-10-23	Deepavali	cancelled	\N	\N
2400	1	5	101	2014	2014-10-08	2014-10-14	Dad Hospitalised	approved	\N	\N
2367	8	1	208	2014	2014-10-23	2014-10-23	Diwali	approved	\N	\N
2369	8	1	207	2014	2014-10-23	2014-10-23	we are having pooja in my aunts place as part of diwali festival	approved	\N	\N
2377	2	1	68	2014	2014-10-24	2014-10-24	For Festival	approved	\N	\N
2387	2	1	51	2014	2014-10-24	2014-10-24	For festival	approved	\N	\N
2380	5	1	194	2014	2014-10-24	2014-10-24	personal	approved	\N	\N
2452	5	1	147	2014	2014-11-07	2014-11-07	Personal work	approved	\N	\N
2446	5	1	49	2014	2014-11-06	2014-11-06	Due to some unavoidable personal commitment, I need to take leave. But I will be available in phone and email all the time.	approved	\N	\N
2425	2	1	30	2014	2014-11-10	2014-11-10	Go to temple.	approved	\N	\N
2440	5	0.5	158	2014	2014-11-04	2014-11-04	went to hospital	approved	\N	\N
2433	5	0.5	94	2014	2014-11-03	2014-11-03	Personal work	approved	\N	\N
2454	1	0.5	55	2014	2014-11-07	2014-11-07	Not Feeling well	approved	\N	\N
2362	8	1	176	2014	2014-10-23	2014-10-23	festival	approved	\N	\N
2417	2	1	144	2014	2014-10-31	2014-10-31	I am going to Home.	cancelled	\N	\N
2374	8	1	128	2014	2014-10-23	2014-10-23	Diwali festival	approved	\N	\N
2463	1	2	192	2014	2014-11-06	2014-11-07	The accident wound became serious so went to consult the doctor for remedies.	approved	\N	\N
2456	5	0.5	134	2014	2014-11-07	2014-11-07	Going to chennai.	approved	\N	\N
2462	1	1	192	2014	2014-11-03	2014-11-03	Met with bike accident	approved	\N	\N
2412	2	2	201	2014	2014-10-27	2014-10-28	personal work.	approved	\N	\N
2407	5	2	117	2014	2014-12-08	2014-12-09	My marriage	approved	\N	\N
2837	3	1	170	2015	2015-01-05	2015-01-05	Death of close relative.	approved	2015-01-07 07:52:03.527743	2015-01-07 10:10:13.122279
2839	2	1	143	2015	2015-01-02	2015-01-02	Was out of station with family.	approved	2015-01-07 09:43:00.360553	2015-01-09 04:59:17.849029
2858	2	3	168	2015	2015-01-14	2015-01-16	Sankranthi \r\n	approved	2015-01-10 05:13:41.412236	2015-01-13 05:45:31.244623
2865	8	1	140	2015	2015-01-15	2015-01-15	For sankranti festival	approved	2015-01-13 06:00:31.606511	2015-01-13 11:44:00.117005
2880	2	2	70	2015	2015-01-21	2015-01-22	Due to Cousin sister's marriage.	approved	2015-01-14 06:38:42.542181	2015-01-20 13:35:18.059437
2853	8	1	177	2015	2015-01-15	2015-01-15	Optional	approved	2015-01-09 13:24:42.191524	2015-01-21 05:56:21.073635
2854	2	1	177	2015	2015-01-16	2015-01-16	Going to native for pongal	approved	2015-01-09 13:35:01.490596	2015-01-21 05:56:34.73977
2878	3	2	213	2015	2015-01-12	2015-01-13	I took holiday because my uncle was death 	approved	2015-01-14 05:42:49.586432	2015-02-04 07:25:27.46018
3002	5	1	145	2015	2015-02-11	2015-02-11	cold, cough and bad headache in back of my head.	approved	2015-02-12 04:35:55.11726	2015-02-12 04:39:47.108077
3003	1	1	102	2015	2015-02-11	2015-02-11	stomach pain	approved	2015-02-12 04:46:37.990755	2015-02-12 04:49:18.933472
2998	1	1	94	2015	2015-02-09	2015-02-09	not well	approved	2015-02-10 05:32:20.493944	2015-02-19 06:01:17.753675
3011	2	1	178	2015	2015-02-18	2015-02-18	personal work	approved	2015-02-16 11:05:20.125121	2015-03-03 09:36:59.11334
3010	8	1	109	2015	2015-02-17	2015-02-17	Shivaratri festival	approved	2015-02-16 11:04:30.245865	2015-03-06 07:05:36.667468
3237	2	1	70	2015	2015-04-03	2015-04-03	Was not feeling well.	cancelled	2015-04-06 05:42:13.524747	2015-04-07 05:02:27.980121
3239	5	0.5	142	2015	2015-04-08	2015-04-08	personal work	approved	2015-04-06 11:00:12.426307	2015-04-08 08:18:05.402751
3253	2	2	213	2015	2015-04-22	2015-04-23	i need holidays for my exams please approve the holidays.	cancelled	2015-04-09 05:12:53.408506	2015-04-14 05:06:30.227602
3252	4	7	213	2015	2015-04-13	2015-04-21	\r\nI need holidays for my exams please approve the holidays.	cancelled	2015-04-09 05:09:29.647004	2015-04-14 05:06:41.57013
3243	2	1	185	2015	2015-04-09	2015-04-09	 Attending Family Marriage Function 	approved	2015-04-07 07:03:59.56446	2015-04-17 11:17:53.368106
3259	5	0.5	117	2015	2015-04-10	2015-04-10	Bank work - second half	approved	2015-04-10 07:06:29.412741	2015-04-17 11:21:14.773509
3242	8	1	70	2015	2015-04-03	2015-04-03	Was not feeling well.	approved	2015-04-07 06:38:12.657555	2015-04-22 12:06:59.260572
3272	2	2	80	2015	2015-04-16	2015-04-17	As I have some personal work.	approved	2015-04-15 08:39:57.866262	2015-04-24 10:35:02.782192
3304	1	1	72	2015	2015-04-23	2015-04-23	Not feeling well	approved	2015-04-24 05:26:51.201806	2015-04-24 10:46:59.550268
3257	8	1	44	2015	2015-04-15	2015-04-15	Going to native	approved	2015-04-09 13:45:59.299453	2015-04-27 05:07:07.030738
3264	5	0.5	44	2015	2015-04-14	2015-04-14	I am going to native, and train is at 5.00 pm.	approved	2015-04-14 06:57:45.169085	2015-04-27 05:07:12.441856
3278	2	4	191	2015	2015-04-27	2015-04-30	Important function at home.	approved	2015-04-20 13:45:37.773958	2015-04-27 09:41:27.944758
3298	1	1	201	2015	2015-04-24	2015-04-24	personal work	approved	2015-04-23 12:46:28.959805	2015-05-21 11:16:14.83261
3295	2	2	213	2015	2015-05-11	2015-05-12	I need holidays for my exams please approve the holidays.	approved	2015-04-23 04:55:37.677029	2015-06-04 07:40:19.522017
3821	1	1	216	2015	2015-09-08	2015-09-08	testing	cancelled	2015-09-08 09:25:40.220657	2015-09-08 09:25:49.514864
4078	8	1	143	2015	2015-10-22	2015-10-22	Was out with family for dussehra.	approved	2015-10-27 07:11:11.34346	2015-10-27 07:19:06.032481
4079	2	1	143	2015	2015-10-23	2015-10-23	Was out with family for dussehra	approved	2015-10-27 07:11:35.310609	2015-10-27 07:19:47.736367
4087	2	2	231	2015	2015-10-08	2015-10-09	Out of Station	approved	2015-10-27 09:31:42.939366	2015-10-27 09:31:42.939366
4082	2	1	230	2015	2015-10-23	2015-10-23	Dasara festival	approved	2015-10-27 07:25:49.654614	2015-11-04 06:59:54.399359
4081	8	1	230	2015	2015-10-22	2015-10-22	dasara festival	approved	2015-10-27 07:25:05.17187	2015-11-04 07:00:11.202288
3919	2	8	231	2015	2015-09-25	2015-10-07	Going to native place	approved	2015-09-23 10:39:48.574528	2015-11-04 07:00:57.577959
4089	4	1	226	2015	2015-10-29	2015-10-29	Should visit college & Regional centre	approved	2015-10-27 12:33:44.211627	2015-11-09 10:24:46.455243
4140	2	3	227	2015	2015-11-16	2015-11-18	brother's marriage	approved	2015-11-09 10:23:06.822617	2015-11-09 10:44:45.583637
4104	8	1	230	2015	2015-11-11	2015-11-11	diwali celebrations	approved	2015-11-03 10:04:16.07342	2015-11-12 05:33:26.43588
4148	2	1	252	2015	2015-11-10	2015-11-10	DIWALI	approved	2015-11-09 12:30:09.875705	2015-11-12 05:38:41.63098
4156	8	1	131	2015	2015-11-11	2015-11-11	Festival	approved	2015-11-10 11:06:22.535517	2015-11-24 08:13:55.257876
4157	8	1	99	2015	2015-11-11	2015-11-11	Diwali	approved	2015-11-10 11:40:33.557351	2015-11-24 08:14:46.579129
4162	2	1	218	2015	2015-11-12	2015-11-12	Outstation travel.	approved	2015-11-12 04:14:58.543113	2015-11-24 08:14:57.452181
4145	2	2	198	2015	2015-11-12	2015-11-13	festival	approved	2015-11-09 12:05:05.288417	2015-11-24 08:15:39.164733
4166	9	1	48	2015	2015-11-13	2015-11-13	Going to Native	approved	2015-11-12 06:42:57.838081	2015-11-30 05:02:45.064898
4141	8	1	237	2015	2015-11-11	2015-11-11	Diwali Festival	approved	2015-11-09 10:29:53.523717	2015-11-30 06:20:12.749173
4137	8	1	91	2015	2015-11-11	2015-11-11	Diwali	approved	2015-11-09 05:47:16.154178	2015-11-30 09:00:14.595403
1464	1	0.5	29	2014	2014-02-21	2014-02-21	Not feeling well	approved	\N	\N
1471	5	0.5	94	2014	2014-02-24	2014-02-24	household work	approved	\N	\N
1468	3	2	111	2014	2014-02-27	2014-02-28	On Behalf of my Grand Father Death ceremony.	approved	\N	\N
1480	8	1	125	2014	2014-02-27	2014-02-27	Optional	approved	\N	\N
1476	8	1	117	2014	2014-02-27	2014-02-27	Festival - Shivaratri	approved	\N	\N
2357	2	1	133	2014	2014-10-22	2014-10-22	i am going to native.	approved	\N	\N
2386	8	1	51	2014	2014-10-23	2014-10-23	For festival	cancelled	\N	\N
2388	2	1	142	2014	2014-10-23	2014-10-23	canceled optional leave and deducted one Privileged leave	approved	\N	\N
2401	2	4	101	2014	2014-10-15	2014-10-20	Dad Hospitalised	approved	\N	\N
2392	5	3	101	2014	2014-10-17	2014-10-21	Dad hospitalised	cancelled	\N	\N
2376	2	5	77	2014	2014-10-20	2014-10-24	go to native	approved	\N	\N
2360	2	1	179	2014	2014-10-15	2014-10-15	Went to native.	approved	\N	\N
2416	2	1	144	2014	2014-10-31	2014-10-31	I am going to Home.	approved	\N	\N
2415	2	1	207	2014	2014-10-27	2014-10-27	For submission of NOC and relieving letter in office,I’ve went for my previous college and previous office to collect related documents	approved	\N	\N
2411	5	0.5	59	2014	2014-10-29	2014-10-29	Not feeling Well	approved	\N	\N
2421	5	1	145	2014	2014-10-28	2014-10-28	I was not well.Suffering from fever	approved	\N	\N
2408	5	3	87	2014	2014-10-29	2014-10-31	Due to some emergency.I am going to my native.	approved	\N	\N
2426	5	0.5	68	2014	2014-11-03	2014-11-03	Need to attend function.	approved	\N	\N
2428	5	0.5	179	2014	2014-10-31	2014-10-31	Personal work	approved	\N	\N
2429	2	2	128	2014	2014-11-13	2014-11-14	Going to home town for applying  birth certificate	cancelled	\N	\N
2431	9	2	95	2014	2014-11-04	2014-11-05	Sick	approved	\N	\N
2442	8	1	80	2014	2014-11-06	2014-11-06	As I have some personal work.	approved	\N	\N
2447	2	1	60	2014	2014-10-31	2014-10-31	personal work	approved	\N	\N
2443	8	1	154	2014	2014-11-06	2014-11-06	optional leave 	approved	\N	\N
2385	2	2	51	2014	2014-10-21	2014-10-22	For festival	approved	\N	\N
2432	5	0.5	178	2014	2014-11-03	2014-11-03	Regarding personal work.	approved	\N	\N
2461	2	2	178	2014	2014-11-06	2014-11-07	Out of station 	approved	\N	\N
2397	5	0.5	111	2014	2014-10-10	2014-10-10	I was not felling well.	approved	\N	\N
2458	5	1	144	2014	2014-11-10	2014-11-10	I have personal work.	approved	\N	\N
2363	2	1	176	2014	2014-10-24	2014-10-24	festival	approved	\N	\N
2355	2	1	94	2014	2014-10-22	2014-10-22	Deepavali	approved	\N	\N
2467	1	1	160	2014	2014-11-10	2014-11-10	Headache and Light Fever 	approved	\N	\N
2384	1	3	191	2014	2014-10-22	2014-10-24	Was suffering from fever, cold, cough and weakness.	approved	\N	\N
2465	2	2	31	2014	2014-11-13	2014-11-14	Going to native for attend the cousin's marriage.	approved	\N	\N
2838	8	1	143	2015	2015-01-01	2015-01-01	Was out of station with family.	approved	2015-01-07 09:42:12.097254	2015-01-09 04:59:14.289131
2840	2	1	143	2015	2015-01-06	2015-01-06	Since my sister was not well so had been to hospital for her checkup.	approved	2015-01-07 09:44:18.524862	2015-01-09 04:59:23.591778
2861	5	0.5	95	2015	2015-01-12	2015-01-12	sick.	approved	2015-01-12 08:12:11.814617	2015-01-13 05:04:11.672499
2862	8	1	80	2015	2015-01-15	2015-01-15	As I have some personal work.	approved	2015-01-12 11:03:16.923899	2015-01-13 05:08:34.225161
2828	2	1	51	2015	2015-01-02	2015-01-02	For new year	approved	2015-01-06 05:16:38.315618	2015-01-13 11:54:05.3927
2873	2	1	169	2015	2015-01-14	2015-01-14	festiaval	approved	2015-01-13 13:19:33.292864	2015-01-14 06:39:04.984646
2875	2	1	169	2015	2015-01-16	2015-01-16	Festival	approved	2015-01-13 13:22:09.403115	2015-01-14 06:39:08.695926
2879	5	0.5	143	2015	2015-01-14	2015-01-14	Celebrating Sankranti with family and friends.	cancelled	2015-01-14 05:49:34.813162	2015-01-14 07:17:18.780351
2870	5	1	134	2015	2015-01-14	2015-01-14	For sankranti.\r\n	cancelled	2015-01-13 12:14:28.819341	2015-01-14 08:12:06.198565
2844	2	1	70	2015	2015-01-02	2015-01-02	Personal Work.	approved	2015-01-08 16:58:47.791542	2015-01-20 13:35:21.22989
2846	2	3	70	2014	2014-12-29	2014-12-31	Personal works.	approved	2015-01-08 17:02:23.793515	2015-01-21 09:14:38.883589
2999	1	2	168	2015	2015-02-10	2015-02-11	sick	approved	2015-02-11 04:18:10.286247	2015-02-16 11:26:21.272133
3012	8	1	144	2015	2015-02-17	2015-02-17	Festival	approved	2015-02-16 11:07:54.915029	2015-02-16 11:27:04.90833
3238	8	2	198	2015	2015-04-02	2015-04-03	I was not feeling well so hospitalized for 2 days.	approved	2015-04-06 05:53:18.396246	2015-04-06 05:54:27.426784
3256	2	1	144	2015	2015-04-10	2015-04-10	I am going to Hometown.\r\n	approved	2015-04-09 13:17:36.696685	2015-04-10 05:19:16.630895
3267	5	0.5	191	2015	2015-04-14	2015-04-14	Was not feeling well.	approved	2015-04-14 08:46:43.446416	2015-04-15 08:36:46.93188
3241	5	0.5	109	2015	2015-04-07	2015-04-07	i am not feeling well.	approved	2015-04-07 06:04:20.683588	2015-04-17 11:22:03.193107
3277	2	1	90	2015	2015-04-20	2015-04-20	Medical emergency.\r\n(Wife is sick).	Pending	2015-04-20 03:22:09.750039	2015-04-20 03:22:09.750039
3289	1	1	40	2015	2015-04-13	2015-04-13	Sick	cancelled	2015-04-22 10:57:05.635091	2015-04-22 11:58:15.741994
3287	5	0.5	145	2015	2015-04-22	2015-04-22	Have personal work.	approved	2015-04-22 07:45:06.52573	2015-04-23 07:35:28.288158
3285	2	1	143	2015	2015-04-20	2015-04-20	Was out of station due to a sudden important work.	approved	2015-04-21 11:04:42.552008	2015-04-23 07:35:33.491077
3286	5	0.5	143	2015	2015-04-21	2015-04-21	Not well.	approved	2015-04-21 11:05:30.592692	2015-04-23 07:36:32.941923
3305	2	4	59	2015	2015-04-27	2015-04-30	Going native to attend family function.	approved	2015-04-24 06:30:57.263949	2015-05-13 10:29:33.888865
3275	1	1	210	2015	2015-04-16	2015-04-16	fever	approved	2015-04-17 04:18:04.689662	2015-04-24 11:17:33.052308
3274	2	5	220	2015	2015-04-20	2015-04-24	Presonal reason	approved	2015-04-16 11:17:36.005882	2015-04-27 08:43:28.447033
3288	2	2	30	2015	2015-04-30	2015-05-04	Going to Temple	cancelled	2015-04-22 10:43:41.747281	2015-05-04 05:49:07.738937
3297	2	2	209	2015	2015-04-29	2015-04-30	Going Home	approved	2015-04-23 11:57:46.547652	2015-05-21 10:56:37.858422
3835	4	3	70	2015	2015-10-09	2015-10-13	Pre Maternity leave.	cancelled	2015-09-09 09:05:54.948349	2015-09-09 11:38:07.940212
3829	2	1	77	2015	2015-09-08	2015-09-08	personal work	approved	2015-09-09 06:44:13.083726	2015-09-10 07:21:29.229777
3822	5	0.5	246	2015	2015-09-08	2015-09-08	headache and fever	approved	2015-09-08 09:44:02.353522	2015-09-11 05:22:15.219022
4084	1	1	52	2015	2015-10-05	2015-10-05	I was unwell.	approved	2015-10-27 07:32:04.862436	2015-10-27 11:09:44.953931
4085	8	1	52	2015	2015-10-21	2015-10-21	Festival	approved	2015-10-27 07:32:23.807509	2015-10-27 11:10:17.980225
4102	2	1	221	2015	2015-11-03	2015-11-03	Personal.	Pending	2015-11-03 07:22:13.338255	2015-11-03 07:22:13.338255
4093	1	1	142	2015	2015-10-27	2015-10-27	Not feeling well	approved	2015-10-28 06:19:04.585704	2015-11-03 10:02:33.193596
4095	5	0.5	242	2015	2015-10-30	2015-10-30	I would like to inform that, am going to my hometown. I need half day Time Off.	approved	2015-10-30 06:09:19.22278	2015-11-12 05:41:24.32834
4107	2	1	217	2015	2015-11-12	2015-11-12	Personal reason	approved	2015-11-04 04:45:07.894395	2015-11-20 09:51:31.977963
4101	1	1	210	2015	2015-11-02	2015-11-02	fever	approved	2015-11-03 04:51:18.235107	2015-11-24 07:23:44.368748
4096	5	0.5	131	2015	2015-10-30	2015-10-30	personal	approved	2015-10-30 09:30:00.483979	2015-11-24 08:14:01.028971
4094	1	1	51	2015	2015-10-29	2015-10-29	I was not feeling good.	approved	2015-10-30 05:14:23.974619	2015-11-24 08:16:19.062514
1473	5	1	68	2014	2014-02-25	2014-02-25	Need to go for some personal work.	cancelled	\N	\N
1470	2	0.5	51	2014	2014-02-24	2014-02-24	I am not feeling well.	approved	\N	\N
1465	2	1	87	2014	2014-02-24	2014-02-24	I am going to  College\r\nfor my PG.....	approved	\N	\N
1466	5	0.5	109	2014	2014-02-24	2014-02-24	Personal Reason	approved	\N	\N
1481	5	0.5	70	2014	2014-02-28	2014-02-28	Due to some personal work.	approved	\N	\N
1475	4	2	123	2014	2014-02-27	2014-02-28	GATE Exam	approved	\N	\N
1477	8	1	155	2014	2014-02-27	2014-02-27	fasting for shivrathri	approved	\N	\N
2368	8	1	207	2014	2014-10-23	2014-10-23	we are having pooja in my aunts place as part of  diwali festival	cancelled	\N	\N
2361	8	1	179	2014	2014-10-23	2014-10-23	For Diwali Puja.	cancelled	\N	\N
2352	8	1	198	2014	2014-10-23	2014-10-23	My Elder Brother Engagement,so I am going to native place,please leave me alone.	cancelled	\N	\N
2353	3	1	198	2014	2014-10-24	2014-10-24	My Elder Brother Engagement.	cancelled	\N	\N
2358	2	2	158	2014	2014-10-27	2014-10-28	Festival	cancelled	\N	\N
2383	2	2	128	2014	2014-11-14	2014-11-17	Going to home town (Hyderabad)	approved	\N	\N
2394	1	1	101	2014	2014-10-17	2014-10-17	Dad hospitalised	cancelled	\N	\N
2381	2	1	60	2014	2014-10-21	2014-10-21	Not feeling well	approved	\N	\N
2366	8	1	206	2014	2014-10-23	2014-10-23	as i am going home on the occasion of diwali.	cancelled	\N	\N
2402	5	1	101	2014	2014-10-21	2014-10-21	Dad Hospitalised	approved	\N	\N
2405	2	1	41	2014	2014-10-14	2014-10-14	Not applied leave... 	approved	\N	\N
2403	1	1	196	2014	2014-10-27	2014-10-27	fever	approved	\N	\N
2418	1	1	44	2014	2014-10-27	2014-10-27	FEVER	approved	\N	\N
2414	2	1	169	2014	2014-10-27	2014-10-27	Personal problem	approved	\N	\N
2356	2	1	94	2014	2014-10-24	2014-10-24	deepavali	approved	\N	\N
2373	8	1	48	2014	2014-10-23	2014-10-23	For Diwali	approved	\N	\N
2439	5	0.5	40	2014	2014-10-27	2014-10-27	not applied leave in EDMS, deducting based on your mail... 	approved	\N	\N
2409	8	1	109	2014	2014-11-06	2014-11-06	Out of station	approved	\N	\N
2435	8	1	117	2014	2014-11-06	2014-11-06	Personal work	approved	\N	\N
2444	1	1	179	2014	2014-11-04	2014-11-04	I was Not well	approved	\N	\N
2460	5	0.5	178	2014	2014-11-05	2014-11-05	Due to personal work	approved	\N	\N
2438	1	1	197	2014	2014-11-03	2014-11-03	Viral fever and cold	approved	\N	\N
2434	1	3	91	2014	2014-10-29	2014-10-31	Fever	approved	\N	\N
2457	1	1	203	2014	2014-11-06	2014-11-06	Suffering from fever	approved	\N	\N
2453	2	5	154	2014	2014-12-17	2014-12-23	holiday vacation	cancelled	\N	\N
2860	1	1	98	2015	2015-01-09	2015-01-09	Not Feeling Well	approved	2015-01-12 05:08:16.996691	2015-01-12 05:19:16.459327
2863	2	1	111	2015	2015-01-12	2015-01-12	I had some work.	approved	2015-01-13 04:16:46.87022	2015-01-13 07:19:30.52802
2876	5	0.5	102	2015	2015-01-13	2015-01-13	Fever	approved	2015-01-14 04:37:44.415961	2015-01-14 04:49:42.984859
2868	8	1	109	2015	2015-01-15	2015-01-15	Sankranti festival 	approved	2015-01-13 11:29:42.002368	2015-01-14 05:18:56.466851
2842	8	1	117	2015	2015-01-15	2015-01-15	Sankranthi Festival	approved	2015-01-08 04:42:47.900914	2015-01-14 05:19:02.74377
2851	2	1	209	2015	2015-01-16	2015-01-16	Going Home for Pongal	approved	2015-01-09 09:03:10.850226	2015-01-14 05:19:39.351792
2869	8	1	128	2015	2015-01-15	2015-01-15	Pongal festival	approved	2015-01-13 12:02:22.770226	2015-01-21 05:55:46.385757
2866	8	1	191	2014	2014-12-31	2014-12-31	Personal Work.	approved	2015-01-13 06:54:02.012662	2015-01-21 09:14:49.051228
2859	2	6	188	2015	2015-01-22	2015-01-30	Going to home 	approved	2015-01-12 04:18:14.033462	2015-01-22 05:13:00.031385
3000	1	2	191	2015	2015-02-09	2015-02-10	Cough, Cold, Fever.	approved	2015-02-11 05:44:32.186439	2015-02-12 04:39:51.090412
3013	1	1	162	2015	2015-02-16	2015-02-16	Not feeling well 	approved	2015-02-17 05:05:16.653635	2015-02-18 07:30:14.607476
3027	2	3	80	2015	2015-02-23	2015-02-25	As I have some personal work.	approved	2015-02-18 05:09:13.273673	2015-02-19 04:32:53.934126
3025	2	1	99	2015	2015-02-18	2015-02-18	Check up.	approved	2015-02-17 09:06:50.034278	2015-02-19 06:00:05.694536
3031	1	1	209	2015	2015-02-19	2015-02-19	Not Feeling Well.	approved	2015-02-19 03:12:39.304718	2015-03-03 06:37:13.800462
3019	5	0.5	140	2015	2015-02-17	2015-02-17	Personal work	approved	2015-02-17 05:42:52.84604	2015-03-04 05:50:13.249215
3271	8	1	188	2015	2015-04-15	2015-04-15	Health problem.	approved	2015-04-15 08:38:34.679461	2015-04-15 09:30:53.920897
3279	5	0.5	188	2015	2015-04-21	2015-04-21	Police verification	approved	2015-04-21 05:16:13.466786	2015-04-21 05:32:48.695444
3291	4	1	40	2015	2015-04-13	2015-04-13	_	cancelled	2015-04-22 11:59:17.287979	2015-04-22 12:07:00.453423
3283	8	1	160	2015	2015-04-15	2015-04-15	Bengali New Year	approved	2015-04-21 09:45:09.166747	2015-04-22 12:07:51.110213
3290	8	2	40	2015	2015-04-14	2015-04-15	Availing Optional	approved	2015-04-22 10:58:15.866395	2015-04-22 12:09:00.789499
3248	3	2	60	2015	2015-04-06	2015-04-07	My grand mother dead	approved	2015-04-08 04:25:41.384598	2015-04-22 13:01:56.626438
3269	1	1	223	2015	2015-04-14	2015-04-14	severe fever	approved	2015-04-15 04:18:48.625389	2015-04-24 11:17:38.901334
3300	9	1	99	2015	2015-04-22	2015-04-22	Personal.	approved	2015-04-24 04:37:16.883798	2015-04-24 11:18:05.324564
3302	2	1	87	2015	2015-05-04	2015-05-04	Going to home town.	cancelled	2015-04-24 05:07:31.363278	2015-04-25 03:55:32.800285
3280	5	0.5	77	2015	2015-04-20	2015-04-20	Went to hospital	approved	2015-04-21 05:30:11.640455	2015-04-27 05:06:29.958268
3258	2	3	44	2015	2015-04-16	2015-04-20	Going to native	approved	2015-04-09 13:47:00.025825	2015-04-27 05:07:21.051457
3293	5	1	211	2015	2015-04-20	2015-04-20	urgent work	approved	2015-04-23 03:48:15.566094	2015-04-27 08:43:42.182055
3284	2	1	140	2015	2015-04-22	2015-04-22	To attend family function 	approved	2015-04-21 09:48:26.299353	2015-05-05 16:08:13.835761
3294	4	7	213	2015	2015-04-29	2015-05-08	I need holidays for my exams please approve the holidays.	approved	2015-04-23 04:54:34.101927	2015-06-04 07:40:41.638596
3823	5	0.5	242	2015	2015-09-09	2015-09-09	I need 2nd half day Time Off for my wife maternity checkup. Thank you for your kind consideration on my request.	approved	2015-09-09 03:56:01.98546	2015-09-10 07:21:50.573857
4088	5	0.5	63	2015	2015-10-23	2015-10-23	Time Off Applied 	cancelled	2015-10-27 11:20:09.084166	2015-10-27 11:21:44.452359
4111	2	6	64	2015	2015-10-23	2015-10-30	Personal Work	Pending	2015-11-04 05:56:43.991119	2015-11-04 05:56:43.991119
4134	2	1	159	2015	2015-11-09	2015-11-09	diwali festival	approved	2015-11-06 15:48:09.630647	2015-11-07 07:55:42.38297
4142	2	3	169	2015	2015-11-16	2015-11-18	Brother's marriage	approved	2015-11-09 11:17:52.405404	2015-11-09 11:57:45.801601
4147	8	1	252	2015	2015-11-11	2015-11-11	DIWALI	approved	2015-11-09 12:29:42.321209	2015-11-12 05:34:00.45736
4099	2	1	109	2015	2015-11-06	2015-11-06	Going to Hometown.	approved	2015-11-02 05:23:52.827318	2015-11-12 05:40:12.521595
4098	5	0.5	109	2015	2015-11-05	2015-11-05	Going to Hometown.	approved	2015-11-02 05:23:12.612847	2015-11-12 05:40:48.949663
4113	2	1	217	2015	2015-11-13	2015-11-13	Personal	approved	2015-11-04 15:20:30.129971	2015-11-20 09:51:22.062706
4092	1	1	95	2015	2015-10-26	2015-10-26	was Sick on monday.	approved	2015-10-28 06:14:25.528183	2015-11-24 08:13:40.490586
4129	2	1	131	2015	2015-08-12	2015-08-12	Personal	approved	2015-11-06 12:50:11.90994	2015-11-24 08:14:04.433774
4152	5	1	218	2015	2015-11-10	2015-11-10	Time off	approved	2015-11-10 04:51:41.026774	2015-11-24 08:15:01.719935
4100	2	11	41	2015	2015-11-06	2015-11-20	Going to my Native,	approved	2015-11-02 14:00:39.465023	2015-11-24 08:15:16.062623
4144	8	1	198	2015	2015-11-11	2015-11-11	festival	approved	2015-11-09 12:04:44.703858	2015-11-24 08:15:33.424646
1429	8	1	111	2014	2014-02-27	2014-02-27	On Behalf of Shivaratri festival.	cancelled	\N	\N
1482	1	2	127	2014	2014-02-13	2014-02-14	Met with an accident.	approved	\N	\N
1487	1	1	127	2014	2014-02-19	2014-02-19	Follow up doctor's appointment.	approved	\N	\N
1488	8	1	142	2014	2014-02-27	2014-02-27	On the eve of Maha Shivaratri	approved	\N	\N
1497	2	8	120	2014	2014-02-17	2014-02-26	Went to Native 	approved	\N	\N
1491	1	1	41	2014	2014-02-26	2014-02-26	Went to Hospital for Taking the Appointment with Doctor.	approved	\N	\N
1495	1	1	80	2014	2014-02-28	2014-02-28	As i was not feeling well.	approved	\N	\N
1489	9	2	52	2014	2014-01-30	2014-01-31	I was out of station.	approved	\N	\N
1484	1	3	131	2014	2014-02-03	2014-02-05	leave	approved	\N	\N
1485	5	2	131	2014	2014-02-06	2014-02-07	leave	approved	\N	\N
1483	2	6	131	2014	2014-02-11	2014-02-18	leave 	approved	\N	\N
1486	2	1	131	2014	2014-02-10	2014-02-10	Sister's Wedding	approved	\N	\N
1494	2	2	71	2014	2014-02-20	2014-02-21	Out of station	approved	\N	\N
1492	2	0.5	55	2014	2014-02-25	2014-02-25	Went to Hospital	approved	\N	\N
1432	1	2	155	2014	2014-02-20	2014-02-21	Going For surgery	approved	\N	\N
1510	4	5	36	2014	2014-03-11	2014-03-17	Exam Cum training	cancelled	\N	\N
1511	4	4	36	2014	2014-03-12	2014-03-17	Exam Cum Training	approved	\N	\N
1479	2	2	49	2014	2014-03-06	2014-03-07	Going out with family	approved	\N	\N
1490	2	3	125	2014	2014-03-03	2014-03-05	Participating in college fest competition.	approved	\N	\N
1498	1	1	90	2014	2014-03-05	2014-03-05	Appointment with Dr. Sridhar PSat HCG hospital, Bangalore. 	approved	\N	\N
1499	1	1	95	2014	2014-03-03	2014-03-03	met with an accident.	approved	\N	\N
1500	5	0.5	95	2014	2014-03-05	2014-03-05	sick	approved	\N	\N
1514	5	0.5	94	2014	2014-03-10	2014-03-10	Attending Home God's annual fair	approved	\N	\N
1513	2	1	94	2014	2014-03-11	2014-03-11	Attending Home God's annual fair	approved	\N	\N
1509	5	1	108	2014	2014-03-07	2014-03-07	Personal Work	approved	\N	\N
1520	1	1	87	2014	2014-03-10	2014-03-10	Not Well.....	approved	\N	\N
1518	1	1	31	2014	2014-03-10	2014-03-10	I am not feeling well.	approved	\N	\N
1517	1	1	162	2014	2014-03-10	2014-03-10	I was not feeling well	approved	\N	\N
1522	1	1	42	2014	2014-03-03	2014-03-03	I went to native .Due to some personal.	approved	\N	\N
1493	2	2	44	2014	2014-03-10	2014-03-11	Going to Home	approved	\N	\N
1524	1	1	165	2014	2014-03-12	2014-03-12	Not feeling well.\r\nStomach Pain	approved	\N	\N
1527	2	10	45	2014	2014-02-05	2014-02-18	for my marriage	approved	\N	\N
1529	5	3	45	2014	2014-02-19	2014-02-21	for my marriage	approved	\N	\N
1496	2	5	138	2014	2014-03-17	2014-03-21	Going to home town.	approved	\N	\N
1526	5	1	160	2014	2014-03-14	2014-03-14	I have some Personal Work	approved	\N	\N
1528	2	1	127	2014	2014-03-14	2014-03-14	My flight to home got rescheduled and preponed. So, I will have to leave early tomorrow.	approved	\N	\N
1540	8	1	134	2014	2014-03-17	2014-03-17	Going to chennai.	approved	\N	\N
1538	2	3	101	2014	2014-03-17	2014-03-19	Going To Temple	approved	\N	\N
1542	1	1	162	2014	2014-03-17	2014-03-17	Holi festival	cancelled	\N	\N
1543	8	1	162	2014	2014-03-17	2014-03-17	Holi festival	cancelled	\N	\N
1549	5	0.5	72	2014	2014-03-17	2014-03-17	Licence work at RTO Office	approved	\N	\N
1547	1	1	70	2014	2014-03-14	2014-03-14	I was not feeling well.	approved	\N	\N
1532	1	1	44	2014	2014-03-12	2014-03-12	Fever and cough	approved	\N	\N
1504	2	1	117	2014	2014-03-14	2014-03-14	Personal Work	approved	\N	\N
1541	2	1	134	2014	2014-03-18	2014-03-18	Going to chennai.	approved	\N	\N
1561	1	2	29	2014	2014-02-24	2014-02-25	Not feeling well	approved	\N	\N
1562	2	2	29	2014	2014-02-27	2014-02-28	Not feeling well	approved	\N	\N
1546	1	1	54	2014	2014-03-14	2014-03-14	Suffering from fever	approved	\N	\N
1521	3	2	77	2014	2014-03-12	2014-03-13	Go for my aunty funeral in my native	approved	\N	\N
1569	1	1	165	2014	2014-03-20	2014-03-20	Fever and cold	approved	\N	\N
1535	8	1	163	2014	2014-03-17	2014-03-17	Going to Native	approved	\N	\N
1536	1	0.5	55	2014	2014-03-14	2014-03-14	Not Feeling well	approved	\N	\N
1503	8	1	87	2014	2014-03-17	2014-03-17	Going to my home town....	approved	\N	\N
1505	2	1	87	2014	2014-03-18	2014-03-18	Going to my hometown....	approved	\N	\N
1512	8	1	145	2014	2014-03-17	2014-03-17	on the eve of festival	approved	\N	\N
1516	9	2	80	2014	2014-03-13	2014-03-14	As I have Some personal work.	approved	\N	\N
1519	8	1	102	2014	2014-03-17	2014-03-17	Personal Work	approved	\N	\N
1551	2	0.5	51	2014	2014-03-18	2014-03-18	Due to some personnel work i need leave in second half	approved	\N	\N
1553	2	3	72	2014	2014-03-26	2014-03-28	cousin's wedding	approved	\N	\N
1539	8	1	108	2014	2014-03-17	2014-03-17	On occasion of Holi	approved	\N	\N
1533	5	0.5	111	2014	2014-03-14	2014-03-14	I have some personal Work.	approved	\N	\N
1515	8	1	70	2014	2014-03-31	2014-03-31	For Ugadi Festival Celebration going to my native place.	approved	\N	\N
1537	2	2	51	2014	2014-03-31	2014-04-01	For ugadi festival	approved	\N	\N
1554	8	1	72	2014	2014-03-31	2014-03-31	Ugadi	approved	\N	\N
1559	8	1	111	2014	2014-03-31	2014-03-31	On Behalf of Ugadi Festival!	approved	\N	\N
1560	2	1	111	2014	2014-04-01	2014-04-01	I am going to Native	approved	\N	\N
1501	8	1	147	2014	2014-03-31	2014-03-31	Festival	approved	\N	\N
1507	8	1	151	2014	2014-03-31	2014-03-31	Going to home town for festival	approved	\N	\N
1530	5	2	45	2014	2014-02-24	2014-02-25	for my marriage	approved	\N	\N
1531	1	3	45	2014	2014-02-26	2014-02-28	for my marriage	approved	\N	\N
1544	8	1	162	2014	2014-03-17	2014-03-17	Holi festival	approved	\N	\N
1545	8	1	90	2014	2014-03-17	2014-03-17	For Holi 	approved	\N	\N
1555	5	0.5	60	2014	2014-03-18	2014-03-18	Going to marriage	approved	\N	\N
1550	2	1	63	2014	2014-03-12	2014-03-12	Personal Reason	approved	\N	\N
1558	5	1	169	2014	2014-03-18	2014-03-18	function	approved	\N	\N
1571	8	1	171	2014	2014-03-31	2014-03-31	Ugadi festival	approved	\N	\N
1502	2	4	147	2014	2014-04-01	2014-04-04	function	approved	\N	\N
1508	2	4	151	2014	2014-04-01	2014-04-04	Going to home town for festival	approved	\N	\N
1556	2	1	68	2014	2014-04-04	2014-04-04	Personal Work	approved	\N	\N
1557	2	1	68	2014	2014-04-07	2014-04-07	Personal Work	approved	\N	\N
1506	2	6	99	2014	2014-04-28	2014-05-06	Personal	approved	\N	\N
1586	8	1	59	2014	2014-03-31	2014-03-31	As available optional leave.	cancelled	\N	\N
1523	5	1	90	2014	2014-03-13	2014-03-13	Due to internet issue, Whole night I am in office so need some rest.	approved	\N	\N
1563	1	1	102	2014	2014-03-18	2014-03-18	Fever	approved	\N	\N
1576	2	1	169	2014	2014-03-31	2014-03-31	festival	approved	\N	\N
1589	8	1	95	2014	2014-03-31	2014-03-31	personal.	approved	\N	\N
1594	8	1	168	2014	2014-03-31	2014-03-31	ugadi	approved	\N	\N
1577	2	1	87	2014	2014-04-17	2014-04-17	Holy Thursday....\r\nGoing to my home town....	cancelled	\N	\N
1611	8	1	127	2014	2014-03-31	2014-03-31	Optional. Ugadi.	approved	\N	\N
1605	8	1	109	2014	2014-04-18	2014-04-18	Going to hometown	approved	\N	\N
2351	5	0.5	95	2014	2014-10-21	2014-10-21	going home.	approved	\N	\N
2396	5	1	101	2014	2014-10-21	2014-10-21	Dad hospitalised	cancelled	\N	\N
2390	1	4	101	2014	2014-10-08	2014-10-13	Dad Hospitalised	cancelled	\N	\N
2395	2	1	101	2014	2014-10-20	2014-10-20	Dad hospitalised	cancelled	\N	\N
2364	8	1	185	2014	2014-10-23	2014-10-23	Attending diwali function	approved	\N	\N
2382	5	0.5	170	2014	2014-10-24	2014-10-24	not feeling well.	approved	\N	\N
2420	1	1	145	2014	2014-10-27	2014-10-27	I was not well.Suffering from fever.	approved	\N	\N
2423	5	0.5	70	2014	2014-10-31	2014-10-31	Travelling to Hubli for some personal unavoidable works.	approved	\N	\N
2441	2	7	189	2014	2014-10-20	2014-10-28	Leave taken with the reason of treatment treatment of Asthma	approved	\N	\N
2422	5	0.5	60	2014	2014-10-31	2014-10-31	Personal work	approved	\N	\N
2410	5	1	109	2014	2014-11-07	2014-11-07	Out of station	approved	\N	\N
2455	5	0.5	70	2014	2014-11-07	2014-11-07	For some personal work.	approved	\N	\N
2445	5	0.5	31	2014	2014-10-30	2014-10-30	For some personal work.	approved	\N	\N
2449	8	1	163	2014	2014-11-06	2014-11-06	Personal Matter	approved	\N	\N
2464	5	0.5	72	2014	2014-11-10	2014-11-10	Personal Work	approved	\N	\N
2468	8	1	170	2014	2014-11-06	2014-11-06	for festival.	approved	\N	\N
2451	2	2	102	2014	2014-12-01	2014-12-02	Personal work	approved	\N	\N
2864	2	3	77	2015	2015-01-14	2015-01-16	For pongal festival	approved	2015-01-13 05:47:54.117607	2015-01-13 11:43:41.698441
2849	2	1	60	2015	2015-01-14	2015-01-14	Sankranthi	approved	2015-01-09 08:52:12.164062	2015-01-13 12:45:16.554567
2874	8	1	169	2015	2015-01-15	2015-01-15	Festival	approved	2015-01-13 13:19:51.126218	2015-01-14 06:39:10.0445
2847	8	1	185	2015	2015-01-01	2015-01-01	New Year celebaration	approved	2015-01-09 06:41:15.197024	2015-01-16 04:26:32.383942
2856	8	1	31	2015	2015-01-15	2015-01-15	Pongal celebration.	approved	2015-01-09 14:03:51.662101	2015-01-20 13:35:55.118372
2857	2	1	31	2015	2015-01-16	2015-01-16	Pongal celebration.	approved	2015-01-09 14:04:18.652903	2015-01-20 13:36:02.358492
2867	8	1	99	2015	2015-01-15	2015-01-15	 sankranti	approved	2015-01-13 07:04:24.38804	2015-01-21 05:56:10.29811
3014	8	1	77	2015	2015-02-17	2015-02-17	Took optional 	approved	2015-02-17 05:07:09.425547	2015-02-17 05:21:48.899866
3001	5	0.5	51	2015	2015-02-11	2015-02-11	Not feeling well	approved	2015-02-11 07:56:52.098168	2015-02-19 06:00:50.790011
3028	2	2	72	2015	2015-02-19	2015-02-20	Going to cousin's wedding	approved	2015-02-18 05:18:53.049935	2015-02-24 04:28:15.70472
3016	8	1	165	2015	2015-03-06	2015-03-06	Holi optional leave	approved	2015-02-17 05:30:25.373443	2015-03-04 05:13:12.901174
3018	1	1	165	2015	2015-02-10	2015-02-10	Not feeling well.	approved	2015-02-17 05:33:20.771616	2015-03-04 05:13:15.143776
3307	5	0.5	77	2015	2015-04-23	2015-04-23	went to hospital	approved	2015-04-24 11:43:50.815329	2015-04-27 05:06:20.747997
3339	5	2	118	2015	2015-04-28	2015-04-29	Were at Native place	approved	2015-05-04 07:33:16.787602	2015-05-04 07:43:41.987599
3312	1	1	117	2015	2015-04-24	2015-04-24	Fever and cold	approved	2015-04-27 05:26:11.550321	2015-05-21 11:02:22.013376
3323	8	1	117	2015	2015-04-14	2015-04-14	Out of city	cancelled	2015-04-27 07:43:02.750734	2015-05-21 11:03:12.373609
3832	2	6	70	2015	2015-09-24	2015-10-01	Pre Maternity leave.	Pending	2015-09-09 08:48:55.835424	2015-09-09 08:48:55.835424
3828	1	1	77	2015	2015-09-07	2015-09-07	went to checkup	approved	2015-09-09 06:30:58.235504	2015-09-10 07:21:33.040692
3824	5	0.5	242	2015	2015-09-07	2015-09-07	I apply this 1st Half day Time Off for my wife maternity checkup. Thank you for your kind consideration on my request.	approved	2015-09-09 03:59:23.043169	2015-09-10 07:21:53.739811
3827	2	1	142	2015	2015-09-18	2015-09-18	personal work	approved	2015-09-09 04:42:33.060932	2015-09-24 05:11:15.408163
4109	8	1	64	2015	2015-10-21	2015-10-21	As available optional leave	Pending	2015-11-04 05:54:12.4027	2015-11-04 05:54:12.4027
4110	8	1	64	2015	2015-10-22	2015-10-22	As available optional leave	Pending	2015-11-04 05:55:05.92059	2015-11-04 05:55:05.92059
4108	2	1	217	2015	2015-11-13	2015-11-13	Personal reason	cancelled	2015-11-04 04:45:34.933154	2015-11-04 08:56:42.821161
4121	3	2	227	2015	2015-11-03	2015-11-04	grandmother expired	approved	2015-11-05 09:29:36.342255	2015-11-05 13:09:05.930003
4135	2	2	158	2015	2015-11-09	2015-11-10	Diwali festival	approved	2015-11-06 15:55:36.597062	2015-11-07 07:55:48.641075
4138	1	1	98	2015	2015-11-06	2015-11-06	Not feeling well	approved	2015-11-09 06:14:44.33972	2015-11-09 10:44:29.352268
4126	2	2	209	2015	2015-11-09	2015-11-10	Going Home for Diwali.	approved	2015-11-06 11:27:45.004484	2015-11-12 05:32:21.727973
4176	8	1	212	2015	2015-11-11	2015-11-11	Deepavali	approved	2015-11-16 07:06:20.337758	2015-11-20 09:49:32.397305
4178	2	2	212	2015	2015-11-12	2015-11-13	Went to Native Place	approved	2015-11-16 07:08:20.466741	2015-11-20 09:49:40.679693
4177	2	2	212	2015	2015-11-09	2015-11-10	Went To Native Place	approved	2015-11-16 07:07:38.788755	2015-11-20 09:49:56.636933
4183	2	1	201	2015	2015-11-18	2015-11-18	Personal Work	approved	2015-11-17 12:41:10.340952	2015-11-20 09:50:03.713769
4165	8	1	214	2015	2015-11-11	2015-11-11	Diwali	approved	2015-11-12 05:54:46.324628	2015-11-20 09:53:37.047688
3830	5	3.5	70	2015	2015-09-14	2015-09-17	Pre Maternity leave.	approved	2015-09-09 08:44:03.015318	2015-11-24 08:13:25.596443
4127	1	3	131	2015	2015-07-29	2015-07-31	Sick leave	approved	2015-11-06 12:47:58.496813	2015-11-24 08:14:08.309996
4130	2	1	131	2015	2015-08-18	2015-08-18	Personal	approved	2015-11-06 12:50:35.316785	2015-11-24 08:14:10.222556
4132	1	1	131	2015	2015-08-27	2015-08-27	Sick Leave	approved	2015-11-06 12:52:19.722539	2015-11-24 08:14:13.699997
4199	2	3	215	2015	2015-11-23	2015-11-25	Going to temple	approved	2015-11-20 15:19:05.187411	2015-11-24 08:15:41.923177
4120	2	1	51	2015	2015-11-12	2015-11-12	For Diwali	approved	2015-11-05 08:44:53.344305	2015-11-24 08:16:13.117292
4143	2	1	51	2015	2015-11-10	2015-11-10	For festival	approved	2015-11-09 12:01:40.257413	2015-11-24 08:16:16.261685
4195	1	1	226	2015	2015-11-02	2015-11-02	Unwell	approved	2015-11-20 11:13:43.095093	2015-11-24 10:36:06.313989
4237	8	1	226	2015	2015-12-31	2015-12-31	Exam	Pending	2015-11-28 12:32:36.963069	2015-11-28 12:32:36.963069
4188	1	1	71	2015	2015-11-16	2015-11-16	Sick	approved	2015-11-18 05:59:17.017136	2015-11-30 04:59:14.450677
4182	5	0.5	94	2015	2015-11-16	2015-11-16	Heavy rain	approved	2015-11-17 05:42:59.146851	2015-11-30 05:29:02.132784
4155	8	1	94	2015	2015-11-11	2015-11-11	Deepavali	approved	2015-11-10 09:13:09.11718	2015-11-30 05:29:15.456049
4167	5	1	94	2015	2015-11-12	2015-11-12	Vehicle pooja	approved	2015-11-13 06:43:19.075746	2015-11-30 05:30:08.83951
4226	2	5	211	2015	2015-11-03	2015-11-09	went to native	approved	2015-11-26 04:14:55.464378	2015-11-30 07:13:46.448265
4227	8	1	211	2015	2015-11-11	2015-11-11	Diwali	approved	2015-11-26 04:15:27.551782	2015-11-30 07:14:00.916138
4228	8	1	211	2015	2015-11-25	2015-11-25	Optional leave	approved	2015-11-26 04:15:47.572903	2015-11-30 07:14:03.413905
4224	1	1	77	2015	2015-10-29	2015-10-29	went to hospital	approved	2015-11-25 04:48:47.840983	2015-12-23 05:21:35.456883
1525	5	0.5	168	2014	2014-03-13	2014-03-13	sick	approved	\N	\N
1564	2	5	29	2014	2014-03-03	2014-03-07	Not feeling well	approved	\N	\N
1587	1	2	146	2014	2014-03-13	2014-03-14	marriage	approved	\N	\N
1568	5	0.5	143	2014	2014-03-12	2014-03-12	Personal	approved	\N	\N
1581	1	2	131	2014	2014-03-24	2014-03-25	sick	approved	\N	\N
1570	1	1	162	2014	2014-03-24	2014-03-24	Not felling well	approved	\N	\N
1596	8	1	60	2014	2014-03-31	2014-03-31	ugadhi	approved	\N	\N
1602	1	2	117	2014	2014-03-27	2014-03-28	Not well	approved	\N	\N
1584	8	1	109	2014	2014-03-31	2014-03-31	 Festival - Ugadi	approved	\N	\N
1599	2	10	145	2014	2014-06-02	2014-06-13	My own uncle is not well .Need to undergo an operation in June. Since I’m the alone son in the entire family,so need to process the entire formalities.	approved	\N	\N
2375	2	2	198	2014	2014-10-23	2014-10-24	For my brothers engagement.	approved	\N	\N
2365	2	2	169	2014	2014-10-23	2014-10-24	Festival	approved	\N	\N
2371	8	1	131	2014	2014-10-23	2014-10-23	Diwali	approved	\N	\N
2372	8	1	108	2014	2014-10-23	2014-10-23	Diwali Leave	approved	\N	\N
2393	5	0.5	101	2014	2014-10-22	2014-10-22	Dad hospitalised	approved	\N	\N
2391	2	3	101	2014	2014-10-14	2014-10-16	Dad Hospitalised	cancelled	\N	\N
2370	5	1	59	2014	2014-10-24	2014-10-24	Having some personal work	approved	\N	\N
2378	3	1	155	2014	2014-10-22	2014-10-22	Friend Father has dead	approved	\N	\N
2404	8	1	206	2014	2014-10-23	2014-10-23	As I am going my home town on the occasion of diwali.	approved	\N	\N
2413	2	5	151	2014	2014-11-03	2014-11-07	Going home town for some personal work	approved	\N	\N
2419	5	0.5	171	2014	2014-10-30	2014-10-30	personal work	approved	\N	\N
2398	5	0.5	163	2014	2014-10-27	2014-10-27	Due to Urgent Family reason.	approved	\N	\N
2389	2	1	51	2014	2014-10-23	2014-10-23	For festival	approved	\N	\N
2424	5	0.5	145	2014	2014-10-31	2014-10-31	Going to yeshwanthpur (railway station) to receive friends who is coming first time in Bangalore.	approved	\N	\N
2427	1	1	98	2014	2014-10-31	2014-10-31	not feeling well	approved	\N	\N
2437	5	1	154	2014	2014-10-30	2014-10-30	Travelling 	approved	\N	\N
2436	5	1	52	2014	2014-10-29	2014-10-29	I had fever.	approved	\N	\N
2379	1	1	163	2014	2014-10-22	2014-10-22	Not feeling well	approved	\N	\N
2448	5	0.5	169	2014	2014-11-04	2014-11-04	sick	approved	\N	\N
2459	1	1	59	2014	2014-11-05	2014-11-05	Not feeling good	approved	\N	\N
2430	1	1	102	2014	2014-10-31	2014-10-31	Fever	approved	\N	\N
2399	2	0.5	45	2014	2014-10-27	2014-10-27	went to hospital	approved	\N	\N
2466	5	0.5	163	2014	2014-11-10	2014-11-10	Personal reasons	approved	\N	\N
2450	1	1	188	2014	2014-11-05	2014-11-05	wart in leg	approved	\N	\N
2406	2	8	117	2014	2014-11-26	2014-12-05	My marriage	approved	\N	\N
2881	8	1	185	2015	2015-01-15	2015-01-15	Attending Marriage Program.    	approved	2015-01-14 06:59:42.001541	2015-01-16 04:26:33.594771
3023	5	0.5	176	2015	2015-02-17	2015-02-17	festival\r\n	cancelled	2015-02-17 07:38:26.610215	2015-02-17 07:44:14.057508
3015	5	0.5	118	2015	2015-02-18	2015-02-18	Appointment in passport office for passport renewal	approved	2015-02-17 05:26:38.929005	2015-02-19 11:04:49.903235
3017	2	4	165	2015	2015-03-04	2015-03-09	Privileged leave, going to home town. 	approved	2015-02-17 05:32:26.509006	2015-03-04 05:13:17.536474
3313	1	2	232	2015	2015-03-25	2015-03-26	Met with an accident	approved	2015-04-27 05:29:46.6502	2015-04-27 05:29:46.6502
3316	8	2	63	2015	2015-04-14	2015-04-15	Optional Leave taken for Tamil New year. Personal work	Pending	2015-04-27 06:21:57.809933	2015-04-27 06:21:57.809933
3308	2	1	223	2015	2015-04-17	2015-04-17	Birthday celebrations with family	approved	2015-04-27 04:29:49.619737	2015-04-27 08:43:33.661115
3311	5	0.5	142	2015	2015-04-27	2015-04-27	personal work	approved	2015-04-27 05:20:23.94109	2015-04-27 09:41:24.715172
3330	2	1	144	2015	2015-04-30	2015-04-30	I have personal work.	approved	2015-04-29 07:33:27.02075	2015-04-29 09:10:03.734995
3338	5	1	233	2015	2015-05-05	2015-05-05	Due to family function in native	approved	2015-05-04 07:27:44.047084	2015-05-21 11:12:56.990968
3831	1	4	70	2015	2015-09-18	2015-09-23	Pre Maternity leave.	Pending	2015-09-09 08:46:01.765964	2015-09-09 08:46:01.765964
3834	2	4	70	2015	2015-10-05	2015-10-08	Pre Maternity leave.	Pending	2015-09-09 08:49:48.478623	2015-09-09 08:49:48.478623
3825	5	1	72	2015	2015-09-10	2015-09-10	Going for wedding	approved	2015-09-09 04:35:42.745047	2015-09-15 11:28:52.67566
3833	8	1	253	2015	2015-09-17	2015-09-17	To celebrate Ganesh Chathurthi festival	approved	2015-09-09 08:49:45.519211	2015-09-25 10:59:57.68148
4153	2	1	140	2015	2015-11-11	2015-11-11	For Diwali celebrations 	approved	2015-11-10 06:08:04.952066	2015-11-12 06:02:11.137506
4189	5	1	90	2015	2015-11-18	2015-11-18	Require 1/2 Day Leave (second Half) for Going to receive Brother from Yeshwantpur Railway Station.	Pending	2015-11-18 12:17:49.570364	2015-11-18 12:17:49.570364
4174	1	2	134	2015	2015-11-05	2015-11-06	Health was not good.	approved	2015-11-16 06:25:53.082878	2015-11-20 05:29:08.296947
4175	8	1	134	2015	2015-11-11	2015-11-11	Health was not good.	approved	2015-11-16 06:26:32.298083	2015-11-20 05:29:14.828078
4211	2	1	185	2015	2015-11-25	2015-11-25	Family Seminar	Pending	2015-11-24 08:03:24.501011	2015-11-24 08:03:24.501011
4212	2	1	185	2015	2015-11-27	2015-11-27	Family Prayer Meeting	Pending	2015-11-24 08:04:17.679604	2015-11-24 08:04:17.679604
4209	2	11	95	2015	2015-11-09	2015-11-23	Diwali holidays.	approved	2015-11-24 07:04:17.152986	2015-11-24 08:13:43.702599
4173	3	3	31	2015	2015-11-09	2015-11-11	My uncle has passed away.	approved	2015-11-16 05:33:18.977426	2015-11-24 08:15:58.307978
4218	2	2	178	2015	2015-11-25	2015-11-26	out of station 	Pending	2015-11-24 10:40:48.361175	2015-11-24 10:40:48.361175
4232	2	2	226	2015	2015-12-03	2015-12-04	Exam	Pending	2015-11-28 12:24:48.700001	2015-11-28 12:24:48.700001
4185	1	2	71	2015	2015-11-09	2015-11-10	Sick	approved	2015-11-18 05:57:54.04021	2015-11-30 05:00:19.716543
4179	2	2	253	2015	2015-11-19	2015-11-20	To attend sister's house warming ceremony	approved	2015-11-16 11:03:16.750901	2015-11-30 05:01:45.821902
4213	3	1	72	2015	2015-11-20	2015-11-20	Relative expired	approved	2015-11-24 09:13:28.712462	2015-11-30 05:04:00.375123
4159	8	1	171	2015	2015-11-11	2015-11-11	Deepavali	approved	2015-11-10 13:35:52.638748	2015-11-30 09:00:21.576626
4248	5	1	33	2015	2015-11-02	2015-11-02	Not Well	approved	2015-11-30 10:40:15.731151	2015-11-30 10:40:15.731151
4252	2	1	233	2015	2015-11-23	2015-11-23	Not Well	approved	2015-11-30 12:29:55.261004	2015-11-30 12:29:55.261004
4194	5	1	209	2015	2015-11-18	2015-11-18	I was not feeling well.	approved	2015-11-20 10:13:34.7969	2015-12-02 06:59:26.735362
4264	2	1	253	2015	2015-11-30	2015-11-30	Because of brother's marriage.	Pending	2015-12-03 05:35:30.674416	2015-12-03 05:35:30.674416
4265	5	1	215	2015	2015-12-03	2015-12-03	Not feeling well	Pending	2015-12-03 07:01:34.824441	2015-12-03 07:01:34.824441
4239	8	1	77	2015	2015-11-25	2015-11-25	took for karthigai deepam	approved	2015-11-30 04:51:43.839067	2015-12-07 11:26:17.136482
4240	1	1	77	2015	2015-11-27	2015-11-27	went to hospital, vaccine for my daughter	approved	2015-11-30 04:54:45.910967	2015-12-11 09:50:33.204299
4220	3	1	226	2015	2015-11-23	2015-11-23	To attend funeral of Uncle	approved	2015-11-24 12:44:16.782733	2015-12-11 09:52:24.32108
4233	2	5	226	2015	2015-12-14	2015-12-18	Exam	cancelled	2015-11-28 12:26:36.973348	2015-12-11 12:08:10.260164
4268	1	1	133	2015	2015-12-03	2015-12-03	I am not feeling well.	approved	2015-12-04 04:17:39.092957	2015-12-16 05:35:31.933688
4223	2	3	222	2015	2015-11-18	2015-11-20	I was not feeling well	approved	2015-11-25 04:17:56.699916	2015-12-22 10:11:47.030636
1565	2	2	29	2014	2014-03-10	2014-03-11	Not feeling well	approved	\N	\N
1566	5	3	29	2014	2014-03-12	2014-03-14	Not feeling well	approved	\N	\N
1534	2	0.5	123	2014	2014-03-14	2014-03-14	going to native	approved	\N	\N
1591	1	1	108	2014	2014-03-27	2014-03-27	Not well	approved	\N	\N
1573	1	1	59	2014	2014-03-24	2014-03-24	suffered from fever	approved	\N	\N
1603	8	1	146	2014	2014-03-31	2014-03-31	festival	approved	\N	\N
1575	9	1	99	2014	2014-03-24	2014-03-24	Personal	approved	\N	\N
1585	8	1	128	2014	2014-03-31	2014-03-31	Ugadi Festival	approved	\N	\N
1600	5	0.5	94	2014	2014-03-31	2014-03-31	going to hometown for ugadi	approved	\N	\N
1574	1	1	77	2014	2014-03-24	2014-03-24	Due to personal illness	approved	\N	\N
1610	8	1	107	2014	2014-04-18	2014-04-18	Good friday	approved	\N	\N
1606	2	5	109	2014	2014-04-21	2014-04-25	Going to hometown	approved	\N	\N
36	9	1	56	2012	2012-10-29	2012-10-29	As I am going to my native place.	approved	\N	\N
160	2	6	90	2012	2012-12-11	2012-12-18	Going New Delhi for medical treatment of my father. Operation date is scheduled on Dec 15, 2012.	approved	\N	\N
2882	8	1	194	2015	2015-01-15	2015-01-15	Personal	approved	2015-01-14 07:58:50.656758	2015-01-21 09:14:25.465169
2883	5	1	194	2015	2015-01-28	2015-01-28	Meeting at Kids' school	approved	2015-01-14 08:00:29.449086	2015-02-03 04:14:57.22089
3030	5	0.5	80	2015	2015-02-18	2015-02-18	As i have some personal work.	approved	2015-02-18 06:20:18.455999	2015-02-19 04:32:47.340037
3029	5	0.5	171	2015	2015-02-18	2015-02-18	personal work	approved	2015-02-18 05:38:20.28316	2015-02-19 04:32:49.647227
3032	3	3	158	2015	2015-02-16	2015-02-18	Ground mother died 	approved	2015-02-19 04:57:12.618325	2015-02-19 05:01:40.766327
3022	5	0.5	176	2015	2015-02-17	2015-02-17	festival\r\n	approved	2015-02-17 07:38:26.603986	2015-02-19 05:59:54.503389
3024	1	1	99	2015	2015-02-13	2015-02-13	Cough n cold.	approved	2015-02-17 09:06:13.67957	2015-02-19 06:01:02.183334
3020	1	1	194	2015	2015-02-16	2015-02-16	Was not feeling well	approved	2015-02-17 06:37:00.306926	2015-02-24 04:27:16.824328
3026	5	1	59	2015	2015-02-16	2015-02-16	As I went to bank for loan.	approved	2015-02-18 04:57:58.779003	2015-02-24 04:29:13.713241
3021	1	2	117	2015	2015-02-12	2015-02-13	Sprain in leg	approved	2015-02-17 06:50:09.535667	2015-03-06 07:05:16.00096
3317	1	1	131	2015	2015-04-09	2015-04-09	Sick leave	approved	2015-04-27 06:24:39.659998	2015-04-27 08:43:14.71631
3315	8	1	45	2015	2015-04-03	2015-04-03	Good Friday	approved	2015-04-27 06:03:54.410893	2015-04-27 08:44:17.168603
3318	8	1	131	2015	2015-04-02	2015-04-02	optional leave	approved	2015-04-27 06:25:13.816923	2015-04-27 08:44:22.467234
3319	5	1	131	2015	2015-04-01	2015-04-01	Time off	approved	2015-04-27 06:26:00.739727	2015-04-27 08:44:27.071439
3309	1	2	45	2015	2015-03-27	2015-03-30	Health checkup	approved	2015-04-27 05:14:48.13644	2015-04-27 08:44:36.114816
3333	5	0.5	63	2015	2015-04-29	2015-04-29	Not feeling Well. Half day leave taken.	Pending	2015-04-30 07:03:02.83189	2015-04-30 07:03:02.83189
3336	2	1	158	2015	2015-05-04	2015-05-04	going to home 	approved	2015-04-30 12:45:25.863193	2015-04-30 12:53:56.41471
3326	2	3	33	2015	2015-04-29	2015-05-04	going home	approved	2015-04-28 07:49:56.199738	2015-05-05 16:07:45.043249
3322	5	0.5	99	2015	2015-04-24	2015-04-24	personal	approved	2015-04-27 07:04:05.486882	2015-05-13 10:30:00.774404
3826	8	1	142	2015	2015-09-17	2015-09-17	Ganesh Chathurti\r\n	approved	2015-09-09 04:42:14.332381	2015-09-24 05:11:17.874019
4181	2	1	221	2015	2015-11-16	2015-11-16	Could not get my train ticket reservation confirmed from Tuljapur to Kalyan on 15/11/16 and had to travel by road on the 16th.	Pending	2015-11-16 14:17:37.212525	2015-11-16 14:17:37.212525
4192	3	4	101	2015	2015-11-16	2015-11-19	Grand Father Passed away	approved	2015-11-20 05:09:57.960332	2015-11-20 05:29:00.62308
4172	1	1	168	2015	2015-11-13	2015-11-13	going to hospital	approved	2015-11-16 05:18:42.415049	2015-11-20 05:29:26.293965
4202	1	2	109	2015	2015-12-21	2015-12-22	My Marriage.	Pending	2015-11-23 06:57:03.799357	2015-11-23 06:57:03.799357
4198	5	2	226	2015	2015-11-12	2015-11-13	Unwell	approved	2015-11-20 11:16:03.789766	2015-11-24 10:36:09.918505
4210	2	1	235	2015	2015-11-12	2015-11-12	I was in native for diwali celebration.	approved	2015-11-24 07:59:13.857058	2015-11-24 10:36:24.901486
4201	2	2	109	2015	2015-12-17	2015-12-18	My Marriage.	approved	2015-11-23 06:56:05.814686	2015-11-24 10:36:56.893569
4231	2	1	221	2015	2015-11-27	2015-11-27	personal	Pending	2015-11-26 12:59:56.943224	2015-11-26 12:59:56.943224
4234	2	4	226	2015	2015-12-21	2015-12-24	Exam	Pending	2015-11-28 12:28:50.077937	2015-11-28 12:28:50.077937
4236	2	3	226	2015	2015-12-28	2015-12-30	Exam	Pending	2015-11-28 12:31:50.143745	2015-11-28 12:31:50.143745
4238	2	5	101	2015	2015-11-23	2015-11-27	Dad hospitalised	approved	2015-11-30 04:48:06.393502	2015-11-30 04:50:30.543612
4187	1	1	71	2015	2015-11-12	2015-11-12	sick	approved	2015-11-18 05:58:58.53079	2015-11-30 05:00:12.705291
4251	1	2	238	2015	2015-11-02	2015-11-03	Not Feeling Well	approved	2015-11-30 12:23:18.103486	2015-11-30 12:23:18.103486
4257	1	1	90	2015	2015-12-01	2015-12-01	Cold & fever.	Pending	2015-12-01 05:41:34.800048	2015-12-01 05:41:34.800048
4258	2	1	131	2015	2015-11-30	2015-11-30	Not well	Pending	2015-12-01 08:26:45.19482	2015-12-01 08:26:45.19482
4254	2	4	229	2015	2015-12-01	2015-12-04	goto home	approved	2015-11-30 12:55:52.825812	2015-12-01 12:04:01.15966
4260	5	1	131	2015	2015-12-02	2015-12-02	travel	cancelled	2015-12-02 01:39:52.143301	2015-12-02 08:34:34.232393
4267	5	0.5	31	2015	2015-12-03	2015-12-03	I had some personal work.	Pending	2015-12-03 13:59:04.399345	2015-12-03 13:59:04.399345
4242	8	1	260	2015	2015-11-11	2015-11-11	Optional leave	approved	2015-11-30 06:06:25.337127	2015-12-04 06:31:44.517421
4274	1	1	51	2015	2015-12-04	2015-12-04	I was not comfortable.	Pending	2015-12-07 05:40:58.688335	2015-12-07 05:40:58.688335
4221	1	1	217	2015	2015-11-24	2015-11-24	not feeling well	approved	2015-11-25 04:10:27.11797	2015-12-07 11:25:09.110821
4282	1	1	212	2015	2015-12-07	2015-12-07	Hand and Leg Sprain 	approved	2015-12-08 06:02:01.70754	2015-12-11 09:45:46.712902
4205	2	2	214	2015	2015-12-07	2015-12-08	Attend wedding in the family.	approved	2015-11-23 07:32:14.54669	2015-12-11 09:48:25.117527
4270	1	1	245	2015	2015-12-03	2015-12-03	Not well,was having fever and cold	approved	2015-12-04 07:21:34.449157	2015-12-24 05:10:48.899504
1552	8	1	165	2014	2014-03-17	2014-03-17	For Holi Occasion  	approved	\N	\N
1588	5	5	146	2014	2014-03-03	2014-03-07	marriage	approved	\N	\N
1567	1	2	143	2014	2014-03-13	2014-03-14	Was having extreme fever and stomache.	approved	\N	\N
1593	1	1	120	2014	2014-03-27	2014-03-27	Unwell	approved	\N	\N
1597	8	1	175	2014	2014-03-31	2014-03-31	festival	cancelled	\N	\N
1592	8	1	145	2014	2014-03-31	2014-03-31	on the eve of festival.	cancelled	\N	\N
1582	1	1	139	2014	2014-03-20	2014-03-20	Not Well	approved	\N	\N
1601	8	1	36	2014	2014-03-31	2014-03-31	Festival	approved	\N	\N
1580	1	1	117	2014	2014-03-25	2014-03-25	Cough and cold	approved	\N	\N
1609	2	1	107	2014	2014-04-17	2014-04-17	Easter going to native	cancelled	\N	\N
1578	8	1	87	2014	2014-04-18	2014-04-18	Good Friday...\r\nGoing to my home town....	approved	\N	\N
1583	2	1	94	2014	2014-04-01	2014-04-01	going to hometown for ugadi 	approved	\N	\N
1604	1	1	120	2014	2014-04-01	2014-04-01	Suffering from Viral fever	approved	\N	\N
1612	1	1	146	2014	2014-04-02	2014-04-02	stomach pain	approved	\N	\N
2469	1	1	64	2014	2014-11-05	2014-11-05	Not feeling well	approved	\N	\N
2474	8	1	64	2014	2014-11-04	2014-11-04	As available optional leave	approved	\N	\N
2471	1	1	170	2014	2014-11-10	2014-11-10	sick 	approved	\N	\N
2483	5	0.5	91	2014	2014-11-13	2014-11-13	not feeling well headache.	cancelled	\N	\N
2516	5	0.5	143	2014	2014-11-20	2014-11-20	Feeling very tired drowsy.	approved	\N	\N
2487	5	1	91	2014	2014-11-13	2014-11-13	Not feeling well headache.	approved	\N	\N
2522	1	2	170	2014	2014-11-19	2014-11-20	Met with accident.	approved	\N	\N
2521	5	0.5	147	2014	2014-11-24	2014-11-24	Not feeling well	cancelled	\N	\N
2529	1	1	147	2014	2014-11-21	2014-11-21	Not feeling well	approved	\N	\N
2509	2	2	171	2014	2014-11-20	2014-11-21	Personal Work	approved	\N	2015-01-05 09:09:09.186366
2518	5	1	176	2014	2014-11-24	2014-11-24	out of station	approved	\N	\N
2538	5	0.5	145	2014	2014-11-19	2014-11-19	Not well, suffered from cold and fever	approved	\N	\N
2524	2	8	143	2014	2014-12-01	2014-12-10	Going to native.	approved	\N	\N
2525	2	7	168	2014	2014-12-18	2014-12-26	going to native	cancelled	\N	\N
2540	1	1	185	2014	2014-11-24	2014-11-24	I was suffering from cold 	approved	\N	\N
2537	5	0.5	70	2014	2014-11-24	2014-11-24	I was not feeling well due to fever.	approved	\N	\N
2889	8	1	171	2015	2015-01-15	2015-01-15	Sankranti	cancelled	2015-01-14 12:14:34.272916	2015-01-14 12:25:45.03623
2886	5	0.5	134	2015	2015-01-14	2015-01-14	For sankranti. \r\n	approved	2015-01-14 08:14:27.504821	2015-01-19 06:49:34.523204
2891	8	1	94	2015	2015-01-15	2015-01-15	Sankranthi	approved	2015-01-14 12:25:39.634337	2015-01-21 05:56:14.752923
2884	5	0.5	194	2015	2015-01-29	2015-01-29	Meeting at Kids' school	approved	2015-01-14 08:00:58.496045	2015-02-03 04:14:47.019549
3033	8	1	158	2015	2015-01-15	2015-01-15	pongal festival	approved	2015-02-19 05:22:24.34267	2015-02-19 05:23:54.459812
3314	2	4	45	2015	2015-04-14	2015-04-17	medical issue	approved	2015-04-27 05:32:19.995782	2015-04-27 08:43:23.231842
3329	5	0.5	144	2015	2015-04-29	2015-04-29	I have personal work.	approved	2015-04-29 07:33:00.415638	2015-04-29 09:09:59.308023
3310	2	1	87	2015	2015-04-30	2015-04-30	Going to home town.	approved	2015-04-27 05:17:28.725982	2015-05-04 06:57:58.963432
3331	2	2	29	2015	2015-05-04	2015-05-05	Going to native for some urgent personal issue	approved	2015-04-30 05:38:51.451021	2015-05-08 05:24:07.776599
3324	2	1	48	2015	2015-04-30	2015-04-30	Going to Native	approved	2015-04-27 12:13:41.311592	2015-05-13 10:34:17.394826
3334	5	0.5	203	2015	2015-04-30	2015-04-30	Marriage 	approved	2015-04-30 08:16:28.595869	2015-05-13 11:04:11.388368
3836	6	57	70	2015	2015-10-14	2015-12-31	Maternity leaves.	cancelled	2015-09-09 09:27:18.563042	2015-09-09 11:39:52.972968
4203	5	2	109	2015	2015-12-23	2015-12-24	My Marriage.	Pending	2015-11-23 06:57:57.608675	2015-11-23 06:57:57.608675
4206	3	1	63	2015	2015-11-20	2015-11-20	Sister's Father inlaw expired.	Pending	2015-11-23 11:00:31.473206	2015-11-23 11:00:31.473206
4208	9	1	41	2015	2015-11-23	2015-11-23	Due to train Canceled .	approved	2015-11-24 04:56:27.898218	2015-11-24 08:16:06.831938
4200	5	0.5	163	2015	2015-11-20	2015-11-20	Going native	approved	2015-11-23 05:07:27.552752	2015-11-24 08:16:10.2288
4215	8	1	98	2015	2015-11-25	2015-11-25	Have Some Personal Work.	approved	2015-11-24 09:28:09.242476	2015-11-24 13:43:59.546984
4235	8	1	226	2015	2015-12-25	2015-12-25	Milad	Pending	2015-11-28 12:30:24.602859	2015-11-28 12:30:24.602859
4214	1	1	160	2015	2015-11-23	2015-11-23	Headache and Cold	approved	2015-11-24 09:28:04.908178	2015-11-30 05:03:05.259903
4246	8	1	197	2015	2015-11-25	2015-11-25	Festival	approved	2015-11-30 07:13:17.886759	2015-11-30 07:13:55.429734
4225	1	1	171	2015	2015-11-24	2015-11-24	Not feeling well	approved	2015-11-25 05:04:22.789764	2015-11-30 09:00:05.446255
4229	9	1	91	2015	2015-11-27	2015-11-27	Going to friend marriage	approved	2015-11-26 05:41:32.786788	2015-11-30 09:00:12.329031
4243	1	1	95	2015	2015-11-06	2015-11-06	sick	approved	2015-11-30 06:40:48.194482	2015-11-30 10:57:02.381077
4253	1	4	229	2015	2015-12-01	2015-12-04	sick and goto home	cancelled	2015-11-30 12:51:46.175864	2015-11-30 12:55:17.846481
4255	2	1	218	2015	2015-12-01	2015-12-01	Emergency situation.	Pending	2015-12-01 04:36:54.762927	2015-12-01 04:36:54.762927
4247	5	0.5	209	2015	2015-11-30	2015-11-30	Not feeling well	approved	2015-11-30 07:34:00.970474	2015-12-02 06:59:33.893442
4216	2	2	151	2015	2015-12-03	2015-12-04	Going for Sisters marriage	approved	2015-11-24 09:28:23.150408	2015-12-03 10:03:39.997115
4271	2	4	102	2015	2015-12-28	2015-12-31	Personal work	Pending	2015-12-04 10:45:51.737661	2015-12-04 10:45:51.737661
4277	7	1	71	2015	2015-12-01	2015-12-01	Naming Ceremony 	Pending	2015-12-07 12:24:23.017975	2015-12-07 12:24:23.017975
4278	2	2	71	2015	2015-12-02	2015-12-03	Naming Ceremony 	Pending	2015-12-07 12:24:44.736773	2015-12-07 12:24:44.736773
4269	1	1	242	2015	2015-12-04	2015-12-04	I am suffering with diarrhoea.	approved	2015-12-04 04:22:44.181015	2015-12-11 09:51:07.996326
4250	2	1	250	2015	2015-11-10	2015-11-10	On account of Diwali celebration, i am leaving for my home town.	approved	2015-11-30 11:38:58.170334	2015-12-11 09:53:05.682846
4273	1	2	142	2015	2015-12-03	2015-12-04	Suffering from cold and cough.	approved	2015-12-07 04:21:47.596291	2015-12-24 05:11:03.048124
1590	8	1	125	2014	2014-03-31	2014-03-31	Optional	approved	\N	\N
1608	3	1	99	2014	2014-03-28	2014-03-28	Uncle death.	approved	\N	\N
1607	8	1	99	2014	2014-03-31	2014-03-31	Ugadi	approved	\N	\N
1579	2	1	154	2014	2014-03-18	2014-03-18	Personal	approved	\N	\N
1595	8	1	140	2014	2014-03-31	2014-03-31	For ugadi festival	approved	\N	\N
1598	8	1	33	2014	2014-03-31	2014-03-31	Personal work	approved	\N	\N
1617	1	1	134	2014	2014-03-31	2014-03-31	Health was not good.	approved	\N	\N
1618	1	2	54	2014	2014-03-26	2014-03-27	Suffering from fever	approved	\N	\N
1619	8	3	54	2014	2014-04-14	2014-04-16	Going to native as my mom is not feeling well	cancelled	\N	\N
1620	2	2	54	2014	2014-04-17	2014-04-18	Going to native since my mom is not feeling well	cancelled	\N	\N
1630	1	1	60	2014	2014-03-24	2014-03-24	Fever	approved	\N	\N
1632	8	1	159	2014	2014-03-31	2014-03-31	ugadi festival	approved	\N	\N
1636	2	1	120	2014	2014-04-09	2014-04-09	Was out of station	approved	\N	\N
1635	8	1	120	2014	2014-03-31	2014-03-31	Optional-Ugadi	approved	\N	\N
1638	6	84	140	2014	2014-05-05	2014-08-29	Going for maternity	cancelled	\N	\N
1641	8	2	54	2014	2014-04-14	2014-04-15	Going to Native	approved	\N	\N
1642	2	3	54	2014	2014-04-16	2014-04-18	Going to Native	approved	\N	\N
1634	8	1	91	2014	2014-04-14	2014-04-14	Tamil new year	approved	\N	\N
1655	8	1	177	2014	2014-04-18	2014-04-18	Optional	cancelled	\N	\N
1664	5	0.5	171	2014	2014-04-19	2014-04-19	Personal work.	approved	\N	\N
1614	1	1	175	2014	2014-04-07	2014-04-07	Medical check up, after surgery	approved	\N	\N
1615	1	4	90	2014	2014-04-07	2014-04-10	For medical treatment.	approved	\N	\N
1616	2	2	144	2014	2014-04-03	2014-04-04	privileged	approved	\N	\N
1668	1	0.5	128	2014	2014-04-21	2014-04-21	Head ache and eye burning sensation 	cancelled	\N	\N
1572	5	0.5	31	2014	2014-03-24	2014-03-24	Some personal work.	approved	\N	\N
1621	5	1	162	2014	2014-04-07	2014-04-07	due to Pain 	approved	\N	\N
1622	5	0.5	31	2014	2014-04-07	2014-04-07	not feeling well	approved	\N	\N
1624	8	1	102	2014	2014-04-14	2014-04-14	Personal work	approved	\N	\N
1626	8	1	59	2014	2014-04-14	2014-04-14	Tamil New Year.	approved	\N	\N
1623	2	1	169	2014	2014-04-08	2014-04-08	personal problem	approved	\N	\N
1627	1	1	134	2014	2014-04-08	2014-04-08	Due to Knee pain.	approved	\N	\N
1628	1	1	72	2014	2014-04-08	2014-04-08	not feeling well due to minor fracture to the leg	approved	\N	\N
1629	5	0.5	70	2014	2014-04-09	2014-04-09	Due to some personal health issues.	approved	\N	\N
1631	5	0.5	139	2014	2014-04-09	2014-04-09	Sick	approved	\N	\N
1633	2	3	163	2014	2014-04-14	2014-04-16	Going to Native for Vishu	approved	\N	\N
1637	2	1	94	2014	2014-04-16	2014-04-16	going to tirupathi	approved	\N	\N
1639	8	1	175	2014	2014-04-14	2014-04-14	Tamil NEW YEAR	approved	\N	\N
1667	2	1	51	2014	2014-04-18	2014-04-19	went to temple	approved	\N	\N
1647	1	1.5	52	2014	2014-04-10	2014-04-11	I had fever.	approved	\N	\N
1669	1	1	52	2014	2014-04-19	2014-04-19	I was not feeling well.	approved	\N	\N
1663	5	0.5	138	2014	2014-04-19	2014-04-19	Personal work.	approved	\N	\N
1652	2	0.5	107	2014	2014-04-16	2014-04-16	second half can you give leave for personal work.	approved	\N	\N
1657	2	1	70	2014	2014-05-23	2014-05-23	Personal Work.	approved	\N	\N
1643	8	1	139	2014	2014-04-14	2014-04-14	festival	approved	\N	\N
1650	1	1	98	2014	2014-04-14	2014-04-14	Not feeling well	approved	\N	\N
1658	8	1	55	2014	2014-04-14	2014-04-14	Going to Native	approved	\N	\N
1649	2	2	144	2014	2014-04-10	2014-04-11	Sick	approved	\N	\N
1645	1	1	145	2014	2014-04-11	2014-04-11	Suffered From Sick.	approved	\N	\N
1662	1	1	95	2014	2014-04-14	2014-04-14	sick	approved	\N	\N
1640	2	3	123	2014	2014-04-23	2014-04-25	going to native	cancelled	\N	\N
1659	2	5	98	2014	2014-05-19	2014-05-23	Going Native due to some work.	cancelled	\N	\N
1683	2	1	133	2014	2014-04-30	2014-04-30	i am going to native.	approved	\N	\N
1684	2	1	133	2014	2014-05-02	2014-05-02	i am going to native.	approved	\N	\N
1676	1	5	40	2014	2014-03-31	2014-04-04	Was Sick	approved	\N	\N
1677	4	5	40	2014	2014-04-07	2014-04-11	!	approved	\N	\N
1646	8	1	142	2014	2014-04-18	2014-04-18	going to chennai to meet family	approved	\N	\N
1648	8	1	80	2014	2014-04-18	2014-04-18	As I have some personal work.	approved	\N	\N
1656	2	1	80	2014	2014-04-19	2014-04-19	As I am going to Native.	approved	\N	\N
1653	2	2	42	2014	2014-04-18	2014-04-19	I am going to my native due to personal emergency..	approved	\N	\N
1654	8	1	31	2014	2014-04-18	2014-04-18	Going to native	approved	\N	\N
1661	5	0.5	111	2014	2014-04-19	2014-04-19	Personal Work!!!	approved	\N	\N
1665	5	0.5	94	2014	2014-04-19	2014-04-19	going to tumkur for friend's marriage	approved	\N	\N
1691	2	1	87	2014	2014-04-19	2014-04-19	Went to my native for easter....	approved	\N	\N
1671	5	0.5	170	2014	2014-04-21	2014-04-21	not feeling well. 	approved	\N	\N
1680	2	1	87	2014	2014-04-21	2014-04-21	Due to some personal reasons....	approved	\N	\N
1681	2	1	30	2014	2014-05-02	2014-05-02	personal work	approved	\N	\N
1688	5	0.5	33	2014	2014-04-23	2014-04-23	Personal	approved	\N	\N
1689	2	4	33	2014	2014-04-28	2014-05-02	Going Home	approved	\N	\N
1673	2	3	44	2014	2014-04-28	2014-04-30	going to native.	approved	\N	\N
1672	5	1	140	2014	2014-04-19	2014-04-20	Personal Work	approved	\N	\N
1685	2	2	101	2014	2014-04-24	2014-04-25	going native	approved	\N	\N
1674	2	1	44	2014	2014-05-02	2014-05-02	going to native.	approved	\N	\N
1675	2	5	155	2014	2014-05-05	2014-05-09	Personal issues	approved	\N	\N
1660	2	2	59	2014	2014-04-24	2014-04-25	As Iam going native for voting.	approved	\N	\N
1692	5	0.5	128	2014	2014-04-24	2014-04-24	Passport work 	approved	\N	\N
1625	2	1	111	2014	2014-05-02	2014-05-02	Going to Native.	approved	\N	\N
1682	2	5	98	2014	2014-05-12	2014-05-16	Going Native due to some work	approved	\N	\N
1687	2	15	108	2014	2014-05-02	2014-05-22	leave for my marriage	approved	\N	\N
1651	2	1	109	2014	2014-04-19	2014-04-19	Going to hometown	approved	\N	\N
1666	2	5	170	2014	2014-05-19	2014-05-23	cousin's marriage	approved	\N	\N
1678	2	3	123	2014	2014-04-28	2014-04-30	going to native	approved	\N	\N
1679	2	1	123	2014	2014-05-02	2014-05-02	going to native	approved	\N	\N
1613	5	0.5	171	2014	2014-04-03	2014-04-03	accompanying mother to hospital	approved	\N	\N
1690	2	1	87	2014	2014-04-04	2014-04-04	Due to some personal reasons.....	approved	\N	\N
1696	1	1	95	2014	2014-04-15	2014-04-15	sick	approved	\N	\N
1715	2	1	111	2014	2014-04-25	2014-04-25	Due to personal problem not able to come!!!\r\n	approved	\N	\N
1714	2	1	55	2014	2014-05-02	2014-05-02	Going to Native	approved	\N	\N
2472	5	1	170	2014	2014-11-07	2014-11-07	personal work	approved	\N	\N
2481	1	1	203	2014	2014-11-12	2014-11-12	Fever	approved	\N	\N
2494	9	1	144	2014	2014-11-14	2014-11-14	I have personal work.	approved	\N	\N
2497	1	1	169	2014	2014-11-17	2014-11-17	Fever	approved	\N	\N
2532	1	2	188	2014	2014-11-21	2014-11-24	operated\r\n	approved	\N	\N
2478	5	1	77	2014	2014-11-07	2014-11-07	gone for Personal work  	approved	\N	\N
2512	1	2	155	2014	2014-11-17	2014-11-18	Fever,cold and caugh	approved	\N	\N
2519	5	2	59	2014	2014-11-27	2014-11-28	Going native to attend cousin brother's marriage.	approved	\N	\N
2510	5	0.5	189	2014	2014-11-14	2014-11-14	Went to the hospital for friend's accident treatment	approved	\N	\N
2492	1	1	200	2014	2014-11-14	2014-11-14	Sir, \r\nI had taken leave on 14th November due to fever. Please approve. Thank you.	approved	\N	\N
2885	5	1	134	2015	2015-01-14	2015-01-14	For sankranti. \r\n	cancelled	2015-01-14 08:13:01.153915	2015-01-14 08:13:48.004171
2892	8	1	171	2015	2015-01-15	2015-01-15	Sankranthi	approved	2015-01-14 12:27:24.355264	2015-01-19 05:08:15.570129
3034	1	1	31	2015	2015-02-16	2015-02-16	I was not feeling well.	approved	2015-02-19 05:46:59.005147	2015-02-24 04:28:48.723288
3320	5	1	52	2015	2015-04-13	2015-04-13	leave taken and not applied. 	approved	2015-04-27 06:40:29.877834	2015-04-27 06:40:29.877834
3321	2	4	60	2015	2015-04-21	2015-04-24	Medical	approved	2015-04-27 06:48:04.278815	2015-04-30 10:19:02.057457
3337	1	1	233	2015	2015-05-05	2015-05-05	Due to family function in my native.	cancelled	2015-05-04 07:06:57.541171	2015-05-04 07:26:50.621967
3332	2	2	198	2015	2015-05-04	2015-05-05	Going to native for some personal works.	approved	2015-04-30 06:39:42.846735	2015-05-05 06:12:13.091927
3335	2	1	196	2015	2015-05-04	2015-05-04	Go to my home	approved	2015-04-30 11:55:10.681352	2015-05-07 07:32:02.337546
3328	2	1	128	2015	2015-04-22	2015-04-22	Went to home town	approved	2015-04-28 10:31:27.352185	2015-05-13 10:28:55.378552
3325	1	1	109	2015	2015-04-27	2015-04-27	Health was not good.	approved	2015-04-28 04:29:08.773277	2015-05-18 04:48:57.808965
3327	5	0.5	209	2015	2015-04-28	2015-04-28	Going Home	approved	2015-04-28 07:52:21.771751	2015-05-21 10:59:40.938123
3837	2	1	253	2015	2015-09-11	2015-09-11	Going native 	approved	2015-09-09 09:53:40.047775	2015-09-25 10:55:25.487412
4190	2	3	220	2015	2015-11-20	2015-11-24	My mother is under medical treatment.	approved	2015-11-19 12:52:03.246351	2015-11-30 04:33:27.460505
4259	2	2	131	2015	2015-12-03	2015-12-04	Vacation	Pending	2015-12-01 09:05:55.424332	2015-12-01 09:05:55.424332
4256	1	1	102	2015	2015-11-30	2015-11-30	Fever	approved	2015-12-01 05:21:13.511697	2015-12-03 08:10:17.540545
4275	5	1	227	2015	2015-12-07	2015-12-07	personal work	approved	2015-12-07 09:18:43.395129	2015-12-07 09:20:22.065983
4245	1	1	266	2015	2015-11-23	2015-11-23	Viral Fever	approved	2015-11-30 07:04:44.492309	2015-12-07 11:25:57.733601
4279	5	2	71	2015	2015-12-24	2015-12-25	out of station	Pending	2015-12-07 12:28:45.680784	2015-12-07 12:28:45.680784
4281	5	2.5	71	2015	2015-12-21	2015-12-23	out of station	Pending	2015-12-07 12:35:38.89113	2015-12-07 12:35:38.89113
4241	5	1	117	2015	2015-12-01	2015-12-01	Personal Reason	approved	2015-11-30 05:36:02.021855	2015-12-11 09:51:46.538991
1686	1	1	170	2014	2014-04-22	2014-04-22	fever,cold.	approved	\N	\N
1705	1	2	60	2014	2014-04-21	2014-04-22	sick	approved	\N	\N
1693	2	1	155	2014	2014-05-02	2014-05-02	Going to meet mom	approved	\N	\N
1712	8	1	41	2014	2014-04-18	2014-04-18	Due to fever 	approved	\N	\N
1711	2	1	70	2014	2014-05-02	2014-05-02	For Passport verification. 	approved	\N	\N
1704	2	0.5	123	2014	2014-04-25	2014-04-25	going to native\r\n	approved	\N	\N
2473	1	0.5	52	2014	2014-11-10	2014-11-10	I was not feeling well.	approved	\N	\N
2476	2	1	51	2014	2014-11-12	2014-11-12	Having some personal work	approved	\N	\N
2485	5	0.5	145	2014	2014-11-14	2014-11-14	Appointment with doctor.	approved	\N	\N
2500	2	1	168	2014	2014-11-17	2014-11-17	 I have work at my home	approved	\N	\N
2499	5	1	54	2014	2014-11-17	2014-11-17	Personal Issue	approved	\N	\N
2501	1	1	30	2014	2014-11-18	2014-11-18	Not feeling well	approved	\N	\N
2477	2	2	171	2014	2014-11-13	2014-11-14	personal work	approved	\N	\N
2482	2	1	70	2014	2014-11-14	2014-11-14	Going to Tirupathi.	cancelled	\N	\N
2517	2	1	80	2014	2014-11-21	2014-11-21	Have some personal work.	approved	\N	\N
2506	5	1	154	2014	2014-11-18	2014-11-18	not well	approved	\N	\N
2513	1	1	185	2014	2014-11-05	2014-11-05	I was suffering from cold fever.	approved	\N	\N
2535	5	1	154	2014	2014-11-24	2014-11-24	Time Out	approved	\N	\N
2539	5	1	188	2014	2014-11-14	2014-11-14	injury	approved	\N	\N
2528	5	1	71	2014	2014-11-28	2014-11-28	Out of station	cancelled	\N	\N
2511	5	0.5	99	2014	2014-11-19	2014-11-19	Not felling well.	approved	\N	\N
2490	1	1	71	2014	2014-11-17	2014-11-17	Gastritis	approved	\N	\N
2897	2	1	33	2015	2015-01-16	2015-01-16	Friends Marriage	approved	2015-01-15 10:19:21.417356	2015-01-15 14:36:40.188619
2893	2	1	171	2015	2015-01-16	2015-01-16	Going to temple	approved	2015-01-14 12:27:58.648018	2015-01-19 05:08:18.285822
2896	5	0.5	51	2015	2015-01-15	2015-01-15	Due to festival	approved	2015-01-15 07:50:34.000446	2015-01-20 13:35:23.444416
2888	2	1	48	2015	2015-02-02	2015-02-02	Personal	approved	2015-01-14 08:21:02.702778	2015-01-21 09:13:43.325893
2887	2	1	48	2015	2015-01-19	2015-01-19	Personal	approved	2015-01-14 08:20:22.558596	2015-01-21 09:14:02.184964
3035	5	0.5	162	2015	2015-02-19	2015-02-19	I have some work	approved	2015-02-19 08:54:25.986617	2015-02-20 05:00:50.296545
3055	1	1	144	2015	2015-02-25	2015-02-25	Fever.	approved	2015-02-26 09:04:29.651345	2015-02-26 09:06:45.713701
3060	2	1	198	2015	2015-03-02	2015-03-02	urgent personal work.	approved	2015-02-27 12:02:06.938718	2015-03-02 05:39:30.635136
3058	2	3	45	2015	2015-02-24	2015-02-26	personal work	approved	2015-02-27 05:24:54.458716	2015-03-03 05:48:11.311992
3061	3	1	178	2015	2015-02-26	2015-02-26	Uncle passed away.	approved	2015-02-27 12:29:30.176214	2015-03-03 09:37:01.134437
3043	8	1	63	2015	2015-02-17	2015-02-17	Optional leave.	approved	2015-02-23 13:15:56.037525	2015-03-04 06:18:13.965068
3340	8	1	118	2015	2015-04-30	2015-04-30	On Vacation	approved	2015-05-04 07:46:17.201143	2015-05-04 07:46:17.201143
3350	2	2	60	2015	2015-04-29	2015-04-30	Sister health is not good	approved	2015-05-06 04:28:01.957373	2015-05-06 05:39:37.396355
3364	1	1	102	2015	2015-05-07	2015-05-07	Fever	approved	2015-05-08 10:15:28.264007	2015-05-08 10:17:36.796128
3371	2	1	60	2015	2015-05-12	2015-05-12	My Sister health problem	approved	2015-05-13 05:01:14.950576	2015-05-13 06:13:55.224088
3369	5	1	159	2015	2015-05-12	2015-05-12	health problem	approved	2015-05-12 05:00:21.082607	2015-05-13 06:13:58.856565
3382	1	1	191	2015	2015-05-14	2015-05-14	I was not feeling well.	approved	2015-05-15 04:18:36.317566	2015-05-15 05:29:46.049799
3355	8	1	235	2015	2015-04-30	2015-04-30	Buses were not available.	approved	2015-05-06 08:05:05.08721	2015-05-18 04:48:15.801629
3343	8	1	201	2015	2015-04-30	2015-04-30	Due to strike.	approved	2015-05-04 12:33:24.785566	2015-05-18 04:48:35.290308
3389	5	3	168	2015	2015-05-12	2015-05-14	sister health problem	approved	2015-05-18 05:08:57.996498	2015-05-18 11:57:32.853138
3380	2	5	170	2015	2015-05-18	2015-05-22	personal work	approved	2015-05-14 13:20:46.434857	2015-05-19 12:19:55.003695
3396	2	1	102	2015	2015-05-22	2015-05-22	Personal work	approved	2015-05-19 05:27:43.729083	2015-05-22 05:25:59.425885
3375	1	1	218	2015	2015-05-14	2015-05-14	Acute back spasm.	approved	2015-05-14 05:32:39.726077	2015-05-28 05:02:28.776135
3402	1	1	41	2015	2015-05-18	2015-05-18	Went to Hospital for Mom Check up.	approved	2015-05-19 14:40:11.152846	2015-05-28 05:13:05.040363
3400	5	0.5	176	2015	2015-05-19	2015-05-19	To meet cousins\r\n	approved	2015-05-19 13:15:11.895996	2015-05-28 05:21:56.201321
3391	2	2	51	2015	2015-05-14	2015-05-15	Due to some personnel work	approved	2015-05-18 05:14:21.405429	2015-05-28 05:22:41.282099
3352	5	1	155	2015	2015-05-29	2015-05-29	For My Marriage	approved	2015-05-06 05:17:44.621011	2015-06-03 05:27:10.728019
3404	2	10	210	2015	2015-10-19	2015-10-30	For durga-puja I am going to my native.	approved	2015-05-20 06:43:24.690747	2015-10-19 06:14:05.814243
4263	4	2	271	2015	2015-12-07	2015-12-08	Dear respected sir/madam, on 7/12/2015 i have medical check up of police sub inspector(PSI) kindly grant me a leave...\r\nthanking you	Pending	2015-12-02 10:41:55.887187	2015-12-02 10:41:55.887187
4266	5	0.5	169	2015	2015-12-01	2015-12-01	Personal Work 	approved	2015-12-03 07:16:32.661369	2015-12-03 10:03:25.483336
4217	2	3	151	2015	2015-12-07	2015-12-09	Going for Sisters marriage	approved	2015-11-24 09:28:56.269091	2015-12-03 10:03:44.28679
4276	5	0.5	169	2015	2015-12-07	2015-12-07	Personal Work 	approved	2015-12-07 09:23:48.39311	2015-12-07 09:26:37.338009
4280	2	4	71	2015	2015-12-28	2015-12-31	out of station	Pending	2015-12-07 12:29:16.920621	2015-12-07 12:29:16.920621
1695	2	1	95	2014	2014-04-03	2014-04-03	personal	approved	\N	\N
1697	2	1	68	2014	2014-04-25	2014-04-25	Need to go hospital	approved	\N	\N
1694	5	0.5	171	2014	2014-04-24	2014-04-24	not well	approved	\N	\N
1700	5	1	144	2014	2014-04-24	2014-04-24	I went Hospital. 	approved	\N	\N
1709	2	1	158	2014	2014-04-30	2014-04-30	 home town festival	approved	\N	\N
1713	2	1	176	2014	2014-05-02	2014-05-02	I will be out of station 	approved	\N	\N
2475	8	1	64	2014	2014-11-06	2014-11-06	As available optional leave	approved	\N	\N
2470	1	1	194	2014	2014-11-10	2014-11-10	was not feeling well	approved	\N	\N
2480	9	1	95	2014	2014-11-10	2014-11-10	was sick.	approved	\N	\N
2486	5	0.5	68	2014	2014-11-14	2014-11-14	Personal Work	approved	\N	\N
2498	2	1	60	2014	2014-11-17	2014-11-17	I have work at my home	approved	\N	\N
2495	1	1	87	2014	2014-11-17	2014-11-17	Due to illness	approved	\N	\N
2496	5	0.5	169	2014	2014-11-13	2014-11-13	Sick	approved	\N	\N
2515	5	0.5	101	2014	2014-11-20	2014-11-20	sick	approved	\N	\N
2530	2	1	147	2014	2014-11-24	2014-11-24	Not feeling well	approved	\N	\N
2520	2	1	158	2014	2014-11-24	2014-11-24	go to bank	approved	\N	\N
2504	1	1	194	2014	2014-11-18	2014-11-18	fever	approved	\N	\N
2491	2	4	159	2014	2014-11-25	2014-11-28	sister marriage	approved	\N	\N
2542	2	3	185	2014	2014-12-29	2014-12-31	Going to Home town	cancelled	\N	\N
2534	1	4	64	2014	2014-11-18	2014-11-21	Not feeling well	approved	\N	\N
2544	2	1	169	2014	2014-11-24	2014-11-24	Went to Hospital	approved	\N	\N
2541	2	2	185	2014	2014-12-23	2014-12-24	Going to Home town	approved	\N	\N
2543	2	3	185	2014	2014-12-29	2014-12-31	Going to Home town	approved	\N	\N
2533	2	0.5	45	2014	2014-11-25	2014-11-25	went to hospital	approved	\N	\N
2489	2	1	71	2014	2014-11-11	2014-11-11	Out of Station	approved	\N	\N
2507	2	1	63	2014	2014-11-13	2014-11-13	Personal outside work.	approved	\N	\N
2505	2	7	109	2014	2014-12-23	2014-12-31	My Brother marriage	approved	\N	\N
2890	2	1	171	2015	2015-01-16	2015-01-16	Going to Temple	cancelled	2015-01-14 12:15:24.292398	2015-01-14 12:25:46.217644
2894	8	1	144	2015	2015-01-15	2015-01-15	Festival	approved	2015-01-14 13:15:26.778365	2015-01-15 07:49:25.728571
2895	8	1	165	2015	2015-01-15	2015-01-15	Optional leave	approved	2015-01-14 17:04:41.41427	2015-01-16 04:26:30.280732
3036	8	1	151	2015	2015-02-17	2015-02-17	For festival	approved	2015-02-19 09:15:50.327957	2015-02-19 09:20:26.227162
3038	1	2	162	2015	2015-02-23	2015-02-24	Going to Pune	cancelled	2015-02-20 11:49:21.670811	2015-02-20 12:02:41.49929
3037	2	6	134	2015	2015-02-23	2015-03-02	Going home in brother marriage.	approved	2015-02-20 05:34:39.287731	2015-02-27 06:33:47.171918
3049	5	0.5	211	2015	2015-02-23	2015-02-23	Some urgent bank work.	approved	2015-02-24 06:27:30.29713	2015-03-03 05:48:26.240204
3051	5	1	160	2015	2015-02-16	2015-02-16	Personal	approved	2015-02-24 09:11:26.604682	2015-03-03 09:36:46.129073
3059	5	0.5	145	2015	2015-02-27	2015-02-27	appointment with doctor.	approved	2015-02-27 07:36:43.979286	2015-03-04 04:09:45.318786
3045	2	1	71	2015	2015-02-24	2015-02-24	Out of Station	approved	2015-02-23 17:03:36.741282	2015-03-04 05:54:10.213542
3062	8	1	142	2015	2015-03-06	2015-03-06	holi	approved	2015-03-02 04:50:42.631705	2015-03-06 07:49:18.117336
3351	2	1	60	2015	2015-05-05	2015-05-05	Sister health problem	approved	2015-05-06 04:29:06.303618	2015-05-06 05:39:39.450489
3344	1	1	133	2015	2015-05-04	2015-05-04	I am not feeling well	approved	2015-05-05 04:51:38.930238	2015-05-08 05:24:10.893501
3357	2	10	168	2015	2015-04-21	2015-05-05	sister health problem	approved	2015-05-06 10:08:39.050102	2015-05-08 05:24:12.975243
3358	2	1	94	2015	2015-05-07	2015-05-07	Cousins marriage	approved	2015-05-06 13:53:29.734367	2015-05-13 10:37:07.804363
3378	2	3	48	2015	2015-06-03	2015-06-05	Personal	Pending	2015-05-14 08:22:27.261295	2015-05-14 08:22:27.261295
3387	1	1	77	2015	2015-05-11	2015-05-11	went to hospital 	approved	2015-05-15 09:48:40.489428	2015-05-15 10:56:30.516232
3388	5	0.5	77	2015	2015-05-15	2015-05-15	hospital	approved	2015-05-15 09:48:59.882192	2015-05-15 10:56:42.995346
3342	8	1	230	2015	2015-04-30	2015-04-30	due to bandh buses not available	approved	2015-05-04 08:15:37.159255	2015-05-15 10:57:18.913945
3374	1	1	230	2015	2015-05-12	2015-05-12	food poisioning under medication	approved	2015-05-13 13:30:13.525414	2015-05-15 10:57:23.117514
3341	8	1	155	2015	2015-04-30	2015-04-30	no buses due to strike	approved	2015-05-04 07:53:15.468268	2015-05-15 10:58:08.005453
3390	1	1	168	2015	2015-05-15	2015-05-15	sister health problem	approved	2015-05-18 05:09:56.724481	2015-05-18 11:57:35.368972
3394	2	1	159	2015	2015-05-22	2015-05-22	sister marriage	approved	2015-05-18 14:20:16.054454	2015-05-21 05:55:06.939155
3407	1	1	30	2015	2015-05-20	2015-05-20	Not feeling well	approved	2015-05-21 04:43:16.642502	2015-05-21 05:55:09.371483
3384	2	1	60	2015	2015-05-14	2015-05-14	I have an appointment in sakra hospital	approved	2015-05-15 04:49:41.057198	2015-05-21 05:55:14.824885
3401	1	1	211	2015	2015-05-18	2015-05-18	due to feaver	approved	2015-05-19 13:15:23.638965	2015-05-28 05:13:21.987333
3381	5	0.5	40	2015	2015-05-15	2015-05-15	Personal Work	approved	2015-05-14 14:06:16.461804	2015-05-28 05:22:22.177005
3347	3	2	222	2015	2015-05-06	2015-05-07	Grand father funeral function	approved	2015-05-05 07:52:56.816094	2015-05-28 06:51:37.315483
3354	2	5	155	2015	2015-06-08	2015-06-12	For My Marriage Purpose	approved	2015-05-06 05:19:52.84543	2015-06-03 05:27:13.705597
4272	1	1	215	2015	2015-12-04	2015-12-04	Fever and cold	Pending	2015-12-07 04:21:30.832737	2015-12-07 04:21:30.832737
1703	1	1	146	2014	2014-04-23	2014-04-23	fever	approved	\N	\N
1708	5	0.5	95	2014	2014-04-19	2014-04-19	personal	approved	\N	\N
1707	5	1	52	2014	2014-04-24	2014-04-24	I had some personal work.	approved	\N	\N
1670	2	3	77	2014	2014-04-23	2014-04-25	going for election and medical check up	approved	\N	\N
1716	5	2	160	2014	2014-04-28	2014-04-29	I have some Personal work.	approved	\N	\N
1698	5	0.5	117	2014	2014-04-24	2014-04-24	Personal Work	approved	\N	\N
1717	2	2	71	2014	2014-05-02	2014-05-05	Out of Station	approved	\N	\N
1701	2	1	102	2014	2014-05-02	2014-05-02	personal work	approved	\N	\N
2479	5	0.5	70	2014	2014-11-12	2014-11-12	For Personal Work.	approved	\N	\N
2523	5	1	170	2014	2014-11-21	2014-11-21	Met with accident	approved	\N	\N
2526	5	1	165	2014	2014-11-05	2014-11-05	Not feeling well	approved	\N	\N
2503	1	1	51	2014	2014-11-18	2014-11-18	Due to some health issues	approved	\N	\N
2527	2	2	133	2014	2014-11-27	2014-11-28	I am going to native	approved	\N	\N
2531	1	1	77	2014	2014-11-24	2014-11-24	Due to illness\t	approved	\N	\N
2488	1	1	209	2014	2014-11-17	2014-11-17	I'm not feeling well. I need a day off.	approved	\N	\N
2536	5	0.5	154	2014	2014-11-25	2014-11-25	not well	approved	\N	\N
2514	9	1	59	2014	2014-11-19	2014-11-19	Went to funeral service of my friend who died in an car accident at chennai.	approved	\N	\N
2493	9	1	99	2014	2014-11-14	2014-11-14	Health issue.	approved	\N	\N
2484	2	2	128	2014	2014-12-03	2014-12-04	Personal work	approved	\N	\N
2508	2	1	128	2014	2014-11-18	2014-11-18	passport work	approved	\N	\N
2502	5	1	109	2014	2014-12-22	2014-12-22	My Brother marriage	approved	\N	\N
2898	2	1	163	2015	2015-01-23	2015-01-23	Going to Native for Cousin's engagement.	approved	2015-01-15 13:22:50.531173	2015-01-20 13:36:06.854148
3039	2	2	162	2015	2015-02-23	2015-02-24	Going to Pune	approved	2015-02-20 12:03:40.66931	2015-02-20 13:40:05.525419
3046	2	2	30	2015	2015-02-27	2015-03-02	cousin marriage	approved	2015-02-24 03:55:47.831715	2015-02-27 05:22:12.563218
3041	2	1	94	2015	2015-02-24	2015-02-24	going to hometown for homegod's annual festival	approved	2015-02-23 12:19:20.060283	2015-03-03 09:44:20.948729
3053	2	10	145	2015	2015-03-09	2015-03-20	Going to native place because of really urgent work.	approved	2015-02-24 10:00:36.094637	2015-03-12 08:01:06.774682
3345	1	1	54	2015	2015-04-30	2015-04-30	Not Feeling Well	approved	2015-05-05 04:53:17.984559	2015-05-08 05:24:17.464353
3370	1	2	99	2015	2015-05-07	2015-05-08	Not Feeling well.	approved	2015-05-12 06:44:31.909626	2015-05-13 10:30:02.935893
3361	4	1	223	2015	2015-05-08	2015-05-08	To attend a PhD workshop and seminar program in MYSORE University.   	cancelled	2015-05-07 14:28:53.0722	2015-05-13 10:34:49.022584
3362	2	1	77	2015	2015-05-04	2015-05-04	Personal work\t	approved	2015-05-08 05:25:41.064311	2015-05-15 10:56:52.61595
3379	2	1	170	2015	2015-05-15	2015-05-15	Personal work	approved	2015-05-14 13:20:13.995202	2015-05-19 12:19:57.055475
3363	2	1	212	2015	2015-05-04	2015-05-04	Went to Native	approved	2015-05-08 07:21:11.847284	2015-05-21 11:13:38.470537
3410	1	1	224	2015	2015-05-06	2015-05-06	I am want go hospital because mother not will...	approved	2015-05-21 11:06:53.894606	2015-05-25 06:57:33.784441
3373	2	2	178	2015	2015-05-14	2015-05-15	out of station 	approved	2015-05-13 06:23:15.539692	2015-07-22 10:27:09.307345
4283	5	1	235	2015	2015-12-08	2015-12-08	I had work in college.	Pending	2015-12-09 06:40:08.238562	2015-12-09 06:40:08.238562
4290	2	1	218	2015	2015-12-10	2015-12-10	Outstation travel.	Pending	2015-12-10 05:02:42.866295	2015-12-10 05:02:42.866295
4293	2	10	90	2015	2015-12-14	2015-12-25	Going Native Place.	Pending	2015-12-10 08:43:36.931717	2015-12-10 08:43:36.931717
4304	2	1	201	2015	2015-12-15	2015-12-15	Personal work	Pending	2015-12-16 05:00:34.608329	2015-12-16 05:00:34.608329
4308	8	1	185	2015	2015-12-31	2015-12-31	Old Year Celebration 	Pending	2015-12-16 08:34:44.783992	2015-12-16 08:34:44.783992
4309	2	3	185	2015	2015-12-28	2015-12-30	Old Year celebration	Pending	2015-12-16 08:35:45.47488	2015-12-16 08:35:45.47488
4323	2	7	49	2015	2015-12-22	2015-12-30	year end holiday	Pending	2015-12-17 13:56:06.652619	2015-12-17 13:56:06.652619
4324	8	1	49	2015	2015-12-31	2015-12-31	for 31st	Pending	2015-12-17 13:56:38.480408	2015-12-17 13:56:38.480408
4326	2	4	215	2015	2015-12-21	2015-12-24	Going to native	Pending	2015-12-18 10:59:34.28327	2015-12-18 10:59:34.28327
4327	8	1	215	2015	2015-12-25	2015-12-25	Going to native	Pending	2015-12-18 10:59:57.25521	2015-12-18 10:59:57.25521
4332	2	1	143	2015	2015-12-08	2015-12-08	Was not well.	Pending	2015-12-21 08:22:16.019016	2015-12-21 08:22:16.019016
4333	5	0.5	210	2015	2015-12-21	2015-12-21	personal work	Pending	2015-12-21 08:56:25.047827	2015-12-21 08:56:25.047827
4289	1	1	260	2015	2015-12-09	2015-12-09	Not well.	approved	2015-12-10 04:44:39.907563	2015-12-22 10:11:18.293389
4350	8	1	72	2015	2015-12-25	2015-12-25	Xmas	Pending	2015-12-22 12:10:50.450739	2015-12-22 12:10:50.450739
4351	8	1	72	2015	2015-12-31	2015-12-31	Year end	Pending	2015-12-22 12:11:11.226659	2015-12-22 12:11:11.226659
4353	8	1	217	2015	2015-12-25	2015-12-25	Personnel work 	Pending	2015-12-22 12:41:04.212419	2015-12-22 12:41:04.212419
1699	5	0.5	151	2014	2014-04-25	2014-04-25	Going to home-town for passport work	approved	\N	\N
1706	5	0.5	139	2014	2014-04-25	2014-04-25	Out of city	approved	\N	\N
1710	2	1	158	2014	2014-05-02	2014-05-02	home town festival	approved	\N	\N
1729	1	0.5	70	2014	2014-05-08	2014-05-08	Not feeling well because of viral fever.	cancelled	\N	\N
1731	2	1	95	2014	2014-05-08	2014-05-08	personal.	cancelled	\N	\N
1738	5	1	51	2014	2014-05-12	2014-05-12	Regarding some school work for my daughter	cancelled	\N	\N
1733	2	2	99	2014	2014-05-07	2014-05-08	native	approved	\N	\N
1718	5	0.5	143	2014	2014-05-02	2014-05-02	Feeling fevirish	approved	\N	\N
1720	1	1	31	2014	2014-05-02	2014-05-02	I am not feeling well	approved	\N	\N
1721	1	1	143	2014	2014-05-05	2014-05-05	Was ill due to Food poisoning.	approved	\N	\N
1722	2	1	144	2014	2014-05-07	2014-05-07	Election	approved	\N	\N
1724	1	1	169	2014	2014-05-07	2014-05-07	elections	approved	\N	\N
1725	1	1	142	2014	2014-05-06	2014-05-06	Suffering from cold and cough.	approved	\N	\N
1726	2	1	107	2014	2014-04-19	2014-04-19	went to native...	approved	\N	\N
1727	2	3	139	2014	2014-05-05	2014-05-07	Fever	approved	\N	\N
1728	1	0.5	70	2014	2014-05-07	2014-05-07	Not feeling well because of viral fever.	approved	\N	\N
1732	2	1	95	2014	2014-05-09	2014-05-09	personal.	approved	\N	\N
1736	5	0.5	94	2014	2014-05-09	2014-05-09	Going to ipl match	approved	\N	\N
1737	5	0.5	40	2014	2014-05-08	2014-05-08	Personal Work	approved	\N	\N
1739	1	1	162	2014	2014-05-12	2014-05-12	Not feeling well	approved	\N	\N
1740	1	1	31	2014	2014-05-12	2014-05-12	I am not feeling well	approved	\N	\N
1744	1	1	52	2014	2014-05-13	2014-05-13	I was not feeling well.	approved	\N	\N
1759	5	0.5	134	2014	2014-05-20	2014-05-20	Due to head pain.	approved	\N	\N
1766	5	1	128	2014	2014-05-22	2014-05-22	for driving licence  	cancelled	\N	\N
1745	2	4	91	2014	2014-06-02	2014-06-05	home function	cancelled	\N	\N
1756	4	3	87	2014	2014-06-04	2014-06-06	Going for Post Graduation final viva. 	cancelled	\N	\N
1794	1	1	179	2014	2014-05-28	2014-05-28	Fever	approved	\N	\N
1784	2	1	109	2014	2014-05-30	2014-05-30	Personal work	approved	\N	\N
1723	2	1	168	2014	2014-05-07	2014-05-07	election	approved	\N	\N
1719	1	1	54	2014	2014-05-02	2014-05-02	Suffering from fever	approved	\N	\N
1742	2	1	171	2014	2014-05-19	2014-05-19	Out of Station	approved	\N	\N
1754	1	1	182	2014	2014-05-15	2014-05-15	Not well due to throat infection 	approved	\N	\N
1750	1	1	128	2014	2014-05-15	2014-05-15	Fever 	approved	\N	\N
1758	1	1	134	2014	2014-05-19	2014-05-19	Due to head pain.	approved	\N	\N
1798	1	1	133	2014	2014-06-02	2014-06-02	I am not feeling well	approved	\N	\N
1799	1	1	168	2014	2014-06-02	2014-06-02	sick	approved	\N	\N
1786	5	0.5	77	2014	2014-05-29	2014-05-29	for personal work.	approved	\N	\N
1747	2	1	144	2014	2014-05-16	2014-05-16	I will go to Native.	approved	\N	\N
1748	5	0.5	87	2014	2014-05-15	2014-05-15	Due to sickness...	approved	\N	\N
1751	2	2	160	2014	2014-05-14	2014-05-15	Had to attend function at home.	approved	\N	\N
1746	1	1	51	2014	2014-05-14	2014-05-14	I was not feeling well.	approved	\N	\N
1753	5	0.5	55	2014	2014-05-16	2014-05-16	Some personal work	approved	\N	\N
1752	5	0.5	162	2014	2014-05-15	2014-05-15	Urgent Work	approved	\N	\N
1730	2	1	151	2014	2014-05-15	2014-05-15	Going for passport verification	approved	\N	\N
1741	5	0.5	51	2014	2014-05-13	2014-05-13	Not feeling well	approved	\N	\N
1743	1	1	59	2014	2014-05-13	2014-05-13	I suffered from fever and cough. So I went hospital for treatment.	approved	\N	\N
1755	2	0.5	107	2014	2014-05-19	2014-05-19	personal work	approved	\N	\N
1760	2	3	147	2014	2014-05-28	2014-05-30	Going home for passport verification....	approved	\N	\N
1761	5	0.5	101	2014	2014-05-19	2014-05-19	Sick	approved	\N	\N
1762	5	0.5	70	2014	2014-05-22	2014-05-22	Need to travel based on some urgent personal work.	approved	\N	\N
1763	2	1	143	2014	2014-05-19	2014-05-19	Had been to Chennai. Sister was not well.	approved	\N	\N
1764	5	1	49	2014	2014-05-26	2014-05-26	For personal work	approved	\N	\N
1765	9	1	102	2014	2014-05-26	2014-05-26	Personal work	approved	\N	\N
1767	2	1	163	2014	2014-05-26	2014-05-26	Going to native	approved	\N	\N
1768	2	2	169	2014	2014-05-29	2014-05-30	Occasion of my sisters marriage.	approved	\N	\N
1769	1	3	182	2014	2014-05-21	2014-05-23	Viral fever	approved	\N	\N
1770	5	0.5	60	2014	2014-05-23	2014-05-23	personal Problem	approved	\N	\N
1771	2	1	60	2014	2014-05-07	2014-05-07	Elections	approved	\N	\N
1772	2	2	60	2014	2014-05-29	2014-05-30	cousin Marriage	approved	\N	\N
1775	1	1	145	2014	2014-05-02	2014-05-02	 I was not well.Suffering from fever	approved	\N	\N
1774	3	1	45	2014	2014-05-08	2014-05-08	personal	approved	\N	\N
1776	1	1	94	2014	2014-05-19	2014-05-19	Not well	approved	\N	\N
1777	2	1	159	2014	2014-06-02	2014-06-02	go to my home worm ceremony 	approved	\N	\N
1757	2	1	59	2014	2014-06-02	2014-06-02	As I am Going for Cousin Sister's marriage.	approved	\N	\N
1778	1	1	162	2014	2014-05-23	2014-05-23	Urgent work	approved	\N	\N
1779	2	1	68	2014	2014-05-23	2014-05-23	Need to go Hospital	approved	\N	\N
1780	4	5	63	2014	2014-05-19	2014-05-23	MBA Exams	approved	\N	\N
1781	1	1	127	2014	2014-05-16	2014-05-16	Bedridden due to sickness.	approved	\N	\N
1782	2	2	170	2014	2014-05-26	2014-05-27	Personal work.	approved	\N	\N
1783	1	1	55	2014	2014-05-26	2014-05-26	Went to Native	approved	\N	\N
1785	2	1	51	2014	2014-05-29	2014-05-29	Having some school work for my daughter	approved	\N	\N
1787	5	0.5	142	2014	2014-05-29	2014-05-29	Personal work	approved	\N	\N
1788	2	3	151	2014	2014-05-26	2014-05-28	Went to my native for passport Verification. 	approved	\N	\N
1789	2	4	91	2014	2014-05-30	2014-06-04	home function	approved	\N	\N
1792	4	3	87	2014	2014-06-02	2014-06-04	Going for Post Graduation final viva.	approved	\N	\N
1795	1	1	102	2014	2014-05-30	2014-05-30	fever	approved	\N	\N
1796	1	1	123	2014	2014-05-30	2014-05-30	fever	approved	\N	\N
1790	2	1	31	2014	2014-06-02	2014-06-02	For personal work	approved	\N	\N
1734	2	5	80	2014	2014-06-09	2014-06-13	For my Marriage.	approved	\N	\N
1793	2	5	72	2014	2014-06-09	2014-06-13	Going to Native	approved	\N	\N
1735	2	5	80	2014	2014-06-16	2014-06-20	For my Marriage.	approved	\N	\N
1797	2	6	54	2014	2014-07-25	2014-08-01	Taking leaves For Ramzan Festival	approved	\N	\N
1791	2	1	77	2014	2014-06-02	2014-06-02	Personal work on native.	approved	\N	\N
1773	2	1	70	2014	2014-05-12	2014-05-12	I was on leave for passport police verification purpose.	approved	\N	\N
1810	3	1	171	2014	2014-06-05	2014-06-05	Grandmother expired	approved	\N	\N
1808	2	1	59	2014	2014-06-09	2014-06-09	As I am having function in my home.	approved	\N	\N
1800	2	2	178	2014	2014-06-12	2014-06-13	To attend cousin marriage at Coorg	approved	\N	\N
2550	1	1	154	2014	2014-11-27	2014-11-27	Sir, I am not well today. 	Pending	\N	\N
2557	5	0.5	55	2014	2014-11-28	2014-11-28	Personal work	approved	\N	\N
2559	5	1	134	2014	2014-12-01	2014-12-01	Going to Mysore.	approved	\N	\N
2566	5	0.5	168	2014	2014-12-01	2014-12-01	colleague marriag	approved	\N	\N
2563	2	8	33	2014	2014-12-22	2014-12-31	Christmas holidays	approved	\N	\N
2558	5	2	140	2014	2014-12-10	2014-12-11	Going to native place	approved	\N	\N
2556	5	0.5	109	2014	2014-12-01	2014-12-01	going to friend(chetana) marriage.	approved	\N	\N
2545	1	2	209	2014	2014-11-27	2014-11-28	I'm not feeling well. So please kindly approve my leave for 2 days.	approved	\N	\N
2552	1	1	178	2014	2014-11-27	2014-11-27	was not wel	approved	\N	\N
2555	2	1	45	2014	2014-12-01	2014-12-01	Going to hospital	approved	\N	\N
2570	2	5	197	2014	2014-11-24	2014-11-28	Went to out of station for Personal work	approved	\N	\N
2901	1	1	211	2015	2015-01-16	2015-01-16	Due to sickness.	approved	2015-01-19 09:00:04.640647	2015-01-20 13:36:23.747665
2899	1	1	117	2015	2015-01-16	2015-01-16	Not feeling well	approved	2015-01-19 04:15:39.216742	2015-01-27 09:02:44.248636
3048	9	1	143	2015	2015-02-16	2015-02-16	Was not keeping well.	approved	2015-02-24 05:25:15.890408	2015-02-24 05:27:03.538901
3050	1	2	160	2015	2015-02-02	2015-02-03	I am suffering with cough.	approved	2015-02-24 09:10:21.064862	2015-03-03 09:36:53.402012
3057	2	2	176	2015	2015-02-27	2015-03-02	Going home 	approved	2015-02-26 11:29:32.800335	2015-03-05 09:50:59.564227
3040	3	1	209	2015	2015-02-20	2015-02-20	Grandfather Passed Away	approved	2015-02-23 06:55:18.683072	2015-03-06 07:05:44.831122
3356	2	2	135	2015	2015-05-01	2015-05-05	Personal Reason	approved	2015-05-06 08:49:29.234988	2015-05-06 08:49:29.234988
3368	1	2	162	2015	2015-05-08	2015-05-11	Not Well	approved	2015-05-12 04:46:59.402885	2015-05-12 04:56:12.782397
3348	5	1	41	2015	2015-04-30	2015-04-30	Due to Bharat bandh.	approved	2015-05-05 08:15:08.961254	2015-05-13 10:34:33.028078
3392	2	1	87	2015	2015-05-15	2015-05-15	Personal work...	approved	2015-05-18 05:16:35.092796	2015-05-18 05:17:39.563662
3406	2	1	60	2015	2015-05-20	2015-05-20	Went to Hospital for check up	approved	2015-05-21 04:33:34.447255	2015-05-21 05:55:13.507369
3409	1	2	143	2015	2015-05-18	2015-05-19	Was not well. Had got fever.	approved	2015-05-21 10:05:55.090447	2015-05-22 05:26:38.221784
3349	8	1	31	2015	2015-04-30	2015-04-30	went to native.	approved	2015-05-05 13:18:22.561232	2015-05-25 05:21:55.205219
3399	1	1	201	2015	2015-05-20	2015-05-20	Health Problem	approved	2015-05-19 12:47:44.257472	2015-05-25 06:56:35.73374
3411	5	0.5	191	2015	2015-05-22	2015-05-22	I'm not feeling well.	approved	2015-05-22 09:11:57.72696	2015-05-25 08:36:52.511692
3408	2	5	31	2015	2015-05-25	2015-05-29	Brother's marriage.	approved	2015-05-21 09:20:47.093027	2015-05-26 06:08:10.338329
3398	2	1	70	2015	2015-05-08	2015-05-08	Due to some personal works.	approved	2015-05-19 12:20:33.445217	2015-05-28 05:13:40.858853
3377	5	0.5	94	2015	2015-05-14	2015-05-14	personal work	approved	2015-05-14 08:11:07.233923	2015-05-28 05:18:05.019359
3366	5	0.5	210	2015	2015-05-11	2015-05-11	sick	approved	2015-05-11 09:23:47.37246	2015-05-28 06:48:27.62621
3353	2	5	155	2015	2015-06-01	2015-06-05	For My Marriage	approved	2015-05-06 05:19:04.338162	2015-06-03 05:27:20.214265
4291	5	1	41	2015	2015-12-09	2015-12-09	Due to cold 	Pending	2015-12-10 05:40:00.288661	2015-12-10 05:40:00.288661
4294	2	1	242	2015	2015-12-14	2015-12-14	For My wife maternity checkup.	Pending	2015-12-11 05:42:43.773815	2015-12-11 05:42:43.773815
4295	5	2	140	2015	2015-12-14	2015-12-15	To attend my sister’s wedding ceremony 	Pending	2015-12-11 07:20:11.220733	2015-12-11 07:20:11.220733
4299	5	2	134	2015	2015-12-17	2015-12-18	Going home for some personal work.	approved	2015-12-14 12:35:42.685425	2015-12-16 05:35:20.372372
4284	5	3	98	2015	2015-12-21	2015-12-23	Going to Native	approved	2015-12-09 07:04:13.943498	2015-12-17 09:02:44.60449
4285	2	1	98	2015	2015-12-24	2015-12-24	Going to Native	approved	2015-12-09 07:08:21.329448	2015-12-17 09:02:49.116729
4287	2	1	98	2015	2015-12-28	2015-12-28	Going to Native	approved	2015-12-09 07:09:47.179964	2015-12-17 09:02:58.681885
4313	2	1	169	2015	2015-12-23	2015-12-23	personal work	approved	2015-12-17 08:59:43.204995	2015-12-17 09:03:14.420973
4314	2	5	227	2015	2015-12-21	2015-12-25	personal work at home	approved	2015-12-17 09:00:11.885223	2015-12-17 09:03:26.469954
4325	1	1	237	2015	2015-12-17	2015-12-17	Health Issue	Pending	2015-12-18 03:57:04.323969	2015-12-18 03:57:04.323969
4341	2	1	218	2015	2015-12-21	2015-12-21	Unwell.	Pending	2015-12-21 14:29:57.487416	2015-12-21 14:29:57.487416
4342	5	1	163	2015	2015-12-18	2015-12-18	Went to Native for Cousin's Marriage.	Pending	2015-12-22 03:56:19.775671	2015-12-22 03:56:19.775671
4344	1	1	140	2015	2015-12-17	2015-12-17	Not Well	Pending	2015-12-22 06:18:59.91816	2015-12-22 06:18:59.91816
4347	5	2	117	2015	2015-12-24	2015-12-25	Out of station	Pending	2015-12-22 07:33:29.717793	2015-12-22 07:33:29.717793
4288	3	7	188	2015	2015-11-29	2015-12-08	Grandfather expired	cancelled	2015-12-09 10:54:05.571669	2015-12-22 07:43:40.603131
4348	5	0.5	133	2015	2015-12-22	2015-12-22	I am not feeling well.	approved	2015-12-22 08:07:10.000874	2015-12-22 09:22:39.514441
4321	5	2	151	2015	2015-12-21	2015-12-22	going my home town	approved	2015-12-17 09:12:18.0692	2015-12-22 13:03:45.487207
4357	8	1	51	2015	2015-12-31	2015-12-31	Having some personal work	Pending	2015-12-22 13:11:07.209345	2015-12-22 13:11:07.209345
4369	2	1	198	2015	2015-12-28	2015-12-28	personal work	Pending	2015-12-23 13:24:53.525106	2015-12-23 13:24:53.525106
1749	9	1	142	2014	2014-05-16	2014-05-16	Need to consult doctor because of cough and cold.	approved	\N	\N
1801	1	0.5	33	2014	2014-06-03	2014-06-03	Sick	approved	\N	\N
1802	2	1	111	2014	2014-06-02	2014-06-02	Personal Work.	approved	\N	\N
1812	1	1	33	2014	2014-06-03	2014-06-03	sick	approved	\N	\N
1813	1	1	33	2014	2014-06-03	2014-06-03	sick	approved	\N	\N
1818	2	1	55	2014	2014-06-09	2014-06-09	Marriage function	approved	\N	\N
1822	2	4	170	2014	2014-06-03	2014-06-06	father is sick. 	approved	\N	\N
2546	1	1	185	2014	2014-11-24	2014-11-24	Not feeling Well	approved	\N	\N
2569	5	0.5	169	2014	2014-12-01	2014-12-01	Not feeling well	approved	\N	\N
2553	2	1	52	2014	2014-11-27	2014-11-27	I was not feeling well.	approved	\N	\N
2554	5	0.5	52	2014	2014-11-28	2014-11-28	I have some personal work.	approved	\N	\N
2565	5	0.5	128	2014	2014-12-01	2014-12-01	Friend marriage	approved	\N	\N
2575	5	0.5	142	2014	2014-12-02	2014-12-02	personal work	approved	\N	\N
2900	1	1	196	2015	2015-01-16	2015-01-16	fever	approved	2015-01-19 04:54:53.480727	2015-01-19 05:36:29.333481
3042	2	1	95	2015	2015-02-10	2015-02-10	Was not well.	approved	2015-02-23 12:27:26.910898	2015-02-24 04:57:56.311978
3044	5	0.5	40	2015	2015-02-18	2015-02-18	Personal work	approved	2015-02-23 15:08:15.140531	2015-03-03 09:36:39.116656
3052	2	2	131	2015	2015-02-12	2015-02-13	vacation	approved	2015-02-24 09:46:22.163019	2015-03-03 09:36:41.515885
3056	5	1	131	2015	2015-02-27	2015-02-27	Personal	approved	2015-02-26 09:15:39.284882	2015-03-03 09:36:43.764395
3054	5	0.5	140	2015	2015-02-24	2015-02-24	Personal Work	approved	2015-02-24 10:28:46.360082	2015-03-04 05:50:20.644821
3047	1	1	177	2015	2015-02-23	2015-02-23	Fever	approved	2015-02-24 04:08:26.173211	2015-03-04 06:18:43.560636
3359	5	0.5	162	2015	2015-05-07	2015-05-07	I have some work	approved	2015-05-07 07:08:54.477103	2015-05-07 07:32:07.157557
3367	2	1	60	2015	2015-05-08	2015-05-08	Went to Hospital	approved	2015-05-11 09:42:40.643617	2015-05-11 09:44:24.016895
3360	4	1	223	2015	2015-05-08	2015-05-08	To attend a PhD workshop and seminar program in MYSORE University.   	cancelled	2015-05-07 14:28:53.048593	2015-05-13 10:34:41.416196
3372	2	1	235	2015	2015-05-14	2015-05-14	Going to my native.	cancelled	2015-05-13 05:21:23.870561	2015-05-14 04:46:07.793218
3376	1	1	134	2015	2015-05-13	2015-05-13	Health was not good.	approved	2015-05-14 06:38:08.791252	2015-05-15 11:53:52.149615
3365	1	1	168	2015	2015-05-08	2015-05-08	sister health problem	approved	2015-05-11 06:43:51.581071	2015-05-15 11:54:05.922221
3386	5	0.5	95	2015	2015-05-15	2015-05-15	personal.	approved	2015-05-15 09:31:24.331047	2015-05-18 05:17:36.552991
3395	2	1	221	2015	2015-05-19	2015-05-19	Meeting the consultant for my IT Return, Banking work and Quinnox's quarterly Board meeting.	Pending	2015-05-18 17:49:16.974221	2015-05-18 17:49:16.974221
3383	1	1	117	2015	2015-05-14	2015-05-14	Not feeling well	approved	2015-05-15 04:41:50.663564	2015-05-21 11:03:45.67149
3397	1	1	171	2015	2015-05-18	2015-05-18	Not feeling well	approved	2015-05-19 06:55:34.055821	2015-05-22 05:26:24.543945
3403	2	1	59	2015	2015-05-22	2015-05-22	Going to native	approved	2015-05-20 05:22:32.926087	2015-05-25 05:07:29.56876
3393	5	0.5	80	2015	2015-05-22	2015-05-22	As I have some personal work.	approved	2015-05-18 06:33:13.613484	2015-05-28 05:03:46.94776
3385	2	1	218	2015	2015-05-15	2015-05-15	Acute back spasm.	approved	2015-05-15 04:52:36.303565	2015-05-28 05:23:13.184854
3405	1	1	209	2015	2015-05-20	2015-05-20	I am not feeling well.	approved	2015-05-21 04:18:55.358752	2015-05-28 06:51:25.028284
3412	2	5	72	2015	2015-06-01	2015-06-05	Going to native	approved	2015-05-25 05:24:18.841087	2015-06-22 08:46:57.611223
4249	5	1	250	2015	2015-11-09	2015-11-09	As i am leaving for my home town, i wont be available on that particular day.	approved	2015-11-30 11:37:50.169692	2015-12-11 09:53:33.756657
4302	3	1	117	2015	2015-12-11	2015-12-11	Uncle passed away	Pending	2015-12-15 07:38:24.355378	2015-12-15 07:38:24.355378
4298	1	1	134	2015	2015-12-11	2015-12-11	Health was not good.	approved	2015-12-13 14:26:05.453031	2015-12-16 05:35:25.089099
4301	8	1	134	2015	2015-12-25	2015-12-25	Going home for some personal work.	approved	2015-12-14 12:37:28.688406	2015-12-16 05:35:30.783969
4306	2	1	242	2015	2015-12-24	2015-12-24	Christmas	Pending	2015-12-16 08:24:01.537982	2015-12-16 08:24:01.537982
4307	8	1	242	2015	2015-12-25	2015-12-25	Christmas 	Pending	2015-12-16 08:24:31.313877	2015-12-16 08:24:31.313877
4312	5	0.5	41	2015	2015-12-16	2015-12-16	Going to passport office.	Pending	2015-12-17 05:37:01.780943	2015-12-17 05:37:01.780943
4286	8	1	98	2015	2015-12-25	2015-12-25	Going to Native	approved	2015-12-09 07:09:11.401862	2015-12-17 09:03:04.719998
4315	2	1	169	2015	2015-12-24	2015-12-24	Going to native	approved	2015-12-17 09:02:57.344308	2015-12-17 09:03:21.29032
4328	2	1	158	2015	2015-12-21	2015-12-21	going to home	approved	2015-12-18 14:26:22.10802	2015-12-18 14:31:17.881769
4334	5	1.5	63	2015	2015-12-17	2015-12-18	Personal reason	Pending	2015-12-21 10:56:28.825701	2015-12-21 10:56:28.825701
4335	8	1	270	2015	2015-12-25	2015-12-25	Christmas	Pending	2015-12-21 12:16:34.661125	2015-12-21 12:16:34.661125
4338	9	2	131	2015	2015-12-28	2015-12-29	Comp Off	Pending	2015-12-21 12:23:50.072317	2015-12-21 12:23:50.072317
4345	8	1	230	2015	2015-12-25	2015-12-25	Family Function	Pending	2015-12-22 07:04:40.619502	2015-12-22 07:04:40.619502
4349	3	7	188	2015	2015-10-29	2015-11-06	Grandfather expired	approved	2015-12-22 09:17:06.181512	2015-12-22 09:22:36.242977
4329	5	1	221	2015	2015-12-23	2015-12-23	Attending the accident court case for son 	cancelled	2015-12-20 11:22:42.075725	2015-12-22 10:50:52.765448
4318	2	1	169	2015	2015-12-28	2015-12-28	going to home	approved	2015-12-17 09:06:26.001964	2015-12-22 13:04:02.031436
4354	2	1	51	2015	2015-12-24	2015-12-24	Having some personal work	Pending	2015-12-22 13:10:16.570945	2015-12-22 13:10:16.570945
4355	8	1	51	2015	2015-12-25	2015-12-25	Having some personal work	Pending	2015-12-22 13:10:30.552725	2015-12-22 13:10:30.552725
4356	2	3	51	2015	2015-12-28	2015-12-30	Having some personal work	Pending	2015-12-22 13:10:50.659287	2015-12-22 13:10:50.659287
4360	1	2	281	2015	2015-12-21	2015-12-22	Sick	Pending	2015-12-23 08:25:22.622454	2015-12-23 08:25:22.622454
4352	2	1	217	2015	2015-12-24	2015-12-24	Personnel work	cancelled	2015-12-22 12:38:48.558135	2015-12-23 10:36:00.2405
4365	5	2	201	2015	2015-12-24	2015-12-25	Personal work	Pending	2015-12-23 13:15:04.371296	2015-12-23 13:15:04.371296
4368	5	1	201	2015	2015-12-31	2015-12-31	Personal work	Pending	2015-12-23 13:20:32.712304	2015-12-23 13:20:32.712304
4370	5	1	221	2015	2015-12-24	2015-12-24	Professional Photographs for the website	Pending	2015-12-23 13:26:04.389812	2015-12-23 13:26:04.389812
4374	1	1	187	2015	2015-12-24	2015-12-24	Doctor Appointment.	Pending	2015-12-23 13:50:47.271693	2015-12-23 13:50:47.271693
4375	8	1	187	2015	2015-12-25	2015-12-25	Festival	Pending	2015-12-23 13:51:35.100052	2015-12-23 13:51:35.100052
1803	5	1	98	2014	2014-07-25	2014-07-25	Going Native for Celebration of festival	cancelled	\N	\N
1809	2	1	29	2014	2014-06-09	2014-06-09	Going for marriage	approved	\N	\N
1807	2	1	117	2014	2014-06-05	2014-06-05	Have to attend my friend's engagement 	approved	\N	\N
1811	1	1	33	2014	2014-06-04	2014-06-04	Sick	approved	\N	\N
1814	2	2	128	2014	2014-06-09	2014-06-10	Home Town 	approved	\N	\N
1821	5	1	51	2014	2014-06-09	2014-06-09	I was not feeling good	approved	\N	\N
1819	2	1	181	2014	2014-06-13	2014-06-13	Attending My friends Marriage in home town.	approved	\N	\N
2548	1	1	80	2014	2014-11-26	2014-11-26	As I was not feeling well.	approved	\N	\N
2551	5	0.5	169	2014	2014-11-27	2014-11-27	sick	approved	\N	\N
2567	9	5	87	2014	2014-12-22	2014-12-26	Going to my native for christmas & newyear	approved	\N	\N
2572	2	3	160	2014	2014-12-03	2014-12-05	I have some Personal work.	approved	\N	\N
2574	5	1	111	2014	2014-12-01	2014-12-01	I was not feeling well.	approved	\N	\N
2547	5	0.5	94	2014	2014-11-27	2014-11-27	personal work	approved	\N	\N
2902	2	1	151	2015	2015-01-23	2015-01-23	Going Home town	approved	2015-01-19 09:19:22.903565	2015-01-19 11:40:56.702794
2904	5	0.5	41	2015	2015-01-19	2015-01-19	Went to the Hospital for Check for my Mother.	approved	2015-01-19 09:28:59.29829	2015-01-21 09:14:10.544005
3072	2	2	77	2015	2015-03-02	2015-03-03	for personal work	approved	2015-03-04 05:33:58.079178	2015-03-04 05:50:25.656741
3063	1	1	133	2015	2015-03-02	2015-03-02	I am not feeling well	approved	2015-03-03 04:10:15.248646	2015-03-04 09:39:59.047217
3076	8	1	151	2015	2015-03-06	2015-03-06	going home town	approved	2015-03-04 06:07:25.998671	2015-03-04 09:44:10.878639
3081	8	1	49	2015	2015-03-06	2015-03-06	For Holi.	Pending	2015-03-04 11:55:55.366051	2015-03-04 11:55:55.366051
3095	8	1	95	2015	2015-03-06	2015-03-06	Holi Festival.	approved	2015-03-05 12:59:54.453754	2015-03-06 07:48:52.991723
3099	8	1	188	2015	2015-02-17	2015-02-17	Had an operation	approved	2015-03-09 05:50:49.071681	2015-03-09 05:57:30.590945
3087	2	1	44	2015	2015-03-09	2015-03-09	Going to home	approved	2015-03-05 06:54:47.060467	2015-03-13 09:59:37.544295
3074	8	1	117	2015	2015-03-06	2015-03-06	Holi	approved	2015-03-04 05:48:02.906094	2015-03-16 04:53:01.902041
3105	1	5	163	2015	2015-03-09	2015-03-13	Due to Chicken Pox Scars	approved	2015-03-09 08:57:49.245015	2015-03-18 07:08:13.704417
3094	2	1	51	2015	2015-03-06	2015-03-06	Annual day in my daughter school	approved	2015-03-05 10:47:07.362317	2015-03-18 09:54:09.541192
3416	1	1	87	2015	2015-05-25	2015-05-25	Not felt well.	approved	2015-05-26 04:52:55.9265	2015-05-26 05:16:56.164707
3423	5	1	144	2015	2015-05-25	2015-05-25	I have personal work. 	approved	2015-05-26 11:56:16.669478	2015-05-26 11:56:52.19293
3413	1	1	160	2015	2015-05-21	2015-05-21	Stomach upset.	approved	2015-05-25 07:02:23.731449	2015-05-28 05:04:20.263784
3424	5	3	52	2015	2015-05-13	2015-05-15	I had some personal work.	approved	2015-05-26 12:33:00.262841	2015-05-28 05:13:04.738141
3436	2	1	131	2015	2015-05-13	2015-05-13	personal work	approved	2015-05-28 04:49:53.109379	2015-05-28 05:13:52.629991
3414	5	0.5	201	2015	2015-05-25	2015-05-25	Personal Work	approved	2015-05-25 12:28:07.888225	2015-05-28 06:51:03.827485
3433	5	0.5	77	2015	2015-05-28	2015-05-28	went to hospital 	approved	2015-05-27 10:19:41.779182	2015-06-03 05:26:36.852752
3415	2	5	163	2015	2015-05-25	2015-05-29	Sick Leave-Continuous high fever, body pain.   	approved	2015-05-26 02:51:19.42731	2015-06-05 09:28:21.374611
3475	2	1	213	2015	2015-06-08	2015-06-08	I need holidays for my viva exams please approve the holidays.\r\n	approved	2015-06-04 07:47:19.470729	2015-06-05 09:45:54.134599
3469	1	1	118	2015	2015-05-29	2015-05-29	Was Not Well.	approved	2015-06-03 05:32:18.846194	2015-06-05 10:11:31.021853
3477	9	1	177	2015	2015-06-05	2015-06-05	Going to hospital	approved	2015-06-04 13:57:50.490354	2015-06-10 06:51:33.178457
3488	1	1	144	2015	2015-06-09	2015-06-09	Not feeling well.	approved	2015-06-10 06:08:11.642387	2015-06-10 07:10:08.898108
3484	5	0.5	187	2015	2015-06-08	2015-06-08	RTO Appointment.	approved	2015-06-08 07:49:03.167639	2015-06-12 06:40:15.044956
3480	2	1	101	2015	2015-06-08	2015-06-08	Family Function	approved	2015-06-05 07:59:26.19161	2015-06-12 06:40:21.531028
3462	1	2	60	2015	2015-06-01	2015-06-02	Am Not feeling well	approved	2015-06-02 08:33:10.448334	2015-06-16 13:52:32.078215
3446	4	1	226	2015	2015-06-08	2015-06-08	Exam	approved	2015-05-29 06:30:38.179019	2015-06-18 06:28:27.064312
3490	2	2	71	2015	2015-06-09	2015-06-10	Out of Station	approved	2015-06-10 06:43:11.01677	2015-06-23 06:06:16.372647
3455	2	1	218	2015	2015-06-02	2015-06-02	Emergency situation.	approved	2015-06-02 03:19:39.888022	2015-06-23 06:10:10.55393
3431	5	0.5	94	2015	2015-05-27	2015-05-27	Doctor Visit	approved	2015-05-27 09:43:08.795829	2015-06-23 06:11:54.113148
3492	2	1	117	2015	2015-06-18	2015-06-18	Going to mysore	approved	2015-06-11 04:07:44.419159	2015-06-25 10:52:17.945019
3481	1	1	197	2015	2015-06-04	2015-06-04	Viral Fever	approved	2015-06-05 12:15:58.344798	2015-06-26 06:08:36.207829
4292	2	1	91	2015	2015-12-09	2015-12-09	not feeling well	Pending	2015-12-10 07:18:56.984983	2015-12-10 07:18:56.984983
4296	2	1	140	2015	2015-12-16	2015-12-16	To attend my sister’s wedding ceremony 	Pending	2015-12-11 07:20:39.525853	2015-12-11 07:20:39.525853
4204	2	1	214	2015	2015-12-04	2015-12-04	Attend wedding in the family.	approved	2015-11-23 07:31:40.275383	2015-12-11 09:48:48.233638
4297	2	3	226	2015	2015-12-16	2015-12-18	IGNOU MCA 4th Sem Exam	Pending	2015-12-11 12:09:44.081798	2015-12-11 12:09:44.081798
4300	2	4	134	2015	2015-12-21	2015-12-24	Going home for some personal work.	approved	2015-12-14 12:36:36.192926	2015-12-16 05:35:31.247976
4303	2	1	168	2015	2015-12-16	2015-12-16	going to hospital	approved	2015-12-15 12:09:21.765952	2015-12-16 05:35:36.331049
4316	8	1	169	2015	2015-12-26	2015-12-26	Going to native	cancelled	2015-12-17 09:03:32.551381	2015-12-17 09:04:48.763678
4320	1	2	151	2015	2015-12-21	2015-12-22	going my home town	cancelled	2015-12-17 09:11:30.388088	2015-12-17 09:11:57.157168
4322	2	1	51	2015	2015-12-18	2015-12-18	Need to attend sports day in my daughter school	Pending	2015-12-17 09:15:46.046063	2015-12-17 09:15:46.046063
4331	5	0.5	143	2015	2015-12-22	2015-12-22	Appointment with a doctor regarding cold and fever.	Pending	2015-12-21 08:20:39.834663	2015-12-21 08:20:39.834663
4337	8	1	131	2015	2015-12-31	2015-12-31	New Year Eve	Pending	2015-12-21 12:19:56.500188	2015-12-21 12:19:56.500188
4343	2	1	91	2015	2015-12-17	2015-12-17	Not feeling well	Pending	2015-12-22 05:25:17.506621	2015-12-22 05:25:17.506621
4330	1	2	187	2015	2015-12-17	2015-12-18	Sick	approved	2015-12-21 05:45:16.164197	2015-12-22 09:22:33.785391
4319	5	1	151	2015	2015-12-18	2015-12-18	going my home town	approved	2015-12-17 09:10:54.479302	2015-12-22 13:03:36.309195
4317	8	1	169	2015	2015-12-25	2015-12-25	Going to naitive	approved	2015-12-17 09:05:47.83093	2015-12-22 13:03:59.446849
4362	2	1	198	2015	2015-12-24	2015-12-24	going to native	Pending	2015-12-23 08:26:55.690324	2015-12-23 08:26:55.690324
4363	8	1	198	2015	2015-12-25	2015-12-25	going to native	Pending	2015-12-23 08:28:04.910663	2015-12-23 08:28:04.910663
4366	2	3	201	2015	2015-12-28	2015-12-30	Personal Work	Pending	2015-12-23 13:18:16.9163	2015-12-23 13:18:16.9163
4371	8	1	31	2015	2015-12-25	2015-12-25	Going to Native	Pending	2015-12-23 13:28:03.369682	2015-12-23 13:28:03.369682
4372	8	1	31	2015	2015-12-31	2015-12-31	New year celebration.	Pending	2015-12-23 13:28:54.184903	2015-12-23 13:28:54.184903
4373	8	1	142	2015	2015-12-25	2015-12-25	Celebrating Christmas	Pending	2015-12-23 13:46:22.73114	2015-12-23 13:46:22.73114
4340	2	2	246	2015	2015-12-24	2015-12-25	Christmas celebration	approved	2015-12-21 13:10:46.53856	2015-12-24 05:11:14.509708
1816	1	1	154	2014	2014-06-05	2014-06-05	Sick	approved	\N	\N
1817	5	0.5	154	2014	2014-06-04	2014-06-04	not well	approved	\N	\N
1820	2	2	183	2014	2014-06-16	2014-06-17	Going to my cousin brother marriage.	approved	\N	\N
1804	5	5	98	2014	2014-07-28	2014-08-01	Going Native for Celebration of festival	approved	\N	\N
2564	1	1	151	2014	2014-11-28	2014-11-28	I was not feeling well	approved	\N	\N
2568	2	3	87	2014	2014-12-29	2014-12-31	Going to my native for christmas & newyear	approved	\N	\N
2561	2	2	55	2014	2014-12-03	2014-12-04	Going to Native	approved	\N	\N
2560	2	1	60	2014	2014-12-01	2014-12-01	I have to attend my friend marriage	approved	\N	\N
2549	5	1	128	2014	2014-11-26	2014-11-26	personal work	approved	\N	\N
2903	2	1	151	2015	2015-01-27	2015-01-27	Going home town	approved	2015-01-19 09:20:01.339858	2015-01-19 11:40:58.9258
2905	2	2	102	2015	2015-01-22	2015-01-23	Brother Marriage	approved	2015-01-19 10:59:37.992718	2015-01-23 04:51:31.690764
3009	8	1	178	2015	2015-02-17	2015-02-17	Mahashivarthri	approved	2015-02-16 11:03:43.695438	2015-03-03 09:36:56.908042
3070	1	1	60	2015	2015-03-03	2015-03-03	Sick	approved	2015-03-04 04:03:39.00954	2015-03-04 11:39:37.913967
3064	2	1	170	2015	2015-03-05	2015-03-05	Going to home town	approved	2015-03-03 04:47:24.860927	2015-03-05 06:00:13.502069
3085	1	1	90	2015	2015-03-05	2015-03-05	Viral fever.	cancelled	2015-03-05 05:14:43.511392	2015-03-05 16:53:46.79163
3078	5	0.5	95	2015	2015-03-04	2015-03-04	some urgent work.	approved	2015-03-04 08:24:08.447913	2015-03-06 05:02:51.447271
3090	5	0.5	80	2015	2015-03-06	2015-03-06	As i have some personal work.	approved	2015-03-05 09:11:18.015742	2015-03-06 07:48:47.749543
3104	5	0.5	209	2015	2015-03-09	2015-03-09	Not feeling well.	approved	2015-03-09 07:51:51.519809	2015-03-18 07:21:40.917662
3077	8	1	209	2015	2015-03-06	2015-03-06	Going Home Town	approved	2015-03-04 07:05:27.676361	2015-03-18 07:21:48.143583
3096	5	0.5	128	2015	2015-03-06	2015-03-06	Personal Work	approved	2015-03-06 06:16:20.479907	2015-03-18 09:52:16.43289
3418	3	1	222	2015	2015-05-08	2015-05-08	Grand father funeral function	approved	2015-05-26 05:42:50.44238	2015-05-26 06:07:39.47136
3417	5	0.5	80	2015	2015-05-25	2015-05-25	As i had some personal work.	approved	2015-05-26 05:16:46.941647	2015-05-28 05:03:24.913283
3425	5	1	59	2015	2015-05-07	2015-05-07	Not felt well.	approved	2015-05-26 13:02:54.817914	2015-05-28 05:10:55.673203
3426	3	2	60	2015	2015-05-25	2015-05-26	My sister health problem	approved	2015-05-27 05:01:29.212202	2015-05-28 06:12:38.552818
3428	3	1	60	2015	2015-04-28	2015-04-28	Sisters health problem	approved	2015-05-27 05:17:43.13915	2015-05-28 06:12:40.028116
3437	2	2	133	2015	2015-05-29	2015-06-01	I am going to native	approved	2015-05-28 05:00:57.551865	2015-05-28 06:34:09.01124
3439	1	1	171	2015	2015-05-26	2015-05-26	not feeling well	approved	2015-05-28 05:52:16.809186	2015-05-28 06:48:13.509182
3440	2	1	171	2015	2015-05-27	2015-05-27	personal work	approved	2015-05-28 05:52:54.537016	2015-05-28 06:48:15.161336
3442	2	4	191	2015	2015-05-29	2015-06-03	Some important work need to be done.	approved	2015-05-28 11:03:00.886334	2015-06-01 10:58:29.358924
3432	5	0.5	77	2015	2015-05-27	2015-05-27	went to hospital \r\n\r\n	approved	2015-05-27 10:19:13.351307	2015-06-03 05:26:40.964862
3441	5	0.5	155	2015	2015-05-28	2015-05-28	going for native	approved	2015-05-28 07:21:20.710701	2015-06-03 05:27:30.426445
3456	2	1	54	2015	2015-06-01	2015-06-01	Personal Work	approved	2015-06-02 05:05:23.170895	2015-06-03 06:49:26.771245
3467	5	0.5	197	2015	2015-06-01	2015-06-01	Viral Fever	approved	2015-06-02 12:59:11.561158	2015-06-05 09:28:32.862816
3459	2	5	211	2015	2015-05-26	2015-06-01	Viral Feaver	approved	2015-06-02 05:51:31.538502	2015-06-05 09:28:42.554395
3479	1	2	165	2015	2015-06-04	2015-06-05	Fever	approved	2015-06-05 07:53:35.654543	2015-06-05 09:46:59.698042
3470	9	1	59	2015	2015-06-01	2015-06-01	Not felt good.	approved	2015-06-03 06:37:56.158711	2015-06-10 06:51:09.282371
3472	5	0.5	142	2015	2015-06-05	2015-06-05	personal work	approved	2015-06-03 11:38:37.515827	2015-06-10 06:51:17.820449
3499	5	0.5	210	2015	2015-06-12	2015-06-12	backpain	approved	2015-06-12 09:19:31.551241	2015-06-17 05:00:11.779886
3494	2	1	77	2015	2015-06-08	2015-06-08	went to tirupati	approved	2015-06-12 05:28:54.45316	2015-06-18 06:28:01.088117
3452	2	6	80	2015	2015-06-02	2015-06-09	As I have a personal work.	approved	2015-06-01 11:53:10.210091	2015-06-23 06:01:50.263719
3497	9	2	160	2015	2015-06-15	2015-06-16	Going Home.	approved	2015-06-12 08:37:17.525538	2015-06-23 06:04:15.555012
3485	5	0.5	217	2015	2015-06-05	2015-06-05	My Father met with an accident 	approved	2015-06-08 09:30:46.635298	2015-06-25 10:58:45.111976
3421	5	1	178	2015	2015-05-25	2015-05-25	Urgent work 	approved	2015-05-26 06:02:15.045123	2015-07-22 10:27:11.162735
3457	1	1	178	2015	2015-06-01	2015-06-01	sick	approved	2015-06-02 05:44:47.781416	2015-07-22 10:27:12.868117
4305	8	1	185	2015	2015-12-25	2015-12-25	Christmas Celebration	Pending	2015-12-16 08:13:16.061447	2015-12-16 08:13:16.061447
4311	2	1	218	2015	2015-12-17	2015-12-17	Mother's treatment.	Pending	2015-12-16 20:11:38.926387	2015-12-16 20:11:38.926387
4336	8	1	131	2015	2015-12-25	2015-12-25	Christmas	Pending	2015-12-21 12:19:18.751745	2015-12-21 12:19:18.751745
4339	5	1	131	2015	2015-12-30	2015-12-30	Time Off	Pending	2015-12-21 12:25:26.332946	2015-12-21 12:25:26.332946
4346	2	1	230	2015	2015-12-28	2015-12-28	Family Function	Pending	2015-12-22 07:05:20.910482	2015-12-22 07:05:20.910482
4358	1	1	220	2015	2015-12-14	2015-12-14	not well	Pending	2015-12-22 13:44:31.12716	2015-12-22 13:44:31.12716
4359	5	0.5	95	2015	2015-12-22	2015-12-22	Personal.	Pending	2015-12-22 14:21:12.419811	2015-12-22 14:21:12.419811
4361	5	0.5	281	2015	2015-12-23	2015-12-23	Sick	Pending	2015-12-23 08:25:40.97118	2015-12-23 08:25:40.97118
4364	8	1	237	2015	2015-12-25	2015-12-25	Christmas 	Pending	2015-12-23 11:50:52.200207	2015-12-23 11:50:52.200207
4367	2	2	250	2015	2015-12-24	2015-12-25	As i am leaving for my home town on account of Christmas celebrations, i wont be available on the above mentioned days.	Pending	2015-12-23 13:18:17.522801	2015-12-23 13:18:17.522801
4310	2	2	245	2015	2015-12-17	2015-12-18	new passport verification 	approved	2015-12-16 11:21:38.513554	2015-12-24 05:10:43.396544
1806	1	1	117	2014	2014-06-03	2014-06-03	Fever and cold	approved	\N	\N
1815	1	1	123	2014	2014-06-05	2014-06-05	cold	approved	\N	\N
1823	2	1	170	2014	2014-06-09	2014-06-09	father is sick.	approved	\N	\N
1824	1	1	111	2014	2014-06-10	2014-06-10	I was not feeling well !!!	approved	\N	\N
1825	5	0.5	169	2014	2014-06-10	2014-06-10	fever	approved	\N	\N
1826	1	3	177	2014	2014-06-09	2014-06-11	Viral fever	approved	\N	\N
1827	3	1	117	2014	2014-06-11	2014-06-11	Aunt passed away. Had to travel to mysore.	approved	\N	\N
1828	5	0.5	99	2014	2014-06-12	2014-06-12	personal	approved	\N	\N
1829	5	0.5	33	2014	2014-06-16	2014-06-16	To visit Doctor	approved	\N	\N
1832	2	1	94	2014	2014-06-16	2014-06-16	In Hometown	approved	\N	\N
1833	1	1	165	2014	2014-06-16	2014-06-16	Fever and cold\r\n	approved	\N	\N
1840	2	2	95	2014	2014-06-11	2014-06-12	personal.	approved	\N	\N
1839	2	1	183	2014	2014-06-18	2014-06-18	Urgent work	approved	\N	\N
1841	3	3	143	2014	2014-06-16	2014-06-18	My cousin met with an accident and expired. So to attend his cremation.	approved	\N	\N
1842	1	1	145	2014	2014-06-16	2014-06-16	due to food poisoning.	approved	\N	\N
1837	5	0.5	139	2014	2014-06-19	2014-06-19	Going Out	approved	\N	\N
1843	1	0.5	168	2014	2014-06-19	2014-06-19	sick	approved	\N	\N
1846	2	1	147	2014	2014-06-17	2014-06-17	Birthday celebrations	approved	\N	\N
1830	2	1	107	2014	2014-06-20	2014-06-20	going to relative marriage  	approved	\N	\N
1831	2	1	155	2014	2014-06-20	2014-06-20	Meeting Parents	approved	\N	\N
1838	5	0.5	117	2014	2014-06-20	2014-06-20	Have to go to passort office. Will not come in first half.	approved	\N	\N
1845	1	1	71	2014	2014-06-20	2014-06-21	Gastritis	approved	\N	\N
1847	3	3	144	2014	2014-06-18	2014-06-20	I went to Native.	approved	\N	\N
1850	1	1	45	2014	2014-06-23	2014-06-23	sore throat and fever	approved	\N	\N
1851	1	1	169	2014	2014-06-23	2014-06-23	Health problem.	approved	\N	\N
1852	5	2	41	2014	2014-06-05	2014-06-06	Due to cold fever.	approved	\N	\N
1853	2	5	41	2014	2014-06-09	2014-06-13	Going to my Native place.	approved	\N	\N
1835	2	1	91	2014	2014-08-27	2014-08-27	going to home	approved	\N	\N
1844	2	14	90	2014	2014-06-24	2014-07-11	Going Native place.	approved	\N	\N
1848	2	1	155	2014	2014-06-24	2014-06-24	Mom hospitalised	approved	\N	\N
1849	5	0.5	109	2014	2014-06-24	2014-06-24	Visiting to temple.	approved	\N	\N
1854	2	1	170	2014	2014-06-23	2014-06-23	personal	approved	\N	\N
1855	9	1	99	2014	2014-06-19	2014-06-19	personal	approved	\N	\N
1857	1	1	80	2014	2014-06-06	2014-06-06	As i was not feeling well.	approved	\N	\N
1858	2	1	139	2014	2014-06-23	2014-06-23	Passport Verification	approved	\N	\N
1859	1	1	102	2014	2014-06-24	2014-06-24	Fever	approved	\N	\N
1836	2	1	99	2014	2014-06-25	2014-06-25	personal	approved	\N	\N
1861	5	0.5	95	2014	2014-06-25	2014-06-25	personal.	approved	\N	\N
1863	5	1	162	2014	2014-06-25	2014-06-25	Not feeling well	approved	\N	\N
1860	2	1	91	2014	2014-07-02	2014-07-02	going to friend marriage	approved	\N	\N
1865	1	2	108	2014	2014-06-25	2014-06-26	Not well	approved	\N	\N
1869	1	1	179	2014	2014-06-25	2014-06-25	Due to food poison 	approved	\N	\N
1866	5	0.5	40	2014	2014-06-27	2014-06-27	Personal Work	approved	\N	\N
1867	5	0.5	70	2014	2014-06-27	2014-06-27	Not feeling well due to food poison.	approved	\N	\N
1879	1	1	95	2014	2014-07-02	2014-07-02	high fever.	approved	\N	\N
1874	1	1	107	2014	2014-06-27	2014-06-27	Not feeling well	approved	\N	\N
1868	2	1	77	2014	2014-06-30	2014-06-30	going for native	approved	\N	\N
1873	5	0.5	154	2014	2014-06-30	2014-06-30	personal work	approved	\N	\N
1876	5	0.5	51	2014	2014-06-30	2014-06-30	Due some illness	approved	\N	\N
1864	5	0.5	159	2014	2014-06-26	2014-06-26	health problem..	approved	\N	\N
1871	1	1	30	2014	2014-06-27	2014-06-27	Not feeling well.	approved	\N	\N
1881	1	1	182	2014	2014-07-01	2014-07-01	not well	approved	\N	\N
1877	5	1	80	2014	2014-07-02	2014-07-02	As i have some personal work.	approved	\N	\N
1885	1	1	77	2014	2014-07-01	2014-07-01	Medical checkup	approved	\N	\N
1887	3	1	55	2014	2014-07-07	2014-07-07	Going to Native	cancelled	\N	\N
1884	2	2	139	2014	2014-07-28	2014-07-29	Out of Station	cancelled	\N	\N
1870	2	2	33	2014	2014-07-03	2014-07-04	Going Home 	approved	\N	\N
1875	2	3	59	2014	2014-07-03	2014-07-07	My own Sister's Engagement	approved	\N	\N
1878	2	1	177	2014	2014-07-03	2014-07-03	Going to hospital  	approved	\N	\N
1880	2	1	102	2014	2014-07-03	2014-07-03	Personal Work	approved	\N	\N
1886	5	0.5	125	2014	2014-07-04	2014-07-04	going to majestic	approved	\N	\N
1890	2	1	101	2014	2014-07-04	2014-07-04	Grand Father Hospitalised	approved	\N	\N
1891	5	1	108	2014	2014-07-04	2014-07-04	Visit hospital	approved	\N	\N
1882	2	1	44	2014	2014-07-07	2014-07-07	I am going to my native place	approved	\N	\N
1888	2	1	55	2014	2014-07-07	2014-07-07	Going to Native	approved	\N	\N
1883	9	1	87	2014	2014-07-07	2014-07-07	Going to my native....	approved	\N	\N
1893	5	0.5	143	2014	2014-07-08	2014-07-08	Have got an appointment in st Jhons for my improper digestive track. Need to go through few tests.	approved	\N	\N
1889	2	1	133	2014	2014-07-07	2014-07-07	I am going to native	approved	\N	\N
1894	5	0.5	117	2014	2014-07-08	2014-07-08	Had to go to police verification for my passport 	approved	\N	\N
1895	5	0.5	99	2014	2014-07-08	2014-07-08	I have some urgent work.please approve it	approved	\N	\N
1903	5	0.5	31	2014	2014-07-11	2014-07-11	I'm not feeling well	approved	\N	\N
1896	5	0.5	162	2014	2014-07-09	2014-07-09	important work	approved	\N	\N
1899	2	1	139	2014	2014-07-09	2014-07-09	Not Well	approved	\N	\N
1834	2	8	165	2014	2014-07-10	2014-07-21	Going to home town.	approved	\N	\N
1898	2	1	94	2014	2014-07-10	2014-07-10	going to hometown	approved	\N	\N
1900	5	0.5	51	2014	2014-07-10	2014-07-10	I need to take care of my daughter.	approved	\N	\N
1862	4	5	183	2014	2014-07-14	2014-07-18	I have to attend to MA exams.	approved	\N	\N
1901	5	1	183	2014	2014-07-11	2014-07-11	urgent personal work	approved	\N	\N
1872	2	4	40	2014	2014-07-14	2014-07-17	Going to Delhi	approved	\N	\N
1902	2	3	29	2014	2014-08-04	2014-08-06	Going to native for festival. 	approved	\N	\N
1805	2	1	98	2014	2014-07-25	2014-07-25	Going Native for Celebration of festival	approved	\N	\N
1892	2	4	139	2014	2014-08-11	2014-08-14	Out of City	approved	\N	\N
1911	5	1	72	2014	2014-07-16	2014-07-16	Work at RTO office.	approved	\N	\N
1909	2	3	160	2014	2014-07-16	2014-07-18	Going Home for Personal work.	approved	\N	\N
1935	1	0.5	33	2014	2014-07-24	2014-07-24	Back Pain	approved	\N	\N
1929	2	3	111	2014	2014-07-21	2014-07-23	Went to Native	approved	\N	\N
1925	1	1	127	2014	2014-07-14	2014-07-14	High fever and body ache.	approved	\N	\N
1905	2	2	159	2014	2014-07-15	2014-07-16	family function	approved	\N	\N
1918	5	0.5	128	2014	2014-07-22	2014-07-22	personal work	approved	\N	\N
1922	2	1	60	2014	2014-07-17	2014-07-17	personal problem	approved	\N	\N
1924	2	1	60	2014	2014-07-04	2014-07-04	health problem	approved	\N	\N
1930	5	0.5	127	2014	2014-07-24	2014-07-24	Not feeling well.	approved	\N	\N
2571	5	0.5	54	2014	2014-12-01	2014-12-01	Chetana Marriage	approved	\N	\N
2562	5	1	55	2014	2014-12-05	2014-12-05	Going to Native	approved	\N	\N
2573	2	1	176	2014	2014-12-01	2014-12-01	Friend's marriage 	approved	\N	\N
2915	2	2	198	2015	2015-01-22	2015-01-23	my brother marriage	approved	2015-01-20 13:11:41.933252	2015-01-20 13:15:39.996185
2906	2	4	52	2015	2015-01-27	2015-01-30	I will be out of station.	approved	2015-01-19 14:30:20.105162	2015-01-20 13:35:27.152336
2917	1	1	95	2015	2015-01-20	2015-01-20	Sick(Cough and Cold).	approved	2015-01-21 04:58:10.967239	2015-01-21 09:13:57.471362
2907	2	1	159	2015	2015-01-27	2015-01-27	brother marriage	approved	2015-01-20 09:23:39.869301	2015-01-27 05:47:25.126959
3066	9	1	170	2015	2015-03-09	2015-03-09	personal work	cancelled	2015-03-03 04:52:09.460435	2015-03-05 06:02:42.850369
3079	2	1	70	2015	2015-03-19	2015-03-19	Due to some personal work.	approved	2015-03-04 09:48:15.214164	2015-03-05 07:13:19.299422
3080	8	1	143	2015	2015-03-06	2015-03-06	For Holi Fest.	approved	2015-03-04 11:19:17.317587	2015-03-06 07:48:55.512377
3093	8	1	145	2015	2015-03-06	2015-03-06	To celebrate the festival.	approved	2015-03-05 10:08:26.28043	2015-03-06 07:49:15.688281
3067	2	1	191	2015	2015-03-05	2015-03-05	Going Home due to some urgent work.	approved	2015-03-03 05:25:20.521469	2015-03-06 07:49:22.093627
3101	2	6	188	2015	2015-03-09	2015-03-16	Had an operation	cancelled	2015-03-09 06:05:54.240883	2015-03-18 06:55:26.59905
3068	2	1	191	2015	2015-03-06	2015-03-06	Going home due to some urgent work.	approved	2015-03-03 05:26:17.321494	2015-03-18 12:21:00.661403
3065	2	1	170	2015	2015-03-06	2015-03-06	\r\nholi	approved	2015-03-03 04:47:48.82221	2015-03-23 10:38:39.020809
3438	2	4	145	2015	2015-04-24	2015-04-29	I went to native on above mentioned date because I had a urgent work. 	approved	2015-05-28 05:17:52.868706	2015-05-28 05:19:54.834476
3419	1	1	226	2015	2015-05-19	2015-05-19	unwell	approved	2015-05-26 05:46:43.941437	2015-05-28 06:51:14.795255
3445	4	3	226	2015	2015-06-02	2015-06-04	Exams	approved	2015-05-29 06:24:33.5636	2015-06-03 05:28:37.519715
3443	2	1	235	2015	2015-06-01	2015-06-01	Family function.	approved	2015-05-28 11:05:03.317034	2015-06-05 09:48:41.642749
3468	9	2	87	2015	2015-06-08	2015-06-09	Going home...	approved	2015-06-03 04:49:09.699261	2015-06-10 06:51:26.893392
3476	5	1.5	188	2015	2015-06-02	2015-06-03	was sick\r\n	approved	2015-06-04 11:13:04.448429	2015-06-12 06:40:18.375942
3496	9	1	95	2015	2015-06-11	2015-06-11	Personal.	approved	2015-06-12 07:33:48.646519	2015-06-12 09:12:44.870904
3434	1	2	176	2015	2015-05-28	2015-05-29	Eye check up 	approved	2015-05-27 13:22:09.44381	2015-06-22 06:56:46.776144
3471	9	1	71	2015	2015-06-05	2015-06-05	Out of Station	approved	2015-06-03 09:09:18.209951	2015-06-23 06:05:27.274846
3486	2	1	94	2015	2015-06-08	2015-06-08	not well	approved	2015-06-09 06:48:35.388716	2015-06-23 06:06:07.270126
3463	5	0.5	51	2015	2015-06-02	2015-06-02	For elections	approved	2015-06-02 08:52:28.483187	2015-06-23 06:09:38.237365
3482	2	1	209	2015	2015-06-05	2015-06-05	Went for Medical Check-up.	approved	2015-06-08 04:30:48.622904	2015-06-25 10:58:29.740219
3466	2	1	117	2015	2015-06-04	2015-06-04	Personal work	approved	2015-06-02 11:51:52.174535	2015-06-25 10:58:39.397554
1910	1	1	31	2014	2014-07-14	2014-07-14	I'm not feeling well.	approved	\N	\N
1921	1	1	181	2014	2014-07-21	2014-07-21	Tired due to running vodafone southtamilnadu marathon.	approved	\N	\N
1939	5	1	80	2014	2014-07-25	2014-07-25	As i have some personal work.	cancelled	\N	\N
1906	5	0.5	151	2014	2014-07-14	2014-07-14	Some Personal work	approved	\N	\N
1944	1	1	63	2014	2014-07-22	2014-07-22	Was not keeping well. 	approved	\N	\N
1920	1	1	91	2014	2014-07-14	2014-07-14	fever	approved	\N	\N
1952	5	1	72	2014	2014-07-28	2014-07-28	B'day	approved	\N	\N
1931	2	1	127	2014	2014-07-29	2014-07-29	Personal matters to attend to.	approved	\N	\N
1942	5	0.5	143	2014	2014-07-25	2014-07-25	Personal	approved	\N	\N
1947	5	1	194	2014	2014-07-29	2014-07-29	Eid	approved	\N	\N
1941	2	1	99	2014	2014-07-27	2014-07-27	Personal Work	cancelled	\N	\N
2581	9	2	91	2014	2014-12-19	2014-12-22	going to native.	cancelled	\N	\N
2598	5	0.5	133	2014	2014-12-03	2014-12-03	I am not feeling well	approved	\N	\N
2576	5	0.5	44	2014	2014-12-02	2014-12-02	Feeling Sick.	approved	\N	\N
2601	5	0.5	168	2014	2014-12-04	2014-12-04	sick	approved	\N	\N
2627	2	1	147	2014	2014-12-09	2014-12-09	personal work	approved	\N	\N
2584	5	0.5	99	2014	2014-12-02	2014-12-02	Headache	approved	\N	\N
2578	5	0.5	31	2014	2014-12-01	2014-12-01	I have some personal work.	approved	\N	\N
2625	2	5	177	2014	2014-12-03	2014-12-09	viral fever	approved	\N	\N
2630	1	1	211	2014	2014-12-11	2014-12-11	I was having fever.So, I didn't came to office on 11th Dec 2014.	approved	\N	\N
2908	2	2	160	2015	2015-01-01	2015-01-02	Personal Work	approved	2015-01-20 11:19:42.202928	2015-01-20 13:35:28.878915
2913	2	3	71	2015	2015-01-02	2015-01-06	Out of Station	approved	2015-01-20 12:31:49.082416	2015-01-21 09:14:30.635188
2916	2	1	40	2015	2015-01-27	2015-01-27	going out for personal work	approved	2015-01-20 13:55:38.192715	2015-01-22 12:13:17.838921
2918	5	0.5	147	2015	2015-01-21	2015-01-21	personal work	approved	2015-01-21 06:33:42.122702	2015-01-22 12:13:36.660822
3071	1	1	98	2015	2015-03-03	2015-03-03	Not feeling well	approved	2015-03-04 05:03:16.641075	2015-03-04 06:03:34.654222
3089	8	1	178	2015	2015-03-06	2015-03-06	Holi	approved	2015-03-05 09:07:27.76328	2015-03-05 09:44:51.536629
3069	8	1	99	2015	2015-03-06	2015-03-06	Holi	cancelled	2015-03-03 06:55:22.026963	2015-03-05 10:00:32.98465
3098	2	9	188	2015	2015-02-09	2015-02-19	Had an operation	cancelled	2015-03-09 05:24:22.219723	2015-03-09 05:56:52.828184
3091	2	1	131	2015	2015-03-02	2015-03-02	Personal	approved	2015-03-05 09:52:07.182712	2015-03-18 09:51:49.75981
3092	8	1	40	2015	2015-03-06	2015-03-06	Availing the Optional Leave	approved	2015-03-05 09:52:39.378405	2015-03-18 09:54:01.738007
3073	5	0.5	117	2015	2015-03-05	2015-03-05	Going to mysore, will not be in the second half	approved	2015-03-04 05:46:53.259697	2015-03-30 10:26:00.032142
3346	1	1	177	2015	2015-05-04	2015-05-04	Fever	approved	2015-05-05 05:32:30.032102	2015-05-28 05:05:05.179659
3435	2	1	59	2015	2015-05-29	2015-05-29	Going native	approved	2015-05-27 13:39:53.507789	2015-05-28 05:10:58.84526
3420	1	1	230	2015	2015-05-25	2015-05-25	food poisioning\r\nAppointment with doctor for blood test	approved	2015-05-26 05:52:57.04307	2015-05-28 06:50:56.984932
3478	2	1	203	2015	2015-06-04	2015-06-04	Personal work	approved	2015-06-05 04:09:23.727652	2015-06-05 09:28:09.73475
3461	5	0.5	209	2015	2015-06-02	2015-06-02	I am not feeling well.	approved	2015-06-02 07:10:43.422922	2015-06-05 09:44:42.258247
3444	5	1	165	2015	2015-05-28	2015-05-28	Went to drop my brother to railway .	approved	2015-05-29 05:06:37.036551	2015-06-05 10:12:51.390222
3483	1	2	90	2015	2015-06-08	2015-06-09	Viral fever.	Pending	2015-06-08 05:23:06.150807	2015-06-08 05:23:06.150807
3474	1	1	60	2015	2015-06-03	2015-06-03	not feeling well	approved	2015-06-04 05:43:28.935876	2015-06-16 13:52:37.35673
3495	5	1	60	2015	2015-06-10	2015-06-10	Personal work	approved	2015-06-12 06:28:56.753068	2015-06-16 13:52:45.140205
3460	1	1	70	2015	2015-06-01	2015-06-01	Not feeling well.	approved	2015-06-02 06:41:06.384682	2015-06-23 06:10:38.250005
3491	2	1	30	2015	2015-06-29	2015-06-29	going to marriage	approved	2015-06-10 13:52:32.547554	2015-06-26 05:09:01.129016
1917	5	1	128	2014	2014-07-22	2014-07-22	Personal work	cancelled	\N	\N
1916	1	4	195	2014	2014-07-08	2014-07-11	bad health	approved	\N	\N
1913	5	0.5	44	2014	2014-07-18	2014-07-18	Personal Reason	approved	\N	\N
1907	5	1	49	2014	2014-07-16	2014-07-16	Need to take my wife and daughter to passport office. 	approved	\N	\N
1915	9	1	99	2014	2014-07-14	2014-07-14	Personal work	approved	\N	\N
1928	5	0.5	51	2014	2014-07-23	2014-07-23	i am not feeling well	approved	\N	\N
1932	2	2	117	2014	2014-08-05	2014-08-06	My house warming ceremony	approved	\N	\N
2577	5	1	155	2014	2014-11-24	2014-11-24	Got accident	approved	\N	\N
2611	5	0.5	101	2014	2014-12-08	2014-12-08	Eye Pain	approved	\N	\N
2615	1	1	133	2014	2014-12-08	2014-12-08	I am not feeling well	approved	\N	\N
2624	2	8	176	2014	2014-12-12	2014-12-23	out of station 	approved	\N	\N
2626	1	1	151	2014	2014-12-09	2014-12-09	I was not feeling well	approved	\N	\N
2623	9	1	80	2014	2014-12-12	2014-12-12	As i have some personal work.	approved	\N	\N
2631	8	2	72	2014	2014-12-25	2014-12-26	Christmas\r\n	approved	\N	\N
2632	2	1	72	2014	2014-12-29	2014-12-29	Going to Native	approved	\N	\N
2618	2	1	51	2014	2014-12-08	2014-12-08	Some unexpected work	approved	\N	\N
2629	1	2	160	2014	2014-12-09	2014-12-10	I had Headache, Joint pains.	approved	\N	\N
2616	2	1	178	2014	2014-12-08	2014-12-08	personal work	approved	\N	\N
2597	8	2	162	2014	2014-12-25	2014-12-26	Christmas	cancelled	\N	\N
2587	8	1	99	2014	2014-12-26	2014-12-26	Christmas.	approved	\N	\N
2588	8	2	194	2014	2014-12-25	2014-12-26	Going to Native	approved	\N	\N
2605	2	3	192	2014	2014-12-29	2014-12-31	New Year	cancelled	\N	\N
2594	8	1	94	2014	2014-12-31	2014-12-31	year end	approved	\N	2015-01-05 09:07:45.191742
2589	8	1	194	2014	2014-12-31	2014-12-31	Going to Native	approved	\N	2015-01-05 09:08:05.944179
2909	2	3	160	2015	2015-01-07	2015-01-09	Personal Work	approved	2015-01-20 11:20:07.305143	2015-01-20 13:35:31.177733
2912	8	1	71	2015	2015-01-01	2015-01-01	Out of station	approved	2015-01-20 12:30:23.04329	2015-01-21 09:15:15.744281
2911	2	1	63	2015	2015-01-13	2015-01-13	Personal work.	approved	2015-01-20 11:30:27.131314	2015-02-03 04:14:25.936062
3075	2	1	151	2015	2015-03-05	2015-03-05	going home town	approved	2015-03-04 06:06:28.631807	2015-03-04 09:44:13.64045
3082	2	3	49	2015	2015-03-16	2015-03-18	As my few relatives are coming, So I will go out of station with them.	Pending	2015-03-04 12:04:05.232179	2015-03-04 12:04:05.232179
3086	8	1	52	2015	2015-03-06	2015-03-06	Holi	approved	2015-03-05 06:21:47.08142	2015-03-05 07:13:22.747255
3088	1	1	169	2015	2015-02-27	2015-02-27	sick	approved	2015-03-05 07:49:28.931678	2015-03-05 09:44:59.870685
3097	1	5	188	2015	2015-02-02	2015-02-06	Had an operation	approved	2015-03-09 05:22:48.02888	2015-03-09 05:23:35.390691
3100	8	1	188	2015	2015-03-06	2015-03-06	Had an operation	approved	2015-03-09 05:51:30.801531	2015-03-09 05:57:24.084597
3103	2	2	102	2015	2015-03-12	2015-03-13	Personal work	approved	2015-03-09 06:59:02.825587	2015-03-12 08:01:04.53581
3083	8	1	109	2015	2015-03-06	2015-03-06	Holi festival	approved	2015-03-05 04:13:31.506682	2015-03-16 04:53:09.682896
3102	2	3	188	2015	2015-03-18	2015-03-20	Operated	cancelled	2015-03-09 06:06:20.968801	2015-03-18 06:54:41.946779
3084	1	3	194	2015	2015-03-02	2015-03-04	Not well	approved	2015-03-05 05:06:49.893777	2015-03-18 09:53:14.172496
3430	2	4	197	2015	2015-05-13	2015-05-18	Personal work	approved	2015-05-27 07:28:03.897465	2015-05-28 05:13:37.169927
3427	1	2	177	2015	2015-05-25	2015-05-26	viral fever	approved	2015-05-27 05:05:25.231945	2015-05-28 06:48:19.972456
3429	1	1	210	2015	2015-05-26	2015-05-26	fever	approved	2015-05-27 05:25:21.88598	2015-05-28 06:48:29.582975
3448	5	0.5	171	2015	2015-05-29	2015-05-29	not feeling well	approved	2015-05-29 08:08:56.48146	2015-06-01 10:58:23.91993
3451	5	0.5	169	2015	2015-05-26	2015-05-26	Headache 	approved	2015-06-01 07:35:02.674684	2015-06-02 06:37:59.701302
3450	2	1	169	2015	2015-05-29	2015-05-29	Went to tirumala 	approved	2015-06-01 07:32:46.546173	2015-06-02 06:38:01.501111
3422	2	1	33	2015	2015-05-28	2015-05-28	Friends Marriage	approved	2015-05-26 09:47:51.072972	2015-06-03 05:26:33.476415
3458	1	1	211	2015	2015-05-25	2015-05-25	Viral Feaver	approved	2015-06-02 05:49:47.71725	2015-06-05 09:28:46.949162
3473	2	1	201	2015	2015-06-04	2015-06-04	Personal Work	approved	2015-06-03 13:05:34.93812	2015-06-05 09:46:50.462421
3465	5	1	214	2015	2015-06-03	2015-06-03	Need to take my son to the dentist	approved	2015-06-02 09:53:38.574074	2015-06-05 09:47:33.039828
3464	1	1	214	2015	2015-05-28	2015-05-28	Unwell	approved	2015-06-02 09:53:06.078906	2015-06-05 10:12:16.754958
3449	2	1	196	2015	2015-06-01	2015-06-01	Going to my home	approved	2015-05-29 12:30:03.816152	2015-06-10 07:10:05.986891
3489	1	1	71	2015	2015-06-08	2015-06-08	Out of station	cancelled	2015-06-10 06:36:12.399408	2015-06-10 08:00:35.411236
3493	9	1	99	2015	2015-06-11	2015-06-11	Personal Work.	approved	2015-06-12 04:07:26.680252	2015-06-12 09:12:43.015009
3447	4	2	226	2015	2015-06-17	2015-06-18	Exams	approved	2015-05-29 06:32:14.321436	2015-06-18 06:28:30.909115
3487	5	0.5	230	2015	2015-06-08	2015-06-08	cramp on legs	approved	2015-06-09 07:05:41.792889	2015-06-18 06:28:33.04659
3453	5	1	31	2015	2015-05-22	2015-05-22	Going to native	approved	2015-06-01 13:58:21.599718	2015-06-23 05:59:34.089532
3498	2	3	160	2015	2015-06-17	2015-06-19	Going Home.	approved	2015-06-12 08:38:00.885538	2015-06-23 06:00:50.067629
3454	5	0.5	31	2015	2015-06-01	2015-06-01	I'm not feeling well	approved	2015-06-01 13:59:01.511687	2015-06-23 06:11:12.891083
1856	2	2	52	2014	2014-07-11	2014-07-14	I will be out of station.	approved	\N	\N
1926	5	0.5	125	2014	2014-07-22	2014-07-22	Sick	approved	\N	\N
1904	2	1	171	2014	2014-07-14	2014-07-14	Personal work	approved	\N	\N
1897	2	1	176	2014	2014-07-11	2014-07-11	out of station 	approved	\N	\N
1912	2	1	60	2014	2014-07-16	2014-07-16	I need  to attend a funeral of my grand father.	approved	\N	\N
1919	3	3	71	2014	2014-07-09	2014-07-11	Relative passed away	approved	\N	\N
1923	2	1	45	2014	2014-07-07	2014-07-07	personal	approved	\N	\N
1940	1	1	55	2014	2014-07-24	2014-07-24	Not Well	approved	\N	\N
1945	5	0.5	63	2014	2014-06-26	2014-06-26	Went to attend Grand father death ceremony.	approved	\N	\N
1934	2	1	117	2014	2014-07-28	2014-07-28	Out of station	approved	\N	\N
1946	5	0.5	80	2014	2014-07-25	2014-07-25	As i have some personal work.	approved	\N	\N
1948	2	1	68	2014	2014-07-28	2014-07-28	Going to native.	approved	\N	\N
1949	2	1	48	2014	2014-07-30	2014-07-30	Personal	approved	\N	\N
1951	5	0.5	151	2014	2014-07-25	2014-07-25	Some personal work	approved	\N	\N
1933	2	2	117	2014	2014-08-13	2014-08-14	My engagement	approved	\N	\N
1937	2	4	188	2014	2014-08-11	2014-08-14	Native place	cancelled	\N	\N
2596	2	1	144	2014	2014-12-08	2014-12-08	i have personal work. 	approved	\N	\N
2579	1	1	154	2014	2014-12-01	2014-12-01	NOT WELL	approved	\N	\N
2617	1	1	87	2014	2014-12-08	2014-12-08	Not feeling well...	approved	\N	\N
2602	3	1	68	2014	2014-12-03	2014-12-03	My cousin expired.	approved	\N	\N
2613	2	1	147	2014	2014-12-08	2014-12-08	personal work	cancelled	\N	\N
2603	2	2	192	2014	2014-12-11	2014-12-12	Personal	approved	\N	\N
2635	5	1	147	2014	2014-12-16	2014-12-16	Bank work	approved	\N	\N
2628	2	1	201	2014	2014-12-09	2014-12-09	i  was  not feeling  well.	approved	\N	\N
2590	5	1	71	2014	2014-12-03	2014-12-03	Out of station	approved	\N	\N
2591	2	5	194	2014	2014-12-22	2014-12-30	Going to Native	approved	\N	\N
2914	3	1	71	2015	2015-01-19	2015-01-19	Relative death	approved	2015-01-20 12:32:23.266412	2015-01-21 09:14:05.383175
2910	8	1	63	2015	2015-01-01	2015-01-01	Optional - New year celebration	approved	2015-01-20 11:23:15.55321	2015-02-03 04:15:14.972343
3110	2	1	133	2015	2015-03-09	2015-03-09	i am going to native.\r\n	approved	2015-03-10 04:12:56.120231	2015-03-11 05:31:53.584601
3106	2	5	109	2015	2015-03-23	2015-03-27	Going to hometown	approved	2015-03-09 10:39:16.82527	2015-04-17 11:29:26.670248
3506	1	1	216	2015	2015-06-16	2015-06-16	Not well	approved	2015-06-17 04:44:38.134288	2015-06-17 05:00:05.960029
3509	1	1	33	2015	2015-06-16	2015-06-16	Fever	approved	2015-06-18 05:20:29.919937	2015-06-18 06:27:53.070328
3514	2	1	59	2015	2015-06-22	2015-06-22	Going native	approved	2015-06-19 11:38:23.058554	2015-06-22 06:03:49.572681
3515	1	1	176	2015	2015-06-15	2015-06-15	sick	approved	2015-06-22 07:27:39.551805	2015-06-23 06:05:04.485545
3519	2	1	143	2015	2015-05-27	2015-05-27	Was not keeping well.	approved	2015-06-22 11:18:07.866903	2015-06-23 06:11:34.97237
3530	2	8	94	2015	2015-08-21	2015-09-01	Personal vacation	cancelled	2015-06-25 06:58:10.653004	2015-06-25 07:00:58.561841
3528	1	1	72	2015	2015-06-24	2015-06-24	Not feeling well	approved	2015-06-25 04:48:03.311976	2015-06-25 09:46:31.366368
3500	2	1	212	2015	2015-06-09	2015-06-09	Went to Native Place	approved	2015-06-12 10:21:42.870322	2015-06-25 10:58:21.825581
3542	2	1	198	2015	2015-06-29	2015-06-29	I am going to marriage.	approved	2015-06-26 13:06:00.846812	2015-06-30 05:56:42.044279
3526	2	2	77	2015	2015-06-25	2015-06-26	i go for  brother-in-law wedding.	approved	2015-06-24 05:02:42.9447	2015-07-01 05:16:45.274511
3565	2	1	242	2015	2015-07-10	2015-07-10	Travelling to home town for Persoanl Reasons	cancelled	2015-07-06 13:28:06.379041	2015-07-08 05:59:32.722474
3583	1	1	101	2015	2015-07-09	2015-07-09	Sick	cancelled	2015-07-13 12:48:08.255023	2015-07-13 12:52:14.913198
3566	2	5	29	2015	2015-08-03	2015-08-07	Going to native for festival.	approved	2015-07-06 15:12:07.574911	2015-07-13 12:52:26.713208
3536	5	0.5	134	2015	2015-06-25	2015-06-25	some personal work.	approved	2015-06-25 08:28:00.947092	2015-07-13 12:52:37.321954
3590	2	1	221	2015	2015-07-17	2015-07-17	Visiting Bhopal	Pending	2015-07-16 06:21:18.183608	2015-07-16 06:21:18.183608
3579	5	1	145	2015	2015-07-09	2015-07-09	Cold, cough and bad headache in back of my head.	approved	2015-07-12 16:16:37.028491	2015-07-16 09:22:03.449339
3568	2	5	98	2015	2015-07-13	2015-07-17	Going Native to celebrate festival	approved	2015-07-07 07:41:50.765709	2015-07-17 06:57:19.512193
3569	2	2	98	2015	2015-07-20	2015-07-21	Going Native to celebrate festival	approved	2015-07-07 07:42:34.222501	2015-07-17 06:57:21.525892
3537	2	1	131	2015	2015-06-15	2015-06-15	Personal	approved	2015-06-25 09:31:17.664399	2015-07-22 10:27:05.15448
3535	2	1	218	2015	2015-06-26	2015-06-26	Outstation travel	approved	2015-06-25 07:50:51.50778	2015-07-22 10:27:19.206789
3562	2	1	218	2015	2015-07-06	2015-07-06	Outstation travel	approved	2015-07-06 05:04:21.621706	2015-07-22 10:27:21.237584
3554	2	1	203	2015	2015-07-02	2015-07-02	Personal Work	approved	2015-07-01 13:59:46.313323	2015-07-22 10:27:23.321789
3575	2	1	201	2015	2015-07-10	2015-07-10	Personal Work	approved	2015-07-09 12:12:06.163363	2015-07-27 09:07:20.099663
1914	2	1	154	2014	2014-07-22	2014-07-22	Social Event at relatives home. .  	approved	\N	\N
1927	1	1	128	2014	2014-07-15	2014-07-15	Fever and head ache	approved	\N	\N
1936	5	0.5	155	2014	2014-07-24	2014-07-24	went to hospital	approved	\N	\N
1943	1	1	63	2014	2014-07-22	2014-07-22	Was not keeping well. 	approved	\N	\N
1908	5	4	90	2014	2014-07-14	2014-07-17	Due to miss the train need 3 more days to reach Bangalore.	approved	\N	\N
1950	2	1	168	2014	2014-07-28	2014-07-28	going to native	approved	\N	\N
1953	1	1	51	2014	2014-07-25	2014-07-25	I was not feeling well..	approved	\N	\N
1962	2	1	134	2014	2014-07-25	2014-07-25	Went to chennai.	approved	\N	\N
1963	1	1	134	2014	2014-07-28	2014-07-28	Health was not good.	approved	\N	\N
1961	1	1	72	2014	2014-07-29	2014-07-29	I'm not feeling well.	approved	\N	\N
1959	8	1	52	2014	2014-07-30	2014-07-30	Eid	approved	\N	\N
1958	8	1	131	2014	2014-07-30	2014-07-30	Eid 	approved	\N	\N
1979	2	3	30	2014	2014-08-14	2014-08-19	Persnol work	cancelled	\N	\N
1954	5	1	118	2014	2014-07-29	2014-07-29	Eid-ul-Fitr	approved	\N	\N
1965	8	1	77	2014	2014-07-30	2014-07-30	to taking optional leave on 29th july	approved	\N	\N
1938	9	1	102	2014	2014-07-25	2014-07-25	Personal Work	approved	\N	\N
1955	8	1	118	2014	2014-07-30	2014-07-30	Eid-ul-Fitr	approved	\N	\N
1956	5	0.5	59	2014	2014-07-28	2014-07-28	I am having some personal work	approved	\N	\N
1960	8	1	95	2014	2014-07-30	2014-07-30	Eid.	approved	\N	\N
1964	1	1	30	2014	2014-07-28	2014-07-28	Not feeling well	approved	\N	\N
1966	2	1	99	2014	2014-07-28	2014-07-28	Personal Work	approved	\N	\N
1967	8	1	145	2014	2014-07-30	2014-07-30	On the eve of festival.	approved	\N	\N
1969	2	2	163	2014	2014-07-28	2014-07-29	Went to Native.	approved	\N	\N
1970	5	0.5	162	2014	2014-07-29	2014-07-29	not feeling well	approved	\N	\N
1971	9	1	87	2014	2014-08-01	2014-08-01	Going to my native for some personal work.	approved	\N	\N
1973	9	1	128	2014	2014-07-29	2014-07-29	Pooja in home 	approved	\N	\N
1974	1	1	165	2014	2014-07-30	2014-07-30	Not feeling well.	approved	\N	\N
1987	1	1	165	2014	2014-07-31	2014-07-31	Fever	approved	\N	\N
1976	5	0.5	176	2014	2014-07-30	2014-07-30	doctor check up	approved	\N	\N
1975	2	1	94	2014	2014-07-29	2014-07-29	personal work	approved	\N	\N
1978	5	1	127	2014	2014-07-31	2014-07-31	Personal urgent work.	approved	\N	\N
1982	5	1	70	2014	2014-08-01	2014-08-01	Due to some unavoidable urgent and personal works.	approved	\N	\N
1983	2	1	192	2014	2014-08-04	2014-08-04	college convocation and personal.	approved	\N	\N
1988	1	1	177	2014	2014-08-01	2014-08-01	viral fever	approved	\N	\N
1989	5	0.5	101	2014	2014-08-04	2014-08-04	Sick	approved	\N	\N
1990	5	0.5	91	2014	2014-08-04	2014-08-04	fever	approved	\N	\N
1991	1	1	45	2014	2014-08-04	2014-08-04	severe back pain	approved	\N	\N
1977	2	10	142	2014	2014-10-20	2014-10-31	For Celebrating Diwali and Chhath Puja with family	approved	\N	\N
1995	1	1	109	2014	2014-08-05	2014-08-05	Health was not good.	approved	\N	\N
1998	1	1	80	2014	2014-08-04	2014-08-04	As I was not feeling well.	approved	\N	\N
1994	1	1	176	2014	2014-08-06	2014-08-06	Sick	approved	\N	\N
1996	5	0.5	51	2014	2014-08-06	2014-08-06	I am having some personnel work	approved	\N	\N
1997	5	0.5	94	2014	2014-08-06	2014-08-06	personal work	approved	\N	\N
2000	5	1	52	2014	2014-08-04	2014-08-04	I had some personal work.	approved	\N	\N
2001	2	1	125	2014	2014-08-08	2014-08-08	Going out of station for rakshabandhan	approved	\N	\N
1992	2	4	127	2014	2014-08-11	2014-08-14	Going home.	approved	\N	\N
2002	2	1	179	2014	2014-08-04	2014-08-04	Personal Work	approved	\N	\N
2008	3	1	185	2014	2014-08-04	2014-08-04	Grand Mother Passed away	approved	\N	\N
2009	8	1	94	2014	2014-07-31	2014-07-31	taken leave on 31st even after informed not to take on particular(normal working day on strike).  	approved	\N	\N
2010	2	7	135	2014	2014-07-22	2014-07-30	with respect to your mail dated :- 21/07/14, due to personal appointments of yours. (Privileged level )	approved	\N	\N
2013	5	1	59	2014	2014-08-11	2014-08-11	I went to bank.	cancelled	\N	\N
2017	2	5	191	2014	2014-09-01	2014-09-05	Going Native Place 	cancelled	\N	\N
1999	5	1	80	2014	2014-08-11	2014-08-11	As i have some personal work.	approved	\N	\N
2015	1	1	143	2014	2014-08-11	2014-08-11	Personal	approved	\N	\N
2012	5	1	182	2014	2014-08-11	2014-08-11	some personal work	approved	\N	\N
2014	5	0.5	59	2014	2014-08-11	2014-08-11	I went to bank.	approved	\N	\N
2007	5	0.5	171	2014	2014-08-08	2014-08-08	personal work	approved	\N	\N
2021	2	1	107	2014	2014-08-08	2014-08-08	went to native..	approved	\N	\N
2003	5	0.5	142	2014	2014-08-08	2014-08-08	Personal Work	approved	\N	\N
2006	5	0.5	51	2014	2014-08-08	2014-08-08	For varamaha laxmi festival	approved	\N	\N
2005	2	1	71	2014	2014-08-07	2014-08-07	Relative Marriage 	approved	\N	\N
2011	5	2	77	2014	2014-08-07	2014-08-08	went to hospital  	approved	\N	\N
2004	2	1	155	2014	2014-08-14	2014-08-14	Going to Native	approved	\N	\N
1986	8	1	147	2014	2014-08-29	2014-08-29	Ganesh festival	approved	\N	\N
2022	5	1	108	2014	2014-08-12	2014-08-12	Personal Work	approved	\N	\N
2028	5	0.5	95	2014	2014-08-12	2014-08-12	was sick.	approved	\N	\N
1968	2	1	102	2014	2014-08-14	2014-08-14	Personal work	approved	\N	\N
1980	2	2	30	2014	2014-08-13	2014-08-14	Personal Work	approved	\N	\N
2027	1	1	147	2014	2014-08-13	2014-08-13	notfeeling well	approved	\N	\N
1984	2	3	144	2014	2014-08-12	2014-08-14	Passport Verification	approved	\N	\N
2026	2	6	154	2014	2014-10-13	2014-10-20	Diwali Festival 	cancelled	\N	\N
1981	8	1	60	2014	2014-08-29	2014-08-29	Ganesh chathurthi	approved	\N	\N
2023	5	1	194	2014	2014-08-18	2014-08-18	Personal	approved	\N	\N
1972	9	1	87	2014	2014-08-18	2014-08-18	Going to my native for some personal work.	approved	\N	\N
1957	2	4	190	2014	2014-08-13	2014-08-19	Going Native Place	cancelled	\N	\N
2025	8	1	194	2014	2014-08-29	2014-08-29	Going Native	approved	\N	\N
2019	2	1	109	2014	2014-08-28	2014-08-28	I want to visit hometown for festival.	approved	\N	\N
1985	2	4	147	2014	2014-08-25	2014-08-28	due to some personal work	approved	\N	\N
2018	5	0.5	109	2014	2014-08-27	2014-08-27	I want to visit hometown for festival.	approved	\N	\N
2024	2	5	194	2014	2014-09-01	2014-09-05	Going Native	approved	\N	\N
1993	5	0.5	31	2014	2014-08-05	2014-08-05	personal work.	approved	\N	\N
2580	2	5	91	2014	2014-12-23	2014-12-29	going to native	cancelled	\N	\N
2034	1	1	151	2014	2014-09-01	2014-09-01	Going my native for festival 	cancelled	\N	\N
2030	2	1	68	2014	2014-08-18	2014-08-18	For Personal Work 	approved	\N	\N
2048	1	1	133	2014	2014-08-19	2014-08-19	I am not feeling well	approved	\N	\N
2045	2	1	176	2014	2014-08-20	2014-08-20	Friend's marriage	approved	\N	\N
2055	1	1	194	2014	2014-08-19	2014-08-19	was not feeling well	approved	\N	\N
2040	2	1	107	2014	2014-08-22	2014-08-22	personal work.	approved	\N	\N
2033	2	1	151	2014	2014-08-28	2014-08-28	Going my native for festival 	approved	\N	\N
2036	2	3	91	2014	2014-09-08	2014-09-10	going to native	cancelled	\N	\N
2621	1	1	196	2014	2014-12-08	2014-12-08	fever	approved	\N	\N
2608	2	5	169	2014	2014-12-08	2014-12-12	Brother's marriage	approved	\N	\N
2599	2	1	70	2014	2014-12-04	2014-12-04	For some personal work.	approved	\N	\N
2582	2	5	91	2014	2014-12-22	2014-12-26	going to native.	approved	\N	\N
2583	9	2	91	2014	2014-12-29	2014-12-30	going to native.	approved	\N	\N
2607	2	3	192	2014	2014-12-29	2014-12-31	New Year	cancelled	\N	\N
2595	8	2	145	2014	2014-12-25	2014-12-26	On the eve of festival.	approved	\N	\N
2606	2	3	192	2014	2014-12-29	2014-12-31	New Year	cancelled	\N	\N
2619	8	2	185	2014	2014-12-25	2014-12-26	Christmas & post Christmas	approved	\N	\N
2604	2	3	192	2014	2014-12-29	2014-12-31	New Year	approved	\N	2015-01-21 09:15:01.470218
2919	2	1	178	2015	2015-01-23	2015-01-23	Traveling to home town.	approved	2015-01-21 09:17:03.969296	2015-01-22 12:13:12.147394
3107	2	2	98	2015	2015-03-12	2015-03-13	Going to Native	approved	2015-03-09 12:08:48.795408	2015-03-11 11:43:09.679948
3108	2	1	98	2015	2015-03-16	2015-03-16	Going to Native	approved	2015-03-09 12:09:16.962778	2015-03-11 11:43:11.248661
3501	5	0.5	95	2015	2015-06-15	2015-06-15	Personal.	approved	2015-06-15 06:56:31.208462	2015-06-17 05:00:24.02371
3511	5	0.5	95	2015	2015-06-18	2015-06-18	personal work.	approved	2015-06-18 09:04:44.409392	2015-06-22 06:03:39.083994
3533	2	2	213	2015	2015-06-09	2015-06-10	Out of station	approved	2015-06-25 07:46:15.586148	2015-06-25 07:46:15.586148
3516	5	0.5	133	2015	2015-06-22	2015-06-22	I am not feeling well	approved	2015-06-22 08:09:52.959132	2015-06-25 10:59:11.24267
3534	5	0.5	51	2015	2015-06-25	2015-06-25	Due to fever i am going to home	approved	2015-06-25 07:46:28.683558	2015-06-26 06:42:04.82544
3559	1	1	71	2015	2015-07-03	2015-07-03	gastritis	Pending	2015-07-02 19:24:57.727796	2015-07-02 19:24:57.727796
3561	2	1	196	2015	2015-07-06	2015-07-06	I am going to my native	approved	2015-07-03 12:03:12.913529	2015-07-07 12:11:14.885636
3582	5	0.5	101	2015	2015-07-16	2015-07-16	Sick	cancelled	2015-07-13 12:09:07.928914	2015-07-13 12:47:50.190931
3524	2	1	29	2015	2015-06-29	2015-06-29	Going to friend marriage	approved	2015-06-23 06:29:03.008263	2015-07-13 12:52:30.547905
3578	5	0.5	188	2015	2015-07-10	2015-07-10	Personal reason	approved	2015-07-10 04:19:42.446694	2015-07-13 12:52:46.7708
3572	5	1	242	2015	2015-07-10	2015-07-10	Travelling to home town for Persoanl Reasons\r\n	approved	2015-07-08 06:03:45.50402	2015-07-14 06:36:18.542261
3584	5	0.5	101	2015	2015-07-09	2015-07-09	Sick	approved	2015-07-13 12:53:53.252203	2015-07-20 04:57:31.954146
3556	1	2	197	2015	2015-06-25	2015-06-26	Hyponatremia	approved	2015-07-02 06:49:20.267457	2015-07-22 10:27:25.422354
3589	3	3	159	2015	2015-07-13	2015-07-15	due to grandfather's death.	approved	2015-07-16 04:35:15.465859	2015-08-17 13:04:07.316341
3560	2	2	209	2015	2015-07-06	2015-07-07	I am going home.	approved	2015-07-03 11:46:56.75352	2015-08-20 07:29:59.93107
3558	9	1	80	2015	2015-07-03	2015-07-03	Personal Work.	approved	2015-07-02 14:04:23.633108	2015-08-24 10:55:04.390818
3531	2	7	94	2015	2015-08-24	2015-09-01	personal vacation	approved	2015-06-25 07:01:23.285544	2015-09-25 10:27:54.744909
2031	2	1	171	2014	2014-08-18	2014-08-18	Personal Work	cancelled	\N	\N
2035	5	0.5	145	2014	2014-08-14	2014-08-14	Not well...	approved	\N	\N
2038	1	1	59	2014	2014-08-14	2014-08-14	I suffered from fever	approved	\N	\N
2049	2	2	170	2014	2014-08-18	2014-08-19	Personal	approved	\N	\N
2052	2	1	94	2014	2014-08-19	2014-08-19	personal work\r\n	approved	\N	\N
2058	2	1	158	2014	2014-08-25	2014-08-25	festival	approved	\N	\N
2047	2	1	44	2014	2014-08-22	2014-08-22	Going to native.	approved	\N	\N
2062	5	0.5	111	2014	2014-08-22	2014-08-22	I am not feeling well.\r\n\r\n	approved	\N	\N
2050	2	8	154	2014	2014-10-20	2014-10-29	Diwali	approved	\N	\N
2592	1	1	44	2014	2014-12-03	2014-12-03	Feeling fever, cough and cold	approved	\N	\N
2609	2	5	168	2014	2014-12-08	2014-12-12	going to native	approved	\N	\N
2612	5	2	80	2014	2014-12-10	2014-12-11	AS I have some personal work.	approved	\N	\N
2600	2	1	118	2014	2014-12-05	2014-12-05	Annual Day Celeberation for my children school.	approved	\N	\N
2622	5	0.5	102	2014	2014-12-09	2014-12-09	Personal work	approved	\N	\N
2620	5	0.5	99	2014	2014-12-09	2014-12-09	Not feeling good.	approved	\N	\N
2614	2	3	31	2014	2014-12-03	2014-12-05	went to native for some important work.	approved	\N	\N
2610	1	1	44	2014	2014-12-08	2014-12-08	I would like to say I can't be able to attend the office today because of cough and fever. So please me allow the leave for today.	approved	\N	\N
2633	1	1	159	2014	2014-12-16	2014-12-16	health problem	approved	\N	\N
2586	8	1	91	2014	2014-12-31	2014-12-31	End Of Year.	cancelled	\N	\N
2593	8	1	94	2014	2014-12-26	2014-12-26	christmas	approved	\N	\N
2634	1	2	140	2014	2014-12-12	2014-12-15	I was not feeling well.	approved	\N	\N
2920	1	1	145	2015	2015-01-16	2015-01-16	Food poisoning.	approved	2015-01-21 09:34:25.998994	2015-01-23 04:51:34.285262
3109	5	0.5	211	2015	2015-03-09	2015-03-09	not feeling well	approved	2015-03-10 03:34:27.365261	2015-03-18 07:08:27.828389
3502	5	0.5	145	2015	2015-06-15	2015-06-15	appointment with doctor	approved	2015-06-15 10:47:16.576713	2015-06-17 05:00:19.858355
3512	2	1	144	2015	2015-06-19	2015-06-19	I have personal work.	approved	2015-06-18 10:32:50.874834	2015-06-22 05:00:53.460142
3518	1	1	80	2015	2015-05-27	2015-05-27	As i was not feeling well.	approved	2015-06-22 10:49:37.100775	2015-06-23 05:59:54.239675
3522	2	1	209	2015	2015-06-22	2015-06-22	Went to home town. 	approved	2015-06-23 06:02:43.215996	2015-06-25 10:51:37.066521
3529	5	1	60	2015	2015-06-24	2015-06-24	Sick	approved	2015-06-25 05:18:02.031799	2015-06-26 05:08:46.281362
3543	5	1	144	2015	2015-06-26	2015-06-26	I have personal work	approved	2015-06-29 03:58:36.297298	2015-06-29 05:01:16.521177
3525	2	1	102	2015	2015-06-29	2015-06-29	Going hometown	approved	2015-06-24 04:54:27.975542	2015-06-29 05:19:38.290502
3541	5	0.5	140	2015	2015-06-26	2015-06-26	Went to hospital	approved	2015-06-26 08:02:17.771015	2015-07-01 05:16:54.244414
3551	2	1	140	2015	2015-07-03	2015-07-03	Going to native place	approved	2015-06-30 10:53:13.262264	2015-07-01 05:17:03.714206
3550	5	0.5	140	2015	2015-07-02	2015-07-02	Going to native place	approved	2015-06-30 10:52:19.111955	2015-07-01 05:17:05.872687
3564	2	2	54	2015	2015-07-17	2015-07-20	Going Home for Ramzan	cancelled	2015-07-06 10:59:15.417334	2015-07-08 05:06:18.124874
3576	5	0.5	99	2015	2015-07-03	2015-07-03	personal work	approved	2015-07-09 13:19:40.431437	2015-07-16 09:22:25.890939
3593	5	1	237	2015	2015-07-21	2015-07-21	Some personal work	Pending	2015-07-16 12:09:24.445811	2015-07-16 12:09:24.445811
3586	5	0.5	187	2015	2015-07-15	2015-07-15	Driving Licence Test	approved	2015-07-14 14:31:32.444218	2015-07-20 04:57:29.912681
3540	2	12	40	2015	2015-06-08	2015-06-23	For Wedding :)	approved	2015-06-26 05:58:42.302135	2015-07-22 10:26:58.911004
3580	1	2	224	2015	2015-06-25	2015-06-26	because of fever...	approved	2015-07-13 04:31:01.463938	2015-07-24 10:58:55.939941
3548	1	1	94	2015	2015-06-30	2015-06-30	health issue	approved	2015-06-29 12:24:43.692633	2015-08-21 11:29:26.631184
3546	2	1	71	2015	2015-06-08	2015-06-08	Out of Station	approved	2015-06-29 04:52:24.961535	2015-08-21 11:29:35.094439
2029	2	2	160	2014	2014-08-18	2014-08-19	Personal work.	cancelled	\N	\N
2039	5	0.5	139	2014	2014-08-08	2014-08-08	Festival	approved	\N	\N
2044	5	0.5	125	2014	2014-08-19	2014-08-19	Not well	approved	\N	\N
2037	5	1	108	2014	2014-08-18	2014-08-18	Janmastami Leave	approved	\N	\N
2041	5	0.5	133	2014	2014-08-18	2014-08-18	I am not feeling well	approved	\N	\N
2042	5	0.5	44	2014	2014-08-18	2014-08-18	Morning Time off	approved	\N	\N
2057	2	1	158	2014	2014-08-22	2014-08-22	festival	approved	\N	\N
2061	1	1	71	2014	2014-08-14	2014-08-14	Taken leave and not applied in EDMS. 	approved	\N	\N
2054	1	1	155	2014	2014-08-20	2014-08-20	Not Feeling well Fever 	approved	\N	\N
2060	8	1	30	2014	2014-08-29	2014-08-29	going to temple	cancelled	\N	\N
2056	5	0.5	125	2014	2014-08-22	2014-08-22	Have to catch bus going out of station.	approved	\N	\N
2059	5	1	108	2014	2014-08-22	2014-08-22	Personal work	approved	\N	\N
2043	2	8	179	2014	2014-10-03	2014-10-14	Dussehara Festival	cancelled	\N	\N
2032	8	1	151	2014	2014-08-29	2014-08-29	Going my native for Ganesh Chathurti	approved	\N	\N
2046	2	5	59	2014	2014-08-27	2014-09-02	Going native for my sister's marriage.	approved	\N	\N
2636	9	1	99	2014	2014-12-16	2014-12-16	Had work.	cancelled	\N	\N
2644	1	1.5	70	2014	2014-12-17	2014-12-18	Due to some health issues.	approved	\N	\N
2646	2	3	102	2014	2014-12-29	2014-12-31	Personal Work	approved	\N	\N
2639	8	1	59	2014	2014-12-26	2014-12-26	Going for native	approved	\N	\N
2924	5	0.5	133	2015	2015-01-23	2015-01-23	I am not feeling well	approved	2015-01-23 07:04:17.674814	2015-01-23 11:54:20.374537
2921	1	1	159	2015	2015-01-22	2015-01-22	fever	approved	2015-01-23 04:14:12.594695	2015-01-27 05:47:10.577057
2929	5	0.5	143	2015	2015-01-23	2015-01-23	Was feeling sick.	approved	2015-01-27 04:15:44.50549	2015-01-27 06:49:12.894832
3507	5	0.5	117	2015	2015-06-19	2015-06-19	Going to mysore - Will not be there in the first half	approved	2015-06-17 12:29:59.73452	2015-06-25 10:52:25.591908
2922	1	1	99	2015	2015-01-20	2015-01-20	Sick.	approved	2015-01-23 04:14:28.668507	2015-01-27 09:32:22.728069
2926	5	0.5	169	2015	2015-01-23	2015-01-23	Personal Problem	approved	2015-01-23 08:30:20.765398	2015-01-28 05:31:38.928219
3111	5	0.5	70	2015	2015-03-10	2015-03-10	Not feeling well.	approved	2015-03-10 08:21:49.329998	2015-03-18 09:52:43.951479
3135	5	0.5	128	2015	2015-03-16	2015-03-16	personal work	approved	2015-03-16 07:48:50.008864	2015-03-18 09:55:13.822197
3145	1	1	77	2015	2015-03-17	2015-03-17	not feelwell 	approved	2015-03-18 05:26:13.111621	2015-03-19 06:17:00.594263
3144	2	1	155	2015	2015-03-26	2015-03-26	Meeting my parents	approved	2015-03-18 05:11:30.955378	2015-03-19 06:17:21.252393
3167	2	8	162	2015	2015-03-09	2015-03-18	My father got expired so I was at my home	approved	2015-03-23 04:51:14.32524	2015-03-23 05:33:22.908701
3164	2	1	169	2015	2015-03-23	2015-03-23	Personal work	approved	2015-03-20 12:44:59.061804	2015-03-23 05:55:49.54031
3172	1	1	223	2015	2015-03-06	2015-03-06	health problem	approved	2015-03-23 07:28:23.590379	2015-03-23 10:04:36.620167
3161	7	2	80	2015	2015-03-19	2015-03-20	To Take care of my new born baby.	approved	2015-03-19 13:35:57.083889	2015-03-27 06:50:46.735311
3162	7	5	80	2015	2015-03-23	2015-03-27	To Take care of my new born baby.	approved	2015-03-19 13:36:34.630798	2015-03-27 06:50:56.20455
3150	1	1	201	2015	2015-02-26	2015-02-26	I was unwell	approved	2015-03-18 07:07:17.450832	2015-03-27 11:11:18.064382
3165	1	1	201	2015	2015-03-23	2015-03-23	Personal work	approved	2015-03-20 12:53:07.85699	2015-03-27 11:20:47.969133
3128	7	3	212	2015	2015-03-02	2015-03-04	Child born	cancelled	2015-03-13 11:27:35.078129	2015-03-30 10:25:30.444072
3130	3	1	117	2015	2015-03-13	2015-03-13	My uncle passed away	approved	2015-03-16 04:56:48.381958	2015-04-10 08:56:37.63169
3170	7	6	71	2015	2015-03-13	2015-03-20	Paternity	approved	2015-03-23 05:43:38.680091	2015-04-27 09:43:58.771209
3503	3	1	51	2015	2015-06-15	2015-06-15	My aunt passed away.	approved	2015-06-16 05:21:30.929372	2015-06-23 06:04:08.288763
3520	2	1	144	2015	2015-06-22	2015-06-22	House shifting.	approved	2015-06-23 03:45:48.349283	2015-06-23 06:09:55.061095
3523	2	1	99	2015	2015-06-24	2015-06-24	work.	approved	2015-06-23 06:26:18.928509	2015-06-23 08:05:48.961087
3539	1	1	222	2015	2015-06-08	2015-06-08	Not well	approved	2015-06-25 10:47:48.267783	2015-06-25 10:47:48.267783
3510	1	1	235	2015	2015-06-17	2015-06-17	I was suffering from fever.	approved	2015-06-18 05:30:42.352818	2015-06-25 10:52:35.819537
3508	1	1	109	2015	2015-06-17	2015-06-17	Health was not good.	approved	2015-06-18 05:08:29.535874	2015-06-25 10:52:41.817032
3527	5	0.5	191	2015	2015-06-24	2015-06-24	I was not feeling well in the morning.	approved	2015-06-24 08:45:34.415154	2015-06-26 10:13:13.614074
3521	2	2	33	2015	2015-06-29	2015-06-30	Going Native	approved	2015-06-23 04:04:27.119582	2015-07-01 05:16:31.949483
3552	2	1	235	2015	2015-06-30	2015-06-30	I had been to my native.	approved	2015-07-01 06:02:46.877396	2015-07-14 06:36:32.434076
3553	9	1	95	2015	2015-07-02	2015-07-02	Personal.	approved	2015-07-01 12:44:00.48462	2015-07-16 09:21:51.29098
3549	5	0.5	142	2015	2015-06-30	2015-06-30	personal work	approved	2015-06-30 05:26:18.632259	2015-07-16 09:21:54.131915
3567	1	1	191	2015	2015-07-06	2015-07-06	I was not well.	approved	2015-07-07 04:01:46.256734	2015-07-16 09:22:13.324722
3588	1	1	210	2015	2015-07-15	2015-07-15	fever	approved	2015-07-16 03:31:25.761599	2015-07-16 09:22:33.41447
3585	2	1	169	2015	2015-07-10	2015-07-10	Personal work	approved	2015-07-14 13:32:08.765106	2015-07-17 06:56:57.340301
3574	2	3	178	2015	2015-07-06	2015-07-08	Out of station 	approved	2015-07-09 06:37:11.603362	2015-07-22 10:27:15.20907
3547	5	2	214	2015	2015-06-23	2015-06-24	Daughter admitted to hospital	approved	2015-06-29 06:17:56.138383	2015-07-24 10:44:38.770767
2051	5	0.5	54	2014	2014-08-20	2014-08-20	Not feeling well so going home	approved	\N	\N
2063	2	1	168	2014	2014-09-01	2014-09-01	going to native	approved	\N	\N
2053	2	2	143	2014	2014-08-18	2014-08-19	Not Well.	approved	\N	\N
2064	8	1	139	2014	2014-08-29	2014-08-29	Ganesha Fetival	approved	\N	\N
2643	8	2	49	2014	2014-12-25	2014-12-26	using the left over leaves.	Pending	\N	\N
2638	5	0.5	145	2014	2014-12-17	2014-12-17	I have a doctor's appointment.	approved	\N	\N
2637	9	1	99	2014	2014-12-11	2014-12-11	Had Work.	approved	\N	\N
2642	5	2.5	71	2014	2014-12-17	2014-12-19	Out of Station	approved	\N	\N
2927	2	1	145	2015	2015-01-27	2015-01-27	Going to my friend's marriage in Mysore.	approved	2015-01-23 10:32:13.948034	2015-01-27 06:49:15.304678
2923	5	0.5	99	2015	2015-01-22	2015-01-22	BP Issue.	approved	2015-01-23 04:15:13.492096	2015-01-27 09:32:20.555632
3113	2	1	191	2015	2015-03-09	2015-03-09	Due to some important work at home.	approved	2015-03-10 09:46:10.131035	2015-03-11 04:58:53.149666
3126	5	1	77	2015	2015-03-13	2015-03-13	relative came to my home	approved	2015-03-13 09:19:14.835381	2015-03-13 09:59:41.345237
3124	2	1	171	2015	2015-03-16	2015-03-16	personal work	approved	2015-03-13 07:33:09.986613	2015-03-16 10:33:06.891555
3116	8	1	31	2015	2015-03-06	2015-03-06	I'm not feeling well.	cancelled	2015-03-10 12:33:17.722881	2015-03-17 07:14:08.972498
3115	5	0.5	31	2015	2015-03-05	2015-03-05	I'm not feeling well.	approved	2015-03-10 12:32:55.783171	2015-03-17 07:14:16.537591
3114	2	8	31	2015	2015-02-23	2015-03-04	I was suffered by chickenpox.	approved	2015-03-10 12:32:04.126804	2015-03-17 07:14:32.96305
3148	2	3	188	2015	2015-02-18	2015-02-20	Operated	approved	2015-03-18 06:56:03.158299	2015-03-18 07:04:46.603184
3146	1	1	41	2015	2015-03-13	2015-03-13	Due to Stomach pain.	approved	2015-03-18 06:14:30.284904	2015-03-18 07:08:32.469738
3141	2	1	94	2015	2015-03-16	2015-03-16	In Hometown	approved	2015-03-17 06:34:40.390503	2015-03-18 09:51:58.261375
3112	8	1	131	2015	2015-03-06	2015-03-06	Holi	approved	2015-03-10 08:30:19.704459	2015-03-18 09:53:51.418066
3154	1	1	95	2015	2015-03-02	2015-03-02	was Sick.	approved	2015-03-18 11:34:35.998049	2015-03-18 11:36:41.013347
3156	1	1	44	2015	2015-03-19	2015-03-19	I am unable to come to work today as I am not feeling well.	approved	2015-03-19 03:28:03.739673	2015-03-19 06:16:54.494306
3138	2	2	140	2015	2015-04-01	2015-04-02	Going to native place	approved	2015-03-16 10:51:06.783356	2015-03-19 06:17:15.805764
3158	5	0.5	143	2015	2015-03-19	2015-03-19	Had been to physiotherapist for back pain.	approved	2015-03-19 09:02:24.994789	2015-03-23 11:24:57.29285
3134	2	3	72	2015	2015-03-20	2015-03-24	Going Native	approved	2015-03-16 07:47:20.060558	2015-03-27 06:21:18.636143
3169	5	1	176	2015	2015-03-20	2015-03-20	sick 	approved	2015-03-23 05:42:36.533228	2015-03-27 06:52:19.74294
3120	2	2	54	2015	2015-04-16	2015-04-17	Going Home	approved	2015-03-11 05:00:37.605245	2015-04-03 06:19:34.596896
3504	1	1	30	2015	2015-06-15	2015-06-15	Not feeling well.	approved	2015-06-16 06:04:38.360073	2015-06-16 13:52:49.97821
3505	2	1	102	2015	2015-06-22	2015-06-22	Personal work	approved	2015-06-16 07:06:54.075124	2015-06-22 06:03:45.534615
3532	5	1	155	2015	2015-06-24	2015-06-24	for personal work	approved	2015-06-25 07:35:54.729319	2015-06-25 10:51:23.572712
3538	5	0.5	196	2015	2015-06-25	2015-06-25	fever	approved	2015-06-25 09:48:06.567858	2015-06-26 05:02:34.904291
3517	1	1	140	2015	2015-06-19	2015-06-19	I was not well	approved	2015-06-22 08:58:07.777619	2015-07-01 05:17:01.508551
3544	1	2	224	2015	2015-06-25	2015-06-27	faver	cancelled	2015-06-29 04:29:54.519818	2015-07-13 04:24:11.047279
3581	9	1	171	2015	2015-07-10	2015-07-10	personal work	approved	2015-07-13 05:41:02.999436	2015-07-16 09:22:07.527104
3587	5	0.5	171	2015	2015-07-15	2015-07-15	personal work	approved	2015-07-15 08:22:26.682994	2015-07-16 09:22:10.334554
3592	5	0.5	191	2015	2015-07-16	2015-07-16	I was having some personal work.	approved	2015-07-16 09:15:50.645297	2015-07-16 09:22:23.04482
3555	2	1	51	2015	2015-07-03	2015-07-03	Having some work	approved	2015-07-02 05:48:02.544919	2015-07-22 10:27:00.994678
3573	5	0.5	31	2015	2015-07-08	2015-07-08	I'm not feeling well.	approved	2015-07-08 09:26:52.956234	2015-07-22 10:27:03.02518
3570	5	0.5	131	2015	2015-07-07	2015-07-07	Half day off	approved	2015-07-07 08:50:02.71596	2015-07-22 10:27:07.268004
3571	5	1	211	2015	2015-07-06	2015-07-06	some personal work.	approved	2015-07-08 03:48:52.99746	2015-07-22 10:27:27.53906
3557	2	1	72	2015	2015-07-03	2015-07-03	Personal work	approved	2015-07-02 10:47:41.399273	2015-07-22 10:27:29.336742
3545	1	1	224	2015	2015-06-12	2015-06-12	faver	approved	2015-06-29 04:30:37.275044	2015-07-24 10:46:42.238848
3513	2	1	201	2015	2015-06-17	2015-06-17	I was not feeling  well	approved	2015-06-18 12:52:34.063532	2015-07-27 08:49:58.289774
3577	1	1	158	2015	2015-07-10	2015-07-10	Fever	approved	2015-07-10 03:33:37.962654	2015-08-17 13:04:22.491536
3591	5	1	118	2015	2015-07-20	2015-07-20	Eid-ul-fitr	approved	2015-07-16 07:47:12.852877	2015-08-20 07:29:31.463378
3563	1	2	94	2015	2015-07-02	2015-07-03	High Fever	approved	2015-07-06 09:58:06.105994	2015-08-21 11:17:23.489163
\.


--
-- Name: leave_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('leave_records_id_seq', 4375, true);


--
-- Data for Name: leave_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY leave_types (id, leave_types, total_leaves) FROM stdin;
1	Sick	5
2	Privileged	15
3	Breavement	7
4	Study Leave	7
5	Time Off	5
6	Maternity	84
7	Paternity	7
8	Optional	5
9	Comp Off	0
\.


--
-- Name: leave_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('leave_types_id_seq', 1, false);


--
-- Data for Name: office_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY office_types (id, name, created_at, updated_at) FROM stdin;
1	Kreatio	2013-12-06 12:35:32.193551	2013-12-06 12:35:32.193551
2	Webnish	2013-12-06 12:35:43.619611	2013-12-06 12:35:43.619611
\.


--
-- Name: office_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('office_types_id_seq', 2, true);


--
-- Data for Name: personal_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personal_details (id, employee_detail_id, pg_year, ug_year, diploma_year, puc_year, tenth_year, anniversary_date, p_dob, local_address, permanent_address, changeof_address, personalmail_id, emergency_contact, blood_group, father_name, mother_name, company_name, designation, experience, pg, ug, diploma, puc, tenth, guardian, relationship, company_name2, designation2, experience2, created_at, updated_at) FROM stdin;
1	7	\N	2012	\N	2008	2006	\N	2012-07-17	bangalore	tirupur	goa	gveluvijay@gmail.com	9880429050	O+ve	velusamy	govindhammal					B.E COMPUTER SCIENCE		STATE BOARD	MATRIC	senapathi	cousin brother				2012-09-14 12:37:21.311542	2012-09-14 12:37:21.311542
8	10	\N	\N	\N	\N	\N	\N	1960-03-23	T4, PN Reddy Building,\r\nSomeshwara Temple Road,\r\nOld Madiwala,\r\nBTM I stage,\r\nBangalore-560069	T4, PN Reddy Building,\r\nSomeshwara Temple Road,\r\nOld Madiwala,\r\nBTM I stage,\r\nBangalore-560069		vel.dhanabal@gmail.com	09986525393	O+ve	Thangavel	Selvi Thangavel														2012-10-04 06:18:04.92767	2013-07-01 06:56:57.188812
24	52	\N	\N	\N	\N	\N	2015-04-30	1986-10-03	Flat no. 203, #389 1st cross, 1st main, 1st block Koramangala, Bangalore - 34	St. No. 37A, QRS. no. 15B, New Hospital Colony, Chittaranjan		swapnil@kreatio.com	9845739047	O+	P. K. Mandal	Shefali Mandal														2012-10-05 06:53:06.587565	2015-08-12 06:50:54.895389
9	53	\N	2009	\N	2005	2003	\N	1988-02-02	I.P.B Womens hostel,\r\n1st main,10th cross,\r\nMaruthi nagar,\r\nMadiwala,\r\nBangalore-560068	25/105 Main road,\r\nManalurpet,\r\nThirukoilur(tk),\r\nVillupuram(dist)-605754		sivasankari@kreatio.com	9986883767	O+ve	A.K.Velan	V.Jeeva					B.E		Biology/Maths	sslc	Bharani	Sister				2012-10-04 06:47:46.17432	2012-10-04 06:47:46.17432
10	49	\N	\N	\N	\N	\N	\N	\N	AT-07, Ittina Neela Apartment,\r\nHoskur gate, Electronic city	Path 4E, #80\r\nRishi Aurobindo pally,\r\nDurgapur		tukaibit2004@gmail.com	9916378279	o+	Chandi Dasmukherjee	Mala Mukherjee														2012-10-04 07:28:00.30908	2012-10-04 07:28:00.30908
12	68	\N	2012	\N	2007	2005	\N	1989-03-30	#36 4th main 7th cross, \r\nBhyraveshwaranagar , Nagarabhavi main road,\r\nBangalore-560072	#36 4th main 7th cross, \r\nBhyraveshwaranagar , Nagarabhavi main road,\r\nBangalore-560072		gurudath.1989@gmail.com	9986300835	AB+	BR Nagaraj	GS Nanda					JVIT 		KLE	St.Johns High School	BR Nagaraj	single				2012-10-04 10:34:51.376723	2012-10-04 10:34:51.376723
14	74	\N	2008	\N	2004	2002	2012-10-30	2012-10-11	#1159, 18th cross, HBR layout, 1st stage, Bangalore-43	#1159, 18th cross, HBR layout, 1st stage, Bangalore-43		javeed.br@gmail.com	9916288469	A+	Abdul Rawuf	Zaibunnisa	Srishti Software	TW			B.E		Govt Junior college	St Joseph's Boys' HIgh School	Abdul Rawuf	Father	Manthan Software	Technical Writer		2012-10-04 10:37:18.248072	2012-10-04 10:37:18.248072
15	56	\N	2005	2000	\N	1997	2012-08-29	1981-04-08	No. 858 Mico Layout,\r\nopp. Water Tank,\r\nHongasandra Road,\r\nG.B. Palya\r\nBangalore-560068\r\n	KREATIO Software Pvt. Ltd.\r\n#77 & 78, Anjaneyalu Plaza,\r\nOld Mangammanapalaya Road,\r\nOff Housur Road,\r\nBangalore - 560 068		vijaijcet2003@gmail.com	9944940834	O+	Balan	Saraswathy					JCET, B.TECH(IT)	KSRIT		Neelambal Subramaniam Matriculation School	Elangovan	Brother				2012-10-04 10:40:36.995941	2012-10-04 10:43:59.488736
16	81	2009	2007	\N	2004	2001	2010-07-04	1986-09-03	#17 Venkatadri layout \r\nVenkateshwar Nilay \r\nBelandur \r\nBenalore	A H Albur\r\nAlbur Galli\r\nNear Tanga Khoot \r\nGadag		chandrala.albur@gmail.com	9886575321	O+ve	Anandrao	Kalaviti				61	77.7		59.82	59	Rohit	husband				2012-10-04 11:01:38.10519	2012-10-04 11:01:38.10519
17	44	0	2008	\N	2005	2003	\N	1986-10-22	Room No c-3\r\n\r\nSri Veerabramendra Swamy New Luxury PG for Gents \r\n#3, 20th Main road, Above More Super Market Building,\r\nBTM 1st Stage, Bangalore	S/O RAVI.M.R,\r\nMADATHUMPADI HOUSE,\r\nP.O.URAKAM, PIN-680562,\r\nTHRISSUR,\r\nKERALA, 		irahulmr@gmail.com	08089990385	O+	RAVI.M.R	AMBIKA.S.M				MCA	Bsc.Computer Science		Computer Science		RAVI.M.R	Father				2012-10-04 11:41:13.718116	2012-10-04 11:42:09.389941
21	37	\N	2010	2007	\N	2002	\N	\N	No 49/398, Near Mariamma Temple, Old Madiwala,\r\nBangalore	Kalathur(KK), Agaram Post, Tirupattur TK,\r\nVellore Dist\r\n635653		prakashntrjn@gamil.com	9886366309	O -ve	K.Natarajan	N.Vijaya					BE	ECE		Tamil	Prabakaran	Brother				2012-10-04 13:48:48.031584	2012-10-04 13:50:03.872094
5	29	\N	\N	\N	\N	\N	\N	1989-01-09	89/10.francis street,\r\nT.kallikulam	89/10.francis street,\r\nT.kallikulam		kingston@kreatio.com	09486206214	B+	swamidos devairakkam.A	S.Thanga Jothi														2012-10-04 05:52:38.911688	2013-02-13 04:06:24.247771
19	76	\N	2010	\N	2006	2004	\N	1989-05-11	#15, Munikalappa Layout, MS Nagar, Bangalore - 560 033.	#2/3, Mangapathy Street, Pattalam, Chennai - 600 012.		doss.kannan@gmail.com	+919841802448	O +ve	M.V.Ram Doss	M.R.Prema	Mind As Lab	Rails Developer	1		B.E.CSE		HSC	SSLC	M.V.Ram Doss	Father				2012-10-04 12:17:28.754229	2012-10-04 12:17:28.754229
22	50	\N	\N	\N	\N	\N	\N	1987-06-29	#74, 2nd cross nanjamma layout kr-pura bangalore	#286 4th cross behind SNR Hospital, Kanakana Palya, Kolar		srikanth.ramaswamy14@gmail.com	9886994229	A+	Ramaswamy KN	Bhagyalakshmy KM	KREATIO		1.10						Hemanth KR	Brother				2012-10-05 04:43:52.270675	2012-10-05 04:43:52.270675
2	82	\N	\N	\N	\N	\N	2010-06-21	1984-05-27	36/2 Sneka Illam, Ist Cross, Ist floor, Manjunatha Layout, Mangamapalaya, Bangalore -560068	6/74.C, Kondampatty Medu, Chidambarapatty (Po), Namakkal(Dt) - 637405		balachandran.loganathan@gmail.com	9916668479	O+ve	Loganathan	Kamalam					B.E Computer Science									2012-09-27 08:05:05.099299	2012-10-04 14:08:50.402657
23	47	\N	\N	\N	\N	\N	\N	\N	No 4, 12th Cross, 20th Main, Venkateshwara Layout, BTM I Stage, Bangalore - 560 068	1/244, Mela St, Pungampatty, Kadayam(via), Ambasamudram(tk), Tirunelveli(dt), Tamil Nadu - 627 415		selvachezhian.labam@gmail.com	9480210900	O +ve	Labam Sivasamy	Annathai									Anbu Chelvi	Wife				2012-10-05 06:31:15.026283	2012-10-05 06:31:15.026283
4	65	\N	\N	\N	\N	\N	\N	\N	Door no. 302\r\n	Prakash Nagar, Adityapur-1		pankajprasun@gmail.com	9986573701	o+ve	Om Prakash	Savitry Devi														2012-10-04 05:24:23.647933	2012-10-22 10:15:53.614061
6	38	\N	\N	\N	\N	\N	\N	\N	First floor #3A, 2nd Cross, Behind Anjaneya Temple Road, B.T.M\r\n1st stage, Bangalore-29	Renigunta Agraharam(vill), Renigunta(MD & Post),\r\nChittoor(Dist), A.P.		pasala06@gmail.com	09741728026	O +ve	P. Subramanyam Reddy	P. Devayani									Gautam kumar	Brother-in-law				2012-10-04 05:54:51.764385	2012-11-05 09:35:53.648502
7	77	\N	\N	\N	\N	\N	2013-09-08	1986-05-24	Ward no:189, House No:54/1/8,\r\nGround floor, 13th cross, B.B.M.P,\r\nGarebhavipalya,\r\nBangalore -68	7/94 Kalanivasal village,\r\nLabbaikudikadu(Post),\r\nPerambalur(D.T)\r\nTamilnadu - 621108		arunnitt@yahoo.com	9443861332	O+	Muthukrishnan	Sathya Bama									Muthukrishnan	Father				2012-10-04 06:11:45.176307	2013-09-30 10:34:50.915035
13	33	2011	2009	\N	\N	\N	\N	1987-04-27	No.51/1A, N.R Layout,\r\n\r\n5th Cross, 6th Main,\r\n\r\nGarvebhavipalya,\r\n\r\nBangalore – 560068	7/21, Nehru street,\r\nKavalkinaru -627105\r\nTIrunelveli\r\nTamil Nadu		micwins@gmail.com	9916711621	O+ve	A.Aloys Rajan	J.Jeyanthi				MBA 	BE									2012-10-04 10:37:04.386742	2014-06-23 06:06:00.965536
11	79	\N	\N	\N	\N	\N	\N	\N	333, 6th Main, M. S. Ramaiah City, J. P. Nagar 8th Phase, Bengaluru - 560076.	333, 6th Main, M. S. Ramaiah City, J. P. Nagar 8th Phase, Bengaluru - 560076.		kargudris@gmail.com	9242114437	B+ve	Shashikant	Kumud	NIMHANS	Programmer	9.6						Shashikant	Father	Wonesty Web Solutions	Associate Mgr. - Corporate Communication	2 yrs	2012-10-04 07:53:56.945193	2013-03-20 07:22:50.263095
20	31	\N	2012	\N	2005	2003	\N	1987-09-19	215,PN REDDY BUILDING,\r\nBTM 1st STAGE,\r\nSOMESHWARA TEMPLE ROAD, \r\nOLD MADIWALA,\r\nBANGALORE-68 	s/oKRISHNAN\r\n2/197,MANGUDI THERKKUVADI,\r\nMANGUDI, \r\nMUTHARASAN POST,\r\nSIVAGANGA-630561		svg.kumaran@gmail.com	9986525393	B+	KRISHNAN	NATCHAMMAL					BE.ECE		HSC	SSLC	GOVINDASAMY	BROTHER				2012-10-04 13:26:44.837764	2014-08-01 07:32:47.69476
18	72	\N	2009	\N	2005	2003	\N	1988-07-28	Room#: C2, Sri Sai Balaji PG for Gents,\r\n#3, 20th Main Road, Above More Super Market, BTM 1st Stage, Bangalore -29.	House# 23-255,\r\nIndiramma Colony, Chandragiri,Chittoor(Dist)\r\nAP-517101		jagadesh.577@gmail.com	9553493142	----	D.Kapileswaraiah	D.Narayanamma					B.Tech		MPC	SSC	D.Kapileswaraiah	Father				2012-10-04 12:03:10.804796	2014-07-30 07:19:04.522059
25	75	\N	2010	\N	\N	\N	\N	1953-06-20	Kailash c/o Mallikarjuna Nilaya, #3, Sameerpur main road , Chamarajpet-18	Kailash s/o Sadashiv P.H.C Yergol\r\nPost- Yergol\r\nTq-Dist-Yadagir\r\nPin-585218\r\n		kailash.yrg@gmail.com	9986612909	O+ve	Sadashiv	Shamala					BE									2012-10-05 07:15:44.945574	2012-10-05 07:16:14.011399
26	32	\N	\N	\N	\N	\N	2012-01-29	1951-01-01	#110, 21st Cross, 16th Main, BTM 2nd Stage,\r\nBangalore-560076	VILL-LOUNDH\r\nPOST-LOUNDH\r\nDIST-NAWADA\r\nSTATE-BIHAR\r\nPIN- 805122		lalsahab@kreatio.com	9036542115	O+ve	Mahesh Kumar	Urmila Devi									Kumari Mairina	Wife				2012-10-07 05:10:41.071912	2012-10-07 05:11:39.392072
28	78	\N	\N	\N	\N	\N	\N	1987-11-04	#26, 25th Main, 3rd 'c' cross, BTM 2nd stage, Bangalore- 560076	#301, Jigala Village, Attibele P.O, Anekal Taluk, Bangalore-562107		chaya@kreatio.com	8147716880	B+ve	Pilla Reddy	Nagaratna														2012-10-08 04:43:43.73001	2012-10-08 04:43:43.73001
43	80	\N	\N	\N	\N	\N	\N	\N	Electronic City,Bangalore	24/42 kajiyar Thoppu,1st lane South veli street, Madurai -1		prabu2006it@gmail.com	8951378379	B+	C.Gnanasekar	G.Thenmozhi														2012-10-29 10:45:11.789009	2012-10-29 10:45:11.789009
31	46	\N	\N	\N	\N	\N	\N	\N	117/38, Venkatpura Main road, Koramangala 1ST block\r\n                           Bangalore, Karnataka-560029\r\n	Jagannath Colony Qr/No : JB/6.Talcher town,Post : South Balanda,Dist : Angul 		samirpani2@gmail.com	9900104351	B(+ve)	Sri. Mihir Kumar Pani	Minakashi Pani									Dr. Pratap Pani	Uncle				2012-10-08 09:03:47.038497	2012-10-08 09:03:47.038497
29	28	\N	\N	\N	\N	\N	\N	1986-11-23	S.KARTHIKEYAN.\r\n2nd Floor,#6 4th Cross,\r\nOpposite Vimala Traders,\r\nOpposite Salarpuria Apartment,\r\nMangamanpalaya Main Road,\r\nBommanahalli,Bangalore-560068.	Trichy		karthikeyan@kreatio.com	9916839256	O	Siva	Gurulakshmi S										Father				2012-10-08 05:19:56.184094	2014-01-06 06:01:10.672198
32	67	\N	\N	\N	\N	\N	\N	1958-05-05	#21/3, 4th cross Muniswamappa Compound,Moodalaplaya,Nagarabhavi Main Road,Banaglore-560072	#21/3, 4th cross Muniswamappa Compound,Moodalaplaya,Nagarabhavi Main Road,Banaglore-560072		bharathr@kreatio.com	9980772322	O+ve	Rajanna	Akkayanna														2012-10-08 13:19:58.80265	2012-10-08 13:19:58.80265
33	57	\N	2009	\N	\N	\N	\N	1987-09-14	c/o Rama S Naik\r\n17th cross,14th main\r\nmalleshwaram	s/o Datta.N.Naik\r\npost:shirali at chitrapur \r\ndist:karwar,pin-581354		vinvdn2007@gmail.com	9742189068	A +ve	Datta.N.Naik	Parvati Naik					B.E				Datta.N.Naik					2012-10-09 11:48:07.420287	2012-10-09 11:48:07.420287
34	34	\N	\N	\N	\N	\N	\N	1983-05-09	279/3, Madhu preetha,\r\nold Madiwala,\r\nBTM 1st stage,\r\nBangalore.	56/51, Thiruvalluvar street,\r\nkathalpet,\r\nB.komarapalayam		nantharnk@gmail.com	09842749432	B+ve	Ramasamy	vijiyalakshmi									gayathiri	sister				2012-10-10 12:01:20.63491	2012-10-10 12:01:20.63491
49	41	\N	2010	\N	2006	2004	\N	1988-11-12	Hal Bangalore	Hal Bangalore		rajeevk@kreatio.com	9611544997	B+	N.k.shahi	Kamini shahi					BE (Computer Science )		Chinamaya Vid 	BIV 	Kumar Gaurav	Brother				2012-11-23 06:51:51.701297	2015-02-06 05:50:43.969729
38	42	\N	\N	\N	\N	\N	\N	1989-08-31	madiwala ayyappa temple\r\nBangalore.	Vaigai Nagar,\r\nParamakudi,\r\nRamanathapuram.\r\nTN		rameshkumar@kreatio.com	9894615211	B+	Sivanesan	Rukmani														2012-10-17 12:11:20.470386	2012-10-17 12:11:20.470386
66	105	\N	2012	\N	2008	2006	\N	1990-07-28	#182/183,4th cross,R.R.Layout,Vijinapura,bangalore-560016	#182/183,4th cross,R.R.Layout,Vijinapura,bangalore-560016		premnath105@gmail.om	9880804544	B+ve	Viswanath K S	Malar V					BE(CSE)		PCMC	State board	Malar	Mother				2013-02-25 07:33:00.014639	2013-05-02 09:12:51.256653
40	43	\N	2010	2001	1998	1996	\N	1958-12-17	S.N Gopal Reddy Building\r\nNo 5, 5th cross, Balaji nagar, Thavarkere, Madivala, Bangalore	Ramesh.P\r\nS/o Palanivel.K\r\nMinnampalli post\r\nKaripatti via\r\nSalem 636106\r\nTamil Nadu\r\nIndia		ramvel14@gmail.com	8124755857	AB +	Palanivel	Amutha					B.Tech	D.textile	+12	10th						2012-10-19 14:04:18.430964	2012-10-19 14:04:18.430964
41	89	\N	\N	\N	\N	\N	\N	\N	368,9th main, bhuvaneshwari nagar, bangalore-56.	368,9th main, bhuvaneshwari nagar, bangalore-56.		anu4494@gmail.com	9632136058	O +ve	Devaraju A s	Chandrakala N D									Chandrakal N D	mother				2012-10-22 08:52:23.230034	2012-10-22 08:52:23.230034
42	30	\N	\N	\N	\N	\N	\N	1988-09-04	Room No. C4,\r\n100/2, krishna vasanth Nilaiyam, Ohm sakthi layout, GB Palaya, Bangalore-560075.	1/38,Thatchenkattupalayam,\r\nThokkavadi(po),\r\nThiruchengode(t.k),\r\nNamakkal-637215		kavinkumarm@yahoo.co.in	+919842762996	O-positive	Murugesan	Mallika									Vijay Kumar	Uncle				2012-10-22 15:09:24.151375	2014-08-07 09:24:26.110789
119	160	\N	\N	\N	\N	\N	\N	1981-06-02	#26, K.No:980/63/26,\r\nBehind Ozone Tech Park,\r\nG.B.Palya, Bangalore-560068	H.No:3-7-2/4,\r\nSriSaiNagar Colony,\r\nMansoorabad, L.B.Nagar,\r\nHyderabad-500068		kvvsgiri2681@gmail.com	9880880006	O +ve	K.Satyanarayana Prabhu	K.Radha									Ramakrishna	Friend				2014-03-12 06:35:10.193507	2014-07-29 07:57:09.673961
46	58	\N	\N	\N	\N	\N	2012-06-15	2012-12-24	Virendra mulkeepatil\r\n#742, 6th cross 50 feet road BSK 3rd stage banglore	S/o s.v. mulkeepati\r\nVirendra mulkeepatil\r\nvidya nagar gadag		virendra.mulkipatil@gmail.com	9008199664	Ab +ve	shiddnagowda	sushila									Prabhuraj	Brother				2012-11-06 10:30:47.815885	2012-11-06 10:30:47.815885
47	55	\N	\N	\N	\N	\N	\N	1987-01-08	No.72,Dhobi Ramnna building,old madiwala,Banglore.	No.9,6th street Indira nagar,M.C.Road,Thanjavur.		appu_thendral@yahoo.co.in	9245365211	O+ve	Neelavanan	Revathi														2012-11-07 08:17:27.856554	2012-11-07 08:17:27.856554
48	85	2006	\N	\N	\N	\N	2009-06-04	1985-01-08	No 51, 2nd cross,21st main BTM II stage,Bangalore	2/489 masathiyar nagar,Okkur-630557,Sivagangaii Dist,Tamilnadu		dnjaya@gmail.com	9886928179	A+ve	Narayanasamy	Rajammal				MCA					Nagarajan	husband				2012-11-08 14:02:16.63707	2012-11-08 14:02:16.63707
45	45	2005	2002	\N	\N	\N	2014-02-09	1982-06-25	1536, 1st Floor, 23rd 'A' Cross, 4th Main\r\n7th Sector, HSR Layout\r\nBangalore 560102\r\n9845577115	11/5A VOC First street, Near Nalli School, Chinnamanur, Theni District, Tamil Nadu		ramtel2005@gmail.com	09686663742	O+ve	Packiam	Pandeeswari				MCA	BSc				Viji	Sister				2012-11-06 05:37:01.031668	2014-12-22 09:29:05.548407
27	51	\N	2007	\N	2003	2001	\N	1986-04-18	#107,vaishnavi nilaya,\r\n9th main,Virat nagar,\r\nBommanahalli	#107,vaishnavi nilaya,\r\n9th main,Virat nagar,\r\nBommanahalli		chincy_reddy@yahoo.co.in	9448694378	o +ve	G.P.Krishna Reddy	M. Rama mani					BE		12th	10th	Lokesh G	Husband				2012-10-07 12:43:07.225616	2015-02-18 07:31:19.425482
50	95	\N	\N	\N	\N	\N	\N	1990-06-11	#165,7th amin,13th cross,agb layout,hessaraghatta main road,bangalore-560090	@+po-govind pitaujhia\r\nvia-rampurhari\r\ndistt-sitamarhi\r\npin-843117\r\nbihar		vishnuprabhakar78@yahoo.com	9632929186	b+	ram krishna singh	veena kumari									Alok kumar	cousin brother				2012-11-29 07:04:59.768168	2014-08-05 13:34:21.936344
35	59	\N	\N	\N	\N	\N	\N	1990-09-11	Bangalore	Tirupur		gveluvijay90@gmail.com	9880429050	O+ve	Velusamy	Govindhammal									senapathi	cousin brother				2012-10-15 08:38:32.587861	2015-02-02 09:18:16.728546
36	54	2011	2008	\N	2005	2003	\N	1989-01-16	8-1-40/A/20/12/AK,\r\nSamatha Colony,Tolichowki,\r\nHyderabad.	#4,Vasantha Complex,Dwaraka Hotel Nandyal, Kurnool(Dist),\r\nAndhraPradesh		shabrinsyed@gmail.com	09885202136	B+ve	Syed Mahaboob Basha	Syeda  Ashrafunnisa				MCA	BSc(MECS)		MPC	SSC	Mahaboob Basha	Father				2012-10-15 09:31:29.385244	2015-02-16 07:00:11.690822
30	70	\N	\N	\N	\N	\N	2013-05-23	1984-10-25	G7, Ground floor,HSR TRINITY APARTMENT, Garebavi palya, Muneshwar nagar,Bangalore-560068	263, HANAGUDU ROAD, NILAVAGILU, HUNSUR, MYSORE DISTRICT ­ 571105, KARNATAKA, INDIA		deepasukeerthi@gmail.com	9986356028	O+ve	Channabasappa	Pushpa	GTRE DRDO, Bangalore	Trainee	9 months						Sukeerthi	Husband				2012-10-08 08:44:44.637234	2014-09-24 10:58:11.314105
52	36	\N	\N	\N	\N	\N	\N	1989-12-15	NC1-G6,vijaya bank apartment Billekahalli 	Ranchi		nitin.nayan@yahoo.co.in	9886415084	b +ve	raghubir prasad	Geeta Devi														2012-12-16 10:10:30.27173	2012-12-16 10:10:30.27173
53	35	\N	\N	\N	\N	\N	1973-07-06	1954-01-02	#1629,19Across,3rd main\r\n7th Sector,\r\nHsr Layout\r\nBangalore-102	c/o- D.B& Son's hardware shop\r\nOpp- Durkhee gali, Dariyapur\r\nPatna-800004\r\n		neetinkumar@kreatio.com	9379513402	A+	Ram Swaroop Prasad	Poonam Gupta														2012-12-24 05:25:57.047799	2012-12-24 05:25:57.047799
73	111	\N	\N	\N	\N	\N	\N	\N	No 477 Siddeshwara Nilaya 3rd Cross Hoodi Near Megana Nursing Mahadevapura Post Bangalore-560048	No 477 Siddeshwara Nilaya 3rd Cross Hoodi Near Megana Nursing Mahadevapura Post Bangalore-560048		manjunath.hs.ram@gmail.com	  9008422880	A+	Late Siddesh Kumar H.M	C. Rajeshwari														2013-04-18 07:08:52.7104	2013-04-18 07:08:52.7104
216	262	\N	\N	\N	\N	\N	\N	1988-01-29	282, 283, 16th East Street ,Methanagar extension,Kundrathur,  Chennai 600069	282, 283, 16th East Street ,Methanagar extension,Kundrathur,  Chennai 600069		jkannan@webnish.com	9787132984	A+ Ve	Jeyabal	Mary									Jeyabal	Father				2015-11-20 05:03:46.058905	2015-11-20 05:03:46.058905
63	103	\N	2009	2006	2004	2002	\N	\N	NO:16/6,Munikrisnappa Layout,Koramangala Road,Opp To Corporation Kalyan Mantap,Adugodi,Bangalore-560030.	Manali Jaderpalayam,Periyamanli(Post),Namakkal(Dt),Pincode-637410.		manivannan066@gmail.com	9597345222	o+Ve	Arthanarisamy.P	Vanaja.A					B.E(CSE)	D.C.E	12	10	Arthanarisamy.P	Father				2013-01-18 12:19:05.116816	2013-01-18 12:19:05.116816
51	96	\N	2011	2008	2004	2002	\N	1986-02-19	#17 venkatadri layout, kariammana agrahara Belandur post opp to new horizon coll behind salapuria touch stone banglore 560103	#1324/3 vishaw parvati near gopal krishan temple chufala pandharpur 413304 dist solapur [M.H]		vishalmbadave@gmail.com	9886575321	B+	Madan	Anuradha	Infosys Bpo limited 	Process associate 	0.9		Bach of comp application	computer science	science		Rohit Patil	Brother				2012-11-29 09:13:11.182834	2013-01-22 04:25:21.677514
61	102	2009	2007	\N	2004	2002	\N	1987-03-13	73 NEAR SRI VENKATESHWARA TEMPLE,\r\nOLD MADIWALA,\r\nBANGALORE-560068.	27/482 ARASAMARA LANE,\r\nKODIMARATHU MOOLAI,\r\nTHANJAVUR-613001		madhavanrajarathinam86@gmail.com	09994652140	A+VE	RAJARATHINAM	SASIKALA				MCA	BSC COMPUTER SCIENCE		MATHS-COMPUTER SCIENCE	SSLC	RAJARATHINAM	FATHER				2013-01-17 10:36:31.828402	2014-07-30 08:03:55.054939
64	100	2012	2009	\N	2006	2004	\N	\N	hsr layour\r\nhno:13\r\n4cross\r\nsanjay nagar	d.no:-2-125/c\r\natchampeta junction\r\nkakinada		kodavati4u@gmail.com	9090551713	B+ve	Subbarao	Annapurna				75	68		59.8	74						2013-02-18 10:24:32.217164	2013-02-18 10:24:32.217164
65	104	2012	2007	\N	2003	2001	2012-03-04	1983-07-10	#49,Anchemuskur (Vill)\r\nMalur (Ta)\r\nKolar	#49,Anchemuskur (Vill)\r\nMalur (Ta)\r\nKolar		munirajur@kreatio.com	09900721768	AB+ve	Rangappa	Papamma	Hathway Cable and Datacom Ltd	Sales TL	3+	MBA	B.Sc		PCMB	State Board	Manju	Brother	TTN	Manager-Sales and Marketing	2+	2013-02-19 05:14:41.043468	2013-02-19 05:14:41.043468
67	97	\N	\N	\N	\N	\N	\N	1960-11-07	Shriram samruddhi	734/A GandhiNagar Jammu		esha_235@yahoo.com	8105908521	o+	Mr. U.S Sethi	Ms. Babli Sethi	Wonesty	Sr. Executive		MPT, MBA	BPT				Yugkant Sethi	Brother	Covenant	Asst. Manager		2013-03-04 05:46:36.386633	2013-03-04 05:46:36.386633
68	107	\N	\N	\N	\N	\N	2012-08-22	\N	mangampalya\r\nbangalore	1c/4 sundaravelpuram\r\ntuticorin\r\ntamilnadu 628002		antoaloy@gmail.com	04612362196	0+	Leon	infanta														2013-03-28 04:56:56.502511	2013-08-22 04:51:37.655609
70	106	\N	\N	\N	\N	\N	2012-04-15	2012-06-06	priyadarshini.R\r\nw/o Nagaraj.M\r\nBtm layout,14thmain\r\nTallamsudha Apartments\r\nNS Palya	priyadarshini.R\r\nw/o Nagaraj.M\r\nBtm layout,14thmain\r\nTallamsudha Apartments\r\nNS Palya		shreepriya.r@gmail.com	8095509284	B+	Ramesh.R	Triveni.R									Nagraj	Husband				2013-04-03 05:09:52.311575	2013-04-03 05:09:52.311575
72	110	\N	2011	\N	2007	2005	\N	1946-06-18	#201,k blk ,6th c cross\r\nRamakrishna nagar \r\nMysore	#201,k blk ,6th c cross\r\nRamakrishna nagar \r\nMysore		chethu.sacchu@gmail.com	7829224088	B +ve	HP Thammaiah	KN Meenakshamma					BE in CSE		PCMB	Science	Thammaiah	Father				2013-04-09 10:47:03.000551	2013-04-09 10:47:03.000551
74	116	2007	2004	\N	2001	1999	2008-11-20	1953-03-17	W/o Mahesh Awati\r\n#60, Mahaganapathi Nagar, WOC, Rajajinagar, Bangalore.	C/o, Basavaraj Awati.\r\nJain Galli, Athani, Belgaum Dist.		anupama@kreatio.com	9448809635	B+ve	Basavaraj Ankalagi	Shakunthala Ankalagi 	Kendriya Vidyalaya, Kudremukh.	Teacher	2.4 years	M.Sc	B.Sc, B.Ed		Govt. PU College	Kendriya Vidyalaya Kudremukh	Mahesh Awati	Spouse	KLE College, Bangalore	 Lecturer	3 months	2013-04-22 05:34:51.238165	2013-04-22 05:34:51.238165
75	113	2011	\N	\N	2008	2006	\N	1959-03-16	House no 5, RK City, Hennagara (p) Anekal (t) Bangalore 560099	Nagarakatte N G halli (p) Hosadurga (t) Chitradurga (d) Karnataka		mallu.arjunr@gmail.com	9880289209	O positive	Rudrappa M	Naramma	m2m technology pvt ltd	Sales Support Executive	9	BBM			PUC	SSLC	Madhu	Sister				2013-04-24 05:11:33.524566	2013-04-24 05:11:33.524566
85	131	\N	\N	\N	\N	\N	\N	1980-02-28	1704,C Wing, Oak Block,Salarpuria Greenage,Hosur Road, Bangalore	147, Sector 11, Pocket 3, Dwarka, New Delhi		priyali@kreatio.com	9632134141	B negative	Mr Jagat Singh	Mrs Savita Rani									Siddharth Hooda	Husband				2013-07-15 10:15:57.258223	2013-10-14 09:49:40.030129
69	108	\N	\N	\N	\N	\N	\N	1985-11-09	Kaggadaspura,, bangalore - 560093	Purani godown , Gaya Bihar - 823001		manjulak@kreatio.com	8050064244	B+	Ganesh Prasad	Bimla Devi									Siddhartha Shankar	Husband				2013-03-29 06:15:38.364827	2014-08-27 09:12:24.06631
62	101	2011	2007	\N	2004	2002	\N	1987-04-26	11038,Swarnamahal,20th A main,Sri venkateshwara layout, maruthi nagar,\r\nbtm 1st stage,-560068	3/128,Arasur pudur,Arasur(p.o), Sathy(tk),Erode (dt),\r\nTamilnadu-638454		nragavmca@gmail.com	9600951938	o+ve	Nachimuthu	Rajeshwari				MCA	B.COM		Saru Matriculation Higher Sec School	Saru Matriculation Higher Sec School	Nachimuthu	Father				2013-01-17 10:45:02.506857	2015-12-07 11:29:57.652001
59	64	\N	\N	\N	\N	\N	\N	1987-03-07	No.16, 7th Cross, M.N. Palya,\r\nNear Somasondra Palya Bus Stop,\r\nSomasondra Palya, Agra Post,\r\nBangalore - 560102	Vill-Balat\r\nPost-Aunsi\r\nP.S-Rahika\r\nDist:-Madhubani(Bihar)		dharmender1987@yahoo.co.in	9845949353	B+ve	Laxman Yadav	Laruvati Devi														2013-01-09 14:37:35.614646	2015-02-02 07:46:28.865457
54	99	\N	2012	\N	2008	2006	\N	1991-01-20	Opp. irrigation colony near bandhauli village,robertsganj,sonbhadra	Opp. irrigation colony near bandhauli village,robertsganj,sonbhadra		dktripathi.advocate9415@gmail.com	09415677675	o+	D.K Tripathi	Mandavi Tripathi					B.E		PCM	PCMB	D.k Tripathi	father				2012-12-24 06:04:47.901793	2015-02-02 07:14:55.64204
71	109	\N	\N	\N	\N	\N	\N	1989-12-24	#895, 9th "a" main,9th Cross Srinagar Bangalore-560050	#895, 9th "a" main,9th Cross Srinagar Bangalore-560050		pavankadwadkar9@gmail.com	9916259656	A	arvind	radha									shivanand	Brother				2013-04-03 11:44:05.312666	2015-02-02 10:35:53.134144
56	98	2011	\N	\N	\N	\N	\N	1989-07-20	Maruthi Nagar,\r\nMadiwala,\r\nBangalore.	#26-358,\r\nM.S Nagar, \r\nNear R.S Road,\r\nNandyal,\r\nKurnool.		hyder.vali01@gmail.com	9885875616	B +ve	Ghouse	Shekun				MCA					Hyder Vali	Brother				2012-12-31 13:00:07.841921	2015-02-05 08:59:14.465233
55	91	\N	2010	\N	2006	2004	\N	1989-06-10	100/A, Krishna vasanth nilaya,Ohm Shakthi layout, GP palaya\r\nbangalore-560068	7/590, maravanoor,\r\nmanapprai,\r\ntrichy-621306		vtrkanna@yahoo.com	9944886566	B +ve	Velayutham	thaiyalnayaki										Single				2012-12-28 11:51:56.571241	2015-02-06 06:30:38.667179
60	94	\N	2011	\N	2007	2005	\N	1989-04-16	#69,1st main,4th cross pattegarapalya main road,Munikrishnappa layout,Bengaluru-560072	#69,1st main,4th cross pattegarapalya main road,Munikrishnappa layout,Bengaluru-560072		mohankumar.kcs@gmail.com	9845085074	o +ve	K Chandrashekar	Mangalagowri					B.E		PUC	SSLC		Single				2013-01-11 07:06:19.941524	2015-11-20 13:20:10.568763
77	114	\N	2012	\N	2008	2006	1988-03-16	1958-08-19	#9 & 10, 4th cross, munneshwara nagar, bommanahalli bangalore 68	#9 & 10, 4th cross, munneshwara nagar, bommanahalli bangalore 68		saleemkhan08@gmail.com	8147169783	B+	Habeeb Khan C P	Hameeda Banu	country vacations	customer support executive	6 months		B.E. (73.7 %)		PUC ( 83 %)	SSLC (74.7 %)	Shahnaz Banu	Sister				2013-05-17 06:05:30.135898	2013-05-17 06:08:44.148168
3	71	\N	\N	\N	\N	\N	2011-02-24	\N	#978,23 Main, 25TH A cross,Sector-2,HSR Layout,Bangalore-560102.	#978,23 Main, 25TH A cross,Sector-2,HSR Layout,Bangalore-560102.		girish_k85@yahoo.com	+919845004758	0+ve	Krishna.N.S	Lakshmi.Devi	Srishti Software	Business Development Executive 	1.8	MBA (International Business) PRIST University	B.E (Information Technology) Vivekananda Institute of Technology		Vijaya Main College	Christ School	Shailaja	Sister				2012-10-04 05:23:28.798469	2013-05-22 05:53:03.094162
78	124	\N	2013	\N	2008	2006	\N	1989-10-29	Room no. 102, Narendra PG, near Bosch office,\r\nBangalore, Karnataka \r\n560068	Sarswati Sadan, Mohalla Maulaganj, Post Chandchowra, Gaya, \r\nBihar - 823001		rituraj@kreatio.com	9934614634	B+	Nagendra Kumar Singh	Lalita Chauhan					7.26		82	86	Lalita Chauhan	Mother				2013-06-26 11:08:54.497178	2013-06-26 11:08:54.497178
81	123	2013	2011	0	2008	2006	\N	1991-08-30	Royal pg for women,\r\nnear to ganesha temple,\r\nGB palya Road,\r\nBangalore-560 068	88,Marriamman kovil st,\r\nRegd. office back side,\r\nAravakurichi-639 201,\r\nkarur(DT),\r\nTamil Nadu.	-	srisakthirajendran@gmail.com	9944664851	A1+	A.Rajendran	R.Kalai selvi	-	-	-	Msc(OR&CA)	B.sc(Maths)	-	Biomaths	state board	A.Rajendran	Father	-	-	-	2013-07-02 05:10:03.546616	2013-07-02 05:10:03.546616
82	129	\N	\N	\N	\N	\N	\N	1992-06-12	plot no.900\r\n17th main road 25th cross road\r\nhsr layout sector III\r\nBanglore	44 jamiya mosque street , ambasamudram tirunelveli district , tamil nadu \r\n627401		fzlmhd12@gmail.com	09842790712	ab+ve	mohammed farook	kathunnisa farook									beejan beevi	aunt				2013-07-02 05:11:04.698985	2013-07-02 05:11:04.698985
83	130	\N	2013	\N	2009	2007	\N	1992-04-02	room no. 104,\r\nNarendra luxury,\r\n14th cross,\r\n near bosch office,\r\nBommanahalli,\r\nbangalore,Karnataka	No.9 Saravana Thottam,\r\nMahalakshmi Nagar,\r\nNo.1 Tollgate,\r\nTrichy,\r\nTamil Nadu. 621216		eniyannitt@gmail.com	+918056523533	B +ve	Dhanasekaran A	Valarmathi M					B-TECH (EEE)				Dhanasekaran A	father				2013-07-02 05:12:34.095646	2013-07-02 05:12:34.095646
84	120	\N	\N	\N	\N	\N	\N	1987-06-06	Bannerghata Road	Orissa		gupta_mohanty@rediffmail.com	9886606134	O+ve	P.K.Mohanty	K.P.Mohanty														2013-07-05 08:28:19.278731	2013-07-05 08:28:19.278731
86	119	\N	\N	\N	\N	\N	2004-06-09	1976-09-10	B-807, Brigade Palmsprings, 24th Main, JP Nagar 7th Phase, Bangalore -78.\r\n\r\n	B-807, Brigade Palmsprings, 24th Main, JP Nagar 7th Phase, Bangalore -78.		sujatha@kreatio.com	9449302310	0+ve	V.V.Mohan	kanthamani														2013-07-22 06:31:34.066468	2013-07-22 06:31:34.066468
39	87	2014	2010	\N	2006	2004	\N	1989-03-15	Bangalore	Nagercoil	NC	merlinjkumar@gmail.com	09442332775	O+ve	A. ChellaNadan	M. Maria Helen Vimala				M.Tech(Information Technology)	B.Tech(Information Technology)		HSC	MATRIC		Dad				2012-10-17 12:12:32.507705	2015-06-25 09:25:41.99019
87	132	\N	2011	\N	2007	2005	\N	1990-05-28	YELAHANKA NEW TOWN BANGALORE	Sree prada,5th cross,Shivamookambika nagar,Upparahalli,Tumkur		vinayhs@kreatio.com	9449755503	B+ve	Shashidhara Murthy	Umadevi S	Innovation Technologies	Software Associate	1.3		BE		PUC	SSLC	Shashidhara murthy	Father				2013-08-01 09:27:02.672672	2013-08-01 09:27:02.672672
89	134	\N	\N	\N	\N	\N	\N	1988-02-20	KUMAR MANISH, HALL-A FIRST FLOOR, ORATOR SINGH PG, 2#2B, 3RD CROSS NGR LAYOUT, ROOPENA AGRAHARA BOMMANAHALLI-560068, BANGALORE	KUMAR MANISH, S/0-SRIKRISHNA SINHA, VILL.-SHERPUR, P.O.-DARUARA, P.S.-NOORSARAI, DIST.-NALANDA,\r\nPIN CODE-803101,\r\nSTATE- BIHAR		kumar33manish@gmail.com	+919886415084	AB+	SRIKRISHNA SINHA	MEENA KUMARI SINHA									PIYUSH KUMAR	Brother				2013-08-16 09:21:57.681771	2013-08-16 09:21:57.681771
90	136	2010	2007	\N	2007	2005	\N	1965-08-06	R PRAKASH REDDY BUILDING, NEAR TO A K FOOD MART,G S PALYA MAIN ROAD KONAPPANA AGRAHAR ELECTRON CITY,\r\nBANGALORE-560100	S/O SHRIMANTH NAMANE AT POST TADKAL TQ, ALAND \r\nDIS,GULBARGA\r\nSTATE,KARNATAKA\r\nPINCODE-585302		ssnamane@gmail.com	9686148682	O POSSITIVE	SHRIMANTH	KAMALABAI	KEN GROUP	AUDITOR	3 MONTHS	MBA	BBM		SCIENCE	KARNATAKA HIGHER SECONDARY	VISHWANATH	SISTER IN LAW				2013-08-26 11:52:07.534677	2013-08-26 11:52:07.534677
91	135	\N	\N	\N	\N	\N	\N	1963-01-14	BTM 2nd Stage	BTM 2nd Stage 		manoj.mutha@gmail.com	07411119922	o+ve	Manoj Mutha	Sangeeta Mutha 														2013-09-06 09:43:04.766783	2013-09-06 09:43:04.766783
58	40	\N	\N	\N	\N	\N	\N	1985-03-05	Flat no #424, Radiant Redwood\r\nSy No 62/2 , Begur koppa Road,\r\nYeleanahalli Village, Begur Hobli,\r\nBangalore South - 68\r\nNear to Nice Road	Gopobandhu Nagar,\r\nSemiliguda, Dist:Koraput\r\nOdisha		rabindrak@kreatio.com	09880221466	O +ve	R.Ch. Maharana	M. Maharana									Mahendra	Brother				2013-01-04 08:12:30.215261	2013-09-11 10:34:21.351982
79	127	\N	2013	\N	2008	2006	\N	1991-07-29	455- ITI Layout, Hosapalya, Bangalore, KA- 560068	E-199 AWHO (Tyagi Vihar)\r\nBangla Bazaar\r\nLucknow - 226012\r\nU.P.		manud@kreatio.com	9785135101	B+	Virendra Kumar Dwivedi	Sudha Dwivedi					6.2		74	92	Virendra Kumar Dwivedi	Father				2013-06-26 11:12:00.237048	2014-08-07 04:47:17.103622
76	117	\N	2012	\N	2008	2006	\N	1990-06-18	no 12,Sri Hari Krupa,Sri Vinayaka Layout,Basaveshwarangar,Magadi Main Road,Bangalore-560079	no 12,Sri Hari Krupa,Sri Vinayaka Layout,Basaveshwarangar,Magadi Main Road,Bangalore-560079		chetana.gem@gmail.com	9741411510	B+ve	S.L.Chandrashekar	S.Vimala					BE(BTL Institute of Technology)		VVS Sardar Patel PU College	Nirmala Rani School	S.L.Chandrashekar	Father				2013-05-02 09:47:56.60953	2015-11-20 04:59:26.821752
44	90	1999	1996	1995	1993	1991	2009-05-06	1974-06-02	#21,7th Cross, Somasondra Palya, HSR Sector-2 Bangalore-560102	Poonam Cenema Road, Mirzapur, Lalbagh, Darbhanga, Bihar\r\nPIN-846004		ajay.karn@gmail.com	+919900643498	O+	Sri. S.N.Das	Smt. Kanti Devi	HDFC Bank	Heavy Vehicle Sales	4	M.Sc. (LNMU, Darbhanga)	B.Sc. Physics (LNMU, Darbhanga)	DCA (Aptch)	I.Sc.(BIEC, Patna)	Matriculation (BSEB, Patna)	Swati Karn	Wife	Srishti Software Applications Pvt.Ltd.	IT-Head	5	2012-11-02 11:42:45.502492	2015-02-02 09:31:38.033016
93	125	\N	\N	\N	\N	\N	\N	1989-10-29	Hosapalya, Bangalore, Karnataka - 560068	Sarswati sadan, mohalla maulaganj, post - chandchowra, Gaya - Bihar\r\n- 823001		rituraj291089@gmail.com	9934614634	B+	Nagendra Kumar Singh	Lalita Chauhan									Lalita Chauhan	Mother				2013-10-07 04:42:13.29078	2013-10-07 04:42:13.29078
94	139	2011	2008	\N	2005	2003	2013-01-18	1987-10-11	1st A main road,\r\nDayananda nagar,\r\nSrirampuram	1st A main road,\r\nDayananda nagar,\r\nSrirampuram		saralamca.sampath@gmail.com	9008307668	O+	Sampath	Megala				MCA	BCom				Nirmal Kumar Kn	Husband				2013-10-08 10:23:31.920184	2013-10-08 10:23:31.920184
88	133	\N	2013	2010	\N	2007	\N	1992-01-27	215,s4 pn reddy building,someshwara temple road,old madiwala,btm1stage,bandalore-560068	tamilarasu\r\ns/othangarasu\r\ntherkku thottam\r\ns.uduppam(PO)\r\nnamakkal-637019\r\ntamilnadu		tamilarasunkl52@gmail.com	+919003447566	B+	Thangarasu	pappathi					BE-cse	diploma-cse		state borad	my brother					2013-08-01 10:10:07.419235	2015-01-27 07:48:31.494971
80	128	\N	2011	\N	2007	2005	\N	1990-08-21	no-28,4th cross,vinayaka nagar,near vidhyapeeta circle,banashankari 1st stage,bangalore-560050	no-28,4th cross,vinayaka nagar,near vidhyapeeta circle,banashankari 1st stage,bangalore-560050		hksswathi@gmail.com	9482553335	o+	H.K Raghavendra	H.K Shoba	Eabyas Info solution	Software Developer	17		Btech		12	ssc	Swetha	Sister				2013-06-27 12:41:49.573184	2015-02-02 07:17:59.838151
217	274	\N	\N	\N	\N	\N	\N	1984-08-16	HNO: 34,CCI Colony,Karankote,Karankot,K.V Rangareddy(DT),Telangana,501158	HNO: 34,CCI Colony,Karankote,Karankot,K.V Rangareddy(DT),Telangana,501158		jaya.bubbly09@gmail.com 	8978908384	A+Ve	Ananthaiah	yenkepa														2015-11-20 05:14:58.573054	2015-11-20 05:14:58.573054
137	190	\N	2014	\N	2009	2007	\N	1991-12-28	102, Royal PG, opp. Janani HOtel, Mg Palya Road,Bommanahalli, Bangalore-68	Jagdhish Patidar,44-Savarakar Path, Ward No-10, Town- Anjad, DIST- Barwani. M.P. 		brajeshpatidar29@gmail.com	09826088249	b+	Jagdish	Sarla					NIT TRICHY (PRODUCTION ENGG.)		C.B.S.E. 	C.B.S.E. 	Lalit Patidar	Brother				2014-07-14 06:04:24.289367	2014-07-14 06:04:24.289367
99	118	\N	\N	\N	\N	\N	2001-05-12	1970-10-16	House No- 7, Khata No  20 /2,\r\nYellukunte Road, Old Mangamannapalaya Raod. Behind Bosch Building, \r\nBangalore - 560068	Naugharwa, Sultanganj.\r\nP.O - Mahendru\r\nPatna - 800006\r\nBIHAR		arif@webnish.com	09900528826	B Positive	Arif Imam	Anwari Khatoon									Nazia Rizwan	Wife				2013-11-04 10:47:36.926114	2013-11-04 10:48:08.090337
101	149	\N	\N	\N	\N	\N	\N	\N	#145, ashwin.s\r\nb/w 8th and 9th cross,\r\nsampige road,\r\nmalleshvaram\r\n	#147, arakere(post)\r\nbhadravathi(t)\r\nShimoga(d)\r\n577-233		sudeep@webnish.com	7760056181	b+	Devendrappa	Nirmala														2013-11-05 06:00:20.717876	2013-11-05 06:00:20.717876
102	151	\N	2013	\N	2009	2007	\N	1991-07-30	No 98,sankalpa,13th cross,20th B main, venkateshware layout,BTM 1st stage,Banglore-64	Ashoknagar camp,\r\nNalkudure(post),\r\nchannagiri(tq),\r\ndavangere(dt),\r\npincode:577544		swapnanekkanti1@gmail.com	9008735215	A+ve	Ramarao N	Nagalakshmi					B.E		PUC	10	Ramarao N	Father				2013-11-06 12:36:20.601915	2013-11-06 12:36:20.601915
105	157	2011	2009	\N	2006	2004	\N	1967-11-10	#6 vijayanagar subbana garden 6th cross 2nd main \r\nBangalore	#50 MKK road 1st cross shimoga-577201		maheshwaren24@gmail.com	8050280502	o+ve	Gajendra	Vetri	ORIENT fans Pvt ltd.,	sales executive	2 years	MBA	BBM		Commerce	SBC	santhosh	brother				2013-11-27 06:32:36.403171	2013-11-27 06:32:36.403171
106	159	\N	\N	\N	\N	\N	\N	1988-09-18	T4,PN Reddy Building,\r\nSomeshwara Temple Road,Btm 1 Stage,\r\nOld Madiwala,\r\nBangalore-560068	1,Devam palayam,\r\nkolathupalayam(p.o),\r\nUnjalur(via),\r\nErode,\r\nTamilnadu-638152,		rajkumarsr6@gmail.com	9916761624	O +ve	Periyasamy	Vasanthi														2013-12-06 07:17:39.04803	2013-12-06 07:17:39.04803
108	156	\N	\N	\N	\N	\N	\N	1946-07-17	PETTUPARAYIL\r\nVANNAPPURAM P.O\r\nTHODUPUZHA\r\nIDUKKI\r\nKERALA	PETTUPARAYIL\r\nVANNAPPURAM P.O\r\nTHODUPUZHA\r\nIDUKKI\r\nKERALA		albertpsreedhar@yahoo.co.in	09448763700	A+ve	SREEDHARAN P S	SWARNAKUMARI														2013-12-23 05:23:16.01891	2013-12-23 05:23:16.01891
92	138	2012	2010	\N	2006	2004	\N	1989-05-04	SN's PG\r\nMarathalli,\r\nMonekulal,\r\nOuter Ring Road\r\n560037	At/po- Jayapur\r\np.s/via-Balianta\r\nDist-Khurda\r\nBhubaneswar-752101\r\nOdisha		anitaratha89@gmail.com	09019428813	o+	Niranjana Ratha	Anjubala Ratha				MBA(HR & Finance)	B.Sc(Chemistry)		Science(PCB)	HSCE	Bimal padhy					2013-09-19 09:58:19.328387	2014-04-30 12:27:27.835173
114	165	\N	\N	\N	\N	\N	\N	1989-06-03	#100 First floor 12th cross 16th main BTM stage -1 Bangalore-560029	Om namah sivaya Prov. store , Beside ajay stone ,Purani Basti Kohka Bhalai-Durg\r\nChhattisgarh-490023		rohitk1501@gmail.com	9300880073	O Positive	Satish Prasad	Nirmala devi									Satish Prasad	Father				2014-02-04 12:26:49.433714	2014-12-30 05:36:36.130289
110	155	\N	\N	\N	\N	\N	\N	1987-07-20	Basaveshwar  nagar	Mudgal\r\nDist-raichur,karnataka		manjunath@webnish.com	9742390308	b+ve	Krishnamurthy	Anasuya	Shreenivas software and consultants	Software Test Engineer	3	No					Shantesh	Friend				2014-01-09 05:43:26.096294	2014-01-16 09:50:24.740552
109	162	\N	2012	\N	2008	2005	\N	1958-05-15	#455 ITI Layout, Hosapalya,Near HSR Layout,\r\nLandmark-Near Shunsine English School, Bangalore-560068	Village-Bhagwatpur Bhaluahiya, Post-Ruphara, \r\nDistrict-East Champaran(Motihari)\r\nState-Bihar-845418		rakesh.cse12@gmail.com	9742480832	o+	Sri. Punyadev Prasad	Smt. Sumitra Devi					61.36%		58.37%	61.85%	Manvendra Tripathi	Friendship				2013-12-27 07:28:09.941349	2014-02-03 09:44:30.768489
111	161	2011	\N	\N	\N	\N	\N	\N	Hno-26/2,Doddakannali,Sarjapur Main Road,Bangalore	Hno-1-57,Ramalingapuram(P),Veligandla(M),Prakasam(D),Ap		gopinadhareddybobba@yahoo.com	8904746280	o+	Somaiah	Ramanamma				BSc					Brother	Brother				2014-01-16 10:12:47.112488	2014-01-16 10:12:47.112488
112	154	2010	2008	\N	\N	\N	\N	1951-11-14	9, 10 A Main, 3 rd Cross,  3rd Main, Ramanjaneyanagar, Uttarahalli 	Bhawanipur, PO- Basirhat College, PS - Basirhat, PIN - 743412		vikram.ry123@gmail.com	03217228354	O+	Ram Prasad Roy	Jayasree Roy				Advertising and Marketing	English Hons.				Father					2014-01-16 10:12:58.642033	2014-01-16 10:12:58.642033
113	163	2012	2009	\N	2006	2004	\N	1987-04-12	No 43/01 Flat A3\r\n8th Cross Mangammanapalya\r\nBommanahalli\r\n560068	"Sithalayam"\r\nAzhikode Po\r\nKannur \r\nKerala\r\n670009		presithprakash@gmail.com	9663393036	O-ve	Prakash	Shobhana				MCA	BCA		Science	CBSE	Pramith Prakash	Brother				2014-01-27 09:52:04.868979	2014-01-27 09:52:04.868979
115	164	\N	\N	\N	\N	\N	\N	1991-04-26	#20 MS Building,\r\nViveknagar,\r\nBangalore -47	#20 MS Building,\r\nViveknagar,\r\nBangalore -47		abhishek.webnish@gmail.com	8105607595	0+	Jayakumar	Dhanalakshmi														2014-02-19 05:30:55.427975	2014-02-19 05:30:55.427975
95	143	\N	2013	\N	2002	2000	\N	1985-07-26	No-10, @nd Floor, 7Th Cross, Ward No-13, Virat Nagar, Bommanahalli, Bangalore-560068	S/O Dinesh Prasad singh, North of P.G Girls Hostel, Near PNB (Khabra Rd Branch), Damuchowk, Muzaffarpur, Bihar-842001		niteshsingh_26@yahoo.com	9176089917	B+	Dinesh Prasad singh	Bela Singh					VTU		CBSE	CBSE	surabhi Swarna	sister				2013-10-28 12:16:56.735234	2014-07-30 08:21:11.918781
104	146	\N	2013	\N	2009	2007	2014-03-03	1991-08-31	ravali mulukalla\r\nNo 98 sankalpa,venkateshwara layout,20th main,BTM 1st stage,Bangalore-68	vill:annaram\r\nmal:mahadevpoor\r\ndist:karimnagar\r\npin:505503\r\nH-NO:5-5		ravali.mulukalla@gmail.com	8050740174	o-ve	rajaiah	padma					76.2%		86.7%	80%	raghava	Husband				2013-11-07 10:12:10.414861	2014-04-25 05:40:20.050126
103	147	\N	2013	\N	2009	2007	\N	1992-06-17	sumanjali.N\r\nD/o venkateshwara Rao.N,\r\nSri srinivas ladies pg,#48,20th ‘A’Main,13th cross,sri venkateshwara layout,BTM 1st stage.	sumanjali.N\r\nD/o venkateshwara Rao.N\r\nBaspattna,Gangavathi,Koppal-583235		sumanjali@kreatio.com	9880570688	A+	venkateshwara Rao.N	padmavathi.N					64		66.66	68.88	venkateshwara Rao.N	Father				2013-11-06 12:41:26.345493	2014-12-01 05:02:18.613706
116	169	\N	2013	\N	2009	2007	\N	1992-05-29	road no:9,room no:8,leela buildings,c/o sukhram chowhan,near krishna bakery,Hongasandra rd,Garvebhavi palya.bangalore.	karini palli(v),P.Kothakota(p),Puthalapttu(M),Chittoor(D),A.P.		hreddy569@gmail.com	9739769114	b+ve	A.Rajendra reddy	A.Sujstha					B.Tech		intermediate	S.S.C	yupal.b	cousine brother				2014-02-28 10:26:23.634915	2015-06-02 06:45:02.868113
100	140	2011	2009	\N	2006	2004	\N	1989-05-16	Thavarekere,BTM,Bangalore	A.S.Pete(Mandal),Nellore (Dt),AP		bharatimba2011@gmail.com	7795042620	B+	Venkateswarlu Reddy	Rathanamma				MBA	Bsc(Computers)		MPC		Srinu	Spouse				2013-11-05 05:09:13.312002	2015-04-27 09:20:14.623591
97	142	\N	2012	\N	2007	2005	\N	1990-09-17	No- 48/18, 8th 'B' Cross, 3rd Floor, Venkatapura, Koramangala,Bangalore-560034	S/o- Vijay Kumar Pandey, Vill-Sonbarsa, P.O- Vishnudathpur, P.S- Kanti, Dis.- Muzaffarpur, State- Bihar, Pin-843113		abhi.kumar90@hotmail.com	9632929186	B+	Vijay Kumar Pandey	Indu Devi					Punjab Technical University		BSEB	BSEB	Vishnu Prabhakar	Brother				2013-11-04 07:00:43.212676	2015-02-06 05:14:06.599603
98	145	\N	2012	\N	2006	2004	\N	1990-06-26	# No-18  1st Cross,3rd Main Ashwath Nagar Marathahalli Bangalore 560037	City Railway Colony T/29/B Bareilly City Bareilly [243001]		vgvinay2@gmail.com	8867165476	0+	Vinod Kumar Gupta	Nirmala Gupta					IIET ,B.Tech[CSE]		JNSVM Inter College,Science Group	S V Inter College,Science Group	Vinay Gupta					2013-11-04 07:21:24.209993	2015-07-01 09:20:17.716741
107	158	2013	2010	\N	2007	2005	\N	1990-07-02	D3,1st floor,7th cross,\r\nMaruti nagar,\r\nMadiwala,\r\nBangalore-560068	2/7-1,pallipatty,Musiri(po),Puduchathiram(via),Tiruchengode(tk),\r\nNamakkal(Dt)\r\nTamil nadu-637018		yuvarajarm@gmail.com	9739595051	O+ve	RAMASAMY	MALLIGA				80	63		59	73	kanagaraj	friend 				2013-12-06 10:44:03.381904	2015-07-02 04:43:27.727469
121	172	2010	2008	\N	2005	2003	1982-04-26	1953-08-15	#301,BR Enclave,AECS layout,B Block,12th Main,Chikabegur,Singasandra,Near Manipal County Road,Bangalore-560068	#301,BR Enclave,AECS layout,B Block,12th Main,Chikabegur,Singasandra,Near Manipal County Road,Bangalore-560068		vineet987@gmail.com	8884773002	B-ve	Venugopalan panicker	Meera Venugopal	Future Group	Category Lead	2.5	MBA(Marketing and Operations)	BSc(Computer Science,Electronics,Maths)		Science(Physics,Chemistry,Maths,Computer Science)	SSLC	Venugopalan Panicker	Father	Feedback Business Consultancy	Research Executive	7 months	2014-03-13 10:39:27.143661	2014-03-13 10:39:27.143661
122	176	\N	2013	\N	2009	2007	\N	1992-06-18	#171,om sai ram pg,16th main,11thcoss,btm layout,1st stage,bangalore,560029	23/1203,sodhan nagar,behind rtc,nellore,524003		mounisha1992@outlook.com	9347338769	B+ve	k.v.subbareddy	k.prasanna					64		83.3	86.8	k.v.subbareddy	father				2014-03-26 10:44:25.143016	2014-03-26 10:44:25.143016
123	175	\N	2012	\N	\N	\N	\N	1991-09-19	B201,GREEN TERRACE APARTMENTS,WHITE FIELDS,KOTHAGUDA,KONDAPUR,HYDERABAD	B201,GREEN TERRACE APARTMENTS,WHITE FIELDS,KOTHAGUDA,KONDAPUR,HYDERABAD		kpkanth19@gmail.com	9313330847	B+	K GOPAL	K BHUVANESWARI					ANNA UNIVERSITY				K GOPAL	FATHER				2014-03-28 09:48:03.879904	2014-04-04 10:27:24.279222
117	170	\N	2012	\N	2008	2006	\N	1991-02-06	House no: 57/4, site no.96, opp ganapathi traders, 9th B cross, Virat nagar ward no.175, Bomanahalli, Bangalore560068	plot no:47/s, phase-2, vijayapuri colony, vanasthalipuram, hyderabad 500070		sujitpranav@kreatio.com	09848582727	O +ve	Damodar Reddy	Durga Bhavani	Antezen Technologies Pvt Ltd	Web Development Engineer	11 months		58.79%		79.7%	85%	Durga Bhavani	Mother				2014-03-05 04:39:09.242913	2014-04-14 04:40:54.783162
129	183	\N	\N	\N	\N	\N	\N	\N	no	Andhra Pradesh	no	subbaraokatakam1@gmail.com	08341212942	B+	venkateswarlu	siva ratna kumari	0	0	0						venkateswarlu	Father	0	0	0	2014-05-16 06:11:01.756932	2014-05-16 06:11:01.756932
127	181	2014	2009	\N	2004	2002	1984-11-12	1953-03-13	Flat no 417, Mahaveer Seasons, 24th Main, 2nd Sector, HSR Layout, Somasundrapalya,\r\nBangalore-102.Karnataka	47 b 2 Paramarthalingapuram,Vetturnimadam,Nagercoil-629003. TamilNadu		sbvijilamary@gmail.com	09886289198	B+ve	Johnson R	Baby Vijila Mary	Nice Food Products	Marketing Manager	8 months	PGDM 	BE EEE		TamilNadu State 12 th (Maths Computer Science)	Matriculation (Maths, Science)	Clement P	Cousin	Wipro Technologies	Project Engineer	22 months	2014-04-24 06:31:29.390777	2014-05-27 12:40:03.999598
131	184	\N	\N	\N	\N	\N	\N	1981-08-08	-	-		abhishekkumar2323@gmail.com	09934989103	O+	Amar Nath Das	Sunita Das	Maruti Service Masters	IT-Excutive	4.5 years						Amar Nath Das	Father				2014-07-02 07:52:17.40323	2014-07-02 07:52:17.40323
135	194	\N	2004	\N	1999	1997	2004-12-26	1982-04-15	4D, East Wing(E1), Fernhill Gardens Apartment, Sector 6, HSR Layout, Bangalore - 560102	Haleema Manzil, Kulasekharamangalam PO, Vaikom, Kottayam District - 686608		suhana.a@gmail.com	9535133229	O+	Abdu T A	Haleema P P	Srishti Software	Associate Technical Manager	7.8		73.5		87.6	91.67						2014-07-10 09:09:26.024072	2014-08-14 09:19:43.132848
133	188	\N	2014	\N	2009	2007	\N	\N	M.G. PALYA ROAD,BOMMANAHALLI	B-160,ASHOK NAGAR,GHAZIABAD,U.P.		infyvipul@yahoo.co.in	9910923146	B+	DEEPAK KUMAR GUPTA	SHUBHLESH GUPTA					77.2		75.4	84	DEEPAK KUMAR GUPTA	FATHER				2014-07-02 10:45:50.706357	2015-03-19 08:10:45.169805
132	187	\N	2014	\N	2008	2006	\N	1991-06-10	Room No.-102,No.3,Vazhappilly Building,opp.Janani Hotel M.G. PALYA Road,Bommanahalli,Bangalore-68	192,Ward No.-14,Arjun Bigha,p.o+p.s-Darihat,Rohtas,Bihar,821306		kkishor313@gmail.com	07250450971	o+	KAMESHWAR SINGH	KIRAN DEVI					B.tech,Production Engg.		Bihar School Examination Board	Bihar School Examination Board	KAMESHWAR SINGH	Father				2014-07-02 10:41:46.953404	2014-08-12 05:27:57.428654
128	182	2008	2006	\N	2003	2001	2011-12-26	1985-11-21	#49,KM Sonnappa layout, Kereguddadahalli, Chikkabanvara (PO), Bangalore	Sruthi(H), Rayamangalam, Thirumittakode(PO), Palakkad (DIST) Kerala - 679533		krish58854@gmail.com	9745458289	B+	P Vijayaraghavan	N P Girija	Orion Mall Management Company ltd	Manager	1	MBA	BCom		CBSE	CBSE	Soumya KP	Spouse	Inorbit Malls (I)Pvt Ltd	Assistant manager	2	2014-05-05 10:34:48.906441	2014-07-29 11:08:12.981094
120	168	\N	\N	\N	\N	\N	\N	1991-10-20	#14,sri sai ratna apartment,divya PG for ladies,8th cross,maruthi nagar,madiwala,\r\nbangalore-29	14-9,karinipalli(v),\r\np.kothakota(p),\r\nputhalapattu(m),\r\nchittoor(D),\r\npin no:517112.		bswathi@webnish.com	9739769114	o+ve	B.Reddeppa reddy	B.Amaravathi														2014-03-13 10:20:23.587687	2014-07-30 08:45:10.374782
118	171	\N	2012	2009	\N	2006	\N	1991-03-19	#17,Neyge Colony,A.k Colony road,Kudlu,madiwala post,\r\nBangalore-560068	#17,Neyge Colony,A.k Colony road,Kudlu,madiwala post,\r\nBangalore-560068		raghavendra.vv19@gmail.com	9916244926	B+ve	Venkataraj	Amudha V					B.E (ECE)	ECE		S.S.L.C	Venkatadas	Brother				2014-03-06 06:24:30.605905	2014-07-30 09:08:02.878131
126	179	2012	2010	\N	2005	2003	2014-02-26	1988-04-03	SHILMA NIVAS,265/5,Apsa Hostel Road, Annasandrapalya Post, HAL Vimanpura-560017, Bangalore , Karnataka	MIG-72, PHASE-3, Ananatavihar, Pokhariput,Bhubaneswar-751020,ODISHA		subratkumarsahoo86@gmail.com	09437353681	B+ve	Digambar Sahoo	Kamalini Sahoo	88DB.Com	Sales Executive	1 Year 2 Month	MBA	BBA		+2 Science	BSE	Digamabar Sahoo	Father				2014-04-11 04:26:47.000289	2014-07-30 10:07:17.471311
125	178	\N	\N	\N	\N	\N	\N	1985-10-05	c/o Ramesh V, #284, 1st main, 1st cross, Munnekolala, Marathahalli, Bangalore-560037	S/O Somaiah H R, Aigoor village and post\r\nSomwarpet, Kodagu. 571251		venu.kishu@gmail.com	9945195134	o+	Somaiah H R	Kamala HR	Maxemos	HR Recruiter							Santhosh	Brother-In-Law				2014-04-10 11:51:22.023546	2014-07-31 04:30:54.04218
136	191	\N	2014	\N	2010	2008	\N	1992-09-29	102, Royal PG, Opp. Janani Hotel, MG Palya Road, Bommanahalli, Bangalore-68.	43 'E' Ward, Vikram Nagar, Kolhapur-416005, Maharashtra.		gondhali.akshay@gmail.com	09975131124	O +ve	Ramakant	Shobha					NIT Trichy (Production Engineering)		Maharashtra State  Board	ICSE	Ramakant Gondhali	Father				2014-07-14 06:02:20.03281	2015-09-29 06:38:42.927436
130	185	\N	\N	1994	\N	\N	1996-05-09	2014-09-01	# DR No 3, 1st cross, Near GVS School, OPP BOSH Back Gate E-City Blr	Near TMC Mudhol Dist Bagalkot 		prtpv2010@gmail.com	09538548077	B+ve	Vittal Rao	Alaknanda	TTN Networks PVT LTD	Manager-Technical	04			Electronics			Bhanumathi V	Wife 				2014-07-01 13:08:20.298474	2015-01-14 06:53:06.223114
140	48	\N	2005	\N	\N	\N	\N	1983-04-28	93, 5th cross,\r\n27th main, BTM 2nd stage,\r\nBanglore  	54 A/2, V.O.C street,\r\nChidambaram		senthilkumar.rec83@gmail.com	9894388319	B +ive	Jayabal	Gurumani					B Tech				Gopi	Brother				2014-07-15 12:57:13.033404	2015-04-22 07:22:15.594726
96	144	\N	2013	\N	2009	2007	\N	1992-05-11	Rathna building, No-8, 3rd flore, 1st Main, 2nd Cross, Krishna nagar, Devasandra, K R Puram, Bangalore-560036	8-67, Yerramareddygaripalle, Maddinayanipalle, Mulakalacheruvu(M), Chittoor(D),Andhra pradesh(S)-517351		anji7686@gmail.com	8884073326	O+ve	Gopal Reddy	Venkataramanamma					B.Tech 		M.P.C	SSC	Madhukar Reddy	Brother				2013-11-04 06:46:51.007269	2015-06-24 09:06:47.833125
124	177	\N	2010	2007	2005	2002	\N	1986-08-03	#402/5, namdev nilayam \r\n15th A main, Venkateshwara Layout\r\nBTM 1st stage, madiwala\r\nBangalore -560068 	Parraikollai\r\nJangalapuram post\r\nNattranpalli\r\nVellore \r\nTamil nadu -635852		kumaran.543@gmail.com	 9789280887	.	Kesavan p	Amasa K					BE ECE   	DECE	computer science		Kesavan p	Father				2014-04-04 11:08:58.16484	2015-08-27 09:34:00.584992
147	202	\N	\N	\N	\N	\N	\N	1990-02-22	Near Someshwara Temple,\r\nOld Madiwala,\r\nBangalore.	Moonumankollai,\r\nUranipuram(Post),\r\nOrathanadu(Taluk),\r\nThanjavur(Dist),\r\nTamilnadu(State),India,\r\nPincode 614631.		annamathi77@gmail.com	+919740250294	O+ve	Annadurai. M	Manimekalai. A									Palaniyappan. V	Uncle				2014-08-25 09:23:10.018023	2014-08-25 09:23:10.018023
138	189	\N	2014	\N	2010	2008	\N	1992-12-28	ROOM NUMBER 102,\r\nROYAL PG,\r\nNO. 3, VAZHAPPILLY BUILDING,M.G. PALYA ROAD,\r\nBOMMANAHALLI,\r\nBANGALORE-560068	C-142/3, RDSO COLONY, MANAK NAGAR,\r\nLUCKNOW,\r\nUTTAR PRADESH		kshitiz@kreatio.com	8904670150	B+	A.K. RASTOGI	MADHU RASTOGI					B.TECH PRODUCTION ENGINEERING CGPA 7.28		81.20%	91.20%	VIPUL GUPTA	FRIEND				2014-07-14 06:08:13.204284	2014-09-01 03:45:23.722892
143	198	2011	2008	\N	2004	2002	\N	1986-05-31	No:73 Near Venkateswara Temple,Old Madiwala,\r\nBanglore	No:77 South street,\r\nMelathirupoonthruthi(po)\r\nThruvaiyaru(tk),\r\nThanjavur(dt),\r\nTanilNadu.\r\nPin code:613104		vinothsinamani@gmail.com	9916539324	O+ve	Shanmugam k	MangaiyarKarasi s	SPL	Chennai		MCA	Bsc(cs)		HSC	SSLC	Rengaswamy Nathan R	Brother				2014-08-05 08:05:50.919675	2014-09-01 12:21:25.942028
139	195	\N	2014	\N	2008	2006	\N	\N	ROYAL PG for gents; No.3, Vazhappilly Building; opp. janani hotel; M.G. Palya Road, Bommanahalli, Banglore-68	Vill- Gour; PO- Andhara Tharhi; PS- Rudrapura; Dist- Madhubani; PIN- 847401\r\n		bhpaswan.002@gmail.com	7782905193	O+	RAMGULAM PASWAN	BILTI DEVI					B.Tech		I.Sc	Matric	ramgulam paswan	father				2014-07-14 06:38:50.110726	2014-07-24 06:25:09.701286
149	204	\N	\N	\N	\N	\N	\N	1985-10-05	1st cross, 1st main, Munnakolla, Near bustop, Marathahalli, Bangalore	Aigoor village and post,\r\nSomwarpet, Kodagu, -571251		venukishu@gmail.com	9945195134	O+	Somaiah H R	Kamala H S									Santhosh	Brother-in-law				2014-09-04 08:52:08.444886	2014-09-04 08:52:08.444886
142	197	2014	\N	2010	\N	2007	\N	1991-04-27	# 4, B.T.M 2nd Stage, 1st Main, 1st Cross,Mico Layout(NS PALYA),Bennerghatta Road, Bangalore-76 (SRI DURGA P.G)	At/po-Babanpur Main Road,Near to Nuagam Sugar Factory Square,\r\nDoor no-E-1192\r\nVia-Aska\r\nDist-Ganjam\r\nState-Odisha\r\nPin-761111		bunty111sujit@gmail.com	09861067632	B+	Siba ram padhi	Sudashna kumari padhi				7.13 CGPA		69%		59%	Siba Ram Padhi	Father				2014-08-05 06:06:28.694091	2014-09-05 07:08:55.095161
153	209	\N	2011	\N	2007	2005	\N	1989-12-06	Madhuri Pg for ladies,\r\n1st cross, 1st main, Maruthi nagar, Madiwala\r\nBangalore	49/7,Thangasengodan Street,\r\nAmmapet,\r\nSalem,\r\nTamilnadu - 636003		deepa.thiru09@gmail.com	9952308592	A +ve	Thirugnanasambandam.A	Jayalakshmi.K	Webcomet Technologies pvt ltd	SEO Executive	1 year 1 months		B.E(Maha College of Engineering)		Sri Vidhya Mandir Higher Secondary School	Sri Vidhya Mandir Higher Secondary School	Thirugnanasambandam.A	Father				2014-11-12 09:33:13.319315	2014-11-13 05:01:18.826191
144	200	\N	\N	\N	\N	\N	\N	1981-08-08	--	House No. 44, Road No. 2, TulsiNagar, Tilkamanjhi, Bhagalpur(Bihar)		abhishekkumar2323@yahoo.com	9934989103	O+	Amar Nath Das	Sunita Das	Maruti Service Masters	IT-Executive	4.5						Amar Nath Das	Father				2014-08-08 05:05:32.470897	2014-08-08 05:05:32.470897
145	199	\N	2014	\N	2010	2008	\N	1992-11-02	#186,C-Zone,3rd Stage, J.P.Nagar, Mysore-570008	#186,C-Zone,3rd Stage, J.P.Nagar, Mysore-570008		sharathramesh92@gmail.com	8867656788	O +ve	Ramesh Babu N	Vani R					B.E.		State Board	CBSE	Ramesh Babu N	Father				2014-08-08 05:48:23.340381	2014-08-08 05:48:23.340381
152	208	\N	\N	2012	2008	2006	\N	1990-12-28	Dasappa colony,\r\nShivaji nagar,\r\nbangalore,\r\nKaranatka-560061	Eaguvagali gutta palli,\r\neddulavari palli,(Post)\r\nthamballa palli,(Mandal)\r\nChittoor(D),\r\nAndhra pradesh (State)\r\npin- 517418		reddy_masthan88@live.com	 9652032149	A-ve	M. Ramalinga reddy	M. Sallamma	Refine Interactive pvt ltd	UI Designer	8 months			EEE	ITI	SSC	Mahesh kumar reddy	Brother 				2014-10-08 05:53:03.70072	2014-10-08 06:10:36.033501
218	273	\N	\N	\N	\N	\N	\N	1989-09-19	No.7/3,Ranianna nagar,K.K nagar,Chennai600078	No.7/3,Ranianna nagar,K.K nagar,Chennai600078		 aruneco707@yahoo.com	9941765796	A+Ve	Jeyapal	divay									Mother					2015-11-20 05:29:14.512381	2015-11-20 05:29:14.512381
134	192	\N	2014	\N	2009	2007	\N	1987-08-23	#22/17/21, 3 CROSS, MANGAMMANAPALAYA YELLAKUTUA MADINA NAGAR BAGUR HUBLI BOMMANAHALLY BANGALORE-560068	PANKAJ KUMAR , Post SIMRI Via-VIDYAPATI NAGAR SAMASTIPUR BIHAR-848503 		pankaj23kumar@yahoo.co.in	09840982956	O+	PRADYUMN MAHTO	USHA DEVI					NIT TRICHY		CBSE (KENDRIYA VIDYALAYA)	CBSE (KENDRIYA VIDYALAYA)	PRADYUMN MAHTO	FATHER				2014-07-09 12:41:30.293502	2014-09-29 05:24:30.149086
150	206	\N	2012	\N	2008	2006	\N	1991-05-25	#4, Om sri sai Balaji PG Accomodation, 10th Main Road, Hosur Main Road, Bangalore- 560068	#28, Kolathur(V), Yeldur(P), Srinivaspur(T), Kolar(D) - 563138		jaganmech832@gmail.com	9986597185	o+	Ananthappa	Rathnamma	Algypug Enclosures	Sales and Marketing Engineer	8 Months		BE in Mechanical Engineering		PUC	SSLC	Ramamurthy	Brother	Sreenathji Enterprises	Business Development Engineer	6 Months	2014-10-01 11:36:23.967326	2014-10-01 11:36:23.967326
151	207	2014	2010	\N	2006	2004	\N	\N	#54,3rd cross,Kanaka nagar,RT Nagar,Bangalore	1-7-1080/1,Advocates Colony,Hanamkonda,Warangal,Telangana		pravin1404@gmail.com	9849402060	O+	Ram Narayana	Padma	Multi Task Minds 	BDE	1	MBA	B.Tech		MPC	SSC	Ram Narayana	Father	Explocity Pvt Ltd	Senior Sales Executive	6 months	2014-10-08 04:56:07.776142	2014-10-08 06:16:11.141135
154	211	\N	2012	\N	2007	2005	\N	1990-02-23	F.No.6,Manjunatha reddy building,3rd cross,konapana agrahara,\r\nElectronic city-2,Bangalore-560100	S/O Renu Verma\r\nNew Colony , Kalibagh\r\nBettiah, Bihar\r\nPIN-845438		piyushraj@kreatio.com	09972621655	A+	Late.Nand Kishore Prasad Srivastava	Renu Verma					Dr. M.G.R University		St.Joseph Sr. Secondry School	Saraswati shishu vidya mandir	Vikash Ranjan	Brother				2014-11-17 11:16:26.641576	2014-11-17 11:16:26.641576
141	196	2012	2010	\N	2007	2005	\N	1990-05-28	VINOTHKUMAR,MADIWALA,BANGALORE.	Tamilnadu,Pudukkottai Dt,Karambakkudi Tk,Pallavarayanpathai Po,Puduppatti.		Balavino25@gmail.com	8197226880	O+	BALASUBRAMANIAN	SAROJA				MCA	BCA		12	10	MANIVANNAN					2014-07-30 08:29:41.567561	2015-05-29 06:29:16.693717
155	210	\N	2012	\N	2008	2005	\N	1991-07-17	Nandeeshwara P.G.-2\r\nroom no-g4 \r\n#10/5,Beside Chinai Nursing college ,Behind Nandi ToyoTa Road,\r\nBhanu Nursing Home Road, \r\nBommanahalli,Bangalore-560068	vill-permanandpur \r\npost-simaria\r\ndist-bhagalpur\r\nstate-bihar\r\npin-812005		ravi444rakesh@gmail.com	9934814981	B+	shailendra mishra	chandrika devi					ranchi university		BSEB	BSEB	shailendra mishra	father				2014-11-17 12:26:50.397865	2015-03-11 04:32:10.246471
156	213	\N	2012	\N	2009	2007	\N	1991-08-07	30/31A shanti pradies,flat No 4,Narayanappa garden,Taverekera Main roda,29	13-109,baknipet street,madanapalli,chittoor dist,andhra pradesh.		hamidtaj320@gmail.com	9000091035	AB+	shaik shafiulla Basha	shaik Rahamtunissa	savinira Infotech Pvt Ltd	BDA	1.6 year		S.V University(b.com)		Board of Intermediate Eduaction	school Board Of Secondary	s.khamar taj	brother				2014-12-01 07:31:05.461387	2014-12-01 07:31:05.461387
146	201	\N	2011	2006	\N	2001	\N	1989-07-10	# 54/4,Geddalahalli,rmv 2nd stage,Sanjay nagar\r\nBangalore-560094	c/o B Y TALAWAR\r\nHno:LIG-183\r\nADARSHA NAGAR,Ashram  road\r\nDIST:BIJAPUR\r\nSTATE:KARNATAKA-586101	as same as above 	mahadevi.kolakar2@gmail.com	9742211137	B +VE	YAMANAPPA KOLAKAR	BASALINGAWWA KOLAKAR	AMA SOFTECH pvt Ltd	Associate Test Engineer	1.4 years		BE ECE	Diploma ECE		SSLC	LAXMIBAI TALAWAR	SISTER				2014-08-11 13:09:01.059683	2015-07-09 12:53:10.811185
221	280	2011	2009	\N	2006	2004	\N	\N	karthikeyanp\r\nudayarpalayam\r\nnatharaja theater opp\r\nthammampatti	105 manzoor thaikkal\r\ngandhiji road\r\nthanjavur-613001		karthipkpp@gmail.com	9843245632	o+ive	perumal	dhanalakshmip	axis bank	business development executive	1	mba	bca		12	10	perumal 	father	vodafone cellular ltd	sales officer	1	2015-12-10 11:20:52.303112	2015-12-10 11:20:52.303112
157	212	2010	2008	2006	2003	2001	2013-08-26	1985-07-11	CLUSTER NO. 18, DOOR NO. 18, TITAN TOWNSHIP, MATHIGIRI,\r\nHOSUR	3/58 G SOUTH STREET, KURUVIKKARAMBAI POST,\r\nPERAVURANI TALUK\r\nTHANJAVUR DISTRICT		GSALINAN@YAHOO.CO.IN	8098914042	O+	GAJENDRAN	INDRA	VIMLEE SOFTWARE	MARKETING EXECUTIVE	1	MBA	MA	HOTEL MANAGEMENT	STATE BOARD	STATE BOARD	ABINAYA	SPOUSE	TATA AIG GENERAL INSURANCE CO. LTD	SALES EXECUTIVE	1	2014-12-01 07:35:46.473161	2014-12-01 07:35:46.473161
159	214	\N	1978	\N	\N	\N	\N	1955-11-11	A-101, Skyline Solstice\r\n35, Bhuvanagiri Main Road\r\nBanaswadi\r\nBangalore - 560043	#301, Insight Gokula\r\n1st Main, Dynasty Layout\r\nMariyannapalya\r\nBangalore - 560024		svasuraj@gmail.com	9880152924	'A' Positive	M.K. Vasuraj	Prema Vasuraj	Simbus Technologies	VP- Sales	1		B.A. Economics				Sangita Vasuraj	Wife	Appnomic Systems	VP - Sales - India & Asia Pacific	2.8	2014-12-31 07:26:21.53856	2014-12-31 07:26:21.53856
37	60	\N	2011	\N	2007	2005	\N	1989-11-29	#8,\r\n9th Main,\r\nGarvebavipalya,\r\nleelabuildings,\r\nnear krishna bakery,\r\nc/o Sukaram Chauhan,\r\nBangalore-42.	Karinapalli(village),\r\nP.Kothakota(post),\r\nPuthalapattu(mandal),\r\nChittoor(district),\r\nAndhrapradesh(state).\r\nPin no:517112.		yupalreddy.b@gmail.com	09032177317	B+ve	B Munirathnam reddy	B Vani					B.Tech		Intermediate	Secondary School Of Education	B.Muniratnam Reddy	uncle				2012-10-16 09:46:04.531708	2015-01-13 06:52:32.108428
162	219	\N	2013	\N	2009	2007	\N	1991-06-25	no57/58,BTM 1ST STAGE,\r\n32nd Main,V.P.Road,\r\nOld Madiwala,\r\nBangalore-68	3/35,nadumangudi,\r\nmutharasan(post),\r\nsivagangai(dist,tk),\r\n		samykkannu@gmail.com	9742763167	b+ve	azhagu	panchavarnam					b.e		12	10	k.kumar	brother				2015-01-19 11:53:52.340758	2015-01-19 11:53:52.340758
148	203	\N	2009	\N	2008	2007	\N	1991-03-31	Sai PG,\r\nBehind Vishal mega mart,\r\nNear barath bakery.\r\nHsr 6th sector,\r\n560068.\r\n\r\n	S/O P.N.GOpal\r\nVenkatammnahalli post,\r\nPavagada Taluk,\r\nTumkur Dist,\r\nKarnataka-572136		nadimintiravindra@gmail.com	7353943311	B+ve	P.N.Gopal	P.N.Sasikala					B.tech in BIT college,A.P		vivekananda college,K.A	A.M.L.M high school,A.P	P.N.Gopal	Father				2014-08-25 09:42:26.259667	2015-06-10 04:20:37.376179
166	222	\N	2012	\N	2007	2005	\N	1990-10-14	# 249 9th Cross H A L Township Marathhalli\r\nBangalore-560037	#89 3rd Cross Srigandha Nagar Hegganahalli\r\nBangalore-560091		manjuck1990@gmail.com	8971610845	B+	Chandrashekar	Kanchana	IQPC Ind Ltd	Lead Reneration Officer	2 Yrs		BBM		BNES Pu College	Deepashree High School	Chandrashekar	Father	Global Energy Panel Pvt Ltd	Senior Lead Generation Officer	2yrs	2015-02-03 08:43:48.108972	2015-02-03 08:44:37.738955
167	223	2012	2009	\N	2005	2003	\N	1989-04-17	#32, sapthagiri nilaya,\r\njp nagar 1st phase,\r\nBangalore	2-455, nehru nagar, kadapa Dist,\r\nAP, 516002		venkatmanoj@hotmail.com	7386550589	o+ve	sredhar rao T	sobha rani S	Amber Road software pvt ltd	Associate QA Analyst	1.3	MBA	B.Tech		MPC		sreedhar rao	father	Parasuram and sons minerals	Marketing Executive	1.6	2015-02-13 05:34:27.438605	2015-02-13 05:34:27.438605
163	220	\N	2014	\N	2010	2008	\N	1991-11-03	#1460, KUMARASWAMY LAYOUT, 17th main, 1st stage	SAREYA WARD NO 5, yadopur road gopalganj\r\npin- 841428		mani.siddhartha@gmail.com	9431269769	0+	MANI BHUSHAN VERMA	PUSHPA VERMA					B.E		CBSE	CBSE	Mani bhushan verma	father				2015-01-22 07:30:47.945182	2015-02-02 07:59:14.754069
165	221	1982	1980	\N	1977	1976	1989-05-07	1960-10-26	301,302, D-6, Kapila, Lokgram, Kalyan, India Pin 421306	301,302, D-6, Kapila, Lokgram, Kalyan, India Pin 421306		jeevanprakashgathoo@gmail.com	+919324342266	AB+	Prakash	Kumud	Quinnox Consultancy Services Ltd	Director	13	MBA	B A (Special) Economics		HSSC, CBSE	SSC, CBSE	Sangeeta Jeevan Gathoo	Wife	Tata Consultancy Services 	Consultant / Country Manager	11	2015-02-02 09:14:57.119023	2015-02-03 05:13:05.888268
169	224	\N	2012	\N	2008	2006	\N	1990-08-18	#22 7th A main Btm layout 1st stage bangalore 560029	#22 7th A main Btm layout 1st stage bangalore 560029	NO	mohammedkhaleel21@gmail.com	9945480667	o nagtive	mohammed habibulla	aisha bee	Four square media pvt ltd	BED	1 YEAR 6 MOUTH.		B.COM		PUC	SSLC	mohammed rafiulla	brother				2015-02-18 05:57:52.839843	2015-02-18 05:57:52.839843
170	225	\N	2014	2011	\N	2005	\N	1990-03-26	#120 New KEB Colony, Vapasandra, ward no 31,\r\nChickballapur	#120 New KEB Colony, Vapasandra, ward no 31,\r\nChickballapur		sathishraj415@gmail.com	9901364192	O+ve	BASAVARAJU.DK	NAGARATHNA.S					BE	CS		SSLC	Basavaraju	Father				2015-02-19 04:33:58.693391	2015-02-19 04:33:58.693391
160	216	\N	2014	\N	2010	2007	\N	1991-06-27	Durga PG, BTM 2nd stage,\r\nBengaluru 560076	Sandhya Devi,PO Kalibari, Hojai, Nagaon, Assam - 782435		dknath11@yahoo.in	09435707681	A1 +ve	Dilip kumar Nath	Jaya Nath					B.tech		AISSCE	AISSE	Mr. D.K. Nath	father				2015-01-05 08:03:42.332938	2015-09-29 10:13:03.874196
171	227	\N	2013	\N	2009	2007	\N	1991-02-02	No.863,Top Floor,Mico Layout,Hongasandra,bangalore-560068	karinipalli,kothakotta,puthalapattu,chittoor,Andhra Pradesh-517112		nediumpavan@gmail.com	+919440017852	O '-'ve	Subramanyam reddy	lakshmi					60%		71%	63%	lakshmi 	mother				2015-02-19 04:51:13.40094	2015-02-23 10:14:15.235006
158	215	\N	2014	\N	2010	2008	\N	1991-10-21	L.N.S. PG for Men, #1, 2nd main road, Behind Ayyappa temple, Madiwala, Bangalore-560 068, Karnataka.	1-120,Panankattu Thottam, Ponparappi, Veeracholapuram(post), Kangeyam(via), Tiruppur(district)-638 701, Tamilnadu.		psathishkgm@gmail.com	9916761624	O+ve	P.Periyasamy	P.Selvi					Bachelor of Engineering		Higher Secondary	Matriculation	Vijay Kumar	Cousin				2014-12-17 11:10:50.674029	2015-07-21 03:50:19.834955
172	228	0	0	0	0	0	2007-05-11	1952-02-02	DrNo.33-12-30, Near Allipuram Bazar Road,\r\nDevagulaveedhi, Visakhapatnam-530004	DrNo.33-12-30, Near Allipuram Bazar Road,\r\nDevagulaveedhi, Visakhapatnam-530004		santoshkumarsadhu@gmail.com	9963590530	AB+	V Seetha Ramu	V Leelavathi	IBM Daksh	Team Leader	3years	AU(Andra University)	Degree BscComputers(AU)	Nill	Intermediate	SSC	9963590530	Wife	Huges Communication Pvt Ltd	BDM	6Years	2015-03-05 09:48:12.067956	2015-03-05 09:48:12.067956
168	226	\N	2014	\N	\N	\N	\N	1990-03-25	No.16, 4th Floor, MSA Lane, Jolly Mohalla, Bangalore-560053	No.16, 4th Floor, MSA Lane, Jolly Mohalla, Bangalore-560053		sannu2503@gmail.com	9739103564	B+	Mushtaq Ahmed	Sahera Banu					BCA									2015-02-17 07:02:02.063395	2015-03-09 11:16:00.408267
164	217	2012	2009	\N	2005	2003	\N	1987-12-03	836 CHANDRA RECIDENCY MICOLAYOUT MINI APARTMENT HONGASANDRA \r\nGAREBAVIPALYA 	623 SRI BASAWESHWARA NILAYA HARALAHALLI ROAD \r\nMALEBENNURU POST HHARIHARA TALUK		basavanagowdais.007@gmail.com	9480287109	B+ve	KOTRESHAPPA K G 	SOWBHAGYA G R 	Ishwar Global Technology	Test Engineer	1.5	M.Tech 77%	B.E    54%		PUC  60%	10th 63%	9448705509	Father				2015-01-27 06:13:09.090694	2015-03-24 12:47:07.982403
161	218	\N	2005	\N	2001	1999	\N	1984-07-18	No. 005, Gopalan Enterprises Royal Avenue, Kathriguppe Main Road,\r\nKathriguppe,\r\nBangalore - 560 085.	No. 5, K.K. Nagar,\r\nNannilam,\r\nThiruvarur district,\r\nTamil Nadu,\r\n610 105.		choc.kool@gmail.com	9538514535	O Positive	Srinivasan C	Bhanumathi S	Independent content professional	Content strategist	1.2 years	-	B.Tech (Information Technology)		HSC	SSLC	Sridhara L N	Friend				2015-01-19 09:30:55.654003	2015-05-28 07:32:30.537269
57	63	2006	2003	\N	2000	1998	1982-12-28	1982-12-28	No. 194, 29th Cross, 2nd Block, Rajajinagar, Bangalore - 560010	No. 194, 29th Cross, 2nd Block, Rajajinagar, Bangalore - 560010	No. 222, 34th Main,3rd Cross, Narasimhaswamy Layout, 7th Block Nandini Layout (Laggare), Bangalore - 560096	umesh.mala@yahoo.com	9845726544	B+ve	L.Balasubramanyam	K.Malliga	RLT Instrumentaion Pvt. Ltd.	Accounts-Admin Assistant	2.6 Years	M.com/MBA	B.Com	PGDFA from NICT	PUC	SSLC	K.Malliga	Mother	Mphasis	Sr. Transaction Processing Officer (TPO)	4.4 years	2013-01-01 05:38:30.203189	2015-09-28 12:20:36.121495
173	229	\N	2013	\N	2009	2007	\N	1991-10-20	777/11,1st cross,13th main,hal 2nd stage,dhopanahalli-08 bangalore	s/o venkataswamy , k g kunta village,5-44, madhapur post,ramagiri mandal, ananthapur district		skchowdary91@gmail.com	9701629668	o-negative	venkataswamy	ramasubbama					B.TECH		MPC	SSC	venkataswamy	father				2015-03-09 03:45:52.642179	2015-03-11 11:01:49.294094
176	231	\N	\N	2007	\N	2001	\N	1986-04-28	#20/B,3rd'D'main,10th cross,2nd floor,j.p nagar 1st phase,near I.G circle,Bangalore-560078	To-Maliya(Hatina),Rameshbhai Jerambhai Butani,Jay Ranchhod nagar,Near Patel Samaj,Ta:maliya(Hatina),Dist:Junagadh,Pin code:362245		butani_dharmendra@yahoo.co.in	8951122528	O+ (positive)	Rameshbhai	Kantaben	Visionet india pvt ltd.	Associate	6 months			Diploma in E&C,S.J.E.S Polytechnic,Bangalore		Goverment high School,Gujrat	Nalin	Brother	Tata Teleservices Ltd.	Sales Executives	1year 1month	2015-03-17 10:59:53.966032	2015-03-17 11:27:58.505134
187	245	\N	2015	\N	2011	2009	\N	1993-10-16	NO:76,\r\nTHIRUMALA PG for Men's,\r\nHOSAPALAYA ROAD;\r\nBEHIND BOSCH COMAPANY,\r\nMUNISWAMAPPA LAYOUT,\r\nOLD MANGAMMANAPALAYA ROAD,\r\nBANGALORE-560 068.	925 A,PUDHUPILLAIYAR KOVIL ST,\r\nAVARANGADU,\r\nPALLIPALAYAM(POST),\r\nTHIRUCHENGODU(TALUK),\r\nNAMAKKAL DISTRICT-638006.		tamizharasan.c123@gmail.com	+919952362826	B+VE	CHINNARAJA A	SELVI C					B.TECH INFORMATION TECHNOLOGY		STATEBOARD	STATEBOARD	CHINNARAJA A	FATHER				2015-06-18 10:11:59.702721	2015-06-18 10:17:34.539828
174	230	\N	2012	\N	2008	2006	\N	1990-10-08	Venkatadri complex,1st cross,roopena agrahara,bommanahalli\r\nbangalore 	D/O A.V Govindappa\r\nvidhya Nagar\r\nShimoga	na	apoorvasg.smg@gmail.com	9741752074	o positive	A.V Govindappa 	K.L Padmavathi	Kclink Technologies	Software Test Engineer	2013 to 2015		B.E		STATE BOARD	STATE BOARD	ashwini	sister				2015-03-16 10:58:33.759196	2015-03-24 12:56:02.494967
175	230	\N	2012	\N	2008	2006	\N	1990-10-08	Venkatadri complex,1st cross,roopena agrahara,bommanahalli\r\nbangalore 	D/O A.V Govindappa\r\nvidhya Nagar\r\nShimoga	na	apoorva@outlook.com	9741752074	o positive	A.V Govindappa 	K.L Padmavathi	Kclink Technologies	Software Test Engineer	2013 to 2015		B.E		STATE BOARD	STATE BOARD	ashwini	sister				2015-03-16 10:58:33.879941	2015-03-24 12:56:50.156523
177	233	\N	\N	\N	\N	\N	\N	1989-02-02	#30,4th cross,katriguppe main road,vinayakanagar,bangalore -50	Shidlaghatta,Chickballapur Dist		harshavar656@gmail.com	8971709924	o +ve	Devaraj C	Bhagyamma V									Panindra Prasad	Brother(Y)				2015-04-09 11:22:08.747601	2015-04-09 11:22:08.747601
178	232	2011	2007	\N	2004	2002	\N	1986-05-22	H/no-50,Shivaji galli,At-Goundwad,OPost-Nehrunagar,Tal/Dist-Belgaum,pin -590010	H/no-50,Shivaji galli,At-Goundwad,OPost-Nehrunagar,Tal/Dist-Belgaum,pin -590010		manojmpatil7@gmail.com	8147181614	ab+	Madhu	Malu	Sansui Electronics Pvt Ltd Pune	ASM	2	MBA	Bsc		SCIENCE		Sachin	Brother	Otic Hearing Solutions Pvt Ltd Mumbai	ASM	1	2015-04-09 12:51:03.258871	2015-04-09 12:51:03.258871
179	236	\N	2007	\N	\N	\N	\N	\N	8-1-15/28,sama saraswathi colony,karmanghat,Saroor Nagar(M),Range Reddy(D),Hyd,Telangana-5000079	8-1-15/28,sama saraswathi colony,karmnaghat,saroor nagar(M),Range ReddY(D),Hyderbad,Telangana-500079		srinivas_20072003@yahoo.com	9866274255	b+	D.Jangaiah	D.Ramulamma	karur vysya bank	sales executives	1yeras.7 month		Ratna Jr.. college				D.jangaiah	father	practo &kenq info techology	marketing	1years	2015-04-20 11:31:24.000277	2015-04-20 11:33:22.700477
181	235	\N	\N	\N	2011	2009	\N	1993-10-23	12, Opp Munishwara temple, A Narayanpura, Dooravani Nagar Post, Bangalore- 560016	12, Opp Munishwara temple, A Narayanpura, Dooravani Nagar Post, Bangalore- 560016		apoorvaoct@gmail.com	9060905001	B+ve	B C Ravindranath	G Leela				WIZTOONZ College of Media and Design			St.ANNE'S Girls PU College	S S B English High School	G Leela	Mother				2015-04-27 06:58:01.75256	2015-04-27 06:58:39.774596
182	240	2012	\N	\N	\N	\N	\N	1985-07-05	#89, 12th Cross, R.T.Street, B.V.K.Iyengar Road Cross,\r\nBangalore- 560053	#89, 12th Cross, R.T.Street, B.V.K.Iyengar Road Cross,\r\nBangalore- 560053		jayasheelan@kreatio.com	+919741117804	B+ve	Gopal G	Sharadha G	bCommerce Infosystems Pvt Ltd	Business Analyst	1.8 	Bachelor Of Engineering					Gopal	Father				2015-06-04 10:02:57.882072	2015-06-04 10:03:35.709461
183	239	\N	2013	\N	\N	\N	\N	1992-06-28	11/4, Pavalavannar street, Big kanchipuram.	11/4, Pavalavannar street, Big kanchipuram.		kannanparthi28@gmail.com	8807926825	O+ve	Mohanan	Suseela	Metronic Engineering Pvt ltd.	Sales Engineer	1		Srinivasa Institute of Engineering and Technology 				M.Suseela	Mother	bharti telemedia pvt ltd	key accounts	1	2015-06-08 08:08:17.925956	2015-06-08 08:11:27.378158
184	238	\N	\N	1999	\N	1999	\N	1984-01-25	1758 Akbar road mandi mohall mysuru 570021	Same as above	 Own house	prasannatakur@gmail.com	9035305263	o+ positive	G R Narendra babu	shymala	getit infoservices in Bangalore	sales executive	28.6.2010 to 14.12.2012			banumaiha polytechnic		seventh day seventies school	sahana	sister	Systema tele services	seni sales executive	17.2.2013 to 28.11.2014	2015-06-09 10:05:52.523879	2015-06-09 10:05:52.523879
186	246	\N	2015	\N	2011	2009	\N	1994-05-04	No:76,\r\nThirumala PG for Men's,\r\nHosapalaya Road,\r\nBehind BOSCH Company,\r\nMuniswamappa Layout,\r\nOld Mangammanapalaya Road,\r\nBangalore-560068 	9G,Mohan Gandhi Street,\r\nTisaiyanvillai,\r\nRadhapuram Taluk,\r\nTirunelveli District,\r\nPincode-627657.		jeganysg004@gmail.com	+919894257151	B+ve	Rajendran M	Maria Kirubasanam R					B.E MECHANICAL		STATE BOARD-MATHS BIOLOGY	STATE BOARD	Rajendran M	Father				2015-06-18 10:10:32.148649	2015-06-18 10:10:32.148649
185	248	\N	2015	\N	2011	2009	\N	1993-11-27	#76, Thirumala PG for Men, Hosapalya road, Muniswamappa layout, Old mangamanapalya road, Bangaluru - 560068	#84, Thiruvalluvar Nagar, pallikonda, Vellore district, Tamil Nadu - 635809		lokeshwrn27@gmail.com	+917845563981	O+ve	Venmathy	Mythili					BE-Robotics and Automation		State Board - Maths Biology	State Board	Mythili	Mother				2015-06-18 10:10:14.386715	2015-06-18 10:10:33.19304
189	242	\N	2005	\N	2002	2000	\N	1984-04-19	14/20, 18A Main, 13th Cross, Venkateshwara Layout, BTM 1st Stage, Madiwala, Bangalore-560068.	38, Tamizh Street, Bastian Nagar, INTUC Colony, Bethaniyapuram, Madurai-625016.    Tamil Nadu.		weberarun@gmail.com	+918892227510	A+	S. Xavier	L. Sahaya Rani	Creative Visuals	Web & Graphic Designer	1.4 years		B.Sc (Physics		Higher Secondary	10 Standard	S. Amala Arun	Wife	AJ Square	Visualizer	6 months	2015-06-23 06:11:49.937327	2015-06-23 06:11:49.937327
190	243	\N	2015	\N	2011	2009	\N	1993-07-06	#18,9th main,\r\nmandira silk line,\r\nbtm 1st stage,\r\nbangalore.	5/641.A indra nagar\r\np.n road,\r\ntirupur.		keerthikeerthana479@gmail.com	9894740479	B+ve	Chidambaram.k	Rukmani.C									Ambika	sister				2015-06-25 05:06:58.378499	2015-06-25 05:06:58.378499
191	244	\N	2015	2012	\N	\N	\N	1991-12-19	#18,9th main,\r\nmanjunatha pg for ladies and gents,\r\nmandir silk line,\r\nBTM 1st stage,\r\nBangalore	6/63,mariamman kovil street,\r\nElangarkudi,\r\npapanasam(t.k)\r\nTanjore(d.t)\r\npin-614203		vijiramvv@gmail.com	9047467356	0+ve	muruganantham	kannaki					BE	ECE				mom				2015-06-25 05:11:50.896691	2015-06-26 10:20:45.125787
192	250	\N	2015	\N	2011	2009	\N	1993-12-23	 #76, THIRUMALA PG, HOSAPALAYA ROAD, OLD MANGAMMANAPALAYA ROAD, MUNISWAMAPPA LAYOUT, BENGALURU - 560068.	1-91, BHARATHI STREET, \r\nERACHAKULAM P.O, KANYAKUMARI DISTRICT, TAMIL NADU - 629902.		vishal30358@gmail.com	9443931293	O + ive	VELAPPAN C	PERPETH MALAR G					B.E - C.S.E		STATE BOARD	MATRICULATION 	VELAPPAN C	FATHER				2015-07-02 11:05:43.56529	2015-10-28 05:22:50.182676
180	237	\N	2013	\N	2009	2006	\N	1991-06-08	Pushkar Kant SIS Training Center, Near patilama temple, vermou agra bus stop, babushahpalya, Banglore	D/O Ajay kumar das State Food Corporation 5th floor Sone Bhawan BCP marg Patna Bihar		rachna@kreatio.com	8880043006	O+	Ajay Kumar Das	Subhita Das					B.E (CSE)		CBSE (Science)	CBSE(Science)	Pushkar Kant	Brother				2015-04-23 07:52:30.847799	2015-12-24 05:09:32.733671
193	249	\N	2015	\N	2011	2009	\N	1993-08-20	 #76, Thirumala PG for Men, Hosapalya road, Muniswamappa layout, Old mangammanapalya road, Bengaluru - 560068.	44,N.G.G.O. colony,\r\nmurugan illam,\r\nDharapuram-638656.\r\nTirupur district.		fazilhakkimcit008@gmail.com	8524813103	A1B+ve	A.Abbas ali	A.Nilafer Neesha					B.Tech IT		State Board	Matriculation	A.Abbas ali	Father				2015-07-02 11:17:10.243909	2015-07-02 11:17:10.243909
194	251	\N	2013	\N	2009	2007	\N	1991-11-27	#168, 1st cross, bajaj layout, devasandra main road,k r puram, bangalore.	Buchipalli, P T M (M),\r\nChittoor(D), AP.		harishnaidujarra@gmail.com	8496987145	O+	J V Ramana	J Narayanamma					B.Tech		MPC		Rajesh Naidu	Brother				2015-07-10 05:21:09.488219	2015-07-10 05:21:09.488219
195	241	2011	2008	2001	2005	2002	1983-06-26	1952-05-08	Pl:no:11/a, D:no:42/5, Manuneethi Chozan St, GST Rd, Kilampakkam, Urapakkam, Chennai - 603210	Pl:no:11/a, D:no:42/5, Manuneethi Chozan St, GST Rd, Kilampakkam, Urapakkam, Chennai - 603210	Pl:no:11/a, D:no:42/5, Manuneethi Chozan St, GST Rd, Kilampakkam, Urapakkam, Chennai - 603210	joshdanis@gmail.com	9043821023	B+ve	M.DANIEL ARUNKUMAR	D.JERINA DANIEL	Macro Media Digital Imaging	Sales Executive	1.1/2	MBA	B.COM	DCA	Commerce + Gen. Maths	General	M.Daniel Arunkumar	Father	First Commerce	E Commerce Consultant		2015-07-17 04:48:37.901546	2015-07-17 04:48:37.901546
196	253	\N	2009	\N	2005	2003	2010-06-02	1987-02-09	Shilpa T.R,\r\nW/O Ranganath S.M,\r\nRanganatha Swamy Nilaya,\r\n3rd Cross,Near Anjaneya Swamy Temple,\r\nKuvempu Layout,Devasandra,\r\nKR Puram,Bangalore-560036	Shilpa T.R,\r\nW/O Ranganath S.M,\r\nRanganatha Swamy Nilaya,\r\n3rd Cross,Near Anjaneya Swamy Temple,\r\nKuvempu Layout,Devasandra,\r\nKR Puram,Bangalore-560036		t.r.shilpa@gmail.com	9900175406	A+ve	Ramachandraiah K	Shivamma	SJM Technologies Pvt Ltd	Test Engineer	1 Year 5 Months		Bachelor of Engineering		PCMB	SSLC	Ranganath S.M	Husband	Vivus e-Solutions Pvt Ltd	Software Engineer	6 Months	2015-07-27 09:08:28.120984	2015-07-27 09:08:28.120984
197	259	2013	2005	\N	\N	\N	\N	1982-04-06	71/6, Sri Lakshmi Nara Simha Nilaya, Shakambari Nagar, opp: Banashankari Temple, K.P. Main Road,\r\nBangalore - 560082	71/6, Sri Lakshmi Nara Simha Nilaya, Shakambari Nagar, opp: Banashankari Temple, K.P. Main Road,\r\nBangalore - 560082		nareshgunayati@yahoo.com	9964033346	o+ve	G. Sai Krishna	G. Meenakshi	Pragathi Estates	Manager - Sales & Marketing	1 year 7 months	MBA	B.Com				Sridhar	Brother	BGS Global Hospitals	Executive	4 years 8 months	2015-08-06 05:45:12.31222	2015-08-06 05:45:12.31222
198	258	2015	2011	0	2007	2005	2014-11-20	1990-11-11	44/4,Dhanalakshmi Garden.\r\nmottankurichi backside\r\nkannankurichi \r\nsalem-636008	44/4,Dhanalakshmi Garden.\r\nmottankurichi backside\r\nkannankurichi \r\nsalem-636008		rubanmca90@gmail.com	9865937009	b+	subramanian.C	Malliga	Solaimalai enterprises	ASE	2-1/2 years	M.C.A	B.C.A	Nil	12	10	logesh	brother				2015-08-06 06:54:59.027578	2015-08-06 06:55:36.258529
199	252	\N	\N	\N	\N	\N	\N	1990-02-17	No.5, Andal Puram, South street	No.5, Andal Puram, South street		dinez17@gmail.com	9751646628	AB+ve	Venugopal	Shanthi									Shanthi	Mother				2015-08-10 10:52:34.64277	2015-08-10 10:52:34.64277
200	254	\N	\N	\N	\N	\N	\N	1989-02-07	Kerala	Thoppikkunnel House,\r\nOoramana P.O.,\r\nMuvattupuzha, Kochi,\r\nKerala,Pincode – 686730,		nikhiltp1010@gmail.com	8907200222	o+ve	Ponnappan	Sudha N K	HDFC								Ponnappan	Father				2015-08-12 05:30:25.485673	2015-08-12 05:30:25.485673
201	260	\N	2011	\N	2008	2006	2012-09-03	\N	#26, 8th main road m cross new gurupanpalya bangalore 560029	srikanth Vasuraj <srikanthvasuraj@webnish.com>		mannanhusna@gmail.com	9448764809	A+	hayath baig	suraiya hayath	Reliance Money 	BDE	1		ICSI		N M K R V Colleage for Women 	R V Girls High School	sikandar	husband	Pearson Education Pvt Ltd	Sr. Executive Telesales	3	2015-08-18 04:58:24.501601	2015-08-18 04:58:24.501601
202	261	2015	2012	\N	2009	2009	\N	1991-10-30	vyshakh krishnan\r\nvaykundam ho,\r\nuthakapoyil thazha kuni\r\nthuneri po,\r\nnadapuram,\r\ncalicut, pin 673505	vyshakh krishnan\r\nvaykundam ho,\r\nuthakapoyil thazha kuni\r\nthuneri po,\r\nnadapuram,\r\ncalicut, pin 673505		vyshakhkrishnan30@gmail.com	9633911795	O+ve 	Balakrishnan nair	Reetha b. nair	ide cellular ltd	3g sales promoter	1 year 3months	MBA	BCA		plus two	sslc	reeba manoj	sister				2015-08-20 10:21:20.890096	2015-08-20 10:21:20.890096
203	256	\N	\N	\N	0	0	\N	1989-08-23	hno 8-1304/15c\r\ngulbarga	hno 8-1304/15c\r\ngulbarga	hno 8-1304/15B\r\ngulbarga	vishu.devni@gmail.com	9844255475	AB+VE	Vaijunath devni	Ratanakala devni	Dharmanand tractors for NEW HOLLAND company	Sales Executive	AUG-2012 To DEC2013 				Department of Pre-University education	Karnataka secondary education examination board	Vaijuanath devni	father	HDFC Standard life insurance company limited	Sales Development Manager	JAN-2014 To JAN-2015	2015-08-20 11:30:51.842958	2015-08-20 11:30:51.842958
204	257	\N	\N	\N	\N	\N	\N	1991-12-02	#958, Devarahakkal,\r\nKumta- 581343	#958, Devarahakkal,\r\nKumta-581343		naik.roshan@live.com	9481408046	A+	Devadatta Naik	deepa Naik	RNS Motor	Sales Consultant	1						Devadatta Naik	Father	T V Sundram iyengar and sons	Sales Consultant	4 months	2015-08-20 17:02:02.724475	2015-08-20 17:02:02.724475
205	264	2015	2012	\N	2009	2007	\N	1078-02-15	100,ramasamy nagar,\r\nKalappa nayackan palayam,\r\nCoimbatore-641108	57,ramasamy nagar,\r\nKalappa nayackan palayam,\r\nCoimbatore-641108		muralidaran725@gmail.com	9095611030	AB+	Rajendran	Jothi	TATA interactive systems	Sales	2.5	MBA	Bsc		Science				Apollo Hospitals	Sales	0.5	2015-08-25 07:49:46.395226	2015-08-25 07:49:46.395226
206	265	2014	2011	\N	2008	2006	\N	1990-10-24	C-4/9,C.V.RAMAN NAGAR D.R.D.O TOWNSHIP PHASE-1 BANGALORE-93	C-4/9,C.V.RAMAN NAGAR D.R.D.O TOWNSHIP PHASE-1 BANGALORE-93		arun7542@gmail.com	9620329123	A+VE	N M KUMAR	LATA KUMAR				76.5	65.9		52.8	63.6	TARUN KUMAR	BROTHER				2015-08-26 11:20:49.758808	2015-08-26 11:20:49.758808
207	255	\N	2012	\N	2008	2006	\N	1967-07-01	anjiah road, ongole 7-203 prakasham dist.	addanki ,kattakinda palem d.no: 12-255 prakasham	anjiah road, ongole 7-203 prakasham dist.	-	8008643673	b+ve	Ch.Nagaiah	Ch.Aruna	NN AIRCONSYSTEMS PVT LTD	SALES ENGINEER	1.8YRS		Btech		inter	10th	Nagaiah	father	BORG ENERGY	DSR	3MONTHS	2015-08-28 05:42:21.964516	2015-08-28 05:47:48.299267
208	266	\N	2012	2009	2006	2004	\N	2015-09-02	Sri Balaji PG for gents\r\nMaruti Nagar	46/20 A Grown Street,Vathiarvillai,Vadsery,Nagercoil,Kanyalkumari dist-629001,Kanyakumari Dist.\r\n		sujithbr28@gmail.com	9442574090	B+ve	Seenivasavasan	Nallal	Sri Anusham Rubber Industries	BDE	3		B.E in Electronics and communicationEngg	Electronics and Communication		-	Seenivasan	Father				2015-09-02 11:15:52.733026	2015-09-02 11:15:52.733026
188	247	\N	2015	2012	2010	2008	\N	1993-12-20	76,hosapalya layout,\r\nbehind bosch company,\r\nbommanahally,\r\nbengaluru-560068	96/5,kutta kadu,mettupatti thathanoor(post),\r\nayothiyapattanum,\r\nsalem-636103		lognathanguna444@gmail.com	9787842876	B+ve	Gunasekaran N	Kamala G					BE(I&CE)	ECE	state board	state board	Gunasekaran N	father				2015-06-22 03:44:34.647769	2015-09-09 05:14:32.880188
209	269	\N	2014	\N	2010	2008	\N	2015-10-13	Bomanahali	4/96,Nagamanaickanpatti(po),vellakovil(via),\r\ntiruppur(dt)		vaidheeswaran@kreatio.com	9942978884	B+ve	Dhandapani A	Kalyani D					Selvam College of Technology		AVMHSS	PAAMS	Dhandapani A	father				2015-10-23 12:54:31.949277	2015-10-27 09:07:22.141646
214	277	\N	2012	2009	\N	2006	\N	1991-03-05	218, 5th block, richfields appartment,\r\nmarathalli,\r\nbangalore-560037 	8/6 sankari main road\r\nGugai\r\nsalem-636006\r\nTamilnadu.		ravikumarark5@gmail.com	9842746928	AB -ve	C.ASHOKKUMAR	A.Nirmala					B.TECH(IT)	ECE		SSLC	C.Ashokkumar	Father				2015-11-17 11:20:10.630882	2015-11-17 11:20:10.630882
211	272	\N	2009	\N	2002	1997	2014-08-22	1982-06-06	H.NO:4-13,\r\nVIKASNAGAR,\r\nDILSUKHNAGAR,\r\nHYDERABAD,500060.	H.NO:4-13,\r\nVIKASNAGAR,\r\nDILSUKHNAGAR,\r\nHYDERABAD,500060.		shyam_koshika@yahoo.com	9948915595	O+ve	K.PEDDULU	K.MALLAMMA	ADICO SPARES PVT LTD.	SALES EXECUTIVE	4		B.TECH(EEE)		M.P.C	GOVT OF A.P	K.Durgesh	BROTHER				2015-11-05 14:47:00.12141	2015-11-05 14:47:00.12141
212	275	\N	2014	\N	2009	2007	\N	1991-01-10	sri sai balaji lifestyle pg,16th main,btm 2nd stage,bangalore,karnataka\r\npin-560076	vill+post-govind pitaujhia,via-rampurhari,dist-sitamarhi,bihar\r\npin-843117		adarsh9653@gmail.com	09122061871	A+	Vivekanand singh	Pushpa singh					Punjab technical university		CBSE	Andhra pradesh board	Vivekanand singh	father				2015-11-09 07:11:31.950994	2015-11-09 07:11:31.950994
213	270	\N	2011	\N	2008	2006	\N	1990-07-28	#9, 1st main road, mangammanapalya, Bommanahalli post, Bangalore -68	#9, 1st main road, mangammanapalya, Bommanahalli post, Bangalore -68		sowmyas210@yahoo.in	9742569517	A+	Sanjeev Kumar	Bhagya	CubicLogics India Pvt Ltd	Sales Cordinator	2.8 Years		B.com		Commerce	SSLC	Punit	Brother	Hbl Global Solution	Sales Executive	5 months	2015-11-10 07:41:02.89233	2015-11-10 07:41:02.89233
215	276	\N	2015	2011	\N	2007	\N	1991-04-19	C/O Rajalaxmi\r\n123/28,33rd cross,Jooganahalli,2nd block,Rajajinagar,\r\nBangalore-10\r\n	D/O Timmappa Moger,\r\nBelke house,Mavinakurve post,Bundar,Bhatkal-581320,Uttara-Kannada dist		kaveribkl19@gmail.com	9019084416	B+	Timmappa Moger	Sannamma Moger					69.63	63		82.08	Timmappa Moger	Father				2015-11-17 12:16:36.81922	2015-11-17 12:16:36.81922
219	281	2011	2007	\N	2004	2002	\N	1987-04-26	11038,Swarnamahal,20th A main,Sri venkateshwara layout, maruthi nagar,\r\nbtm 1st stage,-560068	3/128,Arasur pudur,Arasur(p.o), Sathy(tk),Erode (dt),\r\nTamilnadu-638454		ragavn45@gmail.com	9600951938	O+ve	Nachimuthu	Rajeshwari				MCA	B.COM		Saru Matriculation Higher Sec School	Saru Matriculation Higher Sec School	Nachimuthu	Father				2015-12-08 09:36:32.815362	2015-12-08 09:36:32.815362
210	271	2013	2011	\N	2007	2005	\N	1990-04-24	VASUDEVA DODDAMANI\r\nAT/- KABALAYATAKATTI\r\nPOST/- ATTIKATTI\r\nT/D/- GADAG\r\nKARNATAKA - 582103	VASUDEVA DODDAMANI\r\nAT/- KABALAYATAKATTI\r\nPOST/- ATTIKATTI\r\nT/D/- GADAG\r\nKARNATAKA - 582103		vasudoddamani94@gmail.com	8088840480	O+VE	KHIMENDRA	GANGUBAI	H D F C BANK LTD	BRANCH SALES OFFICER	1.1 YEARS	M.B.A	B.B.A		P.U.C	S.S.L.C	KRISHNA	BROTHER	TIMESJOBS.COM	ACCOUNT MANAGER	8 MONTHS	2015-11-03 05:23:26.85745	2015-11-27 06:42:15.386831
220	282	\N	2013	2011	2009	2004	\N	1990-01-12	#S-7, 2nd Floor, Amrithpriya Residency, Jakkur Main Road, Kempapura Dasarrahalli, Bengaluru, Karnataka-560024	C/o Chandrawati Devi, Gandhi Chowk Balua, Ward No. 12, Near HR Megamart,Madhubani, Bihar\r\nPin : 847211		atulchandra127@gmail.com	+919471090280	B+	Sunil Kumar Das	Mamta Rani	M2M Resource Mgmt. Pvt. Ltd.	Associate (Executive)	1 Year		LNMU	IIHT (ACHNP)	BSEB	BSEB	Mamta Rani	Mother				2015-12-10 09:50:42.151277	2015-12-15 06:32:37.564234
\.


--
-- Name: personal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_details_id_seq', 221, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, role_name) FROM stdin;
2	HR
3	USER
1	RM
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: employee_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT employee_details_pkey PRIMARY KEY (id);


--
-- Name: leave_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY leave_details
    ADD CONSTRAINT leave_details_pkey PRIMARY KEY (id);


--
-- Name: leave_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY leave_records
    ADD CONSTRAINT leave_records_pkey PRIMARY KEY (id);


--
-- Name: leave_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY leave_types
    ADD CONSTRAINT leave_types_pkey PRIMARY KEY (id);


--
-- Name: office_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY office_types
    ADD CONSTRAINT office_types_pkey PRIMARY KEY (id);


--
-- Name: personal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal_details
    ADD CONSTRAINT personal_details_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

