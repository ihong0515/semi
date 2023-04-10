<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/include/index.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/include/index.css">
</head>
<body>
	<div id="container">
		<jsp:include page="include/header.jsp" />
			<nav class="index_search">
				<!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
				<ul>
					<li><input type="button" class="Starlocation" id="Starlocation" value="서울" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="경기" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="강원" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="전남" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="전북" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="충북" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="충남" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="경남" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="경북" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="Starlocation" value="제주" onclick="serchHotelList(this)"></li>
				</ul>
			</nav>
			<h1 class="list-title">별점순 추천</h1>
				<div class = "star_list_Table">		
				</div>
			<nav class="index_search">
				<ul>
					<li><input type="button" class="lowPricelocation" id="lowPricelocation" value="서울" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="경기" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="강원" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="전남" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="전북" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="충북" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="충남" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="경남" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="경북" onclick="serchHotelList(this)"></li>
					<li><input type="button" class="lowPricelocation" value="제주" onclick="serchHotelList(this)"></li>
				</ul>
			</nav>
				 <h1 class="list-title">최저가순 추천</h1>
					<div class = "low_list_Table">
					</div>
		</div><%--main contentend --%>
		<jsp:include page="/include/footer.jsp" />
</body>
</html>
