PGDMP                         {            Library Management System    15.2    15.2 C    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    16398    Library Management System    DATABASE     �   CREATE DATABASE "Library Management System" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Vietnamese_Vietnam.1258';
 +   DROP DATABASE "Library Management System";
                postgres    false            �            1259    16421    author    TABLE     �   CREATE TABLE public.author (
    id integer NOT NULL,
    first_name character varying(300),
    last_name character varying(300)
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    24620    author_id_seq    SEQUENCE     �   ALTER TABLE public.author ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16411    book    TABLE     �   CREATE TABLE public.book (
    id integer NOT NULL,
    title character varying(50),
    category_id integer,
    publication_date date,
    copies_owned integer,
    image bytea
);
    DROP TABLE public.book;
       public         heap    postgres    false            �            1259    16428    book_author    TABLE     P   CREATE TABLE public.book_author (
    book_id integer,
    author_id integer
);
    DROP TABLE public.book_author;
       public         heap    postgres    false            �            1259    24621    book_id_seq    SEQUENCE     �   ALTER TABLE public.book ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16406    category    TABLE     d   CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying(100)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24622    category_id_seq    SEQUENCE     �   ALTER TABLE public.category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16498    fine    TABLE     �   CREATE TABLE public.fine (
    id integer NOT NULL,
    book_id integer,
    loan_id integer,
    fine_date date,
    fine_amount integer
);
    DROP TABLE public.fine;
       public         heap    postgres    false            �            1259    24623    fine_id_seq    SEQUENCE     �   ALTER TABLE public.fine ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16473    fine_payment    TABLE     �   CREATE TABLE public.fine_payment (
    id integer NOT NULL,
    member_id integer,
    payment_date date,
    payment_amount integer
);
     DROP TABLE public.fine_payment;
       public         heap    postgres    false            �            1259    24624    fine_payment_id_seq    SEQUENCE     �   ALTER TABLE public.fine_payment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fine_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16483    loan    TABLE     �   CREATE TABLE public.loan (
    id integer NOT NULL,
    book_id integer,
    member_id integer,
    loan_date date,
    returned_date date
);
    DROP TABLE public.loan;
       public         heap    postgres    false            �            1259    24625    loan_id_seq    SEQUENCE     �   ALTER TABLE public.loan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.loan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16446    member    TABLE       CREATE TABLE public.member (
    id integer NOT NULL,
    first_name character varying(300),
    last_name character varying(300),
    joined_date date,
    active_status_id integer,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.member;
       public         heap    postgres    false            �            1259    24626    member_id_seq    SEQUENCE     �   ALTER TABLE public.member ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16441    member_status    TABLE     g   CREATE TABLE public.member_status (
    id integer NOT NULL,
    status_value character varying(50)
);
 !   DROP TABLE public.member_status;
       public         heap    postgres    false            �            1259    24627    member_status_id_seq    SEQUENCE     �   ALTER TABLE public.member_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.member_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16458    reservation    TABLE     �   CREATE TABLE public.reservation (
    id integer NOT NULL,
    book_id integer,
    member_id integer,
    reservation_date date,
    reservation_status_id integer
);
    DROP TABLE public.reservation;
       public         heap    postgres    false            �            1259    24628    reservation_id_seq    SEQUENCE     �   ALTER TABLE public.reservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16399    reservation_status    TABLE     l   CREATE TABLE public.reservation_status (
    id integer NOT NULL,
    status_value character varying(50)
);
 &   DROP TABLE public.reservation_status;
       public         heap    postgres    false            �            1259    24629    reservation_status_id_seq    SEQUENCE     �   ALTER TABLE public.reservation_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            F          0    16421    author 
   TABLE DATA           ;   COPY public.author (id, first_name, last_name) FROM stdin;
    public          postgres    false    217   MK       E          0    16411    book 
   TABLE DATA           ]   COPY public.book (id, title, category_id, publication_date, copies_owned, image) FROM stdin;
    public          postgres    false    216   �K       G          0    16428    book_author 
   TABLE DATA           9   COPY public.book_author (book_id, author_id) FROM stdin;
    public          postgres    false    218   =L       D          0    16406    category 
   TABLE DATA           5   COPY public.category (id, category_name) FROM stdin;
    public          postgres    false    215   jL       M          0    16498    fine 
   TABLE DATA           L   COPY public.fine (id, book_id, loan_id, fine_date, fine_amount) FROM stdin;
    public          postgres    false    224   �L       K          0    16473    fine_payment 
   TABLE DATA           S   COPY public.fine_payment (id, member_id, payment_date, payment_amount) FROM stdin;
    public          postgres    false    222   �L       L          0    16483    loan 
   TABLE DATA           P   COPY public.loan (id, book_id, member_id, loan_date, returned_date) FROM stdin;
    public          postgres    false    223   M       I          0    16446    member 
   TABLE DATA           n   COPY public.member (id, first_name, last_name, joined_date, active_status_id, username, password) FROM stdin;
    public          postgres    false    220   @M       H          0    16441    member_status 
   TABLE DATA           9   COPY public.member_status (id, status_value) FROM stdin;
    public          postgres    false    219   �M       J          0    16458    reservation 
   TABLE DATA           f   COPY public.reservation (id, book_id, member_id, reservation_date, reservation_status_id) FROM stdin;
    public          postgres    false    221   N       C          0    16399    reservation_status 
   TABLE DATA           >   COPY public.reservation_status (id, status_value) FROM stdin;
    public          postgres    false    214   =N       ^           0    0    author_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.author_id_seq', 1, false);
          public          postgres    false    225            _           0    0    book_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.book_id_seq', 1, false);
          public          postgres    false    226            `           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    227            a           0    0    fine_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.fine_id_seq', 1, false);
          public          postgres    false    228            b           0    0    fine_payment_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.fine_payment_id_seq', 1, false);
          public          postgres    false    229            c           0    0    loan_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.loan_id_seq', 1, false);
          public          postgres    false    230            d           0    0    member_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.member_id_seq', 1, false);
          public          postgres    false    231            e           0    0    member_status_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.member_status_id_seq', 1, false);
          public          postgres    false    232            f           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);
          public          postgres    false    233            g           0    0    reservation_status_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.reservation_status_id_seq', 1, false);
          public          postgres    false    234            �           2606    16427    author pk_author 
   CONSTRAINT     N   ALTER TABLE ONLY public.author
    ADD CONSTRAINT pk_author PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT pk_author;
       public            postgres    false    217            �           2606    16415    book pk_book 
   CONSTRAINT     J   ALTER TABLE ONLY public.book
    ADD CONSTRAINT pk_book PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.book DROP CONSTRAINT pk_book;
       public            postgres    false    216            �           2606    16410    category pk_category 
   CONSTRAINT     R   ALTER TABLE ONLY public.category
    ADD CONSTRAINT pk_category PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.category DROP CONSTRAINT pk_category;
       public            postgres    false    215            �           2606    16502    fine pk_fine 
   CONSTRAINT     J   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT pk_fine PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.fine DROP CONSTRAINT pk_fine;
       public            postgres    false    224            �           2606    16477    fine_payment pk_fine_payment 
   CONSTRAINT     Z   ALTER TABLE ONLY public.fine_payment
    ADD CONSTRAINT pk_fine_payment PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.fine_payment DROP CONSTRAINT pk_fine_payment;
       public            postgres    false    222            �           2606    16487    loan pk_loan 
   CONSTRAINT     J   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT pk_loan PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.loan DROP CONSTRAINT pk_loan;
       public            postgres    false    223            �           2606    16452    member pk_member 
   CONSTRAINT     N   ALTER TABLE ONLY public.member
    ADD CONSTRAINT pk_member PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.member DROP CONSTRAINT pk_member;
       public            postgres    false    220            �           2606    16445    member_status pk_member_status 
   CONSTRAINT     \   ALTER TABLE ONLY public.member_status
    ADD CONSTRAINT pk_member_status PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.member_status DROP CONSTRAINT pk_member_status;
       public            postgres    false    219            �           2606    16405     reservation_status pk_res_status 
   CONSTRAINT     ^   ALTER TABLE ONLY public.reservation_status
    ADD CONSTRAINT pk_res_status PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.reservation_status DROP CONSTRAINT pk_res_status;
       public            postgres    false    214            �           2606    16462    reservation pk_reservation 
   CONSTRAINT     X   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT pk_reservation PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.reservation DROP CONSTRAINT pk_reservation;
       public            postgres    false    221            �           2606    16416    book fk_book_category    FK CONSTRAINT     {   ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES public.category(id);
 ?   ALTER TABLE ONLY public.book DROP CONSTRAINT fk_book_category;
       public          postgres    false    215    216    3225            �           2606    16436     book_author fk_bookauthor_author    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES public.author(id);
 J   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_bookauthor_author;
       public          postgres    false    217    3229    218            �           2606    16431    book_author fk_bookauthor_book    FK CONSTRAINT     ~   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES public.author(id);
 H   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_bookauthor_book;
       public          postgres    false    217    218    3229            �           2606    16508    fine fk_fine_loan    FK CONSTRAINT     o   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fk_fine_loan FOREIGN KEY (loan_id) REFERENCES public.loan(id);
 ;   ALTER TABLE ONLY public.fine DROP CONSTRAINT fk_fine_loan;
       public          postgres    false    224    223    3239            �           2606    16478    fine_payment fk_finepay_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.fine_payment
    ADD CONSTRAINT fk_finepay_member FOREIGN KEY (member_id) REFERENCES public.member(id);
 H   ALTER TABLE ONLY public.fine_payment DROP CONSTRAINT fk_finepay_member;
       public          postgres    false    3233    220    222            �           2606    16488    loan fk_loan_book    FK CONSTRAINT     o   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES public.book(id);
 ;   ALTER TABLE ONLY public.loan DROP CONSTRAINT fk_loan_book;
       public          postgres    false    216    3227    223            �           2606    16503    fine fk_loan_book    FK CONSTRAINT     o   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES public.book(id);
 ;   ALTER TABLE ONLY public.fine DROP CONSTRAINT fk_loan_book;
       public          postgres    false    216    3227    224            �           2606    16493    loan fk_loan_member    FK CONSTRAINT     u   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES public.member(id);
 =   ALTER TABLE ONLY public.loan DROP CONSTRAINT fk_loan_member;
       public          postgres    false    3233    220    223            �           2606    16453    member fk_member_status    FK CONSTRAINT     �   ALTER TABLE ONLY public.member
    ADD CONSTRAINT fk_member_status FOREIGN KEY (active_status_id) REFERENCES public.member_status(id);
 A   ALTER TABLE ONLY public.member DROP CONSTRAINT fk_member_status;
       public          postgres    false    3231    220    219            �           2606    16463    reservation fk_res_book    FK CONSTRAINT     u   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES public.book(id);
 A   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fk_res_book;
       public          postgres    false    221    216    3227            �           2606    16468    reservation fk_res_member    FK CONSTRAINT     {   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_member FOREIGN KEY (member_id) REFERENCES public.member(id);
 C   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fk_res_member;
       public          postgres    false    220    221    3233            F   I   x�3������)J�S,M�K�2����O��K/�2��O����Tp�RK��2�+�(��K��qqq 3(      E   �   x��M
� ��x
/`��'�B�ل iM���>3������,<|)�̵��j8$'̓"�B+y��ŀ���Π� � C��/��G�i�e��_p�{4x>����=�V�Ҿz��;p+;^�Ȫ8'n>)�vʺ(?      G      x�3�4�2�4�2�4�2�4����� ��      D   .   x�3�tK�+I,��2�t�LJ-R(���2�N�L�KN����� �`
�      M      x�3�4B##c]CC]CNC�=... 1��      K      x�3�4�4202�54�5��44������ +�}      L   *   x�3�4B##c]CC]C#8�Ȁ��	!�@r1z\\\ /�	�      I   �   x�5��
�0Dg�+�-���,)�������C��V���:�{���Q�\v������,!��VXR~oT�Y�V�����Ɗ,�웸[������b+���X_i/̥�cߣm�	>����H0�      H      x�3�tL.�,K�2���K�0c���� ^�      J   ,   x�3�4�4�4202�54�52�4�2�4
B��t��B1z\\\ �7^      C      x�3�L-�2�������� 2      