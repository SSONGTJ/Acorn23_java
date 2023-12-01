<%@page import="test.user.dao.UserDao"%>
<%@page import="test.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//현재 로그인된 아이디
	String id = (String)session.getAttribute("id");
	//가입정보를 DB에서 읽어온다.
	UserDto dto = UserDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/protected/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>가입 정보 입니다</h1>
		<a href="updateform.jsp">개인 정보 수정</a>
		<table>
			<tr>
				<th>아이디</th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="pwd_updateform.jsp">수정</a></td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
				
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail() %></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
		</table>
	</div>
</body>
</html>