<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Promotion}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.getProm_name()}</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
	let uid = '<%=session.getAttribute("loginUser")%>';
	let contextPath = "<%=request.getContextPath() %>";
</script>
<script src="<%=request.getContextPath()%>/js/promotion/promotion.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://kit.fontawesome.com/e6bfca85af.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/promotion/promotion.css">
</head>
<body>
	<div id = "coupon_content_header">
		<img src="<%=request.getContextPath()%>/image/include/logo2.png" width="200px">
	</div>
	<div id="coupon_content_container">
		<div id = "coupon_content_title">Get Coupon</div>
		<c:if test="${!empty dto}">
		<div id="promotion_content_image">
			<div class ="row">
				<img src="<%=request.getContextPath()%>/image/promotion/${dto.getProm_folder()}/main.jpg">
			</div>
	    </div>
	    <div id = "coupon_frame">
			<div id="coupon_content">
				<div class = "row">
					<h3 id = "coupon_title"><i class="fa fa-lightbulb-o" aria-hidden="true"></i> ${dto.getProm_name()}</h3>
				</div>
				<div class = "row">
					<span class="coupon_sale_font">${dto.getProm_sale()}%</span>
				</div>
				<div class = "row" id = "coup_result">
					${dto.getProm_info()}
				</div>
			</div>
		</div>
		<div id="coupon_button_area">
			<input type="hidden" value="${dto.getProm_no()}" id="prom_no_val">
			<input id="coupon_button" type="button" value="coupon" onclick="getCoupon()" >
		</div>
		<div id="coup_result_area" >
			<p id="coup_result"></p>
		</div>

		<div id = "promtion_content_footer">
			<i class="fa fa-info-circle" aria-hidden="true"></i>  유의사항
			<div id = "coupon_terms">
				<ul>
					<li>- 등록된 상품권 중 최근 1년 이내 사용한 상품권, 유효기간이 만료된 상품권은 ‘사용 완료’에서 확인하실 수 있습니다.</li>
					<li>- 상품권 유효기간은 발행일로부터 5년이며, 등록한 시점과는 무관합니다.</li>
					<li>- 상품권을 등록 후에는 제3자에게 양도 및 삭제가 불가합니다.</li>	
					<li>- 등록된 상품권은 스크래치가 개봉된 상품권이므로, 타인에게 유출되지 않도록 실물 상품권을 보관해주시기 바랍니다.</li>	
					<li>- 등록 상품권 사용제한
							기차여행 등 일부 온라인 상품의 경우, 상품권번호, 비밀번호 재입력이 필요하오니 반드시 실물 	상품권을 보관해주시기 바랍니다.
							일부 오프라인 매장 사용제한 (티마크 호텔, 그랜드티마크 호텔 등)</li>	
					<li>- 사용 후 잔액에 대한 “즉시재발행” 상품권의 경우 사용가능한 상품권 등록까지 영업 일 기준 최대 1~2일 정도 소요될 수 있습니다.</li>	
				</ul>
			</div>
		</div>
		</c:if>
	</div>
</body>
</html>