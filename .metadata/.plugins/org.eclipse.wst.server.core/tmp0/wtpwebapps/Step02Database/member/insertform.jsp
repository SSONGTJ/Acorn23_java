<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/inserform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="list.jsp">회원목록</a></li>
			<li class="breadcrumb-item active">회원추가</li>		
		</ol>
	</nav>
		<h1>회원 추가 양식</h1>
		<form action="${pageContext.request.contextPath}/member/insert.jsp" method="post">
			<div class="mb-2">
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name"/>
			</div>
			<div>
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr"/>
			</div><br/>
			<button class="btn btn-primary" type="submit">추가</button>
		</form>
	</div>
</body>
</html>