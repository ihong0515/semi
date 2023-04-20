/**
 * 
 */
function check_pwd(){
	if($('#owner_modi_pwd').val()==$('#owner_modi_repwd')){
		if(f.name.val==''){
			alert('이름을 입력하세요.');
			f.name.focuse();
			return false;
		}else if(f.pwd.val==''){
			alert('비밀번호를 입력하세요.');
			f.pwd.focuse();
			return false;
		}else if(f.phone.val==''){
			alert('연락처을 입력하세요.');
			f.phone.focuse();
			return false;
		}else if(f.email.val==''){
			alert('이메일을 입력하세요.');
			f.email.focuse();
			return false;
		}else{
			return true;
		}
	}else{
		$('#owner_modi_repwd').parent().gt(1).remove();
		$('#owner_modi_repwd').after("<font color='red'>비밀번호를 확인하세요.</font>");
		return false;
	}
}

function check_board(){
	if($('#title').val()==''){
		alert('제목을 입력하세요.');
		$('#title').focus();
		return false;
	}else if($('#cont').val()==''){
		alert('내용을 입력하세요.');
		$('#cont').focus();
		return false;
	}else{
		return true;
	}
}

function list_move(){
	location.href=contextPath+'/owner_hotel_list.do';
}
function board_move(){
	location.href=contextPath+"/owner_board_list.do";
}