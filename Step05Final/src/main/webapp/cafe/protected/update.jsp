<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CafeDto dto = new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/protected/update.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
			<script>
				//알림창을 띄우고
				alert("수정 했습니다.");
				// location 객체를 이용해서 회원 목록보기로 리다이렉트 시키기
				location.href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=dto.getNum() %>";
				
			</script>
		<%}else {%>
			<h1>알림</h1>
			<p>
				수정 실패!
				<a href="updateform.jsp?num=<%=dto.getNum() %>">다시 수정하러 가기</a>
			</p>
		<%} %>
</body>
</html>