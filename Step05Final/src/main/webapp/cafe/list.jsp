<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지?
	final int PAGE_DISPLAY_COUNT=2;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}	
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow=CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}

	//List<CafeDto> list = CafeDao.getInstance().getList();
	
	//보여줄 페이지에 맞는 목록만 얻어오기 
	List<CafeDto> list = CafeDao.getInstance().getList(startRowNum, endRowNum);
	// 로그인된 사용자 읽어오기 (로그인 되지 않았다면 null 이다)
	String id=(String)session.getAttribute("id");
	
	// 전체 글의 개수를 구하는 메소드 호출
	int count = CafeDao.getInstance().getCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link href="${pageContext.request.contextPath}/cafe/css/list.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/cafe/protected/insertform.jsp">새 글 작성</a>
		<br />
		<a href="${pageContext.request.contextPath}/cafe">홈으로 가기</a>
		<h3>글 목록</h3>
		
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for (CafeDto dto : list) { %>
					<tr>
						<td><%=dto.getNum() %></td>
						<td><%=dto.getWriter() %></td>
						<td><a href="detail.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a></td>
						<td><%=dto.getViewCount() %></td>
						<td><%=dto.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<!-- 페이징 UI -->
		<ul class="page-list">
			<!-- 
				startPageNum 이 1인 아닌 경우에만 Prev 링크를 제공한다
			 -->
			 <%if(startPageNum != 1) {%>
			 	<li>
			 		<a href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
			 	</li>
			 <%} %>
			 
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i == pageNum){ %>
					<li class="active">
						<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%}else{ %>
					<li>
						<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>	
			<%} %>
			<!-- 
				마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다.
			 -->
			<%if(endPageNum < totalPageCount) {%>
			 	<li>
			 		<a href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
			 	</li>
			 <%} %>
		</ul>
	</div>
</body>
</html>