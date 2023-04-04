/**
 * 
 */
function modal_click(e) {
	modal_close();
	let modal_class = $(e).attr('class');
	$('#modal').css('display', 'flex');
	$('#modal').find('.'+modal_class+'').css('display','inline-block');
}

function modal_close(){
	$('.modal-window').css('display','none');
	$('#modal').css('display','none');
}
function modal_check(e){
	modal_close();
	let modal_class = $(e).parents('div').attr('class').slice(13);
	$('#payment_terms .'+modal_class+'[type="checkbox"]').attr('checked',true);
}
function modal_uncheck(e){
	modal_close();
	let modal_class = $(e).parents('div').attr('class').slice(13);
	$('#payment_terms .'+modal_class+'[type="checkbox"]').removeAttr('checked');
}

function check_payment() {
	if($('#userFirstName').val()==''){
		$('#userFirstName').focus();
		
		return false;
	}else if($('#userLastName').val()==''){
		$('#userLastName').focus();
		
		return false;
	}else if($('#userEmail').val()==''){
		$('#userEmail').focus();
		
		return false;
	}else if($('#userPhone_body').val()==''){
		$('#userPhone_body').focus();
		
		return false;
	}else if(!$('.use_terms[type="checkbox"]').is(":checked")){
		$('.use_terms').focus();
		alert('이용 약관을 읽고 동의하세요.');
		return false;
	}else if(!$('.privat_terms[type="checkbox"]').is(":checked")){
		$('.privat_terms').focus();
		alert('개인정보 처리방침을 읽고 동의하세요.');
		return false;
	}else if(!$('.servies_terms[type="checkbox"]').is(":checked")){
		$('.servies_terms').focus();
		alert('공급업체 서비스 약관을 읽고 동의하세요.');
		return false;
	}else if(!$('.tex_terms[type="checkbox"]').is(":checked")){
		$('.tex_terms').focus();
		alert('세금 명세 약관을 읽고 동의하세요.');
		return false;
	}else{
		
		return true;
	}		
}

function payment_getno(){
	$.ajax({
		type: "post",
		url: "payment_get_Content.do",
		data: {
			card_no: $('#userCard').val(),
		},
		datatype: "xml",
		success: function(data){
			let cardno = $(data).find("pay_cardno").text();
			
			let txt = "카드번호 : "+cardno.slice(0,4)+"-****-****-"+cardno.slice(12)+" 할부 : <input type='number' min='1' name='reserv_ins' style='width:30px;'>"
			txt += "<br>카드사 : "+ $(data).find("pay_cardcom").text();
			$('#payment_usercard_view p').html(txt);
		},
		error: function(){
			alert('카드 가져오기 실패..');
		}
	});
}