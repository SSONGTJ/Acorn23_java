package com.example.boot04.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.boot04.member.dto.MemberDto;

@Repository
public class MemberDao {
	@Autowired
	SqlSession session;
	//회원 목록 얻어오기
	public List<MemberDto> getList(){
		/*
		 * 	member => mapper 의 namespace
		 * 	getList => sql 의 id
		 * 	MemberDto =>  result type
		 */
		return session.selectList("member.getList");
	}
}
