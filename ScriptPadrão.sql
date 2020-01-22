--2020-01-21---
CREATE TABLE public.user (
	cod_user int8 not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    birth date without time zone not null,
    sex character varying(1) not null,
    photo bytea null,
    email varchar(50) not null,
    date_insert timestamp without time zone not null,
    password character varying not null,
	CONSTRAINT pk_user PRIMARY KEY (cod_user)	
);

create sequence public.user_seq;

create table public.chat (
	cod_chat int8 not null,
	cod_user_me int8 not null,
	last_acess_me timestamp without time zone not null,
	cod_user_you int8 not null,
	last_acess_you timestamp without time zone not null,
	date_insert timestamp without time zone not null,
	CONSTRAINT pk_chat PRIMARY KEY (cod_chat),
	CONSTRAINT fk_chat_cod_user_me FOREIGN KEY (cod_user_me) REFERENCES public.user(cod_user),
	CONSTRAINT fk_chat_cod_user_you FOREIGN KEY (cod_user_you) REFERENCES public.user(cod_user),
);

create sequence public.chat_seq;

create table public.message (
	cod_message int8 not null,
	cod_chat int8 not null,
	cod_user int8 not null,
	status character varying(1) not null, -- E -> Enviada, R -> Recebida, L -> Lida
	date_insert timestamp without time zone not null,
	message character varying not null,
	CONSTRAINT pk_message PRIMARY KEY (cod_message),
	CONSTRAINT fk_message_cod_chat FOREIGN KEY (cod_chat) REFERENCES public.chat(cod_chat),
	CONSTRAINT fk_message_cod_user FOREIGN KEY (cod_user) REFERENCES public.user(cod_user),
);

create sequence public.message_seq;
