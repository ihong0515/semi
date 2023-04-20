<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${loginOwner }" var="dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
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
						<input type="password" id="owner_modi_repwd" onblur="check_pwd()">
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
						${dto.getOwner_business() }<br>
						사업자 번호 변경은 사이트에 문의하세요.
					</td>
				</tr>
			</table>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>