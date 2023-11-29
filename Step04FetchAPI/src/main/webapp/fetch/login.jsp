<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- /fetch/login.jsp --%>
<%
	request.setCharacterEncoding("utf-8");
	//요청 파라미터 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//아이디와 비밀번호가 유효한지 여부
	boolean isVaild = false;
	//아이디는 gura 비밀번호는 1234가 유효한 정보라고 가정하자
	if (id.equals("gura") && pwd.equals("1234")){
		isVaild = true;	
	}
%>
{"isSuccess":<%=isVaild %>}
