<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="<%=request.getContextPath() %>/user_info.do">회원가입 정보</a>
	<a href="<%=request.getContextPath() %>/user_payment.do">결제 수단 등록</a>
	<a href="<%=request.getContextPath() %>/user_reservation.do">예약 내역 확인</a>
	<a href="<%=request.getContextPath() %>/user_q&a.do">1:1 문의 내역 확인</a>
	<a href="<%=request.getContextPath() %>/user_review.do">작성한 리뷰 확인</a>

</body>
</html>