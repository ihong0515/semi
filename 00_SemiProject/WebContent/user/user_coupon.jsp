<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<c:set var="prom_dto" value="${prom_dto }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 쿠폰 내역</title>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
			<div>
				<h2>${user_dto.getUser_name() }님의 보유 쿠폰 내역</h2>
				<br>
				<table border="1" cellspacing="0">
					<tr>
						<th>프로모션 이름</th> <th>내용</th> <th>할인율</th> <th>일련번호</th> <th>사용여부</th>
					</tr>
					
					<c:set var="list" value="${couponList }" />
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="coup_dto">
							<tr>
								<td>${prom_dto.getProm_name() }</td>
								<td>${prom_dto.getProm_info() }</td>
								<td>${coup_dto.getCoup_sale() }</td>
								<td>${coup_dto.getCoup_serialno() }</td>
								<td>${coup_dto.getCoup_usecheck() }</td>
							</tr>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty list }" var="coup_dto">
						<tr>
							<td colspan="5" align="center">
								<p>등록된 쿠폰이 없습니다.</p>
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