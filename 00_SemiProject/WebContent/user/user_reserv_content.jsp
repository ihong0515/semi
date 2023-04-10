<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${loginUser }" var="user" />
<c:set value="${Dto }" var="dto" />
<c:set value="${PayDto }" var="payDto" />
<c:set value="${PromDto }" var="promDto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<div id="hotel_info">
				예약하신 호텔 : ${dto.getReserv_hotelname() }
			</div>
			<div id="room_info">
				<div>
					예약하신 상품 : ${dto.getReserv_roomname() }<br>
					<br>
					${dto.getReserv_start().substring(5,10) } ~ ${dto.getReserv_end().substring(5,10) }
					<br>
					총 ${dto.getReserv_daycount() } 박
				</div>
				
			</div>
			<div id="payment_info">
				<div>
					결제 카드 : ${payDto.getPay_name() }
				</div>
				<div>
					원 가 : ${dto.getReserv_nomalprice() }<br>
					적용 쿠폰 : ${promDto.getProm_name() }<br>
					결제 금액 : ${dto.getReserv_realprice() }
				</div>
			</div>
			<div id="cancle_info">
				<div class="cancle_info_content">
					<p>
						고객센터 운영시간 :
					</p>
					<p>
						09시~익일 03시/연중무휴
						제휴점 및 예약조건에 따라 취소 환불 규정이 다를 수 있음.
					</p>
				</div>
				<div class="cancle_info_content">
					<p>
						무료취소 가능 여부
					</p>
					<p>
						당일 제외 무료취소 기본 제공
						여행 업체에서 동의/허용하거나 (선)결제 및 취소 정책에 달리 명시되어 있지 않는 한, 
						(환불 불가) 선결제 금액은 어떠한 경우에도 환급하지 않음
					</p>
				</div>
			</div>
			<div id="cancle_btn">
				<span onclick="location.href="">예약 취소 및 환불을 요청합니다.</span>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>