<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FAQ 자주묻는 질문</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  $(".que").click(function() {
	   $(this).next(".anw").stop().slideToggle(300);
	  $(this).toggleClass('on').siblings().removeClass('on');
	  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
  
  </script>
  <link href="<%=request.getContextPath() %>/css/board/faq2.css" rel="stylesheet">
</head>
<body>

<h1>Accordion Menu</h1>

<div id="Accordion_wrap">
     <div class="que">
      <span>This is first question.</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div>
      
     </div>
     <div class="anw">
      <span>This is first answer.</span>
     </div>
      <div class="que">
      <span>This is second question.</span>
     </div>
     <div class="anw">
      <span>This is second answer.</span>
     </div>
      <div class="que">
      <span>This is third question.</span>
     </div>
     <div class="anw">
      <span>This is third answer.</span>
     </div>
</div>
  </body>
</html>