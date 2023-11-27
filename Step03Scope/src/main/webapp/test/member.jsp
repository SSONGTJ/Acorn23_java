<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request scope 에 "dto" 라는 키 값으로 담긴 MemberDto 객체 얻어오기
	MemberDto dto = (MemberDto)request.getAttribute("memberlist");
	
	// 배열에 담아보기
	List<MemberDto> list = new ArrayList<>();
	list.add(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원정보</h1>
		
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<%for (MemberDto tmp:list) {%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		
		<p>번호 : <strong><%=dto.getNum() %></strong></p>
		<p>이름 : <strong><%=dto.getName() %></strong></p>
		<p>주소 : <strong><%=dto.getAddr() %></strong></p>
	</div>
</body>
</html>