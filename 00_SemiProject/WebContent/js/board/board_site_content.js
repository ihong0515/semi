/**
 * 
 */
$(document).ready(function(){
	reply_getList();
});

function modify_content_toggle(){
	$('.board_list').toggle();
	$('.board_btn').toggle();
}

function modify_check(){
	if(form.site_title.value == ''){
		alert('제목을 입력하세요.');
		form.site_title.focus();
		return false;
	}else if(form.site_content.value == "") {
		alert("글 내용을 입력하세요!!!");
		form.board_content.focus();
		return false;
	}else{
		return confirm('문의내용을 수정합니다.');
	}
}

function reply_getList(){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: "reply_Site_Get_List.do",
		data:{
			board_no: board_no
		},
		datatype: "xml",
		success: function(data){
			let table = "";
			$(data).find("reply").each(function(){
				table += "<p><b>";
				table += $(this).find("reply_user_name").text();
				table += "</b> / <b>";
				table += $(this).find("reply_date").text();
				table += "</b>";
				table += " <input type='button' value='삭제' onclick=\"if(confirm(\'댓글을 삭제합니다.\')){delete_reply("+$(this).find("reply_no").text()+")}\">";
				table += "</p>";
				table += "<p id = reply_view_content>";
				table += "&nbsp;&nbsp;&nbsp;"
				table += $(this).find("reply_content").text();
				table += "</p>";
			});
			if(table==""){
				$('#reply_view').html("<h3>댓글이 없습니다.</h3>")
			}else{
				$('#reply_view').html(table);
			}
			
		},
		error: function(){
			alert('댓글 불러오기 실패....');
		}
	});
}

function insert_reply(){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: "reply_Site_Insert_Content.do",
		data:{
			board_no: board_no,
			user_no: user_no,
			board_cont: $('#reply_write_body textarea').val()
		},
		datatype: "xml",
		success: function(data){
			if(data>0){
				reply_getList();
				$('#reply_write_body').find('textarea').val("");
			}else{
				alert('댓글 등록 실패');
			}
		},
		error: function(){
			alert('댓글 등록 중 시스템 오류');
		}
	});
}

function delete_reply(no){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: "reply_Site_Delete_Content.do",
		data:{
			board_no: no
		},
		datatype: "xml",
		success: function(data){
			if(data>0){
				reply_getList();
			}else{
				alert('댓글 삭제 실패');
			}
		},
		error: function(){
			alert('댓글 삭제 중 시스템 오류');
		}
	});
}