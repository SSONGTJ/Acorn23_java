<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	CafeDto dto = CafeDao.getInstance().getData(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/protected/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h3>글 수정하기</h3>
		<form action="update.jsp">
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" value="<%=dto.getNum() %>" readonly/>
			</div>
			<div>
				<label for="writer">작성자</label>
				<input type="text" name="writer" value="<%=dto.getWriter() %>" readonly/>
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" value="<%=dto.getTitle() %>" id="title"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea>
			</div>
			<div>
				<label for="viewCount">조회수</label>
				<input type="text" name="viewCount" value="<%=dto.getViewCount() %>" readonly/>
			</div>
			<div>
				<label for="regdate">작성일</label>
				<input type="text" name="regdate" value="<%=dto.getRegdate() %>" readonly/>
			</div>
			<button type="submit">수정하기</button>
			<button type="reset">취소하기</button>
		</form>
	</div>
</body>
</html>