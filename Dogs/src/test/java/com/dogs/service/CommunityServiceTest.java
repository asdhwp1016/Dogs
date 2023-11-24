package com.dogs.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.mapper.CommunityMapperTest;
import com.dogs.model.CommunityVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CommunityServiceTest {
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(CommunityServiceTest.class);
	
	@Autowired
	private CommunityService comService;
	
	@Test
	public void testEnroll() {
		CommunityVO cvo = new CommunityVO();
		cvo.setTitle("service test");
		cvo.setComContent("service test");
		cvo.setWriter("aaa");
		comService.enroll(cvo);
	}
	
	@Test
	public void testGetList() {
		comService.getList().forEach(community -> log.info("" + community));
	}
	
	@Test
	public void testGetPage() {
		int bno = 3;
		
		log.info("" + comService.getPage(bno));
	}
	
	@Test
	public void testModify() {
		CommunityVO cvo = new CommunityVO();
		cvo.setBno(3);
		cvo.setTitle("수정 서비스");
		cvo.setComContent("수정 서비스 내용");
		
		int result = comService.modify(cvo);
		log.info("result: " + result);
	}
}
