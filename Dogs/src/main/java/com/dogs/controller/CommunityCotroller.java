package com.dogs.controller;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dogs.mapper.ComAttachMapper;
import com.dogs.model.ComAttachImageVO;
import com.dogs.model.CommuCateVO;
import com.dogs.model.CommunityVO;
import com.dogs.model.Criteria;
import com.dogs.model.PageMakeDTO;
import com.dogs.service.CommunityService;
import com.dogs.service.ReplyService;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/commu/*")
public class CommunityCotroller {

	@Autowired
	private CommunityService cService;
	
	@Autowired
	private ComAttachMapper cAttachMapper;
	
	@Autowired
	private ReplyService replyService;

	private static final Logger log = org.slf4j.LoggerFactory.getLogger(CommunityCotroller.class);

	/* 커뮤니티 글 목록 페이지 이동(페이징) */
	@GetMapping("/commuList")
	public void commuListGET(Model model, Criteria cri) throws Exception {

		log.info("커뮤니티 글 목록 페이지 진입");
		model.addAttribute("commuList", cService.getListPaging(cri));

		int total = cService.getTotal(cri);
		PageMakeDTO pm = new PageMakeDTO(cri, total);

		model.addAttribute("pageMaker", pm);

		List<CommuCateVO> cateList = cService.cateList();

		model.addAttribute("cateList", cateList);
	}
	
	/* 커뮤니티 글 등록 페이지 이동 */
	@GetMapping("/commuEnroll")
	public void commuEnrollGET(Model model) throws Exception {
		log.info("커뮤니티 글 등록 페이지 진입");

		ObjectMapper objm = new ObjectMapper();
		List list = cService.cateList();
		String cateList = objm.writeValueAsString(list);

		model.addAttribute("cateList", cateList);
	}

	/* 커뮤니티 글 등록 */
	@PostMapping("/commuEnroll")
	public String commuEnrollPOST(CommunityVO cvo, RedirectAttributes rttr) throws Exception {

		log.info("CommunityVO: " + cvo);

		cService.enroll(cvo);
		
		rttr.addFlashAttribute("result", "enroll Success");
		return "redirect:/commu/commuList";
	}

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/imgUploadCommu", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ComAttachImageVO>> imgUploadCommuPOST(MultipartFile[] uploadFile) {

		log.info("imgUploadCommuPOST..........");

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {
				List<ComAttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}

		}

		String uploadFolder = "D:\\DogUpload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		List<ComAttachImageVO> list = new ArrayList();

		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {

			ComAttachImageVO vo = new ComAttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				/*
				 * BufferedImage bo_image = ImageIO.read(saveFile);
				 * 
				 * 비율 double ratio = 3; 넓이 높이 int width = (int) (bo_image.getWidth() / ratio);
				 * int height = (int) (bo_image.getHeight() / ratio);
				 * 
				 * BufferedImage bt_image = new BufferedImage(width, height,
				 * BufferedImage.TYPE_3BYTE_BGR);
				 * 
				 * Graphics2D graphic = bt_image.createGraphics();
				 * 
				 * graphic.drawImage(bo_image, 0, 0, width, height, null);
				 * 
				 * ImageIO.write(bt_image, "jpg", thumbnailFile);
				 */

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		ResponseEntity<List<ComAttachImageVO>> result = new ResponseEntity<List<ComAttachImageVO>>(list, HttpStatus.OK);

		return result;
	}

	@GetMapping("/commuDisplay")
	public ResponseEntity<byte[]> getImage(String fileName) {
		File file = new File("D:\\DogUpload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFileCommu")
	public ResponseEntity<String> deleteFileCommu(String fileName){
		
		log.info("deleteFile........" + fileName);
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("D:\\DogUpload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getComAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ComAttachImageVO>> getComAttachList(int bno){
		
		log.info("getComAttachList.........." + bno);
		
		return new ResponseEntity<List<ComAttachImageVO>>(cAttachMapper.getComAttachList(bno), HttpStatus.OK);
		
	}

	/* 커뮤니티 글 조회 */
	@GetMapping("/commuContent")
	public void commuContentPageGET(int bno, Model model, Criteria cri) throws Exception {
		model.addAttribute("pageInfo", cService.getPage(bno));
		model.addAttribute("cri", cri);
		model.addAttribute("reply", replyService.getReplyList());
	}

	/* 커뮤니티 글 수정 페이지 이동 */
	@GetMapping("/commuModify")
	public void commuModifyGET(int bno, Model model, Criteria cri) throws Exception {
		model.addAttribute("pageInfo", cService.getPage(bno));
		model.addAttribute("cri", cri);
	}

	/* 커뮤니티 글 수정 */
	@PostMapping("/commuModify")
	public String commuModifyPOST(CommunityVO cvo, RedirectAttributes rttr) throws Exception {
		cService.modify(cvo);

		rttr.addFlashAttribute("result", "modify Success");

		return "redirect:/commu/commuList";
	}

	/* 커뮤니티 글 삭제 */
	@PostMapping("/commuDelete")
	public String commuDeletePOST(int bno, RedirectAttributes rttr) throws Exception {
		cService.delete(bno);

		rttr.addFlashAttribute("result", "delete Success");

		return "redirect:/commu/commuList";
	}

}
