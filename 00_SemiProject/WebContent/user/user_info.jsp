<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${sessionScope.id }
	
	<div id="container">
      <jsp:include page="../include/header.jsp" />
    	<div id="content">
			<div align="center">
			<c:set var="dto" value="${Content }" />
			<hr width="50%" color="tomato">
			<h3>JSP_BBS 게시판 ${dto.getBoard_writer() } 님 게시물 상세내역 페이지</h3>
			<hr width="50%" color="tomato">
			<br>
			
			<table border="1" cellspacing="0" width="400">
				<tr>
					<th>글번호</th>
					<td>${dto.getBoard_no() }</td>
				</tr>
				
				<tr>
					<th>글 작성자</th>
					<td>${dto.getBoard_writer() }</td>
				</tr>
				
				<tr>
					<th>글 제목</th>
					<td>${dto.getBoard_title() }</td>
				</tr>
				
				<tr>
					<th>글 내용</th>
					<td>${dto.getBoard_cont()}</td>
				</tr>
				
				<tr>
					<th>글 비밀번호</th>
					<td>
						<c:if test="${dto.getBoard_pwd().length() != 0 }">
							<c:forEach begin="1" end="${dto.getBoard_pwd().length()}">
								*
							</c:forEach>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<th>글 조회수</th>
					<td>${dto.getBoard_hit() }</td>
				</tr>
				
				<tr>
					<c:if test="${empty dto.getBoard_update() }">
						<th>작성일자</th>
						<td>${dto.getBoard_date() }</td>
					</c:if>
					<c:if test="${!empty dto.getBoard_update() }">
						<th>수정일자</th>
						<td>${dto.getBoard_update() }</td>
					</c:if>
				</tr>
				<c:if test="${empty dto }">
					<tr>
						<td colspan="2" align="center">
							<h3>조회된 게시물이 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
			<br>
			
			<input type="button" value="글수정" onclick="location.href='bbs_modify.do?no=${dto.getBoard_no()}'">&nbsp;
			<input type="button" value="글삭제" onclick="if(confirm('게시글을 삭제하시겠습니까?')){
														location.href='bbs_delete.do?no=${dto.getBoard_no()}'
														} else {return; }">&nbsp;
			<input type="button" value="답변글" onclick="location.href='bbs_reply.do?no=${dto.getBoard_no()}'">&nbsp;
			<input type="button" value="전체목록" onclick="location.href='bbs_list.do?no=${dto.getBoard_no()}'">
		</div>
		    	</div>
      <jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>