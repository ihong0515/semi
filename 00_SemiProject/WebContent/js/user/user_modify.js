function modifyFormCheck() {

	if($('#user_phone_mid').val() == "") {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 입력해주세요.</font>');
		$('#user_phone_mid').val('').focus();
		return false;
	} 
	if($('#user_phone_end').val() == "") {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 입력해주세요.</font>');
		$('#user_phone_end').val('').focus();
		return false;
	} 
	if($('#user_birth').val() == "") {
		$("#birthcheck").text("");
		$("#birthcheck").show();
		$("#birthcheck").append('<font color="red">생년월일을 입력해주세요.</font>');
		$('#user_birth').val('').focus();
		return false;
	} 
	if($('#user_region').val() == "") {
		$("#regioncheck").text("");
		$("#regioncheck").show();
		$("#regioncheck").append('<font color="red">선호 지역을 입력해주세요.</font>');
		$('#user_region').val('').focus();
		return false;
	} 

	
}