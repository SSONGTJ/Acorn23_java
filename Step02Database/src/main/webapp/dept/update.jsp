<%@page import="test.dept.dao.DeptDao"%>
<%@page import="test.dept.dto.DeptDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송했을 때 한글 안깨지도록
	request.setCharacterEncoding("utf-8");

	//updateform 에서 전송한 값들을 받아오기
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	//받은 값을 dto 에 저장
	DeptDto dto = new DeptDto();
	dto.setDeptno(deptno);
	dto.setDname(dname);
	dto.setLoc(loc);
	
	//저장한 dto를 update 메소드로 넘긴다.
	boolean isSuccess = DeptDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/dept/update.jsp</title>
</head>
<body>
	<div class="container">
		<h1>수정 여부</h1>
		<%if (isSuccess){ %>
			<script>
				alert('수정됐어~');
				location.href="${pageContext.request.contextPath}/dept/list.jsp";
			</script>
		<%} else {%>
			<script>
				alert('수정 실패~')
				location.href="${pageContext.request.contextPath}/dept/updateform.jsp?deptno=<%=dto.getDeptno()%>"
			</script>
		<%} %>
	</div>
</body>
</html>