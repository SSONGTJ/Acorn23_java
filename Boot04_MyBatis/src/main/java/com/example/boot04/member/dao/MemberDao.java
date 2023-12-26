package com.example.boot04.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.boot04.member.dto.MemberDto;

@Repository
public class MemberDao {
	/*
	 * 	DB 접속 설정과 MyBatis 설정이 잘 되어 있다면 spring boot에서 자동으로 SqlSession 객체를 만들어서
	 * 	spring bean container 에서 관리를 해준다.
	 * 	SqlSession 객체를 이용해서 DB에 insert, update, delete, select 작업을 하면 된다.
	 */
	@Autowired
	SqlSession session;
	
	public void update(MemberDto dto) {
		session.update("member.update", dto);
	}
	
	public MemberDto getData(int num) {
		/*
		 * 	mapper 의 namespace => member
		 *  sql 의 id => getData
		 *  parameteType => int
		 *  resultType => MemberDto type
		 */
		return session.selectOne("member.getData", num);
	}
	
	public void delete(int num) {
		session.delete("member.delete", num);
	}
	
	public void insert(MemberDto dto) {
		/*
		 *	mapper 의 namespace => member
		 *	sql 의 id => insert
		 *	parameterType => MemberDto 
		 */
		session.insert("member.insert", dto);
	}
	
	//회원 목록 얻어오기
	public List<MemberDto> getList(){
		/*
		 * 	member => mapper 의 namespace
		 * 	getList => sql 의 id
		 * 	MemberDto =>  result type
		 * 	.selectOne() 메소드는 result type 이 리턴된다.
		 * 	.selectList() 메소드는 List<result type> 이 리턴된다.
		 */
		return session.selectList("member.getList");
	}
}
