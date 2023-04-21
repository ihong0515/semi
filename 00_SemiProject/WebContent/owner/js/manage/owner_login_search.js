/**
 * 
 */
function id_check(i){
	let name = $('.name_inp');
	let mail = $('.mail_inp');
	if(i==1){
		if($(name).val()==''){
			alert('이름을 입력하세요.');
			$(name).focus();
		}else if($(mail).val()==''){
			alert('E-mail을 입력하세요.');
			$(mail).focus();
		}else{
			$('#id_form').attr('action',
			 contextPath+'/owner_id_search.do?check=owner_id_search');
			$('#id_form').submit();
		}
	}else if(i==2){
		if($(name).val()==''){
			alert('이름을 입력하세요.');
			$(name).focus();
		}else if($(mail).val()==''){
			alert('E-mail을 입력하세요.');
			$(mail).focus();
		}else if($('#check_code').val()==''){
			alert('인증코드를 입력하세요.');
			$('#check_code').focus();
		}else{
			$('#id_form').attr('action',
			 contextPath+'/user_Email_Check.do?check=owner_id_search');
			$('#id_form').submit();
		}
	}
}
function pwd_check(i){
	let id = $('.id_inp');
	let mail = $('.mail_inp');
	
	if(i==1){
		if($(id).val()==''){
			alert('ID를 입력하세요.');
			$(id).focus();
		}else if($(mail).val()==''){
			alert('E-mail을 입력하세요.');
			$(mail).focus();
		}else{
			$('#pwd_form').attr('action',
			 contextPath+'/owner_pwd_search.do?check=owner_pwd_search');
			$('#pwd_form').submit();
		}
	}else if(i==2){
		if($(id).val()==''){
			alert('ID를 입력하세요.');
			$(id).focus();
		}else if($(mail).val()==''){
			alert('E-mail을 입력하세요.');
			$(mail).focus();
		}else if($('#check_code').val()==''){
			alert('인증코드를 입력하세요.');
			$('#check_code').focus();
		}else{
			$('#pwd_form').attr('action',
			 contextPath+'/user_Email_Check.do?check=owner_pwd_search');
			$('#pwd_form').submit();
		}
	}else if(i==3){
		if($(id).val()==''){
			alert('ID를 입력하세요.');
			$(id).focus();
		}else if($('#repwd').val()==''){
			alert('비밀번호를 입력하세요.');
			$('#repwd').focus();
		}else if($('#repwd_check').val()==''){
			alert('비밀번호를 확인하세요.');
			$('#repwd_check').focus();
		}else{
			$('#pwd_form').attr('action',
			 contextPath+'/owner_PwdRenew.do');
			$('#pwd_form').submit();
		}
	}
}

function pwdInput(){
	let pwd = $('#repwd').val();
	let repwd = $('#repwd_check');
	let result = $('#pwd_check_result');
	/*비밀번호 유효성 검사*/
	if(checkPwd(pwd)){
		if(pwd != "" || repwd.val() != "") {
			if(pwd==repwd.val()) { // 일치
				$(result).show();
				$(result).html('<font color="blue">비밀번호가 일치합니다.</font>');
			} else { // 불일치
				$(result).show();
				$(result).html('<font color="red">비밀번호가 일치하지 않습니다.</font>');
				$(repwd).val('').focus();
			}
		}
	}
}
function checkPwd(pwd) {
    let result = $('#pwd_check_result');

	if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/.test(pwd))  {            
		$(result).html('');
		$(result).html('<font color="red">숫자+영문자 조합으로 8자리 이상 사용해야 합니다.</font>');
		$(result).show();
		$('#repwd').val('').focus();
		return false;
    } else if(/(\w)\1\1\1/.test(pwd)) {
		$(result).html('');
		$(result).html('<font color="red">같은 문자를 4번 이상 사용하실 수 없습니다.</font>');
		$(result).show();
		$('#repwd').val('').focus();
		return false;
	} else {
		$(result).html('');
		$(result).html('<font color="blue">사용가능한 비밀번호입니다.</font>');
		$(result).show();
    	return true;
	}
}