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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/slick/slick.js"></script>
<script type="text/javascript">
	let user_no = '${loginUser.getUser_no()}';
	let checkdate_param = '<%=checkDate==null %>';
	let contextPath = '<%=request.getContextPath() %>';
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/include/header.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/onload.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/include/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/slick/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/slick/slick-theme.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/include/footer.css">
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="header_navi">
				<div id="header_navi_home"><img alt="" src="<%=request.getContextPath() %>/image/include/banner.jpg" onclick="location.href='<%=request.getContextPath()%>/index_move.do'"></div>
				<c:set var="dto" value="${sessionScope.loginUser }" />
				<div id="header_navi_home_log">
					<c:if test="${empty dto}">
		            <a href="<%=request.getContextPath()%>/user_login_page.do">로그인</a>

		            </c:if>
		            <c:if test="${!empty dto}">
		            <a href="<%=request.getContextPath()%>/user_my_page.do">마이페이지</a>
					<%--로그아웃 --%>&nbsp;|&nbsp;
					<a href="javascript:logout()">로그아웃</a>
		            </c:if>
				</div>
				<div id="header_navi_ul"><!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
		          <ul>
		            <li><a href="<%=request.getContextPath() %>/hotel_mapping_list.do">지도에서 찾는 호텔</a></li>
		            <li><a href="<%=request.getContextPath() %>/crawling_hotel.do">다양한 호텔 리뷰</a></li>
		            <li><a href="<%=request.getContextPath()%>/PromotionList.do">프로모션</a></li>
		          </ul>
		        </div>
		    </div><!-- header_navi end -->    
			<hr>
			<h5>검색창</h5>
			<div id="header_search">
				<form  method = "post" action="<%=request.getContextPath()%>/hotel_Search.do">
					<!--지역선택 selectbox  -->
					<select name="location">
						<option value = "서울">서울</option>
						<option value = "경기">경기</option>
						<option value = "강원">강원</option>
						<option value = "전남">전남</option>
						<option value = "전북">전북</option>
						<option value = "충북">충북</option>
						<option value = "충남">충남</option>
						<option value = "경남">경남</option>
						<option value = "경북">경북</option>
						<option value = "제주">제주</option>
					</select>
					<!--날짜선택 selectbox  -->
					<c:if test="${!empty sessionScope.CheckDate }">
					<c:set var="checkDate" value="${sessionScope.CheckDate }" />
						<fmt:formatDate value="${checkDate.get(0) }" var="checkin" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${checkDate.get(1) }" var="checkout" pattern="yyyy-MM-dd" />
						<input type="date" value="${checkin }" class="checkIn" name="checkinDate">~<input type="date" value="${checkout }" class="checkOut" name="checkoutDate">
					</c:if>
					<c:if test="${empty sessionScope.CheckDate }">
						<input type="date" value="" class="checkIn" name="checkinDate">~<input type="date" value="" class="checkOut" name="checkoutDate">
					</c:if>
					<!--체크아웃 셀렉트 박스 end  -->
			        <input type="text" placeholder="지역,숙소명 입력"name="keyword">&nbsp;&nbsp;<input type ="submit">
				</form>
			</div><!-- header_search bar end -->
		</div><!--header end  -->
	</div>
</body>
</html>