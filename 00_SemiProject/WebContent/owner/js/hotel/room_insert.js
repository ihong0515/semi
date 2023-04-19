/**
 * 
 */

function insert_check(){
	if(f.name.value==""){
		alert('이름을 입력하세요.');
		f.name.focus();
		return false;
	}else if(f.pri.value==""){
		alert('가격을 입력하세요.');
		f.pri.focus();
		return false;
	}else if(f.bed.value==""){
		alert('침대 타입을 입력하세요.');
		f.bed.focus();
		return false;
	}else if(f.size.value==""){
		alert('객실 크기를 입력하세요.');
		f.size.focus();
		return false;
	}else if(f.peo_min.value==""){
		alert('최저 투숙객을 입력하세요.');
		f.peo_min.focus();
		return false;
	}else if(f.peo_max.value==""){
		alert('최고 투숙객을 입력하세요.');
		f.peo_max.focus();
		return false;
	}else if(f.in.value==""){
		alert('체크인 시간을 입력하세요.');
		f.in.focus();
		return false;
	}else if(f.out.value==""){
		alert('체크아웃 시간을 입력하세요.');
		f.out.focus();
		return false;
	}else if(f.bf.value==""){
		alert('조식 가능 여부를 입력하세요.');
		f.bf.focus();
		return false;
	}else if(f.file.value==""){
		alert('객실 사진을 첨부하세요.');
		f.file.focus();
		return false;
	}else {
		return true;
	}
}