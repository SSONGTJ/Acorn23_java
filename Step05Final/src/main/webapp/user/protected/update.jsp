<%@page import="test.user.dao.UserDao"%>
<%@page import="test.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 수정할 회원의 정보를 읽어온다.
	String email = request.getParameter("email");
	//수정할 회원의 PK (아이디)
	String id=(String)session.getAttribute("id");
	
	//수정할 프로필 이미지 (프로필이 한번도 등록한적이 없으면 "null" 이 넘어온다.)
	String profile = request.getParameter("profile");
	if(profile.equals("null")){
		//DB의 profile 칼럼을 null 로 유지하기 위해 null 을 넣어준다.
		profile=null;
	}
	//수정할 회원의 정보를 UserDto 에 담고
	UserDto dto = new UserDto ();
	dto.setId(id);
	dto.setEmail(email);
	dto.setProfile(profile);
	//DB에 수정반영하고
	boolean isSuccess = UserDao.getInstance().update(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/protected/update.jsp</title>
</head>
<body>
		<%if(isSuccess){%>
			<script>
				//알림창을 띄우고
				alert("수정 했습니다.");
				// location 객체를 이용해서 회원 목록보기로 리다이렉트 시키기
				location.href="${pageContext.request.contextPath}/user/protected/info.jsp";
			</script>
		<%}else {%>
			<h1>알림</h1>
			<p>
				수정 실패!
				<a href="updateform.jsp?num=<%=id %>">다시 수정하러 가기</a>
			</p>
		<%} %>
</body>
</html>