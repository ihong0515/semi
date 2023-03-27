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
      		<div>
      			
				<h2>고객 정보 수정</h2>
				<br>
				<ul>
					<li><a href="<%=request.getContextPath() %>/user_info.do?no=${dto.getUser_no() }">회원가입 정보</a></li>
					<li><a href="<%=request.getContextPath() %>/user_payment.do">결제 수단 등록</a></li>
					<li><a href="<%=request.getContextPath() %>/user_reservation.do">예약 내역 확인</a></li>
					<li><a href="<%=request.getContextPath() %>/user_q&a.do">1:1 문의 내역 확인</a></li>
					<li><a href="<%=request.getContextPath() %>/user_review.do">작성한 리뷰 확인</a></li>
				</ul>
			</div>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>