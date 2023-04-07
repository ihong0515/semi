<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_myPage.jsp</title>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
			<h2>${dto.getUser_name() }님의 마이페이지</h2>
			<br>
			
			<ul>
				<li><a href="<%=request.getContextPath() %>/user_info.do?no=${dto.getUser_no() }">회원 상세 정보</a></li>
				<li><a href="<%=request.getContextPath() %>/user_payment.do?no=${dto.getUser_no() }">내 결제수단 정보</a></li>
				<li><a href="<%=request.getContextPath() %>/user_reservation.do?no=${dto.getUser_no() }">예약 내역 확인</a></li>
				<li><a href="<%=request.getContextPath() %>/user_jjim.do?no=${dto.getUser_no() }">찜 목록</a></li>
				<li><a href="<%=request.getContextPath() %>/user_board_main.do">1:1 문의 내역 확인</a></li>
				<li><a href="<%=request.getContextPath() %>/user_coupon.do?no=${dto.getUser_no() }">보유 쿠폰</a></li>
			</ul>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>