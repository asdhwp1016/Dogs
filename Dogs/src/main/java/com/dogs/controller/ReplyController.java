package com.dogs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dogs.model.ReplyVO;
import com.dogs.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	/* 댓글 등록 */
	@PostMapping("/enroll")
	public void enrollReplyPOST(ReplyVO vo) {
		replyService.enrollReply(vo);
	}
	
	/* 댓글 삭제 */
	@PostMapping("/delete")
	public void replyDeletePOST(ReplyVO rvo) {
		replyService.deleteReply(rvo);
	}

}
