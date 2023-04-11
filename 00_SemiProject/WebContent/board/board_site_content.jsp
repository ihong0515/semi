<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${Board_site }" var="dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/board_site_content.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
	    	<div id="board_main">
	    		<table id=board_list>
	    			<tr>
	    				<th style="width: 40px;">
	    					No.
	    				</th>
	    				<td> 
	    					${dto.getInqsi_no() }
	    				</td>
	    				<th>
	    					Writer.
	    				</th>
	    				<td style="width: 100px;"> 
	    					${dto.getInqsi_writer() }
	    				</td>
	    				<c:if test="${empty dto.getInqsi_update() }">
	    				<th style="width: 50px;">
	    					Date.
	    				</th>
	    				<td>
	    					${dto.getInqsi_date().substring(0,10) }
	    				</td>
	    				</c:if>
	    				<c:if test="${!empty dto.getInqsi_update() }">
	    				<th style="width: 50px;">
	    					UpDate.
	    				</th>
	    				<td>
	    					${dto.getInqsi_update().substring(0,10) }
	    				</td>
	    				</c:if>
	    			</tr>
	    			<tr>
	    				<th>
	    					Title.
	    				</th>
	    				<td colspan="5" style="width: 200px;"> 
	    					${dto.getInqsi_title() }
	    				</td>
	    			</tr>
	    			<tr>
	    				<th>
	    					Cont.
	    				</th>
	    			</tr>
	    			<tr>
	    				<td colspan="6">
		    				<% pageContext.setAttribute("newLine", "\r\n"); %>
							${fn:replace(dto.getInqsi_content(), newLine, '<br/>')}
	    				</td>
	    			</tr>
	    		</table>
	    		<div>
	    			<input type="button" value="편집하기" onclick="location.href='<%=request.getContextPath() %>/board_site_modify.do?board_no=${dto.getInqsi_no() }'">
	    		</div>
	    	</div>
    	</div>
    	<jsp:include page="../include/footer.jsp" />
    </div>
</body>
</html>