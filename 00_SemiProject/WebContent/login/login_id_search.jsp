<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	let contextPath = "<%=request.getContextPath() %>";
</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login/login_search.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login/login_search.js"></script>
</head>
<body>
	<div id="content">
		<div class="modal_window_title">아이디 찾기</div>
		<div class="modal_window_body">
			<span>이 름 : <input type="text" id="name_inp" onblur="check(this)"></span><br>
			<span>E-mail : <input type="text" id="email_inp" class="modal_mail" onblur="check(this)"></span>
		</div>
		<div class="modal_window_result">
			<div id="result_btn">
				<input type="text" placeholder="코드 입력" class="check_result">
				<input type="button" onclick="emailCheck(this, 0)" value="인증 확인" class="check_result">
			</div>
		</div>
		<div class="modal_window_footer">
			<input type="submit" value="메일 전송" onclick="searchId()">
		</div>
	</div>
</body>
</html>