/**
 * 
 */

async function serchHotelList(e){

	await $.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
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
					table += "<div class='content'>";
					table += "<div class = 'hotel_image'>";
					table += "<a href='hotel_get_Content.do?hotel_no="+hotel_no+"'><img class='index_hotel_img' src='/00_SemiProject/image/hotel/" + 								$(this).find("hotel_photo_folder").text() + "/main.jpg'></a>";
					table += "</div>";
					
					table += "<div class = 'hotel_like'>";
					table += $(this).find("hotel_name").text();
					
					let star = $(this).find("hotel_star").text();
					Number(star);
					table += "<span class='hotel_star'>";
					for(let i = 0; i < star;i++){
						table += "★";
					}
					table += "</span>";
					
					
					table += "</div>";
					
					table += "<div class = 'hotel_hashtag'>";
					table += "# "+$(this).find("hotel_hashtag1").text();
					table += " # "+$(this).find("hotel_hashtag2").text();
					table += " # "+$(this).find("hotel_hashtag3").text();
					table += "</div>";
					
					let minprice = $(this).find("hotel_price_min").text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					
					table += "<div class='hotel_minprice'>";
					table += "₩"+minprice+"원"; 
					
					if($(this).find("hotel_jjim_check").text()==1){
						table += " <span class='hotel_like_check' onclick='likeDelete(this, "+hotel_no+")'><i class='fa fa-heart' aria-hidden='true'></i></span>";
					}else{
						table += " <span class='hotel_like_check' onclick='likeInsert(this, "+hotel_no+")'><i class='fa fa-heart-o' aria-hidden='true'></i></span>";
					}
					
					table += "</div>";
					
					table += "</div>";
					});
			
				if($(e).attr('class')=="Starlocation"){
					$(".star_list_Table").empty();
					$(".star_list_Table").append(table);
				}else{
					$(".low_list_Table").empty();
					$(".low_list_Table").append(table);
				}
				
				
			},
			error : function(){
				alert("에러입니다.");	
			}
	}); // ajax함수 end
} //lowpricelistonclick 함수 end

function starClick(self) {
	$(".Starlocation").attr('id', '');
	$(self).attr('id', 'starlocation-active');
}

function lowClick(self) {
	$(".lowPricelocation").attr('id', '');
	$(self).attr('id', 'lowPricelocation-active');
}
