/**
 * 
 */
function modal_click(e) {
	modal_close();
	let modal_class = $(e).attr('class');
	$('#modal').css('display', 'flex');
	$('#modal').find('.'+modal_class).css('display','inline-block');
}
function modal_close(){
	$('.modal-window').css('display','none');
	$('#modal').css('display','none');
}

function modal_check(e){
	modal_close();
	let modal_class = $(e).parents().parents('div').attr('class').slice(13);
	$('#payment_terms .'+modal_class+'[type="checkbox"]').attr('checked',true);
}
function modal_uncheck(e){
	modal_close();
	let modal_class = $(e).parents().parents('div').attr('class').slice(13);
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
	}else if($('#userCard').val()==""){
		$('#userCard').focus();
		alert('카드를 선택하세요.');
		return false;
	}else if(confirm('호텔 결제를 진행합니다. 정말로 결제하시겠습니까.')){
		return true;
	}else{
		return false;
	}
}

function payment_getno(){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: "payment_get_Content.do",
		data: {
			card_no: $('#userCard').val(),
		},
		datatype: "xml",
		success: function(data){
			let cardno = $(data).find("pay_cardno").text();
			let pay_no = $(data).find("pay_no").text();
			let txt = "카드번호 : "+cardno.slice(0,4)+"-****-****-"+cardno.slice(12)+" / 할부 : <input type='number' value='1' min='1' name='reserv_ins' style='width:30px;'>";
			txt += "<br>카드사 : "+ $(data).find("pay_cardcom").text();
			
			$('#payment_usercard_view p').html(txt);
			$('#card_no').val(pay_no);
		},
		error: function(){
			alert('카드 가져오는 중 시스템 오류');
		}
	});
}

function saleCheck() {
	let coup_no_val = $('#prom_code_select').val();
	if(coup_no_val=='basic'){
		$('#coupon_name').text('쿠폰 미적용');
		$('#salePrice').text('0');
		$('#saleP_hide').val('0');
		$('#sales_hide').val('0');
		let pri = $('#ori_pri_hide').val();
		let resultPrice = pri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#realPrice').text("₩"+resultPrice);
		$('#realPrice_hidden').val(pri);
		$('#coup_no').val('');
		$('#prom_no').val('');
	}else{
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: "coupon_get_SalePrice.do",
			data: {
				coup_no: coup_no_val,
				price: $('#ori_pri_hide').val()
			},
			datatype: "xml",
			success: function(data){
				alert('쿠폰 등록 성공!');
				$(data).find("coupon").each(function() {
					let saleP = $("saleP", this).text();
					let price = $("price", this).text();
					let name = $("name", this).text();
					let sale = $("sale", this).text();
					
					let resultSale = saleP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					let resultPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					
					$('#coupon_name').text(name +" / "+ sale+" % 할인");
					$('#salePrice').text("₩"+resultSale);
					$('#realPrice').text("₩"+resultPrice);
					$('#saleP_hide').val(saleP);
					$('#coup_no').val($("coup_no", this).text());
					$('#prom_no').val($("prom_no", this).text());
					$('#realPrice_hidden').val(price);
					$('#sales_hide').val(sale);
				});
			},
			error: function(){
				alert('쿠폰 등록 중 시스템 오류');
			}
		});
	}
}
function inoutChange(self){
	let outdays = $(self).val();
	let indays = $('.checkInP').val();
	
	let result = new Date(outdays).getTime() - new Date(indays).getTime();
	let inoutdays = result/1000/60/60/24;
	
	let ori_pri = room_price_val*inoutdays;
	let sale_pri = ori_pri * ($('#sales_hide').val()/100);
	let result_Pri = ori_pri - sale_pri;
	
	let result_Ori_Pri = ori_pri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	let result_real_Pri = result_Pri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	let result_sale_Pri = sale_pri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
	$('#ori_pri_hide').val(ori_pri);
	$('#inoutDay_text').text(inoutdays);
	$('#original_price').text("₩"+result_Ori_Pri);
	$('#realPrice').text("₩"+result_real_Pri);
	$('#salePrice').text("₩"+result_sale_Pri);
	$('#realPrice_hidden').val(result_Pri);
	$('#nomalPrice_hidden').val(ori_pri);
	$('#inoutDay_hide').val(inoutdays);
}