<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f6f2; /* 베이지색 */
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            overflow: hidden;
        }

        .header {
            background-color: #ffbb00; /* 금색 */
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin: 0;
        }

        ul {
            list-style: none;
            padding: 20px;
            text-align: center;
        }

        li {
            margin-bottom: 10px;
        }

        a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: #ffbb00; /* 금색 */
        }
    </style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>인덱스 페이지 입니다.</h1>
		</div>
		<ul>
			<li><a href="test.jsp">Connection 객체 잘 얻어오는지 확인하기</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list.jsp">회원목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list2.jsp">회원목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/dept/list.jsp">부서목록 보기</a></li>
			<li><a href="${pageContext.request.contextPath}/guest/list.jsp">방명록 보기</a></li>
		</ul>
	</div>
</body>
</html>