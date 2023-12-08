<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송했을 때 한글 안깨지도록
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CafeDto dto = new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/protected/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<!-- <h3>회원 정보 입력 결과</h3> -->
		<!-- <%if(isSuccess){%>
			<script>
				//알림창을 띄우고
				alert("<%=writer %>님 등록 했습니다.");
				// location 객체를 이용해서 회원 목록보기로 리다이렉트 시키기
				location.href="${pageContext.request.contextPath}/cafe/list.jsp";
			</script>
		<%}else {%>
			<p>
				실패~
				<a href="insertform.jsp">다시 입력</a>
			</p>
		<%} %> -->
		<div class="card w-50 mt-5 border-success">
			<%if(isSuccess){ %>
				<div class="card-body">
					<h5 class="card-title">알림</h5>
					<p class="card-text"><%=writer %>  님이 작성한 새글을 저장했습니다</p>
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/cafe/list.jsp">확인</a>
				</div>
			<%}else{ %>
				<div class="card-body">
					<h5 class="card-title">알림</h5>
					<p class="card-text text-danger">글 저장 실패!</p>
					<a class="btn btn-warning" href="${pageContext.request.contextPath}/cafe/protected/insertform.jsp">다시 작성하기</a>
				</div>
			<%} %>
		</div>
	</div>
	
</body>
</html>