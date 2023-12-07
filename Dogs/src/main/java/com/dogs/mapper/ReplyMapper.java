package com.dogs.mapper;

import java.util.List;

import com.dogs.model.ReplyVO;

public interface ReplyMapper {
	
	/* 댓글 등록 */
	public int enrollReply(ReplyVO rvo);
	
	/* 댓글 조회 */
	public List<ReplyVO> getReplyList();
	
	/* 댓글 삭제 */
	public int deleteReply(int replyId);

}
