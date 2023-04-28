<%@page import="java.util.Date"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
@SuppressWarnings("all")
ArrayList<Date> checkDate = (ArrayList<Date>)session.getAttribute("CheckDate");
int inoutday = 1;
if(checkDate!=null){
	long result = checkDate.get(1).getTime() - checkDate.get(0).getTime();
	inoutday =(int)(result / 1000 / 60 / 60 / 24);
}
%>
<c:set var="hoDTO" value="${HotelDTO }" />
<c:set var="roDTO" value="${RoomDTO }" />
<c:set var="inoutDay" value="<%=inoutday %>" />
<c:set var="usDTO" value="${sessionScope.loginUser }" />
<c:set var="cardList" value="${CardList }" />
<c:set var="coupList" value="${CoupList }" />
<c:set var="promList" value="${PromList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${hoDTO.getHotel_name() } 결제 페이지</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script type="text/javascript">
	let room_price_val = '${roDTO.getRoom_price() }';
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/hotel/hotel_payment.js"></script>
<link href="<%=request.getContextPath() %>/css/hotel/hotel_payment.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<div id="payment">
				<form method="post" action="<%=request.getContextPath() %>/hotel_reserve.do" onsubmit="return check_payment()">
					<div id="payment_hotel">
						<div id="payment_hotelwrap">
							<div id="payment_hotelwrap_cont">
								<div id="payment_hotel_img">
									<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/main.jpg">
								</div>
								<div id="payment_hotel_cont">
									<ul>
										<li id="cont_hotel_name">
											<strong>${hoDTO.getHotel_name() }</strong>
											<span id="cont_hotel_star">
												<c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach>
											</span>
										</li>
										<li id="cont_romm_name">${roDTO.getRoom_name() }</li>
										<li>
											<span><i class="fa-solid fa-user"></i>&nbsp;성인 ${roDTO.getRoom_people_min() } - ${roDTO.getRoom_people_max() }명</span>&nbsp;&nbsp;
											<span><i class="fa-solid fa-bed-front"></i>&nbsp;${roDTO.getRoom_bed() }침대</span>&nbsp;&nbsp;
											<span><i class="fa-solid fa-arrows-maximize"></i>&nbsp;${roDTO.getRoom_size() }m<sup>2</sup></span>&nbsp;&nbsp;
											<span>
												<c:if test="${roDTO.getRoom_breakfast()=='Y' }">
													<i class="fa-solid fa-pancakes"></i>&nbsp;조식 포함&nbsp;&nbsp;
												</c:if>
											</span>
										</li>
										<li>체크인 ${roDTO. getRoom_checkin()}:00 PM, 체크아웃 ${roDTO. getRoom_checkout()}:00 AM</li>
									</ul>
								</div>
							</div>
							<div id="payment_hotel_date_people">
								<div id="payment_hotel_date">
									날짜&nbsp;
									<c:if test="${!empty sessionScope.CheckDate }">
										<c:set var="checkDate" value="${sessionScope.CheckDate }" />
										<fmt:formatDate value="${checkDate.get(0) }" var="checkin" pattern="yyyy-MM-dd" />
										<fmt:formatDate value="${checkDate.get(1) }" var="checkout" pattern="yyyy-MM-dd" />
										<input type="date" value="${checkin }" class="checkIn checkInP" name="payment_hotel_indate" onchange="mindateset(this)"> - <input type="date" value="${checkout }" class="checkOut checkOutP" name="payment_hotel_outdate" onchange="inoutChange(this)">
									</c:if>
									<c:if test="${empty sessionScope.CheckDate }">
										<input type="date" value="" class="checkIn checkInP" name="payment_hotel_indate" onchange="mindateset(this)"> - <input type="date" value="" class="checkOut checkOutP" name="payment_hotel_outdate" onchange="inoutChange(this)">
									</c:if>
								</div>
								<div>
									인원수&nbsp;<input type="number" name="reserv_people" min="${roDTO.getRoom_people_min() }" max="${roDTO.getRoom_people_max() }" value="${roDTO.getRoom_people_min() }">
								</div>
							</div>
						</div>
						<div id="payment_hotel_userInfo">
							<input type="text" class="userInfo_wrapper" id="userFirstName" name="userFirstName" placeholder="성">
							<input type="text" class="userInfo_wrapper" id="userLastName" name="userLastName" placeholder="이름">
							<c:if test="${empty usDTO }">
								<input type="text" class="userInfo_wrapper" placeholder="로그인이 필요합니다." readonly="readonly">
							</c:if>
							<c:if test="${!empty usDTO }">
								<input type="text" class="userInfo_wrapper" value="${usDTO.getUser_email() }" readonly="readonly">
							</c:if>
							<select class="userPhone_head" name="userPhone_head">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<input type="text" placeholder="0000-0000" class="userInfo_wrapper" id="userPhone_body" name="userPhone_body" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8">
						</div>
						<div id="payment_hotel_userReq">
							<div>
								<div id="userReq_title">
									요청 사항 (선택사항)
								</div>
								<textarea rows="10" cols="80" placeholder="호텔에 요청하실 사항이 있으면 적어주세요." name="payment_hotel_userReq"></textarea>
							</div>
						</div>
						<div id="payment_hotel_promotion">
							<h3 class="title_class">예약 혜택</h3>
							<span>할인 코드</span>
							<select id="prom_code_select" style="width: 120px;">
								<option value="basic">::::::::::::::::::::::::::</option>
								<c:forEach items="${coupList }" var="coDTO">
								<option value="${coDTO.getCoup_no() }">
								<c:forEach items="${promList }" var="prDTO">
									<c:if test="${prDTO.getProm_no()==coDTO.getCoup_promno() }">
									${prDTO.getProm_name() }
									</c:if>
								</c:forEach>
								</option>
								</c:forEach>
							</select>
							<input type="button" value="할인 적용" id="prom_code_btn" onclick="saleCheck()"><br>
							<span id="coupon_name"></span>
						</div>
						<div id="payment_price">
							<h3 class="title_class">요금 정보</h3>
							<table>
								<tr>
									<th>
										<fmt:formatNumber value="${roDTO.getRoom_price() }" type="currency"/> X <span id="inoutDay_text">${inoutDay }</span>박
									</th>
									<td id="original_price">
										<fmt:formatNumber value="${roDTO.getRoom_price()*inoutDay }" type="currency" />
									</td>
								</tr>
								<tr>
									<th>
										할인가
									</th>
									<td id="salePrice">
										0
									</td>
								</tr>
								<tr>
									<th>
										바로 결제
									</th>
									<td id="realPrice">
										<fmt:formatNumber value="${roDTO.getRoom_price()*inoutDay }" type="currency" />
									</td>
								</tr>
							</table>
							<input type="hidden" value="${roDTO.getRoom_price() * inoutDay}" id="ori_pri_hide">
							<input type="hidden" value="0" readonly="readonly" id="saleP_hide">
							<input type="hidden" value="0" readonly="readonly" id="sales_hide">
							<div id="payment_usercard">
								${dto.getUser_name() }
								<c:if test="${empty usDTO }">
									<a href='<%=request.getContextPath()%>/user_login_page.do'>로그인을 하세요.</a>
								</c:if>
								<c:if test="${!empty usDTO }">
									<div id="payment_usercard_select">
										<span>결제 수단 선택 : </span>
										<select name="userCard" id="userCard" onchange="payment_getno()">
													<option value="">::카드선택::</option>
												<c:forEach items="${cardList }" var="cardDTO">
													<option value="${cardDTO.getPay_no() }">${cardDTO.getPay_name() }</option>
												</c:forEach>
										</select>
									</div>
									<div id="payment_usercard_view">
										<p></p>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div id="payment_terms">
						해당 예약 요청 시, <input type="checkbox" class="use_terms" disabled><a href="#modal" onclick="modal_click(this)" class="use_terms">이용 약관</a>, <input type="checkbox" disabled class="privat_terms"><a href="#modal" onclick="modal_click(this)" class="privat_terms">개인정보 처리방침</a>, <input type="checkbox" disabled class="servies_terms"><a href="#modal" onclick="modal_click(this)" class="servies_terms">공급업체 서비스 약관</a>을 읽었으며 이에 동의합니다.
					</div>
					<div id="modal" class="modal-overlay">
				        <div class="modal-window use_terms">
				            <div class="modal-title">
				                <h2>이용 약관</h2>
				                <div class="close-area" onclick="modal_close()">X</div>
				            </div>
				            <div class="modal-content" style="overflow: auto;">
								<jsp:include page="../terms/payment/use_terms" />
				            </div>
				            <div class="modal-footer">
				            	<input type="button" value="동의" onclick="modal_check(this)">&nbsp;&nbsp;
								<input type="button" value="동의안함" onclick="modal_uncheck(this)">
				            </div>
				        </div>
				        <div class="modal-window privat_terms">
				            <div class="modal-title">
				                <h2>개인정보 처리방침</h2>
				                 <div class="close-area" onclick="modal_close()">X</div>
				            </div>
				            <div class="modal-content">
				                <jsp:include page="../terms/payment/privat_terms" />
				            </div>
				            <div class="modal-footer">
				            	<input type="button" value="동의" onclick="modal_check(this)">&nbsp;&nbsp;
								<input type="button" value="동의안함" onclick="modal_uncheck(this)">
				            </div>
				        </div>
				        <div class="modal-window servies_terms">
				            <div class="modal-title">
				                <h2>공급업체 서비스 약관</h2>
				            	<div class="close-area" onclick="modal_close()">X</div>
				            </div>
				            <div class="modal-content">
				                <jsp:include page="../terms/payment/service_terms" />
				            </div>
				            <div class="modal-footer">
				            	<input type="button" value="동의" onclick="modal_check(this)">&nbsp;&nbsp;
								<input type="button" value="동의안함" onclick="modal_uncheck(this)">
				            </div>
				        </div>
					</div>
					<div id="payment_submit">
						<input type="hidden" id="realPrice_hidden" name="realPrice" value="${roDTO.getRoom_price()*inoutDay }">
						<input type="hidden" id="nomalPrice_hidden" name="nomalPrice" value="${roDTO.getRoom_price()*inoutDay }">
						<input type="hidden" id="card_no" name="card_no" value="0">
						<input type="hidden" name="coup_no" id="coup_no">
						<input type="hidden" name="prom_no" id="prom_no">
						<input type="hidden" name="user_no" value="${usDTO.getUser_no() }">
						<input type="hidden" id="inoutDay_hide" name="inoutDay" value="${inoutDay }">
						<input type="hidden" name="hotel_name" value="${hoDTO.getHotel_name() }">
						<input type="hidden" name="hotel_no" value="${hoDTO.getHotel_no() }">
						<input type="hidden" name="room_name" value="${roDTO.getRoom_name() }">
						<input type="hidden" name="room_no" value="${roDTO.getRoom_no() }">
						<input class ="payment_submit_button" type="submit" value="다음 단계 : 최종 확정 >">
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>