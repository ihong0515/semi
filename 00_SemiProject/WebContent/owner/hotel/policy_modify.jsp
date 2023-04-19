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
							<c:if test="${dto.isHp_wifi() }"><input type="checkbox" checked name="wifi"></c:if>
							<c:if test="${!dto.isHp_wifi() }"><input type="checkbox" name="wifi"></c:if>
							와이파이
						</th>
						<th>
							<c:if test="${dto.isHp_parking() }"><input type="checkbox" checked name="park"></c:if>
							<c:if test="${!dto.isHp_parking() }"><input type="checkbox" name="park"></c:if>
							주차
						</th>
						<th>
							<c:if test="${dto.isHp_tub() }"><input type="checkbox" checked name="tub"></c:if>
							<c:if test="${!dto.isHp_tub() }"><input type="checkbox" name="tub"></c:if>
							욕조
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${dto.isHp_pool() }"><input type="checkbox" checked name="pool"></c:if>
							<c:if test="${!dto.isHp_pool() }"><input type="checkbox" name="pool"></c:if>
							수영장
						</th>
						<th>
							<c:if test="${dto.isHp_restaurant() }"><input type="checkbox" checked name="rest"></c:if>
							<c:if test="${!dto.isHp_restaurant() }"><input type="checkbox" name="rest"></c:if>
							식당
						</th>
						<th>
							<c:if test="${dto.isHp_fitness() }"><input type="checkbox" checked name="fit"></c:if>
							<c:if test="${!dto.isHp_fitness() }"><input type="checkbox" name="fit"></c:if>
							헬스장
						</th>
					</tr>
					<tr>
						<th>
							<c:if test="${dto.isHp_bar() }"><input type="checkbox" checked name="bar"></c:if>
							<c:if test="${!dto.isHp_bar() }"><input type="checkbox" name="bar"></c:if>
							바
						</th>
						<th>
							<c:if test="${dto.isHp_terrace() }"><input type="checkbox" checked name="tera"></c:if>
							<c:if test="${!dto.isHp_terrace() }"><input type="checkbox" name="tera"></c:if>
							테라스
						</th>
						<th>
							<c:if test="${dto.isHp_sauna() }"><input type="checkbox" checked name="sau"></c:if>
							<c:if test="${!dto.isHp_sauna() }"><input type="checkbox" name="sau"></c:if>
							사우나
						</th>
					</tr>
				</table>
				<div>
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="list_move()">
				</div>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>