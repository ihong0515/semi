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
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<c:if test="${!empty hoDTO }">
				<div>
					<div id="hotel_info">
						${hoDTO.getHotel_name() } <c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach> ${hoDTO.getHotel_point() }/10.0<br>
						${hoDTO.getHotel_addr() }<br>
						${hoDTO.getHotel_info() }
					</div>
					<div id="room_info">
						<c:forEach items="${roomList }" var="roDTO">
							<div class="room_content">
								${roDTO.getRoom_name() }
								<div>
									<c:forEach begin="1" end="${roDTO.getRoom_photo_folder_size() }" var="i">
										<img alt="" src="<%=request.getContextPath() %>/image${roDTO.getRoom_photo_folder() }/${i }.jsp"><br>
									</c:forEach>
									${roDTO.getRoom_bed() } / ${roDTO.getRoom_people_min() }~${roDTO.getRoom_people_max() }<br>
									${roDTO.getRoom_size() }m<sup>2</sup>
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