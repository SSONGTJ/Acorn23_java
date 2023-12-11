<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope 에 id 라는 키 값으로 저장된 값이 있는지 읽어와 본다.
	// null 이면 로그인을 하지 않은 상태, null 이 아니면 로그인된 아이디가 리턴된다.
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/index.html</title>
<link href="${pageContext.request.contextPath}/cafe/css/index.css" rel="stylesheet">
</head>
<body>
	
	<div class="container">
		<%if(id != null) {%>
			<p>
				<a href="${pageContext.request.contextPath}/user/protected/info.jsp"><strong><%=id %></strong>님 로그인 중...</a>
				<a href="${pageContext.request.contextPath}/user/logout.jsp">로그아웃</a>
			</p>
		<%}else{ %>
			<a href="${pageContext.request.contextPath}/user/loginform.jsp">로그인</a>
		<%} %>
		<h2>231206 과제!</h2>
		<p id="assignment">
		★ 과제 (231207 오후까지)<br />
		<br />
		[ board_cafe 테이블과 board_cafe_seq 시퀀스를 이용해서 게시글에 관련된 기능을 구현해 보세요 ] <br />
		<br />
		- 만들어야 하는 클래스<br />
		 
		    CafeDto ,  CafeDao<br />
		   <br /> 
		- 만들어야 하는 jsp 페이지<br />
		Ｖ 글 목록보기 ( /cafe/list.jsp )<br />
		Ｖ 새글 작성폼 ( /cafe/protected/insertform.jsp )<br />
		Ｖ 새글 저장 ( /cafe/protected/insert.jsp)<br />
		Ｖ 글 자세히 보기 (/cafe/detail.jsp)<br />
		Ｖ 글 삭제하기 (/cafe/protected/delete.jsp)<br />
		Ｖ 글 수정폼 (/cafe/protected/updateform.jsp)<br />
		Ｖ 글 수정 저장 (/cafe/protected/update.jsp)<br />
		<br />
		- 조건<br />
		Ｖ 글목록에는 수정, 삭제 링크를 출력하지 않는다.<br />
		Ｖ 글목록에는 글 내용을 출력하지 않는다.<br />
		Ｖ 글 제목을 클릭하면 자세히 보기 페이지로 이동하도록 한다.<br />
		Ｖ 글 자세히 보기 페이지에서 만일 본인이 작성한 글인 경우에만 [수정] [삭제] 링크를 제공한다.<br />
		Ｖ 새글을 작성할때 글 내용은 textarea 를 이용해서 입력을 받는다<br />
		Ｖ 글 자세히 보기 페이지에서 글 내용은 textarea 를 이용해서 출력한다.<br />
		Ｖ 페이징 처리도 해 보세요<br />
		<br />
		num NUMBER PRIMARY KEY, -- 글 번호<br />
		writer VARCHAR2(100) NOT NULL, -- 작성자 (로그인된 아이디)<br />
		title VARCHAR2(100) NOT NULL, -- 제목<br />
		content CLOB, --글 내용<br />
		viewCount NUMBER, -- 조회수<br />
		regdate DATE -- 글 작성일<br />
		board_cafe_seq<br />
		</p>
		<button id="assignClick">과제 설명 열기</button>

		<ul>
			<li><a href="${pageContext.request.contextPath}/user/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/user/protected/info.jsp">가입정보</a></li>
			<li><a href="${pageContext.request.contextPath}/cafe/list.jsp">글 목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/cafe/protected/insertform.jsp">새글 작성 폼</a></li>
		</ul>
	</div>
	
	<script>
		document.querySelector("#assignClick").addEventListener("click",()=>{
			if(document.querySelector("#assignment").style.display === 'block'){
				document.querySelector("#assignment").style.display='none';
				document.querySelector("#assignClick").innerText = "과제 설명 열기";
			} else {
				document.querySelector("#assignment").style.display='block';
				document.querySelector("#assignClick").innerText = "과제 설명 닫기";
			}
		});
	</script>
</body>
</html>