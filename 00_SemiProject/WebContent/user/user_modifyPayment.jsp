<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dtoUser" value="${sessionScope.loginUser }" />
<c:set var="dtoPayment" value="${dtoPayment }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 결제수단 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_modify_payment.js?ver=1"></script>
<style type="text/css">
	.moveNumber {
		text-align:center;
		width:40px;
	}
</style>
</head>
<body>

	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content" align="center">
	    		<h2>${dtoUser.getUser_name() }님의 등록된 결제 수단 정보 수정</h2>
				<br>
				<form method="post" action="<%=request.getContextPath()%>/user_modifyPaymentOk.do?user_no=${dtoUser.getUser_no()}&&pay_no=${dtoPayment.getPay_no()}"  onsubmit="return modifyPaymentFormCheck()">
		    		<table border="1" cellspacing="0" width="500">
						<tr>
							<th>카드 이름</th>
							<td>
								<input name="pay_name" id="pay_name" value="${dtoPayment.getPay_name() }">
								<br>
								<span id="pay_name_check"></span>
							</td>
						</tr>
						<tr>
							<th>카드 번호</th>
							<td>
								<input name="pay_cardno" id="pay_cardno1" class="moveNumber" onKeyup="inputMoveNumber(this)" maxlength="4"  value="${dtoPayment.getPay_cardno().substring(0,4) }">&nbsp;-&nbsp;
								<input name="pay_cardno" id="pay_cardno2" class="moveNumber" onKeyup="inputMoveNumber(this)" maxlength="4"  value="${dtoPayment.getPay_cardno().substring(5,9) }">&nbsp;-&nbsp;
								<input type="password" name="pay_cardno" id="pay_cardno3" class="moveNumber" onKeyup="inputMoveNumber(this)" maxlength="4"  value="${dtoPayment.getPay_cardno().substring(10,14) }">&nbsp;-&nbsp;
								<input type="password" name="pay_cardno" id="pay_cardno4" class="moveNumber" maxlength="4"  value="${dtoPayment.getPay_cardno().substring(15) }">
								<br>
								<span id="pay_cardno_check"></span>
							</td>
						</tr>
						<tr>
							<th>카드사</th>
							<td>
								<select name="pay_cardcom" id="pay_cardcom" onchange="etc_card(this)" value="${dtoPayment.getPay_cardcom() }">
									<option value="woori">우리카드</option>
									<option value="kb">KB국민카드</option>
									<option value="bc">BC카드</option>
									<option value="samsung">삼성카드</option>
									<option value="shinhan">신한카드</option>
									<option value="hana">하나카드</option>
									<option value="hyundai">현대카드</option>
									<option value="lotte">롯데카드</option>
									<option value="etc">직접입력</option>
							    </select>
							    <input name="etc" id="etc" placeholder="직접입력" style="display: none;">
								<br>
								<span id="pay_cardcom_check"></span>
							</td>
						</tr>
						<tr>
							<th>CVC번호(3자리)</th>
							<td>
								<input type="password" name="pay_cvc" id="pay_cvc" maxlength="3" value="${dtoPayment.getPay_cvc() }">
								<br>
								<span id="pay_cvc_check"></span>
							</td>
						</tr>
						<tr>
							<th>카드 비밀번호 앞 2자리 입력</th>
							<td>
								<input type="password" name="pay_pwd" id="pay_pwd" maxlength="2" value="${dtoPayment.getPay_pwd() }">＊＊
								<br>
								<span id="pay_pwd_check"></span>
							</td>
						</tr>
						<tr>
							<th>유효기간</th>
							<td>
								<input type="date" name="pay_date" id="pay_date" value="${dtoPayment.getPay_date() }">
								<br>
								<span id="pay_date_check"></span>
							</td>
						</tr>
					</table>
					<br>
					<input type="submit" id="submit" value="결제수단 수정">
				</form>
				<br>
	    	</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>