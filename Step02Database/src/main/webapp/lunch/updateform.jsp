<%@page import="test.lunch.dto.LunchDto"%>
<%@page import="test.lunch.dao.LunchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 글 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//2. 글 번호에 해당하는 글의 정보를 DB에서 얻어온다.
	LunchDto dto = LunchDao.getInstance().getData(num);
	//3. 수정폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/lunch/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>메뉴 수정</h1>
		<form action="${pageContext.request.contextPath}/lunch/update.jsp">
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id="num" value="<%=dto.getNum() %>"readonly/>
			</div>
			<div>
				<label for="menu">메뉴</label>
				<input type="text" name="menu" id="menu" value="<%=dto.getMenu() %>"/>
			</div>
			<div>
				<label for="loc">위치</label>
				<input type="text" name="loc" id="loc" value="<%=dto.getLoc() %>"/>
			</div>
			<div>
				<label for="review">한줄평</label>
				<input type="text" name="review" id="review" value="<%=dto.getReview() %>"/>
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>