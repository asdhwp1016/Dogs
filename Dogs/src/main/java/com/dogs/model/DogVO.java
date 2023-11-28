package com.dogs.model;

import java.util.Date;

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
	
	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	public String getDogCateCode() {
		return dogCateCode;
	}

	public void setDogCateCode(String dogCateCode) {
		this.dogCateCode = dogCateCode;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public int getDogPrice() {
		return dogPrice;
	}

	public void setDogPrice(int dogPrice) {
		this.dogPrice = dogPrice;
	}

	public String getDogPoint() {
		return dogPoint;
	}

	public void setDogPoint(String dogPoint) {
		this.dogPoint = dogPoint;
	}

	public String getDogContent() {
		return dogContent;
	}

	public void setDogContent(String dogContent) {
		this.dogContent = dogContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public String getdCateName() {
		return dCateName;
	}

	public void setdCateName(String dCateName) {
		this.dCateName = dCateName;
	}
	
	public String getDCateCode() {
	    return dCateCode;
	}

	public void setDCateCode(String dCateCode) {
	    this.dCateCode = dCateCode;
	}

	@Override
	public String toString() {
		return "DogVO [dogId=" + dogId + ", dogCateCode=" + dogCateCode + ", dogName=" + dogName + ", dogPrice="
				+ dogPrice + ", dogPoint=" + dogPoint + ", dogContent=" + dogContent + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + ", dCateName=" + dCateName + ", dCateCode=" + dCateCode + "]";
	}

	
}
