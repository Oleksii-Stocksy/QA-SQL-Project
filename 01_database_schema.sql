--
-- PostgreSQL database dump
--

\restrict ShQge7gRND1J3UYFTu2f5phbsm4rPXujFWNtMDaPpeR1OvUl3TAse6Lid86nF4L

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-13 09:28:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16616)
-- Name: bug_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bug_reports (
    bug_id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    steps_to_reproduce text,
    actual_result text,
    expected_result text,
    environment character varying(250),
    test_devices character varying(100),
    method_curl text,
    requirements_link character varying(255),
    error_logs text,
    attachment_url character varying(255),
    priority character varying(20),
    severity character varying(20),
    status character varying(20) DEFAULT 'New'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    reporter_name character varying(50) DEFAULT 'Oleksii Nefedov'::character varying,
    assignee character varying(50),
    test_type character varying(20) DEFAULT 'Manual'::character varying,
    case_id integer,
    CONSTRAINT bug_reports_priority_check CHECK (((priority)::text = ANY ((ARRAY['Low'::character varying, 'Medium'::character varying, 'High'::character varying])::text[]))),
    CONSTRAINT bug_reports_severity_check CHECK (((severity)::text = ANY ((ARRAY['Trivial'::character varying, 'Minor'::character varying, 'Major'::character varying, 'Critical'::character varying, 'Blocker'::character varying])::text[]))),
    CONSTRAINT bug_reports_status_check CHECK (((status)::text = ANY ((ARRAY['New'::character varying, 'Open'::character varying, 'Assigned'::character varying, 'In Progress'::character varying, 'Fixed'::character varying, 'Retest'::character varying, 'Closed'::character varying, 'Reopened'::character varying])::text[]))),
    CONSTRAINT bug_reports_test_type_check CHECK (((test_type)::text = ANY ((ARRAY['Manual'::character varying, 'Automated'::character varying])::text[])))
);


--
-- TOC entry 219 (class 1259 OID 16615)
-- Name: bug_reports_bug_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bug_reports_bug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 219
-- Name: bug_reports_bug_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bug_reports_bug_id_seq OWNED BY public.bug_reports.bug_id;


--
-- TOC entry 222 (class 1259 OID 16685)
-- Name: test_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_cases (
    case_id integer NOT NULL,
    case_title character varying(150) NOT NULL,
    test_priority character varying(20) NOT NULL,
    precondition text,
    test_steps text NOT NULL,
    expected_result text NOT NULL,
    postcondition text,
    test_status character varying(20) NOT NULL,
    CONSTRAINT test_cases_priority_check CHECK (((test_priority)::text = ANY ((ARRAY['Low'::character varying, 'Medium'::character varying, 'High'::character varying, 'Critical'::character varying])::text[]))),
    CONSTRAINT test_cases_status_check CHECK (((test_status)::text = ANY ((ARRAY['Passed'::character varying, 'Failed'::character varying])::text[])))
);


--
-- TOC entry 221 (class 1259 OID 16684)
-- Name: test_cases_case_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.test_cases ALTER COLUMN case_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.test_cases_case_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4760 (class 2604 OID 16619)
-- Name: bug_reports bug_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bug_reports ALTER COLUMN bug_id SET DEFAULT nextval('public.bug_reports_bug_id_seq'::regclass);


--
-- TOC entry 4772 (class 2606 OID 16633)
-- Name: bug_reports bug_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bug_reports
    ADD CONSTRAINT bug_reports_pkey PRIMARY KEY (bug_id);


--
-- TOC entry 4780 (class 2606 OID 16699)
-- Name: test_cases test_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_cases
    ADD CONSTRAINT test_cases_pkey PRIMARY KEY (case_id);


--
-- TOC entry 4773 (class 1259 OID 16679)
-- Name: idx_bug_reports_assignee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bug_reports_assignee ON public.bug_reports USING btree (assignee);


--
-- TOC entry 4774 (class 1259 OID 16682)
-- Name: idx_bug_reports_case_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bug_reports_case_id ON public.bug_reports USING btree (case_id);


--
-- TOC entry 4775 (class 1259 OID 16681)
-- Name: idx_bug_reports_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bug_reports_created_at ON public.bug_reports USING btree (created_at DESC);


--
-- TOC entry 4776 (class 1259 OID 16680)
-- Name: idx_bug_reports_priority_severity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bug_reports_priority_severity ON public.bug_reports USING btree (priority, severity);


--
-- TOC entry 4777 (class 1259 OID 16678)
-- Name: idx_bug_reports_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bug_reports_status ON public.bug_reports USING btree (status);


--
-- TOC entry 4778 (class 1259 OID 16683)
-- Name: idx_bug_reports_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bug_reports_title ON public.bug_reports USING btree (title);


--
-- TOC entry 4781 (class 2606 OID 16702)
-- Name: bug_reports fk_bug_to_cases; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bug_reports
    ADD CONSTRAINT fk_bug_to_cases FOREIGN KEY (case_id) REFERENCES public.test_cases(case_id);


-- Completed on 2026-03-13 09:28:35

--
-- PostgreSQL database dump complete
--

\unrestrict ShQge7gRND1J3UYFTu2f5phbsm4rPXujFWNtMDaPpeR1OvUl3TAse6Lid86nF4L

