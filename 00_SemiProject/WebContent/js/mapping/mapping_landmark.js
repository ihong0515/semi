function mapping_searchLandmark(e) {
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "post",
		url: "mapping_landmarkSearch.do",
		data: {
			param: $(e).attr('alt'),
		},
		datatype: "xml",
		success: function(data){
			let table = "";
			let location = $(data).find("landmark_location").text();
			
			table += "<div id='title_div'><h2>";
			if(location.match("gangwon")) table += "강원도의 즐길거리";
			if(location.match("gyeonggi")) table += "경기도의 즐길거리";
			if(location.match("gyeongnam")) table += "경상남도의 즐길거리";
			if(location.match("gyeongbuk")) table += "경상북도의 즐길거리";
			if(location.match("seoul")) table += "서울의 즐길거리";
			if(location.match("jeonnam")) table += "전라남도의 즐길거리";
			if(location.match("jeonbuk")) table += "전라북도의 즐길거리";
			if(location.match("jeju")) table += "제주도의 즐길거리";
			if(location.match("chungnam")) table += "충청남도의 즐길거리";
			if(location.match("chungbuk")) table += "충청북도의 즐길거리";
			
			table += "</h2></div>";
			
			$(data).find("landmark").each(function(){
				table += "<div id='entire_div'>";
				table += "<div id='img_div'><img id='landmark_img' src='/00_SemiProject/image/landmark/"+ $(this).find("landmark_image").text() + ".jpg'></div>";
				table += "<div id='etc_div'>";
				table += "<div id='landmark_name'>" + $(this).find("landmark_name").text() + "</div>";
				table += "<div id='landmark_addr'>" + $(this).find("landmark_addr").text() + "</div>";
				table += "<div id='landmark_info'>" + $(this).find("landmark_info").text() + "</div></div></div>";
			});
			$('body').stop().animate({
				scrollTop:'950'
			}, 300);
			$('#mapping_landmark_list').html('')
			$('#mapping_landmark_list').append(table);
		},
		error: function(){
			alert('명소 가져오는 중 시스템 오류');
		}
	});
}

function changeimg(img) {
	let imgPath = img;
	$('#mapping_img').attr('src', imgPath);
}