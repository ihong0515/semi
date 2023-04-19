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
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/hotel_policy.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>${hotel.getHotel_name() }의 부가기능</h2>
			<table>
				<tr>
					<th>
						와이파이
					</th>
					<th>
						주차
					</th>
					<th>
						욕조
					</th>
				</tr>
				<tr>
					<td>
						${dto.isHp_wifi() }
					</td>
					<td>
						${dto.isHp_parking() }
					</td>
					<td>
						${dto.isHp_tub() }
					</td>
				</tr>
				<tr>
					<th>
						수영장
					</th>
					<th>
						식당
					</th>
					<th>
						헬스장
					</th>
				</tr>
				<tr>
					<td>
						${dto.isHp_pool() }
					</td>
					<td>
						${dto.isHp_restaurant() }
					</td>
					<td>
						${dto.isHp_fitness() }
					</td>
				</tr>
				<tr>
					<th>
						바
					</th>
					<th>
						테라스
					</th>
					<th>
						사우나
					</th>
				</tr>
				<tr>
					<td>
						${dto.isHp_bar() }
					</td>
					<td>
						${dto.isHp_terrace() }
					</td>
					<td>
						${dto.isHp_sauna() }
					</td>
				</tr>
			</table>
			<div>
				<input type="button" value="편집" onclick="location.href='<%=request.getContextPath() %>/owner_policy_modify.do?no=${dto.getHp_hotelNo() }'">
				<input type="button" value="목록" >
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>