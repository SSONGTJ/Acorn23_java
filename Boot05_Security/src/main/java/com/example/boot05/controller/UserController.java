package com.example.boot05.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
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
