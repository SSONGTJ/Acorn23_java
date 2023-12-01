<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope 에 "id" 이라는 키값으로 저장된 값 삭제하기
	//session.removeAttribute("id");
	//1. 세션 초기화
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/logout.jsp</title>
</head>
<body>
	<script>
		alert("로그아웃 되었습니다.");
		//javascript 로 페이지 이동 시키기
		location.href="${pageContext.request.contextPath}/"; // 이 경우엔 /Step05Final 이다.
	</script>
</body>
</html>