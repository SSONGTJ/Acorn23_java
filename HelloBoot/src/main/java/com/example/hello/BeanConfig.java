package com.example.hello;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.hello.auto.Car;
import com.example.hello.auto.MyCar;
import com.example.hello.dao.MemberDao;
import com.example.hello.dao.MemberDaoImpl;
import com.example.hello.dto.MemberDto;

@Configuration
public class BeanConfig {
	/*
	 * 이 메소드에서 리턴되는 객체를 spring 이 관리하는 bean 이 되도록
	 * 메소드의 이름이 이 객체의 이름으로 부여된다.
	 * 이 메소드는 한번만 호출된다 (single ton)
	 */
	@Bean
	public Car myCar(){
		System.out.println("BeanConfig 클래스의 myCar() 호출됨");
		Car c1 = new MyCar();
		return c1;
	}
	
	// MemberDao type 을 리턴해주는 메소드
	public MemberDao md() {
		return new MemberDaoImpl();
	}
	
}
