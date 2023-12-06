<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/protected/insertform.jsp</title>
<link href="${pageContext.request.contextPath}/cafe/css/insert.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h3>새로운 글 작성</h3>
		<form action="insert.jsp" method="post">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" />
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10"></textarea>
			</div>
			<button type="submit">등록하기</button>
		</form>
		
	</div>
</body>
</html>