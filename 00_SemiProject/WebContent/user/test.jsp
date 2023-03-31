<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://kit.fontawesome.com/e6bfca85af.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script text="javascript/text">
   
   var count = 0;
   
   function click() {
	   if(count == 0) {
		   $('#btnMore').val() = "접기";
		   content.style.display="block";
		   couunt++;
		   return;
	   } else {
		   $('#btnMore') ="더보기";
		   content.style.display="none";
		   couunt--;
		   return;
	   }
   }
   
</script>
<body>
	<div onclick="click()">
		<ins><i id="btnMore" class="fa fa-angle-up" aria-hidden="true">더보기</i></ins>
	</div>
	
	<div id="content" style="display:none">
		웃겨 정말
	</div>
</body>
</html>