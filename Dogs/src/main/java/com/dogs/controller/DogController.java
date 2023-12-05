package com.dogs.controller;

import java.io.File;
import java.io.IOException;

import java.nio.file.Files; // 추가
import org.springframework.util.FileCopyUtils; // 추가

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DogController {
	
	private static final Logger logger = LoggerFactory.getLogger(DogController.class);
	
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}
	
	
	//신규분양 페이지 이동
	   @RequestMapping(value = "/DogSell/dogSellList", method = RequestMethod.GET)
	   public void dogSellListPageGET() {
	      logger.info("신규분양 페이지 진입");
	   }
	   
	 //신규분양 상세 페이지 이동
	   @RequestMapping(value = "/DogSell/dogSellDetail", method = RequestMethod.GET)
	   public void dogSellDetailPageGET() {
	      logger.info("신규분양 상세정보 페이지 진입");
	   }
	
	
	//강아지 이미지 업로드 뷰
		@GetMapping("/display")
		public ResponseEntity<byte[]> getDogMainImage(String fileName) { 
			
			logger.info("getDogImage()........" + fileName);
			
			File file = new File("D:\\DogUpload\\" + fileName);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-type", Files.probeContentType(file.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				
			}catch (IOException e) {
				e.printStackTrace();
			}
			
			return result;
			
		}
		
	
	
}
