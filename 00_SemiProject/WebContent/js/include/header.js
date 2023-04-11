/**
 * 
 */
$(document).ready(function(){
	if(checkdate_param){
        $(".checkIn").val(new Date().toISOString().slice(0, 10));
        $(".checkOut").val(new Date(new Date().setDate(new Date().getDate() + 1)).toISOString().slice(0, 10));
     }
	if($('#Starlocation').length){
		serchHotelList($('#Starlocation'));
		serchHotelList($('#lowPricelocation'));
	}
});

function logout() {
	if(confirm('로그아웃 진행하십니까?')){
		location.href=contextPath+"/user_logout.do";
	}else{
		return ;
	}
}

function likeInsert(self, no){
	if(user_no!=''){
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url : "hotel_likeInsert_jjim.do",
			data : {
				param_hotel_no: no,
				param_user_no: user_no
			},
			datatype : "text",
			success : function(data){
				let txt = "<i class='fa fa-heart' aria-hidden='true'></i>"
				
				if(data>0){
					$(self).html(txt);
					$(self).attr('onclick', 'likeDelete(this, '+no+')');
				}else{
					alert('찜등록 실패..');
				}
			},
			error : function(){
				alert("에러입니다.");
			}
		}); // ajax함수 end
	}else{
		alert('로그인이 필요합니다.');
	}
}

function likeDelete(self, no){
	if(user_no!=''){
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url : "hotel_likeDelete_jjim.do",
			data : {
				param_hotel_no: no,
				param_user_no: user_no
			},
			datatype : "text",
			success : function(data){
				let txt = "<i class='fa fa-heart-o' aria-hidden='true'></i>"
				
				if(data>0){
					$(self).html(txt);
					$(self).attr('onclick', 'likeInsert(this, '+no+')');
				}else{
					alert('찜등록 실패..');
				}
			},
			error : function(){
				alert("에러입니다.");	
			}
		}); // ajax함수 end
	}else{
		alert('로그인이 필요합니다.');
	}
}

function openMypage(){
	$('.submenu').css('display','flex');
	
	$('.submenu').mouseleave(function(){
		$('.submenu').css('display','none');
	});
}





