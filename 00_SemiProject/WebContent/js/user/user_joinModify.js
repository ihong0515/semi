
/* null값 체크 */
function modifyFormCheck() {

	if($('#user_phone_mid').val() == "") {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 입력해주세요.</font>');
		$('#user_phone_mid').val('').focus();
		return false;
	} 
	if($('#user_phone_end').val() == "") {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 입력해주세요.</font>');
		$('#user_phone_end').val('').focus();
		return false;
	} 
	if($('#user_phone_mid').val().length < 4) {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 4자리를 모두 입력해주세요.</font>');
		$('#user_phone_mid').val('').focus();
		return false;
	} 
	if($('#user_phone_end').val().length < 4) {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 4자리를 모두 입력해주세요.</font>');
		$('#user_phone_end').val('').focus();
		return false;
	} 
	if($('#user_birth').val() == "") {
		$("#birthcheck").text("");
		$("#birthcheck").show();
		$("#birthcheck").append('<font color="red">생년월일을 입력해주세요.</font>');
		$('#user_birth').val('').focus();
		return false;
	} 
	if($('#user_region').val() == "") {
		$("#regioncheck").text("");
		$("#regioncheck").show();
		$("#regioncheck").append('<font color="red">선호 지역을 입력해주세요.</font>');
		$('#user_region').val('').focus();
		return false;
	} 
}

/* 비밀번호 변경 모달창 */
function show_modal() {
	$('#modal_wrap').show();
	$('#myModal').show();
}

function close_modal() {
	$('#myModal').hide();
	$('#modal_wrap').hide();
}

function pwdInput(){
	/* 비밀번호 유효성 검사 */
	checkPwd($('#new_pwd').val());
	
	var pwd = $('#new_pwd').val();
	var repwd = $('#re_new_pwd').val();
		
	if(pwd != "" && repwd != "") {
		if(pwd == repwd) { // 일치
			$("#repwdcheck").text("");
			$("#repwdcheck").show();
			$("#repwdcheck").append('<font color="blue">비밀번호가 일치합니다.</font>');
		} else { // 불일치
			$("#repwdcheck").text("");
			$("#repwdcheck").show();
			$("#repwdcheck").append('<font color="red">비밀번호가 일치하지 않습니다.</font>');
			$('#re_new_pwd').val('').focus();
		}
	}
}

function checkPwd(pwd) {
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pwd)) {            
		$("#pwdcheck").text("");
		$("#pwdcheck").show();
		$("#pwdcheck").append('<font color="red">숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</font>');
		$('#new_pwd').val('').focus();
    } else if(/(\w)\1\1\1/.test(pwd)) {
		$("#pwdcheck").text("");
		$("#pwdcheck").show();
		$("#pwdcheck").append('<font color="red">같은 문자를 4번 이상 사용하실 수 없습니다.</font>');
		$('#new_pwd').val('').focus();
	} else {
		$("#pwdcheck").text("");
		$("#pwdcheck").show();
		$("#pwdcheck").append('<font color="blue">사용가능한 비밀번호입니다.</font>');
    }
}

function pwdKorCheck(e){
	/* 비밀번호 input에 한글 입력 불가능  */
	$(e).val( $(e).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '') );
}
