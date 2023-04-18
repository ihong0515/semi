/**
 * 
 */


function submit_ins(){
	let f = $('#insert_form');
	
	if(f.name.value=''){
		alert('');
		f.name.focus();
		return false;
	}else if(f.addr.value=''){
		alert('');
		f.addr.focus();
		return false;
	}else if(f.phone.value=''){
		alert('');
		f.phone.focus();
		return false;
	}else if(f.location.value=''){
		alert('');
		f.location.focus();
		return false;
	}else if(f.email.value=''){
		alert('');
		f.email.focus();
		return false;
	}else if(f.count.value=''){
		alert('');
		f.count.focus();
		return false;
	}else if(f.est.value=''){
		alert('');
		f.est.focus();
		return false;
	}else if(f.pri_min.value=''){
		alert('');
		f.pri_min.focus();
		return false;
	}else if(f.pri_max.value=''){
		alert('');
		f.pri_max.focus();
		return false;
	}else if(f.peo_min.value=''){
		alert('');
		f.peo_min.focus();
		return false;
	}else if(f.star.value=''){
		alert('');
		f.star.focus();
		return false;
	}else if(f.hashtag.eq(0).value=''){
		alert('');
		f.hashtag.focus();
		return false;
	}else if(f.hashtag.eq(1).value=''){
		alert('');
		f.hashtag.focus();
		return false;
	}else if(f.hashtag.eq(2).value=''){
		alert('');
		f.hashtag.focus();
		return false;
	}else if(f.info.value=''){
		alert('');
		f.info.focus();
		return false;
	}else if(f.file.value=''){
		alert('');
		f.file.focus();
		return false;
	}else{
		return true;
	}
}