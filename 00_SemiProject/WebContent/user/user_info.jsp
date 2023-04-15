<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user/user_info.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
			<jsp:include page="../user/user_mypage_header.jsp"/>
			<div id="info_table">
				<h2>회원 상세 정보</h2>
				<table>
					<c:if test="${!empty user_dto }">
					<tr>
						<th>이름</th>
						<td>${user_dto.getUser_name() }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${user_dto.getUser_id() }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<c:if test="${user_dto.getUser_pwd().length() != 0 }">
								<c:forEach begin="1" end="${user_dto.getUser_pwd().length()}">
									*
								</c:forEach>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>${user_dto.getUser_phone() }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${user_dto.getUser_birth() }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${user_dto.getUser_email() }</td>
					</tr>
					<tr>
						<th>선호지역</th>
						<td>${user_dto.getUser_region() }</td>
					</tr>
					</c:if>
					<c:if test="${empty user_dto }">
						<tr>
							<td colspan="2" align="center">
								<h3>회원 정보가 존재하지 않습니다.</h3>
							</td>
						</tr>
					</c:if>
				</table>
				<div id="info_button_div">
					<input type="button" id="modify_btn" value="회원 정보 수정" onclick="location.href='user_joinModify.do'">
					<input type="button" id="quit_btn" value="회원 탈퇴" onclick="location.href='user_quit.do?no=${user_dto.getUser_no()}'">
				</div>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>