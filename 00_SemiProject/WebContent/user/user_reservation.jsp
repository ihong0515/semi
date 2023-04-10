<%@page import="com.model.hotel.HotelDAO"%>
<%@page import="com.model.hotel.HotelDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dtoUser" value="${sessionScope.loginUser }" />
<c:set var="dtoHotel" value="${dtoHotel }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약 내역</title>
<script type="text/javascript">

 function cancelReservCheck(no) {
	 let res = confirm("예약을 취소하시겠습니까?")
	 
	 if(res) {
		 location.href = "user_reserv_cancel.do?reserv_no="+no;
	 }
 }

</script>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content" align="center">
	    		<input type="hidden" name="user_no" value="${dtoUser.getUser_no() }">
				<h2>${dtoUser.getUser_name() }님 숙소 예약 내역 리스트</h2>
				<br>
				
				<c:set var="list" value="${reservList }"/>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dtoReserv">
						<ul>
							<li><img onclick="location.href='user_reserv_content.do?hotel_no=${dtoReserv.getReserv_hotelno() }'"
								 src='/00_SemiProject/image/hotel/${dtoHotel.getHotel_photo_folder() }/main.jpg' style='width:100px; height:100px;'></li>
							<li><h3>${dtoReserv.getReserv_hotelname() }</h3></li>
							<li>객실명: ${dtoReserv.getReserv_roomname() }</li>
							<li>체크인: ${dtoReserv.getReserv_start().substring(0,10) }</li>
							<li>체크아웃: ${dtoReserv.getReserv_end().substring(0,10) }</li>
							<li>결제금액: <fmt:formatNumber value="${dtoReserv.getReserv_realprice() }" type="currency" />원</li>
							<li><input type="button" value="예약 취소" onclick="cancelReservCheck(${dtoReserv.getReserv_no() })"></li>
						</ul>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<ul>
						<li>예약 내역이 존재하지 않습니다.</li>
					</ul>
				</c:if>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>