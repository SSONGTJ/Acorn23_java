<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<GuestDto> list = GuestDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/guest/list.css">
<title>/guest/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>방명록 입니다.</h1>
		<a href="${pageContext.request.contextPath}/guest/insertform.jsp">방명록 작성하기</a>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for (GuestDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td>
							<textarea rows="5" readonly><%=tmp.getContent() %></textarea>
						</td>
						<td><%=tmp.getRegdate() %></td>
						<td>
							<form action="delete.jsp" method="post">
								<input type="hidden" name="num" value="<%=tmp.getNum() %>" />
								<input type="password" name="pwd" placeholder="비밀번호 입력"/>
								<button type="submit">삭제</button>
							</form>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>