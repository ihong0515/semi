<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${Dto }" var="dto"/>
<c:set value="${Hotel }" var="hotel"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/hotel/hotel_policy.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>${hotel.getHotel_name() }의 편의기능</h2>
			<table>
				<tr>
					<th>
						<c:if test="${dto.isHp_wifi() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_wifi() }"><input type="checkbox" disabled="disabled"></c:if>
						와이파이
					</th>
					<th>
						<c:if test="${dto.isHp_parking() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_parking() }"><input type="checkbox" disabled="disabled"></c:if>
						주차
					</th>
					<th>
						<c:if test="${dto.isHp_tub() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_tub() }"><input type="checkbox" disabled="disabled"></c:if>
						욕조
					</th>
				</tr>
				<tr>
					<th>
						<c:if test="${dto.isHp_pool() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_pool() }"><input type="checkbox" disabled="disabled"></c:if>
						수영장
					</th>
					<th>
						<c:if test="${dto.isHp_restaurant() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_restaurant() }"><input type="checkbox" disabled="disabled"></c:if>
						식당
					</th>
					<th>
						<c:if test="${dto.isHp_fitness() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_fitness() }"><input type="checkbox" disabled="disabled"></c:if>
						헬스장
					</th>
				</tr>
				<tr>
					<th>
						<c:if test="${dto.isHp_bar() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_bar() }"><input type="checkbox" disabled="disabled"></c:if>
						바
					</th>
					<th>
						<c:if test="${dto.isHp_terrace() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_terrace() }"><input type="checkbox" disabled="disabled"></c:if>
						테라스
					</th>
					<th>
						<c:if test="${dto.isHp_sauna() }"><input type="checkbox" checked disabled="disabled"></c:if>
						<c:if test="${!dto.isHp_sauna() }"><input type="checkbox" disabled="disabled"></c:if>
						사우나
					</th>
				</tr>
			</table>
			<div id="button_div">
				<input type="button" value="편집" onclick="location.href='<%=request.getContextPath() %>/owner_policy_modify.do?no=${dto.getHp_hotelNo() }'">
				<input type="button" value="목록" onclick="list_move()">
			</div>
		</div>
	</div>
</body>
</html>