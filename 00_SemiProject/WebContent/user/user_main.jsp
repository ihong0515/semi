<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${sessionScope.loginUser}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content" align="center">
			<h2>고객 로그인</h2>
			<br>
			<c:if test="${empty dto}">
				<fieldset style="width:500px;">
					<legend>로그인 페이지</legend>
					<form method="post" action="<%=request.getContextPath() %>/user_login.do">
						<table>
							<tr> <th>ID</th> <td><input type="text" name="id"></td> </tr>
							<tr> <th>PW</th> <td><input type="password" name="pwd"></td> </tr>
							<tr> 
								<td colspan="2" align="center">
								 	<input type="submit" value="로그인">
								 	<input type="reset" value="취소">
								 	<input type="button" value="회원가입" onclick="location.href='<%=request.getContextPath() %>/user_join.do'">
								</td> 
							</tr>
						</table>
					</form>
				</fieldset>
			</c:if>
			
			<c:if test="${!empty dto}">
				<fieldset style="width:500px;">
					<legend>[${dto.getUser_name() }]님 환영합니다!</legend>
					<input type="button" value="전체 회원조회" onclick="location.href='<%=request.getContextPath() %>/user_list.do'">
					<input type="button" value="마이페이지" onclick="location.href='<%=request.getContextPath() %>/user_myPage.do?no=${dto.getUser_no() }'">
				</fieldset>
			</c:if>
			
    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>