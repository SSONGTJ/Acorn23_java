<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와본다.
	String url = request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if (url == null){
		//로그인 후에 인덱스 페이지로 갈 수 있도록 한다.
		String cpath=request.getContextPath();
		url=cpath+"/index.jsp";	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/loginform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h3>로그인폼</h3>
		<form action="login.jsp" method="post">
			<!-- 폼에 입력한 정보외 추가로 같이 전송할 값이 있으면 input type="hidden" 을 활요 -->
			<input class="form-control" type="hidden" name="url" value="<%=url %>"/>
			<div class="mb-2">
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id=""pwd""/>
			</div>
			<button class="btn btn-outline-success" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>