<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/hotel/hotel_insert.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/hotel/hotel_insert.js"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>호텔 등록 페이지</h2>
			<form action="<%=request.getContextPath() %>/owner_hotel_insert_ok.do" method="post" onsubmit="return insert_check()" name="f" enctype="multipart/form-data">
				<table>
					<tr>
						<th>
							호텔 이름
						</th>
						<td>
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<th>
							주소
						</th>
						<td>
							<input type="text" name="addr">
						</td>
					</tr>
					<tr>
						<th>
							연락처
						</th>
						<td>
							<input type="text" name="phone" placeholder="010">-<input type="text" name="phone" placeholder="0000">-<input type="text" name="phone" placeholder="0000">
						</td>
					</tr>
					<tr>
						<th>
							지역
						</th>
						<td>
							<input type="text" name="location">
						</td>
					</tr>
					<tr>
						<th>
							이메일
						</th>
						<td>
							<input type="text" name="email">
						</td>
					</tr>
					<tr>
						<th>
							객실 수
						</th>
						<td>
							<input type="text" name="count">
						</td>
					</tr>
					<tr>
						<th>
							설립연도
						</th>
						<td>
							<input type="text" name="est">
						</td>
					</tr>
					<tr>
						<th>
							최저가
						</th>
						<td>
							<input type="text" name="pri_min">
						</td>
					</tr>
					<tr>
						<th>
							최고가
						</th>
						<td>
							<input type="text" name="pri_max">
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
							최고 투숙객
						</th>
						<td>
							<input type="text" name="peo_max">
						</td>
					</tr>
					<tr>
						<th>
							성급
						</th>
						<td>
							<input type="number" min="1" max="5" name="star">
						</td>
					</tr>
					<tr>
						<th>
							해쉬 태그
						</th>
						<td>
							<input type="text" name="hashtag"><br>
							<input type="text" name="hashtag"><br>
							<input type="text" name="hashtag">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="info" rows="" cols="" placeholder="호텔 정보"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" name="file">
						</td>
					</tr>
				</table>
				<div id="modify_btn">
					<input value="등록" type="submit">&nbsp;&nbsp;
					<input type="button" onclick="list_move()" value="목록">
				</div>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>