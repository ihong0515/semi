<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h1>프로모션 쿠폰 발급</h1>
<c:set var="dto" value="${Promotion}}"/>
<c:if test="${!empty Promotion}">
	<table>
		<tr><img src="<%=request.getContextPath()%>/image/promotion/${Promotion.getProm_folder()}/main.jpg" width="100%" height="100%"></tr>
		<tr><td>${Promotion.getProm_info()}</td></tr>
	</table>
	<input type ="button" onclick = "alert('땡!')" value="이벤트참여" >


</c:if>

</div>

</body>
</html>