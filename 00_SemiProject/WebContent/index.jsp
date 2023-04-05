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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/index/index.js"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="include/header.jsp" />
		
		<%--main content --%>
		<%-- 기본 커서 서울에 잡혀 있게 할 예정. --%>
		<%--지역별 별점순(내림차순 정렬후) 숙소 추천  배너--%>
		<h5>지역별 리스트 별점순 추천 페이징</h5>
		<section>
			<nav>
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
					 <h3>별점순 리스트(ajax)</h3>
					<table id="star_list_Table" cellspacing="0">
						 <tr>
							<th>여기는 어떄여</th>
						</tr>
					</table>
			<%--지역 별 최저가 순 추천 --%>
			<nav>
				<!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
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
				<h3>최저가  리스트(ajax)</h3>
				
			
				<table id="low_list_Table" cellspacing="0">
					<tr>
						<th>여기도 어떄여</th>
					</tr>	
				</table>
		</section>
		<hr>
		<%--main contentend --%>
		<jsp:include page="/include/footer.jsp" />
		
	</div>
</body>
</html>
