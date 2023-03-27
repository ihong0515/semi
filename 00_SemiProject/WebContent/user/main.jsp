<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      		<div align="center">
				<h2>고객 회원가입</h2>
				<br>
				<a href="<%=request.getContextPath() %>/user_list.do">[전체 회원 목록]</a>
				<a href="<%=request.getContextPath() %>/user_join.do">[회원가입]</a>
				<a href="<%=request.getContextPath() %>/user_myPage.do">[마이페이지]</a>
			</div>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>