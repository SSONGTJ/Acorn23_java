<%@page import="test.lunch.dao.LunchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어온다. ?num = 삭제할 회원의 번호
	int num = Integer.parseInt(request.getParameter("num"));
	//회원 한명의 정보를 삭제하고 (삭제할 회원의 번호는??)
	boolean isSuccess=LunchDao.getInstance().delete(num);
	//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/lunch/delete.jsp</title>
</head>
<body>
	<div class="container">
		<h1>방명록 삭제 결과</h1>
		<%if (isSuccess){ %>
			<script>
				alert('삭제되었습니다.')
				location.href="${pageContext.request.contextPath}/lunch/list.jsp";
			</script>
		<%} else {%>
			<script>
				alert('삭제 안됐어~')
				location.href="${pageContext.request.contextPath}/lunch/list.jsp";
			</script>
		<%} %>
	</div>
</body>
</html>