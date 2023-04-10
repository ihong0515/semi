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
	
	 console.log("jQuery version: " + jQuery.fn.jquery);
	
	$('.promotion_list').slick({
	  dots: true,
	  infinite: true,
	  speed: 300,
	  slidesToShow: 1,
	  adaptiveHeight: true
	});
	

	
});