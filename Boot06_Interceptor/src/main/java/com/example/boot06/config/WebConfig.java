package com.example.boot06.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.boot06.interceptor.LoginInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	//@component 어노테이션을 통해서 bean 이 된 LoginInterceptor 의 참조값 DI 받기
	@Autowired
	private LoginInterceptor loginInter;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		String[] whiteList= {"/sub/play","/cafe/list","/cafe/detail"};
		// 동작을 원하는 인터셉터를 registry 객체를 이용해서 등록한다.
		registry.addInterceptor(loginInter)
			.addPathPatterns("/sub/*","/cafe/*") // /sub 하위의 모든 요청에 대해서 인터셉터 동작하도록
			.excludePathPatterns(whiteList);	// /sub/play는 배제하기 ( 인터셉터 동작하지 않도록 )
	}
}
