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
</head>
<body>
	<div class="container">
		<h3>회원 정보 입력 결과</h3>
		<%if(isSuccess){%>
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
		<%} %>
	</div>
</body>
</html>