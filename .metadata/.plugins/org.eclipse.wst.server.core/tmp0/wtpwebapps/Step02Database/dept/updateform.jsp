<%@page import="test.dept.dto.DeptDto"%>
<%@page import="test.dept.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 어떤걸 수정할지 부서번호를 받아온다.
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	// 받아온 부서번호를 활용해서 dao 에서 메소드를 호출했다.
	// 받아온 dto 를 넣어줬다...연결...?
	DeptDto dto = DeptDao.getInstance().getDept(deptno);	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/dept/updateform.jsp</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dept/sub.css">
</head>
<body>
	<div class="container">
		<h1>부서 수정 양식</h1>
		<form action="${pageContext.request.contextPath}/dept/update.jsp" method="post">
			<div>
				<label for="deptno">부서번호</label>
				<input type="text" name="deptno" id="deptno" value="<%=dto.getDeptno() %>" />
			</div>
			<div>
				<label for="dname">부서이름</label>
				<input type="text" name="dname" id="dname" value="<%=dto.getDname() %>"/>
			</div>
			<div>
				<label for="loc">부서위치</label>
				<input type="text" name="loc" id="loc" value="<%=dto.getLoc() %>"/>
			</div>
			<button type="submit">수정하기</button>
		</form>
	</div>
</body>
</html>