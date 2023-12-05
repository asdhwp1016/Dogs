package com.dogs.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dogs.model.Criteria;
import com.dogs.model.DogVO;
import com.dogs.model.PageDTO;
import com.dogs.service.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
    
    
    /* 강쥐 상품 관리(상품 목록) 페이지 접속 */
    @RequestMapping(value = "dogsManage", method = RequestMethod.GET)
    public void dogsManageGET(Criteria cri, Model model) throws Exception{
        logger.info("강쥐 상품 관리(상품목록) 페이지 접속");
        
        /*강쥐 상품 리스트 데이터*/
        List list = adminService.dogsGetList(cri);
        
        if(!list.isEmpty()) {
        	model.addAttribute("list", list);
        } else {
        	model.addAttribute("listCheck", "empty");
        	return;
        }
        
        /*페이지 인터페이스 데이터*/
        model.addAttribute("pageMaker", new PageDTO(cri, adminService.dogsGetTotal(cri)));
    }
    
    
    /*강아지 상품 조회 페이지*/
    @GetMapping({"/dogsDetail", "/dogsModify"})
    public void dogsGetInfoGET(int dogId, Criteria cri, Model model) throws JsonProcessingException {
    	
    	logger.info("dogsGetInfo()........" + dogId);
    	
    	ObjectMapper mapper = new ObjectMapper();
    	
    	/*강아지 카테고리 리스트 데이터*/
    	model.addAttribute("dogCateList", mapper.writeValueAsString(adminService.dogCateList()));
    	
    	/*목록 페이지 조건 정보*/
    	model.addAttribute("cri", cri);
    	
    	/*조회 페이지 정보*/
    	model.addAttribute("dogsInfo", adminService.dogsGetDetail(dogId));
    	
    }
    
    
    /* 강쥐 상품 등록 페이지 접속 */
    @RequestMapping(value = "dogsEnroll", method = RequestMethod.GET)
    public void dogsEnrollGET(Model model) throws Exception{
    	
        logger.info("강쥐 등록 페이지 접속");
        
        ObjectMapper objm = new ObjectMapper();
        
        List list = adminService.dogCateList();
        
        String dogCateList = objm.writeValueAsString(list);
        
        model.addAttribute("dogCateList", dogCateList);
        
        logger.info("변경 전.........." + list);
		logger.info("변경 후.........." + dogCateList);
  
    }
    
    
    /* 코디 상품 등록 페이지 접속 */
    @RequestMapping(value = "dogItemEnroll", method = RequestMethod.GET)
    public void dogItemEnrollGET() throws Exception{
        logger.info("코디 등록 페이지 접속");
    }
    
    
    /* 코디 상품 관리 페이지 접속 */
    @RequestMapping(value = "dogItemManage", method = RequestMethod.GET)
    public void dogItemManageGET() throws Exception{
        logger.info("코디 관리 페이지 접속");
    }  
    
    
    /*강아지 상품 등록*/
    @PostMapping("/dogsEnroll")
    public String dogsEnrollPOST(DogVO dog, RedirectAttributes attr,
            @RequestParam("fileMain") MultipartFile fileMain,
            @RequestParam("fileSub1") MultipartFile fileSub1,
            @RequestParam("fileSub2") MultipartFile fileSub2,
            @RequestParam("fileSub3") MultipartFile fileSub3) {

        logger.info("dogsEnrollPOST........" + dog);
        try {
            // 파일을 저장할 디렉토리 경로
            String uploadDir = "D:/DogImages/directory/";

            // 디렉토리가 존재하지 않으면 생성
            File directory = new File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 파일을 저장할 경로 및 파일명 설정
            String fileNameMain = "fileMain_" + System.currentTimeMillis() + ".jpg";
            String fileNameSub1 = "fileSub1_" + System.currentTimeMillis() + ".jpg";
            String fileNameSub2 = "fileSub2_" + System.currentTimeMillis() + ".jpg";
            String fileNameSub3 = "fileSub3_" + System.currentTimeMillis() + ".jpg";

         // 파일 저장
            saveFile(uploadDir, fileNameMain, fileMain);
            saveFile(uploadDir, fileNameSub1, fileSub1);
            saveFile(uploadDir, fileNameSub2, fileSub2);
            saveFile(uploadDir, fileNameSub3, fileSub3);

            // 데이터베이스에 파일 경로 저장 (파일명만 저장하거나 전체 경로를 저장할 수 있음)
            dog.setFileMain(fileMain);
            dog.setFileSub1(fileSub1);
            dog.setFileSub2(fileSub2);
            dog.setFileSub3(fileSub3);

            adminService.dogEnroll(dog);
        } catch (IOException e) {
            e.printStackTrace(); // 상황에 따라 예외 처리를 진행하세요.
        }

        attr.addFlashAttribute("enroll_result", dog.getDogName());
        return "redirect:/admin/dogsManage";
        
        
    }
    
    // 파일 저장 메서드
    private void saveFile(String uploadDir, String fileName, MultipartFile multipartFile) throws IOException {
        Path filePath = Paths.get(uploadDir, fileName);
        multipartFile.transferTo(filePath);
    }

    
    
    /*강쥐 상품 수정*/
    @PostMapping("/dogsModify")
    public String dogsModifyPOST(DogVO vo, RedirectAttributes attr) {
    	
    	logger.info("dogsModifyPOST........" + vo);
    	
    	int result = adminService.dogsModify(vo);
    	
    	attr.addFlashAttribute("modify_result", result);
    	
    	return "redirect:/admin/dogsManage";
    	
    }
    
    
    /*강쥐 상품 정보 삭제*/
    @PostMapping("/dogsDelete")
    public String dogsDeletePOST(int dogId, RedirectAttributes attr) {
    	
    	logger.info("dogsDeletePOST........");
    	
    	int result = adminService.dogsDelete(dogId);
    	
    	attr.addFlashAttribute("delete_result", result);
    	
    	return "redirect:/admin/dogsManage";
    	
    }

    
	
}