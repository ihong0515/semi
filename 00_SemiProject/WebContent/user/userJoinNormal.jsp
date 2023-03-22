<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객|회원가입</title>
<script type="text/javascript">
    function test() {
      var p1 = document.getElementById('pwd').value;
      var p2 = document.getElementById('pwdCheck').value;
      if( p1 != p2 ) {
        alert("비밀번호가 일치 하지 않습니다!");
        return false;
      } else{
        alert("비밀번호가 일치합니다!");
        return true;
      }
    }
</script>
</head>
<body>

	<div id="container">
      <%-- <jsp:include page="../include/header.jsp" /> --%>
    	<div id="content">
	    	<form method="post" action="<%=request.getContextPath()%>/user_join.do">
	    	<%-- 
	    	Frontcontroller
	    	
		    	else if(command.equals("user_join.do")) {
				action = new UserJoinAction();
				action.execute(request, response);
			}
	    	
	    	--%>
	      		<div align="center">
					<h2>고객 회원가입</h2>
					<br>
					<form method="post" action="join_ok.jsp">
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pwd"></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td>
									<input type="password" name="pwdCheck">
									<input type="button" onclick="test()" value="비밀번호 확인">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" name="birth"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<input type="text" name="email">
									@
									<select>
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>hanmail.net</option>
										<option>nate.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>선호 지역</th>
								<td>
									<select name = "location">
						               <option value = "seoul">서울</option>
						               <option value = "jeju">경기</option>
						               <option value = "kwangwon">강원</option>
						               <option value = "jeonnam">전남</option>
						               <option value = "jeonbuk">전북</option>
						               <option value = "chungbuk">충북</option>
						               <option value = "chungnam">충남</option>
						               <option value = "kyungnam">경남</option>
						               <option value = "kyungbuk">경북</option>
						               <option value = "jeju">제주</option>
							         </select>
								</td>
							</tr>
						</table>
						<br>
						<input type="submit" value="가입">
						<input type="reset" value="다시 작성">
					</form>
				</div>
			</form>
    	</div>
      <%-- <jsp:include page="../include/footer.jsp" /> --%>
	</div>
   
</body>
</html>