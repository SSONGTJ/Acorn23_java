<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/form_validation.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container animate__animated animate__rotateIn">
		<h1>폼 유효성 검증 style 테스트</h1>
		<form action="signup.jsp" method="post">
			<div class="animate__animated animate__bounceInDown animate__delay-1s">
				<label class="form-label" for="nick">닉네임</label>
				<input class="form-control is-invalid" type="text" name="nick" id="nick"/>
				<div class="form-text">영문 대소문자만 가능</div>
				<div class="invalid-feedback">사용할 수 없는 닉네임 입니다!</div>
				<div class="valid-feedback">사용 가능!</div>
			</div><br />
			<div class="animate__animated animate__bounceInLeft animate__delay-2s">
				<label for="pwd">비밀번호</label>
				<input type="text" class="form-control is-invalid" name="pwd" id="pwd"/>
				<div class="invalid-feedback">비밀번호를 확인하쇼</div>
			</div>
			<div class="animate__animated animate__bounceInRight animate__delay-2s">
				<label for="pwd2">비밀번호 확인</label>
				<input type="text" class="form-control" id="pwd2"/>
			</div><br />
			<div class="animate__animated animate__bounceInUp animate__delay-3s">
				<label class="form-label" for="comment">하고 싶은 말</label>
				<textarea class="form-control animate__animated" name="comment" id="comment" rows="3"></textarea>
				<div class="form-text">100글자 이내로 입력해주세요.</div>
				<div class="form-text">글자 수 : <strong id="textCount">0</strong></div>
			</div><br />
			<button class="btn btn-primary animate__animated animate__lightSpeedInRight animate__delay-4s" type="submit" disabled>가입</button>
		</form>
	</div>
	<script>
		//아이디 유효성 여부를 관리할 변수
		let isNickValid = false;
		//비밀번호 유효성 여부 관리할 변수
		let isPwdValid = false;
		//하고 싶은 말 유효성 여부를 관리할 변수
		let isCommentValid = true;
		
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
	
		//닉네임을 입력하고 포커스를 다른곳으로 이동했을 때 검증 수행하기 (blur 는 focus를 잃었을 때 발생하는 이벤트)
		document.querySelector("#nick").addEventListener("blur",()=>{
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
			// 만일 닉네임도 유효하고, 비밀번호도 유효하고, 하고싶은말도 유효하다면
			if(isNickValid && isPwdValid && isCommentValid){
				console.log("true 조건")
				document.querySelector("[type=submit]").removeAttribute("disabled");
			}else {
				console.log("false 조건")
				document.querySelector("[type=submit]").setAttribute("disabled", "");
			}
		};
		
		document.querySelector("#comment").addEventListener("input",(e)=>{
			/* 내가 한것
			// textarea 에서 글자수 읽어오기
			let taText = document.querySelector("#comment").value.length;
			if(taText <= 100){
				document.querySelector("#comment").classList.remove("is-invalid");
				document.querySelector("#comment").nextElementSibling.classList.remove("invalid-feedback");
			}else{
				document.querySelector("#comment").classList.add("is-invalid");
				document.querySelector("#comment").nextElementSibling.classList.add("invalid-feedback");
			}
			*/
			
			//이 함수에는 발생한 이벤트에 대한 정보를 가지고 있는 event 객체가 매개변수에 전달된다.
			//e.target = document.querySelector("#comment")
			console.log(e);
			//입력한 문자열 읽어오기
			const msg=e.target.value;
			// 문자열의 길이
			const length=msg.length;//e.target.value.length 해서 한번에 쓸 수도 있다.

			if (length > 100){
				e.target.classList.add("is-invalid");
				e.target.nextElementSibling.classList.add("invalid-feedback");
				isCommentValid = false;
				
				//애니메이션 효과를 주기 위해
				e.target.classList.add("animate__shakeX");
				//"animationend" 이벤트가 일어 났을 때 "animate__shakeX" 클래스를 제거해보쇼
				e.target.addEventListener("animationend", ()=>{
					e.target.classList.remove("animate__shakeX");
				}, {once:true});
				
			}else{
				e.target.classList.remove("is-invalid");
				e.target.nextElementSibling.classList.remove("invalid-feedback");
				isCommentValid = true;
			}
			
			// 글자 수 출력하기
			document.querySelector("#textCount").innerText=length;
			checkSub();
		});
	</script>
</body>
</html>