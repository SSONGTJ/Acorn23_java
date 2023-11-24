<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberDto> member = new ArrayList<>();
	member.add(new MemberDto(1, "김구라", "노량진"));
	member.add(new MemberDto(2, "해골", "행신동"));
	member.add(new MemberDto(3, "원숭이", "상도동"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
	<h1>회원 목록 입니다.</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
		<%for(MemberDto tmp:member){ %>
		<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getName() %></td>
			<td><%=tmp.getAddr() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>