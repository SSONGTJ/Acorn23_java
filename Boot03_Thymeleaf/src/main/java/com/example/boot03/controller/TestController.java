package com.example.boot03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	//GET 방식 /shop/buy 요청을 처리할 컨트롤러 메소드
	@GetMapping("/shop/buy")
	public String buy (String id, int amount) {
		
		return "shop/buy";
	}
	
	//GET 방식 /sub/play 요청을 처리할 컨트롤러 메소드
	@GetMapping("/sub/play")
	public String play() {
		//templates/sub/play.html 템플릿으로 해석해서 응답하기
		return "sub/play";
	}
	
}
