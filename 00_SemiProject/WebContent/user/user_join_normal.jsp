<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="checkOkId" value="${okId}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_join_normal.js?ver=1"></script>
<script type="text/javascript">
	/* 약관동의 전체 선택 */
	$(document).ready(function() {
		$("#cbx_chkAll").click(function() {
			if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) $("#cbx_chkAll").prop("checked", false);
			else $("#cbx_chkAll").prop("checked", true); 
		});
	});
	
	/* 약관동의 더보기, 접기 */
	$(".main").click(function() {
		if($(this).find(".sub").is(":visible")){
	   		$(this).find(".sub").slideUp();
		}
		else{
	    	$(this).find(".sub").slideDown();
		}
	});
	$(document).on("click","#main",function() {
		if($(this).next().css("display")=="none") {
			$(this).next().show();
			$(this).html('<i class="fa-solid fa-chevron-up"></i>');
		} else{
	        $(this).next().hide();
	        $(this).html('<i class="fa-solid fa-chevron-down"></i>');
	      }
	});
</script>
<style type="text/css">

#detail{
	display:none;
	overflow:scroll;
	text-align:left;
	width:400px;
	height:200px;
}

</style>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content">
      		<div align="center">
				<h2>고객 회원가입</h2>
				<br>
				<form method="post" name="joinForm" id="joinForm" action="<%=request.getContextPath()%>/user_join_ok.do" onsubmit="return joinFormCheck()">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input name="user_id" id="user_id" onblur="checkId(this)" onkeyup="idKorCheck(this)">
								<input type="hidden" name="idcheckfin" value="idUncheck">
								<br>
								<span id="idcheck"></span>
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="user_pwd" id="user_pwd" onkeyup="pwdKorCheck(this)" onchange="pwdInput()">
								<br>
								<span id="pwdcheck"></span>
							</td>
							
						</tr>
						
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" name="user_repwd" id="user_repwd" onchange="pwdInput()">
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
								010-
								<input name="user_phone_mid" id="user_phone_mid" maxlength="4">
								-
								<input name="user_phone_end" id="user_phone_end" maxlength="4">
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
								<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
								<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
								<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
							<div class="ui-widget">
								<td>
									<input name="user_email" id="user_email" onkeyup="autoEmail()" autocomplete="off">
									<input type="button" value="이메일 인증">
									<br>
									<span id="emailcheck"></span>
								</td>
							</div>
						</tr>
					</table>
					<br>
					
					<input type="checkbox" id="cbx_chkAll">
					<label><b>사용자 약관 전체 동의</b></label>
					<hr color="gray">
					
					<input type="checkbox" name="chk" id="required_1">
					<label>서비스 이용 약관 동의(필수)</label>
					<span id="main"><i class="fa-solid fa-chevron-down"></i></span>
					<div id="detail">
						<pre>
							<jsp:include page="../terms/user/service_terms" />
						</pre>
					</div>
					<br>
					
					<input type="checkbox" name="chk" id="required_2">
					<label>개인정보 처리방침 동의(필수)</label>
					<span id="main"><i class="fa-solid fa-chevron-down"></i></span>
					<div id="detail">
					 	<pre>
					 		<jsp:include page="../terms/user/info_terms" />
						</pre>
					</div>
					<br>
					
					<input type="checkbox" name="chk" id="required_3">
					<label>만 14세 이상 확인(필수)</label>
					<span id="main"><i class="fa-solid fa-chevron-down"></i></span>
					<div id="detail">
						<pre>
							<jsp:include page="../terms/user/kid_terms" />
						</pre>
					</div>
					<br>
					
					<input type="checkbox" name="chk">
					<label>평생회원제 동의(선택)</label>
					<span id="main"><i class="fa-solid fa-chevron-down"></i></span>
					<div id="detail">
						<pre>
							<jsp:include page="../terms/user/member_terms" />
						</pre>
					</div>
					<br>
					
					<input type="checkbox" name="chk">
					<label>쿠폰, 이벤트 등 혜택 알림 동의(선택)</label>
					<span id="main"><i class="fa-solid fa-chevron-down"></i></span>
					<div id="detail">
						<pre>
							<jsp:include page="../terms/user/coupon_terms" />
						</pre>
					</div>
					<br>
					
					<hr>
					<input type="submit" id="submit" value="회원가입">
				</form>
			</div>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>