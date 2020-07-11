-- SEQUENCE: public.natureservice_id_seq

DROP SEQUENCE public.natureservice_id_seq CASCADE;

CREATE SEQUENCE public.natureservice_id_seq
	INCREMENT 1
	START 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1;

ALTER SEQUENCE public.natureservice_id_seq
	OWNER TO postgres;

-- SEQUENCE: public.utilisateur_codeutilisateur_seq

DROP SEQUENCE public.utilisateur_codeutilisateur_seq CASCADE;

CREATE SEQUENCE public.utilisateur_codeutilisateur_seq
	INCREMENT 1
	START 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1;

ALTER SEQUENCE public.utilisateur_codeutilisateur_seq
	OWNER TO postgres;

-- SEQUENCE: public.service_id_seq

DROP SEQUENCE public.service_id_seq CASCADE;

CREATE SEQUENCE public.service_id_seq
	INCREMENT 1
	START 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1;

ALTER SEQUENCE public.service_id_seq
	OWNER TO postgres;

-- SEQUENCE: public.notification_id_seq

DROP SEQUENCE public.notification_id_seq CASCADE;

CREATE SEQUENCE public.notification_id_seq
	INCREMENT 1
	START 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1;

ALTER SEQUENCE public.notification_id_seq
	OWNER TO postgres;

-- Table: public.natureservice

DROP TABLE public.natureservice CASCADE;

CREATE TABLE public.natureservice
(
	id integer NOT NULL DEFAULT nextval('natureservice_id_seq'::regclass),
	description character varying(255) COLLATE pg_catalog."default",
	CONSTRAINT natureservice_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.natureservice
	OWNER to postgres;

-- Table: public.utilisateur

DROP TABLE public.utilisateur CASCADE;

CREATE TABLE public.utilisateur
(
	codeutilisateur integer NOT NULL DEFAULT nextval('utilisateur_codeutilisateur_seq'::regclass),
	adresse character varying(255) COLLATE pg_catalog."default",
	datenaissance date,
	description character varying(255) COLLATE pg_catalog."default",
	email character varying(255) COLLATE pg_catalog."default",
	estadmin boolean,
	login character varying(255) COLLATE pg_catalog."default",
	mdp character varying(255) COLLATE pg_catalog."default",
	nom character varying(255) COLLATE pg_catalog."default",
	prenom character varying(255) COLLATE pg_catalog."default",
	sexe character varying(255) COLLATE pg_catalog."default",
	tel character varying(255) COLLATE pg_catalog."default",
	CONSTRAINT utilisateur_pkey PRIMARY KEY (codeutilisateur)
)

TABLESPACE pg_default;

ALTER TABLE public.utilisateur
	OWNER to postgres;

-- Table: public.service

DROP TABLE public.service CASCADE;

CREATE TABLE public.service
(
	id integer NOT NULL DEFAULT nextval('service_id_seq'::regclass),
	courtedescription character varying(255) COLLATE pg_catalog."default",
	datedebut date,
	datefin date,
	etat character varying(255) COLLATE pg_catalog."default",
	localisation character varying(255) COLLATE pg_catalog."default",
	longuedescription character varying(255) COLLATE pg_catalog."default",
	offreservice character varying(255) COLLATE pg_catalog."default",
	typeservice character varying(255) COLLATE pg_catalog."default",
	demandeuser_codeutilisateur bigint,
	offreuser_codeutilisateur bigint,
	natureservice_id bigint,
	CONSTRAINT service_pkey PRIMARY KEY (id),
	CONSTRAINT fk_service_demandeuser_codeutilisateur FOREIGN KEY (demandeuser_codeutilisateur)
		REFERENCES public.utilisateur (codeutilisateur) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID,
	CONSTRAINT fk_service_natureservice_id FOREIGN KEY (natureservice_id)
		REFERENCES public.natureservice (id) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID,
	CONSTRAINT fk_service_offreuser_codeutilisateur FOREIGN KEY (offreuser_codeutilisateur)
		REFERENCES public.utilisateur (codeutilisateur) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.service
	OWNER to postgres;

-- Table: public.notification

DROP TABLE public.notification CASCADE;

CREATE TABLE public.notification
(
	id integer NOT NULL DEFAULT nextval('notification_id_seq'::regclass),
	datenotif date,
	estlu boolean,
	message character varying(255) COLLATE pg_catalog."default",
	emetteur_codeutilisateur bigint,
	recepteur_codeutilisateur bigint,
	service_id bigint,
	CONSTRAINT notification_pkey PRIMARY KEY (id),
	CONSTRAINT fk_notification_emetteur_codeutilisateur FOREIGN KEY (emetteur_codeutilisateur)
		REFERENCES public.utilisateur (codeutilisateur) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID,
	CONSTRAINT fk_notification_recepteur_codeutilisateur FOREIGN KEY (recepteur_codeutilisateur)
		REFERENCES public.utilisateur (codeutilisateur) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID,
	CONSTRAINT fk_notification_service_id FOREIGN KEY (service_id)
		REFERENCES public.service (id) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.notification
	OWNER to postgres;