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
		<jsp:include page="include/header.jsp" />
		<div id="content">
			<div id="title">
				<h1 class="list_title">별점순 추천</h1>
			</div>
			<div id="content_search">
				<nav class="index_search">
					<ul>
						<li><input type="button" class="Starlocation" id="starlocation-active" value="서울" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="경기" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="강원" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="전남" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="전북" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="충북" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="충남" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="경남" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="경북" onclick="starClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="Starlocation" value="제주" onclick="starClick(this); serchHotelList(this);"></li>
					</ul>
				</nav>
			</div>
			<div class="star_list_Table_bg">
				<div class="star_list_Table">
				</div>		
			</div>
			<div class="prom_banner">
				<img src="<%=request.getContextPath() %>/image/include/prom_banner1.png" onclick="location.href='<%=request.getContextPath()%>/PromotionList.do'" width="800px">
			</div>
			<div id="title">
				<h1 class="list_title">최저가순 추천</h1>
			</div>
			<div id="content_search">
				<nav class="index_search">
					<ul>
						<li><input type="button" class="lowPricelocation" id="lowPricelocation-active" value="서울" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="경기" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="강원" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="전남" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="전북" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="충북" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="충남" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="경남" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="경북" onclick="lowClick(this); serchHotelList(this);"></li>
						<li><input type="button" class="lowPricelocation" value="제주" onclick="lowClick(this); serchHotelList(this);"></li>
					</ul>
				</nav>
			</div>
			<div class="low_list_Table_bg">
				<div class="low_list_Table">
				</div>
			</div>
		</div>
		<jsp:include page="/include/footer.jsp" />
	</div>
</body>
</html>
