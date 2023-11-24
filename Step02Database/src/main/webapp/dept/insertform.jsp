<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/dept/insertform.jsp</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dept/sub.css">
</head>
<body>
	<div class="container">
		<h1>부서 추가 양식</h1>
		<form action="${pageContext.request.contextPath}/dept/insert.jsp" method="post">
			<div>
				<label for="deptno">부서번호</label>
				<input type="text" name="deptno" id="deptno" placeholder="10단위로 입력"/>
			</div>
			<div>
				<label for="dname">부서이름</label>
				<input type="text" name="dname" id="dname" />
			</div>
			<div>
				<label for="loc">부서위치</label>
				<input type="text" name="loc" id="loc" />
			</div>
			<button type="submit">추가하기</button>
		</form>
	</div>
</body>
</html>