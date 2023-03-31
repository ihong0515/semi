<%@page import="com.model.hotel.HotelPolicyDTO"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.review_table{
	border: 1px solid #c0c0c0;
	border-collapse: collapse;
}
#review_write_table,
#review_write_table tr,
#review_write_table th,
#review_write_table td{
	border: 1px solid #c0c0c0;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<c:if test="${!empty hoDTO }">
				<div id="hotel_all_info">
					<div id="hotel_info">
						${hoDTO.getHotel_name() } <c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach> ${hoDTO.getHotel_point() }/10.0<br>
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/main.jpg" width="100" height="100"><br>
						${hoDTO.getHotel_addr() }<br>
						${hoDTO.getHotel_info() }<br>
						<hr>
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
					<div id="room_info">
						<c:forEach items="${roomList }" var="roDTO">
							<div class="room_content">
								${roDTO.getRoom_name() }
								<div>
									<c:forEach begin="1" end="${roDTO.getRoom_photo_folder_size() }" var="i">
										<img alt="" src="<%=request.getContextPath() %>/image/hotel${roDTO.getRoom_photo_folder() }${i }.jpg" width="50" height="50">
									</c:forEach><br>
									<i class="fa fa-bed" aria-hidden="true"></i>${roDTO.getRoom_bed() } / 숙박인원 ${roDTO.getRoom_people_min() }~${roDTO.getRoom_people_max() }<br>
									${roDTO.getRoom_size() }m<sup>2</sup>&nbsp;&nbsp;<c:if test="${roDTO.getRoom_breakfast()== 'Y' }"><i class="fa fa-cutlery" aria-hidden="true"></i></c:if><br>
									${roDTO. getRoom_checkin()}:00까지 체크인
								</div>
							</div>
							<div class="room_reserv">
								가격 : ${roDTO.getRoom_price() }원 <input value="예약하기" type="button" onclick="location.href='hotel_payment.do?room_no=${roDTO.getRoom_no() }&hotel_name=${hoDTO.getHotel_name() }'">
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<div id="hotel_review">
			<hr>
				<c:if test="${!empty reviewList }">
					<c:forEach items="${reviewList }" var="reDTO">
						<table class="review_table">
							<tr>
								<th>
									${reDTO.getReview_writer() }
								</th>
								<td>
									${reDTO.getReview_point() }/10
								</td>
								
						<c:if test="${reDTO.getReview_update()==null }">
								<th>
									작성일
								</th>
								<td>
									${reDTO.getReview_date().substring(2,10) }
								</td>
						</c:if>
						<c:if test="${reDTO.getReview_update()!=null }">
								<th>
									수정일
								</th>
								<td>
									${reDTO.getReview_update().substring(2,10) }
								</td>
						</c:if>
							</tr>
							<tr>
								<td colspan="2">
									<c:forEach items="${roomList }" var="roDTO">
										<c:if test="${roDTO.getRoom_no() == reDTO.getReview_roomno() }">
											${roDTO.getRoom_name() }
										</c:if>
									</c:forEach>
								</td>
								<th>
									사용일
								</th>
								<td>
									${reDTO.getReview_checkindate().substring(2,10) }
								</td>
							</tr>
							<tr>
								<th>
									내용
								</th>
								<td colspan="3">
									<% pageContext.setAttribute("newLine", "\r\n"); %>
									${fn:replace(reDTO.getReview_content(), newLine, '<br/>')}
								</td>
							</tr>
						<c:if test="${reDTO.getReview_photo()!=null }">
							<tr>
								<td colspan="4">
								<img alt="" src="<%=request.getContextPath() %>/image/review/${reDTO.getReview_photo() }" width="50" height="50">
								</td>
							</tr>
						</c:if>
						<c:if test="${user.getUser_no() == reDTO.getReview_userno() }">
							<tr>
								<td colspan="2">
									<input type="button" onclick="location.href='<%=request.getContextPath() %>/review_delete.do?review_no=${reDTO.getReview_no() }&hotel_no=${hoDTO.getHotel_no() }'" value="삭제">
								</td>
							</tr>
						</c:if>
						</table>
					</c:forEach>
				</c:if>
				<c:if test="${empty reviewList }">
					<h3>리뷰가 없습니다.</h3>
				</c:if>
				<hr>
				<div id="review_write">
					<c:if test="${user!=null }">
						<form action="<%=request.getContextPath() %>/review_insert.do" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${hoDTO.getHotel_photo_folder() }" name="review_hotelname">
							<input type="hidden" value="${hoDTO.getHotel_no() }" name="review_hotelno">
							<input type="hidden" value="${user.getUser_no() }" name="review_userno">
							<table id="review_write_table">
								<tr>
									<td colspan="2">
										<input type="number" placeholder="평점" name="review_point" min="0" max="10">
									</td>
								</tr>
								<tr>
									<th>
										<input value="${user.getUser_id() }" readonly="readonly" style="width: 50px;" name="review_userid">
									</th>
									<td>
										<textarea rows="5" cols="50" name="review_content"></textarea>
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
					<c:if test="${user==null }">
						<h5>로그인을 하세요.</h5>
					</c:if>
				</div>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>