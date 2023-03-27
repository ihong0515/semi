<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_join_normal.jsp</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function fn_joinMember() {
		
		var joinForm = document.joinForm;
		var name = joinForm.name.value;
		var id = joinForm.id.value;
		var pwd = joinForm.pwd.value;
		var pwdCheck = joinForm.pwdCheck.value;
		var email = joinForm.email.value;
		
		if(id.length==0 || id=="") {
			alert("아이디를 입력하세요.");
			joinForm.id.focus();
		} else if(joinForm.idDuplication.value!="idCheck") {
			alert("아이디 중복확인을 해주세요.")
		} else if(pwd.length==0 || pwd=="") {
			alert("비밀번호를 입력하세요.");
			joinForm.pwd.focus();
		} else if(pwdCheck.length==0 || pwdCheck=="") {
			alert("비밀번호를 다시 입력하세요.");
			joinForm.pwdCheck.focus();
		} else if(pwdCheck!=pwd) {
			alert("입력하신 비밀번호가 일치하지 않습니다.")
		} else if(name.length==0 || name=="") {
			alert("이름를 입력하세요.");
			joinForm.name.focus();
		} else if(phone.length==0 || phone=="") {
			alert("전화번호를 입력하세요.");
			joinForm.phone.focus();
		} else if(birth.length==0 || birth=="") {
			alert("생년월일을 입력하세요.");
			joinForm.birth.focus();
		} else if(email.length==0 || email=="") {
			alert("이메일을 입력하세요.");
			joinForm.email.focus();
		} else if(location.length==0 || location=="") {
			alert("선호 지역을 선택하세요.");
			joinForm.location.focus();
		} else {
			joinForm.methoid="post";
			joinForm.action="${contextPath}/user_join_ok.do";
		}
	}
	
	function fn_dbCheckId() {
		var joinForm = document.joinForm;
		var id = joinForm.id.value;
		
		if(id.length==0 || id=="") {
			alert("아이디를 입력해주세요.");
			joinForm.id.focus();
		} else {
			window.open("${contextPath}/dbCheckId.do?user_id="+id,"","width=500, height=300");
		}
	}
	
</script>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content">
      		<div align="center">
				<h2>고객 회원가입</h2>
				<br>
				<form method="post" name="joinForm" action="<%=request.getContextPath()%>/user_join_ok.do">
					<table>
					
						<tr>
							<th>아이디</th>
							<td>
								<input name="id" onkeydown="inputIdChk()">
								<button type="button" onclick="fn_dbCheckId()" name="dbCheckId" class="checkId">중복확인</button>
								<input type="hidden" name="idDuplication" value="idUncheck">
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd"></td>
						</tr>
						
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" name="pwdCheck">
							</td>
						</tr>
						
						<tr>
							<th>이름</th>
							<td><input name="name"></td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td><input name="phone"></td>
						</tr>
						
						<tr>
							<th>생년월일</th>
							<td><input type="date" name="birth"></td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>
								<input name="email">
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
							<th>선호 지역</th>
							<td>
								<select name = "location">
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