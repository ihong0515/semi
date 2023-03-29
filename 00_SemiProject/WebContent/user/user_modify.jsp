<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_modify.jsp</title>
</head>
<body>
	
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
				<div align="center">
					<hr width="50%" color="pink">
					<h3>게시물 수정 폼 페이지</h3>
					<hr width="50%" color="pink">
					<br>
					
					<form method="post" action="<%=request.getContextPath() %>/user_modify_ok.do">
						<input type="hidden" name="user_no" value="${dto.getUser_no() }">
						<table border="1" cellspacing="0" width="400">
							<tr> 
								<th>이름</th>
								<td><input name="user_name" value="${dto.getUser_name()}" readonly></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input name="user_id" value="${dto.getUser_id()}"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="user_pwd"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input name="user_phone" value="${dto.getUser_phone()}"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input name="user_birth" value="${dto.getUser_birth()}"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<input name="user_email" value="${dto.getUser_email()}">
									@
									<select>
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>hanmail.net</option>
										<option>nate.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>선호지역</th>
								<td>
									<select name = "user_region" value="${dto.getUser_region()}">
						               <option value = "seoul">서울</option>
						               <option value = "jeju">경기</option>
						               <option value = "kwangwon">강원</option>
						               <option value = "jeonnam">전남</option>
						               <option value = "jeonbuk">전북</option>
						               <option value = "chungbuk">충북</option>
						               <option value = "chungnam">충남</option>
						               <option value = "kyungnam">경남</option>
						               <option value = "kyungbuk">경북</option>
						               <option value = "jeju">제주</option>
							        </select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="글수정">&nbsp;&nbsp;
									<input type="reset" value="다시작성">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
	
</body>
</html>