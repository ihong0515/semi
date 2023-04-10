<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
</head>
<body>

	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content" align="center">
				<h2>${user_dto.getUser_name() }님의 회원 정보</h2>
				<br>
				
				<table border="1" cellspacing="0" width="400">
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
								<h3>조회된 게시물이 없습니다.</h3>
							</td>
						</tr>
					</c:if>
					
				</table>
				<br>
				
				<input type="button" value="회원 정보 수정" onclick="location.href='user_joinModify.do'">&nbsp;
				<input type="button" value="회원 탈퇴" onclick="location.href='user_quit.do?no=${user_dto.getUser_no()}'">
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>