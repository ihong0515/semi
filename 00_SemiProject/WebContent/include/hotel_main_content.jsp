
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	//날짜 기본 선택창 날짜 오늘 날짜로 설정.
	window.onload = function() {
		document.getElementById('checkIn').value = new Date().toISOString().slice(0, 10);
		
		
		document.getElementById("checkOut").value = new Date(new Date()
								.setDate(new Date().getDate() + 1))
								.toISOString().slice(0, 10);
		
		
		
		
	}
	</script>	
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
						
						<input type = "date" id = "checkIn" name ="checkinDate" value ="">
						
					<!--  -->
					
			            <input type = "date" id = "checkOut" name ="checkoutDate" value ="" >
			            <!--체크아웃 셀렉트 박스 end  -->
			        
			         	<br/>
			         <%--지역이나, 호텔이름 관련 키워드로 입력 예정 --%>	
			         <input type="text" placeholder="지역,숙소명 입력"name="keyword">&nbsp;&nbsp;<input type ="submit" >			
				</form>
				<hr>
		</div><!-- main content end -->


		<%-- 기본 커서 서울에 잡혀 있게 끔 해주자. --%>
		<%--지역별 별점순(내림차순 정렬후) 숙소 추천  배너--%>
		<%--form태그를 안 만들었을 때 어떻게 값들을 전송시킬건지 ? => 파라미터 값을 달아서 보내라 --%>
		<h5>지역별 리스트 별점순 추천 페이징</h5>
			<section>
		<nav><!--상단 우측 로그인 회원가입, 비밀번호 찾기  -->
          <ul>
            <li><a href="hotel_StarSearch.do?Location=서울">서울</a></li><%--클릭에 따라 요청 정보가 다르게 넘어가게.?하고 search.do 뒤로 
            이게 셀렉트 박스 처럼 지역이 딱 잡혀야 하는데.--%>
            <li><a href="hotel_StarSearch.do?Location=경기">경기</a></li>
            <li><a href="hotel_StarSearch.do?Location=강원">강원</a></li>
            <li><a href="hotel_StarSearch.do?Location=전남">전남</a></li>
            <li><a href="hotel_StarSearch.do?Location=전북">전북</a></li>
            <li><a href="hotel_StarSearch.do?Location=충북">충북</a></li>
            <li><a href="hotel_StarSearch.do?Location=충남">충남</a></li>
            <li><a href="hotel_StarSearch.do?Location=경남">경남</a></li>
            <li><a href="hotel_StarSearch.do?Location=경북">경북</a></li>
            <li><a href="hotel_StarSearch.do?Location=제주">제주</a></li>
          </ul>
        </nav>
        
        
		
		<%--지역 정보를 넘기고 해당 테이블에서 별점순 호텔정보를 입력하는 란.
		일단 다 갖고 와서 랜덤 출력.
		해당 지역에 있는 호텔 다 갖고 와야함.
		갖고 와서 랜덤으로 뿌리기--%>
		
		
			
				
		
		
	
			
			<table border = "1" cellspacing ="0" width="400">
				<c:set var="list" value ="${hotel_Star_List}"/>
				<c:if test="${!empty list }">
					<c:forEach items="${list}" var="dto">
				
				
				
				
					<tr>
						<td>
						${dto.getHotel_name()}
						</td>
					</tr>
					
					<tr>
						<td>
						<img alt="" src="<%=request.getContextPath() %>/image/${dto.getHotel_photo_folder() }/main.jpg" width="150px" height="150px">		
						</td>
					</tr>
					
					<tr>
						<td><!--비밀번호 뽑은거 참고  -->
						${dto.getHotel_star()}
						</td>
					</tr>
					
					<tr>
						<th>
						최저가
						</th>
						<td>
						${dto.getHotel_price_min()}
						</td>
					</tr>
					</c:forEach>
				
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
            <li><a href="hotel_RandomSearch.do?Location=서울">서울</a></li><%--클릭에 따라 요청 정보가 다르게 넘어가게. --%>
            <li><a href="hotel_RandomSearch.do?Location=경기">경기</a></li>
            <li><a href="hotel_RandomSearch.do?Location=강원">강원</a></li>
            <li><a href="hotel_RandomSearch.do?Location=전남"></a></li>
            <li><a href="hotel_RandomSearch.do?Location=전북">전북</a></li>
            <li><a href="hotel_RandomSearch.do?Location=충북">충북</a></li>
            <li><a href="hotel_RandomSearch.do?Location=충남">충남</a></li>
            <li><a href="hotel_RandomSearch.do?Location=경남">경남</a></li>
            <li><a href="hotel_RandomSearch.do?Location=경북">경북</a></li>
            <li><a href="hotel_RandomSearch.do?Location=서울">제주</a></li>
          </ul>
        </nav>
        
        
		<%--지역별  랜덤 숙소 추천 --%>
		<%--5개만 뽑는데 db를 랜덤으로 뽑는 법? --%>
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