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
<script src="https://kit.fontawesome.com/e6bfca85af.js" crossorigin="anonymous"></script>
<script src="../js/user/user_join_normal.js"></script>
<script type="text/javascript">

	/* 이메일 자동완성 기능 */
	function autoEmail(a,b) {
		
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
								<input name="user_id" id="user_id">
								<input type="hidden" name="idcheckfin" value="idUncheck">
								<br>
								<span id="idcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="user_pwd" id="user_pwd">
								<br>
								<span id="pwdcheck"></span>
							</td>
							
						</tr>
						
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" name="user_repwd" id="user_repwd">
								<br>
								<span id="repwdcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>이름</th>
							<td>
								<input name="user_name" id="user_name">
								<br>
								<span id="namecheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>휴대전화</th>
							<td>
								<input name="user_phone" id="user_phone">
								<br>
								<span id="phonecheck"></span>
							</td>
						</tr>
					
						<tr>
							<th>생년월일</th>
							<td>
								<input type="date" name="user_birth" id="user_birth">
								<br>
								<span id="birthcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>선호 지역</th>
							<td>
								<select name="user_region" id="user_region">
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
								 <span id="regioncheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<div class="ui-widget">
								<td>
									<input name="user_email" id="user_email" onkeyup="autoEmail('user_email',this.value)" autocomplete="off">
									<input type="button" value="이메일 인증">
									<br>
									<span id="emailcheck"></span>
								</td>
							</div>
						</tr>
					</table>
					<br>
					
					<div align="left">
						<label for="agree_all">
							<input type="checkbox" name="agree_all" id="agree_all"> <span>사용자 약관 전체 동의</span>
						</label>
						<br>
						
						<label for="agree">
							<input type="checkbox" name="agree" id="essential" value="1"> <span>서비스 이용 약관 동의 (필수)</span>
							<pre>약관 내용</pre>
						</label>
						
						<label for="agree">
							<input type="checkbox" name="agree" id="essential" value="2"> <span>개인정보 처리방침 동의 (필수)</span>
							<i class="fa fa-angle-down" aria-hidden="true"></i>
							<div class="content">

							</div>
						</label>
						
						<label for="agree">
							<input type="checkbox" name="agree" id="essential" value="3"> <span>만 14세 이상 확인 (필수)</span>
							<i class="fa fa-angle-down" aria-hidden="true"></i>
							<div class="content">
								<p>어쩌구</p>
							</div>
						</label>
						
						<label for="agree">
							<input type="checkbox" name="agree" id="essential" value="3"> <span>평생회원제 동의 (필수)</span>
							<i class="fa fa-angle-down" aria-hidden="true"></i>
							<div class="content">
								<p>어쩌구</p>
							</div>
						</label>
						
						<label for="agree">
							<input type="checkbox" name="agree" value="4"> <span>쿠폰, 이벤트 등 혜택 알림 동의 (선택)</span>
							<i class="fa fa-angle-down" aria-hidden="true"></i>
							<div class="content">
								<p>어쩌구</p>
							</div>
						</label>
					</div>
					<br>
					
					<input type="submit" id="submit" value="회원가입" onclick="joinFormCheck();">
				</form>
			</div>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
   
</body>
</html>