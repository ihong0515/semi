<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${Dto }" var="dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/board/reply_modify.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>${dto.getInqho_writer() }에 대한 문의 사항</h2>
			<table>
				<tr>
					<th>
						제목
					</th>
					<td>
						<input type="text" value="${dto.getInqho_title() }">
					</td>
				</tr>
				<tr>
					<th>
						내용
					</th>
					<td>
						<textarea id="cont" rows="" cols="">${dto.getInqho_content() }</textarea>
					</td>
				</tr>
			</table>
			<div class="button_div">
				<input type="submit" value="수정">
				<input type="button" value="삭제">
			</div>
		</div>
	</div>
</body>
</html>