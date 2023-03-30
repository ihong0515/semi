<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 자주하는 질문</title>
<link href="<%=request.getContextPath() %>/css/board/faq.css" rel="stylesheet">
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}
</script>
</head>
<body>
		
		<div align="center">
		<h2>FAQ 자주묻는 질문</h2>
		<form method="post" action="<%=request.getContextPath() %>/faq_list.do.">
			<button class="accordion">예약을 취소하고 싶어요.</button>
				<div class="panel">
				  <p>트립닷컴 앱에서 예약 페이지로 이동 후 [예약 취소]를 선택하여 예약을 취소하세요.</p>
				</div>
		
			<button class="accordion">예약을 변경하고 싶어요.</button>
				<div class="panel">
		  		 <p>마감 기한 전까지 예약을 변경하려면, 예약 정보 페이지에서 예약 변경을 클릭하세요. 그런 다음, 투숙일, 객실 유형, 투숙객 이름, 연락처 번호 등을 변경할 수 있습니다.</p>
				</div>
		
			<button class="accordion">환불은 언제 받을 수 있나요?</button>
				<div class="panel">
				  <p>환불 관련 정보는 예약 상세 페이지에서 확인하실 수 있습니다. 호텔에서 지불한 보증금은 일반적으로 체크아웃 시 돌려받으실 수 있습니다. 만약 신용카드로 보증금을 지불하신 경우, 평균적으로 1-3개월의 환불 주기가 소요될 수 있는 점 양해 부탁드립니다. 보증금 환불과 관련된 자세한 내용 및 주기는 호텔 또는 카드사/은행에 문의 부탁드립니다.</p>
				</div>
				
			<button class="accordion">전자영수증을 발급 받으려면 어떻게 해야 하나요?</button>
				<div class="panel">
				  <p>트립닷컴 앱에 로그인한 다음, 예약 정보 페이지로 이동 후 '더 보기>전자 영수증 이메일 전송'을 선택하세요. 안내 메시지에 따라 전자 영수증을 받으세요.</p>
				</div>
			
			<button class="accordion">호텔의 주소와 전화번호는 어디서 찾을 수 있나요?</button>
				<div class="panel">
				  <p>호텔 주소: 트립닷컴 앱의 호텔 정보 페이지로 이동 후, 페이지 상단의 호텔 이름 아래에 표시된 호텔 주소를 확인하세요.
					  호텔 전화: 트립닷컴 앱의 호텔 정보 페이지에서 호텔 이름을 클릭한 후, 전화번호를 표시하여 확인하세요.</p>
				</div>
			<button class="accordion">특별 요청을 추가하려면 어떻게 하나요?</button>
				<div class="panel">
				  <p>특별 요청 사항이 있으신 경우, 숙박 예약 시 '특별 요청' 항목에 입력할 수 있습니다.</p>
				</div>
			</form>	
			</div>
			
</body>
</html>