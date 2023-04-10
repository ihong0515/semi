<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
let uid = '<%=session.getAttribute("loginUser")%>';
</script>
<script src="<%=request.getContextPath()%>/js/promotion/promotion.js"></script>
</head>
<body>
	<div id ="coupon_content" align="center">
		<h1>프로모션 쿠폰 발급</h1>
		<c:set var="dto" value="${Promotion}}"/>
		<c:if test="${!empty Promotion}">
		<table>
			<tr>
				<td>
					<img src="<%=request.getContextPath()%>/image/promotion/${Promotion.getProm_folder()}/main.jpg" width="100%" height="100%">
				</td>
			</tr>
			<tr>
				<td>
					${Promotion.getProm_info()}
				</td>
			</tr>
		</table>
		<div id="coupon_button_area">
			<input type="hidden" value="${Promotion.getProm_no()}" id="prom_no_val">
			<input type ="button" value = "쿠폰 발급" onclick = "getCoupon()" >
		</div>
		<div id="coup_result_area" >
			<p id="coup_result"></p>
		</div>
	</c:if>
	</div>
</body>
</html>