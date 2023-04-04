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
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="event_content" align = "center">
			<h1>이벤트 프로 모션</h1>
		<c:set  var="promotion_list" value = "${Promotion}" />	
		<c:if test="${!empty Promotion}">
				
				<c:forEach items="${Promotion}" var="dto" varStatus="i">
						<table border = "1" cellspacing="0" width ="50%">
							<tr><td><img src="<%=request.getContextPath()%>/image/promotion/${dto.getProm_folder()}/main.jpg" width="100%" height="100%"></td></tr>
							<tr><td>${dto.getProm_name()}</td></tr>
							<tr><td>${dto.getProm_info()}</td></tr>
						</table>
				</c:forEach>
				</c:if>	
				
		<c:if test="${empty Promotion}">
				<h3>테이블이 없습니다.</h3>
		</c:if>	
			  
			
			
			
			
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>