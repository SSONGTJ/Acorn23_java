package com.example.boot09.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.boot09.dto.CafeDto;
import com.example.boot09.exception.NotOwnerException;
import com.example.boot09.repository.CafeDao;

@Service
public class CafeServiceImpl implements CafeService{
	@Autowired
	private CafeDao cafeDao;
	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지?
	final int PAGE_DISPLAY_COUNT=10;
			
	@Override
	public void getList(Model model, CafeDto dto) {
		// pageNum 에 해당하는 글 정보를 select 에서 Model  객체에 담는 작업을 하면 된다.
		int pageNum = dto.getPageNum();
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//전체 글의 갯수
		int totalRow=cafeDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다. 
		}
		
		//위에서 계산된 startRowNum 과 endRowNum 을 dto에 담고
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//CafeDto 를 인자로 전달해서 글 목록 얻어오기
		List<CafeDto> list = cafeDao.getList(dto);
		
		model.addAttribute("list",list);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("totalRow", totalRow);
		model.addAttribute("dto", dto); // 키워드 정보가 들어있는 dto
		
	}
	
	@Override
	public void saveContent(CafeDto dto) {
		// 글 작성자를 알아내서 dto에 담는다.
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		dto.setWriter(userName);
		
		//db에 저장
		cafeDao.insert(dto);
	}
	
	@Override
	public void getDetail(Model model, CafeDto dto) {
		//글 번호를 이용해서 글 하나의 정보를 얻어와서
		CafeDto resultDto = cafeDao.getDetail(dto);
		//원래의 검색 조건을 글 정보가 들어있는 결과 dto에 추가해준다.
		resultDto.setCondition(dto.getCondition());
		resultDto.setKeyword(dto.getKeyword());
		//userName도 읽어와서 담아준다. (로그인 안되어있으면 Null)
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		
		//model 객체에 담아준다.
		model.addAttribute("dto",resultDto);
		model.addAttribute("userName",userName);
	}
	
	@Override
	public void deleteContent(int num) {
		//글 작성자와
		String writer = cafeDao.getData(num).getWriter();
		//로그인 된 사용자와 같은 경우에만 삭제
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		if(!writer.equals(userName)) {
			throw new NotOwnerException("글 작성자와 일치하지 않습니다");
		}
		//DB에서 num에 해당하는 글 삭제하기
		cafeDao.delete(num);
	}
	
	@Override
	public void getData(Model model, int num) {
		CafeDto dto = cafeDao.getData(num);
		model.addAttribute("dto", dto);
	}
	@Override
	public void updateContent(CafeDto dto) {
		cafeDao.update(dto);
	}
}
