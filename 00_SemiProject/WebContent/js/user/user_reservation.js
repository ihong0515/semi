
function getReserv(self){
	$("#reserv_content").empty();
	$("#reserv_count").empty();
	$.ajax({
		ContentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "get",
		data: {
			user_no: "${user_dto.getUser_no()}",
			param: $(self).attr('id').slice(7)
		},
		url: "user_getReserv.do",
		dataType: "xml",
		success: function(data) {
			var str = "";
			var count = 0;
			$(data).find("reserv").each(function() {
				
				let price = $(this).find("reserv_realprice").text();
				let resultPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
				str += "<input type='hidden' name='reserv_no' value='"+$(this).find("reserv_no").text()+"'>";
				str += "<img src='/00_SemiProject/image/hotel/" + $(this).find("photo").text() + "/main.jpg' style='width:100px; height:100px;'><br>";
				str += $(this).find("reserv_hotelname").text()+"<br>";
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