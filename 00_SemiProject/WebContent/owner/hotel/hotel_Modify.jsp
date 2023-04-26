<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${Dto }" var="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 정보 수정 페이지</title>
<script type="text/javascript">
	let loc = '${dto.getHotel_location() }';
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/hotel/hotel_modify.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/hotel/hotel_modify.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>호텔 정보 수정 페이지</h2>
			<form action="<%=request.getContextPath() %>/owner_hotel_update_ok.do" method="post" onsubmit="return confirm('호텔 정보를 수정합니다.')" enctype="multipart/form-data">
				<input type="hidden" name="no" id="no" value="${dto.getHotel_no() }">
				<table>
					<tr>
						<th>
							호텔 이름
						</th>
						<td>
							<input value="${dto.getHotel_name() }" name="name">
						</td>
					</tr>
					<tr>
						<th>
							주소
						</th>
						<td>
							<input value="${dto.getHotel_addr() }" name="addr">
						</td>
					</tr>
					<tr>
						<th>
							연락처
						</th>
						<td>
							<input value="${dto.getHotel_phone() }" name="phone">
						</td>
					</tr>
					<tr>
						<th>
							지역
						</th>
						<td>
							<select name="location">
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="강원">강원</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="제주">제주</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>
							이메일
						</th>
						<td>
							<input value="${dto.getHotel_email() }" name="email">
						</td>
					</tr>
					<tr>
						<th>
							전체 룸 갯수
						</th>
						<td>
							<input value="${dto.getHotel_room_count() }" name="count">
						</td>
					</tr>
					<tr>
						<th>
							설립연도
						</th>
						<td>
							<input value="${dto.getHotel_establish() }" name="est">
						</td>
					</tr>
					<tr>
						<th>
							최저가
						</th>
						<td>
							<input value="${dto.getHotel_price_min() }" name="pri_min">
						</td>
					</tr>
					<tr>
						<th>
							최고가
						</th>
						<td>
							<input value="${dto.getHotel_price_max() }" name="pri_max">
						</td>
					</tr>
					<tr>
						<th>
							최저 투숙객
						</th>
						<td>
							<input value="${dto.getHotel_people_min() }" name="peo_min">
						</td>
					</tr>
					<tr>
						<th>
							최고 투숙객
						</th>
						<td>
							<input value="${dto.getHotel_people_max() }" name="peo_max">
						</td>
					</tr>
					<tr>
						<th>
							성급
						</th>
						<td>
							<input value="${dto.getHotel_star() }" name="star">
						</td>
					</tr>
					<tr>
						<th>
							해쉬 태그
						</th>
						<td>
							<c:forEach items="${dto.getHotel_hashtag() }" var="hash">
							<input value="${hash }" name="hashtag"><br>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="info" rows="" cols="">${dto.getHotel_info() }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<img id="main_image" alt="" src="<%=request.getContextPath() %>/image/hotel/${dto.getHotel_photo_folder() }/main.jpg">
							<br><input type="file" name="file">
						</td>
					</tr>
				</table>
				<div id="modify_btn">
					<input type="submit" value="수정">&nbsp;&nbsp;
					<input type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')){hotel_delete()}" value="삭제">&nbsp;&nbsp;
					<input type="button" onclick="list_move()" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
</html>