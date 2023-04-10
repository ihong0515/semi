/**
 * 
 */

$(function () {
	if(checkdate_param){
        $(".checkIn").val(new Date().toISOString().slice(0, 10));
        $(".checkOut").val(new Date(new Date().setDate(new Date().getDate() + 1)).toISOString().slice(0, 10));
     }
	if($('#Starlocation').length){
		serchHotelList($('#Starlocation'));
		serchHotelList($('#lowPricelocation'));
	}

	$('.promotion_list').slick({
	  dots: true,
	  dotsClass : "slick-dots", 
	  infinite: true,
	  speed: 300,
	  slidesToShow: 1,
	  adaptiveHeight: true,
	  arrows: true,
	  prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
	  nextArrow : "<button type='button' class='slick-next'>Next</button>"	
	});
	
	
	
});