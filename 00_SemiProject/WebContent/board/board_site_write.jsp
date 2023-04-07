<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/board_write.css">
<script type="text/javascript">


	function check() {
		if(f.title.value == "") {
			alert("제목을 입력하세요.")
			f.title.focus();
			return false;
		}
		
		if(f.content.value == "") {
			alert("문의내용을 입력하세요.")
			f.content.focus();
			return false;
		}
	}
	
</script>
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
	    	
	    	<form method="post" name="f" action="<%=request.getContextPath() %>/board_site_write_ok.do" onsubmit="return check()">
	    	
	    	
	    	
	    		<table id="write_list" border="1" cellspacing="0" width="800">
	    			<tr>
	    				<th>제목</th>
	    					<td> <textarea rows="1" cols="100" name="title"></textarea>
	    			 		</td>
	    				</tr>
	    		
	    			<tr>
	    				<th>내용</th>
	    				<td>
	    					<textarea rows="15" cols="100" name="content"></textarea>
	    				</td>
	    			</tr>	
	    		
	    			<tr>
	    				<td colspan="2" align="center">
	    					<input type="submit" value="1:1문의" onclick="site_board_getList()">&nbsp;&nbsp;
	    					<input type="reset" value="취소">
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
    	</div>
    	 <jsp:include page="../include/footer.jsp" />
    	</div>
</body>
</html>