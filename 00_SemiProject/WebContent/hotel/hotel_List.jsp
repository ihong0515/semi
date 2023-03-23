<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="list" value="${List }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<div id="sidebar">
				
			</div>
			<div id="main">
				<nav>
					<ul>
						<li><a href="#">인기 호텔</a></li>
						<li><a href="#">요금 순</a></li>
						<li><a href="#">성급</a></li>
						<li><a href="#">평점</a></li>
					</ul>
				</nav>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<div id="cnt">
							<img alt="" src="../image/hotelsample.jpg" width="150px" height="150px">
							<div>
								${dto.getHotel_Name() } 
								<c:forEach begin="1" end="${dto.getHotel_Star().length() }">
									★
								</c:forEach>
								${dto.getHotel_Point() }/10
								${dto.getHotel_price_Min() }원
								<input type="button" onclick="location.href='<%=request.getContextPath() %>/getHotel_Content.do?no=${dto.getHotel_No() }'">
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<div>
						<h4>조건에 맞는 호텔 리스트가 없습니다.</h4>
					</div>
				</c:if>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>