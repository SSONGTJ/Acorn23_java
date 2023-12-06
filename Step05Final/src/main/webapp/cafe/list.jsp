<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)session.getAttribute("id");
	List<CafeDto> list = CafeDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/cafe/protected/insertform.jsp">새 글 작성</a>
		<br />
		<a href="${pageContext.request.contextPath}/cafe">홈으로 가기</a>
		<h3>글 목록</h3>
		
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for (CafeDto dto : list) { %>
					<tr>
						<td><%=dto.getNum() %></td>
						<td><%=writer %></td>
						<td><a href="detail.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a></td>
						<td><%=dto.getViewCount() %></td>
						<td><%=dto.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>