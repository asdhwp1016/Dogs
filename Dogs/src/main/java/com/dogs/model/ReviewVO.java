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

	
	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public String getDog_type() {
		return dog_type;
	}

	public void setDog_type(String dog_type) {
		this.dog_type = dog_type;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", review_img=" + review_img + ", dog_type=" + dog_type + "]";
	}
	
}
