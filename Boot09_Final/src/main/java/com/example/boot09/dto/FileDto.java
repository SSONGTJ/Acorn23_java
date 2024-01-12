package com.example.boot09.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("fileDto")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class FileDto {
	private int num;
	private String writer;
	private String title;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private String regdate;
	private MultipartFile myFile;
	
	//페이징 처리를 위한 추가 필드
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전 글의 번호와
	private int nextNum; // 다음 글의 글 번호를 담을 필드 추가
	
	//검색기능 관련 추가 필드
	private String condition="";
	private String keyword="";
	private int pageNum=1;
}