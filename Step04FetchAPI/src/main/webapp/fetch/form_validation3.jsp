<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/form_validation.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>폼 유효성 검증 style 테스트</h1>
		<form action="signup.jsp" method="post">
			<div>
				<label class="form-label" for="nick">닉네임</label>
				<input class="form-control is-invalid" type="text" name="nick" id="nick"/>
				<div class="form-text">영문 대소문자만 가능</div>
				<div class="invalid-feedback">사용할 수 없는 닉네임 입니다!</div>
				<div class="valid-feedback">사용 가능!</div>
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="text" class="form-control is-invalid" name="pwd" id="pwd"/>
				<div class="invalid-feedback">비밀번호를 확인하쇼</div>
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label>
				<input type="text" class="form-control" id="pwd2"/>
			</div>
			<button class="btn btn-primary" type="submit" disabled>가입</button>
		</form>
	</div>
	<script>
		//아이디 유효성 여부를 관리할 변수
		let isNickValid = false;
		//비밀번호 유효성 여부 관리할 변수
		let isPwdValid = false;
		//닉네임 정규표현식 (영문 대소문자만 가능하도록)
		const regNick=/^[a-zA-Z]+$/;
		/*
			닉네임을 입력했을 때 유효성 여부를 변수에 저장한다.
			비밀번호를 입력했을 때 유효성 여부를 변수에 저장한다.
			두 변수에 있는 값이 모두 true 일 때만 가입 버튼의 disabled 속성을 제거하고
			나머지 경우에는 disabled 속성을 추가하는 함수를 만들어 두고
			적절한 시점에 그 함수를 호출하게 하면 된다.
			-disabled 속성 추가하는 방법
			버튼의 참조값.SetAttribute("disabled","")
			-disabled 속성 제거하는 방법
			버튼의 참조값.removeAttribute("disabled")
		*/
	
		//닉네임을 입력했을 때 실행할 함수 등록
		document.querySelector("#nick").addEventListener("input",()=>{
			//현재까지 입력한 닉네임을 읽어온다.
			let inputNick=document.querySelector("#nick").value;
			//만일 정규 표현식을 통과하지 못했다면
			if(!regNick.test(inputNick)){
				document.querySelector("#nick").classList.add("is-invalid")
				//사용할 수 없는 닉네임이라는 의미에서 false 를 넣어준다.
				isNickValid=false;
				return;
			}
			//fetch() 함수를 이용해서 get 방식으로 입력한 닉네임을 보내고 사용가능 여부를 json으로 응답받는다.
			fetch("${pageContext.request.contextPath}/fetch/check_nick.jsp?nick="+inputNick)
			.then(res=>res.json())
			.then(data=>{
				//일단 클래스를 제거한 후에
				document.querySelector("#nick").classList.remove("is-valid")
				document.querySelector("#nick").classList.remove("is-invalid")
				//data 는 {canUse:true} or {canUse:false} 형태의 object 이다.
				if(data.canUse){	
					document.querySelector("#nick").classList.add("is-valid")
					isNickValid = true;
				}else {
					document.querySelector("#nick").classList.add("is-invalid")
					isNickValid = false;
					console.log("닉네임 false");
				}
				checkSub();
			});
		});
		
		//비밀번호 확인 (내가 한거)
		/*
		document.querySelector("#pwd").addEventListener("input",()=>{
			let pwd=document.querySelector("#pwd").value;
			document.querySelector("#pwd2").addEventListener("input",()=>{
				let pwd2=document.querySelector("#pwd2").value;
				if(pwd===pwd2){
					document.querySelector("#pwd").classList.remove("is-invalid");
					document.querySelector("#pwd").classList.add("is-valid");
				}else {
					document.querySelector("#pwd").classList.remove("is-valid");
					document.querySelector("#pwd").classList.add("is-invalid");
				}
			});
		});
		*/
			
		// 강사님이 한거
		const checkPwd= ()=>{
			//양쪽에 입력한 비밀번호를 읽어와서
			let pwd=document.querySelector("#pwd").value;
			let pwd2=document.querySelector("#pwd2").value;
			//양쪽을 같게 입력하면 is-valid 를 추가하고 그렇지 않으면 is-invalid 를 #pwd에 추가
			document.querySelector("#pwd").classList.remove("is-invalid");
			document.querySelector("#pwd").classList.remove("is-valid");
			if(pwd===pwd2){
				document.querySelector("#pwd").classList.add("is-valid")
				isPwdValid = true;
			}else{
				document.querySelector("#pwd").classList.add("is-invalid")
				isPwdValid = false;
			}
			checkSub();
		};		
			
		document.querySelector("#pwd").addEventListener("input",checkPwd);
		document.querySelector("#pwd2").addEventListener("input",checkPwd);
		
		
		const checkSub=()=>{
			if(isNickValid && isPwdValid){
				console.log("true 조건")
				document.querySelector("[type=submit]").removeAttribute("disabled");
			}else {
				console.log("false 조건")
				document.querySelector("[type=submit]").setAttribute("disabled", "");
			}
		};
		
	</script>
</body>
</html>