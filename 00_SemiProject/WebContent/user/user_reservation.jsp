<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 예약 정보 리스트</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_reservation.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user/user_reservation.css">
<c:set var="user_dto" value="${sessionScope.loginUser }" />
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
    		<jsp:include page="../user/user_mypage_header.jsp"/>
			<div id="reserve_list">
				<h2>숙소 예약 내역</h2>
				<div id="reserv_button">
					<a class="reserv" id="reserv_N" onclick="getReserv(this)">사용 전</a>
					<a class="reserv" id="reserv_Y" onclick="getReserv(this)">사용 후</a>
					<a class="reserv" id="reserv_C" onclick="getReserv(this)">취소</a>
				</div>
				<div id="reserv_span">
					<span id="reserv_count"></span>
				</div>
				<div id="reserv_content">
					<h4>버튼을 눌러 예약내역을 확인하세요.</h4>
				</div>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</body>
</html>