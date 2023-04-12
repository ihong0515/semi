INSERT INTO inquiry_hotel VALUES (1, 1, 7, 'John', '문의 제목 1', '문의 내용 1', '2022-01-01', NULL, 1, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (2, 1, 26, 'Jane', '문의 제목 2', '문의 내용 2', '2022-01-02', NULL, 2, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (3, 1, 9, 'Mike', '문의 제목 3', '문의 내용 3', '2022-01-03', NULL, 3, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (4, 1, 20, 'Sarah', '문의 제목 4', '문의 내용 4', '2022-01-04', NULL, 4, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (5, 1, 10, 'David', '문의 제목 5', '문의 내용 5', '2022-01-05', NULL, 5, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (6, 1, 8, 'Julie', '문의 제목 6', '문의 내용 6', '2022-01-06', NULL, 6, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (7, 1, 14, 'Steven', '문의 제목 7', '문의 내용 7', '2022-01-07', NULL, 7, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (8, 1, 11, 'Anna', '문의 제목 8', '문의 내용 8', '2022-01-08', NULL, 8, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (9, 1, 5, 'Eric', '문의 제목 9', '문의 내용 9', '2022-01-09', NULL, 9, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (10, 1, 3, 'Megan', '문의 제목 10', '문의 내용 10', '2022-01-10', NULL, 10, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (11, 1, 3, 'Kim', '질문합니다.', '안녕하세요, 호텔 예약 관련해서 궁금한 게 있어서 문의드립니다.', '2022-01-01', null, 11, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (12, 1, 27, 'Lee', '체크인 시간 문의', '안녕하세요. 예약한 방 체크인 시간이 언제인지 궁금합니다.', '2022-02-02', null, 12, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (13, 1, 17, 'Park', '객실 시설 문의', '안녕하세요. 예약한 객실에 드라이기가 있나요?', '2022-03-03', null, 13, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (14, 1, 7, 'Choi', '예약 확인 부탁드립니다.', '안녕하세요. 예약 확인 부탁드립니다.', '2022-04-04', null, 14, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (15, 1, 12, 'Kim', '추가 요금 문의', '안녕하세요. 예약한 객실 이용 시 추가 요금이 발생하는지 궁금합니다.', null, '2022-05-05', 15, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (16, 1, 29, 'Lee', '부가시설 이용 가능 여부', '안녕하세요. 수영장 이용이 가능한가요?', '2022-06-06', null, 16, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (17, 1, 25, 'Park', '주변 맛집 추천', '안녕하세요. 호텔 주변에 맛집이 있다면 추천해주세요!', '2022-07-07', null, 17, 1, 2, 'U');
INSERT INTO inquiry_hotel VALUES (18, 1, 6, 'Choi', '수건 교체 문의', '안녕하세요. 수건 교체를 얼마나 자주해주시나요?', '2022-08-08', null, 18, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (19, 1, 20, 'Kim', '와이파이 연결 방법', '안녕하세요. 객실 내 와이파이 연결 방법을 알고 싶습니다.', '2022-09-09', null, 19, 1, 3, 'U');
INSERT INTO inquiry_hotel VALUES (20, 1, 25, '이영희', '객실 청소 시간 문의', '안녕하세요 호텔 운영자님. 저희가 이번에 여행을 왔는데, 객실 청소 시간이 궁금합니다. 혹시 몇 시부터 몇 시까지 청소를 하시나요?', '2023-04-12', NULL, 20, 1, 2, 'U');
INSERT INTO inquiry_hotel 
VALUES (21, 1, 3, '홍길동', 'RE: 호텔 이용 문의드립니다.', 
'안녕하세요, 호텔 이용에 대해 궁금한 점이 있어서 문의드립니다. 이용 시 주차는 어떻게 해야 하나요?', 
TO_DATE('2023-04-12', 'YYYY-MM-DD'), NULL, 11, 2, 2, 'O');
INSERT INTO inquiry_hotel 
VALUES (22, 1, 3, '김철수', 'RE: 호텔 이용 문의드립니다.', 
'주차 관련 문의드리신 내용에 대해 답변드립니다. 저희 호텔은 무료 주차가 가능하며, 인근 주차장을 이용하시려면 추가 요금이 발생할 수 있으니 참고해주세요.', 
TO_DATE('2023-04-12', 'YYYY-MM-DD'), NULL, 11, 3, 2, 'O');
INSERT INTO inquiry_hotel 
VALUES (23, 1, 20, '박영희', 'RE: 체크인 시간 문의', '안녕하세요, 호텔 이용에 대한 문의드려서 죄송합니다. 체크인 시간이 15시로 되어 있는데, 13시쯤 호텔에 도착할 예정입니다. 조금 일찍 체크인이 가능한지 여쭤보고 싶습니다.', 
TO_DATE('2023-04-12', 'YYYY-MM-DD'), NULL, 13, 2, 2, 'O');
INSERT INTO inquiry_hotel 
VALUES (24, 1, 15, '호텔사 관리자', '환불에 대한 안내', 
'안녕하세요. 해당 예약건은 환불이 가능합니다. 환불에 대해서는 별도의 수수료가 부과될 수 있습니다. 자세한 사항은 고객센터로 문의해주세요.', 
'2022-03-28', null, 4, 2, 3, 'O');
INSERT INTO inquiry_hotel 
VALUES (25, 1, 15, '이은비', '환불 신청합니다.', '안녕하세요. 환불 신청합니다.', '2022-03-29', null, 6, 2, 3, 'O');
INSERT INTO inquiry_hotel 
VALUES (26, 1, 15, '호텔사 관리자', '환불 처리 결과 안내', 
'안녕하세요. 환불 처리가 완료되었습니다. 소요기간은 최대 7일까지 소요될 수 있으니 양해 부탁드립니다. 감사합니다.', 
'2022-04-01', null, 10, 2, 3, 'O');