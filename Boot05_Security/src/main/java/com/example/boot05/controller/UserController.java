package com.example.boot05.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
	
	//로그인폼을 제출(post) 한 로그인 프로세스 중에 forward 되는 경로이기 때문에 @PostMapping임 주의!
	@PostMapping("/user/login_fail")
	public String loginFail() {
		//로그인 실패임을 알릴 페이지
		return "user/login_fail";
	}
	@GetMapping("/user/loginform")
	public String loginform() {
		//templates/user/loginform.html 페이지로 forward 이동해서 응답
		return "user/loginform";
	}
	@PostMapping("/user/login_success")
	public String loginSuccess() {
		return "user/login_success";
	}
}
