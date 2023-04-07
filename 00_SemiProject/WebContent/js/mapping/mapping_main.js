/**
 * 
 */

function mapping_searchHotel(e) {
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: "hotel_IndexSearch.do",
		data: {
			param: $(e).attr('alt'),
			search: 'lowPricelocation'
		},
		datatype: "xml",
		success: function(data){
			let table = "";
			
			$(data).find("hotel").each(function(){
				table += "<div>";
				table += "<p><img onclick='location.href=\"/00_SemiProject/hotel_get_Content.do?hotel_no="+$(this).find("hotel_no").text()+"\"' src='/00_SemiProject/image/hotel/" + $(this).find("hotel_photo_folder").text() + "/main.jpg' style='width:200px; height:200px;' id='mapping_img_hotel'></p>";
				
				table += "<p><a href='/00_SemiProject/hotel_get_Content.do?hotel_no="+$(this).find("hotel_no").text()+"'>"+$(this).find("hotel_name").text()+"</a><br>";
				let star = $(this).find("hotel_star").text();
				for(let i = 0; i < star;i++){
					table += "★";
				}
				
				let minprice = $(this).find("hotel_price_min").text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
				table += "<br>₩"+minprice+"원"; 
				table += "</p>";
				
				table += "<p>" + $(this).find("hotel_info").text()+"</p>"; 
				table += "</div>";
			});
			$('#mapping_hotel_list').html('');
			$('#mapping_hotel_list').append(table);
			
			location.href='#hotel_list_anchor';
		},
		error: function(){
			alert('오류 발생');
		}
	});
}

function changeimg(img) {
	let imgPath = img;
	$('#mapping_img').attr('src', imgPath);
}

function fullpageUse(){
	$('#fullpage').fullpage({
		autoScrolling: true,
		sectionsColor: ['#b3e0ff', '#b3e0ff'],
		loopBottom: true,
		verticalCentered: true,
		anchors:['map_anchor'],
		nagivation: true,
		navigationPosition: 'left',
		navigationTooltips: ['Page 1', 'Page 2'],
		showActiveTooltip: true,
		menu: '#menu',
		slidesNavigation: true,
		scrollBar: true
		
	});
}