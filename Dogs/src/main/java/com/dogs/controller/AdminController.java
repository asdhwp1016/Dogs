package com.dogs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dogs.model.DogVO;
import com.dogs.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	/* 관리자 메인 페이지 이동 */
    @RequestMapping(value="main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        
        logger.info("관리자 페이지 이동");
        
    }
    
    
    /* 강쥐 관리 페이지 접속 */
    @RequestMapping(value = "dogsManage", method = RequestMethod.GET)
    public void dogsManageGET() throws Exception{
        logger.info("강쥐 관리 페이지 접속");
    }
    
    
    /* 강쥐 등록 페이지 접속 */
    @RequestMapping(value = "dogsEnroll", method = RequestMethod.GET)
    public void dogsEnrollGET() throws Exception{
    	
        logger.info("강쥐 등록 페이지 접속");
  
    }
    
    
    /* 코디 등록 페이지 접속 */
    @RequestMapping(value = "dogItemEnroll", method = RequestMethod.GET)
    public void dogItemEnrollGET() throws Exception{
        logger.info("코디 등록 페이지 접속");
    }
    
    
    /* 코디 관리 페이지 접속 */
    @RequestMapping(value = "dogItemManage", method = RequestMethod.GET)
    public void dogItemManageGET() throws Exception{
        logger.info("코디 관리 페이지 접속");
    }  
    
    
    /*강쥐 등록*/
    @PostMapping("/dogsEnroll")
    public String dogsEnrollPOST(DogVO dog, RedirectAttributes attr) {
    	
    	logger.info("dogsEnrollPOST........" + dog);
    	
    	adminService.dogEnroll(dog);
    	
    	attr.addFlashAttribute("enroll_result", dog.getDogName());
    	
    	return "redirect:/admin/dogsManage";
    	
    }
    
	
}
