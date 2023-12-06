package com.dogs.service;

import java.util.List;

import com.dogs.model.ReviewVO;

public interface ReviewService {
	
	// 리뷰 정보 불러오기
	public List<ReviewVO> reviewList();
}
