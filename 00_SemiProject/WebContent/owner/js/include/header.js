/**
 * 
 */
function check_pwd(){
	if($('#owner_modi_pwd').val()==$('#owner_modi_repwd')){
		
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