<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</div>
</body>
</html>