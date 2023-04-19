<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/include/footer.css">
</head>
<body>
	<div id="footer">
		<div id="container_footer">
			<div id="first_footer">
				<div id="info_footer">
					<table>
						<tr height="40px">
							<th width="115px"><strong>고객센터</strong></th>
							<th>1577-1577(10:00 ~ 17:00)</th>
						</tr>
						<tr height="40px">
							<td><strong>사업자 문의</strong></td>
							<td><button onclick="location.href='<%=request.getContextPath() %>/owner_application.do'">입점 신청</button></td>
						</tr>
					</table>
				</div>
		    </div>
		    <div id="second_footer">
				<div id="logo_footer">
					<img src="<%=request.getContextPath() %>/image/include/logo2.png" onclick="location.href='<%=request.getContextPath()%>/index_move.do'" width="200px">
				</div>
				<div id="faq_footer">
		      		<ul>
		       	 		<li>
			        		<a href="https://www.instagram.com/"><i class="fa fa-instagram fa-2xl" aria-hidden="true"></i></a>
			        		<a href="https://www.youtube.com/"><i class="fa fa-youtube-play fa-2xl" aria-hidden="true"></i></a>
			        		<a href="https://ko-kr.facebook.com/"><i class="fa fa-facebook fa-2xl" aria-hidden="true"></i></a>
		        		</li>
		      		</ul>
		    	</div>
		    </div>
			<div id="third_footer">
				<div id="link_footer">
		      		<ul>
		      			<li><a href="board/faq_main.jsp">고객문의(FAQ)&nbsp;|&nbsp;</a></li>
			        	<li><a href="<%=request.getContextPath()%>/terms/footer/privat.jsp">개인정보처리방침&nbsp;|&nbsp;</a></li>
			        	<li><a href="<%=request.getContextPath()%>/terms/footer/serviceterm.jsp">서비스 이용 약관&nbsp;|&nbsp;</a></li>
			        	<li><a href="<%=request.getContextPath()%>/terms/footer/useterm.jsp">사용약관&nbsp;|&nbsp;</a></li>
			        	<li><a href="<%=request.getContextPath()%>/terms/footer/couponterm.jsp">쿠폰 이용약관&nbsp;|&nbsp;</a></li>
			        	<li><a href="<%=request.getContextPath()%>/terms/footer/kidterm.jsp">아동정책</a></li>
			        </ul>
		        </div>
		        <div id="detail_footer">
			        <ul>
		     			<li>(주)GoCatchStay  |  대표: 이희용  |  주소: 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</li>
		     			<li>사업자등록번호 : 102-02-02580  |  사업자정보확인  |  통신판매업신고번호  |  제2015-서울종로-0499호  |  관광사업자등록 일반여행업 2018-000049호(종로구청)</li>
						<li>(주)GoCatchStay는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</li>
		     			<li>COPYRIGHTⓒ GoCatchStay SERVICE INC. ALL RIGHTS RESERVED</li>
		     		</ul>
	     		</div>
	     	</div>
		</div>
	</div>
</body>
</html>