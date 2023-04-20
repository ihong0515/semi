<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${Dto }" var="dto"/>
<c:set value="${Hotel }" var="hotel"/>
<c:set value="${loginOwner }" var="owner" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/board/board_content.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>${hotel.getHotel_name() }에 대한 문의 사항입니다.</h2>
			<table class="board_list">
	   			<tr>
	   				<th>
	   					작성자
	   				</th>
	   				<td style="width: 100px;"> 
	   					${dto.getInqho_writer() }
	   				</td>
	   				<th style="width: 50px;">
	   					작성일
	   				</th>
	   				<td style="width: 100px;">
	   					${dto.getInqho_date().substring(0,10) }
	   				</td>
	   			</tr>
	   			<tr>
	   				<th>
	   					제목
	   				</th>
	   				<td style="width: 200px;"> 
	   					${dto.getInqho_title() }
	   				</td>
	   				<th style="width: 50px;">
	   					갱신일
	   				</th>
	   				<td style="width: 50px;">
	   					${dto.getInqho_update().substring(0,10) }
	   				</td>
	   			</tr>
	   			<tr>
	   				<th colspan="4">
	   					문의내용
	   				</th>
	   			</tr>
	   			<tr>
	   				<td class="board_list_content" colspan="4">
	    				<% pageContext.setAttribute("newLine", "\r\n"); %>
						  ${fn:replace(dto.getInqho_content(), newLine, '<br/>')}
	   				</td>
	   			</tr>
	   		</table>
	   		<c:if test="${dto.getInqho_step()!=1 }">
	   		<div class="button_div">
	   			<input type="button" value="편집" onclick="location.href='<%=request.getContextPath() %>/owner_board_modify.do?no=${dto.getInqho_no() }'">
	   			<input type="button" value="목록" onclick="board_move()">
	   		</div>
	   		</c:if>
	   		<c:if test="${dto.getInqho_step()==1 }">
	   		<form action="<%=request.getContextPath() %>/owner_reply_insert.do" method="post" id="reply" onsubmit="">
	   			<h3>문의내역 답글달기</h3>
	   			<div id="reply_main">
	   				<div id="reply_title">
	   					제목 : <input type="text" name="title" value="└>RE: ${dto.getInqho_title() }">
	   				</div>
	   				<div id="reply_body">
	   					<textarea id="cont" name="cont" rows="" cols="" placeholder="내용"></textarea>
	   				</div>
	   				<div id="reply_foot" class="button_div">
	   					<input type="hidden" value="${hotel.getHotel_name() }" name="ho_name" >
	   					<input type="hidden" value="${hotel.getHotel_no() }" name="ho_no" >
	   					<input type="hidden" value="${dto.getInqho_group() }" name="group" >
	   					<input type="hidden" value="${dto.getInqho_userno() }" name="user_no" >
	   					<input type="submit" value="답글 등록">&nbsp;&nbsp;
	   					<input type="button" value="목록" onclick="board_move()">
	   				</div>
	   			</div>
   			</form>
   			</c:if>
		</div>
	</div>
</body>
</html>
