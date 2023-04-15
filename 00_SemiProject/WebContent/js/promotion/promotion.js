/**쿠폰 발급시 세션 정보 조회 , 쿠폰 발급 요청 하는 기능입니다.
 * 
 */
$(document).ready(function(){
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

function getCoupon(){
	if(uid == 'null'){
		alert('로그인이 필요한 서비스 입니다.');
	}else{
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "get",
			url : contextPath+"/coupon_make.do",
			data : {
				prom_no : $('#prom_no_val').val()
			},
			datatype : "text",
			success : function(data){
				$('#coup_result').text(data);
			},
			error : function(){
				alert('에러입니다.');
			}
		});
	}
}
function openContent(prom_no){
	window.open(
		'PromotionContent.do?no='+prom_no, 
		'myWindow', 
		'toolbar=no,scrollbars=0,resizable=0,status=no,width=800,height=900,left=250,top=0'
	);
}


