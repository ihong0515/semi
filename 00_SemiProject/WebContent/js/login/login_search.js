/**
 * 
 */
function searchId(){
	let name = $('#name_inp');
	let mail = $('#email_inp');
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
			data: {
				name: $(name).val(),
				mail: $(mail).val()
			},
			datatype: "text",
			success: function(data){
				if(data>0){
					//ID 존재
					$('#result_btn').show();
					emailSend($(mail).val());
				}else{
					//ID 없음
					$('#result_btn').hide();
					$('.modal_window_result').append("<span style='color:red;'>입력하신 회원 정보가 없습니다.</span>");
				}
			},
			error: function(){
				alert('시스템 오류 발생');
			}
		});
	}
}

function searchPwd(){
	let id = $('#id_inp');
	let mail = $('#email_inp');
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
					$('#result_btn').hide();
					$('.modal_window_result').append("<span style='color:red;'>이메일이 일치하지 않습니다.</span>");
				}else if(data==0){
					//pwd 없음
					$('#result_btn').hide();
					$('.modal_window_result').append("<span style='color:red;'>아이디를 찾을 수 없습니다.</span>");
				}else{
					//pwd 존재
					$('#result_btn').show();
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
				email: $('#email_inp').val(),
				check_code: $(self).prev().val()
			},
			datatype: "text",
			success: function(data){
				if(data==1){
					if(i==0){
						idAppear();
					}else{
						$('#result_btn').hide();
						$('.modal_window_footer').hide();
						$('.modal_window_result').append(
						"<span><input type='password' id='new_pwd' placeholder='새로운 비밀번호'><br>"
						+ "<input onchange='pwdInput()' type='password' id='new_pwd_check' placeholder='비밀번호 확인'><br>"
						+ "<span id='repwdcheck'></span><br><input type='button' value='비밀번호 변경' onclick='newPwdUpdate()'>"
						+ "</span>");
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
			email: $('#email_inp').val(),
			name: $('#name_inp').val()
		},
		datatype: "xml",
		success: function(data){
			let text = "";
			text += "<h4>가입된 아이디는 다음과 같습니다.</h4>";
			
			$(data).find("dto").each(function(){
				text += "<span>"+$(this).find("id").text()+"<br></span>";
			});
			$('.modal_window_result').append(text);
			$('#result_btn').hide();
			$('.modal_window_footer').hide();
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
				id: $('#id_inp').val(),
				new_pwd: $('#new_pwd').val(),
				email: $('#email_inp').val()
			},
			datatype: "text",
			success: function(data){
				if(data==1){
					alert('비밀번호가 성공적으로 변경되었습니다.');
					window.close();
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

function pwdInput(){
	let pwd = $('#new_pwd').val();
	let repwd = $('#new_pwd_check').val();
	/* 비밀번호 유효성 검사 */
	if(checkPwd($('#new_pwd').val())){
		if(pwd != "" || repwd != "") {
			if(pwd==repwd) { // 일치
				$("#repwdcheck").html("");
				$("#repwdcheck").show();
				$("#repwdcheck").append('<font color="blue">비밀번호가 일치합니다.</font>');
			} else { // 불일치
				$("#repwdcheck").html("");
				$("#repwdcheck").show();
				$("#repwdcheck").append('<font color="red">비밀번호가 일치하지 않습니다.</font>');
				$('#new_pwd').val('').focus();
			}
	}
	}
}

function checkPwd(pwd) {
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pwd)) {            
		$("#repwdcheck").html("");
		$("#repwdcheck").show();
		$("#repwdcheck").append('<font color="red">숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</font>');
		$('#new_pwd').val('').focus();
		return false;
    } else if(/(\w)\1\1\1/.test(pwd)) {
		$("#repwdcheck").html("");
		$("#repwdcheck").show();
		$("#repwdcheck").append('<font color="red">같은 문자를 4번 이상 사용하실 수 없습니다.</font>');
		$('#new_pwd').val('').focus();
		return false;
	} else {
		$("#repwdcheck").html("");
		$("#repwdcheck").show();
		$("#repwdcheck").append('<font color="blue">사용가능한 비밀번호입니다.</font>');
    	return true;
}
}