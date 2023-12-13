package com.example.boot01.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//spring이 이 클래스로 객체를 생성해서 bean 으로 관리한다.
@Component
public class HomeServiceImpl implements HomeService {
	// 필드로 필요한 type 을 선언하고 @Autowired 라는 어노테이션을 붙이면 해당 객체가 주입된다.
	@Autowired
	private Drill drill;
	
	@Override
	public void clean(String name) {
		System.out.println(name+"의 집을 청소해요!");
	}
	@Override
	public void wash(String name) {
		System.out.println(name+"의 빨래를 빨아요~");
	}
	public void hole(String name) {
		System.out.println(name+"에 구멍을 뚫어요!");
		//구멍을 뚫으려면 Drill type 이 필요하다.
		//spring 이 관리하는 bean 을 이용해서 구멍을 뚫어야 한다.
		drill.on();
	}
}
