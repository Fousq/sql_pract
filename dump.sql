--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

--
-- Name: ad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ad_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: academic_degrees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academic_degrees (
    id smallint DEFAULT nextval('public.ad_id_seq'::regclass) NOT NULL,
    name character(30) NOT NULL,
    priority smallint NOT NULL
);


ALTER TABLE public.academic_degrees OWNER TO postgres;

--
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campus_id_seq OWNER TO postgres;

--
-- Name: campuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campuses (
    id integer DEFAULT nextval('public.campus_id_seq'::regclass) NOT NULL,
    name character(120) NOT NULL,
    address character(120)
);


ALTER TABLE public.campuses OWNER TO postgres;

--
-- Name: cl_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cl_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cl_location_id_seq OWNER TO postgres;

--
-- Name: classes_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes_location (
    id integer DEFAULT nextval('public.cl_location_id_seq'::regclass) NOT NULL,
    audience character(5),
    campus_id integer
);


ALTER TABLE public.classes_location OWNER TO postgres;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    code character(10) NOT NULL,
    name character(80) NOT NULL,
    description text
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_semesters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses_semesters (
    course_code character(10),
    semester_id integer
);


ALTER TABLE public.courses_semesters OWNER TO postgres;

--
-- Name: id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq OWNER TO postgres;

--
-- Name: lecture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lecture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lecture_id_seq OWNER TO postgres;

--
-- Name: lectures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures (
    id integer DEFAULT nextval('public.lecture_id_seq'::regclass) NOT NULL,
    name character(60) NOT NULL,
    date_of_birth date NOT NULL,
    telephone_number character(16),
    address character(120),
    personal_email character(70) NOT NULL,
    academic_degree_id integer
);


ALTER TABLE public.lectures OWNER TO postgres;

--
-- Name: lectures_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures_courses (
    lecture_id integer,
    course_code character(10)
);


ALTER TABLE public.lectures_courses OWNER TO postgres;

--
-- Name: lectures_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures_schedule (
    lecture_id integer,
    schedule_id integer
);


ALTER TABLE public.lectures_schedule OWNER TO postgres;

--
-- Name: lectures_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures_users (
    lecture_id integer,
    user_id integer
);


ALTER TABLE public.lectures_users OWNER TO postgres;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO postgres;

--
-- Name: log_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_entries (
    id integer DEFAULT nextval('public.log_id_seq'::regclass) NOT NULL,
    logged_on boolean NOT NULL,
    logged_off boolean NOT NULL
);


ALTER TABLE public.log_entries OWNER TO postgres;

--
-- Name: sch_cl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sch_cl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sch_cl_id_seq OWNER TO postgres;

--
-- Name: schedule_classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule_classes (
    id integer DEFAULT nextval('public.sch_cl_id_seq'::regclass) NOT NULL,
    date_and_time timestamp without time zone,
    location_id integer
);


ALTER TABLE public.schedule_classes OWNER TO postgres;

--
-- Name: semester_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semester_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.semester_id_seq OWNER TO postgres;

--
-- Name: semesters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semesters (
    id integer DEFAULT nextval('public.semester_id_seq'::regclass) NOT NULL,
    number integer NOT NULL,
    name character(70),
    year date,
    start_date date,
    end_date date
);


ALTER TABLE public.semesters OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer DEFAULT nextval('public.student_id_seq'::regclass) NOT NULL,
    name character(60) NOT NULL,
    date_of_birth date NOT NULL,
    telephone_number character(16),
    address character(120),
    personal_email character(70)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_courses (
    student_id integer,
    course_code character(10)
);


ALTER TABLE public.students_courses OWNER TO postgres;

--
-- Name: students_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_schedule (
    student_id integer,
    schedule_id integer
);


ALTER TABLE public.students_schedule OWNER TO postgres;

--
-- Name: students_semesters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_semesters (
    student_id integer,
    semester_id integer
);


ALTER TABLE public.students_semesters OWNER TO postgres;

--
-- Name: students_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_users (
    student_id integer,
    user_id integer
);


ALTER TABLE public.students_users OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    login character(40),
    password character(25),
    isactive boolean,
    logstatus integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: academic_degrees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academic_degrees (id, name, priority) FROM stdin;
1	Bachelor                      	1
2	Master                        	2
3	Ph.D                          	3
\.


--
-- Data for Name: campuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campuses (id, name, address) FROM stdin;
\.


--
-- Data for Name: classes_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes_location (id, audience, campus_id) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (code, name, description) FROM stdin;
M2        	Math 2                                                                          	\N
C1        	Calculus 1                                                                      	\N
C2        	Calculus 2                                                                      	\N
\.


--
-- Data for Name: courses_semesters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses_semesters (course_code, semester_id) FROM stdin;
M2        	1
C1        	1
C2        	2
\.


--
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures (id, name, date_of_birth, telephone_number, address, personal_email, academic_degree_id) FROM stdin;
1	Gorgc                                                       	1978-07-12	+7(767)667-76-67	Some building                                                                                                           	foo@bar.ru                                                            	2
2	Steve                                                       	1979-02-02	+7(767)645-46-67	Some building                                                                                                           	foo@bar.ru                                                            	3
4	Lucos                                                       	1989-04-02	+7(767)125-46-67	Some building                                                                                                           	foo@bar.io                                                            	1
\.


