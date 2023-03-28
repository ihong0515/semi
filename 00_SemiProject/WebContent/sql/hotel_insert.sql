
--호텔 연습용 데이터 넣는 과정에서 제약조건을 좀 바꿨습니다.--

CREATE TABLE "HOTEL" 
   ("HOTEL_NO" NUMBER(10,0), 
	"HOTEL_NAME" VARCHAR2(500 BYTE) NOT NULL ENABLE, 
	"HOTEL_PHONE" VARCHAR2(500 BYTE), 
	"HOTEL_ADDR" VARCHAR2(500 BYTE) NOT NULL ENABLE, 
	"HOTEL_LOCATION" VARCHAR2(500 BYTE) NOT NULL ENABLE, 
	"HOTEL_EMAIL" VARCHAR2(500 BYTE), 
	"HOTEL_INFO" VARCHAR2(1000 BYTE), 
	"HOTEL_ROOM_COUNT" NUMBER(20,0), 
	"HOTEL_ESTABLISH" NUMBER(20,0), 
	"HOTEL_PHOTO_FOLDER" VARCHAR2(500 BYTE), 
	"HOTEL_PRICE_MIN" NUMBER(10,0) NOT NULL ENABLE, 
	"HOTEL_PRICE_MAX" NUMBER(10,0) NOT NULL ENABLE, 
	"HOTEL_PEOPLE_MIN" NUMBER(10,0) NOT NULL ENABLE, 
	"HOTEL_PEOPLE_MAX" NUMBER(10,0) NOT NULL ENABLE, 
	"HOTEL_STAR" NUMBER(10,0) NOT NULL ENABLE, 
	"HOTEL_POINT" NUMBER(10,0) DEFAULT 0, 
	 PRIMARY KEY ("HOTEL_NO"));
	 
--데이터 삽입 문입니다. 파일폴더명은 image에 있는 숙소명과 동일한 폴더명입니다.
--이미지 파일말고 다른 값은 변경해서 사용 하시면 됩니다.	 
insert into hotel values(1,'서울신라호텔','02-111-1111','서울중구','서울','shinla','서울중심에위치',237,1979,'shinla',385000,690000,100,100,5,13); 




insert into hotel values(2,'인터컨티넨탈 서울 코엑스','02-222-2222','서울명동','서울','intercontinental','명동인근',312,1974,'intercontinetal',314500,690000,100,100,5,13); 
insert into hotel values(3,'포시즌스호텔 서울','02-333-3333','서울동대문','서울','fourseasons','서울시청인근',233,1929,'fourseasons',385000,690000,100,100,5,13); 


insert into hotel values(4,'썬밸리 호텔','02-555-4444','여주','경기','sunvalley','여주인근',312,1974,'sunvalley',88000,690000,100,100,5,13); 
insert into hotel values(5,'소노캄 고양','02-551-3123','고양','경기','sonocalm','고양인근',233,1929,'sonocalm',160996,690000,100,100,5,13); 
insert into hotel values(6,'라마다 프라자 수원','02-222-2123','수원','경기','ramada','수원인근',312,1974,'ramada',711765,690000,100,100,5,13); 

insert into hotel values(7,'비발디 파크','02-555-4444','홍천','강원','vivaldi','홍천인근',312,1974,'vivaldi',101915,690000,100,100,5,13); 
insert into hotel values(8,'세인트존스 호텔','02-551-3123','강릉','강원','stjohn','강릉인근',233,1929,'stjohn',91723,690000,100,100,5,13); 
insert into hotel values(9,'호텔 탑스텐','02-222-2123','강릉','강원','tops10','강릉인근',312,1974,'tops10',122298,690000,100,100,5,13); 


insert into hotel values(10,'소노캄 여수','02-555-4444','여수','전남','sonocamyeosu','여수인근',312,1974,'sonocamyeosu',139272,690000,100,100,5,13); 
insert into hotel values(11,'호텔 JCS 여수','02-551-3123','여수','전남','jcs','여수인근',233,1929,'jcs',80169,690000,100,100,5,13); 
insert into hotel values(12,'금호 화순 리조트','02-222-2123','kumhohwasun','전남','tops10','화순인근',312,1974,'kumhohwasun',80800,690000,100,100,5,13); 


insert into hotel values(13,'소노벨 변산','02-555-4444','부안','전북','sonovbellebyun','부안인근',312,1974,'sonovbellebyun',131103,690000,100,100,5,13); 
insert into hotel values(14,'라한호텔 전주','02-551-3123','전주','전북','lahanhotel','전주인근',233,1929,'lahanhotel',173826,690000,100,100,5,13); 
insert into hotel values(15,'에이본 호텔','02-222-2123','군산','전북','avonhotel','군산인근',312,1974,'avonhotel',122298,690000,100,100,5,13); 


insert into hotel values(16,'그랜드 플라자 청주','02-555-4444','청주','충북','grandplaza','청주인근',312,1974,'grandplaza',136335,690000,100,100,5,13); 
insert into hotel values(17,'소노문 단양','02-551-3123','단양','충북','sonomoondanyang','단양인근',233,1929,'sonomoondanyang',103785,690000,100,100,5,13); 
insert into hotel values(18,'제이원호텔엔리조트','02-222-2123','청주','충북','jone','청주인근',312,1974,'jone',81152,690000,100,100,5,13); 



insert into hotel values(19,'온양관광호텔','02-555-4444','아산시','충남','onyang','아산인근',312,1974,'onyang',72150,690000,100,100,5,13); 
insert into hotel values(20,'소노벨 천안','02-551-3123','천안','충남','sonovbellecheonan','천안인근',233,1929,'sonovbellecheonan',122060,690000,100,100,5,13); 
insert into hotel values(21,'온양제일호텔','02-222-2123','아산','충남','onyangcheil','아산인근',312,1974,'onyangcheil',88889,690000,100,100,5,13); 


insert into hotel values(22,'호텔 인터네셔널','02-555-4444','창원','경남','hotelinternational','창원인근',312,1974,'hotelinternational',235000,690000,100,100,5,13); 
insert into hotel values(23,'삼성호텔 거제','02-551-3123','거제','경남','samsonghotel','거제인근',233,1929,'samsonghotel',231113,690000,100,100,5,13); 
insert into hotel values(24,'아이스퀘어호텔','02-222-2123','김해','경남','isquare','김해인근',312,1974,'isquare',158730,690000,100,100,5,13); 


insert into hotel values(25,'코오롱 호텔','02-555-4444','경주','경북','kolonhotel','경주인근',312,1974,'kolonhotel',165658,690000,100,100,5,13); 
insert into hotel values(26,'베스트웨스턴플러스 경주','02-551-3123','경주','경북','bestwestern','경주인근',233,1929,'bestwestern',87744,690000,100,100,5,13); 
insert into hotel values(27,'경주 지지 관광호텔','02-222-2123','경주','경북','gghotel','경주인근',312,1974,'gghotel',170296,690000,100,100,5,13); 


insert into hotel values(28,'랜딩관제주신화월드호텔 앤 리조트','02-555-4444','중문','제주','landingjeju','중문인근',312,1974,'landingjeju',1119317,690000,100,100,5,13); 
insert into hotel values(29,'라마다프라자 제주호텔','02-551-3123','동문시장','제주','ramadajeju','동문인근',233,1929,'ramadajeju',119999,690000,100,100,5,13); 
insert into hotel values(30,'메종글래드제주','02-222-2123','제주공항','제주','maisonglad','제주공항인근',312,1974,'maisonglad',117459,690000,100,100,5,13); 


