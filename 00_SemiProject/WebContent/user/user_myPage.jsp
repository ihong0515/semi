<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_myPage.jsp</title>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content">
    		<c:set var="dto" value="${sessionScope.loginUser }" />
      		<div>
				<h2>고객 정보 수정</h2>
				<ul>
					<li><a href="<%=request.getContextPath() %>/user_info.do?no=${dto.getUser_no() }">${dto.getUser_name() }님의 회원정보</a></li>
					<li><a href="<%=request.getContextPath() %>/user_reservation.do">예약 내역 확인</a></li>
					<li><a href="<%=request.getContextPath() %>/user_jjim.do">찜 목록</a></li>
					<li><a href="<%=request.getContextPath() %>/user_q&a.do">1:1 문의 내역 확인</a></li>
					<li><a href="<%=request.getContextPath() %>/user_coupon.do">보유 쿠폰</a></li>
				</ul>
			</div>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>