package com.dogs.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.CommunityVO;
import com.dogs.model.Criteria;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CommunityMapperTest {
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(CommunityMapperTest.class);
	
	@Autowired
	private CommunityMapper comMapper;
	
	/* 커뮤니티 글 등록 테스트 */
	@Test
	public void testEnroll() {
		CommunityVO cvo = new CommunityVO();
		cvo.setTitle("mtest");
		cvo.setComContent("mtest");
		cvo.setWriter("aaa");
		comMapper.enroll(cvo);
	}
	
	/* 커뮤니티 글 목록 테스트 */
	@Test
	public void testGetList() {
		
		List list = comMapper.getList();
		
		list.forEach(community -> log.info("" + community));
	}
	
	/* 커뮤니티 글 조회 테스트 */
	@Test
	public void testGetPage() {
		
		/* 실존하는 페이지 */
		int bno = 2;
		
		log.info("" + comMapper.getPage(bno));
	}
	
	/* 커뮤니티 글 조회 테스트(페이징) */
	@Test
	public void testGetPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		List list = comMapper.getListPaging(cri);
		list.forEach(commu -> log.info("" + commu));
	}
	
	/* 커뮤니티 글 수정 테스트 */
	@Test
	public void testModify() {
		CommunityVO cvo = new CommunityVO();
		cvo.setBno(3);
		cvo.setTitle("수정수정");
		cvo.setComContent("수정 내용내용");
		
		int result = comMapper.modify(cvo);
		log.info("result: " + result);
	}
	
	/* 커뮤니티 글 삭제 테스트 */
	@Test
	public void testDelete() {
		int result = comMapper.delete(3);
		log.info("result: " + result);
	}
} 
