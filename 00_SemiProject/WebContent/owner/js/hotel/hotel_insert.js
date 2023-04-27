/**
 * 
 */
function insert_check(){
	if(f.name.value==''){
		alert('호텔 이름을 입력하세요');
		f.name.focus();
		return false;
	}else if(f.addr.value==''){
		alert('주소를 입력하세요.');
		f.addr.focus();
		return false;
	}else if($('#phone_head').val()==''){
		alert('연락처를 입력하세요.');
		$('#phone_head').focus();
		return false;
	}else if($('#phone_middle').val()==''){
		alert('연락처를 입력하세요.');
		$('#phone_middle').focus();
		return false;
	}else if($('#phone_foot').val()==''){
		alert('연락처를 입력하세요.');
		$('#phone_foot').focus();
		return false;
	}else if(f.location.value==''){
		alert('지역을 입력하세요.');
		f.location.focus();
		return false;
	}else if(f.email.value==''){
		alert('이메일을 입력하세요.');
		f.email.focus();
		return false;
	}else if(f.count.value==''){
		alert('객실 수를 입력하세요.');
		f.count.focus();
		return false;
	}else if(f.est.value==''){
		alert('설립 연도를 입력하세요.');
		f.est.focus();
		return false;
	}else if(f.pri_min.value==''){
		alert('최저가를 입력하세요.');
		f.pri_min.focus();
		return false;
	}else if(f.pri_max.value==''){
		alert('최고가를 입력하세요.');
		f.pri_max.focus();
		return false;
	}else if(f.peo_min.value==''){
		alert('최저 투숙객을 입력하세요.');
		f.peo_min.focus();
		return false;
	}else if(f.peo_max.value==''){
		alert('최고 투숙객을 입력하세요.');
		f.peo_max.focus();
		return false;
	}else if(f.star.value==''){
		alert('호텔 성급을 입력하세요.');
		f.star.focus();
		return false;
	}else if($('.hashtag:eq(0)').val()==''){
		alert('해쉬태그를 입력하세요.');
		$('.hashtag:eq(0)').focus();
		return false;
	}else if($('.hashtag:eq(1)').val()==''){
		alert('해쉬태그를 입력하세요.');
		$('.hashtag:eq(1)').focus();
		return false;
	}else if($('.hashtag:eq(2)').val()==''){
		alert('해쉬태그를 입력하세요.');
		$('.hashtag:eq(2)').focus();
		return false;
	}else if(f.info.value==''){
		alert('호텔 정보를 입력하세요.');
		f.info.focus();
		return false;
	}else if(f.file.value==''){
		alert('호텔의 메인 사진을 등록하세요.');
		f.file.focus();
		return false;
	}else{
		return true;
	}
}