$(function () {
	
	/* 아이디 input에 한글 입력 불가능 ---------------------------------------------------------------- */
	$("#user_id").on("blur keyup", function() {
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '') );
	});
	
	/* 아이디 중복확인 버튼 클릭시 수행  ----------------------------------------------------------------- */
	$("#idcheck_btn").click (function() {
		$("#idcheck").hide(); // span 태그 영역 숨기기
		let userId = $("#user_id").val(); // id 값 가져오기
		
		/* 아이디 입력 길이 체크  */
		if($.trim(userId).length < 4 || $.trim(userId).length > 16) {
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
			error : function(data) {
				alert("데이터 통신 오류");
			}
		});
	});
	
	/* 비밀번호 input에 한글 입력 불가능 ---------------------------------------------------------------- */
	$("#user_pwd").on("blur keyup", function() {
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '') );
	});
	
	$("#user_pwd").change(function() { // change() => 값 변화시 이벤트 적용
	    checkPwd($('#user_pwd').val(), $('#user_id').val());
	});
	
	/* 비밀번호 유효성 검사 */
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

	
	$("#nullcheck").hide();
	$("joinForm").find('input[type="text"]').each(function() {
		if($(this.val()) == "") {
			$("#nullcheck").text("");
			$("#nullcheck").show();
			$("#nullcheck").append('<font color="red">필수 입력 요소입니다.</font>');
		}
	});
	
});























