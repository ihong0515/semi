<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_list.jsp</title>
</head>
<body>

	<table border="1" cellspacing="0" width="400">
		<tr>
			<th>user_no</th>
			<th>user_name</th>
			<th>user_phone</th>
			<th>user_birth</th>
			<th>user_email</th>
			<th>user_egion</th>
			<th>user_reservation</th>
			<th>user_pwd</th>
			<th>user_id</th>
		</tr>
		<c:set var="list" value="${List }"/>
		<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.getUser_no() } </td>
						<td> ${dto.getUser_name() } </td>
						<td> ${dto.getUser_phone() } </td>
						<td> ${dto.getUser_birth() } </td>
						<td> ${dto.getUser_email() } </td>
						<td> ${dto.getUser_egion() } </td>
						<td> ${dto.getUser_reservation() } </td>
						<td> ${dto.getUser_pwd() } </td>
						<td> ${dto.getUser_id() } </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>전체 게시물 리스트가 없습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
			
	</table>

</body>
</html>