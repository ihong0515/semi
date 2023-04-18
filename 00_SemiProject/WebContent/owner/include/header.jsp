<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const contextPath = '<%=request.getContextPath() %>';
	function list_move(){
		location.href=contextPath+'/owner_hotel_list.do';
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/header.css">
</head>
<body>
	<div id="header">
		<c:if test="${!empty loginOwner }">
		<ul>
			<li>
				<a href="<%=request.getContextPath() %>/owner_hotel_list.do">호텔 관리</a>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/owner_board_list.do">1:1 문의 관리</a>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/owner_manage_mein.do">마이페이지</a>
			</li>
			<li>
				<a href="javascript:if(confirm('로그아웃 하시겠습니까?')){location.href='<%=request.getContextPath() %>/owner_logout.do'}">로그아웃</a>
			</li>
		</ul>
		<hr>
		</c:if>
	</div>
</body>
</html>