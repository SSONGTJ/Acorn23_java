<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"> -->
</head>
<body>

<!-- 
	어두운색 계열의 navbar 배경색이면 data-bs-theme="dark" 속성을 추가한다 
	navbar-expand-md 는 md 영역 이상에서 navbar-collapse 가 펼쳐 지도록 한다.
-->
<nav class="navbar bg-primary navbar-expand-md" data-bs-theme="dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">
      <img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      Acorn
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    		data-bs-target="#navbarText">
     		<span class="navbar-toggler-icon"></span>
   	</button>
   	<%
   		//어느 페이지에 포함되었는지 정보를 얻어오기
   		String current=request.getParameter("current"); // "index" or "member" or "guest"
   	%>
    <div class="collapse navbar-collapse" id="navbarText">
	   	<ul class="navbar-nav me-auto">
        	<li class="nav-item">
          		<a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="${pageContext.request.contextPath }/guest/list.jsp">방명록</a>
        	</li>
      	</ul>
      	<form class="d-flex">
	        <input class="form-control me-2" type="search" placeholder="Search" >
	        <button class="btn btn-info" type="submit">Search</button>
      	</form>
      	<span class="navbar-text ms-2">
      		Made by Kimgura
      	</span>
    </div>
  </div>
</nav>


	<div class="container">
		<div class="header">
			<h1>인덱스 페이지 입니다.</h1>
		</div>
		<ul>
			<li><a href="test.jsp">Connection 객체 잘 얻어오는지 확인하기</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list.jsp">회원목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list2.jsp">회원목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/dept/list.jsp">부서목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/guest/list.jsp">방명록 보기</a></li>
		</ul>
	</div>
</body>
</html>