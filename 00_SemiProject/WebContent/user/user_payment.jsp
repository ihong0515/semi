<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<c:set var="pay_list" value="${pay_list }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 결제 수단 정보</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_paymentInsert.js"></script>
<link href="<%=request.getContextPath() %>/css/user/user_payment.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
	    		<jsp:include page="../user/user_mypage_header.jsp"/>
				<div id="payment_table">
					<h2>내 결제수단</h2>
					<table>
					<c:if test="${!empty pay_list }">
						<c:forEach items="${pay_list }" var="pay_dto">
							<tr>
								<th>카드 이름</th>
								<td>${pay_dto.getPay_name() }</td>
							</tr>
							<tr>
								<th>카드 번호</th>
								<td>
									${pay_dto.getPay_cardno().substring(0,4) }
									&nbsp;-&nbsp;
									${pay_dto.getPay_cardno().substring(5,9) }
									&nbsp;-&nbsp;
									<c:forEach begin="1" end="4">
										*
									</c:forEach>
									&nbsp;-&nbsp;
									<c:forEach begin="1" end="4">
										*
									</c:forEach>
								</td>
							</tr>
							<tr>
								<th>카드사</th>
								<td>${pay_dto.getPay_cardcom() }</td>
							</tr>
							<tr>
								<th>CVC번호</th> 
								<td>
									<c:if test="${pay_dto.getPay_cvc() != 0 }">
										<c:forEach begin="1" end="3">
											*
										</c:forEach>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
									<c:if test="${pay_dto.getPay_pwd().length() != 0 }">
										<c:forEach begin="1" end="${pay_dto.getPay_pwd().length()}">
											*
										</c:forEach>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>유효기간</th>
								<td>${pay_dto.getPay_date().substring(0,4) }년 ${pay_dto.getPay_date().substring(5,7) }월 ${pay_dto.getPay_date().substring(8) }일</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" id="modify_btn" value="결제수단 수정" onclick="location.href='user_paymentModify.do?pay_no=${pay_dto.getPay_no()}'">
									<input type="button" id="delete_btn" value="결제수단 삭제" onclick="check(${pay_dto.getPay_no()})">
								</td>
							</tr>
						</c:forEach>
					</c:if>
					</table>
					<c:if test="${empty pay_list }">
						<div id="empty_ment">
							<img alt="" src="">
							등록된 결제 수단이 없습니다.
						</div>
					</c:if>
				</div>
				<div id="newPayment_button_div">
	    			<input type="button" id="newPayment_button" value="새 결제수단 등록" onclick="location.href='user_paymentInsert.do'">
	    		</div>
	    	</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>