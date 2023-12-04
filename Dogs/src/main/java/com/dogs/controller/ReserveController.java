package com.dogs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dogs.model.ReserveVO;
import com.dogs.service.ReserveService;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(CommunityCotroller.class);
	
	@Autowired
	private ReserveService rService;
	
	/* 예약하기 페이지 이동 */
	@GetMapping("/reserveEnroll")
	public void reserveEnrollGET() throws Exception {
		
		log.info("예약하기 페이지 진입");
		
	}
	
	
	/* 예약하기 */
	@PostMapping("/reserveEnroll")
	public String reserveEnrollPOST(ReserveVO rvo, RedirectAttributes rttr) {
		log.info("예약......" + rvo);
		
		rService.enroll(rvo);
		rttr.addFlashAttribute("rev_result", rvo.getReserveId());
		
		return "redirect:/reserve/reserveCheck";
	}
	
	/* 예약하기 페이지 이동 */
	@GetMapping("/reserveCheck")
	public void reserveCheckGET(Model model) throws Exception {
		log.info("예약완료 페이지 진입");
		
		List<ReserveVO> rList = rService.getList();
		model.addAttribute("rList", rList);
		
		System.out.println(rList);
	}
	
	/* 핸드폰 인증 */
	@GetMapping("/phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber, RedirectAttributes rttr) { // 휴대폰 문자보내기
		
		log.info("핸드폰 인증 전송");
		
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		rService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return Integer.toString(randomNumber);
	}
}
