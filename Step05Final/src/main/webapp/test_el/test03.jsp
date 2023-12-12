<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 보통 실무에선 이 부분을 servlet 에 작성한다.
	
	//CafeDto 객체를 생성해서 글 하나의 정보를 담고
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setWriter("김구라");
	dto.setTitle("나는 구라다");
	
	// "dto" 라는 키값으로 request scope 에 담기
	request.setAttribute("dto", dto);

%>
<!-- 실무에서 이 아래 부분을 jsp 로 작성 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_el/test03.jsp</title>
</head>
<body>
	<%
		//request 영역에 "dto"라는 키값으로 담긴 CafeDto 객체의 참조값 얻어와서 원래 type 으로 casting 해서 담는다.
		CafeDto result = (CafeDto)request.getAttribute("dto");
	%>
	<%-- CafeDto 객체의 getter 메소드를 이용해서 원하는 정보를 얻어와서 출력하기 --%>
	<p>글번호 : <strong><%=result.getNum() %></strong></p>
	<p>작성자 : <strong><%=result.getWriter() %></strong></p>
	<p>제목 : <strong><%=result.getTitle() %></strong></p>
	
	<h3>EL 을 이용해서 위와 동일한 작업하기</h3>
	<p>글번호 : <strong>${requestScope.dto.getNum() }</strong></p>
	<p>글번호 : <strong>${dto.getNum() }</strong></p>	<%-- requestScope. 은 생략 가능 --%>
	<p>글번호 : <strong>${dto.num }</strong></p> <%-- getNum() 대신에 필드명만 적어도 된다. --%>
	<p>작성자 : <strong>${dto.writer }</strong></p>
	<p>제목 : <strong>${dto.title }</strong></p>
</body>
</html>