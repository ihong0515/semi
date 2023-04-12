/**
 * 
 */
function modify_content_toggle(){
	$('.board_list').toggle();
	$('.board_btn').toggle();
}
function modify_check(){
	if(form.site_title.value == ''){
		alert('제목을 입력하세요.');
		form.site_title.focus();
		return false;
	}else if(form.site_content.value == "") {
		alert("글 내용을 입력하세요!!!");
		form.board_content.focus();
		return false;
	}else{
		return confirm('문의내용을 수정합니다.');
	}
}

function delete_hotel(){
	if(write_check=='U'||user_no==1){
		location.href=contextPath+"/board_hotel_delete.do?board_no="+board_no+"&group_no="+group_no+"&step_no="+step_no;
	}else{
		alert('호텔의 답변은 지울 수 없습니다.');
	}
}
function modify_check(){
	if(write_check=='U'||user_no==1){
		if(form.site_title.value == ''){
			alert('제목을 입력하세요.');
			form.site_title.focus();
			return false;
		}else if(form.site_content.value == "") {
			alert("글 내용을 입력하세요!!!");
			form.board_content.focus();
			return false;
		}else{
			return confirm('문의내용을 수정합니다.');
		}
	}else{
		alert('호텔의 답변은 수정할 수 없습니다.');
		return false;
	}
}