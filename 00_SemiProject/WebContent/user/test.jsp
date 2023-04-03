<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function autoEmail(a,b){
	    /*
	        a : input의 ID
	        b : 입력되는 input의 값
	    */
	    var mailId = b.split('@'); // 메일계정의 ID만 받아와서 처리하기 위함
	    var mailList = ['naver.com','gmail.com','daum.net','hanmail.net','korea.kr']; // 메일목록
	    var availableCity = new Array; // 자동완성 키워드 리스트
	    for(var i=0; i < mailList.length; i++ ){
	        availableCity.push( mailId[0] +'@'+ mailList[i] ); // 입력되는 텍스트와 메일목록을 조합
	    }
	    $("#"+a).autocomplete({
	        source: availableCity, // jQuery 자동완성에 목록을 넣어줌
	        focus: function(event, ui) {
	            return false;
	        }
	    });
	}
</script>
</head>
<body>
	  <div class="ui-widget">
        <label for="email">email: </label>
        <input id="email" onkeyup="autoEmail('email',this.value)" autocomplete="off">
    </div>
    
</body>
</html>