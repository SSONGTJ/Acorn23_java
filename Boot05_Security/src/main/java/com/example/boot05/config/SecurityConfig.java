package com.example.boot05.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration		//설정 클래스라고 알려준다.
@EnableWebSecurity	//Security 를 설정하기 위한 어노테이션
public class SecurityConfig {
	
	@Bean //메소드에서 리턴되는 SecurityFilterChain 을 bean으로 만들어준다.
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
		//화이트 리스트를 미리 배열에 넣어두기
		String[] whiteList = {"/","/play","/notice","/user/loginform","/user/login_fail"};
		
		//메소드의 매개변수에 HttpSecurity 의 참조값이 전달되는데 해당 객체를 이용해서 설정을 한다음
		httpSecurity
		.csrf(csrf -> csrf.disable())
		.authorizeHttpRequests(config -> 
			config
				.requestMatchers(whiteList).permitAll() //whiteList 요청은 로그인과 상관없이 모두 허용
				.requestMatchers("/admin/**").hasRole("ADMIN") // admin 이 아니면 admin의 하위 페이지 요청 불가
				.requestMatchers("/staff/**").hasAnyRole("ADMIN","STAFF") // admin , staff 가 아니면 staff 하위 페이지 요청 불가
				.anyRequest().authenticated() //위에 명시한 이외의 모든 요청은 로그인해야지 요청가능하게 
		)
		.formLogin(config ->
		config
			//로그인 처리를 할 때 요청될 URL 설정 ( spring security 가 login 처리를 대신 해준다. )
			.loginProcessingUrl("/user/login")
			//로그인 처리를 대신 하려면 어떤 파라미터명으로 username 과 password 가 넘어오는지 알려주기
			.usernameParameter("userName")
			.passwordParameter("password")
			.successForwardUrl("/user/login_success")// 로그인 성공 후 forward 될 url 설정
			.failureForwardUrl("/user/login_fail")
			.permitAll() // 위에 명시한 모든 요청경로를 로그인 없이 요청할 수 있도록 설정
		)
		.logout(config ->
		config
			.logoutUrl("/user/logout")//spring security 가 logout 처리를 대신 해준다.
			.logoutSuccessUrl("/") //로그아웃 이후에 리다이렉트 시킬 경로 설정
			.permitAll()
		);
		//설정된 정보대로 SecurityFilterChain 객체를 만들어서 반환한다.
		return httpSecurity.build();
	}
	
	//비밀번호를 암호화 해주는 객체를 bean 으로 만든다.
	@Bean
	PasswordEncoder passwordEncoder() { 
		return new BCryptPasswordEncoder();
	}
	//인증 메니저 객체를 bean 으로 만든다. (Spring Security 가 자동 로그인 처리할때도 사용되는 객체)
	@Bean
	AuthenticationManager authenticationManager(HttpSecurity http, 
			BCryptPasswordEncoder bCryptPasswordEncoder, UserDetailsService userDetailService) throws Exception {
	    
		return http.getSharedObject(AuthenticationManagerBuilder.class) 
	      .userDetailsService(userDetailService)
	      .passwordEncoder(bCryptPasswordEncoder)
	      .and()
	      .build();
	}
	
}
