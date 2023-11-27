<%@page import="test.lunch.dao.LunchDao"%>
<%@page import="test.lunch.dto.LunchDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송시 한글 안깨지도록
	request.setCharacterEncoding("utf-8");

	//1. 폼 전송되는 수정할 회원의 정보를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	String menu = request.getParameter("menu");
	String loc = request.getParameter("loc");
	String review = request.getParameter("review");
	
	LunchDto dto = new LunchDto();
	dto.setNum(num);
	dto.setMenu(menu);
	dto.setLoc(loc);
	dto.setReview(review);
	
	//2. db에 수정 반영한다.
	boolean isSuccess = LunchDao.getInstance().update(dto);
	
	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/lunch/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			<strong><%=menu %></strong> 가 수정되었습니다.
			<a href="list.jsp">목록보기</a>
		</p>
	<%}else{ %>
		<p>
			수정 실패!
			<a href="updateform.jsp?num=<%=num%>">다시 작성</a>
		</p>
	<%} %>
</body>
</html>