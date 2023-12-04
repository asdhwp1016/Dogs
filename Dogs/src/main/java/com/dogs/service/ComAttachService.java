package com.dogs.service;

import java.util.List;

import com.dogs.model.ComAttachImageVO;

public interface ComAttachService {
	
	/* 이미지 데이터 반환 */
	public List<ComAttachImageVO> getComAttachList(int bno);
	
}
