<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_reservation.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user/user_reservation.css">
<c:set var="user_dto" value="${sessionScope.loginUser }" />
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
				<h2>${user_dto.getUser_name() }님 숙소 예약 내역 리스트</h2>
				<div id=reserve_list>
					<a class="reserv" id="reserv_N" onclick="getReserv(this)">사용 전</a>&nbsp;&nbsp;
					<a class="reserv" id="reserv_Y" onclick="getReserv(this)">사용 후</a>&nbsp;&nbsp;
					<a class="reserv" id="reserv_C" onclick="getReserv(this)">취소</a>
					<br>
					총 <span id="reserv_count"></span>개
					<div id="reserv_content"></div>
					<input type="hidden" id="use_check" value="">
				</div>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</body>
</html>