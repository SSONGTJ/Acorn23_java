<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test04.jsp</title>
</head>
<body>
	<h1>폼에 입력한 내용을 페이지 전환 없이 전송하기</h1>
	<form action="login.jsp" method="post" id="myForm">
		<input type="text" name="id" placeholder="아이디 입력..."/>
		<input type="text" name="pwd" placeholder="아이디 입력..."/>
		<button type="submit">로그인</button>
	</form>
	
	<form action="login.jsp" method="get" id="myForm2">
		<input type="text" name="id" placeholder="아이디 입력..."/>
		<input type="text" name="pwd" placeholder="아이디 입력..."/>
		<button type="submit">로그인</button>
	</form>
	<script>
		// 폼 안에 있는 제출버튼(submit) 을 클릭하면 폼에는 submit 이라는 이벤트가 발생한다.
		document.querySelector("#myForm").addEventListener("submit",(e)=>{
			alert("오잉 제출?");
			// 함수에 전달되는 event 객체의 preventDefault() 함수를 호출하면
			e.preventDefault();
			// 폼에 입력한 내용을 직접 읽어와서 fetch() 함수를 이용해서 원하는 페이지로 전송을 해야한다.
			
			// 폼의 참조값을 읽어온다.
			const form = document.querySelector("#myForm");
			// 폼에 입력한 내용을 query string 형식으로 변환해서 얻어낸다.
			const queryString = new URLSearchParams(new FormData(form)).toString();
			// query string 을 콘솔에 출력
			console.log(queryString);
			
			//fetch() 함수를 이용해서 post 방식 요청하기
			fetch("login.jsp",{
				method:"POST",
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},
				body:queryString
			})
			.then(res=>res.json())
			.then(data=>{
				console.log(data);
			})
		});
		
		document.querySelector("#myForm2").addEventListener("submit",(e)=>{
			alert("오잉 제출?");
			// 함수에 전달되는 event 객체의 preventDefault() 함수를 호출하면
			e.preventDefault();
			// 폼에 입력한 내용을 직접 읽어와서 fetch() 함수를 이용해서 원하는 페이지로 전송을 해야한다.
			
			// 폼의 참조값을 읽어온다.
			const form = document.querySelector("#myForm2");
			// 폼에 입력한 내용을 query string 형식으로 변환해서 얻어낸다.
			const queryString = new URLSearchParams(new FormData(form)).toString();
			// query string 을 콘솔에 출력
			console.log(queryString);
			
			//fetch() 함수를 이용해서 get 방식 요청하기
			fetch("login.jsp"+?queryString)
			.then(res=>res.json())
			.then(data=>{
				console.log(data);
			})
		});
	</script>
</body>
</html>