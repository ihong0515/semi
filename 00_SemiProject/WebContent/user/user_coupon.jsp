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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/user_coupon.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
    	<h2>${user_dto.getUser_name() }님의 보유 쿠폰 내역</h2>
			<div id ="user_coupon_content">
				<br>
				<div id = "user_coupon_table">
					<div id = "user_coupon_row">
						<div id = "user_coupon_col">프로모션 이름</div> 
						<div id = "user_coupon_col">내용</div>
						<div id = "user_coupon_col">할인율</div>
						<div id = "user_coupon_col">일련번호</div> 
						<div id = "user_coupon_col">사용여부</div>
					</div>
					<c:set var="list" value="${couponList }" />
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="coup_dto">
							<div id = "user_coupon_row">
								<div id = "user_coupon_col">${prom_dto.getProm_name() }</div>
								<div id = "user_coupon_col">${prom_dto.getProm_info() }</div>
								<div id = "user_coupon_col">${coup_dto.getCoup_sale() }</div>
								<div id = "user_coupon_col">${coup_dto.getCoup_serialno() }</div>
								<div id = "user_coupon_col">${coup_dto.getCoup_usecheck() }</div>
							</div>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty list }" var="coup_dto">
						<tr>
							<td colspan="5" align="center">
								<p>등록된 쿠폰이 없습니다.</p>
							</td>
						</tr>
					</c:if>
				</div>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>