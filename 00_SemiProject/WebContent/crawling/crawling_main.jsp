<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${List }" var="list"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#content{
		display: flex;
		justify-content: flex-start;
	}
	#crawling_side{
		width: 100px;
	}
	#crawling_side ul{
		padding: 0;
	}
	#crawling_side ul li{
		list-style: none;
		height: 100px;
	}
	#crawling_main{
		margin-left: 100px;
		display: flex;
		justify-content: space-around;
		flex-wrap: wrap;
	}
	.crawling_main_content{
		display: flex;
		flex-direction: column;
		text-align: center;
		width: 40%;
		border-bottom: 1px solid #c0c0c0; 
		margin: 50px 30px;
	}
	.crawling_main_content p{
		text-align: center;
	}
	.crawling_main_content_wrap{
	}
	.crawling_main_content_txt{
		padding: 15px;
	}
	.crawling_main_content_txt h5{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		width: 150px;
		margin: auto;
	}
	
	.crawling_side_icon{
		width: 50px;
		height: 50px;
		border-radius: 7px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
			<div id="crawling_side">
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
			<div id="crawling_main" style="width:1000px">
				<c:if test="${list.size()!=0 }">
				<c:forEach items="${list }" var="dto">
				<div class="crawling_main_content">
					<div class="crawling_main_content_wrap">
						<div class="crawling_main_content_img">
							<c:if test="${Check == 1 }">
							<video src="${dto.getImg() }" style="width: 150px; height: 150px;" muted="muted" onmouseover="this.play()"></video>
							</c:if>
							<c:if test="${Check != 1 }">
							<img alt="" src="${dto.getImg() }" style="width: 150px; height: 150px;">
							</c:if>
						</div>
						<div class="crawling_main_content_txt">
							<h5>${dto.getWriter() }</h5>
							<h4><a href="${dto.getLink() }">${dto.getTitle() }</a></h4>
						</div>
					</div>
					<p>${dto.getContent() }</p>
				</div>
				</c:forEach>
				</c:if>
			</div>
    	</div>
    	<jsp:include page="../include/footer.jsp" />
    </div>
</body>
</html>