<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
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
	int totalRow=FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}
	
	// 파일 전체 목록 얻어오기 
	//List<FileDto> list=FileDao.getInstance().getList();
	
	//보여줄 페이지에 맞는 목록만 얻어오기 
	List<FileDto> list=FileDao.getInstance().getList(startRowNum, endRowNum);
	
	// 로그인된 사용자 읽어오기 (로그인 되지 않았다면 null 이다)
	String id=(String)session.getAttribute("id");
	
	// 전체 글의 개수를 구하는 메소드 호출
	int mCount = FileDao.getInstance().getCount();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<%-- 
		/include/navbar.jsp 포함시키기
		피 포함되는 jsp 페이지에 파라미터를 전달할 수 있다.
		아래 코드는 current 라는 파라미터 명으로 index 라는 문자열을 전달하는 것이다.
		따라서, navbar.jsp 페이지에서는 해당 문자열을 아래와 같이 추출할 수 있다.
		String result = request.getParameter("current"); // "index"
	--%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="file" name="current"/>
	</jsp:include>
	<div class="container">
		<a class="btn btn-outline-primary mb-2" href="${pageContext.request.contextPath}/file/protected/upload_form.jsp">업로드 하러 가기</a>
		<br />
		<a class="btn btn-outline-success mb-2" href="${pageContext.request.contextPath}/">홈으로 가기</a>
		<h1 class="mb-4">자료실 목록입니다</h1>
		<h4>전체 글 수 : <%=mCount %> 개</h4>
		<table class="table table-striped mt-3">
			<thead>
				<tr>
					<th class="col">번호</th>
					<th class="col">작성자</th>
					<th class="col">제목</th>
					<th class="col">파일명</th>
					<th class="col">크기 (byte)</th>
					<th class="col">등록일</th>
					<th class="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getTitle() %></td>
						<td>
							<a href="${pageContext.request.contextPath}/file/download?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName() %></a>
						</td>
						<td><%=tmp.getFileSize() %> byte</td>
						<td><%=tmp.getRegdate() %></td>
						<td>
							<%-- 글 작성자와 로그인된 아이디와 같을때만 삭제 링크를 출력해 준다 --%>
							<%if(tmp.getWriter().equals(id)){ %>
								<a href="protected/delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
							<%}%>
						</td>
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
			 	<li class="page-item">
			 		<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
			 	</li>
			 <%} %>
			 
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i == pageNum){ %>
					<li class="active">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%}else{ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>	
			<%} %>
			<!-- 
				마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다.
			 -->
			<%if(endPageNum < totalPageCount) {%>
			 	<li class="page-item">
			 		<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
			 	</li>
			 <%} %>
		</ul>
	</div>
</body>
</html>