--
-- Data for Name: lectures_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures_courses (lecture_id, course_code) FROM stdin;
1	M2        
2	C2        
2	M2        
1	C1        
\.


--
-- Data for Name: lectures_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures_schedule (lecture_id, schedule_id) FROM stdin;
\.


--
-- Data for Name: lectures_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures_users (lecture_id, user_id) FROM stdin;
\.


--
-- Data for Name: log_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_entries (id, logged_on, logged_off) FROM stdin;
\.


--
-- Data for Name: schedule_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule_classes (id, date_and_time, location_id) FROM stdin;
\.


--
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semesters (id, number, name, year, start_date, end_date) FROM stdin;
1	1	semester 1                                                            	\N	\N	\N
2	2	semester 2                                                            	\N	\N	\N
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, name, date_of_birth, telephone_number, address, personal_email) FROM stdin;
1	Kevin                                                       	1998-09-19	+7(702)123-87-98	Some avenue                                                                                                             	foo@bar.com                                                           
2	Bob                                                         	1999-02-19	+7(702)121-87-98	Some street                                                                                                             	f@bar.com                                                             
3	Bill                                                        	1996-05-19	+7(702)121-82-98	Some street, some building                                                                                              	bill@bar.com                                                          
4	Steve                                                       	1999-09-05	+7(777)777-77-77	Some avenue                                                                                                             	bar@foo.com                                                           
\.


--
-- Data for Name: students_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_courses (student_id, course_code) FROM stdin;
1	M2        
3	M2        
2	C1        
\.


--
-- Data for Name: students_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_schedule (student_id, schedule_id) FROM stdin;
\.


--
-- Data for Name: students_semesters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_semesters (student_id, semester_id) FROM stdin;
\.


--
-- Data for Name: students_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_users (student_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, password, isactive, logstatus) FROM stdin;
\.


--
-- Name: ad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ad_id_seq', 3, true);


--
-- Name: campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_seq', 1, false);


--
-- Name: cl_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cl_location_id_seq', 1, false);


--
-- Name: id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq', 1, false);


--
-- Name: lecture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lecture_id_seq', 4, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_seq', 1, false);


--
-- Name: sch_cl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sch_cl_id_seq', 1, false);


--
-- Name: semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semester_id_seq', 2, true);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 4, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: academic_degrees academic_degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_degrees
    ADD CONSTRAINT academic_degrees_pkey PRIMARY KEY (id);


--
-- Name: campuses campuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campuses
    ADD CONSTRAINT campuses_pkey PRIMARY KEY (id);


--
-- Name: classes_location classes_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes_location
    ADD CONSTRAINT classes_location_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (code);


--
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);


--
-- Name: log_entries log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_entries
    ADD CONSTRAINT log_entries_pkey PRIMARY KEY (id);


--
-- Name: schedule_classes schedule_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule_classes
    ADD CONSTRAINT schedule_classes_pkey PRIMARY KEY (id);


--
-- Name: semesters semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: classes_location classes_location_campus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes_location
    ADD CONSTRAINT classes_location_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campuses(id);


--
-- Name: courses_semesters courses_semesters_course_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses_semesters
    ADD CONSTRAINT courses_semesters_course_code_fkey FOREIGN KEY (course_code) REFERENCES public.courses(code);


--
-- Name: courses_semesters courses_semesters_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses_semesters
    ADD CONSTRAINT courses_semesters_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES public.semesters(id);


--
-- Name: lectures lectures_academic_degree_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_academic_degree_id_fkey FOREIGN KEY (academic_degree_id) REFERENCES public.academic_degrees(id);


--
-- Name: lectures_courses lectures_courses_course_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_courses
    ADD CONSTRAINT lectures_courses_course_code_fkey FOREIGN KEY (course_code) REFERENCES public.courses(code);


--
-- Name: lectures_courses lectures_courses_lecture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_courses
    ADD CONSTRAINT lectures_courses_lecture_id_fkey FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: lectures_schedule lectures_schedule_lecture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_schedule
    ADD CONSTRAINT lectures_schedule_lecture_id_fkey FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: lectures_schedule lectures_schedule_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_schedule
    ADD CONSTRAINT lectures_schedule_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedule_classes(id);


--
-- Name: lectures_users lectures_users_lecture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_users
    ADD CONSTRAINT lectures_users_lecture_id_fkey FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: lectures_users lectures_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_users
    ADD CONSTRAINT lectures_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users log_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT log_constraint FOREIGN KEY (logstatus) REFERENCES public.log_entries(id);


--
-- Name: schedule_classes schedule_classes_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule_classes
    ADD CONSTRAINT schedule_classes_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.classes_location(id);


--
-- Name: students_courses students_courses_course_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT students_courses_course_code_fkey FOREIGN KEY (course_code) REFERENCES public.courses(code);


--
-- Name: students_courses students_courses_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT students_courses_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_schedule students_schedule_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_schedule
    ADD CONSTRAINT students_schedule_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedule_classes(id);


--
-- Name: students_schedule students_schedule_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_schedule
    ADD CONSTRAINT students_schedule_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_semesters students_semesters_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_semesters
    ADD CONSTRAINT students_semesters_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES public.semesters(id);


--
-- Name: students_semesters students_semesters_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_semesters
    ADD CONSTRAINT students_semesters_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_users students_users_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_users
    ADD CONSTRAINT students_users_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_users students_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_users
    ADD CONSTRAINT students_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

