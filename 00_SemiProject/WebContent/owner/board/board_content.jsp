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
	   				<th style="width: 40px;">
	   					No.
	   				</th>
	   				<td style="width: 40px;"> 
	   					${dto.getInqho_no() }
	   				</td>
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
	   					${dto.getInqho_date().substring(5,10) }
	   				</td>
	   			</tr>
	   			<tr>
	   				<th>
	   					제목
	   				</th>
	   				<td style="width: 200px;"> 
	   					${dto.getInqho_title() }
	   				</td>
	   				<th>
	   					hotel
	   				</th>
	   				<td>
	   					${hoDto.getHotel_name() }
	   				</td>
	   				<th style="width: 50px;">
	   					갱신일
	   				</th>
	   				<td style="width: 50px;">
	   					${dto.getInqho_update().substring(5,10) }
	   				</td>
	   			</tr>
	   			<tr>
	   				<th colspan="6">
	   					문의내용
	   				</th>
	   			</tr>
	   			<tr>
	   				<td class="board_list_content" colspan="6">
	    				<% pageContext.setAttribute("newLine", "\r\n"); %>
						  ${fn:replace(dto.getInqho_content(), newLine, '<br/>')}
	   				</td>
	   			</tr>
	   		</table>
	   		<div>
	   			<table id="answer">
	   				<tr>
	   					<th colspan="2">${owner.getOwner_name() }</th>
	   					<th colspan="4"><input type="text" name="title" placeholder="제목 입력"></th>
	   				</tr>
	   				<tr>
	   					<td colspan="2">
	   						
	   					</td>
	   				</tr>
	   			</table>
   			</div>
		</div>
	</div>
</body>
</html>
