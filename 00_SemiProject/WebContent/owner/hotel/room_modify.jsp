<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${Dto }" var="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/room_modify.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/room_modify.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<form action="<%=request.getContextPath() %>/owner_room_update_ok.do" method="post" enctype="multipart/form-data">
				<h2> ${dto.getRoom_name() }</h2>
				<table>
					<tr>
						<th>
							룸 이름
						</th>
						<td>
							<input type="text" value="${dto.getRoom_name() }" name="name">
						</td>
					</tr>
					<tr>
						<th>
							룸 가격
						</th>
						<td>
							<input type="text" value="${dto.getRoom_price() }" name="pri">
						</td>
					</tr>
					<tr>
						<th>
							룸 침대
						</th>
						<td>
							<input type="text" value="${dto.getRoom_bed() }" name="bed">
						</td>
					</tr>
					<tr>
						<th>
							룸 사이즈
						</th>
						<td>
							<input type="text" value="${dto.getRoom_size() }" name="size">
						</td>
					</tr>
					<tr>
						<th>
							최저 투숙객
						</th>
						<td>
							<input type="text" value="${dto.getRoom_people_min() }" name="peo_min">
						</td>
					</tr>
					<tr>
						<th>
							최대 투숙객
						</th>
						<td>
							<input type="text" value="${dto.getRoom_people_max() }" name="peo_max">
						</td>
					</tr>
					<tr>
						<th>
							체크인 시간
						</th>
						<td>
							<input type="text" value="${dto.getRoom_checkin() }" name="in">
						</td>
					</tr>
					<tr>
						<th>
							체크아웃 시간
						</th>
						<td>
							<input type="text" value="${dto.getRoom_checkout() }" name="out">
						</td>
					</tr>
					<tr>
						<th>
							조식 여부
						</th>
						<td>
							<input type="text" value="${dto.getRoom_breakfast() }" name="bf">
						</td>
					</tr>
					<tr>
						<th colspan="2">
							사진 파일을 압축파일로 첨부하세요.
						</th>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" name="file">
						</td>
					</tr>
				</table>
				<div id="img_wrap">
					<c:forEach begin="1" end="${dto.getRoom_photo_folder_size() }" var="i">
					<img class="room_img" alt="" src="<%=request.getContextPath() %>/image/hotel/${dto.getRoom_photo_folder() }/${i }.jpg">
					</c:forEach>
				</div>
				<div>
					<input type="hidden" value="${dto.getRoom_no() }" name="no"> 
					<input type="submit" value="수정">&nbsp;&nbsp;
					<input type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='<%=request.getContextPath() %>/owner_room_delete.do?no=${dto.getRoom_no() }'}" value="삭제">&nbsp;&nbsp;
					<input type="button" onclick="list_move()" value="목록">
				</div>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>