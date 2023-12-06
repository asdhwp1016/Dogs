package com.dogs.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewMapperTests {
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(ReviewMapperTests.class);
	
	@Autowired
	private ReviewMapper reviewMapper;	// ReviewMapper.java 인터페이스 의존성 주입
	
	/*
	// 리뷰 데이터 가져오기
	@Test
	public void testReviewList() {
		List list = reviewMapper.reviewList();
		
		for(Object a : list) {
			log.info("" + a);
		}
	}
	*/
	
}
