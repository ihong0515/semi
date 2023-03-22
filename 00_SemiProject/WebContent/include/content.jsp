<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<div align ="center">	
		<form  method = "post" action="<%=request.getContextPath()%>/search.do">
			<!--지역선택 selectbox  -->
			지역<select name = "location">
					<option value = "seoul">서울</option>
					<option value = "jeju">경기</option>
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
	               java.util.Date currentDate = new java.util.Date();
	               
	               // Create a Calendar object
	               java.util.Calendar cal = java.util.Calendar.getInstance();
	               
	               // Set the calendar to the current date
	               cal.setTime(currentDate);
	               
	               // Loop through the next 30 days
	               for (int i = 0; i < 30; i++) {
	                  // Add one day to the calendar
	                  cal.add(java.util.Calendar.DATE, 1);
	                  
	                  // Get the date in a format suitable for a select option
	                  String optionValue = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	                  
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
	               // Get the current date
	               java.util.Date checkoutDate = new java.util.Date();
	               
	               // Create a Calendar object
	               java.util.Calendar cal2 = java.util.Calendar.getInstance();
	               
	               // Set the calendar to the current date
	               cal2.setTime(checkoutDate);
	               
	               // Loop through the next 30 days
	               for (int i = 0; i < 30; i++) {
	                  // Add one day to the calendar
	                  cal2.add(java.util.Calendar.DATE, 1);
	                  
	                  // Get the date in a format suitable for a select option
	                  String optionValue = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	                  
	                  // Create the select option
	                  out.println("<option value=\"" + optionValue + "\">" + optionValue + "</option>");
	               }
	            %>
	             </select>          
	            
	            <!--체크아웃 셀렉트 박스 end  -->
	        
	         <br/>
	         <input type="text" value="검색어입력"name="keyword">&nbsp;&nbsp;<input type ="submit" value = "검색">			
				
			
			
		
		
			
		
		</form>
	</div>	
</body>
</html>