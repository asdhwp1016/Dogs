package com.dogs.service;

import java.util.List;

import com.dogs.model.CommunityVO;

public interface CommunityService {
	
	/* 커뮤니티 글 등록 */
	public void enroll(CommunityVO cvo);
	
	/* 커뮤니티 글 목록 */
	public List<CommunityVO> getList();
}
