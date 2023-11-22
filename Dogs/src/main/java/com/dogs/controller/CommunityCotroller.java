package com.dogs.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogs.service.CommunityService;

@Controller
@RequestMapping("/commu/*")
public class CommunityCotroller {
	
	@Autowired
	private CommunityService cService;
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(CommunityCotroller.class);
	
	/* 커뮤니티 글 목록 페이지 이동 */
	@GetMapping("/list")
	public void commuListGET(Model model) {
		log.info("커뮤니티 글 목록 페이지 진입");
		
		model.addAttribute("list", cService.getList());
	}
	
}
