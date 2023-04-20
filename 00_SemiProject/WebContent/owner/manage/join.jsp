<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/manage/join.js"></script>
</head>
<body>
	<div id = "container">
		<jsp:include page="../include/header.jsp" />
		<div id = "content" align = "center">
			<h1>Owner회원가입</h1>
			<form method="post" name="joinForm" id="joinForm" action="<%=request.getContextPath()%>/owner_Join_ok.do" onsubmit="return joinFormCheck()">
				<table>
					<tr>
						<th>아이디 입력</th>
						<td>
							<input type = "text" name = "owner_id" id = "owner_id" onblur="checkId(this)" >
							<input type="hidden" name="idcheckfin" value="idUncheck">
							<br>
							<span id="idcheck"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 입력</th>
						<td>
							<input type = "password" name = "owner_pwd" id = "owner_pwd" placeholder="비밀번호를 입력해주세요."  onkeyup="pwdKorCheck(this)" onchange="pwdInput()">
							<span id="pwdcheck"></span>
						</td>
					</tr>
					<tr>	
						<th>비밀번호 확인</th>
						<td>
							<input type = "password" name="owner_repwd" id="owner_repwd" placeholder="비밀번호를 확인해주세요." onchange="pwdInput()">
							<br>
							<span id="repwdcheck"></span>
						</td>
					</tr>
					<tr>	
						<th>사업자명</th>
						<td>
							<input type = "text" name = "owner_name" id="owner_name" placeholder="홍사장">
							<br>
							<span id="namecheck"></span>
						</td>
					</tr>
					<tr>	
						<th>사업자연락처</th>
						<td>
							<input type="text" name="owner_phone"  class="phone_number" maxlength="3" placeholder="000">
							-
							<input type="text" name="owner_phone"  class="phone_number" maxlength="4" placeholder="0000">
							-
							<input type="text" name="owner_phone"  class="phone_number" maxlength="4" placeholder="0000">
							<span id="phonecheck"></span>
						</td>
					</tr>
					<tr>	
						<th>사업자이메일</th>
						<td>
							<input type="text" name="owner_email" id="owner_email" placeholder="이메일을 입력해주세요.">
							<br>
							<span id="emailcheck"></span>
						</td>
					</tr>
					<tr>	
						<th>사업자번호</th>
						<td>
						<div>
							<input type="text" name="owner_business" class="owner_business" maxlength="3" placeholder="000">
							-
							<input type="text" name="owner_business"  class="owner_business" maxlength="2" placeholder="00">
							-
							<input type="text" name="owner_business"  class="owner_business" maxlength="5" placeholder="00000">
							<span id="owner_business_check"></span>
						</div>
						</td>
					</tr>
					<tr>
						<td colspan = 2><input type = "submit" value = "가입"></td>
					</tr>
				</table>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>