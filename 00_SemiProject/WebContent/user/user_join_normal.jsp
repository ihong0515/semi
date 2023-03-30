<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="checkOkId" value="${okId}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_join_normal.jsp</title>
<script type="text/javascript">
	
	function 
	
</script>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content">
      		<div align="center">
				<h2>고객 회원가입</h2>
				<br>
				<form method="post" name="regForm" action="<%=request.getContextPath()%>/user_join_ok.do">
					<table>
					
						<tr>
							<th>아이디</th>
							<td>
								<input name="id" readonly>
								<input type="button" value="ID중복확인" onclick="idCheck()">
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" required></td>
						</tr>
						
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="repwd" required></td>
						</tr>
						
						<tr>
							<th>이름</th>
							<td><input name="name" required></td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td><input name="phone" required></td>
						</tr>
						
						<tr>
							<th>생년월일</th>
							<td><input type="date" name="birth" required></td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>
								<input name="emailFront">
								@
								<select name="emailBack" required>
									<option>naver.com</option>
									<option>gmail.com</option>
									<option>hanmail.net</option>
									<option>nate.com</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th>선호 지역</th>
							<td>
								<select name = "region" required>
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
					</table>
					<br>
					<input type="submit" value="가입">
					<input type="reset" value="다시 작성">
				</form>
			</div>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
   
</body>
</html>