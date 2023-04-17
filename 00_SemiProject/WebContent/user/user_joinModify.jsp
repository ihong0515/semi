<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/user/user_modify.js?ver=2"></script>
<link href="<%=request.getContextPath() %>/css/user/user_modify.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/user/user_pwdChange_modal.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
	    <div id="content">
	    	<jsp:include page="../user/user_mypage_header.jsp"/>
			<div id="modify_table">
				<h2>회원 정보 수정</h2>
				<form method="post" action="<%=request.getContextPath() %>/user_modify_ok.do" onsubmit="return modifyFormCheck()">
					<table>
						<tr> 
							<th>이름</th>
							<td id="name_td">${user_dto.getUser_name()}</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td id="id_td">${user_dto.getUser_id()}</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td id="pwd_td">
								<div id="btnWrap">
									<input type="button" id="pwd_modify_btn" value="비밀번호 변경" onclick="show_modal()">
								</div>
								<div id="modal_wrap">
									<div id="myModal" class="myModal">
										<input type="hidden" name="user_no" value="${user_dto.getUser_no() }">
										<h2>비밀번호 변경</h2>
										<div id="modal_content" align="center">
											<table>
												<tr class="modal_content_wrap">
													<th>현재 비밀번호</th>
													<td><input type="password" name="now_pwd" id="now_pwd"></td>
												</tr>
												<tr class="modal_content_wrap">
													<th>변경할 비밀번호</th>
													<td>
														<input type="password" name="new_pwd" id="new_pwd" onchange="pwdInput()">
														<span id="pwdcheck"></span>
													</td>
												</tr>
												<tr class="modal_content_wrap">
													<th>변경할 비밀번호 재확인</th>
													<td>
														<input type="password" name="re_new_pwd" id="re_new_pwd" onchange="pwdInput()">
														<span id="repwdcheck"></span>
													</td>
												</tr>
												<tr class="modal_btn_wrap">
													<td colspan="2" align="center">
														<input type="submit" id="modal_btn_submit" value="비밀번호 변경" onclick="javascript: form.action='<%=request.getContextPath()%>/user_pwdChange.do'">
														<input type="button" id="modal_btn_close" value="닫기" onClick="close_modal()">
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td>
								<div id="user_phone">
									<div class="user_phone_txt">010&nbsp;&nbsp;-&nbsp;&nbsp;</div>
									<input type="text" name="user_phone_mid" id="user_phone_mid" class="phone_number" maxlength="4" value="${user_dto.getUser_phone().substring(4,8)}">
									<div class="user_phone_txt">&nbsp;&nbsp;-&nbsp;&nbsp;</div>
									<input type="text" name="user_phone_end" id="user_phone_end" class="phone_number" maxlength="4" value="${user_dto.getUser_phone().substring(9)}">
								</div>
								<span id="phonecheck"></span>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="date" name="user_birth" id="user_birth" value="${user_dto.getUser_birth()}"></td>
						</tr>
						<tr>
							<th>선호지역</th>
							<td>
								<select name="user_region" id="user_region" value="${user_dto.getUser_region()}">
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="강원">강원</option>
									<option value="전남">전남</option>
									<option value="전북">전북</option>
									<option value="충북">충북</option>
									<option value="충남">충남</option>
									<option value="경남">경남</option>
									<option value="경북">경북</option>
									<option value="제주">제주</option>
						        </select>
						        <br>
								<span id="regioncheck"></span>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td id="email_td">${user_dto.getUser_email() }</td>
						</tr>
					</table>
					<div id="modify_button_div">
						<input type="submit" id="submit" class="modify_button" value="수정하기">
						<input type="reset" class="modify_button" value="다시 작성하기">
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>
