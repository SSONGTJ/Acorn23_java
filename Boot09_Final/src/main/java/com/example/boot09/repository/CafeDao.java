package com.example.boot09.repository;

import java.util.List;

import com.example.boot09.dto.CafeDto;

public interface CafeDao {
	public List<CafeDto> getList(CafeDto dto);
	public int getCount(CafeDto dto);
	public void insert(CafeDto dto);
	public CafeDto getData(int num);
	public void delete(int num);
	public void update(CafeDto dto);
}
