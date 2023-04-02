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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function saleCheck() {
	
	$.ajax({
		type: "post",
		url: "coupon_get_SalePrice.do",
		data: {coup_no:$('#prom_code_txt').val(), price: ${roDTO.getRoom_price() * inoutDay} },
		datatype: "xml",
		success: function(data){
			alert('쿠폰 등록 성공!');
			$(data).find("coupon").each(function() {
				let saleP = $("saleP", this).text();
				let price = $("price", this).text();
				let name = $("name", this).text();
				let sale = $("sale", this).text();
				
				let resultSale = saleP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				let resultPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
				$('#coupon_name').text(name +" / "+ sale+" % 할인");
				$('#salePrice').text("₩"+resultSale);
				$('#realPrice').text("₩"+resultPrice);
			});
		},
		error: function(data){
			alert('쿠폰 등록 실패..');
		}
	});
}
</script>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<form>
				<div id="payment">
					<div id="payment_hotel">
						<div id="payment_hotel_img">
							<img alt="" src="<%=request.getContextPath() %>/image/hotel/${hoDTO.getHotel_photo_folder() }/main.jpg" width="100px" height="100px">
						</div>
						<div id="payment_hotel_cont">
							${hoDTO.getHotel_name() } <c:forEach begin="1" end="${hoDTO.getHotel_star() }">★</c:forEach><br>
							${roDTO.getRoom_name() } 체크아웃 ${roDTO.getRoom_checkout() } 전<br>
							<i class="fa fa-user-o" aria-hidden="true"></i>${roDTO.getRoom_people_min() }~${roDTO.getRoom_people_max() }<i class="fa fa-bed" aria-hidden="true"></i>${roDTO.getRoom_bed() }
							<c:if test="${roDTO.getRoom_breakfast() }"><i class="fa fa-cutlery" aria-hidden="true"></i>조식 포함</c:if>
						</div>
						<div id="payment_hotel_date">
							<c:if test="${!empty sessionScope.CheckDate }">
								<c:set var="checkDate" value="${sessionScope.CheckDate }" />
								<fmt:formatDate value="${checkDate.get(0) }" var="checkin" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${checkDate.get(1) }" var="checkout" pattern="yyyy-MM-dd" />
								<input type="date" value="${checkin }" class="checkIn" name="checkinDate">~<input type="date" value="${checkout }" class="checkOut" name="checkoutDate">
							</c:if>
							<c:if test="${empty sessionScope.CheckDate }">
								<input type="date" value="" class="checkIn">~<input type="date" value="" class="checkOut">
							</c:if>
						</div>
						<div id="payment_hotel_userInfo">
							<fieldset>
								<legend>
									성
								</legend>
								<input type="text">
							</fieldset>
							<fieldset>
								<legend>
									이름
								</legend>
								<input type="text">
							</fieldset>
							<fieldset>
								<legend>
									이메일 주소
								</legend>
								<input type="text">
							</fieldset>
							<fieldset>
								<legend>
									휴대폰 번호
								</legend>
								<select>
									<option>010</option>
									<option>011</option>
									<option>017</option>
									<option>019</option>
								</select>
								<input type="text" placeholder="휴대폰 번호">
							</fieldset>
						</div>
						<div id="payment_hotel_userReq">
							<fieldset>
								<legend>
									요청 사항 (선택사항)
								</legend>
								<textarea rows="5" cols="40" placeholder="호텔에 요청하실 사항이 있으면 적어주세요."></textarea>
							</fieldset>
						</div>
						<div id="payment_hotel_promotion">
							<h3>혜택 적용</h3>
							<span>할인 코드</span><input type="button" value="선택/입력" onclick=""><br>
							<input type="text" placeholder="할인 코드 입력  12자리" id="prom_code_txt"><input type="button" value="할인 적용" id="prom_code_btn" onclick="saleCheck()"><br>
							<span id="coupon_name"></span>
						</div>
					</div>
					<div id="payment_price">
						<h3>요금 정보</h3>
						<table>
							<tr>
								<th>
									<fmt:formatNumber value="${roDTO.getRoom_price() }" type="currency"/> X ${inoutDay }박
								</th>
								<td>
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
									<fmt:formatNumber value="${roDTO.getRoom_price()*inoutDay-(roDTO.getRoom_price()*inoutDay*salePrice/100) }" type="currency" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>