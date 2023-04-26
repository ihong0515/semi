<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${loginOwner }" var="dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner정보수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/manage/owner_modify.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<form action="<%=request.getContextPath() %>/owner_manage_modify_ok.do" method="post" name="f" onsubmit="return check_pwd()">
				<input type="hidden" value="${dto.getOwner_no() }" name="no">
				<h2>회원 정보 수정</h2>
				<table>
					<tr>
						<th>
							이름
						</th>
						<td>
							<input type="text" value="${dto.getOwner_name() }" name="name">
						</td>
					</tr>
					<tr>
						<th>
							비밀번호
						</th>
						<td>
							<input type="password" id="owner_modi_pwd" value="${dto.getOwner_pwd() }" name="pwd">
						</td>
					</tr>
					<tr>
						<th>
							중복확인
						</th>
						<td>
							<input type="password" id="owner_modi_repwd">
							<span id="pwd_result"></span>
						</td>
					</tr>
					<tr>
						<th>
							연락처
						</th>
						<td>
							<input type="text" value="${dto.getOwner_phone() }" name="phone">
						</td>
					</tr>
					<tr>
						<th>
							이메일
						</th>
						<td>
							<input type="text" value="${dto.getOwner_email() }" name="email">
						</td>
					</tr>
					<tr>
						<th>
							사업자 번호
						</th>
						<td>
							<input type="text" value="${dto.getOwner_business() }" name="business" readonly><br>
							<p>※사업자 번호 변경은 사이트에 문의하세요.</p>
						</td>
					</tr>
				</table>
				<div>
					<input id="button" type="submit" value="수정">
				</div>
			</form>
		</div>
	</div>
</body>
</html>