<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실등록페이지</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/hotel/room_insert.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/hotel/room_insert.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<form action="<%=request.getContextPath() %>/owner_room_insert_ok.do" method="post" onsubmit="return insert_check()" name="f" enctype="multipart/form-data">
				<h2>${Dto.getHotel_name() }의 객실 등록 페이지</h2>
				<input type="hidden" value="${Dto.getHotel_no() }" name="ho_no">
				<table>
					<tr>
						<th>
							룸 이름
						</th>
						<td>
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<th>
							룸 가격
						</th>
						<td>
							<input type="text" name="pri">
						</td>
					</tr>
					<tr>
						<th>
							룸 침대
						</th>
						<td>
							<input type="text" name="bed">
						</td>
					</tr>
					<tr>
						<th>
							룸 사이즈
						</th>
						<td>
							<input type="text" name="size" placeholder="24">
						</td>
					</tr>
					<tr>
						<th>
							최저 투숙객
						</th>
						<td>
							<input type="text" name="peo_min">
						</td>
					</tr>
					<tr>
						<th>
							최대 투숙객
						</th>
						<td>
							<input type="text" name="peo_max">
						</td>
					</tr>
					<tr>
						<th>
							체크인 시간
						</th>
						<td>
							<input type="text" name="in" placeholder="24시 기준 시간만 입력">
						</td>
					</tr>
					<tr>
						<th>
							체크아웃 시간
						</th>
						<td>
							<input type="text" name="out" placeholder="24시 기준 시간만 입력">
						</td>
					</tr>
					<tr>
						<th>
							조식 여부
						</th>
						<td>
							<input type="text" name="bf" placeholder="Y or N">
						</td>
					</tr>
					<tr>
						<th colspan="2">
							사진 파일을 압축파일로 첨부하세요.(10MB)
						</th>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" name="file">
						</td>
					</tr>
				</table>
				<div id="button_div">
					<input type="submit" value="등록">
					<input type="button" onclick="list_move()" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
</body>
</html>