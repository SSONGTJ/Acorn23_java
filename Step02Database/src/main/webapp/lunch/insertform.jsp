<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/lunch/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>메뉴 추가!</h1>
		<form action="${pageContext.request.contextPath}/lunch/insert.jsp">
			<div>
				<label for="menu">메뉴 이름</label>
				<input type="text" name="menu" id="menu"/>
			</div>
			<div>
				<label for="loc">가게 위치</label>
				<input type="text" name="loc" id="loc"/>
			</div>
			<div>
				<label for="review">한줄평</label>
				<input type="text" name="review" id="review"/>
			</div>
			<button type="submit">등록하기</button>
		</form>
	</div>
</body>
</html>