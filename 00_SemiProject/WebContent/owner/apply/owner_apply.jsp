<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입점 문의</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link href="<%=request.getContextPath() %>/owner/css/owner_apply.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<jsp:include page="../../include/header.jsp" />
		<div id="content">
			<h2>입점 문의</h2>
			<table id=apply_tb>
				<tr>
					<th height="50px">
						이름
					</th>
					<td>
						<input type="text">
					</td>
				</tr>
				<tr>
					<th height="50px">
						전화번호
					</th>
					<td>
						<input type="text">
					</td>
				</tr>
				<tr>
					<th>
						요청사항
					</th>
					<td>
						<textarea placeholder="원하는 상담 시간대 및 입점 신청에 대한 문의사항을 적어주세요.(선택사항)" rows="" cols=""></textarea>
					</td>
				</tr>
			</table>
			<div>
				요청사항이 없을 경우 영업일 기준 09:00 ~ 18:00 내에 연락드립니다.
			</div>
			<div>
				<input type="button" value="입점 신청">
			</div>
		</div>
		<jsp:include page="../../include/footer.jsp" />
	</div>
</body>
</html>