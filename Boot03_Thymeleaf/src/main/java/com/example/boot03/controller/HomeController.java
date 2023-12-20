package com.example.boot03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {
	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		// Model 객체에 담은 데이터는 request 영역에 담긴다.
		model.addAttribute("fortuneToday", "동쪽으로 가면 귀인을 만나요!");
		
		//테스트를 위해 Model 객체에 추가 정보 담기
		model.addAttribute("id", "abc111");
		model.addAttribute("amount",2);
		
		//경로 파라미터 테스트를 위한 정보 담기
		model.addAttribute("num",999);
		
		// session 영역에 id라는 키값으로 kimgura 담기
		//session.setAttribute("id", "kimgura");
		
		// 여기서 리턴한 문자열 앞에는 /templates/ 가 붙고, 뒤에는 .html 이 붙어서
		// /templates/home.html 을 가리키게 된다.
		return "home";
	}	
}
