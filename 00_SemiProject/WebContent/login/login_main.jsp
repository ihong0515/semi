<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login/login_main.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login/login_main.js"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
			<div id="login_main">
				<div id="login_title">L O G I N</div>
				<div id="login_main_wrap">
					<form method="post" action="<%=request.getContextPath() %>/user_login.do">
						<div id="login_main_inp">
							<input type="text" id="user_id" name="id" placeholder="아이디">
							<input type="password" id="user_pwd" name="pwd" placeholder="비밀번호">
						</div>
						<div id="login_main_btn">
							<input type="submit" id="login_btn" value="LOGIN">
							<input type="button" id="join_btn" value="JOIN" onclick="location.href='<%=request.getContextPath() %>/user_join.do'">
						</div>
					</form>
					<div id="login_main_a">
						<a href="javascript:openSearchPage('<%=request.getContextPath() %>/login/login_id_search.jsp')">아이디 찾기</a>
						<a href="javascript:openSearchPage('<%=request.getContextPath() %>/login/login_pwd_search.jsp')">비밀번호 찾기</a>
					</div>
				</div>
			</div>
    	</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>