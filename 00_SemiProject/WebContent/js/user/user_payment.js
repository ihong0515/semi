function check(user_no, pay_no) {
	let res = confirm("정말로 삭제하시겠습니까?");
	if(res) {
		location.href="user_deletePaymentOk.do?user_no="+user_no+"&&pay_no="+pay_no;
	}
}

function etc_card(e) {
	if($(e).val()=='etc'){
		$("#etc_input").show();
	}else{
		$("#etc_input").hide();
		$('#pay_cardcom option:eq(8)').val('etc');
	}
	
}

function inputMoveNumber(num) {
	if(isFinite(num.value) == false) {
		alert("카드번호는 숫자만 입력할 수 있습니다.");
		num.value = "";
		return false;
	}
	max = num.getAttribute("maxlength");
	if(num.value.length >= max) {
		num.nextElementSibling.focus();
	}
}

function etc() {
	$("#etc_option").val($("#etc_input").val());
}