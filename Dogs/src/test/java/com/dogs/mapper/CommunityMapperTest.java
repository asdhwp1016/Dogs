package com.dogs.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.CommunityVO;



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
}
