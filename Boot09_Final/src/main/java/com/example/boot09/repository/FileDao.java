package com.example.boot09.repository;

import java.util.List;

import com.example.boot09.dto.FileDto;

public interface FileDao {
	public void insert (FileDto dto);
	public FileDto getData(int num);
	public int getCount();
	public List<FileDto> getList(FileDto dto);
	public void delete(int num);
	
}
