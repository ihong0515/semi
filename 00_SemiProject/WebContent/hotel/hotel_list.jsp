<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="hotel_list" value="${Hotel_List }" />
<c:set var="user" value="${sessionScope.loginUser }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 리스트</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/hotel/hotel_list.js" ></script>
<link href="<%=request.getContextPath() %>/css/hotel/hotel_list.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<div id="sidebar">
				<form id="sidebar_form" action="<%=request.getContextPath() %>/hotel_search_detail.do" method="post">
					<div id="sidebar_form_buttons">
						<input id="sidebar_form_button" type="submit" value="세부검색">
						<input id="sidebar_form_cancel" type="reset" value="선택 해제">
					</div>
					<div class="range_slider">
						<span class = "range_slider_title">price range</span>
						<br>
						<span>
							<input class="range_number" type="number" value="0" min="0" max="1000000" name="price_min">~
							<input class="range_number" type="number" value="1000000" min="0" max="1000000" name="price_max">
						</span>
						<input class="range_range" value=0 min="0" max="1000000" step="500" type="range">
						<input class="range_range" value="1000000" min="0" max="1000000" step="500" type="range">
					</div>
					<div id="people_search">
					<div id = "search_title">투숙객 수</div>
						<input id = "people_search_input"type="number" placeholder="인원수" name="number_people" min="1" max="3">
					</div>
					<div id="star_search">
					<div id = "search_title">호텔 성급</div>
						<span>
						<input type="checkbox" value="2" name="star" class=check_star id="check_star_two">
						<label for="check_star_two">2성</label>&nbsp;
						</span>
						<span>
						<input type="checkbox" value="3" name="star" class=check_star id="check_star_three">
						<label for="check_star_three">3성</label>&nbsp;
						</span>
						<span>
						<input type="checkbox" value="4" name="star" class=check_star id="check_star_four">
						<label for="check_star_four">4성</label>&nbsp;
						</span>
						<span>
						<input type="checkbox" value="5" name="star" class=check_star id="check_star_five">
						<label for="check_star_five">5성</label>
						</span>
					</div>
					<div id="point_search">
					<div id = "search_title">투숙객평점</div>
						<span>
						<input type="radio" value="3" name="point" class=radio_point id="radio_point_three">
						<label for="radio_point_three">3점+</label>&nbsp;
						</span>
						<span>
						<input type="radio" value="5" name="point" class=radio_point id="radio_point_five">
						<label for="radio_point_five">5점+</label>&nbsp;
						</span>
						<span>
						<input type="radio" value="7" name="point" class=radio_point id="radio_point_seven">
						<label for="radio_point_seven">7점+</label>&nbsp;
						</span>
						<span>
						<input type="radio" value="8" name="point" class=radio_point id="radio_point_eight">
						<label for="radio_point_eight">8점+</label>
						</span>
					</div>
					<div id="bed_search">
					<div id = "search_title">침대종류</div>
						<span>
						<input type="radio" value="double" name="bed" class=radio_bed id="radio_bed_double">
						<label for="radio_bed_double">더블</label>&nbsp;
						</span>
						<span>
						<input type="radio" value="tween" name="bed" class=radio_bed id="radio_bed_tween">
						<label for="radio_bed_tween">트윈</label>&nbsp;
						</span>
						<span>
						<input type="radio" value="single" name="bed" class=radio_bed id="radio_bed_single">
						<label for="radio_bed_single">싱글</label>
						</span>
					</div>
				</form>
			</div>
			<div id="main">
				<nav id = "hotel_list_nav">
					<form method="post">
						<c:forEach items="${hotel_list }" var="dto">
							<input type="hidden" name="hotel_list" value="${dto.getHotel_no() }">
						</c:forEach>
						<ul>
							<li><input type="submit" value="가격 낮은 순" formaction="<%=request.getContextPath() %>/hotel_search_sort.do?field=HotelSortPriceMin"></li>
							<li><input type="submit" value="가격 높은 순" formaction="<%=request.getContextPath() %>/hotel_search_sort.do?field=HotelSortPriceMax"></li>
							<li><input type="submit" value="성급" formaction="<%=request.getContextPath() %>/hotel_search_sort.do?field=HotelSortStar"></li>
							<li><input type="submit" value="평점" formaction="<%=request.getContextPath() %>/hotel_search_sort.do?field=HotelSortPoint"></li>
						</ul>
					</form>
				</nav>
				
				<c:if test="${!empty hotel_list }">
						<div class="cnt">
						<c:forEach items="${hotel_list }" var="dto">
							<div id = "cnt_content">
								<div id = "cnt_image"><img alt="" src="<%=request.getContextPath() %>/image/hotel/${dto.getHotel_photo_folder()}/main.jpg" width="150px" height="150px" onclick="location.href='<%=request.getContextPath() %>/hotel_get_Content.do?hotel_no=${dto.getHotel_no() }'">
								</div>
								<div id = "cnt_wrap">
									<span id = "hotel_name"><a href="<%=request.getContextPath() %>/hotel_get_Content.do?hotel_no=${dto.getHotel_no() }">${dto.getHotel_name() }</a></span>
									<%--jjim 표시 --%>
									<c:set var="check" value="-1" />
									<c:forEach items="${user.getUser_jjimList() }" var="jjim">
										<c:if test="${jjim==dto.getHotel_no() }">
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<c:if test="${check == 1}">
										<span class="hotel_like_check" onclick="likeDelete(this, ${dto.getHotel_no() })"><i class="fa fa-heart" aria-hidden="true"></i></span>
									</c:if>
									<c:if test="${check == -1}">
										<span class="hotel_like_check" onclick="likeInsert(this, ${dto.getHotel_no() })"><i class="fa fa-heart-o" aria-hidden="true"></i></span>
									</c:if>
									<%--jjim 표시 end --%>
									
									<div id = "hotel_info">
									<c:forEach begin="1" end="${dto.getHotel_star() }"><span id = "hotel_star">★</span></c:forEach>
									 <br>
										평점 : ${dto.getHotel_point() }/10 <br>
										<span id = "hotel_min_pirce">최저가 : ${dto.getHotel_price_min() }원</span>
									</div>
									<input id = "hotel_reserve_button" type="button" onclick="location.href='<%=request.getContextPath() %>/hotel_get_Content.do?hotel_no=${dto.getHotel_no() }'" value="예약하기">
								</div>
							</div>	
						</c:forEach>
						</div>
				</c:if>
				<c:if test="${empty hotel_list }">
					<div id = "none_list">
						<h2>조건에 맞는 호텔 리스트가 없습니다.</h4>
					</div>
				</c:if>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>