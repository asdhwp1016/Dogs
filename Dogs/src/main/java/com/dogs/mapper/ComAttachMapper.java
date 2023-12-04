package com.dogs.mapper;

import java.util.List;

import com.dogs.model.ComAttachImageVO;

public interface ComAttachMapper {
	
	/* 이미지 데이터 반환 */
	public List<ComAttachImageVO> getComAttachList(int bno);
	
	
}
