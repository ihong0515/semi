<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약 내역</title>
</head>
<body>

	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
				<div align="center">
					<h2>${dto.getUser_name() }님 숙소 예약 내역 리스트</h2>
					<br>
					
					<table border="1" cellspacing="0" width="800">
						<tr>
							<th>예약확인번호</th>
							<th>호텔 이름</th>
							<th>객실 정보</th>
							<th>체크인</th>
							<th>체크아웃</th>
							<th>요금 및 결제 세부 정보</th>
							<th>예약자명</th>
							<th>연락처</th>
							<th>이메일</th>
						</tr>
						
						<c:set var="list" value="${reservList }"/>
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="dtoReserv">
								<tr>
									<td>${dtoReserv.getReserv_no() }</td>
									<td>${dtoReserv.getReserv_hotelname() }</td>
									<td>${dtoReserv.getReserv_roomname() }</td>
									<td>${dtoReserv.getReserv_start() }</td>
									<td>${dtoReserv.getReserv_end() }</td>
									<td>${dtoReserv.getReserv_realprice() }</td>
									<td>${dtoReserv.getReserv_username() }</td>
									<td>${dtoReserv.getReserv_phone() }</td>
								</tr>
							</c:forEach>
						</c:if>
						
						<c:if test="${empty list }">
							<tr>
								<td colspan="9" align="center">
									<p>예약 내역이 존재하지 않습니다.</p>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>