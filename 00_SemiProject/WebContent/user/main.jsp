<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${sessionScope.loginUser}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content">
			<h2>고객 로그인</h2>
			<br>
			
			<c:if test="${empty dto}">
				<h1>로그인 페이지</h1>
				<form method="post" action="<%=request.getContextPath() %>/user_login.do">
					ID:<input type="text" name="id"><br>
					PW:<input type="password" name="pwd">
					<input type="submit" value="로그인">
					<input type="reset" value="취소">
					<a href="<%=request.getContextPath() %>/user_join.do">회원가입</a>
				</form>
			</c:if>
			
			<c:if test="${!empty dto}">
				<h2>${sessionScope.loginUser_name }님 환영합니다!</h2>
				<a href="<%=request.getContextPath() %>/user_list.do">전체 회원조회</a>
				<a href="<%=request.getContextPath() %>/user_myPage.do?no=${dto.getUser_no}">마이페이지 </a>
			</c:if>
			
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>