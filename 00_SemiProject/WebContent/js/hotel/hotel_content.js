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
	if(user_no==''){
		alert('로그인이 필요합니다.');
	}else{
		$('#write_overlay').show();
	}
}

function board_close(){
	$('#write_overlay').hide()
}

function board_write(ho_no){
	let title = $('#write_body input');
	let cont = $('#write_body textarea');
	
	if(title.val()==''){
	alert('제목을 입력하세요.');
	title.focus();
	}else if(cont.val()==''){
		alert('문의 내용을 입력하세요.');
		cont.focus();
	}else{
		if(confirm('호텔에 대한 문의사항을 보냅니다. 전송하시겠습니까?')){
			$.ajax({
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				type: "post",
				url: contextPath+"/board_hotel_write.do",
				data: {
					title: $('#write_body input').val(),
					content: $('#write_body textarea').val(),
					user_no: user_no,
					hotel_no: ho_no
				},
				datatype: "text",
				success: function(data){
					if(data>0){
						alert('호텔에 문의사항을 보냈습니다.');
						board_close();
					}else{
						alert('문의사항 전송 중 오류가 발생했습니다.');
					}
				},
				error: function(){
					alert('시스템 오류');
				}
			});
		}
	}
}

function review_check(){
	if($('#review_content').val()==''){
		alert('리뷰 내용을 작성하세요.');
		$('#review_content').focus();
		return false;
	}else{
		confirm('리뷰를 등록하시겠습니까?');
	}
}

function starDrag() {
	let starInput = $('#starInput').val()*10;
	$(".rating_star").css('width', starInput);
}