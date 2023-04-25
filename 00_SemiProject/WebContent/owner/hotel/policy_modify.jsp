<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${Dto }"  var="dto"/>
<c:set value="${Hotel }" var="hotel"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/hotel/policy_modify.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<form action="<%=request.getContextPath() %>/owner_policy_update_ok.do" method="post">
				<h2>${hotel.getHotel_name() }의 편의기능</h2>
				<input type="hidden" value="${dto.getHp_hotelNo() }" name="no">
				<table>
					<tr>
						<th>
							<c:if test="${dto.isHp_wifi() }"><input type="checkbox" checked name="wifi" id="wifi"></c:if>
							<c:if test="${!dto.isHp_wifi() }"><input type="checkbox" name="wifi" id="wifi"></c:if>
							<label for="wifi">와이파이</label>
						</th>
						<th>
							<c:if test="${dto.isHp_parking() }"><input type="checkbox" checked name="park" id="park"></c:if>
							<c:if test="${!dto.isHp_parking() }"><input type="checkbox" name="park" id="park"></c:if>
							<label for="park">주차</label>
						</th>
						<th>
							<c:if test="${dto.isHp_tub() }"><input type="checkbox" checked name="tub" id="tub"></c:if>
							<c:if test="${!dto.isHp_tub() }"><input type="checkbox" name="tub" id="tub"></c:if>
							<label for="tub">욕조</label>
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${dto.isHp_pool() }"><input type="checkbox" checked name="pool" id="pool"></c:if>
							<c:if test="${!dto.isHp_pool() }"><input type="checkbox" name="pool" id="pool"></c:if>
							<label for="pool">수영장</label>
						</th>
						<th>
							<c:if test="${dto.isHp_restaurant() }"><input type="checkbox" checked name="rest" id="rest"></c:if>
							<c:if test="${!dto.isHp_restaurant() }"><input type="checkbox" name="rest" id="rest"></c:if>
							<label for="rest">식당</label>
						</th>
						<th>
							<c:if test="${dto.isHp_fitness() }"><input type="checkbox" checked name="fit" id="fit"></c:if>
							<c:if test="${!dto.isHp_fitness() }"><input type="checkbox" name="fit" id="fit"></c:if>
							<label for="fit">헬스장</label>
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${dto.isHp_bar() }"><input type="checkbox" checked name="bar" id="bar"></c:if>
							<c:if test="${!dto.isHp_bar() }"><input type="checkbox" name="bar" id="bar"></c:if>
							<label for="bar">바</label>
						</th>
						<th>
							<c:if test="${dto.isHp_terrace() }"><input type="checkbox" checked name="tera" id="tera"></c:if>
							<c:if test="${!dto.isHp_terrace() }"><input type="checkbox" name="tera" id="tera"></c:if>
							<label for="tera">테라스</label>
						</th>
						<th>
							<c:if test="${dto.isHp_sauna() }"><input type="checkbox" checked name="sau" id="sau"></c:if>
							<c:if test="${!dto.isHp_sauna() }"><input type="checkbox" name="sau" id="sau"></c:if>
							<label for="sau">사우나</label>
						</th>
					</tr>
				</table>
				<div id="button_div">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="list_move()">
				</div>
			</form>
		</div>
	</div>
</body>
</html>