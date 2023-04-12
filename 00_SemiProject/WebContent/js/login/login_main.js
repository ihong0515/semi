/**
 * 
 */

function openIdSearch(){
	$('#login_modal').show();
	$('#pwd_search_modal').hide();
	$('#id_search_modal').show();
}

function openPwdSearch(){
	$('#login_modal').show();
	$('#id_search_modal').hide();
	$('#pwd_search_modal').show();
}

function close_modal(){
	$('#login_modal').hide();
}