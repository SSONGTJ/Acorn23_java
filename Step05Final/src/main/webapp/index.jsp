<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope 에 id 라는 키 값으로 저장된 값이 있는지 읽어와 본다.
	// null 이면 로그인을 하지 않은 상태, null 이 아니면 로그인된 아이디가 리턴된다.
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%if(id != null) {%>
			<p>
				<a href="${pageContext.request.contextPath}/user/protected/info.jsp"><strong><%=id %></strong>님 로그인 중...</a>
				<a href="${pageContext.request.contextPath}/user/logout.jsp">로그아웃</a>
			</p>
		<%}else{ %>
			<a href="${pageContext.request.contextPath}/user/loginform.jsp">로그인</a>
		<%} %>
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath}/user/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/user/protected/info.jsp">가입정보</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/buy.jsp?code=1&amount=3">1번 상품 3개 구입하기</a></li>
			<li><a href="test/upload_form.jsp">파일 업로드 테스트</a></li>
			<li><a href="test/upload_form2.jsp">이미지 업로드 테스트</a></li>
			<li><a href="test/upload_form3.jsp">이미지 업로드 테스트(fetch 를 활용)</a></li>
			<li><a href="test/upload_form4.jsp">이미지 단독 업로드 테스트2(fetch 를 활용)</a></li>
			<li><a href="file/list.jsp">자료실 목록보기</a></li>
			<li><a href="cafe/index.jsp">231206 과제</a></li>
		</ul>
	</div>
</body>
</html>