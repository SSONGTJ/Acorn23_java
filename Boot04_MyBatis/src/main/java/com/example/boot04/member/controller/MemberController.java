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
	
	@PostMapping("/member/update")
	public String update(MemberDto dto) {
		/*
		 * 매개변수를 dto로 선언하면 전달되는 파라미터가 자동 추출되고 추출된 파라미터가
		 * dto에 자동으로 담겨서 전달된다.
		 */
		dao.update(dto);
		return "member/update";
	}
	
	//회원정보 수정폼 요청처리
	@GetMapping("/member/updateform")
	public String updateform(int num, Model model) {
		//파라미터로 전달되는 회원의 번호를 이용해서 수정할 회원의 정보를 얻어온다.
		MemberDto dto = dao.getData(num);
		//Model 객체에 수정할 회원의 정보를 담고,
		model.addAttribute("dto", dto);
		//templates/member/updateform.html 페이지를 이용해서 응답
		return "member/updateform";
	}
	
	//회원정보 삭제 요청처리
	@GetMapping("/member/delete")
	public String delete(int num) { // int type 으로 받으면 자동으로 숫자로 바꿔서 파라미터를 추출해서 전달해준다.
		//MemberDao 객체를 이용해서 회원 한명의 정보 삭제하기
		dao.delete(num);
		return "redirect:/member/list";		
	}
	
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
