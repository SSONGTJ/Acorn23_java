<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test03.jsp</title>
</head>
<body>
	<button id="getBtn">회원정보 가져오기</button>
	<p>번호 : <strong id="num"></strong></p>
	<p>이름 : <strong id="name"></strong></p>
	<p>주소 : <strong id="addr"></strong></p>
	<button id="getBtn2">친구 목록 가져오기</button>
	<ul id="friend">
	
	</ul>
	<script>
		/*
			친구 목록 가져오기 버튼을 눌렀을 때 get_friend.jsp 페이지로 fetch()요청을 하고
			응답되는 데이터를 이용해서 친구이름을 ul에 li 요소를 이용해서 목록 출력해보세요.
		*/
		document.querySelector("#getBtn2").addEventListener("click",()=>{
			fetch("get_friend.jsp")
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
				//data 는 ["김구라","해골","원숭이","주뎅이","덩어리"] 형식의 배열이다. \${h1} \${pageContext.request.contextPath}
				
				data.forEach(item=>{
					//item은 문자열이다. (친구 이름)
					const li = "<li>"+item+"</li>";
					//const li = `<li>\${item}</li>`;
					
					//아래는 웹브라우저가 아닌 json 이 우선적으로 해석해버려서 쓸 수 없다.
					//const li = `<li>${item}</li>`;
					// li요소를 만들어 낼 수 있는 문자열을 전달해서 실제 li 요소를 만들어서 원하는 곳에 끼워넣기
					document.querySelector("#friend").insertAdjacentHTML("beforeend",li);
				});

			});
		});
		
		
	
		/*
			회원 정보 가져오기 버튼을 눌렀을 때 get_member.jsp 페이지로 fetch() 요청을 하고
			응답되는 데이터를 이용해서 위 회원의 번호, 이름, 주소를 출력 해 보쇼
		*/
		
		//문자열을 입력하고 전송 버튼을 눌렀을 때 입력한 문자열을 읽어와서 get_member.jsp 페이지로 전송이 되도록 하기
		document.querySelector("#getBtn").addEventListener("click",()=>{
			// fethch 함수를 호출하면서 GET 방식 파라미터로 get_member.jsp 페이지에 요청하면서 전달한다.
			fetch("get_member.jsp?")
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
				document.querySelector("#num").innerText=data.num;
				document.querySelector("#name").innerText=data.name;
				document.querySelector("#addr").innerText=data.addr;
			});
			
			
		});
	</script>
</body>
</html>