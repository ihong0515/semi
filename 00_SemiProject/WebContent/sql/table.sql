CREATE TABLE hotel (
	hotel_no	number(10)		NOT NULL,
	hotel_ownerno	number(10)		NOT NULL,
	hotel_name	varchar2(100)		NOT NULL,
	hotel_phone	varchar2(50)		NOT NULL,
	hotel_addr	varchar2(50)		NOT NULL,
	hotel_location	varchar2(500)		NOT NULL,
	hotel_email	varchar2(500)		NOT NULL,
	hotel_info	varchar2(1000)		NULL,
	hotel_room_count	number(20)		NOT NULL,
	hotel_establish	number(20)		NULL,
	hotel_photo_folder	varchar2(1000)		NULL,
	hotel_price_min	number(10)		NOT NULL,
	hotel_price_max	number(10)		NOT NULL,
	hotel_people_min	number(10)		NOT NULL,
	hotel_people_max	number(10)		NOT NULL,
	hotel_star	number(10)		NOT NULL,
	hotel_point	number(10)	DEFAULT 0	NULL
);

CREATE TABLE room (
	room_no	number(10)		NOT NULL,
	room_hotelno	number(10)		NOT NULL,
	room_name	varchar2(100)		NOT NULL,
	room_price	number(20)		NOT NULL,
	room_bed	varchar2(30)		NOT NULL,
	room_size	varchar2(30)		NOT NULL,
	room_people_min	number(10)		NOT NULL,
	room_people_max	number(10)		NOT NULL,
	room_photo_folder	varchar2(100)		NOT NULL,
	room_photo_folder_size	number(10)	DEFAULT 0	NOT NULL,
	room_checkin	varchar2(30)		NOT NULL,
	room_checkout	varchar2(30)		NOT NULL,
	room_breakfast	varchar2(10) default 'N' check(room_breakfast in('Y','N'))
);

CREATE TABLE user1 (
	user_no	number(10)		NOT NULL,
	user_id	varchar(20)	unique	NOT NULL,
	user_pwd	varchar2(20)		NOT NULL,
	user_name	varchar2(20)		NOT NULL,
	user_phone	varchar2(20)		NOT NULL,
	user_birth	varchar2(50)		NOT NULL,
	user_email	varchar2(20)		NOT NULL,
	user_region	varchar2(20)		NOT NULL
);

CREATE TABLE reserv (
	reserv_no	number(10)		NOT NULL,
	reserv_hotelno	number(10)		NOT NULL,
	reserv_hotelname	varchar2(100)		NOT NULL,
	reserv_roomno	number(10)		NOT NULL,
	reserv_roomname	varchar2(100)		NOT NULL,
	reserv_userno	number(10)		NOT NULL,
	reserv_username	varchar2(20)		NOT NULL,
	reserv_promno	number(10)		NULL,
	reserv_coupno	number(10)		NULL,
	reserv_nomalprice	number(20)		NOT NULL,
	reserv_realprice	number(20)		NOT NULL,
	reserv_start	date		NULL,
	reserv_end	date		NULL,
	reserv_daycount	number(10)		NULL,
	reserv_people	number(10)		NULL,
	reserv_request	varchar2(1000)		NULL,
	reserv_date	date	DEFAULT sysdate	NOT NULL,
	reserv_usecheck	varchar(10) default 'N' check(reserv_usecheck in('Y','N','C')),
    reserv_payment varchar2(50),
    reserv_ins number(5)
);

CREATE TABLE owner (
	owner_no	number(10)		NOT NULL,
	owner_id	varchar(20)		NOT NULL,
	owner_pwd	varchar(20)		NOT NULL,
	owner_name	varchar2(30)		NOT NULL,
	owner_phone	varchar2(40)		NOT NULL,
	owner_email	varchar2(100)		NOT NULL,
	owner_birth	varchar2(30)		NOT NULL
);

CREATE TABLE promotion (
	prom_no	number(10)		NOT NULL,
	prom_name	varchar(50)		NOT NULL,
	prom_info	varchar2(2000)		NOT NULL,
	prom_folder	varchar2(1000)		NOT NULL
);

