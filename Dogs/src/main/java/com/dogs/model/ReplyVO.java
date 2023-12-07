package com.dogs.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int replyId;
	
	private int bno;
	
	private String userId;

	private Date regDate;
	
	private String content;
	
}
