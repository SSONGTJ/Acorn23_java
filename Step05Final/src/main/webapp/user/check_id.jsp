<%@page import="test.user.dto.UserDto"%>
<%@page import="test.user.dao.UserDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /user/check_id.jsp --%>
<%
	// 1. get 방식 파라미터로 전달되는 입력한 id 값을 읽어온다.
	String id = request.getParameter("id");
	// 2. DB에서 해당 회원의 정보가 있는지 select 한다.
	UserDto dto = UserDao.getInstance().getData(id);
	// 3. 해당 아이디 사용가능 여부를 json 문자열로 응답한다.
	boolean canUse = false;
	if (dto == null){
		canUse = true;
	} else {
		if (dto.getId().equals(id)){
			canUse = false;
		} else {
			canUse = true;
		}
	}
	
%>
{"canUse":<%=canUse %>}