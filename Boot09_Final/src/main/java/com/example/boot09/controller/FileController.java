package com.example.boot09.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.boot09.dto.FileDto;
import com.example.boot09.service.FileService;

@Controller
public class FileController {
	@Autowired private FileService service;
	
	@Value("${file.location}")
	private String fileLocation;
	
	//전달되는 pageNum 이 있는지 확인해서 있으면 추출하고 없으면 기본값 1 로 설정
	@GetMapping("/file/list")
	public String list(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		/*
		 *  서비스에 Model 객체와 pageNum 을 전달해서 
		 *  Model 에 pageNum 에 해당하는 글 목록이 담기도록 한다.
		 *  Model 에 담긴 내용을 view page(Thymeleaf 템플릿페이지) 에서 사용할수 있다
		 */
		service.selectPage(model, pageNum);
		return "file/list";
	}
	
	@GetMapping("/file/uploadform")
	public String uploadForm() {
		return "file/uploadform";
	}
	
	@PostMapping("/file/upload")
	public String upload(FileDto dto, MultipartFile myFile) {
		String orgFileName = myFile.getOriginalFilename();
		long fileSize = myFile.getSize();
		dto.setOrgFileName(orgFileName);
		dto.setFileSize(fileSize);
		service.upload(dto);
		return "redirect:/file/list";
	}
	
	//파일 다운로드 요청처리
	@GetMapping("/file/download")
	public ResponseEntity<InputStreamResource> download(String orgFileName, String saveFileName, long fileSize)
		throws UnsupportedEncodingException, FileNotFoundException{
		//원래는 DB 에서 읽어와야 하지만 지금은 다운로드해줄 파일의 정보가 요청 파라미터로 전달된다.
		
		//다운로드 시켜줄 원본 파일명
		String encodedName=URLEncoder.encode(orgFileName, "utf-8");
		//파일명에 공백이 있는경우 파일명이 이상해지는걸 방지
		encodedName=encodedName.replaceAll("\\+"," ");
		//응답 헤더정보(스프링 프레임워크에서 제공해주는 클래스) 구성하기 (웹브라우저에 알릴정보)
		HttpHeaders headers=new HttpHeaders();
		//파일을 다운로드 시켜 주겠다는 정보
		headers.add(HttpHeaders.CONTENT_TYPE, "application/octet-stream"); 
		//파일의 이름 정보(웹브라우저가 해당정보를 이용해서 파일을 만들어 준다)
		headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+encodedName);
		//파일의 크기 정보도 담아준다.
		headers.setContentLength(fileSize);
		
		//읽어들일 파일의 경로 구성
		String filePath=fileLocation + File.separator + saveFileName;
		//파일에서 읽어들일 스트림 객체
		InputStream is=new FileInputStream(filePath);
		//InputStreamResource 객체의 참조값 얻어내기
		InputStreamResource isr=new InputStreamResource(is);
		ResponseEntity<InputStreamResource> resEntity = ResponseEntity.ok()
			.headers(headers)
			.body(isr);
		//리턴해주면 자동으로 다운로드가 된다.
			return resEntity;
		}
	
	@GetMapping("/file/delete")
	public String delete(int num) {
		service.deleteOne(num);
		return "file/delete";
	}
}
