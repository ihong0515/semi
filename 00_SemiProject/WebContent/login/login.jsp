<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	   <div id="container">
      <%-- <jsp:include page="../include/header.jsp" /> --%>
      <div id="content">
      
      </div>
      <%-- <jsp:include page="../include/footer.jsp" /> --%>
  	 </div>

	<div align="center">
			<h3>로그인 페이지</h3>
		<hr width="50%" color="blue">
		<br>
		
		<form>
			<table border="1" cellspacing="0"> 
				<tr>
					<th>아이디</th>
					<td> <input type="text" name="userId">
				</tr>

				<tr>
					<th>비밀번호</th>
					<td> <input type="password" name="userPwd">
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="로그인">&nbsp;&nbsp;
						<input type="reset" value="취소">
						
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>