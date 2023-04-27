<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔등록페이지</title>
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
						<td colspan="2">
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<th>
							주소
						</th>
						<td colspan="2">
							<input type="text" name="addr">
						</td>
					</tr>
					<tr>
						<th>
							연락처
						</th>
						<td colspan="2">
							<input type="text" name="phone" maxlength="3" value="010" id="phone_head">&nbsp;-&nbsp;<input type="text" name="phone" placeholder="0000" maxlength="4" id="phone_middle">&nbsp;-&nbsp;<input type="text" name="phone" placeholder="0000" maxlength="4" id="phone_foot">
						</td>
					</tr>
					<tr>
						<th>
							지역
						</th>
						<td colspan="2">
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
						<td colspan="2">
							<input type="text" name="email">
						</td>
					</tr>
					<tr>
						<th>
							객실 수
						</th>
						<td colspan="2">
							<input type="text" name="count">
						</td>
					</tr>
					<tr>
						<th>
							설립연도
						</th>
						<td colspan="2">
							<input type="text" name="est">
						</td>
					</tr>
					<tr>
						<th>
							최저가
						</th>
						<td colspan="2">
							<input type="text" name="pri_min">
						</td>
					</tr>
					<tr>
						<th>
							최고가
						</th>
						<td colspan="2">
							<input type="text" name="pri_max">
						</td>
					</tr>
					<tr>
						<th>
							최저 투숙객
						</th>
						<td colspan="2">
							<input type="text" name="peo_min">
						</td>
					</tr>
					<tr>
						<th>
							최고 투숙객
						</th>
						<td colspan="2">
							<input type="text" name="peo_max">
						</td>
					</tr>
					<tr>
						<th>
							성급
						</th>
						<td colspan="2">
							<input type="number" min="1" max="5" name="star">
						</td>
					</tr>
					<tr>
						<th>
							해쉬 태그
						</th>
						<td colspan="2">
							<input type="text" name="hashtag" class="hashtag"><br>
							<input type="text" name="hashtag" class="hashtag"><br>
							<input type="text" name="hashtag" class="hashtag">
						</td>
					</tr>
					<tr align="left">
						<th>
							<input type="checkbox" name="wifi" id="wifi">&nbsp;<label for="wifi">와이파이</label>
						</th>
						<th>
							<input type="checkbox" name="park" id="park">&nbsp;<label for="park">주차</label>
						</th>
						<th>
							<input type="checkbox" name="tub" id="tub">&nbsp;<label for="tub">욕조</label>
						</th>
					</tr>
					<tr align="left">
						<th>
							<input type="checkbox" name="pool" id="pool">&nbsp;<label for="pool">수영장</label>
						</th>
						<th>
							<input type="checkbox" name="rest" id="rest">&nbsp;<label for="rest">식당</label>
						</th>
						<th>
							<input type="checkbox" name="fit" id="fit">&nbsp;<label for="fit">헬스장</label>
						</th>
					</tr>
					<tr align="left">
						<th>
							<input type="checkbox" name="bar" id="bar">&nbsp;<label for="bar">바</label>
						</th>
						<th>
							<input type="checkbox" name="tera" id="tera">&nbsp;<label for="tera">테라스</label>
						</th>
						<th>
							<input type="checkbox" name="sau" id="sau">&nbsp;<label for="sau">사우나</label>
						</th>
					</tr>
					<tr>
						<td colspan="3">
							<textarea name="info" rows="" cols="" placeholder="호텔 정보"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3">
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
	</div>
</body>
</html>