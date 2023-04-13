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
	$('.modal_window_result').children('h4').remove();
	$('.modal_window_result').children('span').remove();
}
function searchId(){
	let name = $('#modal_id_name');
	let mail = $('#modal_id_mail');
	if($(name).val()==''){
		alert('이름을 입력하세요.');
		$(name).focus();
	}else if($(mail).val()==''){
		alert('E-mail을 입력하세요.');
		$(mail).focus();
	}else{
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: contextPath+"/user_id_search.do",
			data:{
				name: $(name).val(),
				mail: $(mail).val()
			},
			datatype: "text",
			success: function(data){
				if(data>0){
					//ID 존재
					$('.id_check_result').show();
					emailSend($(mail).val());
				}else{
					//ID 없음
					$('.id_check_result').hide();
					$('.modal_window_result.modal_id').text("입력하신 회원 정보가 없습니다.");
				}
			},
			error: function(){
				alert('시스템 오류 발생');
			}
		});
	}
}

function searchPwd(){
	let id = $('#modal_pwd_id');
	let mail = $('#modal_pwd_mail');
	if($(id).val()==''){
		alert('아이디를 입력하세요.');
		$(id).focus();
	}else if($(mail).val()==''){
		alert('E-mail을 입력하세요.');
		$(mail).focus();
	}else{
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: contextPath+"/user_pwd_search.do",
			data:{
				id: $(id).val(),
				mail: $(mail).val()
			},
			datatype: "text",
			success: function(data){
				if(data==-1){
					//email 불일치
					$('.pwd_check_result').hide();
					$('.modal_window_result.modal_pwd').text("이메일이 일치하지 않습니다.");
				}else if(data==0){
					//pwd 없음
					$('.pwd_check_result').hide();
					$('.modal_window_result.modal_pwd').text("ID를 찾을 수 없습니다.");
				}else{
					//pwd 존재
					$('.pwd_check_result').show();
					emailSend($(mail).val());
				}
			},
			error: function(){
				alert('시스템 오류 발생');
			}
		});
	}
}

function emailSend(email){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: contextPath+"/user_Email_Send.do",
		data:{
			email: email,
			check: "id_search"
		},
		datatype: "text",
		success: function(data){
			if(data>0){ //전송 성공 = 1
				alert('입력하신 메일로 인증코드가 발송되었습니다.');
			}else{ 전송실패 = 0
				alert('메일로 코드 발송 중 오류 발생');
			}
		},
		error: function(){
			alert('시스템 오류 발생');
		}
	});
}

function emailCheck(self, i) {
	if($(self).prev().val()==''){
		alert('인증 코드를 적어주세요.');
	}else{
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: contextPath+"/user_Email_Check.do",
			data:{
				email: $('.modal_mail').eq(i).val(),
				check_code: $(self).prev().val()
			},
			datatype: "text",
			success: function(data){
				if(data==1){
					if(i==0){
						idAppear();
					}else{
						pwdAppear();
					}
				}else if(data==-1){
					alert("인증 번호가 다릅니다.");
				}else{
					alert("이메일 발송 여부를 확인하세요.")
				}
			},
			error: function(){
				alert('오류 발생....');
			}
		});
	}
}

function idAppear(){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: contextPath+"/user_Id_List_Get.do",
		data:{
			email: $('#modal_id_mail').val(),
			name: $('#modal_id_name').val()
		},
		datatype: "xml",
		success: function(data){
			let text = "";
			text += "<h4>일치하는 아이디 리스트</h4>";
			
			$(data).find("dto").each(function(){
				text += "<span>"+$(this).find("id").text()+"<br></span>";
			});
			$('.modal_window_result.modal_id').append(text);
			$('.id_check_result').hide();
			$('.modal_window_footer').hide();
		},
		error: function(){
			alert('오류 발생....');
		}
	});
}

function pwdAppear(){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: contextPath+"/user_Pwd_Cont_Get.do",
		data:{
			email: $('#modal_pwd_mail').val(),
			id: $('#modal_pwd_id').val()
		},
		datatype: "text",
		success: function(data){
			if(data==1){
				$('.pwd_check_result').hide();
				$('.modal_window_footer').hide();
				$('.modal_window_result.modal_pwd').append(
				"<span><input type='password' id='new_pwd' placeholder='새로운 비밀번호'><br>"
				+ "<input type='password' id='new_pwd_check' placeholder='비밀번호 확인'><br>"
				+ "<input type='button' value='비밀번호 변경' onclick='newPwdUpdate()'>"
				+ "</span>");
			}else{
				alert('비밀번호를 찾는 중 오류가 발생했습니다.');
			}
		},
		error: function(){
			alert('오류 발생....');
		}
	});
}

function newPwdUpdate(){
	if($('#new_pwd').val()!=$('#new_pwd_check').val()){
		$('.pwd_check_result').hide();
		$('.modal_window_result.modal_pwd').append("<span style='color:red;'>동일한 비밀번호를 입력하세요.</span>");
	}else{
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: contextPath+"/user_PwdRenew.do",
			data:{
				id: $('#modal_pwd_id').val(),
				new_pwd: $('#new_pwd').val()
			},
			datatype: "text",
			success: function(data){
				if(data==1){
					alert('비밀번호가 성공적으로 변경되었습니다.');
					close_modal();
				}else{
					alert('비밀번호 변경 중 오류가 발생했습니다.');
				}
			},
			error: function(){
				alert('오류 발생....');
			}
		});
	}
}