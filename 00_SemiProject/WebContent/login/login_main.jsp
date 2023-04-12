<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login/login_main.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login/login_main.js"></script>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content">
			<fieldset id="login_main" style="width:500px;">
				<legend>로그인</legend>
					<div id="login_main_wrap">
						<form method="post" action="<%=request.getContextPath() %>/user_login.do">
							<div class="login_main_inp">
								<input type="text" id="user_id" name="id" placeholder="아이디">
							</div>
							<div class="login_main_inp">
								<input type="password" id="user_pwd" name="pwd" placeholder="비밀번호">
							</div>
							<div id="login_main_btn">
								<input type="submit" value="로그인">
								<input type="button" value="회원가입" onclick="location.href='<%=request.getContextPath() %>/user_join.do'">
							</div>
						</form>
						<div id="login_main_a">
							<a href="javascript:openIdSearch()">아이디 찾기</a>
							<a href="javascript:openPwdSearch()">비밀번호 찾기</a>
						</div>
						<div id="login_modal">
							<div id="id_search_modal">
								<div class="modal_window">
									<div class="modal_window_x" onclick="close_modal()">
										x
									</div>
									<div class="modal_window_title">
										ID 찾기
									</div>
									<div class="modal_window_body">
										E-mail : <input type="text">
									</div>
									<div class="modal_window_footer">
										<input type="button" value="메일 전송">
									</div>
								</div>
							</div>
							<div id="pwd_search_modal">
								<div class="modal_window">
									<div class="modal_window_x" onclick="close_modal()">
										x
										</div>
									<div class="modal_window_title">
										Pwd 찾기
									</div>
									<div class="modal_window_body">
										ID : <input type="text"><br>
										E-mail : <input type="text">
									</div>
									<div class="modal_window_footer">
										<input type="button" value="메일 전송">
									</div>
								</div>
							</div>
						</div>
					</div>
			</fieldset>
			
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>