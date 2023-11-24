package com.dogs.service;

import java.util.List;

import com.dogs.model.CommunityVO;
import com.dogs.model.Criteria;

public interface CommunityService {
	
	/* 커뮤니티 글 등록 */
	public void enroll(CommunityVO cvo);
	
	/* 커뮤니티 글 목록 */
	public List<CommunityVO> getList();
	
	/* 커뮤니티 글 목록(페이징) */
	public List<CommunityVO> getListPaging(Criteria cri);
	
	/* 커뮤니티 글 조회 */
	public CommunityVO getPage(int bno);
	
	/* 커뮤니티 글 수정 */
	public int modify(CommunityVO cvo);
	
	/* 커뮤니티 글 삭제 */
	public int delete(int bno);
	
	/* 커뮤니티 총 개수 */
	public int getTotal(Criteria cri);
}
