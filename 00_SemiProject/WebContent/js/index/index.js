/**
 * 
 */
function serchHotelList(e){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "get",
		url : "hotel_IndexSearch.do",
		data : {
			param : $(e).val(),
			search : $(e).attr('class')
		},
		datatype : "xml",
		context : this,
		success : function(data){
			let table = "";
			
			$(data).find("hotel").each(function(){
					let hotel_no = $(this).find("hotel_no").text();
					table += "<table><tr>";
					table += "<td><a href='hotel_get_Content.do?hotel_no="+hotel_no+"'><img src='/00_SemiProject/image/hotel/" + $(this).find("hotel_photo_folder").text() + "/main.jpg'></a></td>";
					table += "</tr>";
					
					table += "<tr>";
					table += "<td>" + $(this).find("hotel_name").text()+"</td>"; 
					table += "</tr>";
					
					
					
					let star = $(this).find("hotel_star").text();
					console.log(star);
					Number(star);
					typeof(star);
					table += "<tr><td>";
					for(let i = 0; i < star;i++)
					{
					table += "★"; 	
					}
					table += "</td></tr>";
					
					
					let minprice = $(this).find("hotel_price_min").text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					
					table += "<tr>";
					table += "<td>₩"+minprice+"원</td>"; 
					table += "</tr>";
					
					
					table += "<tr>";
					table += "<td>" + $(this).find("hotel_info").text()+"</td>"; 
					table += "</tr></table>";
				});
			
				if($(e).attr('class')=="Starlocation"){
					$("#star_list_Table tr:gt(0)").remove();
					$("#star_list_Table").find("tr:eq(0)").after(table);
				}else{
					$("#low_list_Table tr:gt(0)").remove();
					$("#low_list_Table").find("tr:eq(0)").after(table);
				}
			},
			error : function(){
				alert("에러입니다.");	
			}
	}); // ajax함수 end
} //lowpricelistonclick 함수 end