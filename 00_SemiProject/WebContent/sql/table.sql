create table hotel (
    hotel_no number(10) primary key,
    hotel_name varchar2(100) not null,
    hotel_phone varchar2(50) not null,
    hotel_addr varchar2(50) not null,
    hotel_location varchar2(500) not null,
    hotel_email varchar2(500) not null,
    hotel_info varchar2(1000),
    hotel_room_count number(20) not null,
    hotel_establish number(20),
    hotel_photo_folder varchar2(1000),
    hotel_price_min number(10) not null,
    hotel_price_max number(10) not null,
    hotel_people_min number(10) not null,
    hotel_people_max number(10) not null,
    hotel_star number(10) not null,
    hotel_point number(10) default 0
);

create table hotelpolicy(
    hp_hotelno number(10) references hotel(hotel_no) on delete cascade,
    hp_wifi varchar2(10) default 'N' check(hp_wifi in('Y','N')),
    hp_parking varchar2(10) default 'N' check(hp_parking in('Y','N')),
    hp_tub varchar2(10) default 'N' check(hp_tub in('Y','N')),
    hp_pool varchar2(10) default 'N' check(hp_pool in('Y','N')),
    hp_restaurant varchar2(10) default 'N' check(hp_restaurant in('Y','N')),
    hp_fitness varchar2(10) default 'N' check(hp_fitness in('Y','N')),
    hp_bar varchar2(10) default 'N' check(hp_bar in('Y','N')),
    hp_terrace varchar2(10) default 'N' check(hp_terrace in('Y','N')),
    hp_sauna varchar2(10) default 'N' check(hp_sauna in('Y','N'))
);

create table room(
    room_no number(10) primary key,
    room_hotelno number(10) references hotel(hotel_no) on delete cascade,
    room_name varchar2(100) not null,
    room_price number(20) not null,
    room_bed varchar2(30),
    room_size varchar2(30),
    room_people_min number(10) not null,
    room_people_max number(10) not null,
    room_photo_folder varchar2(100),
    room_photo_folder_size number(10),
    room_checkin varchar2(30),
    room_checkout varchar2(30),
    room_breakfast varchar2(10) default 'N' check(room_breakfast in('Y','N'))
);

create table user1(
    user_no number(10) not null,
    user_name varchar2(20) not null,
    user_phone varchar2(20) not null,
    user_birth varchar2(50) not null,
    user_email varchar2(20) not null,
    user_egion varchar2(20) not null,
    user_reservation varchar2(20) not null,
    user_pwd varchar2(20) not null,
    user_id varchar(20) not null,
    primary key(user_no)
);

create table reserv(
    reserv_no number(10) primary key,
    reserv_hotelno number(10) references hotel(hotel_no) on delete cascade,
    reserv_hotelname varchar2(100),
    reserv_roomno number(10) references room(room_no) on delete cascade,
    reserv_roomname varchar2(100),
    reserv_userno number(10) references user1(user_no) on delete cascade,
    reserv_username varchar2(20),
    reserv_start date,
    reserv_end date,
    reserv_daycount number(10),
    reserv_people  number(10),
    reserv_request varchar2(1000),
    reserv_date date
);


create table owner(
    owner_no number(10) primary key,
    owner_name varchar2(30) not null,
    owner_phone varchar2(40) not null,
    owner_email varchar2(100) not null,
    owner_birth varchar2(30) not null,
    owner_hotelno number(10) not null references hotel(hotel_no) on delete cascade,
    owner_id varchar(20) not null,
    owner_pwd varchar(20) not null
);