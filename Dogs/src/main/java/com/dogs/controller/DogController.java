package com.dogs.controller;

import java.io.File;
import java.io.IOException;

import java.nio.file.Files; // 추가
import org.springframework.util.FileCopyUtils; // 추가

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dogs.service.AdminService;

@Controller
public class DogController {
	
	private static final Logger logger = LoggerFactory.getLogger(DogController.class);
	
	@Autowired
	private AdminService adminService;
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		
		logger.info("메인 페이지 진입");
		
		model.addAttribute("mainImage", adminService.dogsImageList());
		
	}
	
	//마이페이지 이동
	@RequestMapping(value = "/mypage/myPageMain", method = RequestMethod.GET)
	public void myPageMainGET() {
			
		logger.info("마이페이지 메인 화면 진입");
			
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
		
	

	//메인 페이지 이동
		@RequestMapping(value = "/review/review_list", method = RequestMethod.GET)
		public void review_listPageGET() {
			
			logger.info("리뷰 페이지 진입");
			
		}

	
}
