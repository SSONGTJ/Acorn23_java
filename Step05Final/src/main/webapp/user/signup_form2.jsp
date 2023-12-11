<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container" id="app">
		<h3>회원가입 폼 입니다</h3>
		<form action="signup.jsp" method="post">
			<div class="mb-2">
				<label class="form-label" for="id">아이디</label>
				<input class="form-control"
					@blur="onIdInput"
					:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}"
					type="text" name="id" id="id"/>
				<small class="form-text">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
			</div>
			<div class="mb-2">
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control"
					@input="onPwdInput"
					v-model="Pwd"
					:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}"
					type="password" name="pwd" id="pwd"/>
				<small class="form-text">특수 문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀 번호를 확인 하세요</div>
			</div>
			<div class="mb-2">
				<label class="form-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control"
					@input="onPwdInput"
					v-model="Pwd2"
					type="password"  id="pwd2"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="email">이메일</label>
				<input class="form-control"
					@input="onEmailInput"
					:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}"
					type="email" name="email" id="email"/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>
			<button class="btn btn-primary btn-sm" type="submit" :disabled="!isIdValid || !isPwdValid || !isEmailValid">가입</button>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
	new Vue ({
		el:"#app",
		data:{
			isIdValid:false, //아이디 유효성 여부를 관리할 변수
			isPwdValid:false, //비밀번호 유효성 여부를 관리할 변수 
			isEmailValid:false, //이메일 유효성 여부를 관리할 변수
			Pwd:"",
			Pwd2:"",
			isIdDirty:false,
			isPwdDirty:false,
			isEmailDirty:false
		},
		methods:{
			onIdInput(e){
				//아이디를 검증할 정규표현식 객체 
				const reg_id=/^[a-z].{4,9}$/;
				const inputId = e.target.value;
				this.isIdDirty=true;
				if (!reg_id.test(inputId)){
					//사용할수 없는 아이디라는 의미에서 false 를 넣어준다.
					return;
				} else {
					//fetch() 함수를 이용해서 get 방식으로 입력한 아이디를 보내고 사용가능 여부를 json 으로 응답받는다.
					fetch("${pageContext.request.contextPath}/user/check_id.jsp?id="+inputId)
					.then(res=>res.json())
					.then(data=>{
						//data 는 {canUse:true} or {canUse:false} 형태의 object 이다.
						if(data.canUse){
							//사용할수 있는 아이디라는 의미에서 true 를 넣어준다.
							this.isIdValid=true;
						}else{
							//사용할수 없는 아이디라는 의미에서 false 를 넣어준다.
							this.isIdValid=false;
						}
					});
				}
			},
			onPwdInput(e){
				//비밀 번호를 검증할 정규 표현식(특수문자 포함여부)
				const reg_pwd=/[\W]/;
				if (reg_pwd.test(this.Pwd) && (this.Pwd === this.Pwd2)){
					this.isPwdValid=true;
				}else {
					this.isPwdValid=false;
				}
				this.isPwdDirty=true;
			},
			onEmailInput(e){
				//이메일을 검증할 정규 표현식
				const reg_email=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				const email = e.target.value;
				if(reg_email.test(email)){
					this.isEmailValid=true;
				}else{
					this.isEmailValid=false;
				}
				this.isEmailDirty=true;
			}
		}
	});		
	</script>
</body>
</html>