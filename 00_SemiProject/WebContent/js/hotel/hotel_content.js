/**
 * 
 */

function nextSlideImg(self){
	$(self).hide();
	if($(self).next().length==0){
		$(self).parent().find("img:first-child").show();
	}else{
		$(self).next().show();
	}
}

function board_open(){
	$('#write_overlay').show();
}

function board_close(){
	$('#write_overlay').hide()
}


function board_write(){
	let title = $('#write_head_title input');
	let cont = $('#write_body textarea');
	
	if(title.val()==''){
		alert('제목을 입력하세요.');
		title.focus();
	}else if(cont.val()==''){
		alert('문의 내용을 입력하세요.');
		cont.focus();
	}else{
		if(confirm('호텔에 대한 문의사항을 보냅니다. 전송하시겠습니까?')){
			
		}
	}
}