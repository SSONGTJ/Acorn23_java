<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/logout.jsp</title>
</head>
<body>
	<%
		//session scope 에 "nick" 이라는 키값으로 저장된 값 삭제하기
		//session.removeAttribute("nick");
		//세션 초기화
		session.invalidate();
	%>
	<p>로그아웃 되었습니다.</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>