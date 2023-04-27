<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${Dto }" var="dto" />
<c:set value="${HoDto }" var="hoDto" />
<c:set value="${O_dto }" var="o_dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의-호텔</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
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
		    				<th style="width: 100px;">
		    					작성자
		    				</th>
		    				<td> 
		    					${dto.getInqho_writer() }
		    				</td>
		    				<c:if test="${empty dto.getInqho_update() }">
		    				<th style="width: 100px;">
		    					작성일&nbsp;<i class="fa fa-calendar" aria-hidden="true"></i>
		    				</th>
		    				<td style="width: 150px;">
		    					${dto.getInqho_date().substring(0,10) }
		    				</td>
		    				</c:if>
		    				<c:if test="${!empty dto.getInqho_update() }">
		    				<th style="width: 100px;">
		    					갱신일&nbsp;<i class="fa fa-calendar" aria-hidden="true"></i>
		    				</th>
		    				<td style="width: 150px;">
		    					${dto.getInqho_update().substring(0,10) }
		    				</td>
		    				</c:if>
		    			</tr>
		    			<tr>
		    				<th style="width: 100px;">
		    					제목
		    				</th>
		    				<td> 
		    					${dto.getInqho_title() }
		    				</td>
		    				<th style="width: 100px;">
		    					hotel
		    				</th>
		    				<td style="width: 150px;">
		    					${hoDto.getHotel_name() }
		    				</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					<i class="fa fa-comments-o" aria-hidden="true"></i>&nbsp;문의내역
		    				</th>
		    			</tr>
		    			<tr>
		    				<td class="board_list_content" colspan="4">
		    					<c:if test="${!empty o_dto }">
		    					<% pageContext.setAttribute("newLine", "\r\n"); %>
								${fn:replace(o_dto.getInqho_content(), newLine, '<br/>')}
		    					<br><br>
		    					<hr><br>
		    					&nbsp;&nbsp;&nbsp;└>RE: <br>
		    					</c:if>
			    				<p style="padding-left: 20px;">
								${fn:replace(dto.getInqho_content(), newLine, '<br/>')}</p>
								
								<c:if test="${!empty o_dto }">
								<br><br>
		    					<hr><br>
								<span style="opacity: 0.4;">※자세한 문의 사항은 ${hoDto.getHotel_phone() }으로 연락 바랍니다.</span>
								</c:if>
		    				</td>
		    			</tr>
		    		</table>
		    		<table class="board_list" id="modify_board_list">
		    			<tr>
		    				<td colspan="4"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>
		    				&nbsp;변경사항을 입력해주세요.&nbsp;
		    				<i class="fa fa-exclamation-circle" aria-hidden="true"></i></td>
		    			</tr>
		    			<tr>
		    				<th style="width: 100px;">
		    					작성자
		    				</th>
		    				<td> 
		    					${dto.getInqho_writer() }
		    				</td>
		    				<c:if test="${empty dto.getInqho_update() }">
		    				<th style="width: 100px;">
		    					작성일&nbsp;<i class="fa fa-calendar" aria-hidden="true"></i>
		    				</th>
		    				<td style="width: 150px;">
		    					${dto.getInqho_date().substring(0,10) }
		    				</td>
		    				</c:if>
		    				<c:if test="${!empty dto.getInqho_update() }">
		    				<th style="width: 100px;">
		    					갱신일&nbsp;<i class="fa fa-calendar" aria-hidden="true"></i>
		    				</th>
		    				<td style="width: 150px;">
		    					${dto.getInqho_update().substring(0,10) }
		    				</td>
		    				</c:if>
		    			</tr>
		    			<tr>
		    				<th style="width: 100px;">
		    					제목
		    				</th>
		    				<td>
		    					<input type="text" name="hotel_title" value="${dto.getInqho_title() }">
		    				</td>
		    				<th style="width: 100px;">
		    					hotel
		    				</th>
		    				<td style="width: 150px;">
		    					${hoDto.getHotel_name() }
		    				</td>
		    			</tr>
		    			<tr>
		    				<th>
		    					<i class="fa fa-comments-o" aria-hidden="true"></i>&nbsp;문의내역
		    				</th>
		    			</tr>
		    			<tr>
		    				<td class="board_list_content" colspan="4">
			    				<textarea cols="" rows="" name="hotel_content">${dto.getInqho_content() }</textarea>
		    				</td>
		    			</tr>
		    		</table>
		    	</div>
		    	<c:if test="${empty o_dto||loginUser.getUser_no()==1 }">
		    	<div class="board_btn" style="display: none;">
	    			<input type="submit" value="수정">&nbsp;&nbsp;
	    			<input type="button" value="삭제" onclick="if(confirm('문의 내용을 삭제합니다.')){delete_hotel() }else{return; }">&nbsp;&nbsp;
	    			<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath() %>/user_board_main.do'">
	    		</div>
	    		<div class="board_btn">
	    			<input type="button" value="편집하기" onclick="modify_content_toggle()">&nbsp;&nbsp;
	    			<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath() %>/user_board_main.do'">
	    		</div>
	    		</c:if>
	    		<c:if test="${!empty o_dto&&loginUser.getUser_no()!=1 }">
	    		<div class="board_btn">
	    			<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath() %>/user_board_main.do'">
	    		</div>
	    		</c:if>
    		</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>