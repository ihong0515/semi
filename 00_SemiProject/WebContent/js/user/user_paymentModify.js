$(document).ready(function(){
	let op_cl = $('#pay_cardcom option');
	let check = 0;
	
	for(let i = 0; i < $(op_cl).length;i++){
		if($(op_cl).eq(i).val()==pay_com){
			$(op_cl).eq(i).attr('selected', true);
			check = 1;
		}
	}
	if(check==0){
		$(op_cl).eq(8).attr('selected', true);
			$('#etc').show();
	}
});

/* null값 체크 */
function modifyPaymentFormCheck() {
	if($('#pay_name').val() == "") {
		$("#pay_name_check").text("");
		$("#pay_name_check").show();
		$("#pay_name_check").append('<font color="red">결제수단 이름을 입력해주세요.</font>');
		$('#pay_name').val('').focus();
		return false;
	} 
	if($('#pay_cardno1').val() == "" || $('#pay_cardno1').val().length < 4) {
		$("#pay_cardno_check").text("");
		$("#pay_cardno_check").show();
		$("#pay_cardno_check").append('<font color="red">카드 번호를 모두 입력해주세요.</font>');
		$('#pay_cardno1').val('').focus();
		return false;
	} 
	if($('#pay_cardno2').val() == "" || $('#pay_cardno2').val().length < 4) {
		$("#pay_cardno_check").text("");
		$("#pay_cardno_check").show();
		$("#pay_cardno_check").append('<font color="red">카드 번호를 모두 입력해주세요.</font>');
		$('#pay_cardno2').val('').focus();
		return false;
	} 
	if($('#pay_cardno3').val() == "" || $('#pay_cardno3').val().length < 4) {
		$("#pay_cardno_check").text("");
		$("#pay_cardno_check").show();
		$("#pay_cardno_check").append('<font color="red">카드 번호를 모두 입력해주세요.</font>');
		$('#pay_cardno3').val('').focus();
		return false;
	} 
	if($('#pay_cardno4').val() == "" || $('#pay_cardno4').val().length < 4) {
		$("#pay_cardno_check").text("");
		$("#pay_cardno_check").show();
		$("#pay_cardno_check").append('<font color="red">카드 번호를 모두 입력해주세요.</font>');
		$('#pay_cardno4').val('').focus();
		return false;
	} 
	if($('#pay_cardcom').val() == "") {
		$("#pay_cardcom_check").text("");
		$("#pay_cardcom_check").show();
		$("#pay_cardcom_check").append('<font color="red">카드 회사를 선택해주세요.</font>');
		$('#pay_cardcom').val('').focus();
		return false;
	} 
	if($('#pay_cvc').val() == "") {
		$("#pay_cvc_check").text("");
		$("#pay_cvc_check").show();
		$("#pay_cvc_check").append('<font color="red">CVC 번호 3자리를 입력해주세요.</font>');
		$('#pay_cvc').val('').focus();
		return false;
	} 
	if($('#pay_pwd').val() == "") {
		$("#pay_pwd_check").text("");
		$("#pay_pwd_check").show();
		$("#pay_pwd_check").append('<font color="red">카드 비밀번호 앞 2자리를 입력해주세요.</font>');
		$('#pay_pwd').val('').focus();
		return false;
	} 
	if($('#pay_date').val() == "") {
		$("#pay_date_check").text("");
		$("#pay_date_check").show();
		$("#pay_date_check").append('<font color="red">유효기간을 입력해주세요.</font>');
		$('#pay_date').val('').focus();
		return false;
	} 
}

function etc_card(e) {
	if($(e).val() == 'etc'){
		$("#etc").show();
	} else {
		$("#etc").hide();
		$('#pay_cardcom option:eq(8)').val('etc');
	}
}

function etc_func() {
	$("#etc_option").val($("#etc").val());
}