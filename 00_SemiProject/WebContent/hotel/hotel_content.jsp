<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/promotion/promotion.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
		<c:if test="${!empty hoDTO }">
			<div id="hotel_all_info">
				<div id="hotel_info">
					<div id="hotel_info_img">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/main.jpg" width="300" height="300">
					</div>
					<div id="hotel_info_detail">
						<div id="hotel_info_detail_star">
							<c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach>
						</div>
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
						
						<div id="hotel_info_detail_point">
							${hoDTO.getHotel_point() }/10.0
						</div>
						<div id="hotel_info_detail_addr">
							${hoDTO.getHotel_addr() }
						</div>
						<div id="hotel_info_detail_icon">
							<c:if test="${hpDTO.isHp_wifi() }">
								<i class="fa fa-wifi" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_tub() }">
								<i class="fa fa-bath" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_pool() }">
								<i class="fa fa-wifi" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_restaurant() }">
								<i class="fa fa-cutlery" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_parking() }">
								<i class="fa fa-car" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_fitness() }">
								<i class="fa fa-cutlery" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_bar() }">
								<i class="fa fa-beer" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_terrace() }">
								<i class="fa fa-cutlery" aria-hidden="true"></i>
							</c:if>
							<c:if test="${hpDTO.isHp_sauna() }">
								<i class="fa fa-cutlery" aria-hidden="true"></i>
							</c:if>
						</div>
					</div>
				</div>
				<div id="room_info">
					<c:forEach items="${roomList }" var="roDTO">
						<div class="room_content">
							<div class="room_content_img">
								<div>
								<c:forEach begin="1" end="${roDTO.getRoom_photo_folder_size() }" var="i">
									<img onclick="nextSlideImg(this)" alt="" src="<%=request.getContextPath() %>/image/hotel/${roDTO.getRoom_photo_folder() }/${i }.jpg" width="100" height="100">
								</c:forEach>
								</div>
								<span class="next_img">&#62;</span>
							</div>
							<div class="room_content_info">
								<div>
									${roDTO.getRoom_name() }<br>
									<i class="fa fa-bed" aria-hidden="true"></i>${roDTO.getRoom_bed() } / 숙박인원 ${roDTO.getRoom_people_min() }~${roDTO.getRoom_people_max() }<br>
									${roDTO.getRoom_size() }m<sup>2</sup>&nbsp;&nbsp;<c:if test="${roDTO.getRoom_breakfast()== 'Y' }"><i class="fa fa-cutlery" aria-hidden="true"></i></c:if><br>
									${roDTO. getRoom_checkin()}:00까지 체크인
									가격 : ${roDTO.getRoom_price() }원
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
				<div>
					<c:if test="${!empty reviewList }">
					<div id="hotel_review_table">
						<c:forEach items="${reviewList }" var="reDTO">
						<div class="hotel_review_content">
							<div class="hotel_review_content_head">
								${reDTO.getReview_writer() }<br>
								투숙일 : ${reDTO.getReview_checkindate().substring(5,10) }<br>
								<c:forEach items="${roomList }" var="roDTO">
								<c:if test="${roDTO.getRoom_no() == reDTO.getReview_roomno() }">
									<i class="fa fa-bed" aria-hidden="true"></i>&nbsp;${roDTO.getRoom_name() }
								</c:if>
								</c:forEach>
								<c:if test="${reDTO.getReview_photo()!=null }">
								<br><img alt="" src="<%=request.getContextPath() %>/image/review/${reDTO.getReview_photo() }" width="80" height="80">
								</c:if>
							</div>
							<div class="hotel_review_content_body">
								<c:if test="${user.getUser_no() == reDTO.getReview_userno() }">
								<input class="hotel_review_content_delete" type="button" onclick="location.href='<%=request.getContextPath() %>/review_delete.do?review_no=${reDTO.getReview_no() }&hotel_no=${hoDTO.getHotel_no() }'" value="삭제">
								</c:if>
								<p>${reDTO.getReview_point() }/10<br>
								<% pageContext.setAttribute("newLine", "\r\n"); %>
									${fn:replace(reDTO.getReview_content(), newLine, '<br/>')}</p>
								<p>작성일 : ${reDTO.getReview_date().substring(2,10) }</p>
							</div>
						</div>
						</c:forEach>
					</div>
					</c:if>
					<c:if test="${empty reviewList }">
					<h3>리뷰가 없습니다.</h3>
					</c:if>
				</div>
				<div id="review_write">
					<c:if test="${!empty reservList}">
					<form action="<%=request.getContextPath() %>/review_insert.do" method="post" enctype="multipart/form-data" onsubmit="return review_check()">
						<input type="hidden" value="${hoDTO.getHotel_photo_folder() }" name="review_hotelname">
						<table id="review_write_table">
							<tr>
								<td>
									Rating : <input type="number" name="review_point" min="0" max="10" value="10">
								</td>
								<td align="right">
									<select id="review_reservno" name="review_reservno">
										<c:forEach items="${reservList }" var="dto">
										<option value="${dto.getReserv_no() }">${dto.getReserv_roomname() }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>
									<input value="${user.getUser_name() }" readonly="readonly" style="width: 50px;" name="review_username">
								</th>
								<td>
									<textarea id="review_content" rows="5" cols="50" name="review_content"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="file" name="review_file">
								</td>
							</tr>
						</table>
						<div id="review_wirte_btn">
							<input type="submit" value="등록">&nbsp;&nbsp;
							<input type="reset" value="다시 작성">
						</div>
					</form>
					</c:if>
					<c:if test="${empty reservList}">
					<h4>예약 정보가 있어야 리뷰를 작성하실 수 있습니다.</h4>
					</c:if>
				</div>
			</div>
			<hr>
			<div id="hotel_detail">
				<h5>호텔 정보</h5>
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
								<div id="write_head_title">
									<input type="text" placeholder="제목을 입력하세요.">
									<span id="write_head_x" onclick="board_close()">X</span>
								</div>
							</div>
							<div id="write_body">
								<textarea rows="" cols="" placeholder="문의 내용을 입력하세요."></textarea>
							</div>
							<div id="write_foot">
								<input type="button" value="문의하기" onclick="board_write(${hoDTO.getHotel_no() })">
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<c:if test="${!empty sessionScope.VisitList }">
			<c:set var="visitList" value="${sessionScope.VisitList }" />
			<div id="visit_hotel">
				<c:forEach items="${visitList }" var="visitDTO">
				<div id="visit_hotel_cont">
					<div class="visit_hotel_cont_img">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${visitDTO.getHotel_photo_folder() }/main.jpg" width="150" height="150" onclick="location.href='<%=request.getContextPath() %>/hotel_get_Content.do?hotel_no=${visitDTO.getHotel_no() }'">
					</div>
					<div class="visit_hotel_cont_txt">
						<p><a href="<%=request.getContextPath() %>/hotel_get_Content.do?hotel_no=${visitDTO.getHotel_no() }">${visitDTO.getHotel_name() }</a><br>
						Classification : ${visitDTO.getHotel_star() }★<br>
						Rating : ${visitDTO.getHotel_point() }/10.0</p>
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