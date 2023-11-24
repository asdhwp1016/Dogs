package com.dogs.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class Criteria {
	
	/* 현재 페이지, 한 페이지 당 게시물 개수 */
	private int pageNum, amount;
	
	/* 검색 키워드, 검색 타입 */
	private String keyword, type;
	
	/* 검색 타입 배열 */
	private String[] typeArr;
	
	/* 기본 생성자 기본 세팅 pageNum=1, amount=10 */
	public Criteria() {
		this(1, 10);
	}
	
	/* 생성자 원하는 페이지 번호, 원하는 페이지 당 보여지는 게시물 개수 */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	
}
