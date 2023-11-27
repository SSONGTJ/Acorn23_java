<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = (List<String>)request.getAttribute("friendsList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/friend.jsp</title>
</head>
<body>
	<div class="container">
		<h1>친구목록</h1>
		<ul>
			<%for(String tmp:list) {%>
				<li><%=tmp %></li>
			<%} %>
		</ul>
	</div>
</body>
</html>