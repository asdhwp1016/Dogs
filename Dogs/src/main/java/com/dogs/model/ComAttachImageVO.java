package com.dogs.model;

import lombok.Data;

@Data
public class ComAttachImageVO {
	
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 게시판 번호 */
	private int bno;
}
