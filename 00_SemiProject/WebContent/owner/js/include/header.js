/**
 * 
 */
function hotel_delete(){
	location.href=contextPath+'/owner_hotel_delete.do?no='+$('#no').val();
}

function check_pwd(){
	if($('#owner_modi_pwd').val()==$('#owner_modi_repwd').val()){
		if(f.name.value==''){
			alert('이름을 입력하세요.');
			f.name.focus();
			return false;
		}else if(f.pwd.value==''){
			alert('비밀번호를 입력하세요.');
			f.pwd.focus();
			return false;
		}else if(f.phone.value==''){
			alert('연락처을 입력하세요.');
			f.phone.focus();
			return false;
		}else if(f.email.value==''){
			alert('이메일을 입력하세요.');
			f.email.focus();
			return false;
		}else{
			if(confirm('회원 정보를 수정하시겠습니까.')){
				return true;
			}else{
				return false;
			}
		}
	}else{
		$('#pwd_result').html("");
		$('#pwd_result').html("<font style='font-size: 12px;color:red;'>비밀번호를 확인하세요.</font>");
		f.pwd.focus();
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