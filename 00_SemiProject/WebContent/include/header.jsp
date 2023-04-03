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
<script src="https://kit.fontawesome.com/e6bfca85af.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function () {
	if(<%=checkDate==null %>){
        $(".checkIn").val(new Date().toISOString().slice(0, 10));
        $(".checkOut").val(new Date(new Date().setDate(new Date().getDate() + 1)).toISOString().slice(0, 10));
     }
	if($('#Starlocation').length){
	      serchHotelList($('#Starlocation'));
	      serchHotelList($('#lowPricelocation'));
	}
});
</script>
</head>
<body>
	<div id="header">
		<div align ="center">
		<h1><a href="<%=request.getContextPath()%>/index.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></h1>
			<c:set var="dto" value="${sessionScope.loginUser }" />
				<nav><!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
		          <ul>
		            <li>
		            <c:if test="${empty dto}">
		            	<a href="<%=request.getContextPath()%>/user/user_main.jsp">로그인</a>
		            </c:if>
		            <c:if test="${!empty dto}">
		            	<a href="<%=request.getContextPath()%>/user/user_myPage.jsp">마이페이지</a>
						<%--로그아웃 --%>		            	
		            	<br>
		            	<input type = "button" value = "로그아웃"
						onclick = "if(confirm('로그아웃 진행하십니까?')){location.href='user_logout.do'}else{return;}">
						
		            </c:if>
		            </li>
		            <li><a href="<%=request.getContextPath()%>/">프로모션</a></li>
		          </ul>
		        </nav>
		<hr>
	
		<h5>검색창</h5>
				<form  method = "post" action="<%=request.getContextPath()%>/hotel_Search.do">
					<!--지역선택 selectbox  -->
					지역<select name="location">
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
			        
			         	<br/>
			         <%--지역이나, 호텔이름 관련 키워드로 입력 예정 --%>	
			         <input type="text" placeholder="지역,숙소명 입력"name="keyword">&nbsp;&nbsp;<input type ="submit">
				</form>
		</div><!-- div center end -->
	</div><!--header div end  -->
	<hr>
</body>
</html>