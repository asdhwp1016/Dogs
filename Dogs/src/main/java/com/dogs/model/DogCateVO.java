package com.dogs.model;

public class DogCateVO {
	
	/*카테고리 이름*/
	private String dCateName;
	
	/*카테고리 넘버*/
	private String dCateCode;

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

	@Override
	public String toString() {
		return "DogCateVO [dCateName=" + dCateName + ", dCateCode=" + dCateCode + "]";
	}

	
}
