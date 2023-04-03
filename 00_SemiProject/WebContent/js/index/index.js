/**
 * 
 */

	
$(function(){
	var location = "";
	
	$("#checkIn").val(new Date().toISOString().slice(0, 10));
	$("#checkOut").val(new Date(new Date().setDate(new Date().getDate() + 1)).toISOString().slice(0, 10));
	
	
	$.ajaxSetup({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "get"
	});

	
	//아이디로 하니까 안됬었음.
	
  $('.Starlocation').on('click', function() {
    
		location = $(this).val();
		
	
		$.ajax({
			
			url : "hotel_StarSearch.do",
			data : "Location=" + location,
			datatype : "xml",
	
		success : function(data){
			$("#Star_list_Table tr:gt(0)").remove();
			
			let table = "";
			
			$(data).find("hotel").each(function(){
					
					table += "<table><tr>"
					table += "<td><img src='/00_SemiProject/image/hotel/" + $(this).find("hotel_photo_folder").text() + "/main.jpg'></td>";
					table += "</tr>"
					
					table += "<tr>"
					table += "<td>" + $(this).find("hotel_name").text()+"</td>"; 
					table += "</tr>"
					
					
					
					let star = $(this).find("hotel_star").text()
					console.log(star);
					Number(star);
					typeof(star);
					table += "<tr><td>"
					for(let i = 0; i < star;i++)
					{
					table += "★"; 	
					}
					table += "</td></tr>"
					
					
					
					let minprice = $(this).find("hotel_price_min").text()
					minprice.toLocaleString('ko-KR');
					table += "<tr>"
					table += "<td>" +minprice+"원</td>"; 
					table += "</tr>"
					
					table += "<tr>"
					table += "<td>" + $(this).find("hotel_info").text()+"</td>"; 
					table += "</tr></table>";
				});
			
				$("#Star_list_Table tr:eq(0)").after(table);
			
			},
			error : function(){
				alert("에러입니다.");	
			}
	
	
	
	
		}); // ajax함수 end
		
	}); // onclick 함수 end



///lowpircelist onclick
  $('.lowPricelocation').on('click', function() {
    
		location = $(this).val();
		
	
		$.ajax({
			
			url : "hotel_lowPriceSearch.do",
			data : "Location=" + location,
			datatype : "xml",
	
		success : function(data){
			$("#lowPrice_list_Table tr:gt(0)").remove();
			
			let table = "";
			
			$(data).find("hotel").each(function(){
					
					table += "<table><tr>"
					table += "<td><img src='/00_SemiProject/image/hotel/" + $(this).find("hotel_photo_folder").text() + "/main.jpg'></td>";
					table += "</tr>"
					
					table += "<tr>"
					table += "<td>" + $(this).find("hotel_name").text()+"</td>"; 
					table += "</tr>"
					
					
					let star = $(this).find("hotel_star").text()
					console.log(star);
					Number(star);
					typeof(star);
					table += "<tr><td>"
					for(let i = 0; i < star;i++)
					{
					table += "★"; 	
					}
					table += "</td></tr>"
					
					
					let minprice = $(this).find("hotel_price_min").text()
					minprice.toLocaleString('ko-KR');
					table += "<tr>"
					table += "<td>" +minprice+"원</td>"; 
					table += "</tr>"
					
					table += "<tr>"
					table += "<td>" + $(this).find("hotel_info").text()+"</td>"; 
					table += "</tr></table>";
				});
			
				$("#lowPrice_list_Table tr:eq(0)").after(table);
			
			},
			error : function(){
				alert("에러입니다.");	
			}
	
	
	
	
		}); // ajax함수 end
		
	}); //lowpricelistonclick 함수 end


//새로 고침시 기본 location 서울로 맞춰서 요청 보내기.
$('#Starlocation').trigger("click");
$('#lowPricelocation').trigger("click");

});//function onload end