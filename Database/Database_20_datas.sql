PGDMP     4    &                {            Library Management System    15.2    15.2 1    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16398    Library Management System    DATABASE     �   CREATE DATABASE "Library Management System" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Vietnamese_Vietnam.1258';
 +   DROP DATABASE "Library Management System";
                postgres    false            �            1259    16421    author    TABLE     �   CREATE TABLE public.author (
    id integer NOT NULL,
    first_name character varying(300),
    last_name character varying(300),
    description character varying(300)
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
            public          postgres    false    215            �            1259    16411    book    TABLE     �   CREATE TABLE public.book (
    id integer NOT NULL,
    title character varying(50),
    publication_date date,
    copies_owned integer,
    description character varying(300),
    category character varying(255),
    image character varying(500)
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
            public          postgres    false    214            �            1259    16498    fine    TABLE     x   CREATE TABLE public.fine (
    id integer NOT NULL,
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
            public          postgres    false    221            �            1259    16473    fine_payment    TABLE     �   CREATE TABLE public.fine_payment (
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
            public          postgres    false    219            �            1259    16483    loan    TABLE     �   CREATE TABLE public.loan (
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
            public          postgres    false    220            �            1259    16446    member    TABLE       CREATE TABLE public.member (
    id integer NOT NULL,
    first_name character varying(300),
    last_name character varying(300),
    joined_date date,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    status character varying(255)
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
            public          postgres    false    217            �            1259    16458    reservation    TABLE     �   CREATE TABLE public.reservation (
    id integer NOT NULL,
    book_id integer,
    member_id integer,
    reservation_date date,
    status character varying(255)
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
            public          postgres    false    218            ,          0    16421    author 
   TABLE DATA           H   COPY public.author (id, first_name, last_name, description) FROM stdin;
    public          postgres    false    215   ;7       +          0    16411    book 
   TABLE DATA           g   COPY public.book (id, title, publication_date, copies_owned, description, category, image) FROM stdin;
    public          postgres    false    214   �8       -          0    16428    book_author 
   TABLE DATA           9   COPY public.book_author (book_id, author_id) FROM stdin;
    public          postgres    false    216   =       2          0    16498    fine 
   TABLE DATA           C   COPY public.fine (id, loan_id, fine_date, fine_amount) FROM stdin;
    public          postgres    false    221   p=       0          0    16473    fine_payment 
   TABLE DATA           S   COPY public.fine_payment (id, member_id, payment_date, payment_amount) FROM stdin;
    public          postgres    false    219   />       1          0    16483    loan 
   TABLE DATA           P   COPY public.loan (id, book_id, member_id, loan_date, returned_date) FROM stdin;
    public          postgres    false    220   �>       .          0    16446    member 
   TABLE DATA           d   COPY public.member (id, first_name, last_name, joined_date, username, password, status) FROM stdin;
    public          postgres    false    217   �?       /          0    16458    reservation 
   TABLE DATA           W   COPY public.reservation (id, book_id, member_id, reservation_date, status) FROM stdin;
    public          postgres    false    218   uB       @           0    0    author_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.author_id_seq', 20, true);
          public          postgres    false    222            A           0    0    book_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.book_id_seq', 20, true);
          public          postgres    false    223            B           0    0    fine_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.fine_id_seq', 20, true);
          public          postgres    false    224            C           0    0    fine_payment_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.fine_payment_id_seq', 39, true);
          public          postgres    false    225            D           0    0    loan_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.loan_id_seq', 21, true);
          public          postgres    false    226            E           0    0    member_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.member_id_seq', 20, true);
          public          postgres    false    227            F           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);
          public          postgres    false    228            �           2606    16427    author pk_author 
   CONSTRAINT     N   ALTER TABLE ONLY public.author
    ADD CONSTRAINT pk_author PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT pk_author;
       public            postgres    false    215            �           2606    16415    book pk_book 
   CONSTRAINT     J   ALTER TABLE ONLY public.book
    ADD CONSTRAINT pk_book PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.book DROP CONSTRAINT pk_book;
       public            postgres    false    214            �           2606    16502    fine pk_fine 
   CONSTRAINT     J   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT pk_fine PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.fine DROP CONSTRAINT pk_fine;
       public            postgres    false    221            �           2606    16477    fine_payment pk_fine_payment 
   CONSTRAINT     Z   ALTER TABLE ONLY public.fine_payment
    ADD CONSTRAINT pk_fine_payment PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.fine_payment DROP CONSTRAINT pk_fine_payment;
       public            postgres    false    219            �           2606    16487    loan pk_loan 
   CONSTRAINT     J   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT pk_loan PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.loan DROP CONSTRAINT pk_loan;
       public            postgres    false    220            �           2606    16452    member pk_member 
   CONSTRAINT     N   ALTER TABLE ONLY public.member
    ADD CONSTRAINT pk_member PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.member DROP CONSTRAINT pk_member;
       public            postgres    false    217            �           2606    16462    reservation pk_reservation 
   CONSTRAINT     X   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT pk_reservation PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.reservation DROP CONSTRAINT pk_reservation;
       public            postgres    false    218            �           2606    16436     book_author fk_bookauthor_author    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES public.author(id);
 J   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_bookauthor_author;
       public          postgres    false    216    3210    215            �           2606    24630    book_author fk_bookauthor_book    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES public.book(id) NOT VALID;
 H   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_bookauthor_book;
       public          postgres    false    214    3208    216            �           2606    16508    fine fk_fine_loan    FK CONSTRAINT     o   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fk_fine_loan FOREIGN KEY (loan_id) REFERENCES public.loan(id);
 ;   ALTER TABLE ONLY public.fine DROP CONSTRAINT fk_fine_loan;
       public          postgres    false    221    220    3218            �           2606    16478    fine_payment fk_finepay_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.fine_payment
    ADD CONSTRAINT fk_finepay_member FOREIGN KEY (member_id) REFERENCES public.member(id);
 H   ALTER TABLE ONLY public.fine_payment DROP CONSTRAINT fk_finepay_member;
       public          postgres    false    3212    217    219            �           2606    16488    loan fk_loan_book    FK CONSTRAINT     o   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES public.book(id);
 ;   ALTER TABLE ONLY public.loan DROP CONSTRAINT fk_loan_book;
       public          postgres    false    220    3208    214            �           2606    16493    loan fk_loan_member    FK CONSTRAINT     u   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES public.member(id);
 =   ALTER TABLE ONLY public.loan DROP CONSTRAINT fk_loan_member;
       public          postgres    false    220    3212    217            �           2606    16463    reservation fk_res_book    FK CONSTRAINT     u   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES public.book(id);
 A   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fk_res_book;
       public          postgres    false    3208    214    218            �           2606    16468    reservation fk_res_member    FK CONSTRAINT     {   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_member FOREIGN KEY (member_id) REFERENCES public.member(id);
 C   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fk_res_member;
       public          postgres    false    3212    217    218            ,   �  x�%�Mn1���)|�	:��Ұ������n��g�6�hPT���˩7$���{la�y��b^������/�(,�q����V�4�4-/�<�����G^l\b��ׄj�
�J{����߳Q�<P�p*�8D*&P���:�J��#��k���ۜ���d��^�`�L�j��T.�rdk���B}�sz"��?�FkL"���{XKI�n]U'����5���/N�bB	�����	;;��ֱr�t��;��ƈ3^h��J7"<�8�	j�h
�%�Թu�
4���Ɓ
�����Yb����̳o��^Ö==O�'Ǟ&/r�C��ߎ��,�p�=L9��$QvK��[X��ȝ����~ 8)w��)���{{O���q��%�����u����Wξ�F�ɉ���}L�2uT�Y�ἰ_!���н      +     x��VMo�6<?�
��*�hK�{��.���]$ƶ�^h�Y""�I9q��GY�&�0�� ͼy3�$�V^j���\D<�f2�J���6Limvҫ���^�.s��~����/w��:G��o�N��i���%^䦙�K�s~��r�l�(��?�V�y��7��l]��@D����3u��3���^�2¢D�J�5ZW����ɻ��v?Fb!N$��9�#�n;���`�so6h�t��(H�,-��#	��ʼW�O�\;��Y|YWV�5�1Nqz��Α�V����i	�Ive��{>���#�!��R7Fڂ��t�&�1��#KN�E��?�%�T�ȶ�4�W�֦��.�<�q$�0K���a���!�m�M������7���sap����A�8��%$�2W5��i3F���:Ɠ���|��?`�A���ɣ.��W��Y#��i�gc�	����i����/G?X���oa�e��)�)�vm�7n��.b��2�o�BK���*�=Շ�'0��W���J\���ţ*|u\�U��s��مgc.���h8�SIsb"����򝬃ey�fd����Դ�w%x���I� %���:KP�rc;�@Qr��=������%��aOi_M)$�.8�#�q#���)_{�=z5��ޢfwF�)H�E$!u�w��f-�Q�.�UA�]*>��	�
z��~"���
�����Ӡ#�k�=Ww�gcFX�.��ތ�(5�M�)�a�L�֏���%�1,aeh&j��>*���g@Z�=�b�/�� �o��ڡ�������<v�.R�M
p$q�=k���=�8]�mn��{��n�^X��`���OrR��pkH���$wև�N,G@���=ԁ�.�;����A�#��6���5�ʩ�NW�WI���)/������;N��g�eHM�K������$vK�o�Wd�
}�a��������Q�l,�s�BI��v5�����6x,�Qg�&���:�h�9�ѹ��{.Z"��ߋ�d���7�      -   S   x����0�PL��:�^���a�D�qc��T!(��m*a�1gK�=ܠwR-��wl�T���~ߩ����<w����C����      2   �   x�E���!C�v/�H� �l�u|�0�	��sl�^�Y��tXy�,�1�z%�qEe����l�)�TlEō����aq�*T���l�zp��``6Jx�]��UBl^��ʧ���Z�ja���+�V1�{Ž�H^P��dK]�t]Y����~�t^�a��f�|�&�����>�      0   �   x�U��m1C�d/DI�����f��"�/&D�I���Ѥ��dj6���l5scB�H�EgG�7w��8A�T�BNN��p��V n��E��^��������Q��+�T>}���`�yQ���N��a��Zf�1KDIy��3�`b��VQ`���a{�}�U[f�Ԑ������=R      1   �   x�]R[�� �&{q�{����F�:wN��D������zNf��-]����_�'V��ٱ�-�ؠzҎ*V$o�4�}�44"�֘�`GkRvGKr��%�bߢ(Y��|��<e�j����b^�0{g���{��/��b5f�5EY2�y�jĤS�1�$�ݘ�I� {\o{VƁ�D��2��w-�Z�^hLS~M��N���5��p��'��B�(D�rs�o�^���@Db�      .   y  x�M��r�0E����0��с�3�I̤�"�FV�%"/,_?^B��캾G��j��J	Oa]�M�3X�eMS=Pjݴ�Ơ?>���%M�w��%,M�k�[�Rn"A�gI�3�yJ��oxڟ��u�qT��I�NS�h
�م7$T����VÇ�o��2���H\��P�,aa�Y�8-ծm��辗]�g����Z���+�I���V�2m4�%����6�����P^��J(6��w6�_Z�x��o�@REqxE��,�2ݡ�@.͇����1��3�#�)���|ݚ�9����:9U������MX)�n���"��gӃ,'q|U	���(����qK�*&xl;�&Ā,���֮��u���Qm��9�d���k;�h1,C�=�~<�n0gα,^�(�8{�:�&z9��6|7���ta�<QQ�iOC��꺬K�M����z�+E�rS�Hd�#�wWi�±��~�����T�fB$	9���o�h�̾mn�z}�><���Dr����ō���swv���Mh !�z$'2�n����no�2�8c��P�-k<�	,���Z�y�}�M7���Q�����^H�      /   -   x�3�4�4�4202�54�52���2�4�BČt�@b1z\\\ �P     