CREATE TABLE coupon (
	coup_no	number(10)		NOT NULL,
	coup_promno	number(10)		NOT NULL,
	coup_name	varchar2(50)		NOT NULL,
	coup_info	varchar2(1000)		NULL,
	coup_sale	number(20)	DEFAULT 0	NOT NULL
);

CREATE TABLE faq (
	faq_no	number(10)		NOT NULL,
	faq_category	number(10)		NOT NULL,
	faq_title	varchar2(100)		NOT NULL,
	faq_content	varchar2(1000)		NOT NULL
);

CREATE TABLE inquiry_hotel (
	inqho_no	number(10)		NOT NULL,
	inqho_ownerno	number(10)		NOT NULL,
	inqho_hotelno	number(10)		NOT NULL,
	inqho_writer	varchar2(50)		NOT NULL,
	inqho_title	varchar2(100)		NOT NULL,
	inqho_content	varchar2(2000)		NOT NULL,
	inqho_date	date		NOT NULL,
	inqho_update	date	DEFAULT null	NULL,
	inqho_group	number(10)		NOT NULL,
	inqho_step	number(10)		NULL,
	inqho_indent	number(10)		NULL
);

CREATE TABLE inquiry_site (
	inqsi_no	number(10)		NOT NULL,
	inqsi_writer	varchar2(50)		NOT NULL,
	inqsi_title	varchar2(100)		NOT NULL,
	inqsi_content	varchar2(2000)		NOT NULL,
	inqsi_date	date		NOT NULL,
	inqsi_update	date	DEFAULT null	NULL,
	inqsi_group	number(10)		NOT NULL,
	inqsi_step	number(10)		NULL,
	inqsi_indent	number(10)		NULL
);

CREATE TABLE payment (
	pay_no	number(10)		NOT NULL,
	pay_userno	number(10)		NOT NULL,
	pay_name	varchar(50)		NULL,
	pay_cardno	number(20)		NOT NULL,
	pay_cardcom	varchar2(50)		NOT NULL,
	pay_cvc	number(5)		NOT NULL,
	pay_pwd	VARCHAR(255)		NOT NULL,
	pay_date	varchar(20)		NOT NULL
);

ALTER TABLE hotel ADD CONSTRAINT "PK_HOTEL" PRIMARY KEY (
	hotel_no
);

ALTER TABLE room ADD CONSTRAINT "PK_ROOM" PRIMARY KEY (
	room_no
);

ALTER TABLE user1 ADD CONSTRAINT "PK_USER1" PRIMARY KEY (
	user_no
);

ALTER TABLE reserv ADD CONSTRAINT "PK_RESERV" PRIMARY KEY (
	reserv_no
);

ALTER TABLE owner ADD CONSTRAINT "PK_OWNER" PRIMARY KEY (
	owner_no
);

ALTER TABLE promotion ADD CONSTRAINT "PK_PROMOTION" PRIMARY KEY (
	prom_no
);

ALTER TABLE coupon ADD CONSTRAINT "PK_COUPON" PRIMARY KEY (
	coup_no
);

ALTER TABLE faq ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	faq_no
);

ALTER TABLE inquiry_hotel ADD CONSTRAINT "PK_INQUIRY_HOTEL" PRIMARY KEY (
	inqho_no
);

ALTER TABLE inquiry_site ADD CONSTRAINT "PK_INQUIRY_SITE" PRIMARY KEY (
	inqsi_no
);


ALTER TABLE hotel ADD CONSTRAINT "FK_owner_TO_hotel_1" FOREIGN KEY (
	hotel_ownerno
)
REFERENCES owner (
	owner_no
) ON DELETE CASCADE;

ALTER TABLE room ADD CONSTRAINT "FK_hotel_TO_room_1" FOREIGN KEY (
	room_hotelno
)
REFERENCES hotel (
	hotel_no
) ON DELETE CASCADE;

ALTER TABLE reserv ADD CONSTRAINT "FK_hotel_TO_reserv_1" FOREIGN KEY (
	reserv_hotelno
)
REFERENCES hotel (
	hotel_no
) ON DELETE CASCADE;

