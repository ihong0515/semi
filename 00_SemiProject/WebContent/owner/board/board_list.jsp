<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${hotel_list }" var="ho_list"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 1:1문의 확인</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/board/board_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/board/board_list.js"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>호텔 1:1문의 확인</h2>
			<div id="content_main">
				<select id="select_hotel" onchange="get_hotel_cont(this)">
					<option value="">::::::::호텔::::::::</option>
					<c:forEach items="${ho_list }" var="ho">
					<option value="${ho.getHotel_no() }">
						${ho.getHotel_name() }
					</option>
					</c:forEach>
				</select>
				<table id="result">
					<tr>
						<th style="width: 40px;">
							No.
						</th>
						<th style="width: 200px;">
							Title.
						</th>
						<th style="width: 100px;">
							Write.
						</th>
						<th style="width: 100px;">
							Date.
						</th>
					</tr>
					<tr></tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>