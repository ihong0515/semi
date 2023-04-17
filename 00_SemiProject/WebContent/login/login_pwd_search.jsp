<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">let contextPath = "<%=request.getContextPath() %>";</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login/login_search.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login/login_search.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div id="content">
		<form method="post" id="pwd_form">
			<div class="search_title">비밀번호 찾기</div>
			<div class="search_body">
				<span>
					<c:if test="${empty id}">
					<input type="text" name="id" class="id_inp" placeholder="ID :">
					</c:if>
					
					<c:if test="${!empty id}">
					<input type="text" name="id" class="id_inp" value="${id }" readonly="readonly">
					</c:if>
					
				</span><br>
				<span>
					<c:if test="${empty mail}">
					<input type="text" name="email" class="mail_inp" placeholder="E-mail :">
					</c:if>
					
					<c:if test="${!empty mail}">
					<input type="text" name="email" class="mail_inp" value="${mail }" readonly="readonly">
					</c:if>
					
				</span>
			</div>
			
			<div class="search_foot">
			
				<c:if test="${empty id }">
				<div id="result_send">
					<input type="button" id="mail_send_btn" value="메일 전송" onclick="pwd_check(1)">
				</div>
				</c:if>
			
				<c:if test="${check==1 }">
				<div id="result_btn">
					<input type="text" placeholder="코드 입력" id="check_code" name="check_code">
					<input type="button" id="result_button" value="인증 확인" onclick="pwd_check(2)">
				</div>
				</c:if>
			
				<c:if test="${check==2 }">
				<div id="result_List">
					<h4>비밀번호 변경</h4>
					<div id="result_pwd_renew">
						새로운 비밀번호 : <br>
						<input type="password" id="repwd" name="repwd" onchange="pwdInput()"><br>
						비밀번호 확인 : <br>
						<input type="password" id="repwd_check" onchange="pwdInput()"><br>
						<span id="pwd_check_result"></span>
						<br><input type="button" id="newpwd" value="비밀번호 변경" onclick="pwd_check(3)">
					</div>
				</div>
				</c:if>
				
			</div>
		</form>
	</div>
</body>
</html>