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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user/user_join.js?ver=1"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/user_join.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
			<h2>J O I N</h2>
			<form method="post" name="joinForm" id="joinForm" action="<%=request.getContextPath()%>/user_join_ok.do" onsubmit="return joinFormCheck()">
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="user_id" id="user_id" placeholder="ID" onblur="checkId(this)" onkeyup="idKorCheck(this)">
							<input type="hidden" name="idcheckfin" value="idUncheck">
							<br>
							<span id="idcheck"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호를 입력해주세요." onkeyup="pwdKorCheck(this)" onchange="pwdInput()">
							<br>
							<span id="pwdcheck"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="user_repwd" id="user_repwd" placeholder="비밀번호를 확인해주세요." onchange="pwdInput()">
							<br>
							<span id="repwdcheck"></span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="user_name" id="user_name" placeholder="홍길동">
							<br>
							<span id="namecheck"></span>
						</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td id="input_phone">
							010&nbsp;&nbsp;-&nbsp;&nbsp;
							<input type="text" name="user_phone_mid" class="user_phone" maxlength="4" placeholder="0 0 0 0">
							&nbsp;&nbsp;-&nbsp;&nbsp;
							<input type="text" name="user_phone_end" class="user_phone" maxlength="4" placeholder="0 0 0 0">
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
						<td>
							<div class="ui-widget">
								<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
								<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
								<input type="text" name="user_email" id="user_email" onkeyup="autoEmail()" autocomplete="off" placeholder="이메일을 입력해주세요.">
								<input type="button" id="user_emailSend" value="이메일 인증" onclick="emailSend()">
								<br>
								<span id="emailcheck"></span>
							</div>
						</td>
					</tr>
					<tr>
						<th>이메일 확인</th>
						<td>
							<div class="user_email_check">
								<input type="text" id="user_email_check">
								<input type="button" id="user_email_checkSubmit" value="인증번호 확인" onclick="emailCheck()">
							</div>
						</td>
					</tr>
				</table>
				<div id="agree_container">
					<div class="agree_q">
						<input type="checkbox" id="cbx_chkAll" onclick="checkFalse()">
						<label><b>사용자 약관 전체 동의</b></label>
					</div>
					<hr id="hr">
					<div class="agree_q">
						<input type="checkbox" name="chk" id="required_1" onclick="checkTrue()">
						<label>서비스 이용 약관 동의(필수)</label>
						<span class="main" onclick="agreeShow(this)"><i class="fa-solid fa-chevron-down"></i></span>
						<div class="detail">
							<jsp:include page="../terms/payment/service_terms" />
						</div>
					</div>
					<div class="agree_q">
						<input type="checkbox" name="chk" id="required_2" onclick="checkTrue()">
						<label>개인정보 처리방침 동의(필수)</label>
						<span class="main" onclick="agreeShow(this)"><i class="fa-solid fa-chevron-down"></i></span>
						<div class="detail">
						 	<jsp:include page="../terms/user/info_terms" />
						</div>
					</div>
					<div class="agree_q">
						<input type="checkbox" name="chk" id="required_3" onclick="checkTrue()">
						<label>만 14세 이상 확인(필수)</label>
						<span class="main" onclick="agreeShow(this)"><i class="fa-solid fa-chevron-down"></i></span>
						<div class="detail">
							<jsp:include page="../terms/user/kid_terms" />
						</div>
					</div>
					<div class="agree_q">
						<input type="checkbox" name="chk" onclick="checkTrue()">
						<label>평생회원제 동의(선택)</label>
						<span class="main" onclick="agreeShow(this)"><i class="fa-solid fa-chevron-down"></i></span>
						<div class="detail">
							<jsp:include page="../terms/user/member_terms" />
						</div>
					</div>
					<div class="agree_q">
						<input type="checkbox" name="chk" onclick="checkTrue()">
						<label>쿠폰, 이벤트 등 혜택 알림 동의(선택)</label>
						<span class="main" onclick="agreeShow(this)"><i class="fa-solid fa-chevron-down"></i></span>
						<div class="detail">
							<jsp:include page="../terms/user/coupon_terms" />
						</div>
					</div>
					<input type="submit" id="submit" value="J O I N">
				</div>
			</form>
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>