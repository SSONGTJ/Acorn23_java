package com.example.boot09.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.boot09.dto.CafeCommentDto;
import com.example.boot09.dto.CafeDto;
import com.example.boot09.service.CafeService;

@Controller
public class CafeController {
	@Autowired private CafeService service;
	
	@GetMapping("/cafe/comment_list")
	public String commentList(Model model, CafeCommentDto dto) {
		service.getCommentList(model, dto);
		//templates/cafe/comment_list.html에서 댓글이 들어 있는 여러개의 li를 응답할 예정
		return "cafe/comment_list";
	}
	
//	@PostMapping("/cafe/comment_update")
//	public String commentUpdate(CafeCommentDto dto){
//		service.updateComment(dto);
//		return "redirect:/cafe/detail?num="+dto.getRef_group();
//	}
	
	@ResponseBody	//map 객체를 리턴하면 json 문자열이 응답되도록 @ResponseBody 어노테이션을 추가로 붙여준다.
	@PostMapping("/cafe/comment_update")
	public Map<String, Object> commentUpdate(CafeCommentDto dto){
		service.updateComment(dto);
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		map.put("num", dto.getNum());
		map.put("content", dto.getContent());		
		return map;
	}
	
	@ResponseBody	//map 객체를 리턴하면 json 문자열이 응답되도록 @ResponseBody 어노테이션을 추가로 붙여준다.
	@GetMapping("/cafe/comment_delete")
	public Map<String, Object> commentDelete(int num){
		// num은 GET 방식 파라미터로 전달되는 삭제할 댓글의 번호
		service.deleteComment(num);
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
		
	}
	
	@PostMapping("/cafe/comment_insert")
	public String commentInsert(CafeCommentDto dto) {
		//댓글 저장 처리를 하고
		service.saveComment(dto);
		//해당 글 자세히 보기로 다시 리다일렉트 시킨다.
		return "redirect:/cafe/detail?num="+dto.getRef_group();
	}
	
	@PostMapping("/cafe/update")
	public String update(CafeDto dto) {
		service.updateContent(dto);
		return "redirect:/cafe/detail?num="+dto.getNum();
	}
	
	@GetMapping("/cafe/updateform")
	public String updateForm(Model model, int num) {
		service.getData(model, num);
		return "cafe/updateform";
	}
	
	@GetMapping("/cafe/delete")
	public String delete(int num) {
		service.deleteContent(num);
		return "redirect:/cafe/list";
	}
	
	@GetMapping("/cafe/detail")
	public String detail(Model model, CafeDto dto) {
		service.getDetail(model, dto);
		return "cafe/detail";
	}
	
	@PostMapping("/cafe/insert")
	public String insert(CafeDto dto) {
		//서비스를 이용해서 새 글을 저장한다.
		service.saveContent(dto);
		return "cafe/insert";
	}
	
	@GetMapping("/cafe/insertform")
	public String insertForm() {
		return "cafe/insertform";
	}
	
	@GetMapping("/cafe/list")
	public String list(Model model, CafeDto dto) {
		//dto 에는 검색키워드가 있을 수도 있고, 없을 수도 있다.
		service.getList(model, dto);
		return "cafe/list";
	}
}
