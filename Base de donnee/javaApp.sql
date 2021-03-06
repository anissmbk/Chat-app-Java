PGDMP                         v            JavaApp    9.5.14    9.5.14 1    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16394    JavaApp    DATABASE     {   CREATE DATABASE "JavaApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'fr_FR.UTF-8' LC_CTYPE = 'fr_FR.UTF-8';
    DROP DATABASE "JavaApp";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12403    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16543    user    TABLE       CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50),
    password character varying(50),
    email character varying(50),
    nom character varying(50),
    sexe boolean,
    photo character varying(500),
    birth date
);
    DROP TABLE public."user";
       public         postgres    false    6            �            1259    16541    User_id_seq    SEQUENCE     v   CREATE SEQUENCE public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public       postgres    false    182    6            �           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."user".id;
            public       postgres    false    181            �            1259    16560    friend    TABLE     ^   CREATE TABLE public.friend (
    id integer NOT NULL,
    user1 integer,
    user2 integer
);
    DROP TABLE public.friend;
       public         postgres    false    6            �            1259    16558    friend_id_seq    SEQUENCE     v   CREATE SEQUENCE public.friend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.friend_id_seq;
       public       postgres    false    184    6            �           0    0    friend_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.friend_id_seq OWNED BY public.friend.id;
            public       postgres    false    183            �            1259    16580    invited    TABLE     s   CREATE TABLE public.invited (
    id integer NOT NULL,
    "from" integer,
    "to" integer,
    status boolean
);
    DROP TABLE public.invited;
       public         postgres    false    6            �            1259    16578    invited_id_seq    SEQUENCE     w   CREATE SEQUENCE public.invited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.invited_id_seq;
       public       postgres    false    186    6            �           0    0    invited_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.invited_id_seq OWNED BY public.invited.id;
            public       postgres    false    185            �            1259    16610    message    TABLE     �   CREATE TABLE public.message (
    id integer NOT NULL,
    "from" integer,
    "to" integer,
    message character varying(255)
);
    DROP TABLE public.message;
       public         postgres    false    6            �            1259    16608    message_id_seq    SEQUENCE     w   CREATE SEQUENCE public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.message_id_seq;
       public       postgres    false    188    6            �           0    0    message_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;
            public       postgres    false    187            �           2604    16563    id    DEFAULT     f   ALTER TABLE ONLY public.friend ALTER COLUMN id SET DEFAULT nextval('public.friend_id_seq'::regclass);
 8   ALTER TABLE public.friend ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    184    184                        2604    16583    id    DEFAULT     h   ALTER TABLE ONLY public.invited ALTER COLUMN id SET DEFAULT nextval('public.invited_id_seq'::regclass);
 9   ALTER TABLE public.invited ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185    186                       2604    16613    id    DEFAULT     h   ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);
 9   ALTER TABLE public.message ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187    188            �           2604    16546    id    DEFAULT     f   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    181    182    182            �           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 2, true);
            public       postgres    false    181            �          0    16560    friend 
   TABLE DATA               2   COPY public.friend (id, user1, user2) FROM stdin;
    public       postgres    false    184   �0       �           0    0    friend_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.friend_id_seq', 1, false);
            public       postgres    false    183            �          0    16580    invited 
   TABLE DATA               ;   COPY public.invited (id, "from", "to", status) FROM stdin;
    public       postgres    false    186   �0       �           0    0    invited_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.invited_id_seq', 1, false);
            public       postgres    false    185            �          0    16610    message 
   TABLE DATA               <   COPY public.message (id, "from", "to", message) FROM stdin;
    public       postgres    false    188   �0       �           0    0    message_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.message_id_seq', 1, false);
            public       postgres    false    187            �          0    16543    user 
   TABLE DATA               X   COPY public."user" (id, username, password, email, nom, sexe, photo, birth) FROM stdin;
    public       postgres    false    182   �0                  2606    16565    friend_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT friend_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.friend DROP CONSTRAINT friend_pkey;
       public         postgres    false    184    184                       2606    16585    invited_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.invited
    ADD CONSTRAINT invited_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.invited DROP CONSTRAINT invited_pkey;
       public         postgres    false    186    186                       2606    16615    message_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.message DROP CONSTRAINT message_pkey;
       public         postgres    false    188    188                       2606    16557 	   user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    182    182                       1259    16601    fki_invitation1    INDEX     E   CREATE INDEX fki_invitation1 ON public.invited USING btree ("from");
 #   DROP INDEX public.fki_invitation1;
       public         postgres    false    186            	           1259    16607    fki_invitation2    INDEX     C   CREATE INDEX fki_invitation2 ON public.invited USING btree ("to");
 #   DROP INDEX public.fki_invitation2;
       public         postgres    false    186                       1259    16621    fki_messagefrom    INDEX     E   CREATE INDEX fki_messagefrom ON public.message USING btree ("from");
 #   DROP INDEX public.fki_messagefrom;
       public         postgres    false    188                       1259    16627    fki_messageto    INDEX     A   CREATE INDEX fki_messageto ON public.message USING btree ("to");
 !   DROP INDEX public.fki_messageto;
       public         postgres    false    188                       1259    16571 	   fki_user1    INDEX     =   CREATE INDEX fki_user1 ON public.friend USING btree (user1);
    DROP INDEX public.fki_user1;
       public         postgres    false    184                       1259    16577 	   fki_user2    INDEX     =   CREATE INDEX fki_user2 ON public.friend USING btree (user2);
    DROP INDEX public.fki_user2;
       public         postgres    false    184                       2606    16596    invitation1    FK CONSTRAINT     r   ALTER TABLE ONLY public.invited
    ADD CONSTRAINT invitation1 FOREIGN KEY ("from") REFERENCES public."user"(id);
 =   ALTER TABLE ONLY public.invited DROP CONSTRAINT invitation1;
       public       postgres    false    186    2051    182                       2606    16602    invitation2    FK CONSTRAINT     p   ALTER TABLE ONLY public.invited
    ADD CONSTRAINT invitation2 FOREIGN KEY ("to") REFERENCES public."user"(id);
 =   ALTER TABLE ONLY public.invited DROP CONSTRAINT invitation2;
       public       postgres    false    186    182    2051                       2606    16616    messagefrom    FK CONSTRAINT     r   ALTER TABLE ONLY public.message
    ADD CONSTRAINT messagefrom FOREIGN KEY ("from") REFERENCES public."user"(id);
 =   ALTER TABLE ONLY public.message DROP CONSTRAINT messagefrom;
       public       postgres    false    188    182    2051                       2606    16622 	   messageto    FK CONSTRAINT     n   ALTER TABLE ONLY public.message
    ADD CONSTRAINT messageto FOREIGN KEY ("to") REFERENCES public."user"(id);
 ;   ALTER TABLE ONLY public.message DROP CONSTRAINT messageto;
       public       postgres    false    188    2051    182                       2606    16566    user1    FK CONSTRAINT     j   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT user1 FOREIGN KEY (user1) REFERENCES public."user"(id);
 6   ALTER TABLE ONLY public.friend DROP CONSTRAINT user1;
       public       postgres    false    182    2051    184                       2606    16572    user2    FK CONSTRAINT     j   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT user2 FOREIGN KEY (user2) REFERENCES public."user"(id);
 6   ALTER TABLE ONLY public.friend DROP CONSTRAINT user2;
       public       postgres    false    2051    184    182            �      x������ � �      �      x������ � �      �      x������ � �      �   4   x�3��/M�́���Bs�p��p��qVed`h�k`�kh����� ���     