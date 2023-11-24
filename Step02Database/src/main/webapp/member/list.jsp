<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
		//아래 table 에 출력할 회원목록 얻어오기
		List<MemberDto> list = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try{
			//DbcpBean() 객체를 이용해서 Connection 객체 하나 얻어내기 (Connection Pool 에서 하나 꺼내오기)
			conn=new DbcpBean().getConn();
			// 실행할 sql 문
			String sql = "SELECT * FROM member order by num asc";
			pstmt = conn.prepareStatement(sql);
			//query 문 수행하고 결과(ResultSet)얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서
			while(rs.next()){
				//MemberDto 객체에 회원 한명, 한명의 정보를 담아서
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList 객체에 누적 시킨다.
				list.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if (rs!=null) rs.close();
				if (pstmt!=null) pstmt.close();
				if (conn!=null) conn.close();	//Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원 목록입니다.</h1>
		<a href="${pageContext.request.contextPath}/member/insertform.jsp">회원추가</a>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% for (MemberDto dto : list) { %>
                    <tr>
                        <td><%= dto.getNum() %></td>
                        <td><%= dto.getName() %></td>
                        <td><%= dto.getAddr() %></td>
                        <td>
                        	<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
                        </td>
                        <td>
                        	<a href="delete.jsp?num=<%=dto.getNum()%>">삭제</a>
                        </td>
                    </tr>
                <% } %>
			</tbody>
		</table>
	</div>
</body>
</html>