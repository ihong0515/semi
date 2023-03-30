<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/e6bfca85af.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	//날짜 기본 선택창 날짜 오늘 날짜로 설정.
	window.onload = function() {
		document.getElementById('checkIn').value = new Date().toISOString()
				.slice(0, 10);

		document.getElementById("checkOut").value = new Date(new Date()
				.setDate(new Date().getDate() + 1)).toISOString().slice(0, 10);
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<div align ="center">
		<h5>상단 네비바 1↑</h5>
			<c:set var="dto" value="${sessionScope.loginUser }" />
				<nav><!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
		          <ul>
		            <li>
		            <c:if test="${empty dto}">
		            	<a href="<%=request.getContextPath()%>/user/user_main.jsp">로그인</a>
		            </c:if>
		            <c:if test="${!empty dto}">
		            	<a href="<%=request.getContextPath()%>/user/user_myPage.jsp">마이페이지</a>
		            </c:if>
		            </li>
		            
		            <li><a href="<%=request.getContextPath()%>/index.jsp">메인홈</a></li>
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
						
						<input type="date" id="checkIn" name="checkinDate" value="">
			            <input type="date" id="checkOut" name="checkoutDate" value="">
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