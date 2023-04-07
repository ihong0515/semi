<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dtoUser" value="${sessionScope.loginUser }" />
<c:set var="dtoPayment" value="${dtoPayment }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 결제 수단 정보</title>
</head>
<body>

	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content" align="center">
	    		<h2>${dtoUser.getUser_name() }님의 등록된 결제 수단 정보</h2>
				<br>
	    		
	    		<table border="1" cellspacing="0" width="400">
					<c:if test="${!empty dtoPayment }">
					<tr>
						<th>카드 이름</th>
						<td>${dtoPayment.getPay_name() }</td>
					</tr>
	
					<tr>
						<th>카드 번호</th>
						<td>${dtoPayment.getPay_cardno() }</td>
					</tr>
					
					<tr>
						<th>카드사</th>
						<td>${dtoPayment.getPay_cardcom() }</td>
					</tr>
					
					<tr>
						<th>CVC번호</th>
						<td>
							<c:if test="${dtoPayment.getPay_cvc().length() != 0 }">
								<c:forEach begin="1" end="${dtoPayment.getPay_cvc().length()}">
									*
								</c:forEach>
							</c:if>
						</td>
					</tr>
	
					<tr>
						<th>비밀번호</th>
						<td>
							<c:if test="${dtoPayment.getPay_pwd().length() != 0 }">
								<c:forEach begin="1" end="${dtoPayment.getPay_pwd().length()}">
									*
								</c:forEach>
							</c:if>
						</td>
					</tr>
					
					<tr>
						<th>유효기간</th>
						<td>${dto.getPay_date() }</td>
					</tr>
					
					</c:if>
					
					<c:if test="${empty dtoPayment }">
						<tr>
							<td colspan="2" align="center">
								<p>등록된 결제 수단이 존재하지 않습니다.</p>
							</td>
						</tr>
					</c:if>
					
				</table>
				<br>
	    		
	    		<input type="button" value="새 결제수단 등록" onclick="location.href='user_insertPayment.do?no=${dtoUser.getUser_no()}'">&nbsp;
	    		<input type="button" value="결제수단 수정" onclick="location.href='user_mopdifyPayment.do'">&nbsp;
				<input type="button" value="결제수단 삭제" onclick="location.href='user_deletePayment.do?no=${dtoUser.getUser_no()}'">
	    	
	    	</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>