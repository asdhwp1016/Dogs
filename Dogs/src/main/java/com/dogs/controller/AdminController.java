package com.dogs.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dogs.model.AttachDogImageVO;
import com.dogs.model.Criteria;
import com.dogs.model.DogVO;
import com.dogs.model.PageDTO;
import com.dogs.service.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.coobird.thumbnailator.Thumbnails;

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
    
    
    /*강쥐 상품 등록*/
    @PostMapping("/dogsEnroll")
    public String dogsEnrollPOST(DogVO dog, RedirectAttributes attr) {
    	
    	logger.info("dogsEnrollPOST........" + dog);
    	
    	adminService.dogEnroll(dog);
    	
    	attr.addFlashAttribute("enroll_result", dog.getDogName());
    	
    	return "redirect:/admin/dogsManage";
    	
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
    
    
    /*첨부 파일 업로드*/
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachDogImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		/*이미지 파일 체크*/
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachDogImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		} //for
		
		String uploadFolder = "C:\\upload";
		
		/*날짜 폴더 경로*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/*폴더 생성*/
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
				
				/*이미지 정보 담는 객체*/
				List<AttachDogImageVO> list = new ArrayList();
		
				// 향상된 for
				for(MultipartFile multipartFile : uploadFile) {
					
					/*이미지 정보 객체*/
					AttachDogImageVO vo = new AttachDogImageVO();
					
					/*파일 이름*/
					String uploadFileName = multipartFile.getOriginalFilename();
					vo.setFileMain(uploadFileName);
					vo.setUploadPath(datePath);
					
					/*uuid 적용 파일 이름*/
					String uuid = UUID.randomUUID().toString();
					vo.setUuid(uuid);
					
					uploadFileName = uuid + "_" + uploadFileName;
					
					/*파일 위치, 파일 이름을 합친 File 객체*/
					File saveFile = new File(uploadPath, uploadFileName);
					
					/*파일 저장*/
					try {
						multipartFile.transferTo(saveFile);
						
						/*썸네일 생성(ImageIO)*/
						File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
						
						BufferedImage bo_image = ImageIO.read(saveFile);
						
						//비율
						double ratio = 3;
						//넓이 높이
						int width = (int)(bo_image.getWidth() / ratio);
						int height = (int)(bo_image.getHeight() / ratio);
						
						Thumbnails.of(saveFile)
						.size(width, height)
						.toFile(thumbnailFile);
						
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					list.add(vo);
					
				} // for
				
				ResponseEntity<List<AttachDogImageVO>> result = new ResponseEntity<List<AttachDogImageVO>>(list, HttpStatus.OK);
				
				return result;
		
	}
	
	
	
	/*이미지 파일 삭제*/
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		
		logger.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/*썸네일 파일 삭제*/
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/*원본 파일 삭제*/
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		} //catch
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
    

    
	
}