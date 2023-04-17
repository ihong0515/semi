<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user/user_quit.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
			<h2>탈퇴 시 비밀번호 확인</h2>
			<form method="post" action="<%=request.getContextPath() %>/user_quitOk.do">
				<input type="hidden" name="user_no" value="${user_dto.getUser_no() }">
				<table id="quit_tb">
					<tr>
						<th>비밀번호 입력</th>
						<td><input type="password" name="user_pwd"></td>
					</tr>
					<tr>
			           <td colspan="2" align="center">
			              <input type="submit" value="회원 탈퇴">&nbsp;&nbsp;
			              <input type="reset" value="다시작성">
			           </td>
			        </tr>
				</table>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>