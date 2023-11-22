package com.dogs.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityVO {
	private int bno;
	private String title;
	private String writer;
	private String comContent;
	private String comCateCode;
	private Date regDate;
	private Date updateDate;
	
}
