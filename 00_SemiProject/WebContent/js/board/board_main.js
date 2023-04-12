/**
 * 
 */

	function site_board_getList(d) {
		$('#faq_main').hide();
		$('#board_main').show();
		
		let page = $('#page_li_now_site').text();
		if(d!=null){
			page=parseInt(page)+parseInt(d);
		}else{
			page = 1;
		}
		
		$('#board_write_btn').show();
		
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: "board_Site_Get_List.do",
			data:{page: page},
			datatype: "xml",
			success: function(data){
				let table = "";
				
				if($(data).find("board").text()==""){
					table = "<tr><td colspan='4' align='center'><h3>등록된 게시물이 없습니다.</h3></td></tr>";
					$('#board_list tr:gt(0)').remove();
					$('#board_list tr:eq(0)').after(table);
				}else{
					$(data).find("board").each(function() {
						table += "<tr>";
						table += "<td>";
						table += $(this).find("board_no").text();
						table += "</td>";
						table += "<td><a href='"+contextPath+"/board_Get_Site_Content.do?board_no="+$(this).find("board_no").text()+"'>";
						if($(this).find("board_userno").text()==user_no||user_no=='1'){
							table += $(this).find("board_title").text();
						}else{
							table += "<비밀 글입니다.>";
						}
						table += "</a></td>";
						table += "<td>";
						table += $(this).find("board_writer").text();
						table += "</td>";
						if($(this).find("board_update").text()=='null'){
							table += "<td>";
							table += $(this).find("board_date").text();
							table += "</td>";
						}else{
							table += "<td>";
							table += $(this).find("board_update").text();
							table += "</td>";
						}
						table += "</tr>";
					});
					if($('#board_list tr th:eq(2)').text()=='Hotel.'){
						$('#board_list tr th:eq(2)').remove();
					}
					$('#board_list tr:gt(0)').remove();
					$('#board_list tr:eq(0)').after(table);
					
					if($(data).find("page").text()!=''){
						page = $(data).find("page").text();
					}
					
					$('#board_navi_hotel').css('display', 'none');
					$('#board_navi_site').css('display', 'flex');
					
					
					$('#page_li_now_site').text(page);
					$('#page_li_lastPage').val($(data).find("allPage").text());
				}
			},
			error: function(){
				alert('게시물 불러오기 실패....');
			}
		});
	}
	function hotel_board_getList(d) {
		$('#faq_main').hide();
		$('#board_main').show();
		
		if(user_no == ''){
			alert('로그인이 필요합니다.');
		}else{
			let page = $('#page_li_now_hotel').text();
			if(d!=null){
				page=parseInt(page)+parseInt(d);
			}else{
				page = 1;
			}
			$('#board_write_btn').hide();
			
			$.ajax({
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				type: "post",
				url: "board_Hotel_Get_List.do",
				data: {
					userNo : user_no,
					page: page
				},
				datatype: "xml",
				success: function(data){
					let table = "";
					
					if($(data).find("board").text()==""){
						table = "<tr><td colspan='4' align='center'><h3>등록된 게시물이 없습니다.</h3></td></tr>";
						$('#board_list tr:gt(0)').remove();
						$('#board_list tr:eq(0)').after(table);
					}else{
						$(data).find("board").each(function() {
							table += "<tr>";
							table += "<td>";
							table += $(this).find("board_view_no").text();
							table += "</td>";
							table += "<td><a class='board_title_a' href='"+contextPath+"/board_Get_Hotel_Content.do?board_no="+$(this).find("board_no").text()+"'>";
							
							if($(this).find("board_step").text()>1){
								table += "└>Re:　";
							}
							
							table += $(this).find("board_title").text();
							table += "</a></td>";
							table += "<td>";
							table += $(this).find("board_hotelname").text();
							table += "</td>";
							table += "<td>";
							table += $(this).find("board_writer").text();
							table += "</td>";
							if($(this).find("board_update").text()=='null'){
								table += "<td>";
								table += $(this).find("board_date").text();
								table += "</td>";
							}else{
								table += "<td>";
								table += $(this).find("board_update").text();
								table += "</td>";
							}
							table += "</tr>";
						});
						if($('#board_list tr th:eq(2)').text()!='Hotel.'){
							$('#board_list tr th:eq(1)').after("<th style='width: 100px;'>Hotel.</th>");
						}
						
						$('#board_navi_site').css('display', 'none');
						$('#board_navi_hotel').css('display', 'flex');
						
						$('#board_list tr:gt(0)').remove();
						$('#board_list tr:eq(0)').after(table);
						
						if($(data).find("page").text()!=''){
							page = $(data).find("page").text();
						}
						
						$('#page_li_now_hotel').text(page);
						$('#page_li_lastPage').val($(data).find("allPage").text());
					}
				},
				error: function(){
					alert('게시물 불러오기 실패....');
				}
			});
		}
	}
	
	function write_modeal_open(){
		$(document).scrollTop(250);
		$('#board_write_modal_overlay').show();
	}
	
	function write_modeal_close(){
		$('#board_write_modal_overlay').hide();
	}
	
	function write_check(){
		if(f.board_title.value == "") {
			alert("글 제목을 입력하세요!!!");
			f.board_title.focus();
			return false;
		}else if(f.board_content.value == "") {
			alert("글 내용을 입력하세요!!!");
			f.board_content.focus();
			return false;
		}
	}
	
	function faq_board_getList(){
		$('.faq_cont').hide();
		$('.faq_board_cont button').attr('class', 'faq_btn');
		$('#faq_main').css('display', 'flex');
		$('#board_main').hide();	
	}
	
	function faq_calling(self){
		$('.faq_cont').slideUp();
		$('.faq_board_cont button').attr('class', 'faq_btn');
		if ($(self).next().css('display')=='none'){
			$(self).next().slideDown();
			$(self).attr('class', 'faq_btn_active');
		} else{
			$(self).next().slideUp();
			$(self).attr('class', 'faq_btn');
		}
	}