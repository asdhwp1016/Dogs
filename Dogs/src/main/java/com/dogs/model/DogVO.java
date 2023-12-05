package com.dogs.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DogVO {

	/* 강쥐 id */
	private int dogId;
	
	/* 강쥐 카테고리 */
	private String dogCateCode;
	
	/* 강쥐 이름 */
	private String dogName;
	
	/* 강쥐 가격 */
	private int dogPrice;
	
	/* 강쥐 특징 */
	private String dogPoint;
	
	/* 강쥐 소개 */
	private String dogContent;
	
	/* 강쥐 등록 날짜 */
	private Date regDate;
	
	/* 강쥐 수정 날짜 */
	private Date updateDate;
	
	/*강쥐 카테고리 이름*/
	private String dCateName;

	/*카테고리 테이블의 카테코드*/
	private String dCateCode;
	
	/*메인 이미지*/
    private MultipartFile fileMain;
	
	/*서브 이미지1*/
	private MultipartFile fileSub1;
	
	/*서브 이미지2*/
	private MultipartFile fileSub2;
	
	/*서브 이미지3*/
	private MultipartFile fileSub3;

	public String getdCateName() {
		return dCateName;
	}

	public void setdCateName(String dCateName) {
		this.dCateName = dCateName;
	}

	public String getdCateCode() {
		return dCateCode;
	}

	public void setdCateCode(String dCateCode) {
		this.dCateCode = dCateCode;
	}
	
	
}
