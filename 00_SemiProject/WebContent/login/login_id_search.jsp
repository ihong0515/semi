<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${id_List }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	let contextPath = "<%=request.getContextPath() %>";
</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login/login_search.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login/login_search.js"></script>
</head>
<body>
<<<<<<< HEAD
	<div id="content">
		<form method="post" id="id_form">
			<div class="id_search_title">아이디 찾기</div>
			<div class="id_search_body">
				<span>
					이 름 : 
					<c:if test="${empty name}">
					<input type="text" name="name" class="name_inp">
					</c:if>
					
					<c:if test="${!empty name}">
					<input type="text" name="name" class="name_inp" value="${name }">
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
			
			<c:if test="${empty name }">
			<div class="id_search_foot">
				<input type="button" value="메일 전송" onclick="id_check(1)">
			</div>
			</c:if>
			
			<c:if test="${check==1 }">
			<div id="result_btn">
				<input type="text" placeholder="코드 입력" id="check_code" name="check_code">
				<input type="button" value="인증 확인" onclick="id_check(2)">
			</div>
			</c:if>
			
			<c:if test="${check==2 }">
			<div id="result_List">
				<h4>일치하는 아이디 리스트</h4>
				<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<p>${dto }</p>
				</c:forEach>
				</c:if>
			</div>
			</c:if>
		</form>
=======
	<div id="container">
		<div id="content">
			<div class="modal_window_title">아이디 찾기</div>
			<div class="modal_window_body">
				<input type="text" id="name_inp" onblur="check(this)" placeholder="이름"><br>
				<input type="text" id="email_inp" class="modal_mail" onblur="check(this)" placeholder="이메일">
			</div>
			<div class="modal_window_result">
				<div id="result_btn">
					<input type="text" placeholder="코드 입력" class="check_result">
					<input type="button" id="codeChk_btn" onclick="emailCheck(this, 0)" value="인증 확인" class="check_result">
				</div>
			</div>
			<div class="modal_window_footer">
				<input type="submit" id="mail_btn" value="메일 전송" onclick="searchId()">
			</div>
		</div>
>>>>>>> 8ff3a7d38c56886a25ed664362654a670291a166
	</div>
</body>
</html>