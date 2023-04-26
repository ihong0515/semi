/**
 * 
 */

function open_room_list(self){
	let no = $(self).val();
	$('#room_list option:gt(0)').remove();
	$('#content_title').hide();
	$('.result_tb').hide();
	$('.result_tb').eq(0).show();
	if(no!=''){
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: contextPath+"/owner_room_list.do",
			data: {
				hotel_no: no
			},
			datatype: "xml",
			success: function(data){
				let str = "";
				$(data).find("room").each(function(){
					let name = $(this).find("room_name").text();
					let no = $(this).find("room_no").text();
					
					str += "<option value='"+no+"'>"+name+"</option>";
				});
				
				let num = $(data).find("ho_no").text();
				let path ="location.href='"+contextPath+"/owner_hotel_update.do?no="+num+"'";
				$('.hotel_btn').attr('onclick', path);
				let path2 = "location.href='"+contextPath+"/owner_hotel_policy.do?no="+num+"'";
				$('#hp_btn').attr('onclick', path2);
				$('.info_insert').eq(0).text($(data).find("ho_name").text());
				$('.info_insert').eq(1).text($(data).find("ho_addr").text());
				$('.info_insert').eq(2).text($(data).find("ho_phone").text());
				$('.info_insert').eq(3).text($(data).find("ho_location").text());
				$('.info_insert').eq(4).text($(data).find("ho_email").text());
				$('.info_insert').eq(5).text($(data).find("ho_room_count").text());
				$('.info_insert').eq(6).text($(data).find("ho_est").text());
				$('.info_insert').eq(7).text($(data).find("ho_pri_min").text());
				$('.info_insert').eq(8).text($(data).find("ho_pri_max").text());
				$('.info_insert').eq(9).text($(data).find("ho_peo_min").text());
				$('.info_insert').eq(10).text($(data).find("ho_peo_max").text());
				$('.info_insert').eq(11).text($(data).find("ho_star").text());
				$('.info_insert').eq(12).text($(data).find("ho_hash").text());
				
				let inf = $(data).find("ho_info").text().replace(/(?:\r\n|\r|\n)/g, '<br>');
				$('.info_insert').eq(13).html(inf);
				
				$('#room_btn').show();
				$('#room_btn').attr('onclick', '');
				$('#room_btn').attr('onclick', "location.href='"+contextPath+"/owner_room_insert.do?ho_no="+$(data).find("ho_no").text()+"'");
				$('#room_list option:eq(0)').after(str);
				close_menu('#room_x');
				close_menu('#hotel_x');
			},
			error: function(){
				alert('시스템 오류 발생');
			}
		});
	}
}

function open_room_content(self){
	let no = $(self).val();
	
	close_menu('#room_x');
	close_menu('#hotel_x');
	$('#content_title').hide();
	$('.result_tb').hide();
	$('.result_tb').eq(1).show();
	
	if(no!=''){
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post",
			url: contextPath+"/owner_room_content.do",
			data: {
				room_no: no
			},
			datatype: "xml",
			success: function(data){
				
				let path = "location.href='"+contextPath+"/owner_room_update.do?no="+$(data).find("no").text()+"'";
				$('.room_btn').attr('onclick', path);
				$('.info_insert_room').eq(0).text($(data).find("name").text());
				$('.info_insert_room').eq(1).text($(data).find("price").text());
				$('.info_insert_room').eq(2).text($(data).find("bed").text());
				$('.info_insert_room').eq(3).text($(data).find("size").text());
				$('.info_insert_room').eq(4).text($(data).find("peo_min").text());
				$('.info_insert_room').eq(5).text($(data).find("peo_max").text());
				$('.info_insert_room').eq(6).text($(data).find("in").text());
				$('.info_insert_room').eq(7).text($(data).find("out").text());
				$('.info_insert_room').eq(8).text($(data).find("bf").text());
				
				close_menu('#room_x');
				close_menu('#hotel_x');
			},
			error: function(){
				alert('시스템 오류 발생');
			}
		});
	}
}

function open_menu(self){
	$(self).next().animate({
		width: 'show'
	}, 200);
	$('#select_hotel option:eq(0)').prop('selected','selected');
	$('#room_list option:eq(0)').prop('selected','selected');
}
function close_menu(self){
	$(self).parent().animate({
		width: 'hide'
	}, 200);

}