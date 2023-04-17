/**
 * 
 */

function check_apply(){
	let f = $('#apply_form input');
	
	console.log(f);
	
	if(f.eq(0).val() == ''){
		alert('이름을 입력하세요.');
		f.eq(0).focus();
		return false;
	}else if(f.eq(1).val() == ''){
		alert('사업자 번호를 입력하세요.');
		f.eq(1).focus();
		return false;
	}else if(f.eq(2).val() == ''){
		alert('연락처를 입력하세요.');
		f.eq(2).focus();
		return false;
	}else{
		return true;
	}
}