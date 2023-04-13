<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
@SuppressWarnings("all")
ArrayList<Date> checkDate = (ArrayList<Date>)session.getAttribute("CheckDate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://kit.fontawesome.com/e6bfca85af.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	let user_no = '${loginUser.getUser_no()}';
	let checkdate_param = '<%=checkDate==null %>';
	let contextPath = '<%=request.getContextPath() %>';
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/include/header.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/include/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div id="header">
		<div id="header_navi">
			<div id="header_navi_logo">
				<img src="<%=request.getContextPath() %>/image/include/logo2.png" onclick="location.href='<%=request.getContextPath()%>/index_move.do'" width="200px">
			</div>
			<div id="header_navi_ul"><!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
				<ul>
					<li><a href="<%=request.getContextPath() %>/hotel_mapping_list.do">Hotel in Map</a></li>
					<li><a href="<%=request.getContextPath() %>/crawling_hotel.do">Review</a></li>
					<li><a href="<%=request.getContextPath()%>/PromotionList.do">Promotion</a></li>
				</ul>
			</div>
			<c:set var="dto" value="${sessionScope.loginUser }" />
			<div id="header_navi_home_log">
				<c:if test="${empty dto}">
					<a href="<%=request.getContextPath()%>/user_join.do">join</a>
		       		<a href="<%=request.getContextPath()%>/user_login_page.do">login</a>
				</c:if>
				<c:if test="${!empty dto}">
					<a href="javascript:openMypage()" id="mypage">mypage</a>
					<a href="javascript:logout()" id="logout">logout</a>
					<ul class="submenu">	
						<li><a href="<%=request.getContextPath() %>/user_info.do?no=${dto.getUser_no() }">회원 정보 수정</a></li>
						<li><a href="<%=request.getContextPath() %>/user_payment.do?no=${dto.getUser_no() }">내 결제수단</a></li>
						<li><a href="<%=request.getContextPath() %>/user_reservation.do?no=${dto.getUser_no() }">예약 내역</a></li>
						<li><a href="<%=request.getContextPath() %>/user_jjim.do?no=${dto.getUser_no() }">찜 목록</a></li>
						<li><a href="<%=request.getContextPath() %>/user_board_main.do">1:1 문의 내역</a></li>
						<li><a href="<%=request.getContextPath() %>/user_coupon.do?no=${dto.getUser_no() }">보유 쿠폰</a></li>
					</ul>
				</c:if>
			</div>
		</div><!-- Header nav bar end -->   
		<div id="header_navi_home">
			<img src="<%=request.getContextPath() %>/image/include/banner.jpg" onclick="location.href='<%=request.getContextPath()%>/index_move.do'">
		</div> 
		<div id="header_search" align="center">
			<form  method="post" action="<%=request.getContextPath()%>/hotel_Search.do">
				<!--지역선택 selectbox  -->
				<select name="location" id="location">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="제주">제주</option>
				</select>&nbsp;
				<!--날짜선택 selectbox  -->
				<c:if test="${!empty sessionScope.CheckDate }">
					<c:set var="checkDate" value="${sessionScope.CheckDate }" />
					<fmt:formatDate value="${checkDate.get(0) }" var="checkin" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${checkDate.get(1) }" var="checkout" pattern="yyyy-MM-dd" />
					<input type="date" value="${checkin }" class="checkIn" name="checkinDate">&nbsp;
					<i class="fa-sharp fa-solid fa-arrow-right"></i>&nbsp;
					<input type="date" value="${checkout }" class="checkOut" name="checkoutDate">&nbsp;
				</c:if>
				<c:if test="${empty sessionScope.CheckDate }">
					<input type="date" value="" class="checkIn" name="checkinDate">&nbsp;
					<i class="fa-sharp fa-solid fa-arrow-right"></i>&nbsp;
					<input type="date" value="" class="checkOut" name="checkoutDate">&nbsp;
				</c:if>
		        <!--체크아웃 셀렉트 박스 end  -->
		        <input type="text" placeholder="지역 또는 숙소의 이름을 입력하세요." name="keyword" id="keyword">&nbsp;
		        <input type ="submit" class="submit_button" id="submit_button" value="검색">
			</form>
	 	</div><!-- header_search bar end -->
	</div><!--header div end  -->
</body>
</html>