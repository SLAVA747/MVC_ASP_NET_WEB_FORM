--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.5

-- Started on 2018-12-10 19:00:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16451)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    company_id integer NOT NULL,
    company_name character varying(300) NOT NULL,
    company_site character varying(300) NOT NULL,
    company_telephone character varying(300) NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16420)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employees_id integer NOT NULL,
    employees_full_names character varying(300) NOT NULL,
    employees_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16440)
-- Name: numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.numbers (
    id_number integer NOT NULL,
    employees_id integer NOT NULL,
    post_id integer NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.numbers OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16396)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    post_id integer NOT NULL,
    post_name character varying(300) NOT NULL,
    post_contacts character varying(300) NOT NULL,
    post_type_contacts character varying(300)
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 2817 (class 0 OID 16451)
-- Dependencies: 199
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (company_id, company_name, company_site, company_telephone) FROM stdin;
1	OOO "Росдирект"	www.rosdirect.ru	+7-905-079-35-51
2	OAO "Мосонлайн"	www.mosonline.ru	+7-902-905-33-12
\.


--
-- TOC entry 2815 (class 0 OID 16420)
-- Dependencies: 197
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employees_id, employees_full_names, employees_date) FROM stdin;
1	Ахматов Чеслав Куприянович 	1990-06-14
2	Букавицкий Елизар Филиппович 	1961-07-18
3	Гавшина Валентина Вячеславовна 	1979-11-26
4	Беломестина Агафья Фомевна 	1987-05-30
5	Егорова Лариса Афанасиевна 	1991-05-04
6	Элефтеров Авдей Трофимович 	1971-06-04
7	Комяхова Маргарита Фомевна	1961-12-23
8	Бурякова Кира Петровна 	1974-11-25
9	Коломников Парфен Назарович 	1995-03-08
10	Вязьмитина Дарья Трофимовна 	1987-02-04
\.


--
-- TOC entry 2816 (class 0 OID 16440)
-- Dependencies: 198
-- Data for Name: numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.numbers (id_number, employees_id, post_id, company_id) FROM stdin;
1	1	10	1
2	2	9	2
3	3	8	1
4	4	7	2
5	5	6	2
6	6	5	1
7	7	4	1
8	8	3	1
9	9	2	2
10	10	1	2
\.


--
-- TOC entry 2814 (class 0 OID 16396)
-- Dependencies: 196
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (post_id, post_name, post_contacts, post_type_contacts) FROM stdin;
1	Комбайнер\t	osutassemm-1419@yopmail.com	Email:
5	Художник	epejoguw-2421@yopmail.com	Email:
6	Специалист по ВЭД	epejoguw-2421@yopmail.com	Email:
8	Звукооператор	mywenurutte-8996@yopmail.com	Email:
10	Стрелочник	koqoxero-0811@yopmail.com	Skype:
2	Технический писатель	Inintoo	Skype:
3	Делопроизводитель	116589380	ICQ:
4	Диктор	+7-847-04-05	Моб. Телефон:
7	Специалист по ВЭД	+7-962-47-75	Моб. Телефон:
9	Проводник	+7-223-38-86	Моб. Телефон:
\.


--
-- TOC entry 2687 (class 2606 OID 16446)
-- Name: numbers book_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numbers
    ADD CONSTRAINT book_pk PRIMARY KEY (id_number);


--
-- TOC entry 2689 (class 2606 OID 16460)
-- Name: company company_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pk PRIMARY KEY (company_id);


--
-- TOC entry 2685 (class 2606 OID 16429)
-- Name: employees employees_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pk PRIMARY KEY (employees_id);


--
-- TOC entry 2683 (class 2606 OID 16405)
-- Name: post post_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pk PRIMARY KEY (post_id);


--
-- TOC entry 2692 (class 2606 OID 16476)
-- Name: numbers numbers_company_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numbers
    ADD CONSTRAINT numbers_company_fk FOREIGN KEY (company_id) REFERENCES public.company(company_id);


--
-- TOC entry 2691 (class 2606 OID 16471)
-- Name: numbers numbers_employees_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numbers
    ADD CONSTRAINT numbers_employees_fk FOREIGN KEY (employees_id) REFERENCES public.employees(employees_id);


--
-- TOC entry 2690 (class 2606 OID 16466)
-- Name: numbers numbers_post_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.numbers
    ADD CONSTRAINT numbers_post_fk FOREIGN KEY (post_id) REFERENCES public.post(post_id);


-- Completed on 2018-12-10 19:00:36

--
-- PostgreSQL database dump complete
--

