<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//어느 페이지에 포함되었는지 정보를 얻어오기
	String currentPage=request.getParameter("current"); // "index" or "member" or "guest"
	// EL로 가져오면 ${param.current }
	
	// id 가져옴
	String id = (String)session.getAttribute("id");
	// EL 로 가져오면 ${sessionScope.id} => 이걸 줄이면 ${id}
%>

<!-- 
	어두운색 계열의 navbar 배경색이면 data-bs-theme="dark" 속성을 추가한다 
	navbar-expand-md 는 md 영역 이상에서 navbar-collapse 가 펼쳐 지도록 한다.
-->
<nav class="navbar bg-success navbar-expand-md" data-bs-theme="dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">
      <img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      Acorn
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    		data-bs-target="#navbarText">
     		<span class="navbar-toggler-icon"></span>
   	</button>

    <div class="collapse navbar-collapse" id="navbarText">
	   	<ul class="navbar-nav me-auto">
        	<li class="nav-item">
        	<%-- 
        		<a class="nav-link <%=currentPage.equals("cafe")? "active":"" %>" href="${pageContext.request.contextPath }/cafe/index.jsp">게시판</a>
        	 --%>
          		<a class="nav-link ${param.current eq 'cafe' ? 'active':'' }" href="${pageContext.request.contextPath }/cafe/index.jsp">게시판</a>
        	</li>
        	<li class="nav-item">
        	<%-- 
        		<a class="nav-link <%=currentPage.equals("file")? "active":"" %>" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
        	 --%>
          		<a class="nav-link ${param.current eq 'file' ? 'active':'' }" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
        	</li>
      	</ul>
      	<%-- 
	      	<div class="navbar-nav">
	      		<%if(id != null) {%>
	      		<a class="nav-link" href="${pageContext.request.contextPath}/user/protected/info.jsp"><strong><%=id %></strong>님 ㅎㅇ</a>
	      		<a class="nav-link" href="${pageContext.request.contextPath}/user/logout.jsp">로그아웃</a>
	      		<%}else{ %>
	      		<a class="nav-link" href="${pageContext.request.contextPath}/user/loginform.jsp" class="nav-link">로그인</a>
	      		<a class="nav-link" href="${pageContext.request.contextPath}/user/signup_form.jsp" class="nav-link">회원가입</a>
	      		<%} %>
	      	</div>
      	 --%>
      	
      	<div class="navbar-nav">
      		<c:choose>
      			<c:when test="${not empty id}">
	      			<a class="nav-link" href="${pageContext.request.contextPath}/user/protected/info.jsp"><strong>${id }</strong>님 ㅎㅇ</a>
	      			<a class="nav-link" href="${pageContext.request.contextPath}/user/logout.jsp">로그아웃</a>
      			</c:when>
      			<c:otherwise>
      				<a class="nav-link" href="${pageContext.request.contextPath}/user/loginform.jsp" class="nav-link">로그인</a>
      				<a class="nav-link" href="${pageContext.request.contextPath}/user/signup_form.jsp" class="nav-link">회원가입</a>
      			</c:otherwise>
      		</c:choose>
      	</div>
    </div>
  </div>
</nav>