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

function openSearchPage(a){
	window.open(a, "회원가입/아이디/비밀번호 찾기", 
	"titlebar=0,height=700,width=500,top=120,left=400,status=0,scrollbars=0,location=0,resizable=0,menubar=0,toolbar=0"
	, "");
}