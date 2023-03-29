<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_info</title>
</head>
<body>

	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
				<div align="center">
					<hr width="50%" color="tomato">
					<h3>${dto.getUser_name() }님 회원 정보</h3>
					<hr width="50%" color="tomato">
					<br>
					
					<table border="1" cellspacing="0" width="400">
						<tr>
							<th>이름</th>
							<td>${dto.getUser_name() }</td>
						</tr>
		
						<tr>
							<th>아이디</th>
							<td>${dto.getUser_id() }</td>
						</tr>
		
						<tr>
							<th>비밀번호</th>
							<td>
								<c:if test="${dto.getUser_pwd().length() != 0 }">
									<c:forEach begin="1" end="${dto.getUser_pwd().length()}">
										*
									</c:forEach>
								</c:if>
							</td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td>${dto.getUser_phone() }</td>
						</tr>
						
						<tr>
							<th>생년월일</th>
							<td>${dto.getUser_birth() }</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>${dto.getUser_email() }</td>
						</tr>
						
						<tr>
							<th>선호지역</th>
							<td>${dto.getUser_region() }</td>
						</tr>
						
						<c:if test="${empty dto }">
							<tr>
								<td colspan="2" align="center">
									<h3>조회된 게시물이 없습니다.</h3>
								</td>
							</tr>
						</c:if>
						
					</table>
					<br>
					
					<input type="button" value="회원 정보 수정" onclick="location.href='user_modify.do'">&nbsp;
					<input type="button" value="결제 수단 등록" onclick="location.href='user_pay.do?no=${dto.getUser_no()}'">&nbsp;
					<input type="button" value="회원 탈퇴" onclick="location.href='user_quit.do?no=${dto.getUser_no()}'">
				</div>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>