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
	<div align ="center">	<!-- main content start-->
				<form  method = "post" action="<%=request.getContextPath()%>/hotel_Search.do">
					<!--지역선택 selectbox  -->
					지역<select name = "location">
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
			         <input type="text" placeholder="지역,숙소명 입력"name="keyword">&nbsp;&nbsp;<input type ="submit" >			
				</form>
				<hr>
		</div><!-- main content end -->
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		<%--지역별 별점순(내림차순 정렬후) 숙소 추천  배너--%>
		<%--form태그를 안 만들었을 때 어떻게 값들을 전송시킬건지 ? => 파라미터 값을 달아서 보내라 --%>
		<h5>지역별 리스트 별점순 추천 페이징</h5>
			<section>
		<nav><!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
          <ul>
            <li><a href="">서울</a></li><%--클릭에 따라 요청 정보가 다르게 넘어가게.?하고 search.do 뒤로 
            이게 셀렉트 박스 처럼 지역이 딱 잡혀야 하는데.--%>
            <li><a href="">경기</a></li>
            <li><a href="">강원</a></li>
            <li><a href="">전남</a></li>
            <li><a href="">전북</a></li>
            <li><a href="">충북</a></li>
            <li><a href="">충남</a></li>
            <li><a href="">경남</a></li>
            <li><a href="">경북</a></li>
            <li><a href="">제주</a></li>
          </ul>
        </nav>
        
        
		
		<%--지역 정보를 넘기고 해당 테이블에서 별점순 호텔정보를 입력하는 란.
		일단 다 갖고 와서 랜덤 출력.
		해당 지역에 있는 호텔 다 갖고 와야함.
		갖고 와서 랜덤으로 뿌리기--%>
		<form name = "hotel_Star_List_form" method = "post" action="hotel_StarSearch.do">
			<input type="hidden" name="hotel_StarSearch_Location" value = "서울">
			<%--버튼 누른 값이 이 구역의 value로 넘어 오게 설정.버튼에 따라서 value지역명이 바뀌도록 --%>
			
		</form>
		
			
				
		
		
	
			
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
		
		
		<h5>지역별 무작위숙소 추천</h5>
		<section>
		<nav>
          <ul><%--기본 커서는 서울에  가있어야 함. --%>
            <li><a href="">서울</a></li><%--클릭에 따라 요청 정보가 다르게 넘어가게. --%>
            <li><a href="">경기</a></li>
            <li><a href="">강원</a></li>
            <li><a href="">전남</a></li>
            <li><a href="">전북</a></li>
            <li><a href="">충북</a></li>
            <li><a href="">충남</a></li>
            <li><a href="">경남</a></li>
            <li><a href="">경북</a></li>
            <li><a href="">제주</a></li>
          </ul>
        </nav>
        
        <form name = "hotel_Random_List_form" method = "post" action="hotel_Randomsearch.do?">
			<input type="hidden" name="hotel_RandomSearch">
			<%--버튼 누른 값이 이 구역의 value로 넘어 오게 설정. --%>
		</form>
		<%--지역별  랜덤 숙소 추천 --%>
	
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
				
				
		
		
		
		
			
			
			
</body>
</html>