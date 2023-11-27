<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.lunch.dto.LunchDto"%>
<%@page import="java.util.List"%>
<%@page import="test.lunch.dao.LunchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//LunchDao 객체의 참조값을 static 메소드를 이용해서 얻어온다.
	LunchDao dao = LunchDao.getInstance();

	//아래의 table에 출력할 회원목록 얻어오기
	List<LunchDto> list = dao.getList();
	
	// list 를 lunchMenu 배열에 담기
	List<String> lunchMenu = new ArrayList<String>();
	for (LunchDto tmp:list){
		lunchMenu.add(tmp.getMenu());
	}
	
	// 랜덤 객체
	Random random = new Random();
    int randomIndex = random.nextInt(lunchMenu.size());
    String selectedMenu = lunchMenu.get(randomIndex);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/lunch/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<style>
	.logdiv {margin:20px auto; text-align:center;}
</style>
</head>
<body>
	<%-- /include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="lunch" name="current"/>
	</jsp:include>
	<div class="logdiv">
		<form action="${pageContext.request.contextPath}/log/save.jsp" method="post" id="login">
			<input type="text" name="nick" palceholder="닉네임 입력..." />
			<button type="submit">로그인</button>
		</form>
	</div>
	<!-- 로그인 하는 경우에만 내용이 보이기 -->
	<%  
		String nick = (String)session.getAttribute("nick");
	%>
	<%if(nick!=null){%>
		<script>
			document.querySelector("#login").style.display='none';
		</script>
		<div class="container">
		
		<p>
			<strong><%=nick %></strong>님 반갑습니다.
			<a href="${pageContext.request.contextPath}/log/logout.jsp">로그아웃</a>
		</p>
		
		<h1>점심 뭐먹지?</h1>
		<a href="${pageContext.request.contextPath}/lunch/insertform.jsp">메뉴 추가</a>
		<table class="table table-striped">
			<colgroup>
				<col class="col-1"/>
				<col class="col-2"/>
				<col class="col-3"/>
				<col class="col-3"/>
				<col class="col-1"/>
				<col class="col-1"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>메뉴</th>
					<th>위치</th>
					<th>한줄평</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(LunchDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getMenu() %></td>
						<td><%=tmp.getLoc() %></td>
						<td><%=tmp.getReview() %></td>
						<td>
							<a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a>
						</td>
						<td>
							<a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		
		<h2><%=nick %>님의 오늘 점심 메뉴는~</h2>
        <button onclick="getRandomMenu()">기회는 단 한번</button>
        <p id="result"></p>
		
		<script>
	        function getRandomMenu() {
	            // 선택된 메뉴를 화면에 표시
	            document.getElementById("result").innerHTML = "<%=nick%>님 오늘은 이거! : <%= selectedMenu %>";
	        }
   		 </script>
		
		</div>
		
	<%}%>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>