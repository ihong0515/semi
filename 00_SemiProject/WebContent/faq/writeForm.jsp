<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "list.jsp";
	});
});
</script>
</head>
<body>
	<h1>글쓰기</h1>
	<hr>
	<form action="writePro.jsp" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="writer"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="text" name="email"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료"/>
					<input type="reset" value="다시작성"/>					
					<input type="button" value="목록보기" id="btnList"/>					
				</td>
			</tr>
		</table>
	</form>
</body>
</html>