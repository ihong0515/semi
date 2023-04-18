<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${loginOwner }" var="owner"/>
<c:set value="${hotel_list }" var="ho_list" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let contextPath = "<%=request.getContextPath() %>";
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/owner/js/hotel_list.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/owner/css/hotel_list.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<div id="hotel_open" onclick="open_menu(this)">三</div>
			<div id="hotel_list_hotel" class="hotel_sidebar">
				<span id="hotel_x" onclick="close_menu(this)">X</span>
				<ul>
					<li><input class="insert_btn" type="button" value="호텔 등록" onclick="location.href='<%=request.getContextPath() %>/owner_hotel_insert.do'"></li>
					<li>호텔 목록</li>
					<li>
						<ul>
							<li>
								<select onchange="open_room_list(this)">
									<option value="">:::::::::::::::</option>
									<c:forEach items="${ho_list }" var="ho">
									<option value="${ho.getHotel_no() }">
										${ho.getHotel_name() }
									</option>
									</c:forEach>
								</select>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="hotel_content">
				<h2 id="content_title">호텔을 선택하세요.</h2>
				<table class="result_tb">
					<tr>
						<th>
							호텔 이름
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							주소
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							연락처
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							지역
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							이메일
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							전체 룸 갯수
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							설립연도
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							최저가
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							최고가
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							최저 투숙객
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							최고 투숙객
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							성급
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							해쉬 태그
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<th>
							호텔 정보
						</th>
						<td class="info_insert">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" class="hotel_btn" onclick="location.href='<%=request.getContextPath() %>/owner_hotel_update.do?no='" value="편집">
						</td>
					</tr>
				</table>
				<table class="result_tb">
					<tr>
						<th>
							룸 이름
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							룸 가격
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							침대
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							룸 사이즈
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							최저 투숙객
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							최대 투숙객
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							체크인 시간
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							체크아웃 시간
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<th>
							조식 가능 여부
						</th>
						<td class="info_insert_room"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" class="room_btn" onclick="location.href='<%=request.getContextPath() %>/owner_room_update.do?no='" value="편집">
						</td>
					</tr>
				</table>
			</div>
			<div id="room_open" onclick="open_menu(this)">三</div>
			<div id="hotel_list_room" class="hotel_sidebar">
				<span id="room_x" onclick="close_menu(this)">X</span>
				<ul>
					<li><input class="insert_btn" type="button" value="룸 등록"></li>
					<li>룸 리스트</li>
					<li>
						<select id="room_list" onchange="open_room_content(this)">
							<option value="">:::::::::::</option>
						</select>
					</li>
				</ul>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>