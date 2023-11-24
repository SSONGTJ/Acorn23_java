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

	<%-- 
		/include/navbar.jsp 포함시키기
		피 포함되는 jsp 페이지에 파라미터를 전달할 수 있다.
		아래 코드는 current 라는 파라미터 명으로 index 라는 문자열을 전달하는 것이다.
		따라서, navbar.jsp 페이지에서는 해당 문자열을 아래와 같이 추출할 수 있다.
		String result = request.getParameter("current"); // "index"
	--%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	
	<div class="container">
		<!-- 
		<div class="header">
			<h1>인덱스 페이지 입니다.</h1>
		</div>
		 -->
		<div id="carouselExampleCaptions" class="carousel slide mt-2">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="images/top01.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>First slide label</h5>
		        <p>Some representative placeholder content for the first slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="images/top02.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Second slide label</h5>
		        <p>Some representative placeholder content for the second slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="images/top03.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Some representative placeholder content for the third slide.</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		
		<ul>
			<li><a href="test.jsp">Connection 객체 잘 얻어오는지 확인하기</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list.jsp">회원목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list2.jsp">회원목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/dept/list.jsp">부서목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/guest/list.jsp">방명록 보기</a></li>
		</ul>
	</div>
	
	<%-- 
		webapp/include/footer.jsp 페이지에게 이 부분만 응답하도록 한다.
		page="경로"
		여기 경로는 client가 요청하는 경로가 아니기 때문에 context path를 출력하면 안된다.
		page="/"는 webapp 폴더를 가리킨다.
	 --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>		
	
</body>
</html>