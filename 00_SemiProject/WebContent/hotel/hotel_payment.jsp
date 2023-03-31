<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hoDTO" value="${HotelDTO }" />
<c:set var="roDTO" value="${RoomDTO }" />
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
			<div id="payment">
				<div id="payment_hotel">
					<div id="payment_hotel_img">
						<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/main.jpg" width="100px" height="100px">
					</div>
					<div id="payment_hotel_cont">
						${hoDTO.getHotel_name() } <c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach><br>
						${roDTO.getRoom_name() }<br>
						<i class="fa fa-user-o" aria-hidden="true"></i>${roDTO.getRoom_people_min() }~${roDTO.getRoom_people_max() }
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>