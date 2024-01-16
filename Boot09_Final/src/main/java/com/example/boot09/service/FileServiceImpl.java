package com.example.boot09.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.example.boot09.dto.FileDto;
import com.example.boot09.exception.NotOwnerException;
import com.example.boot09.repository.FileDao;

@Service
public class FileServiceImpl implements FileService{
	@Autowired
	private FileDao dao;
	//파일을 저장할 위치
	@Value("${file.location}")
	private String fileLocation;
	
	//한 페이지에 글을 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지 UI를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	@Override
	public void getList(Model model, FileDto dto) {
		// pageNum 에 해당하는 글정보를 select 에서 Model 객체에 담는 작업을 하면 된다.
		
		int pageNum=dto.getPageNum();
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//전체 글의 갯수
		int totalRow=dao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다. 
		}
		
		//위에서 계산된 startRowNum 과 endRowNum 을 dto 담고
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//FileDto 를 인자로 전달해서 글목록 얻어오기
		List<FileDto> list=dao.getList(dto);
		
		// view page 에 전달할 내용을 Model 객체에 담는다. 
		model.addAttribute("list", list);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto); //키워드정보가 들어 있는 dto 를 모델에 담기 
		model.addAttribute("totalRow", totalRow);
	}
	@Override
	public void saveFile(FileDto dto) {
		//파일 업로드 처리를 위한 객체의 참조값 얻어오기(업로드된 파일에 대한 정보를 얻어낼 객체)
		MultipartFile myFile=dto.getMyFile();
		//원본 파일명
		String orgFileName=myFile.getOriginalFilename();
		//파일의 크기
		long fileSize=myFile.getSize();
		//저장할 파일명을 하나 얻어낸다. 
		String saveFileName=UUID.randomUUID().toString();
		//저장할 파일의 상세 경로
		String filePath = fileLocation+File.separator+saveFileName;
		try {
			//File 객체 생성 
			File f=new File(filePath);
			//파일을 원하는 곳에 저장하기 
			myFile.transferTo(f);
		}catch(Exception e) {
			e.printStackTrace();
		}
		//DB 에 업로드된 파일에 대한 정보를 저장한다.
		String writer=SecurityContextHolder.getContext().getAuthentication().getName();
		dto.setWriter(writer);
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		
		dao.insert(dto);

	}
	@Override
	public ResponseEntity<InputStreamResource> getFileData(int num) {
		//다운로드 해줄 파일의 정보를 DB 에서 읽어온다.
		FileDto dto=dao.getData(num);
		ResponseEntity<InputStreamResource> responseEn=null;
		try {
			//다운로드 시켜줄 원본 파일명
			String encodedName=URLEncoder.encode(dto.getOrgFileName(), "utf-8");
			//파일명에 공백이 있는경우 파일명이 이상해지는걸 방지
			encodedName=encodedName.replaceAll("\\+"," ");
			//응답 헤더정보(스프링 프레임워크에서 제공해주는 클래스) 구성하기 (웹브라우저에 알릴정보)
			HttpHeaders headers=new HttpHeaders();
			//파일을 다운로드 시켜 주겠다는 정보
			headers.add(HttpHeaders.CONTENT_TYPE, "application/octet-stream"); 
			//파일의 이름 정보(웹브라우저가 해당정보를 이용해서 파일을 만들어 준다)
			headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+encodedName);
			//파일의 크기 정보도 담아준다.
			headers.setContentLength(dto.getFileSize());
			//읽어들일 파일의 경로 구성
			String filePath=fileLocation + File.separator + dto.getSaveFileName();
			//파일에서 읽어들일 스트림 객체 생성
			InputStream is=new FileInputStream(filePath);
			//InputStreamResource
			InputStreamResource isr=new InputStreamResource(is);
			//InputStremResource 객체를 얻어내서 지역변수에 담고
			responseEn=ResponseEntity.ok().headers(headers).body(isr);
		}catch(Exception e) {
			//예외를 던지고 ExceptionController 에서 처리 할수 있다.
			throw new RuntimeException("파일 다운로드 중에 예외가 발생했습니다");
		}
		//InputStreamResource 객체를 리턴해준다.
		return responseEn;
	}
	@Override
	public void deleteFile(int num) {
		// 매개변수를 활용해서 dto 를 불러온다.
		FileDto dto = dao.getData(num);
		// 현재 로그인 되어있는 아이디값을 불러온다.
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		
		// 불러온 dto를 활용해서 글 작성자와 현재 로그인 한 사용자가 같은지 확인
		if(!dto.getWriter().equals(userName)) { // 같지 않다면 예외 발생
			throw new NotOwnerException("니가 쓴게 아니다.");		
		}
		
		//파일시스템에서 삭제
		String filePath = fileLocation+File.separator+dto.getSaveFileName();
		File f=new File(filePath);
		f.delete();
		
		//db에서 삭제
		dao.delete(num);
	}
}