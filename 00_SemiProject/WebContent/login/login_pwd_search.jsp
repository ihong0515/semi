<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">let contextPath = "<%=request.getContextPath() %>";</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login/login_search.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login/login_search.js"></script>
</head>
<body>
<<<<<<< HEAD
	<div id="content">
		<form method="post" id="pwd_form">
			<div class="search_title">비밀번호 찾기</div>
			<div class="search_body">
				<span>
					ID : 
					<c:if test="${empty id}">
					<input type="text" name="id" class="id_inp">
					</c:if>
					
					<c:if test="${!empty id}">
					<input type="text" name="id" class="id_inp" value="${id }">
					</c:if>
					
				</span><br>
				<span>
					E-mail : 
					<c:if test="${empty mail}">
					<input type="text" name="email" class="mail_inp">
					</c:if>
					
					<c:if test="${!empty mail}">
					<input type="text" name="email" class="mail_inp" value="${mail }">
					</c:if>
					
				</span>
			</div>
			
			<c:if test="${empty id }">
			<div class="search_foot">
				<input type="button" value="메일 전송" onclick="pwd_check(1)">
			</div>
			</c:if>
			
			<c:if test="${check==1 }">
			<div id="result_btn">
				<input type="text" placeholder="코드 입력" id="check_code" name="check_code">
				<input type="button" value="인증 확인" onclick="pwd_check(2)">
			</div>
			</c:if>
			
			<c:if test="${check==2 }">
			<div id="result_List">
				<h4>비밀번호 변경</h4>
				<div>
					새로운 비밀번호 : <br>
					<input type="password" id="repwd" name="repwd" onchange="pwdInput()"><br>
					비밀번호 확인 : <br>
					<input type="password" id="repwd_check" onchange="pwdInput()"><br>
					<span id="pwd_check_result"></span>
					<br><input type="button" value="비밀번호 변경" onclick="pwd_check(3)">
				</div>
			</div>
			</c:if>
			
		</form>
=======
	<div id="container">
		<div id="content">
			<div class="modal_window_title">비밀번호 찾기</div>
			<div class="modal_window_body">
				<input type="text" id="id_inp" placeholder="아이디"><br>
				<input type="text" id="email_inp" placeholder="이메일">
			</div>
			<div class="modal_window_result">
				<div id="result_btn">
					<input type="text" placeholder="코드 입력" class="pwd_check_result">
					<input type="button" id="codeChk_btn" onclick="emailCheck(this, 1)" value="인증 확인" class="pwd_check_result">
				</div>
			</div>
			<div class="modal_window_footer">
				<input type="button" id="mail_btn" value="메일 전송" onclick="searchPwd()">
			</div>
		</div>
>>>>>>> 8ff3a7d38c56886a25ed664362654a670291a166
	</div>
</body>
</html>