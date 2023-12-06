package com.dogs.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.mapper.ReviewMapperTests;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewServiceTests {
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(ReviewMapperTests.class);
	
	@Autowired
	private ReviewService reviewService;
	
	/*
	// 리뷰 데이터 불러오기
	@Test
	public void testReviewList() {
		List list = reviewService.reviewList();
		
		for(Object a : list) {
			log.info("" + a);
		}
	}
	*/
	
}
