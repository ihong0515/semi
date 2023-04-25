
function getReserv(self){
	$("#reserv_content").empty();
	$("#reserv_count").empty();
	
	let use_check = $(self).attr('id').slice(7);
	$.ajax({
		ContentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "get",
		data: {
			user_no: user_no,
			param: use_check
		},
		url: "user_getReserv.do",
		dataType: "xml",
		success: function(data) {
			let str = "";
			let count = 0;
			$(data).find("reserv").each(function() {
				let price = $(this).find("reserv_realprice").text();
				let resultPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
				str += "<div id='content_div'><div id='img_div'><img onclick=\'location.href=\""+contextPath+"/user_reserv_content.do?reserv_no="+$(this).find("reserv_no").text()+"\"\' src='"+contextPath+"/image/hotel/"+$(this).find("photo").text()+"/main.jpg' style='width:130px; height:130px;'></div>";
				str += "<div id='text_div'><ul><li style='font-size: 20px'><strong><a href='"+contextPath+"/user_reserv_content.do?reserv_no="+$(this).find("reserv_no").text()+"'>"+$(this).find("reserv_hotelname").text()+"</a></strong></li>";
				str += "<li style='font-size: 16px'>" + $(this).find("reserv_roomname").text()+"</li>";
				str += "<li style='font-size: 16px'>체크인: " + $(this).find("reserv_start").text()+"</li>";
				str += "<li style='font-size: 16px'>체크아웃: " + $(this).find("reserv_end").text()+"</li></ul></div>";
				str += "<div id='btn_div'><strong>" + resultPrice + " 원</strong>";
				str += "<button onclick=\'location.href=\""+contextPath+"/user_reserv_content.do?reserv_no="+$(this).find("reserv_no").text()+"\"\'>예약 세부 정보</button></div></div><br><br>";
				count++;
			});
			$("#reserv_content").html(str);
			if(count==0){
				$("#reserv_count").append("<h4>예약내역이 없습니다.</h4>");
			}else{
				$("#reserv_count").append("<b>예약내역</b> : "+count+" <b>개</b>");
			}
		},
		error: function() {
			$("#reserv_content").text("오류 발생");
		}
	});
}