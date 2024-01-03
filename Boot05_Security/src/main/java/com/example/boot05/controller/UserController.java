package com.example.boot05.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
	
	//세션 허용 개수 초과시
	@GetMapping("/user/expired")
	public String userExpired() {
		return "user/expired";
	}
	//권한 부족시 or 403 인 경우
	@GetMapping("/user/denied")
	public String userDenide() {
		return "user/denied";
	}
	
	//ROLE_STAFF, ROLE_ADMIN 만 요청 가능
	@GetMapping("/staff/user/list")
	public String userList() {
		return "user/list";
	}
	//ROLE_ADMIN 만 요청 가능
	@GetMapping("/admin/user/manage")
	public String userManage() {
		return "user/manage";
	}
	
	//로그인이 필요한 요청경로를 로그인 하지 않은 상태로 요청하면 리다이렉트 되는 요청경로
	@PostMapping("/user/required_loginform")
	public String required_loginform() {
		return "user/required_loginform";
	}
	
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
