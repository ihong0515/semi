<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/user/user_modify.js"></script>
</head>
<body>
	
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    	<div id="content">
				<div align="center">
					<h2>고객 회원정보 수정</h2>
					<br>
					<form method="post" action="<%=request.getContextPath() %>/user_modify_ok.do" onsubmit="return modifyFormCheck()">
						<input type="hidden" name="user_no" value="${dto.getUser_no() }">
						<table border="1" cellspacing="0" width="600">
							<tr>
								<th>아이디</th>
								<td>${dto.getUser_id()}</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="button" value="비밀번호 변경"></td>
							</tr>
							<tr> 
								<th>이름</th>
								<td>${dto.getUser_name()}</td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td>
									010-
									<input name="user_phone_mid" id="user_phone_mid" maxlength="4" value="${dto.getUser_phone().substring(4,8)}">
									-
									<input name="user_phone_end" id="user_phone_end" maxlength="4" value="${dto.getUser_phone().substring(9)}">
									<br>
									<span id="phonecheck"></span>
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" name="user_birth" id="user_birth" value="${dto.getUser_birth()}"></td>
							</tr>
							
							<tr>
								<th>선호지역</th>
								<td>
									<select name = "user_region" id="user_region" value="${dto.getUser_region()}">
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
							        <br>
									<span id="regioncheck"></span>
								</td>
							</tr>
							
							<tr>
								<th>이메일</th>
								<td>${dto.getUser_email() }</td>
							</tr>
							
							<tr>
								<td colspan="2" align="center">
									<input type="submit" id="submit" value="글수정">&nbsp;&nbsp;
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
