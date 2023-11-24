<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송했을 때 한글 안깨지도록
	request.setCharacterEncoding("utf-8");

	// form 전송되는 회원의 이름과 주소를 읽어와서
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	// DB에 저장하고
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	// 응답한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원 정보 입력 결과</h1>
		<%if(isSuccess){%>
			<p>
				<strong><%=name %></strong>님 추가 됐음
				<a href="${pageContext.request.contextPath}/member/list.jsp">목록보기</a>
			</p>
		<%}else {%>
			<p>
				실패~
				<a href="insertform.jsp">다시 입력</a>
			</p>
		<%} %>
	</div>
</body>
</html>