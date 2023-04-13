<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${Dto }" var="dto" />
<c:set value="${HoDto }" var="hoDto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let board_no = "${dto.getInqho_no() }";
	let group_no = "${dto.getInqho_group() }";
	let step_no = "${dto.getInqho_step() }";
	let write_check = "${dto.getInqho_write_check() }";
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/board_hotel_content.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/board/board_hotel_content.js"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<form action="<%=request.getContextPath() %>/board_hotel_modify.do" method="post" onsubmit="return modify_check()" name="form">
		    	<input type="hidden" value="${dto.getInqho_no() }" name="hotel_no">
		    	<div id="board_main">
		    		<table class="board_list">
		    			<tr>
		    				<th style="width: 40px;">
		    					No.
		    				</th>
		    				<td> 
		    					${dto.getInqho_no() }
		    				</td>
		    				<th>
		    					Writer.
		    				</th>
		    				<td style="width: 100px;"> 
		    					${dto.getInqho_writer() }
		    				</td>
		    				<c:if test="${empty dto.getInqho_update() }">
		    				<th style="width: 50px;">
		    					Date.
		    				</th>
		    				<td>
		    					${dto.getInqho_date().substring(0,10) }
		    				</td>
		    				</c:if>
		    				<c:if test="${!empty dto.getInqho_update() }">
		    				<th style="width: 50px;">
		    					UpDate.
		    				</th>
		    				<td>
		    					${dto.getInqho_update().substring(0,10) }
		    				</td>
		    				</c:if>
		    			</tr>
		    			<tr>
		    				<th>
		    					Title.
		    				</th>
		    				<td colspan="3" style="width: 200px;"> 
		    					${dto.getInqho_title() }
		    				</td>
		    				<td colspan="2">
		    					${hoDto.getHotel_name() }
		    				</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					Cont.
		    				</th>
		    			</tr>
		    			<tr>
		    				<td class="board_list_content" colspan="6">
			    				<% pageContext.setAttribute("newLine", "\r\n"); %>
								${fn:replace(dto.getInqho_content(), newLine, '<br/>')}
		    				</td>
		    			</tr>
		    		</table>
		    		<table class="board_list" id="modify_board_list">
		    			<tr>
		    				<th style="width: 40px;">
		    					No.
		    				</th>
		    				<td> 
		    					${dto.getInqho_no() }
		    				</td>
		    				<th>
		    					Writer.
		    				</th>
		    				<td style="width: 100px;"> 
		    					${dto.getInqho_writer() }
		    				</td>
		    				<c:if test="${empty dto.getInqho_update() }">
		    				<th style="width: 50px;">
		    					Date.
		    				</th>
		    				<td>
		    					${dto.getInqho_date().substring(0,10) }
		    				</td>
		    				</c:if>
		    				<c:if test="${!empty dto.getInqho_update() }">
		    				<th style="width: 50px;">
		    					UpDate.
		    				</th>
		    				<td>
		    					${dto.getInqho_update().substring(0,10) }
		    				</td>
		    				</c:if>
		    			</tr>
		    			<tr>
		    				<th>
		    					Title.
		    				</th>
		    				<td colspan="3" style="width: 200px;">
		    					<input type="text" name="hotel_title" value="${dto.getInqho_title() }">
		    				</td>
		    				<td colspan="2">
		    					${hoDto.getHotel_name() }
		    				</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					Cont.
		    				</th>
		    			</tr>
		    			<tr>
		    				<td class="board_list_content" colspan="6">
			    				<textarea cols="" rows="" name="hotel_content">${dto.getInqho_content() }</textarea>
		    				</td>
		    			</tr>
		    		</table>
		    	</div>
		    	
		    	<div class="board_btn" style="display: none;">
	    			<input type="submit" value="수정">&nbsp;&nbsp;
	    			<input type="button" value="삭제" onclick="if(confirm('문의 내용을 삭제합니다.')){delete_hotel() }else{return; }">&nbsp;&nbsp;
	    			<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath() %>/user_board_main.do'">
	    		</div>
	    		<div class="board_btn">
	    			<input type="button" value="편집하기" onclick="modify_content_toggle()">&nbsp;&nbsp;
	    			<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath() %>/user_board_main.do'">
	    		</div>
    		</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>