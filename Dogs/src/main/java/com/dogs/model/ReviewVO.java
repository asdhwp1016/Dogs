package com.dogs.model;

import lombok.Data;

@Data
public class ReviewVO {
	
	// 이미지 번호
	private int review_id;
	
	// 파일명
	private String review_img;
	
	// 견종
	private String dog_type;

	
}
