/**
 * 
 */
/*$(document).ready(function(){
	$('.room_content_img_dot span').hover(function(){
		if($(this).attr('style')=='color:red'){
			console.log(1);
		}else{
			$(this).css('color', '#FB7673');
			console.log(1);
		}
	},function(){
		if($(this).attr('style')=='color:red'){
			console.log(2);
		}else{
			$(this).css('color', '#fbc0bf');
			console.log(2);
		}
	});
});*/

function nextSlideSpan(i, self){
	$(self).parent().prev().find('img').hide();
	$(self).parent().prev().find('img').eq(i).show();
	$(self).parent().find('span').css('color','#fbc0bf');
	$(self).css('color','red');
}

function nextSlideImg(self, i){
	$(self).hide();
	$(self).parent().next().find('span').css('color','#fbc0bf');
	if($(self).next().length==0){
		$(self).parent().find("img:first-child").show();
		$(self).parent().next().find('span').eq(0).css('color','red');
	}else{
		$(self).next().show();
		$(self).parent().next().find('span').eq(i).css('color','red');
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
	$('#write_body input').val("");
	$('#write_body textarea').val("");
	$('#write_overlay').hide();
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
					title: $(title).val(),
					content: $(cont).val(),
					user_no: user_no,
					hotel_no: ho_no
				},
				datatype: "text",
				success: function(data){
					if(data>0){
						alert('호텔에 문의사항을 보냈습니다.');
						title.val("");
						cont.val("");
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