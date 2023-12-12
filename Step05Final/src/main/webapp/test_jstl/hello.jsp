<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/hello.jsp</title>
</head>
<body>
	<c:forEach var="i" begin="0" end="9" step="1">
		<p>안녕 JSTL <strong>${i }</strong></p>
	</c:forEach>
	
	<h1>JSTL 을 사용하지 않고 java code 를 활용해서 위와 같은 동작을 해 보세요.</h1>
	<%for (int i = 0; i<10 ; i++) {%>
		<p>안녕 JSTL <strong><%=i %></strong></p>
	<%} %>
</body>
</html>