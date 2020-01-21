--2020-01-21---
CREATE TABLE public.user (
	cod_user int8 not null,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    birth timestamp without time zone not null,
    sex character varying(1) not null,
    photo bytea not null,
    email varchar(50) not null,
    password varchar(100) not null,
	CONSTRAINT pk_user PRIMARY KEY (cod_user)	
);