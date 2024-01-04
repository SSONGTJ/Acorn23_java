package com.example.boot06;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home(Model m) {
		//응답에 필요한 데이터는
		String fortuneToday="동쪽으로 가면 귀인을 만나요";
		
		//Model 객체에 담아주면 된다.
		m.addAttribute("fortuneToday", fortuneToday);
		
		//templates/home.html 을 타임리프 뷰 엔진이 해석해서 응답
		return "home";
	}
	@ResponseBody
	@GetMapping("/sub/study")
	public String study() {
		return "열심히 공부 ㄱ";
	}
	@ResponseBody
	@GetMapping("/sub/play")
	public String play() {
		return "열심히 놀자";
	}
	
}
