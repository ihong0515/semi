<%@page import="com.model.hotel.HotelPolicyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="hoDTO" value="${HotelDTO }"/>
<c:set var="hpDTO" value="${HPDTO }"/>
<c:set var="roomList" value="${RoomList }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	border-bottom: 1px solid black;
}
</style>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<c:if test="${!empty hoDTO }">
				<div>
					<div id="hotel_info">
						${hoDTO.getHotel_name() } <c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach> ${hoDTO.getHotel_point() }/10.0<br>
						<img alt="" src="<%=request.getContextPath() %>/image/${hoDTO.getHotel_photo_folder() }/main.jpg" width="100" height="100"><br>
						${hoDTO.getHotel_addr() }<br>
						${hoDTO.getHotel_info() }<br>
						<hr>
						<c:if test="${hpDTO.isHp_Wifi()!=0 }">
							<i class="fa fa-wifi" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Tub()!=0 }">
							<i class="fa fa-bath" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Pool()!=0 }">
							<i class="fa fa-wifi" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Restaurant()!=0 }">
							<i class="fa fa-cutlery" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Parking()!=0 }">
							<i class="fa fa-car" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Fitness()!=0 }">
							<i class="fa fa-cutlery" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Bar()!=0 }">
							<i class="fa fa-beer" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Terrace()!=0 }">
							<i class="fa fa-cutlery" aria-hidden="true"></i>
						</c:if>
						<c:if test="${hpDTO.isHp_Sauna()!=0 }">
							<i class="fa fa-cutlery" aria-hidden="true"></i>
						</c:if>
					</div>
					<div id="room_info">
						<c:forEach items="${roomList }" var="roDTO">
							<div class="room_content">
								${roDTO.getRoom_name() }
								<div>
									<c:forEach begin="1" end="${roDTO.getRoom_photo_folder_size() }" var="i">
										<img alt="" src="<%=request.getContextPath() %>/image${roDTO.getRoom_photo_folder() }${i }.jpg" width="50" height="50">
									</c:forEach><br>
									${roDTO.getRoom_bed() } / ${roDTO.getRoom_people_min() }~${roDTO.getRoom_people_max() }<br>
									${roDTO.getRoom_size() }m<sup>2</sup>&nbsp;&nbsp;<c:if test="${roDTO.getRoom_breakfast()== 'Y' }"><i class="fa fa-cutlery" aria-hidden="true"></i></c:if><br>
									${roDTO. getRoom_checkin()}:00까지 체크인
								</div>
								<div>
									
								</div>
							</div>
							<div class="room_reserv">
								가격 : ${roDTO.getRoom_price() }원 <input value="예약하기" type="button" onclick="location.href='hotel_payment.do?room_no=${roDto.getRoom_no()}&hotel_name=${hoDTO.getHotel_name() }'">
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>