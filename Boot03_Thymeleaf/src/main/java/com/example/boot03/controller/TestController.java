package com.example.boot03.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.boot03.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TestController {
	@GetMapping("/members")
	public String members(HttpServletRequest request) {
		MemberDto dto1 = new MemberDto(1,"김구라", "노량진");
		MemberDto dto2 = new MemberDto(2,"김태준", "신림");
		MemberDto dto3 = new MemberDto(3,"김혜란", "노량진");
		
		List<MemberDto> list = new ArrayList<>();
		list.add(dto1);
		list.add(dto2);
		list.add(dto3);
		
		//model 객체에 담으면 자동으로 HttpServletRequest 객체에 이런식으로 담기는 것이다.
		//Spring 프레임워크가 담아준다.
		request.setAttribute("list", list);
		return "sub/members";
	}
	
	@GetMapping("/notice")
	public String notice(Model model) {
		//DB에서 읽어온 공지사항이라고 가정
		List<String> list = new ArrayList<>();
		list.add("날씨가 추워요");
		list.add("곧 크리스마스입니다");
		list.add("어쩌고");
		
		model.addAttribute("list",list);
		
		return "sub/notice";
	}
	
	@GetMapping("/member")
	public String member(Model model) {
		// 응답에 필요한 데이터
		MemberDto dto = new MemberDto(1,"김구라", "노량진");
		// 응답에 필요한 데이터를 Model 객체에 담는다.
		model.addAttribute("dto",dto);
		
		// /templates/sub/member.html
		return "sub/member";
	}
	
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
