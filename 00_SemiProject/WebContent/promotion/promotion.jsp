<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/slick/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/slick/slick-theme.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/promotion/promotion.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div class="content" align = "center">
			<c:set  var="promotion_list" value = "${Promotion}" />	
			<c:if test="${!empty Promotion}">

	        <h1 class="promotion_title">Promotion</h1>

	        
	        	<script type="text/javascript" src="<%=request.getContextPath()%>/js/slick/slick.js"></script>
	        	<script src="<%=request.getContextPath()%>/js/promotion/promotion.js"></script>

	        	<div class="promotion_list">
	       		 <c:forEach items="${Promotion}" var="dto" varStatus="i">
					<div class="promotion_content">
						<a onclick = "window.open('PromotionContent.do?no=${dto.getProm_no()}','width=100% height=100%')">
						<img class="promotion_image" src="<%=request.getContextPath()%>/image/promotion/${dto.getProm_folder()}/main.jpg" width="100%" height="100%"></a>
						 <div class="post_name">

						 <span class = "promotion_font">${dto.getProm_name()}</span>
						 </div>
						 <div class="post_info">
						 <span class = "promotion_font">${dto.getProm_info()}</span>

						 	${dto.getProm_name()}
						 </div>
						 <div class="post_info">
						 	${dto.getProm_info()}

						 </div> 
					</div><!--promotion content content가 한 슬라이드가 됩니다.  안에는 테이블로 해도 상관은 없을듯. 메인 안에 컨텐츠가 되는 내용의 div 내부 태그는 노상관인듯.  class end  -->
					</c:forEach>
				</div><!--promotion_list  -->

			</c:if>	

			<c:if test="${empty Promotion}">
					<h3>프로모션 정보가 없습니다.</h3>
			</c:if>	
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div><!--container -->
</body>
</html>