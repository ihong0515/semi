<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user_dto" value="${sessionScope.loginUser }" />
<c:set var="prom_list" value="${promList }" />
<c:set var="coup_list" value="${couponList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 쿠폰 내역</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/user_coupon.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
    	<div id="content">
	    	<jsp:include page="../user/user_mypage_header.jsp"/>
	    	<h2>${user_dto.getUser_name() }' s coupon history</h2>
			<div id ="user_coupon_content">
				<div id = "user_coupon_table">
					<div id = "user_coupon_row">
						<div id = "user_coupon_col">프로모션 이름</div> 
						<div id = "user_coupon_col">내용</div>
						<div id = "user_coupon_col">할인율</div>
						<div id = "user_coupon_col">일련번호</div> 
						<div id = "user_coupon_col">사용여부</div>
					</div>
					
					<c:if test="${!empty coup_list }">
						<c:forEach items="${coup_list }" var="coup_dto">
							<div id = "user_coupon_row">
								<c:forEach items="${prom_list }" var="prom">
									<c:if test="${prom.getProm_no() == coup_dto.getCoup_promno() }">
										<div id = "user_coupon_col">
											${prom.getProm_name() }
										</div>
										<div id = "user_coupon_col">
											${prom.getProm_info() }
										</div>
									</c:if>
								</c:forEach>
								<div id = "user_coupon_col">${coup_dto.getCoup_sale() }%할인적용</div>
								<div id = "user_coupon_col">${coup_dto.getCoup_serialno() }</div>
								<div id = "user_coupon_col">${coup_dto.getCoup_usecheck() }</div>
							</div>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty coup_list }" var="coup_dto">
						<div id = "user_coupon_row">
							<div id = "user_coupon_col">
								<i class="fa fa-question-circle" aria-hidden="true"></i><p>등록된 쿠폰이 없습니다.</p>
							</div>
						</div>
					</c:if>
				</div>
				
				<div id = "coupon_terms_title">
						<i class="fa fa-info-circle" aria-hidden="true"></i>  유의사항
				</div>
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
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>