<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		if(f.writer.value == "") {
			alert("작성자를 입력하세요!!!")
			f.writer.focus();
			return false;
		}
		if(f.title.value == "") {
			alert("글 제목을 입력하세요!!!")
			f.title.focus();
			return false;
		}
		if(f.cont.value == "") {
			alert("글 내용을 입력하세요!!!")
			f.cont.focus();
			return false;
		}
		if(f.pwd.value == "") {
			alert("글 내용을 입력하세요!!!")
			f.pwd.focus();
			return false;
		}
	}

</script>
</head>
<body>

<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
			<form action="post" name="f" action="<%=request.getContextPath() %>/insert_ok.do" onsubmit="return check()"> 
				<table border="1" cellspacing="0" width="400">
					<tr>
						<th>작성자</th>
						<td> <input type="text" name="writer"> </td>
					</tr>
					<tr>
						<th>제목</th>
						<td> <input type="text" name="title"> </td>
					</tr>
					<tr>
						<th>문의내용</th>
						<td> 
							<textarea rows="10" cols="40" name="cont"></textarea>
						</td>
					</tr>
		        	<tr>
		        		<td colspan="2" align="center">
		        	 		<input type="submit" value="1:1 문의하기">&nbsp;&nbsp;
		        	 		<input type="reset" value="취소">
		        		</td>
		        	</tr>
				</table>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>