<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="container">
	<jsp:include page="/include/header.jsp"/>

		<h5>본문 컨텐츠</h5>
		<div align ="center">	<!-- main content start-->
				<form  method = "post" action="<%=request.getContextPath()%>/hotel_Search.do">
					<!--지역선택 selectbox  -->
					지역<select name = "location">
							<option value = "seoul">서울</option>
							<option value = "kyungki">경기</option>
							<option value = "kwangwon">강원</option>
							<option value = "jeonnam">전남</option>
							<option value = "jeonbuk">전북</option>
							<option value = "chungbuk">충북</option>
							<option value = "chungnam">충남</option>
							<option value = "kyungnam">경남</option>
							<option value = "kyungbuk">경북</option>
							<option value = "jeju">제주</option>
					</select>
					
					<!--날짜선택 selectbox  -->
					
					<!--  -->
					<label for="date">체크인:</label>
		         		<select name="checkinDate">
		            	<%
			               // Get the current date
			                Date currentDate = new  Date();
			               
			               // Create a Calendar object
			                Calendar cal =  Calendar.getInstance();
			               
			               // Set the calendar to the current date
			               cal.setTime(currentDate);
			               
			               // Loop through the next 30 days
			               for (int i = 0; i < 30; i++) {
			                  // Add one day to the calendar
			                  cal.add( Calendar.DATE, 1);
			                  
			                  // Get the date in a format suitable for a select option
			                  
			                  String optionValue = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			                  
			                  // Create the select option
			                  out.println("<option value=\"" + optionValue + "\">" + optionValue + "</option>");
			               }
			            %>
			             </select>
			            <!--체크인 날짜 end  -->
			            
			            <!--체크아웃 날짜 셀렉트 박스 시작  -->
			  				<label for="date">체크아웃:</label>
		         		<select name="checkoutDate">
		            	<%
			              /*  // Get the current date(체크인 시작 하루 이후로 조정 예정)
			                Date checkoutDate = new  Date();
			               
			               // Create a Calendar object
			                Calendar cal2 =  Calendar.getInstance(); */
			               
			               // Set the calendar to the current date
			               cal.setTime(currentDate);
			               
			               // Loop through the next 30 days(올해 남은 일수 만큼으로 조정 예정 )
			               for (int i = 0; i < 30; i++) {
			                  // Add one day to the calendar
			                  cal.add(Calendar.DATE, 1);
			                  
			                  // Get the date in a format suitable for a select option
			                  String optionValue = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			                  
			                  // Create the select option
			                  out.println("<option value=\"" + optionValue + "\">" + optionValue + "</option>");
			               }
			            %>
			             </select>          
			            
			            <!--체크아웃 셀렉트 박스 end  -->
			        
			         	<br/>
			         <%--지역이나, 호텔이름 관련 키워드로 입력 예정 --%>	
			         <input type="text" value="검색어입력"name="keyword">&nbsp;&nbsp;<input type ="submit" value = "검색">			
				</form>
				<hr>
		</div><!-- main content end -->
		
		
		
		<%--지역별 별점순(내림차순 정렬후) 숙소 추천  배너--%>
		<h5>인기 호텔</h5>
		<section>
			<table border = "1" cellspacing ="0" width="400">
				<c:if test="${!empty hotel_Star_List}">
					
				
				
				
				</c:if>
				<%--등록된 업체가 없을경우 --%>
				<c:if test="${empty hotel_Star_List}">
					<tr>
						<td colspan = "4" align ="center">
							<h3>예약가능숙소가 없습니다.</h3>
						</td>
					</tr>	
				</c:if>
			</table>	
		</section>		
				
		
		
		<hr>
				
				
		
		
		
		<%--지역별  랜덤 숙소 추천 --%>
		<h5>지역별 무작위숙소 추천</h5>
		<section>
			<table border = "1" cellspacing ="0" width="400">		
				<c:if test="${!empty hotel_Random_List}">
					
				
				
				
				</c:if>
				<%--등록된 업체가 없을경우 --%>
				<c:if test="${empty hotel_Random_List}">
						<tr>
							<td colspan = "4" align ="center">
								<h3>예약가능숙소가 없습니다.</h3>
							</td>
						</tr>	
				</c:if>
			</table>
		</section>	
			
			
			
		
		
		
		
		<hr>
		
	
		<jsp:include page="/include/footer.jsp"/>
	
				
			
			
		
		
			


	</div>
</body>
</html>