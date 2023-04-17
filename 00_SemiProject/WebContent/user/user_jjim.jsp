<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<c:set var="hotelList" value="${hotelList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 호텔 내역</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_jjim.js"></script>
<link href="<%=request.getContextPath() %>/css/user/user.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
			<div>
				<h2>${user_dto.getUser_name() }님이 찜한 숙소</h2>
				<c:if test="${!empty hotelList }">
				<c:forEach items="${hotelList }" var="dto">
					<ul>
						<li><img onclick="location.href='hotel_get_Content.do?hotel_no=${dto.getHotel_no() }'" src='/00_SemiProject/image/hotel/${dto.getHotel_photo_folder() }/main.jpg' style='width:100px; height:100px;'></li>
						<li>${dto.getHotel_name() }</li>
						<li>
							<c:if test="${dto.getHotel_star() != 0 }">
								<c:forEach begin="1" end="${dto.getHotel_star()}">
									★
								</c:forEach>
							</c:if>
						</li>
						<li>최저가 <fmt:formatNumber value="${dto.getHotel_price_min() }"/>원</li>
						<li>${dto.getHotel_info() }</li>
					</ul>
					<input type="button" value="찜 취소" onclick="check(${user_dto.getUser_no() }, ${dto.getHotel_no() })">
					</c:forEach>
				</c:if>
				<c:if test="${empty hotelList }">
					<ul>
						<li colspan="2" align="center">
							<p>찜한 호텔이 없습니다.</p>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>