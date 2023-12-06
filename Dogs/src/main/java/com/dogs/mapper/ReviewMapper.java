package com.dogs.mapper;

import java.util.List;

import com.dogs.model.ReviewVO;

public interface ReviewMapper {
	
	// 리뷰 정보 불러오기
	public List<ReviewVO> reviewList();
	
}
