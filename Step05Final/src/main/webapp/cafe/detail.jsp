<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
	int viewCount = CafeDao.getInstance().increaseViewCount(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link href="${pageContext.request.contextPath}/cafe/css/detail.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">글 목록 보기</a>
		<article>
			<div>
				<div class="num"><%=dto.getNum() %></div>
				<div class="writer"><%=dto.getWriter() %></div>
			</div>
			
			<h3 class="title"><%=dto.getTitle() %></h3>
			
			<div class="content">
				<textarea><%=dto.getContent() %></textarea>
			</div>
			
			<div class="viewCount"><%=dto.getViewCount() %></div>
			<div class="regdate"><%=dto.getRegdate() %></div>
			
			<div class="Btn">
				<%if(dto.getWriter().equals(id)) {%>
				<button class="updateBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/cafe/protected/updateform.jsp?num=<%=dto.getNum() %>'">수정하기</button>
				<button class="deleteBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/cafe/protected/delete.jsp?num=<%=dto.getNum() %>'">삭제하기</button>
				<%} %>
			</div>
		</article>
	</div>
</body>
</html>