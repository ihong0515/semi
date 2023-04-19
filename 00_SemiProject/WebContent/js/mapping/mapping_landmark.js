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
			
			$(data).find("landmark").each(function(){
				table += "<div id='entire_div'>";
				table += "<div id='img_div'><img id='landmark_img' src='/00_SemiProject/image/landmark/"+ $(this).find("landmark_image").text() + ".jpg'></div>";
				table += "<div id='etc_div'>";
				table += "<div id='landmark_name'>" + $(this).find("landmark_name").text() + "</div>";
				table += "<div id='landmark_addr'>" + $(this).find("landmark_addr").text() + "</div>";
				table += "<div id='landmark_info'>" + $(this).find("landmark_info").text() + "</div></div></div>";
			});
			$('body').stop().animate({
				scrollTop:'500'
			}, 300);
			$('#mapping_landmark_list').html('')
			$('#mapping_landmark_list').append(table);
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

function goTop(){
	$('body').stop().animate({
		scrollTop:'0'
	}, 300);
}