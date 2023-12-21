package com.example.boot04.member.dto;

import org.apache.ibatis.type.Alias;

// 이 클래스로 만든 객체의 별칭을 memberDto 로 부여하기 ( mapper xml 문서에서 사용된다. )
@Alias("memberDto")
public class MemberDto {
	private int num;
	private String name;
	private String addr;
	
	public MemberDto() {}

	public MemberDto(int num, String name, String addr) {
		super();
		this.num = num;
		this.name = name;
		this.addr = addr;
	}
	
}
