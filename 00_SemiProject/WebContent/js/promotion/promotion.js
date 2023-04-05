/**쿠폰 발급시 세션 정보 조회 , 쿠폰 발급 요청 하는 기능입니다.
 * 
 */


function getCoupon(e){
	$.ajax({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type: "get",
		url : "coupon_make.do",
		data : {
			prom_no : $(e).val()
		},
		datatype : "xml",
		context : this,
		success : function(data){
			alert('성공입니다 당신은 쿠폰을 받을 수 있어요.');
			console.log(data);
		},
		error : function(){
			alert('에러입니다.');
		}
		
		
	});
	
	
	
}