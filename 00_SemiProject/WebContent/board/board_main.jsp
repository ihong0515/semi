<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
    	
    	<hr width="50%">
    		<h4 align="center">1:1 고객센터 게시판 메인 페이지</h4>
    	<hr width="50%">
    	
    	<br>
    	
    	<a href="<%=request.getContextPath() %>/board_list.do">[1:1 고객센터 게시판 목록]</a>
    	
    	</div>
    	
    	<jsp:include page="../include/footer.jsp" />
    </div>
</body>
</html>