package com.example.boot09.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.boot09.dto.FileDto;
import com.example.boot09.service.FileService;

@Controller
public class FileController {
	@Autowired
	private FileService service;
	
	@GetMapping("/file/list")
	public String list(Model model, FileDto dto) {
		service.getList(model, dto);
		return "file/list";
	}
	
	@GetMapping("/file/uploadform")
	public String uploadForm() {
		return "file/uploadform";
	}
	
	@PostMapping("/file/upload")
	public String upload(FileDto dto) {
		service.saveFile(dto);
		return "file/upload";
	}
	
	@GetMapping("/file/download")
	public ResponseEntity<InputStreamResource> download(int num){

		return service.getFileData(num);
	}
	
	@GetMapping("/file/delete")
	public String delete(int num) {
		service.deleteFile(num);
		return "redirect:/file/list";
	}
}
