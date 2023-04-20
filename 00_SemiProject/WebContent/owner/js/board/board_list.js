/**
 * 
 */

function get_hotel_cont(self){
	if($(self).val()!=''){
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: contextPath+"/owner_board_get_list.do",
			data: {
				hotel_no: $(self).val()
			},
			datatype: "xml",
			success: function(data){
				let tab = "";
				let i = 1;
				if($(data).find("board").text()!=""){
					$(data).find("board").each(function(){
						tab += "<tr>";
							tab += "<td>";
							tab += i;
							tab += "</td>";
							tab += "<td>";
							tab += "<a href='javascript:move_board("+$(this).find("board_no").text()+")'>"
							
							if($(this).find("board_step").text()>1){
								tab += "　　";
							}
							
							tab += $(this).find("board_title").text();
							tab += "</a>";
							tab += "</td>";
							tab += "<td>";
							tab += $(this).find("board_writer").text();
							tab += "</td>";
							tab += "<td>";
							if($(this).find("board_update").text()=='null'){
								tab += $(this).find("board_date").text();
							}else{
								tab += $(this).find("board_update").text();
							}
							tab += "</td>";
						tab += "</tr>";
						i++;
					});
					$('#result tr:gt(0)').remove();
					$('#result tr:eq(0)').after(tab);
				}else{
					tab = "<tr><td colspan='4' align='center'><h3>등록된 게시물이 없습니다.</h3></td></tr>";
					$('#result tr:gt(0)').remove();
					$('#result tr:eq(0)').after(tab);
				}
				
			},
			error: function(){
				alert('시스템 오류 발생');
			}
		});
	}
}

function move_board(no,step){
	location.href=contextPath+"/owner_board_content.do?no="+no;
}