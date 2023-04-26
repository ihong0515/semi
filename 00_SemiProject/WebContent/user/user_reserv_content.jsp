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
<title>회원 예약 정보</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user/user_reserv_content.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<jsp:include page="../user/user_mypage_header.jsp"/>
			<div id="reserv_detail_table">
				<h2>예약 세부 정보</h2>
				<table>
					<tr>
						<th>예약자</th>
						<td>${dto.getReserv_username() }</td>
					</tr>
					<tr>
						<th>예약 호텔 </th>
						<td>${dto.getReserv_hotelname() }</td>
					</tr>
					<tr>
						<th>예약 상품 </th>
						<td>${dto.getReserv_roomname() }</td>
					</tr>
					<tr>
						<th>체크인/체크아웃</th>
						<td>${dto.getReserv_start().substring(0,10) } ~ ${dto.getReserv_end().substring(0,10) } / 총 ${dto.getReserv_daycount() } 박</td>
					</tr>
					<tr>
						<th>결제 카드</th>
						<td>${payDto.getPay_name() } / 할부 : ${dto.getReserv_ins() } 개월</td>
					</tr>
					<tr>
						<th>원가</th>
						<td><fmt:formatNumber value="${dto.getReserv_nomalprice() }"/> 원</td>
					</tr>
					<tr>
						<th>적용 쿠폰 </th>
						<td>
							<c:if test="${!empty promDto.getProm_name() }">
								${promDto.getProm_name() } / ${promDto.getProm_sale() }%
							</c:if>
							<c:if test="${empty promDto.getProm_name() }">
								<p style="color: #C7C7C7">없음</p>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>결제 금액</th>
						<td><fmt:formatNumber value="${dto.getReserv_realprice() }"/> 원</td>
					</tr>
				</table>
			</div>
			<hr>
			<div id="cancel_detail_table">
				<c:if test="${dto.getReserv_usecheck() =='N' }">
					<table>
						<tr>
							<td rowspan="2" class="cancel_info_title">고객센터 운영시간</td>
							<td>09시~익일 03시/연중무휴</td>
						</tr>
						<tr>
							<td>제휴점 및 예약조건에 따라 취소 환불 규정이 다를 수 있음.<br></td>
						</tr>
						<tr></tr>
						<tr>
							<td rowspan="4" class="cancel_info_title">무료취소 가능 여부</td>
							<td>당일 제외 무료취소 기본 제공</td>
						</tr>
						<tr>
							<td>여행 업체에서 동의/허용하거나 (선)결제 및 취소 정책</td>
						</tr>
						<tr>
							<td>달리 명시되어 있지 않는 한, (환불 불가)</td>
						</tr>
						<tr>
							<td>선결제 금액은 어떠한 경우에도 환급하지 않음</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="cancle_btn">
									<button onclick="location.href='<%=request.getContextPath()%>/user_reserv_cancel.do?reserv_no=${dto.getReserv_no() }'">예약 취소 및 환불을 요청합니다.</button>
								</div>
							</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${dto.getReserv_usecheck() =='Y' }">
					<div class="cancel_status">
						사용완료된 상품입니다.
					</div>
				</c:if>
				<c:if test="${dto.getReserv_usecheck() =='C' }">
					<div class="cancel_status">
						결제 취소된 상품입니다.
					</div>
				</c:if>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>