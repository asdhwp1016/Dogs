package com.dogs.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CommunityVO {
	
	private int bno;
	private String title;
	private String writer;
	private String comContent;
	private String comCateCode;
	private Date regDate;
	private Date updateDate;
	private List<ComAttachImageVO> comImageList;
	private CommuCateVO comCateVO;
	
}
