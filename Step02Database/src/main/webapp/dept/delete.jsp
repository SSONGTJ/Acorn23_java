<%@page import="test.dept.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 부서번호를 가져온다.
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	//DeptDao로 삭제 메소드를 호출하고, 응답한다.
	boolean isSuccess = DeptDao.getInstance().delete(deptno);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/dept/delete.jsp</title>
</head>
<body>
	<div class="container">
		<h1>부서 삭제 결과</h1>
		<%if (isSuccess){ %>
			<script>
				alert('삭제되었습니다.')
				location.href="${pageContext.request.contextPath}/dept/list.jsp";
			</script>
		<%} else {%>
			<script>
				alert('삭제 안됐어~')
				location.href="${pageContext.request.contextPath}/dept/list.jsp";
			</script>
		<%} %>
	</div>
</body>
</html>