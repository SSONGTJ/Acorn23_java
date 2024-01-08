package com.example.boot09.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.boot09.dto.UserDto;
import com.example.boot09.repository.UserDao;

/*
 *   
 *   원래는 DB 에서 읽어와야 하지만 DB 에 저장된 sample 데이터가 아래와 같다고 가정하고 로그인후 테스트해야한다.
 *   
 *   - 계정 / 비밀번호 예시
 *   
 *   1. 일반 사용자(USER)      =>  kimgura  / 1234
 *   2. 직원(STAFF)    =>  batman   / 1234 
 * 	 3. 관리자(ADMIN)   =>  superman / 1234
 */

@Service //bean 으로 만들기 위해
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserDao dao;
	
	//Spring Security 가 로그인 처리시 호출하는 메소드 
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//1. form 에 입력한 userName 을 이용해서 사용자의 자세한 정보를 얻어온다.
		UserDto dto = dao.getData(username);
		
		//2. UserDetails 객체에 해당정보를 담아서 리턴해 주어야 한다
		//권한은 1개 이지만 List 에 담아서 
		List<GrantedAuthority> authList=new ArrayList<>();
		//Authority 는 role 앞에 "ROLE_"를 붙여주어야한다.
		authList.add(new SimpleGrantedAuthority("ROLE_"+dto.getRole())); // <= "ROLE_USER" 로 결과물이 나오게된다.
		
		//Spring Security 가 제공하는 User 클래스는 UserDetails 인터페이스를 구현한 클래스 이다. 
		UserDetails ud=new User(dto.getUserName(), dto.getPassword(), authList);
		
		return ud;
	}

}