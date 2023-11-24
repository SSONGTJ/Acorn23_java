<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//MemberDao 객체의 참조값을 static 메소드를 이용해서 얻어온다.
	MemberDao dao = MemberDao.getInstance();
	//아래의 table에 출력할 회원목록 얻어오기
	List<MemberDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<% for (MemberDto dto : list) { %>
                    <tr>
                        <td><%= dto.getNum() %></td>
                        <td><%= dto.getName() %></td>
                        <td><%= dto.getAddr() %></td>
                    </tr>
                <% } %>
			</tbody>
		</table>
	</div>
</body>
</html>