<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입점 문의</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link href="<%=request.getContextPath() %>/owner/css/owner_apply.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/owner_apply.js"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="../../include/header.jsp" />
		<div id="content">
			<h2>입점 문의</h2>
			<form action="<%=request.getContextPath() %>/owner_apply_sendmail.do" method="post" onsubmit="return check_apply()" id="apply_form">
			<table id=apply_tb>
				<tr>
					<td height="50px">
						<input type="text" placeholder="이름" name="apply_name">
					</td>
				</tr>
				<tr>
					<td height="50px">
						<input type="text" placeholder="사업자 번호" name="apply_business" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					</td>
				</tr>
				<tr>
					<td height="50px">
						<input type="text" placeholder="전화번호" name="apply_phone" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					</td>
				</tr>
				<tr>
					<td>
						<textarea placeholder="원하는 상담 시간대 및 입점 신청에 대한 문의사항을 적어주세요.(선택사항)" rows="" cols="" name="apply_req"></textarea>
					</td>
				</tr>
			</table>
			<div id="apply_info">
				요청사항이 없을 경우 영업일 기준 09:00 ~ 18:00 내에 연락드립니다.
			</div>
			<div id="apply_btn">
				<input type="hidden" value="semisendemail@gmail.com" name="email">
				<input type="hidden" value="apply_owner" name="check">
				<input type="submit" value="입점 신청">
			</div>
			</form>
		</div>
		<jsp:include page="../../include/footer.jsp" />
	</div>
</body>
</html>