ALTER TABLE reserv ADD CONSTRAINT "FK_room_TO_reserv_1" FOREIGN KEY (
	reserv_roomno
)
REFERENCES room (
	room_no
) ON DELETE CASCADE;

ALTER TABLE reserv ADD CONSTRAINT "FK_user1_TO_reserv_1" FOREIGN KEY (
	reserv_userno
)
REFERENCES user1 (
	user_no
) ON DELETE CASCADE;

ALTER TABLE reserv ADD CONSTRAINT "FK_promotion_TO_reserv_1" FOREIGN KEY (
	reserv_promno
)
REFERENCES promotion (
	prom_no
) ON DELETE CASCADE;

ALTER TABLE reserv ADD CONSTRAINT "FK_coupon_TO_reserv_1" FOREIGN KEY (
	reserv_coupno
)
REFERENCES coupon (
	coup_no
) ON DELETE CASCADE;

ALTER TABLE coupon ADD CONSTRAINT "FK_promotion_TO_coupon_1" FOREIGN KEY (
	coup_promno
)
REFERENCES promotion (
	prom_no
) ON DELETE CASCADE;

ALTER TABLE inquiry_hotel ADD CONSTRAINT "FK_owner_TO_inquiry_hotel_1" FOREIGN KEY (
	inqho_ownerno
)
REFERENCES owner (
	owner_no
) ON DELETE CASCADE;

ALTER TABLE inquiry_hotel ADD CONSTRAINT "FK_hotel_TO_inquiry_hotel_1" FOREIGN KEY (
	inqho_hotelno
)
REFERENCES hotel (
	hotel_no
) ON DELETE CASCADE;

ALTER TABLE payment ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	pay_no
);

ALTER TABLE payment ADD CONSTRAINT "FK_user1_TO_payment_1" FOREIGN KEY (
	pay_userno
)
REFERENCES user1 (
	user_no
) ON DELETE CASCADE;

create table hotelpolicy(
    hp_hotelno number(10) references hotel(hotel_no) on delete cascade,

    hp_wifi varchar2(10) default 0 check(hp_wifi in(1,0)),
    hp_parking varchar2(10) default 0 check(hp_parking in(1,0)),
    hp_tub varchar2(10) default 0 check(hp_tub in(1,0)),
    hp_pool varchar2(10) default 0 check(hp_pool in(1,0)),
    hp_restaurant varchar2(10) default 0 check(hp_restaurant in(1,0)),
    hp_fitness varchar2(10) default 0 check(hp_fitness in(1,0)),
    hp_bar varchar2(10) default 0 check(hp_bar in(1,0)),
    hp_terrace varchar2(10) default 0 check(hp_terrace in(1,0)),
    hp_sauna varchar2(10) default 0 check(hp_sauna in(1,0))
);

CREATE TABLE review (
	review_no	number(10)		NOT NULL,
	review_userno	number(10)		NOT NULL,
	review_hotelno	number(10)		NOT NULL,
	review_roomno	number(10)		NOT NULL,
	review_reservno	number(10)		NOT NULL,
	review_writer	varchar2(50)		NOT NULL,
	review_content	varchar2(2000)		NOT NULL,
	review_date	date		NOT NULL,
	review_update	date	DEFAULT null	NULL,
	review_photo	varchar2(1000)		NULL,
	review_checkindate	date	not null,
	review_point number(2) default 0 not null
);

ALTER TABLE review ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	review_no
);

ALTER TABLE review ADD CONSTRAINT "FK_user1_TO_review_1" FOREIGN KEY (
	review_userno
)
REFERENCES user1 (
	user_no
) ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT "FK_hotel_TO_review_1" FOREIGN KEY (
	review_hotelno
)
REFERENCES hotel (
	hotel_no
) ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT "FK_reserv_TO_review_1" FOREIGN KEY (
	review_reservno
)
REFERENCES reserv (
	reserv_no
) ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT "FK_room_TO_review_1" FOREIGN KEY (
	review_roomno
)
REFERENCES room (
	room_no
) ON DELETE CASCADE;