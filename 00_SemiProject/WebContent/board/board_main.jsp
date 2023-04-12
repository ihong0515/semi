<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/board_main.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/board/board_main.js"></script>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
	    	<div id="board_sidebar">
	    		<input type="button" value="사이트 문의" id="site_board" onclick="site_board_getList()">	    		
	    		<br>
	    		<br>
	    		<input type="button" value="호텔 문의" id="hotel_board" onclick="hotel_board_getList()">
	    		<br>
	    		<br>
	    		<input type="button" value="FAQ" id="faq_board" onclick="faq_board_getList()">
	    	</div>
	    	<div id="board_main">
	    		<table id=board_list>
	    			<tr>
	    				<th style="width: 40px;">
	    					No.
	    				</th>
	    				<th style="width: 200px;">
	    					Title.
	    				</th>
	    				<th style="width: 100px;">
	    					Writer.
	    				</th>
	    				<th style="width: 50px;">
	    					Date.
	    				</th>
	    			</tr>
	    			<tr>
	    				<th colspan="5">
	    					버튼을 눌러 게시물을 불러오세요.
	    				</th>
	    			<tr>
	    		</table>
	    		<div id="board_navi">
	    			<div id="board_write_btn" style="display: none;">
		    			<input id="board_write_modal_btn" type="button" value="문의하기" onclick="if(confirm('사이트에 문의사항을 작성하시겠습니까.')){write_modeal_open(); } else{return false; }">
		    			<div id="board_write_modal_overlay">
		    				<div id="board_write_modal_window">
		    					<form action="<%=request.getContextPath() %>/board_site_write.do" method="post" onsubmit="return write_check()" name="f">
			    					<div id="modal_head">
			    						<div id="modal_head_title">
			    							제목 : <input type="text" name="board_title">
			    						</div>
			    						<div id="modal_head_x" onclick="write_modeal_close()">
			    							X
			    						</div>
			    					</div>
			    					<div id="modal_body">
			    						<textarea rows="15" cols="70" name="board_content"></textarea>
			    					</div>
			    					<div id="modal_foot">
			    						<input type="submit" value="등록">&nbsp;&nbsp;
			    						<input type="reset" value="다시 작성">
			    					</div>
		    					</form>
		    				</div>
		    			</div>
		    		</div>
	    			<input type="hidden" value="" id="page_li_lastPage">
	    			<ul class='board_navi_page' id="board_navi_site">
		    			<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList()">&#171;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList('-1')">&#60;</a>
						</li>
						<li class="page_li">
							<a class="page-link" id="page_li_now_site">1</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList('+1')">&#62;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:site_board_getList('+10')">&#187;</a>
						</li>
					</ul>
					<ul class='board_navi_page' id="board_navi_hotel">
		    			<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList()">&#171;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList('-1')">&#60;</a>
						</li>
						<li class="page_li">
							<a class="page-link" id="page_li_now_hotel">1</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList('+1')">&#62;</a>
						</li>
						<li class="page_li">
							<a class="page-link" href="javascript:hotel_board_getList('+10')">&#187;</a>
						</li>
					</ul>
	    		</div>
	    	</div>
	    	<div id="faq_main">
				<h2 align="center">FAQ 자주하는 질문</h2>
				<div class="faq_board_cont">
					<button type="button" class="faq_btn" onclick="faq_calling(this);">예약을 취소하고 싶어요.</button>
					<div class="faq_cont">
						<p>트립닷컴 앱에서 예약 페이지로 이동 후 [예약 취소]를 선택하여 예약을 취소하세요.</p>
					</div>
				</div>
				<div class="faq_board_cont">
					<button type="button" class="faq_btn" onclick="faq_calling(this);">예약을 변경하고 싶어요.</button>
					<div class="faq_cont">
						<p>마감 기한 전까지 예약을 변경하려면, 예약 정보 페이지에서 예약 변경을 클릭하세요. 그런 다음, 투숙일, 객실 유형, 투숙객 이름, 연락처 번호 등을 변경할 수 있습니다.</p>
					</div>
				</div>
				<div class="faq_board_cont">
					<button type="button" class="faq_btn" onclick="faq_calling(this);">환불은 언제 받을 수 있나요?</button>
					<div class="faq_cont">
						<p>환불 관련 정보는 예약 상세 페이지에서 확인하실 수 있습니다. 호텔에서 지불한 보증금은 일반적으로 체크아웃 시 돌려받으실 수 있습니다. 만약 신용카드로 보증금을 지불하신 경우, 평균적으로 1-3개월의 환불 주기가 소요될 수 있는 점 양해 부탁드립니다. 보증금 환불과 관련된 자세한 내용 및 주기는 호텔 또는 카드사/은행에 문의 부탁드립니다.</p>
					</div>
				</div>
				<div class="faq_board_cont">
					<button type="button" class="faq_btn" onclick="faq_calling(this);">전자영수증을 발급 받으려면 어떻게 해야 하나요?</button>
					<div class="faq_cont">
						<p>트립닷컴 앱에 로그인한 다음, 예약 정보 페이지로 이동 후 '더 보기>전자 영수증 이메일 전송'을 선택하세요. 안내 메시지에 따라 전자 영수증을 받으세요.</p>
					</div>
				</div>
				<div class="faq_board_cont">
					<button type="button" class="faq_btn" onclick="faq_calling(this);">호텔의 주소와 전화번호는 어디서 찾을 수 있나요?</button>
					<div class="faq_cont">
						<p>호텔 주소: 트립닷컴 앱의 호텔 정보 페이지로 이동 후, 페이지 상단의 호텔 이름 아래에 표시된 호텔 주소를 확인하세요.
						호텔 전화: 트립닷컴 앱의 호텔 정보 페이지에서 호텔 이름을 클릭한 후, 전화번호를 표시하여 확인하세요.</p>
					</div>
				</div>
				<div class="faq_board_cont">
					<button type="button" class="faq_btn" onclick="faq_calling(this);">특별 요청을 추가하려면 어떻게 하나요?</button>
					<div class="faq_cont">
						<p>특별 요청 사항이 있으신 경우, 숙박 예약 시 '특별 요청' 항목에 입력할 수 있습니다.</p>
					</div>
				</div>
			</div>
    	</div>
    	<jsp:include page="../include/footer.jsp" />
    </div>
</body>
</html>