PGDMP     5                    {            webdb    15.3 (Debian 15.3-1.pgdg110+1)    15.2 ,    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            9           1262    16384    webdb    DATABASE     p   CREATE DATABASE webdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE webdb;
                postgres    false                        2615    24631    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            :           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            ;           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    24632    author    TABLE     �   CREATE TABLE public.author (
    id integer NOT NULL,
    first_name character varying(300),
    last_name character varying(300),
    description character varying(300)
);
    DROP TABLE public.author;
       public         heap    postgres    false    5            �            1259    24637    author_id_seq    SEQUENCE     �   ALTER TABLE public.author ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214    5            �            1259    24638    book    TABLE     �   CREATE TABLE public.book (
    id integer NOT NULL,
    title character varying(50),
    publication_date date,
    copies_owned integer,
    description character varying(300),
    category character varying(255),
    image character varying(500)
);
    DROP TABLE public.book;
       public         heap    postgres    false    5            �            1259    24643    book_author    TABLE     b   CREATE TABLE public.book_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
    DROP TABLE public.book_author;
       public         heap    postgres    false    5            �            1259    24646    book_id_seq    SEQUENCE     �   ALTER TABLE public.book ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216    5            �            1259    24647    fee_payment    TABLE     u   CREATE TABLE public.fee_payment (
    loan_id integer NOT NULL,
    payment_date date,
    payment_amount integer
);
    DROP TABLE public.fee_payment;
       public         heap    postgres    false    5            �            1259    24654    fine_payment_id_seq    SEQUENCE     �   ALTER TABLE public.fee_payment ALTER COLUMN loan_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fine_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219    5            �            1259    24655    loan    TABLE       CREATE TABLE public.loan (
    id integer NOT NULL,
    book_id integer NOT NULL,
    loan_date date NOT NULL,
    returned_date date,
    member_username character varying(255) NOT NULL,
    due_date date,
    fee integer DEFAULT 0,
    extent_times integer DEFAULT 0
);
    DROP TABLE public.loan;
       public         heap    postgres    false    5            �            1259    24660    loan_id_seq    SEQUENCE     �   ALTER TABLE public.loan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.loan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221    5            �            1259    24661    member    TABLE        CREATE TABLE public.member (
    first_name character varying(300),
    last_name character varying(300),
    joined_date date,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255)
);
    DROP TABLE public.member;
       public         heap    postgres    false    5            �            1259    24666    reservation    TABLE     �   CREATE TABLE public.reservation (
    id integer NOT NULL,
    book_id integer,
    reservation_date date,
    status character varying(255),
    member_username character varying(255) NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false    5            �            1259    24671    reservation_id_seq    SEQUENCE     �   ALTER TABLE public.reservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    224            (          0    24632    author 
   TABLE DATA           H   COPY public.author (id, first_name, last_name, description) FROM stdin;
    public          postgres    false    214   �1       *          0    24638    book 
   TABLE DATA           g   COPY public.book (id, title, publication_date, copies_owned, description, category, image) FROM stdin;
    public          postgres    false    216   D=       +          0    24643    book_author 
   TABLE DATA           9   COPY public.book_author (book_id, author_id) FROM stdin;
    public          postgres    false    217   �O       -          0    24647    fee_payment 
   TABLE DATA           L   COPY public.fee_payment (loan_id, payment_date, payment_amount) FROM stdin;
    public          postgres    false    219   �T       /          0    24655    loan 
   TABLE DATA           s   COPY public.loan (id, book_id, loan_date, returned_date, member_username, due_date, fee, extent_times) FROM stdin;
    public          postgres    false    221   �T       1          0    24661    member 
   TABLE DATA           _   COPY public.member (first_name, last_name, joined_date, username, password, email) FROM stdin;
    public          postgres    false    223   �T       2          0    24666    reservation 
   TABLE DATA           ]   COPY public.reservation (id, book_id, reservation_date, status, member_username) FROM stdin;
    public          postgres    false    224   �T       <           0    0    author_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.author_id_seq', 200, true);
          public          postgres    false    215            =           0    0    book_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.book_id_seq', 200, true);
          public          postgres    false    218            >           0    0    fine_payment_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.fine_payment_id_seq', 42, true);
          public          postgres    false    220            ?           0    0    loan_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.loan_id_seq', 1, false);
          public          postgres    false    222            @           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 21, true);
          public          postgres    false    225            �           2606    24674    book_author book_author_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (book_id, author_id);
 F   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_pkey;
       public            postgres    false    217    217            �           2606    24678    author pk_author 
   CONSTRAINT     N   ALTER TABLE ONLY public.author
    ADD CONSTRAINT pk_author PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT pk_author;
       public            postgres    false    214            �           2606    24680    book pk_book 
   CONSTRAINT     J   ALTER TABLE ONLY public.book
    ADD CONSTRAINT pk_book PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.book DROP CONSTRAINT pk_book;
       public            postgres    false    216            �           2606    24682    fee_payment pk_fine_payment 
   CONSTRAINT     ^   ALTER TABLE ONLY public.fee_payment
    ADD CONSTRAINT pk_fine_payment PRIMARY KEY (loan_id);
 E   ALTER TABLE ONLY public.fee_payment DROP CONSTRAINT pk_fine_payment;
       public            postgres    false    219            �           2606    24684    loan pk_loan 
   CONSTRAINT     J   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT pk_loan PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.loan DROP CONSTRAINT pk_loan;
       public            postgres    false    221            �           2606    24686    member pk_member 
   CONSTRAINT     T   ALTER TABLE ONLY public.member
    ADD CONSTRAINT pk_member PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.member DROP CONSTRAINT pk_member;
       public            postgres    false    223            �           2606    24688    reservation pk_reservation 
   CONSTRAINT     X   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT pk_reservation PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.reservation DROP CONSTRAINT pk_reservation;
       public            postgres    false    224            �           2606    24694     book_author fk_bookauthor_author    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES public.author(id);
 J   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_bookauthor_author;
       public          postgres    false    214    3207    217            �           2606    24699    book_author fk_bookauthor_book    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES public.book(id) NOT VALID;
 H   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_bookauthor_book;
       public          postgres    false    216    217    3209            �           2606    24704    loan fk_loan_book    FK CONSTRAINT     o   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES public.book(id);
 ;   ALTER TABLE ONLY public.loan DROP CONSTRAINT fk_loan_book;
       public          postgres    false    221    3209    216            �           2606    24709    loan fk_loan_member_username    FK CONSTRAINT     �   ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_member_username FOREIGN KEY (member_username) REFERENCES public.member(username) NOT VALID;
 F   ALTER TABLE ONLY public.loan DROP CONSTRAINT fk_loan_member_username;
       public          postgres    false    223    221    3217            �           2606    24714    reservation fk_res_book    FK CONSTRAINT     u   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES public.book(id);
 A   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fk_res_book;
       public          postgres    false    216    3209    224            �           2606    24719    reservation fk_res_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_member FOREIGN KEY (member_username) REFERENCES public.member(username) NOT VALID;
 C   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fk_res_member;
       public          postgres    false    3217    223    224            (   �  x��[K���>�~o>EE $�!�j�f�Y�S��Yb��3 �p��!>��-��*�ʇ\���5(k-��Q_T%.��������R]�NӕqM�UEw�i�kk�i[�|�t~�>L�6fc��Y����r�@�|k�SvP�u[�|�ҹ���ҽZ֡kj��h�Q2�T�u��<�r���a�5m��;g����ƛR�|�ё]��5�N��Dk�tѭV+��
_k�4ӵ�����|�^��	]��&�5ˊ���{����c�T�~'�̈́�4��jZ�*��̣��]o��[�l.<�勂.�E��8qS:UAkG��iw�dH�ajC�Ug����0�;��n������hz�hkm ��fޱ/4��,?I���NhV����fmZe#L�uI�\0e)%�v	EǦY�j)f�{V�BNW.����<5]��mw�Lz����Z]�����ӭ�����V��q����:8<Lщ)��X� )��5�Eik����^j��C:�p�tR�r	���4�!B�`�N�%͛�t`Թ���c�yv��fti�k�Alӭ#��p��*�s��+��Gb��������AԈ���#��a���alÀ�;���I.pۮ�zea�֋Fm��R�X���,�qdd�	, >{9���%t������F&�,���T��t�C+�`F�Tþzb���|)6�ߌnd'�U���4��8C� �+�zR�r�up�m%�YN�Zm�bl��*߲,O�3�㪇�)S����qU0m����.�Vs���Z8�G	]���I�Z7�Rzg�5ؘ/���g\cU��J�#����Dpba#��5�ͩrF[�1m�ee�����RM,G�=��i�{��UX�8A�oE!~4�w �c����:��,
!�F֝�'4�ᢵ�VJ,��S��Ơ������o�3�K��F-��D���͌�(��wl�V����p��!�)��|#>�IߺQ�+��7�m�ӛ���.|��ȉFx���:�;��`h��[đ��ɐ�Mق����&��'	��,�t���#�o��K�����ɖ�����FA�nQ��J}č�
�u��R�!�d��\��.�]e�b�'υ)]{& �N��9W���
F��M
z��Ovj����m8�����ȯ����ʃ�_��т$+��D�!�*�n9�!#����-���jU.�#�yF�ݺϸ�j��\Nmز�r>���զo���<��U;��w"EU�#����s���:��9�(��7�}x���3�md3y1ĵmAB�C�CYl	����p��Z%��"��UW��j��!̊�B��+�i�:~�P�8S�,�iFU2g�U@'�ybG>ń�B�� R�F}�j��Lߗ���^���j�U��o;����O��+��'A9�u:dH�Giת1��܄�"�ؑp^8������D�J�d{��GP 3Tr��Q�m�t��Ɩ2V��l�,�2��g	% �x�0J��>�AX�W�P���\ �3a�w����@�=W:�^�m$�!*��s0���N��I�	]���ĭZ/M,;L�)]�-���Zq+R������c3D�j�n+��v���^���=�BA�5AWz�{N��.���nߴ:v�szcm״PM�M0rm�dXட<���a��f�[؛�#~�����`!Wf�g�HA�t
���k���R�r�O���⫮!���[�K2Ƶ�ZN4�&cZC����$ɘnt a�xӰ/^�g�/�/�L@i=m ��rN��ϡx�͵�%�s�?4�;r8�L�q�ұ����>Z�tH���[��I�@��	vm�v5m4X��)�Tk�Dk�$� �1=|ΐԗV.�����ެ��@}����t�ܓ�DBZi9�O�	�#�;���"VHޯ�?=�����9gf��%i��d�O o��"d(V�rɩ�O�1�2Nl�2Ɇ�����ߑݺ������_ kB:�(�WLh�k���7'���^ƹ�G��:�55X��e#z��������K^�s(]�J��dPϧ�.K�/%	O�,�����\Z�m�$+�j��[�5frI!�u��O[�]�.,|,j��t����Y�C� '���-�Jm��H/��e�ҙvz.�A�V���$��N@��Z��٫��R�шN�O�a,8�8*�(�������79�M@\�O}��jM3x�,���o9���Q�|rp.�fV�C�/Z_w�)�j����ۯ���C��������<S�+�+��:N���/��m�����zV�h��B��\�m[�.d2s����~ �k�%�C ���Wբ�����:�O�'޶2�m\�I6�x��kX";��S uem��х�dHG�<�����_W�$4����{��r{}�$�����z0'�VK�9D2���!���|4���O+E��)�r#�d��q���bh��'�}�}~�$��9��8>�k���̤xF���R����I�;aif����!�`��%+:���� )��N��L��P-�r��3��'6�]��n�"BGLw,��I���pJ�1��0���s��a��؆o>����身*+ҕ�s:2��O�Bz�S��J^�d\�ɣZ[%�.�+�oY�s�]6[�+�H(��<�蜎e�'���w��9���|����'&�sᚙ7$��Nz�2�ٰ}B�KT�r\���n8$�c�8k�b��sUvf�s~�86]��D��g��|���S|�"�U�D���C��;F�A�J���CN�f7��_u.k�Vl��L�O��)�wB�w������X��"O���vR���7o��?��VѨ4?w�f��Qr&����w�\K��O�B���](W>*�Ѵ�489
�Fv90�N��E�J����!������m�X���/^����      *      x��\�n9}V�Bo��	�}K2H��͌16X`_:V��Ym��Dޯ�*��X�j�%��&p5ɺ�:uH>��������?T��ק�`�_1q%�������~]������Y�_�wW�}=�l��i���/��ǿ�~��=<<5����Z)�W�����*�X��?���u=��[/�z1�w]u�y{7�iW�v��g�{������7�.��
�ϗm׵�|�~�W��ގ������"��f�畄��,��+殘�y0qWmn�u�E+_�����O�_������sɂ��;?�թ���c�����K4b�&4��~C[�C�t�OO�m=���^jIl���������֯m�Tk4��4"��
�]��}�ַ��e��^pO,��ۯ_�-��I,m���~��z��o�_h6�+�;�Ҧ]Ϸժ����y����������`��f[��ܭ�u_`='|�=�݂�z�WL�ₙ_�����m3��t��)X팳R||^v���y#��-��&�I˖]1{��L����y|������&����ӣ��^YKx,�}�����n�s�y�Z������ޮ��6��{�8e����cѴ�K|�_	=ӣ���i�^x�D��Bl6�j�n�����5F��Xa"X�c�]�P/F3�{��<9�,�,7ѓ��Y�h��V�CD�s���t�� 5{[��W-Шiϝ�y�Jzp&Mmw�O��O����"l�M]a���0J3uQ�
����mȪ�`n�?��� ���t���2�x�"��H(��tRmFӕ�c��2���z���eXm ��s'�l�TҮ'�ӟ��XF-��l8͍�`�4!ب7A������{��7̻X��G�{��vs��z�� :7x�m
@Jv�RǕ�J�E��J�	RU�5�n��!?%/*a3腂���-�[����S{�����^�F�t[=n�o1b��Vs[�����.�Pȏ��Y�Vϯ�
��& Ck4j4I�����<䘯�U��e�͛�>D�0]q�A��t��^
�ӊ�|*�w$O� ���<�~�����0&&ɉ���`��:�=�Ng �ل��|z�������~���"N���1w0�psN��Vq2U{eLZ׫�~W����&�/��EB鑎�`�ԧ�T�=.�M�I	�#�0'����5vR�Z�8�7A"$`>�Y %J��J��CKq���:�υ��9٧ʘ�޵+��]��:d���N�qZ�EG�_�@o������_��k��F�o��Xuyߣ_�����UXj�M��B_��<&�L�-4���#wܞb7p�y���B[��Jʮ{��� =J��
�C�J�7sI�!��M���=���]���X<�Ta�f_�Wd�U9P�Y:�ԠL
�7�m���T�%�;*ᬮ�V�.^��lƳJ)�I���<`jİ�Bd�P�b�9��M6�{a)Pr�A�&���>b~��P������zm�S�mK����< 9A�W�Oqs�� ���M G����&m|8U�!�Jn�S��B���
��u��%�At��n�G����o��:���	�����2G�G��3J*V.��L-Z :,E�)��Yt`h[��N��O�F\W�T�O���[���+)��NJ��]�����<K��t�[�߬6���f> �)W�.���
h@xK�-H4��f�Ő�1�(�D��S9�2���9Jr(Ɗ�Z;T1����6�c�9��*�����,]S'�cL���#��c�zS�R���f��xo"�=��L��Q�A�ɩU��1-݋!�
U���M	�GRԜv��:R���|Q���U����
�}R<�|�Q�"6Z��F'b����4G��d��e8�-�+�S0��|�R���)���!��Z0~�T 3'�w0���?���6���uD6������;�<��ErMلܻ^W��*��x���C�/�V�R�-�%=���� /��t�WL�gq�JZ��``®��_�ׅA��JY�m���q���|e������\⺃�t��Qr�a��|!e��;?��:�א�~�2�n����U�؅{����|o�˰PK����۶E��|��
���C��c�.2�)�/�a��Tn���q)�u6;�b����Z�v��>L��5H:��Z9ُ��K�-���ԆFy�V�,���lo���Ё}�5�z�m�[}�V��)A,�\�e:��^H�H����L!�)Fr�Z�`�R��u�w]�+��n�l�1�m(O	J�hZR�ba��W��Pl1c�0m6g1H�]By��pmǎ�5/n�O�4mҝ�ݍ�\RR>�-����=�T��� ��8�a�cE�#O�!FʿKz*�n��Q��P�4���G(U�S�G��,�Q�3d~IaɁ����mj�������m3.�A>��Qh�\ɩ��YJ�u`�/%#���)p�]�ba����'T�!!ӝB1Cy�J�?�suqB7ϴd��rH���\q�}J��,�� n��z�7�V.˕j�#x�[ �Vi�>��6*�a
7�yD�c��q*�GdY/@���
�W��&,�އ�8�������t쁃w�4*ANF����e?ЋF0��E^�V�\ϿVhg��Q@A]��ݢ� ,�%���A蕰�I�g�<�.��0Q{
gy?9n�3!u�)�
,��V�رxS������1�mI�9��4H�p`3��b�X0�ř�Ҕ�m��ͅ�M"YK�Kh�4fM����X��ԼRW�F�:-T�{* ש��]�8�`�<�4�z�E���CZb�,���t)�v����v-xR�A

���oQ��e7��0��sG�E�"����
�%���;�4wi���V���g�4D��V��8$���9�P�G8�Q��L�|�O"p~��M�^�5����n�@>bJ4
&4iMPrg8~�˲�r�����$���7�j�~?��4�0���*�tH	u��¹�|ObF���	 � �D�54�q�����-�^82u����nFdc�*��������I�'i�O�CSr�*�XF�TΟCyT��ȗ`p.p,I���Q��~�@'[�Y;y&Iۇ���cR�%����!�H��E�Y��D�S`�(A�򃞋��@;³,����\��Z�bYj�'R8�쥦f\�#4#�tY��m!�e��X�'�:A��,�_N~�*I)��0�&ߜ�����V\
ш�̡E?J {�iwu�[����Os'���h�PoR��躜WV��KvB_xI���A��r}䮘hfU�H���c�8�\�#=Yu���̏A���$]x��W�@�"��d� U��U����L̩
r99J�IO�LQ�p�FLC�
���q9��C�L�X0!�Gz�$�����~}�:0X�0��	��q��y�(�4��	5@Aq&���遰ޑ�c�]@�2��H��b��b��|��+X��u�p�����K,��iгe�k��������������䡳��=3
Ք'\ɑ�ga�{�g.v�	E��R�1��*�7���
�|P��i�b�Pi_4퓪W�Wnh�������\8p?DC�v����������[-�Q�^7.����=��5���W���v��� ��������θ,-�O_���*��H]�"���jy`P�b���DZ�%���5F͎��e�:�U�yEz��=���8V�<�VH��)��:��q-����=0�P:F��Z��c!D���r�K�^�7\�>,GB=�I`y��@��3H/�QA��l���d#�M�d�G�v��0�.K�����T��P�K�Nc���J)�R��F9�Ψ��9V�ɗ�	҉p�{�����j�d�MA9�y���s�m{���ϓ����X�`M>�B��hz*j$9�K-a�~pa>��	�"g}eS J���E<�eO>�����l�E�h �惨N��|�m�G*������~�6ה���f� �$�=}��?Ǘ#6|�B�r4n1�V酈���;2�'~3ġ�?��>l(E56y��'���G{Xx E  �f2�T����H�;�'/�D|�T�O �P{E�u��C��b-5�i|�r]#����\+EV�b	?-��g^0]���o?�W�&����!����g�lr��-�ӥ��Y`�s򡨤���a@ r�;��X���Z{�.��\��N]����ǝ� "L݋��R��1���b���d�"�@&��o^��P�7�3�,�U�G�&��=��Pu����8�wd6b�z��b,CJٜ<��������ۋ��P��Qc�Kb�=p�a팶���4�+��r�I�Vȱ��gEj�/iq���V��@L&ИA/yf�L�EIM������Y��	����co�����ϙ���[F6�~�u�k�{B���:��#�����|�{t8���j�'}����G/��T��z�k�Zy$�!1�W��ϱp�R㻊�<?�ߋ80��  *��P�%95�O�'��7����
Z@�d�D�b��v�p}�xd���۬
ԥ���~'UB|\���͟��8`��8��X��Q�J�ij�w�3�I&?���Z��Fɿ���:ǫ��/�^��?���!      +   �  x�5��q�0C�R1m��K��#�s���-q@б�ڵ�Q�=u�rj����j_��^��ըo�~N=��>8Ñ^w���8і��W�u�ϑ.�4"��I&Oٽ��K�g���a'�G��q#��8�_��n��UO##��Wn���R$:�<]9%�����q�l��:�cz�]^����~��F���m��c�(�U�nݼ��G�W���X#a{�`����́cָ坺8��u
!�z���^^�A�=K#a�-��pwAajBŇ:,B�:)'T�Y��'�N}�C�ʸ�^E��fݲy1˹ K�KTO��Q�?��OTӷ��U���'+��5^���q��H�P�  �֝��\�%
�8��v��Ԙ�}�4M#�@p����!�|絨t�_��/侄�%�_��_-�! B�]�\���&�8WK�Q��	b�MA�Z���=]�.��+��+�(D-Q�T@b �$��&��ptn���<q�ah�	��:���b�g>ȣQ�GɄ#'�W�#����(����Y5t�b��V`�H���Q���z4g�X"U�$ș��C�TcT�3�,��F�}M"��Z�Q�\A�׼��9�z^�GC�.�7��I�+<�D[`D/\�� k�:9�S�t��}����t%7� �N���!��%�4�/}p�!�W��Q��IS����5jT�]}� z��Y�g���tS1O�3�̇�$�a�h�Z��UƒY������z�$0J:U
�<�t�>D;��r���L3��Ԣ��k�&3A�^����%�-c�a���)��#��~��ǻ�l��Ґ0�)�/�~��	�.RRM��^.��V/���5,�k�m��~e�o�΢��A
3�{�W���<s�{���o�=��m��W?hOݢ��E�0V�:f#�G���P��Վ�^ҶsLw���-xƜ>�F�%�Ѳ9ߎUR?o^��YR�4�5��E2��P���c�c����;���?�{J��,�]�� �.�m��4�u�������~�},���Ƿ0����[��_��*�-�V}�h�z"������u ִ��f$^Z��	G�,�E~
�V��3�r��f}&}�D
Z z�u�'f�'��_᳴#?"F~h��A�_X�^��^m�#�$���S>s���j���啹ik_�/7y��5�7y��c�R�Jw�i�����C���D�[�2������d>���Ԟ��qş��Z�������C      -      x������ � �      /      x������ � �      1      x������ � �      2      x������ � �     