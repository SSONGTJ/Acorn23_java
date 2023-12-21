package com.example.boot04;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/member/list")
	public String member() {
		return "";
	}
	@GetMapping("/")
	public String home(Model model) {
		// 공지사항
		List<String> list=new ArrayList<String>();
		list.add("추운 겨울임");
		list.add("감기 조심");
		list.add("어쩌고...");
		list.add("저쩌고");
		model.addAttribute("noticeList",list);
		// templates/home.html 리턴
		return "home";
	}
}
