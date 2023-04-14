<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_header</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/user_mypage_header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div id="mypage_header">
		<div id="mypage_title">M Y &nbsp;&nbsp; P A G E</div>
		<div id="mypage_username">${user_dto.getUser_name() }님 반가워요!</div>
		<div id="mypage_txt">GoCatchStay에서 오늘도 즐거운 예약하세요 :) </div>
		<hr id="mypage_hr">
	</div>
</body>
</html>