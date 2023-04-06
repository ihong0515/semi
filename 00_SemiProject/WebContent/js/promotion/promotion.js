/**쿠폰 발급시 세션 정보 조회 , 쿠폰 발급 요청 하는 기능입니다.
 * 
 */

function getCoupon(e){
	if(uid == 'null'){
		alert('로그인이 필요한 서비스 입니다.');
	}else{
		$.ajax({
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "get",
			url : "coupon_make.do",
			data : {
				prom_no : $('#prom_no_val').val()
			},
			datatype : "text",
			context : this,
			success : function(data){
				$('#coup_result').text(data);
			},
			error : function(){
				alert('에러입니다.');
			}
		});
	}
}