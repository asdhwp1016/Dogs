package com.dogs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogs.service.ReviewService;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	
	private static final Logger log = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService rService;
	
	// 리뷰 상세 페이지 접속
	
	@GetMapping("/review_list")
	public void reviewList(Model model) {
		log.info("리뷰 상세 페이지 진입");
		
		model.addAttribute("review", rService.reviewList());
	}
	
	
}
