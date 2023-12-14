package com.example.boot02.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * 클라이언트의 요청을 처리할 컨트롤러를 정의하고 bean 을 만들기
 */
@Controller	// bean 으로 만들기 + 요청을 처리하는 컨트롤러 역할하기
public class HelloController {
	
	@ResponseBody
	@GetMapping("/hello")
	public String hello() {
		return "Nice to meet you!";
	}
	
	@ResponseBody
	@GetMapping("/fortune")
	public String fortune() {
		return "<p>동쪽으로 가면 귀인 만나~</p>";
	}
	
	@ResponseBody
	@GetMapping("/member")
	public Map<String, Object> member() {
		Map<String, Object> map = new HashMap<>();
		map.put("num", 1);
		map.put("name", "김구라");
		map.put("isMan", true);
		return map;
	}
	
	@ResponseBody
	@GetMapping("/friends")
	public List<String> friends(){
		List<String> names = new ArrayList<String>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		return names;
	}
	
	@ResponseBody
	@GetMapping("/members")
	public List<Map> members(){
		List<Map> list = new ArrayList<Map>();
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", 1);
		map.put("name", "김구라");
		map.put("isMan", true);
		list.add(map);
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("num", 2);
		map2.put("name", "해골");
		map2.put("isMan", true);
		list.add(map2);
		return list;
	}	
}
