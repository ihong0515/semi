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
</head>
<body>

	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
				<div align="center">
					<h2>${user_dto.getUser_name() }님이 찜한 숙소</h2>
					<br>
					<c:if test="${!empty hotelList }">
					<c:forEach items="${hotelList }" var="dto">
						<ul>
							<img onclick="location.href='hotel_get_Content.do?hotel_no=${dto.getHotel_no() }'" src='/00_SemiProject/image/hotel/${dto.getHotel_photo_folder() }/main.jpg' style='width:100px; height:100px;'></p>
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
							<br>
							<input type="button" value="찜 취소" onclick="location.href='user_jjim_cancel.do?user_no=${user_dto.getUser_no() }&&hotel_no=${dto.getHotel_no() }'">
						</ul>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty hotelList }">
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