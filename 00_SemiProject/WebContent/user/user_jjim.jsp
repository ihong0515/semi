<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<c:set var="hotel_dto1" value="${hotel_dto1 }" />
<c:set var="hotel_dto2" value="${hotel_dto2 }" />
<c:set var="hotel_dto3" value="${hotel_dto3 }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 호텔 내역</title>
</head>
<body>

	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
				<div align="center">
					<h2>${user_dto.getUser_name() }님이 찜한 숙소</h2>
					<br>
					
					<c:if test="${!empty hotel_dto1 }">
					<ul>
						<li>호텔 이름: ${hotel_dto1.getHotel_name() }</li>
						<li>호텔 이름: ${hotel_dto2.getHotel_name() }</li>
						<li>호텔 이름: ${hotel_dto3.getHotel_name() }</li>
					</ul>
					</c:if>
					
					<c:if test="${empty hotel_dto1 }">
						<ul>
							<li colspan="2" align="center">
								<p>찜한 호텔이 없습니다.</p>
							</li>
						</ul>
					</c:if>
					<br>
				</div>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>