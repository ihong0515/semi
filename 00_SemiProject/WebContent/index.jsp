<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="container">
		<jsp:include page="/include/header.jsp" />
		
		<%--main content --%>
		<%-- 기본 커서 서울에 잡혀 있게 할 예정. --%>
		<%--지역별 별점순(내림차순 정렬후) 숙소 추천  배너--%>
		<h5>지역별 리스트 별점순 추천 페이징</h5>
		<section>
			<nav>
				<!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
				<ul>
					<li><a href="hotel_StarSearch.do?Location=서울">서울</a></li>
					<%--클릭에 따라 요청 정보가 다르게 넘어가게.?하고 search.do 뒤로 
            		이게 셀렉트 박스 처럼 지역이 딱 잡혀야 하는데.--%>
					<li><a href="hotel_StarSearch.do?Location=경기">경기</a></li>
					<li><a href="hotel_StarSearch.do?Location=강원">강원</a></li>
					<li><a href="hotel_StarSearch.do?Location=전남">전남</a></li>
					<li><a href="hotel_StarSearch.do?Location=전북">전북</a></li>
					<li><a href="hotel_StarSearch.do?Location=충북">충북</a></li>
					<li><a href="hotel_StarSearch.do?Location=충남">충남</a></li>
					<li><a href="hotel_StarSearch.do?Location=경남">경남</a></li>
					<li><a href="hotel_StarSearch.do?Location=경북">경북</a></li>
					<li><a href="hotel_StarSearch.do?Location=제주">제주</a></li>
				</ul>
			</nav>
			<table border="1" cellspacing="0" width="150">
				<c:set var="list" value="${hotel_Star_List}" />
				<c:if test="${!empty list }">

					<c:forEach items="${list}" var="dto" begin="1" end="3">

						<tr><%--이미지 출력 --%>
							<td>
							<img src="<%=request.getContextPath() %>/image/hotel/${dto.getHotel_photo_folder()}/main.jpg"
								width="150px" height="150px">
							</td>
						</tr>
						<tr>
							<td>${dto.getHotel_name()}</td>
						</tr>
						<tr>
							<!--별점 출력 반복문  -->
							<td>
							<c:if test="${!empty dto.getHotel_star()}">
								<c:forEach begin="1" end="${dto.getHotel_star()}">
								★
								</c:forEach>
							</c:if>
							</td>
						</tr>
						<tr><%--최저가--%>
							<td>${dto.getHotel_price_min()}</td>
						</tr>
					</c:forEach>

				</c:if>

				<%--등록된 업체가 없을경우 --%>
				<c:if test="${empty hotel_Star_List}">
					<tr>
						<td colspan="4" align="center">
							<h3>예약가능숙소가 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
		</section>
		<hr>
		
		<h5>지역별 최저가순 추천</h5>
		<section>
			<nav>
				<ul>
					<%--기본 커서는 서울에  가있어야 함. --%>
					<li><a href="hotel_lowPriceSearch.do?Location=서울">서울</a></li>
					<%--클릭에 따라 요청 정보가 다르게 넘어가게. --%>
					<li><a href="hotel_lowPriceSearch.do?Location=경기">경기</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=강원">강원</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=전남">전남</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=전북">전북</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=충북">충북</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=충남">충남</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=경남">경남</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=경북">경북</a></li>
					<li><a href="hotel_lowPriceSearch.do?Location=서울">제주</a></li>
				</ul>
			</nav>
			<table border="1" cellspacing="0" width="400">
				<c:set var="list" value="${hotel_LowPrice_List}" />
				<c:if test="${!empty hotel_LowPrice_List}">
					<c:forEach items="${list}" var="dto" begin="1" end="3">

						<tr><%--이미지 출력 --%>
							<td>
							<img src="<%=request.getContextPath() %>/image/hotel/${dto.getHotel_photo_folder()}/main.jpg"
								width="150px" height="150px">
							</td>
						</tr>
						<tr>
							<td>${dto.getHotel_name()}</td>
						</tr>
						<tr>
							<!--별점 출력 반복문  -->
							<td>
							<c:if test="${!empty dto.getHotel_star()}">
								<c:forEach begin="1" end="${dto.getHotel_star()}">
								★
								</c:forEach>
							</c:if>
							</td>
						</tr>
						<tr><%--최저가--%>
							<td>${dto.getHotel_price_min()}</td>
						</tr>
					</c:forEach>
				</c:if>
				<%--등록된 업체가 없을경우 --%>
				<c:if test="${empty hotel_LowPrice_List}">
					<tr>
						<td colspan="4" align="center">
							<h3>예약가능숙소가 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
		</section>
		<hr>
		<%--main contentend --%>
		
		<jsp:include page="/include/footer.jsp" />
	</div>
</body>
</html>