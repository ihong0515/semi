<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 결제수단 등록</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_payment.js"></script>
<link href="<%=request.getContextPath() %>/css/user/user_insertPayment.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    <div id="content">
    		<h2>새 결제수단 등록</h2>
			<form method="post" action="<%=request.getContextPath()%>/user_insertPaymentOk.do?user_no=${user_dto.getUser_no()}">
	    		<table border="1" cellspacing="0" width="500">
					<tr>
						<th>카드 이름</th>
						<td>
							<input name="pay_name" id="pay_name">
							<br>
							<span id="pay_name_check"></span>
						</td>
					</tr>
					<tr>
						<th>카드 번호</th>
						<td>
							<input name="pay_cardno1" class="moveNumber" onKeyup="inputMoveNumber(this)" maxlength="4">&nbsp;-&nbsp;
							<input name="pay_cardno2" class="moveNumber" onKeyup="inputMoveNumber(this)" maxlength="4">&nbsp;-&nbsp;
							<input type="password" name="pay_cardno3" class="moveNumber" onKeyup="inputMoveNumber(this)" maxlength="4">&nbsp;-&nbsp;
							<input type="password" name="pay_cardno4" class="moveNumber" maxlength="4">
							<br>
							<span id="pay_cardno_check"></span>
						</td>
					</tr>
					<tr>
						<th>카드사</th>
						<td>
							<select name="pay_cardcom" id="pay_cardcom" onchange="etc_card(this)">
								<option value="우리카드">우리카드</option>
								<option value="KB국민카드">KB국민카드</option>
								<option value="BC카드">BC카드</option>
								<option value="삼성카드">삼성카드</option>
								<option value="신한카드">신한카드</option>
								<option value="하나카드">하나카드</option>
								<option value="현대카드">현대카드</option>
								<option value="롯데카드">롯데카드</option>
								<option value="etc" id="etc_option">직접입력</option>
						    </select>
						    <input id="etc_input" placeholder="직접입력" style="display: none;" onchange="etc()">
							<br>
							<span id="pay_cardcom_check"></span>
						</td>
					</tr>
					<tr>
						<th>CVC번호(3자리)</th>
						<td>
							<input type="password" name="pay_cvc" id="pay_cvc" maxlength="3">
							<br>
							<span id="pay_cvc_check"></span>
						</td>
					</tr>
					<tr>
						<th>카드 비밀번호 앞 2자리 입력</th>
						<td>
							<input type="password" name="pay_pwd" id="pay_pwd" maxlength="2">＊＊
							<br>
							<span id="pay_pwd_check"></span>
						</td>
					</tr>
					<tr>
						<th>유효기간</th>
						<td>
							<input type="date" name="pay_date" id="pay_date">
							<br>
							<span id="pay_date_check"></span>
						</td>
					</tr>
				</table>
				<input type="submit" id="submit" value="새 결제수단 등록">
			</form>
    	</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>