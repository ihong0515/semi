<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="checkOkId" value="${okId}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_join_normal.jsp</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/user/user_join_normal.js"></script>
<script type="text/javascript">

	function autoEmail(a,b){
		
	    var mailId = b.split('@');
	    var mailList = ['naver.com','gmail.com','daum.net','hanmail.net'];
	    var availableCity = new Array;
	    
	    for(var i=0; i < mailList.length; i++ ){
	        availableCity.push( mailId[0] +'@'+ mailList[i] );
	    }
	    
	    $("#"+a).autocomplete({
	        source: availableCity,
	        focus: function(event, ui) {
	            return false;
	        }
	    });
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
				<form method="post" name="joinForm" id="joinForm" action="<%=request.getContextPath()%>/user_join_ok.do">
					<table>
					
						<tr>
							<th>아이디</th>
							<td>
								<input name="user_id" id="user_id" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
								<input type="button" value="중복확인" id="idcheck_btn">
								<br>
								<span id="idcheck"></span>
								<span id="nullcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="user_pwd" id="user_pwd" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
								<br>
								<span id="pwdcheck"></span>
								<span id="nullcheck"></span>
							</td>
							
						</tr>
						
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" name="user_repwd" id="user_repwd" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
								<br>
								<span id="repwdcheck"></span>
								<span id="nullcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>이름</th>
							<td>
								<input name="user_name" id="user_name" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
								<br>
								<span id="nullcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>휴대전화</th>
							<td>
								<input name="user_phone" id="user_phone" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
								<br>
								<span id="nullcheck"></span>
							</td>
						</tr>
					
						<tr>
							<th>생년월일</th>
							<td>
								<input type="date" name="user_birth" id="user_birth" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
								<br>
								<span id="nullcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>선호 지역</th>
							<td>
								<select name="user_region" id="user_region" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
					               <option value="seoul">서울</option>
					               <option value="jeju">경기</option>
					               <option value="kwangwon">강원</option>
					               <option value="jeonnam">전남</option>
					               <option value="jeonbuk">전북</option>
					               <option value="chungbuk">충북</option>
					               <option value="chungnam">충남</option>
					               <option value="kyungnam">경남</option>
					               <option value="kyungbuk">경북</option>
					               <option value="jeju">제주</option>
						         </select>
						         <br>
								 <span id="nullcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<div class="ui-widget">
								<td>
									<input name="user_email" id="user_email" onkeyup="autoEmail('user_email',this.value)" autocomplete="off" required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')">
									<input type="button" value="이메일 인증">
									<br>
									<span id="nullcheck"></span>
								</td>
							</div>
						</tr>
					</table>
					<br>
					<input type="submit" id="submit" value="가입">
					<input type="reset" value="다시 작성">
				</form>
			</div>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
   
</body>
</html>