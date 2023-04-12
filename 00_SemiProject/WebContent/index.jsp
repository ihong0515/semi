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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">

</head>
<body>
	<div id="container">
		<div id="index_content">
			<jsp:include page="include/header.jsp" />
			<h1 class="list_title">별점순 추천</h1>
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
			<div class="star_list_Table_bg">
				<div class="star_list_Table">
				</div>		
			</div>
			<div class="prom_banner">
				<img src="<%=request.getContextPath() %>/image/include/prom_banner1.png" onclick="location.href='<%=request.getContextPath()%>/PromotionList.do'" width="800px">
			</div>
			<h1 class="list_title">최저가순 추천</h1>
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
			<div class="low_list_Table_bg">
				<div class="low_list_Table">
				</div>
			</div>
		</div><%--main contentend --%>
		<jsp:include page="/include/footer.jsp" />
	</div>
</body>
</html>
