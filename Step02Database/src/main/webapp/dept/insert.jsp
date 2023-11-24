<%@page import="test.dept.dao.DeptDao"%>
<%@page import="test.dept.dto.DeptDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 값 받아오기
	int deptno=Integer.parseInt(request.getParameter("deptno"));
	String dname=request.getParameter("dname");
	String loc=request.getParameter("loc");
	
	// db에 저장하기
	DeptDto dto = new DeptDto();
	dto.setDeptno(deptno);
	dto.setDname(dname);
	dto.setLoc(loc);
	
	boolean isSuccess = DeptDao.getInstance().insert(dto);	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/dept/insert.jsp</title>

</head>
<body>
	<div class="container">
		<h1>부서 정보 입력 결과</h1>
		
		<%if(isSuccess){%>
			<script>
				alert('입력하신 부서가 추가되었습니다.')
				location.href="${pageContext.request.contextPath}/dept/list.jsp";
			</script>
		<%}else {%>
			<p>
				실패~
				<a href="insertform.jsp">다시 입력</a>
			</p>
		<%} %>
	</div>
</body>
</html>