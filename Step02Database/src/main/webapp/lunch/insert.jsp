<%@page import="test.lunch.dao.LunchDao"%>
<%@page import="test.lunch.dto.LunchDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송했을 때 한글 안깨지도록
	request.setCharacterEncoding("utf-8");

	//form 전송되는 회원의 이름과 주소를 읽어와서
	String menu = request.getParameter("menu");
	String loc = request.getParameter("loc");
	String review = request.getParameter("review");
	// DB에 저장하고
	LunchDto dto = new LunchDto();
	dto.setMenu(menu);
	dto.setLoc(loc);
	dto.setReview(review);
	
	boolean isSuccess = LunchDao.getInstance().insert(dto);
	
	// 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/lunch/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원 정보 입력 결과</h1>
		<%if(isSuccess){%>
			<p >
				<strong><%=menu %></strong>가 추가 됐음
				<a href="${pageContext.request.contextPath}/lunch/list.jsp">목록보기</a>
				<a href="${pageContext.request.contextPath}/lunch/insertform.jsp">계속 등록하기</a>
			</p>
		<%}else {%>
			<p >
				실패~
				<a href="insertform.jsp">다시 입력</a>
			</p>
		<%} %>
	</div>
</body>
</html>