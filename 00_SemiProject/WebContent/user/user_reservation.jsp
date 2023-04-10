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
<c:set var="user_dto" value="${sessionScope.loginUser }" />
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content" align="center">
	    		<input type="hidden" name="user_no" value="${user_dto.getUser_no() }">
				<h2>${user_dto.getUser_name() }님 숙소 예약 내역 리스트</h2>
				<div id="container">
					<a class="reserv" id="reserv_N" onclick="getReserv(this)">사용 전</a>&nbsp;&nbsp;
					<a class="reserv" id="reserv_Y" onclick="getReserv(this)">사용 후</a>&nbsp;&nbsp;
					<a class="reserv" id="reserv_C" onclick="getReserv(this)">취소</a>
					<br>
					<lable>총 <span id="reserv_count"></span>개</lable>
					<div id="reserv_content"></div>
				</div>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</body>
</html>