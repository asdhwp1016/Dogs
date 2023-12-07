package com.dogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogs.mapper.ReplyMapper;
import com.dogs.model.ReplyVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Override
		public int enrollReply(ReplyVO rvo) {
			int result = mapper.enrollReply(rvo);
			return result;
		}
	
	@Override
	public List<ReplyVO> getReplyList() {
		return mapper.getReplyList();
	}
	
	@Override
	public int deleteReply(ReplyVO rvo) {
		
		int result = mapper.deleteReply(rvo.getReplyId()); 
		return result;
	}
}
