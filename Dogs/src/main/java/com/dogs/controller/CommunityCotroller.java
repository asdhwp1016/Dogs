package com.dogs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dogs.model.CommuCateVO;
import com.dogs.model.CommunityVO;
import com.dogs.model.Criteria;
import com.dogs.model.PageMakeDTO;
import com.dogs.service.CommunityService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/commu/*")
public class CommunityCotroller {
	
	@Autowired
	private CommunityService cService;
	
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
	public void commuEnrollGET(Model model) throws Exception{
		log.info("커뮤니티 글 등록 페이지 진입");
		
		ObjectMapper objm = new ObjectMapper();
		List list = cService.cateList();
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList" ,cateList);
	}
	
	/* 커뮤니티 글 등록 */
	@PostMapping("/commuEnroll")
	public String commuEnrollPOST(CommunityVO cvo, RedirectAttributes rttr) throws Exception {
		
		log.info("CommunityVO: " + cvo);
		
		cService.enroll(cvo);
		rttr.addFlashAttribute("result", "enroll Success");
		return "redirect:/commu/commuList";
	}
	
	/* 커뮤니티 글 조회 */
	@GetMapping("/commuContent")
	public void commuContentPageGET(int bno, Model model, Criteria cri) throws Exception {
		model.addAttribute("pageInfo", cService.getPage(bno));
		model.addAttribute("cri", cri);
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
