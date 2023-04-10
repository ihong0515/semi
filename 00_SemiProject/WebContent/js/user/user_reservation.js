
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
			var str = "";
			var count = 0;
			$(data).find("reserv").each(function() {
				let price = $(this).find("reserv_realprice").text();
				let resultPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
				if(use_check=='N'){
					str += "<img onclick=\'location.href=\""+contextPath+"/user_reserv_content.do?reserv_no="+$(this).find("reserv_no").text()+"\"\' src='"+contextPath+"/image/hotel/"+$(this).find("photo").text()+"/main.jpg' style='width:100px; height:100px;'><br>";
					str += "<a href='"+contextPath+"/user_reserv_content.do?reserv_no="+$(this).find("reserv_no").text()+"'>"+$(this).find("reserv_hotelname").text()+"</a><br>";
				}else{
					str += "<img id='use_check_img' src='"+contextPath+"/image/hotel/"+$(this).find("photo").text()+"/main.jpg' style='width:100px; height:100px;'><br>";
					str += "<a id='use_check_a'>"+$(this).find("reserv_hotelname").text()+"</a><br>";
				}
				str += $(this).find("reserv_roomname").text()+"<br>";
				str += "체크인: " + $(this).find("reserv_start").text()+"<br>";
				str += "체크아웃: " + $(this).find("reserv_end").text()+"<br>";
				str += "₩ " + resultPrice;
				count++;
			});
			$("#reserv_content").append(str);
			$("#reserv_count").append(count);
		},
		error: function() {
			$("#reserv_content").text("오류 발생");
		}
	});
}