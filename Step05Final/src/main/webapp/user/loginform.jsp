<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/loginform.jsp</title>
</head>
<body>
	<div class="container">
		<h3>로그인폼</h3>
		<form action="login.jsp" method="post">
			<div>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id"/>
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id=""pwd""/>
			</div>
			<button type="submit">로그인</button>
		</form>
	</div>
</body>
</html>