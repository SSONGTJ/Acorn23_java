package com.example.boot04.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.boot04.member.dao.MemberDao;
import com.example.boot04.member.dto.MemberDto;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class MemberController {
	
	//의존 객체 주입 받기 ( Dependency Injection )
	@Autowired MemberDao dao;
	
	//회원정보 저장 요청처리
	@PostMapping("/member/insert")	
	public String insert(String name, String addr) { // 전송되는 파라미터
		MemberDto dto = new MemberDto();
		dto.setName(name);
		dto.setAddr(addr);
		//dao 를 이용해서 db에 저장
		dao.insert(dto);
		return "member/insert";
	}
	
	@GetMapping("/member/insertform")
	public String insertform() {
		return "member/insertform";
	}
	
	@GetMapping("/member/list")
	public String list(Model model) {
		// 출력해줄 회원목록을 얻어와서 모델에 담고
		List<MemberDto> list = dao.getList();
		//	Model 객체에 "list" 라는 키값으로 회원 목록을 담는다.
		model.addAttribute("list", list);
		// templates/member/list.html Tymeleaf 뷰엔진에서		
		return "member/list";
	}
	
}
