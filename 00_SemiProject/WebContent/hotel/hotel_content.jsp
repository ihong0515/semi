<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hoDTO" value="${HotelDTO }"/>
<c:set var="hpDTO" value="${HPDTO }"/>
<c:set var="roomList" value="${RoomList }"/>
<c:set var="reviewList" value="${ReviewList }"/>
<c:set var="user" value="${sessionScope.loginUser }"/>
<c:set var="reservList" value="${Re_list }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${hoDTO.getHotel_name() }</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link href="<%=request.getContextPath() %>/css/hotel/hotel_content.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/hotel/hotel_content.js"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
		<c:if test="${!empty hoDTO }">
			<div id="hotel_all_info">
				<div id="hotel_info">
					<div id="hotel_info_big_img">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/main.jpg" width="320" height="320">
					</div>
					<div id="hotel_info_small_img">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/room1/1.jpg" width="100" height="100">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/room1/2.jpg" width="100" height="100">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/room1/3.jpg" width="100" height="100">
					</div>
					<div id="hotel_info_detail">
						<span id="hotel_info_detail_star_txt">${hoDTO.getHotel_star() }성급</span>
						<span id="hotel_info_detail_star">
							<c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach>
						</span>
						<div id="hotel_info_detail_name">
							${hoDTO.getHotel_name() }
							<span id="hotel_info_detail_jjim">
								<%--jjim 표시 --%>
								<c:set var="check" value="-1" />
								<c:forEach items="${user.getUser_jjimList() }" var="jjim">
									<c:if test="${jjim==hoDTO.getHotel_no() }">
										<c:set var="check" value="1" />
									</c:if>
								</c:forEach>
								<c:if test="${check == 1}">
									<span class="hotel_like_check" onclick="likeDelete(this, ${hoDTO.getHotel_no() })"><i class="fa fa-heart" aria-hidden="true"></i></span>
								</c:if>
								<c:if test="${check == -1}">
									<span class="hotel_like_check" onclick="likeInsert(this, ${hoDTO.getHotel_no() })"><i class="fa fa-heart-o" aria-hidden="true"></i></span>
								</c:if>
								<%--jjim 표시 end --%>
							</span>
						</div>
						<div id="hotel_info_detail_addr">
							${hoDTO.getHotel_addr() }
						</div>
						<div id="hotel_info_detail_hash">
							<span>
								#${hoDTO.getHotel_hashtag().get(0) }&nbsp;
								#${hoDTO.getHotel_hashtag().get(1) }&nbsp;
								#${hoDTO.getHotel_hashtag().get(2) }
							</span>
						</div>
						<div id="hotel_info_detail_point">
							평점 ${hoDTO.getHotel_point() } / 10.0
						</div>
						<div id="hotel_info_detail_price">
							<div id="left">
								<p id="txt1">1박 요금 최저가</p>
								<p id="txt2">객실 세금/봉사료 포함</p>
							</div>
							<div id="right">
								<strong><fmt:formatNumber value="${hoDTO.getHotel_price_min() }" pattern="#,###" /><span>원~</span></strong>
							</div>
						</div>
					</div>
				</div>
				<div id="hotel_detail">
					<div class="title_txt">
						<strong>호텔 정보</strong>
					</div>
					<table>
						<tr>
							<th>설립 연도</th>
							<td>${hoDTO.getHotel_establish() }</td>
						</tr>
						<tr>
							<th>객실 수</th>
							<td>${hoDTO.getHotel_room_count() }</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${hoDTO.getHotel_phone() }</td>
						</tr>
						<tr>
							<th>Email</th>
							<td>${hoDTO.getHotel_email() }</td>
						</tr>
						<tr>
							<th>Address</th>
							<td>${hoDTO.getHotel_addr() }</td>
						</tr>
						<tr>
							<th>호텔 정보</th>
							<td>${hoDTO.getHotel_info() }</td>
						</tr>
					</table>
					<div id="hotel_board">
						<input type="button" value="호텔 1:1 문의하기" id="hotel_board_btn" onclick="board_open()">
						<div id="write_overlay">
							<div id="write_window">
								<div id="write_head">
									<span id="write_head_x" onclick="board_close()">닫기 X</span>
								</div>
								<div id="write_title">
									호텔 1:1 문의 작성
								</div>
								<div id="write_body">
									<table>
										<tr>
											<th>제목</th>
											<td><input type="text" placeholder="제목을 입력하세요."></td>
										</tr>
										<tr>
											<th>문의내용</th>
											<td><textarea placeholder="문의 내용을 입력하세요."></textarea></td>
										</tr>
									</table>
								</div>
								<div id="write_foot">
									<input type="button" value="문의하기" onclick="board_write(${hoDTO.getHotel_no() })">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="hotel_icon">
					<div class="title_txt">
						<strong>호텔 편의시설</strong>
					</div>
					<table>
						<c:if test="${hpDTO.isHp_wifi() }">
							<tr>
								<th>
									<i class="fa fa-wifi" aria-hidden="true"></i>
									<span class="hp_categoty">WiFi</span>
								</th>
								<td>
									<span class="hp_detail">Wi-Fi(무료)</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_tub() }">
							<tr>
								<th>
									<i class="fa fa-bath" aria-hidden="true"></i>
									<span class="hp_categoty">욕실시설</span>
								</th>
								<td>
									<span class="hp_detail">욕조</span>
									<span class="hp_detail">비데</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_pool() }">
							<tr>
								<th>
									<i class="fa fa-wifi" aria-hidden="true"></i>
									<span class="hp_categoty">수영장</span>
								</th>
								<td>
									<span class="hp_detail">수영장</span>
									<span class="hp_detail">수영장 썬베드</span>
									<span class="hp_detail">수영장 카바나 이용(유료)</span>
									<span class="hp_detail">어린이 수영장, 유아풀</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_restaurant() }">
							<tr>
								<th>
									<i class="fa fa-cutlery" aria-hidden="true"></i>
									<span class="hp_categoty">레스토랑</span>
								</th>
								<td>
									<span class="hp_detail">바비큐 그릴</span>
									<span class="hp_detail">스낵바/델리</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_parking() }">
							<tr>
								<th>
									<i class="fa fa-car" aria-hidden="true"></i>
									<span class="hp_categoty">주차</span>
								</th>
								<td>
									<span class="hp_detail">주차장(무료)</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_fitness() }">
							<tr>
								<th>
									<i class="fa fa-cutlery" aria-hidden="true"></i>
									<span class="hp_categoty">피트니스 센터</span>
								</th>
								<td>
									<span class="hp_detail">피트니스</span>
									<span class="hp_detail">필라테스</span>
									<span class="hp_detail">요가</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_bar() }">
							<tr>
								<th>
									<i class="fa fa-beer" aria-hidden="true"></i>
									<span class="hp_categoty">미니바</span>
								</th>
								<td>
									<span class="hp_detail">무료생수</span>
									<span class="hp_detail">미니바</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_terrace() }">
							<tr>
								<th>
									<i class="fa fa-cutlery" aria-hidden="true"></i>
									<span class="hp_categoty">발코니/테라스</span>
								</th>
								<td>
									<span class="hp_detail">발코니/테라스</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${hpDTO.isHp_sauna() }">
							<tr>
								<th>
									<i class="fa fa-cutlery" aria-hidden="true"></i>
									<span class="hp_categoty">스파/웰빙</span>
								</th>
								<td>
									<span class="hp_detail">사우나</span>
									<span class="hp_detail">마사지룸</span>
									<span class="hp_detail">스파</span>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div id="room_info">
					<div class="title_txt">
						<strong>전체 객실</strong>
					</div>
					<c:forEach items="${roomList }" var="roDTO">
						<div class="room_content">
							<div class="room_content_img">
								<c:forEach begin="1" end="${roDTO.getRoom_photo_folder_size() }" var="i">
									<img onclick="nextSlideImg(this)" alt="" src="<%=request.getContextPath() %>/image/hotel/${roDTO.getRoom_photo_folder() }/${i }.jpg" width="100" height="100">
								</c:forEach>
							</div>
							<div class="room_content_info">
								<div id="room_detail">
									<strong id="room_title">${roDTO.getRoom_name() }</strong>
									<ul>
										<li><i id="bed_icon" class="fa fa-bed" aria-hidden="true"></i>${roDTO.getRoom_bed() } 침대 보유 / 숙박인원 ${roDTO.getRoom_people_min() }~${roDTO.getRoom_people_max() } 명 </li>
										<li>${roDTO.getRoom_size() }m<sup>2</sup> 크기의 객실</li>
										<li><c:if test="${roDTO.getRoom_breakfast()== 'Y' }"><i class="fa fa-cutlery" aria-hidden="true"></i> 조식 포함</c:if></li>
										<li>체크인 ${roDTO. getRoom_checkin()}:00 PM, 체크아웃 ${roDTO. getRoom_checkout()}:00 AM</li>
									</ul>
								</div>
								<div id="room_price">
									<span class="room_price_txt">1박 기준</span>
									<strong><fmt:formatNumber value="${roDTO.getRoom_price() }" pattern="#,###" />원</strong>
								</div>
								<div class="room_reserv">
									<input value="예약하기" type="button" onclick="location.href='hotel_payment.do?room_no=${roDTO.getRoom_no() }&hotel_no=${hoDTO.getHotel_no() }'">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
			<div id="hotel_review">
				<div class="title_txt">
					<strong>호텔 리뷰</strong>
				</div>
				<div id="review_list">
					<c:if test="${!empty reviewList }">
					<div id="hotel_review_table">
						<div id="hotel_review_table_div">
							<c:forEach items="${reviewList }" var="reDTO">
							<div class="hotel_review_div">
								<div class="hotel_review_content_head">
									<div class="hotel_review_content_table">
										<table>
											<tr>
												<th>작성자</th>
												<td>${reDTO.getReview_writer() }</td>
											</tr>
											<tr>
												<th>투숙일</th>
												<td>${reDTO.getReview_checkindate().substring(5,10) }</td>
											</tr>
											<tr>
												<c:forEach items="${roomList }" var="roDTO">
													<c:if test="${roDTO.getRoom_no() == reDTO.getReview_roomno() }">
														<th><i class="fa fa-bed" aria-hidden="true"></i></th>
														<td>${roDTO.getRoom_name() }</td>
													</c:if>
												</c:forEach>
											</tr>
											<tr>
												<th>작성일</th>
												<td>${reDTO.getReview_date().substring(2,10) }</td>
											</tr>
											<tr>
												<th>평점</th>
												<td>${reDTO.getReview_point() }/10</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="hotel_review_content_body">
									<div id="hotel_review_txt">
										<% pageContext.setAttribute("newLine", "\r\n"); %>
										${fn:replace(reDTO.getReview_content(), newLine, '<br/>')}
									</div>
								</div>
								<div class="hotel_review_content_image">
									<c:if test="${reDTO.getReview_photo()!=null }">
										<img alt="" src="<%=request.getContextPath() %>/image/review/${reDTO.getReview_photo() }" width="130" height="130">
									</c:if>
								</div>
							</div>
							<div id="review_delete_btn">
								<c:if test="${user.getUser_no() == reDTO.getReview_userno() || user.getUser_no() == 1}">
									<input class="hotel_review_content_delete" type="button" onclick="location.href='<%=request.getContextPath() %>/review_delete.do?review_no=${reDTO.getReview_no() }&hotel_no=${hoDTO.getHotel_no() }'" value="리뷰 삭제">
								</c:if>
							</div>
							</c:forEach>
						</div>
					</div>
					</c:if>
					<c:if test="${empty reviewList }">
					<h3>리뷰가 없습니다.</h3>
					</c:if>
				</div>
				<div id="review_write">
					<div class="title_txt">
						<strong>호텔 리뷰  작성하기</strong>
					</div>
					<c:if test="${!empty reservList}">
						<form action="<%=request.getContextPath() %>/review_insert.do" method="post" enctype="multipart/form-data" onsubmit="return review_check()">
							<input type="hidden" value="${hoDTO.getHotel_photo_folder() }" name="review_hotelname">
							<table id="review_write_table">
								<tr>
									<th>별점</th>
									<td>
										<div class="rating_box">
											<div class="rating">
												★★★★★
												<span class="rating_star">★★★★★</span>
										    	<input type="range" name="review_point" id="starInput" value="1" step="1" min="0" max="10" onclick="starDrag()">
											</div>
										</div>
									</td>
									<td rowspan="2">
										<textarea id="review_content" rows="5" cols="50" name="review_content" placeholder="이용하신 호텔에 대한 리뷰를 작성해주세요 :)!"></textarea>
									</td>
								</tr>
								<tr id="second_line">
									<th>객실 종류</th>
									<td>
										<select id="review_reservno" name="review_reservno">
											<c:forEach items="${reservList }" var="dto">
												<option value="${dto.getReserv_no() }">${dto.getReserv_roomname() }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>
										<input value="${user.getUser_name() }" readonly="readonly" style="width: 50px;" name="review_username">
									</td>
									<td>
										<input type="file" id="review_file" name="review_file">
									</td>
								</tr>
							</table>
							<div id="review_write_btn">
								<input type="submit" value="리뷰 등록">
								<input type="reset" value="다시 작성">
							</div>
						</form>
					</c:if>
					<c:if test="${empty reservList}">
						<h4>예약 정보가 있어야 리뷰를 작성하실 수 있습니다.</h4>
					</c:if>
				</div>
			</div>
			<c:if test="${!empty sessionScope.VisitList }">
			<c:set var="visitList" value="${sessionScope.VisitList }" />
			<div id="visit_hotel">
				<div class="title_txt">
					<strong>최근 본 호텔</strong>
				</div>
				<c:forEach items="${visitList }" var="visitDTO">
				<div id="visit_hotel_cont">
					<div class="visit_hotel_cont_img">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${visitDTO.getHotel_photo_folder() }/main.jpg" width="150" height="150" onclick="location.href='<%=request.getContextPath() %>/hotel_get_Content.do?hotel_no=${visitDTO.getHotel_no() }'">
					</div>
					<div class="visit_hotel_cont_txt">
						<p><a href="<%=request.getContextPath() %>/hotel_get_Content.do?hotel_no=${visitDTO.getHotel_no() }">${visitDTO.getHotel_name() }</a><br>
						${visitDTO.getHotel_star() }성급<br>
						별점 : ${visitDTO.getHotel_point() }/10.0</p>
					</div>
				</div>
				</c:forEach>
			</div>
			</c:if>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>