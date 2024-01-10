package com.example.boot09.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.boot09.dto.CafeDto;

@Repository //dao 는 @repository 어노테이션을 이용해서 bean 으로 만든다.
public class CafeDaoImpl implements CafeDao{
	//	mybatis 설정이 적절하게 되어 있다면 SqlSession 객체는 spring bean container 에서 관리가 된다. 
	@Autowired private SqlSession session;
	
	@Override
	public List<CafeDto> getList(CafeDto dto) {
		/*
		 * mapper's namespace = cafe
		 * sql's id = getList
		 * parameterType = CafeDto
		 * resultType = CafeDto
		 * select 된 row의 갯수는 여러개
		 */
		List<CafeDto> list = session.selectList("cafe.getList", dto);
		return list;
	}
	@Override
	public int getCount() {
		return session.selectOne("cafe.getCount");
	}
	@Override
	public void insert(CafeDto dto) {
		session.insert("cafe.insert", dto);
	}
	@Override
	public CafeDto getData(int num) {
		return session.selectOne("cafe.getData", num);
	}
	@Override
	public void delete(int num) {
		session.delete("cafe.delete", num);
	}
	@Override
	public void update(CafeDto dto) {
		session.update("cafe.update", dto);
	}
}
