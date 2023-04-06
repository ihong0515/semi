<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/board_main.css">
<script type="text/javascript">
	let p_path = "<%=request.getContextPath() %>";
	let user_no = "${loginUser.getUser_no() }";
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/board/board_main.js"></script>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
	    	<div id="board_sidebar">
	    		<input type="button" value="사이트 문의" id="site_board" onclick="site_board_getList()">	    		
	    		<br>
	    		<br>
	    		<input type="button" value="호텔 문의" id="hotel_board" onclick="hotel_board_getList()">
	    	</div>
	    	<div id="board_main">
	    		<div id="board_write_btn">
	    			<input type="button" value="문의하기" onclick="if(confirm('사이트에 문의사항을 작성하러 가시겠습니까.')){location.href='<%=request.getContextPath() %>/board_site_write.do'} else{return false; }">
	    		</div>
	    		<table id=board_list>
	    			<tr>
	    				<th style="width: 40px;">
	    					No.
	    				</th>
	    				<th style="width: 200px;">
	    					Title.
	    				</th>
	    				<th style="width: 100px;">
	    					Writer.
	    				</th>
	    				<th style="width: 50px;">
	    					Date.
	    				</th>
	    			</tr>
	    			<tr>
	    				<th colspan="5">
	    					버튼을 눌러 게시물을 불러오세요.
	    				</th>
	    			<tr>
	    		</table>
	    		<div id="board_navi">
	    		<input type="hidden" value="" id="page_li_lastPage">
	    			<ul class='board_navi_page' id="board_navi_site">
		    			<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList()">&#171;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList('-1')">&#60;</a>
						</li>
						<li class="page_li">
							<a class="page-link" id="page_li_now_site">1</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList('+1')">&#62;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList('+10')">&#187;</a>
						</li>
					</ul>
					<ul class='board_navi_page' id="board_navi_hotel">
		    			<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList()">&#171;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList('-1')">&#60;</a>
						</li>
						<li class="page_li">
							<a class="page-link" id="page_li_now_hotel">1</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList('+1')">&#62;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList('+10')">&#187;</a>
						</li>
					</ul>
	    		</div>
	    	</div>
    	</div>
    	<jsp:include page="../include/footer.jsp" />
    </div>
</body>
</html>