/* 기본  ----------------------------------------------------------------------------- */
$(function () {
		
	/* 아이디 input에 한글 입력 불가능 */
	$("#user_id").on("blur keyup", function() {
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '') );
	});
	
	/* 아이디 중복확인 수행  */
	$("#user_id").blur (function() {
		$("#idcheck").hide(); // span 태그 영역 숨기기
		let userId = $("#user_id").val(); // id 값 가져오기
		
		/* 아이디 입력 길이 체크  */
		if($.trim(userId).length < 8 || $.trim(userId).length > 20) {
			$("#idcheck").text(""); // span 태그 영역 초기화
			$("#idcheck").show();
			$("#idcheck").append('<font color="red">8 ~ 20 자리 이내의 아이디를 입력해주세요.</font>');
			$("#user_id").val('').focus();
			return false;
		}
		
		/* 아이디 중복 여부 확인  */
		$.ajax({
			type : "post",
			url : "../user/user_idCheck.jsp",
			data : {paramId : userId},
			datatype : "jsp",
			success : function(data) {
				if(data == -1) { // 중복 아이디 존재
					$("#idcheck").text("");
					$("#idcheck").show();
					$("#idcheck").append('<font color="red">이미 사용중인 아이디입니다.</font>');
					$("#user_id").val('').focus();
				} else {
					$("#idcheck").text("");
					$("#idcheck").show();
					$("#idcheck").append('<font color="blue">사용가능한 아이디입니다.</font>');
				}
			},
			error : function() {
				alert("데이터 통신 오류");
			}
		});
	});
	
	/* 비밀번호 input에 한글 입력 불가능  */
	$("#user_pwd").on("blur keyup", function() {
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '') );
	});
	
	/* 비밀번호 유효성 검사 */
	$("#user_pwd").change(function() {
	    checkPwd($('#user_pwd').val(), $('#user_id').val());
	});
	
	function checkPwd(pwd, id) {
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pwd)) {            
			$("#pwdcheck").text("");
			$("#pwdcheck").show();
			$("#pwdcheck").append('<font color="red">숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</font>');
			$('#user_pwd').val('').focus();
	    } else if(/(\w)\1\1\1/.test(pwd)) {
			$("#pwdcheck").text("");
			$("#pwdcheck").show();
			$("#pwdcheck").append('<font color="red">같은 문자를 4번 이상 사용하실 수 없습니다.</font>');
			$('#user_pwd').val('').focus();
	    } else if(pwd.search(id) > -1) {
			$("#pwdcheck").text("");
			$("#pwdcheck").show();
			$("#pwdcheck").append('<font color="red">비밀번호에 아이디가 포함되었습니다.</font>');
			$('#user_pwd').val('').focus();
		} else {
			$("#pwdcheck").text("");
			$("#pwdcheck").show();
			$("#pwdcheck").append('<font color="blue">사용가능한 비밀번호입니다.</font>');
	    }
	}
	
	/* 비밀번호 == 비밀번호 확인 일치 여부 */
	$("#user_repwd").change(function() {
		
		var pwd = $('#user_pwd').val();
		var repwd = $('#user_repwd').val();
		
		if(pwd != "" || repwd != "") {
			if(pwd == repwd) { // 일치
				$("#repwdcheck").text("");
				$("#repwdcheck").show();
				$("#repwdcheck").append('<font color="blue">비밀번호가 일치합니다.</font>');
			} else { // 불일치
				$("#repwdcheck").text("");
				$("#repwdcheck").show();
				$("#repwdcheck").append('<font color="red">비밀번호가 일치하지 않습니다.</font>');
				$('#user_repwd').val('').focus();
			}
		}
	});
	
	/* 약관동의 전체 선택 */
	$(document).ready(function() {
		$("#cbx_chkAll").click(function() {
			if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) $("#cbx_chkAll").prop("checked", false);
			else $("#cbx_chkAll").prop("checked", true); 
		});
	});
	
	/* 약관동의 더보기, 접기 */
	$(document).on("click","#main",function() {
		if($(this).next().css("display")=="none") {
			$(this).next().show();
			$(this).html('<i class="fa-solid fa-chevron-up"></i>');
		} else{
	        $(this).next().hide();
	        $(this).html('<i class="fa-solid fa-chevron-down"></i>');
	      }
	});
	

});

/* 회원가입 버튼 클릭 결과 ----------------------------------------------------------------------------- */
function joinFormCheck() {
	if($('#user_id').val() == "") {
		$("#idcheck").text("");
		$("#idcheck").show();
		$("#idcheck").append('<font color="red">아이디를 입력해주세요.</font>');
		$('#user_id').val('').focus();
	} 
	if($('#user_pwd').val() == "") {
		$("#pwdcheck").text("");
		$("#pwdcheck").show();
		$("#pwdcheck").append('<font color="red">비밀번호를 입력해주세요.</font>');
		$('#user_pwd').val('').focus();
	} 
	if($('#user_repwd').val() == "") {
		$("#repwdcheck").text("");
		$("#repwdcheck").show();
		$("#repwdcheck").append('<font color="red">비밀번호 확인을 입력해주세요.</font>');
		$('#user_repwd').val('').focus();
	} 
	if($('#user_name').val() == "") {
		$("#namecheck").text("");
		$("#namecheck").show();
		$("#namecheck").append('<font color="red">이름을 입력해주세요.</font>');
		$('#user_name').val('').focus();
	} 
	if($('#user_phone_mid').val() == "") {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 입력해주세요.</font>');
		$('#user_phone_mid').val('').focus();
	} 
	if($('#user_phone_end').val() == "") {
		$("#phonecheck").text("");
		$("#phonecheck").show();
		$("#phonecheck").append('<font color="red">전화번호를 입력해주세요.</font>');
		$('#user_phone_end').val('').focus();
	} 
	if($('#user_birth').val() == "") {
		$("#birthcheck").text("");
		$("#birthcheck").show();
		$("#birthcheck").append('<font color="red">생년월일을 입력해주세요.</font>');
		$('#user_birth').val('').focus();
	} 
	if($('#user_region').val() == "") {
		$("#regioncheck").text("");
		$("#regioncheck").show();
		$("#regioncheck").append('<font color="red">선호 지역을 입력해주세요.</font>');
		$('#user_region').val('').focus();
	} 
	if($('#user_email').val() == "") {
		$("#emailcheck").text("");
		$("#emailcheck").show();
		$("#emailcheck").append('<font color="red">이메일 주소를 입력해주세요.</font>');
		$('#user_email').val('').focus();
	} 
	
	if($('#essential').is(':checked')) {
		alert("필수 항목에 모두 동의해주세요.");
	}
}

/* 이메일 자동완성 기능 */
function autoEmail(a,b){
    var mailId = b.split('@');
    var mailList = ['naver.com','gmail.com','daum.net','hanmail.net'];
    var mailArr = new Array;
    for(var i=0; i < mailList.length; i++ ){
    	mailArr.push( mailId[0] +'@'+ mailList[i] );
    }
    $("#"+a).autocomplete({
        source: mailArr,
        focus: function(event, ui) {
            return false;
        }
    });
}