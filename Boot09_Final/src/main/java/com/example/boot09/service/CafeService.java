package com.example.boot09.service;

import org.springframework.ui.Model;

import com.example.boot09.dto.CafeDto;

public interface CafeService {
	public void getList(Model model, int pageNum);
	public void saveContent(CafeDto dto);
	public void getDetail(Model model, int num); // 글 자세히 보기를 위한 기능
	public void deleteContent(int num);
	public void getData(Model model, int num); // 글 수정 폼을 출력하기 위한 기능
	public void updateContent(CafeDto dto);
}
