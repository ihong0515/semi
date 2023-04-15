<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Promotion}}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
	let uid = '<%=session.getAttribute("loginUser")%>';
	let contextPath = "<%=request.getContextPath() %>";
</script>
<script src="<%=request.getContextPath()%>/js/promotion/promotion.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/promotion/promotion.css">
</head>
<body>
	<div id = "promotion_content_header">
		<img src="<%=request.getContextPath()%>/image/include/logo2.png" width="200px">
		<h1>Get Coupon</h1>
	</div>
	<div id="promotion_content_container">
		<c:if test="${!empty Promotion}">
		<div id="promotion_coupon_table">
			<div id="row">
				<div id="col">
					<img src="<%=request.getContextPath()%>/image/promotion/${Promotion.getProm_folder()}/main.jpg">
				</div>
			</div>
			<div id="coupon_frame">	
				<div id="coupon_cont">
					<div id="row">
						<div id="col">
							<h3>${Promotion.getProm_name()}</h3>
						</div>
					</div>
					<div id="row">
						<div id="col" class="coupon_sale">
							<span class="coupon_sale_font">${Promotion.getProm_sale()}%</span>Discount
						</div>
					</div>
					<div id="row">
						<div id="col">
							${Promotion.getProm_info()}
						</div>
					</div>
				</div>
			</div>	
		</div>
		</c:if>
		<div id="coupon_button_area">
			<input type="hidden" value="${Promotion.getProm_no()}" id="prom_no_val">
			<input id="coupon_button" type="button" value="coupon" onclick="getCoupon()" >
		</div>
		<div id="coup_result_area" >
			<p id="coup_result"></p>
		</div>
		<div id="promtion_content_footer">
			<h4>예약 규정</h4>
			<p id="promtion_footer_term">
				<b>프로모션 기간</b>: 2023년 6월 30일까지.<br>
				<b>플랫폼</b>: 트립닷컴 앱, 웹사이트, 모바일 웹사이트.<br>
				<b>원 플러스 원(1+1) 프로모션</b>:<br>
				<b>3.1.</b> 프로모션 기간 동안 트립닷컴 플랫폼에서 에어 마카오가 운항하는 1+1 혜택이
				적용된 마카오행 직항 왕복 항공권 특가를 제공합니다. 2인 예매 시 1+1 혜택이 제공됩니다.<br>
				(여행 날짜는 반드시 2023년 9월 30일 이전이어야 함)<br>
				(※ 안내: 프로모션 페이지에 표시된 가격은 1+1 혜택이 적용된 1인 왕복 항공권 특가)<br>
				<b>3.2.</b> 항공편 가는편과 오는편 사이에는 반드시 2~7일 기간이 있어야 합니다.<br>
				<b>3.3.</b> 대상 탑승객 유형: 좌석이 필요한 성인, 어린이, 유아. 상기 가격은 실제 할인이 적용된 가격으로 상황에 따라 변경될 수 있습니다.
				가격, 잔여 수량, 관련 이용약관은 트립닷컴을 참고하세요. 항공사는 판매 상황에 따라 가격을 조절하고 이용 가능 좌석
				수를 조정할 권리가 있습니다. 항공편별 이용 가능 좌석 수는 해당 항공사에서 제공하는 좌석 수에 따라 결정되며, 선착순
				이용을 원칙으로 합니다. 변경 및 취소 : 자발적 취소는 불가하며, 변경 시 같은 예약에 포함된 모든 탑승객의 항공권을
				함께 변경해야 합니다. 항공권은 1회에 한 해 무료로 자발적 변경이 가능합니다. 노쇼(No-show) 이전에 항공권을
				변경하지 않은 경우, 노쇼(No-Show) 시 1회에 한해 무료 자발적 변경이 허용됩니다. 두 번째 또는 추가 변경
				요청은 허용되지 않습니다. 논쟁 시, Trip.com 및 Air Macau에 최종 해석 권한이 있습니다.
			</p>
		</div>
	</div>
</body>
</html>