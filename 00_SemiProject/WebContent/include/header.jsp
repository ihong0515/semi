<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="login" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<h5>상단 네비바 1↑</h5>
		<nav><!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
          <ul>
            <c:if test="${empty login}">
                     <a href="<%=request.getContextPath()%>/user/main.jsp">로그인</a>
                  </c:if>
                  <c:if test="${!empty login}">
                     <a href="">마이페이지</a>
                  </c:if>
            <li><a href="">비밀번호찾기</a></li>
            <li><a href="../user/user_join_normal.jsp">회원가입</a></li>
            <li><a href="">고객센터</a></li>
            
          </ul>
        </nav>
			
		<hr>
	
		<h5>상단 네비바 2↑</h5>
		<nav><!--구현 기능접속 네비바  -->
          <ul>
            <li><a href="">호텔검색</a></li>
            <li><a href="">업체등록페이지</a></li>
            <li><a href="../user/user_myPage.jsp">마이페이지</a></li>
            <li><a href="">고객센터</a></li>
            
          </ul>
        </nav>
        
        <hr>
	</div>
</body>
</html>