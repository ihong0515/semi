/**
 * 
 */

function login_check(){
	let id = $('#login input:eq(0)');
	let pwd = $('#login input:eq(1)');
	
	if(id.val()==''){
		alert('아이디를 입력하세요.');
		id.focus();
		return false;
	}else if(pwd.val()==''){
		alert('비밀번호를 입력하세요.');
		pwd.focus();
		return false;
	}else{
		return true;
	}
}