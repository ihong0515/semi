<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${List }" var="list"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트별 호텔 리뷰</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/crawling/crawling.css">
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
			<c:if test="${empty param.param }">
			<div id="crawling_side1">
				<div id = crawling_title>Hotel Review</div>
				<ul>
					<li>
						<img class="crawling_side_icon" alt="" src="<%=request.getContextPath() %>/image/icon/google.jpg" onclick="location.href='<%=request.getContextPath() %>/crawling_main.do?param=google'">
					</li>
					<li>
						<img class="crawling_side_icon" alt="" src="<%=request.getContextPath() %>/image/icon/naver.jpg" onclick="location.href='<%=request.getContextPath() %>/crawling_main.do?param=naver'">
					</li>
					<li>
						<img class="crawling_side_icon" alt="" src="<%=request.getContextPath() %>/image/icon/nate.jpg" onclick="location.href='<%=request.getContextPath() %>/crawling_main.do?param=nate'">
					</li>
				</ul>
			</div>
			</c:if>
			<c:if test="${!empty param.param }">
			<div id="crawling_side2">
				<ul>
					<li>
						<img class="crawling_side_icon2" alt="" src="<%=request.getContextPath() %>/image/icon/google2.jpg" onclick="location.href='<%=request.getContextPath() %>/crawling_main.do?param=google'">
					</li>
					<li>
						<img class="crawling_side_icon2" alt="" src="<%=request.getContextPath() %>/image/icon/naver2.jpg" onclick="location.href='<%=request.getContextPath() %>/crawling_main.do?param=naver'">
					</li>
					<li>
						<img class="crawling_side_icon2" alt="" src="<%=request.getContextPath() %>/image/icon/nate2.jpg" onclick="location.href='<%=request.getContextPath() %>/crawling_main.do?param=nate'">
					</li>
				</ul>
			</div>
			</c:if>
			<div id="crawling_main">
				<c:if test="${list.size()!=0 }">
				<c:forEach items="${list }" var="dto">
				<div class="crawling_main_content">
					<div class="crawling_main_content_img">
						<c:if test="${Check == 1 }">
							<video src="${dto.getImg() }"  muted="muted" onmouseover="this.play()" ></video>
						</c:if>
						<c:if test="${Check != 1 }">
							<img alt="" src="${dto.getImg() }">
						</c:if>
					</div>
					<div class="crawling_main_content_wrap">
						<div class="crawling_main_content_txt">
							<h5>${dto.getWriter() }</h5>
							<h4><a href="${dto.getLink() }">${dto.getTitle() }</a></h4>
						</div>
						<p>${dto.getContent() }</p>
					</div>
				</div>
				</c:forEach>
				</c:if>
			</div>
    	</div>
    <jsp:include page="../include/footer.jsp" />
  </div>
</body>
</html>