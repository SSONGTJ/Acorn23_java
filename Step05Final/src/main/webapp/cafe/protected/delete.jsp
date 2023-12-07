<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	boolean isSuccess = CafeDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/protected/delete.jsp</title>
</head>
<body>
	<div class="container">
		<h1>글 삭제 결과</h1>
		<%if(isSuccess){%>
			<script>
				//알림창을 띄우고
				alert("삭제 했습니다.");
				// location 객체를 이용해서 회원 목록보기로 리다이렉트 시키기
				location.href="${pageContext.request.contextPath}/cafe/list.jsp";
			</script>
		<%}else {%>
			<h1>알림</h1>
			<p>
				수정 실패!
				<a href="detail.jsp?num=<%=num %>">삭제 실패</a>
			</p>
		<%} %>
	</div>
</body>
</html>