<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
function getCoupon(e){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "get",
		url : "coupon_make.do",
		data : {
			prom_no : $('#prom_no_val').val()
		},
		datatype : "text",
		context : this,
		success : function(data){
			alert('성공입니다 당신은 쿠폰을 받을 수 있어요.');
			console.log(data);
		},
		error : function(){
			alert('에러입니다.');
		}
		
		
	});
}


</script>
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
	<input type="hidden" value="${Promotion.getProm_no()}" id="prom_no_val">
	<input type ="button" value = "쿠폰 발급" onclick = "getCoupon()" >
	
	
	<p id="coup_result"></p>

</c:if>

</div>

</body>
</html>