package com.dogs.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ComAttachMapperTests {
	
	@Autowired
	private ComAttachMapper comAttachMapper;
	
	/*이미지 정보 반환*/
	@Test
	public void getAttachListTests() {
		
		int bno = 1044;
		
		System.out.println("이미지 정보 : " + comAttachMapper.getComAttachList(bno));
		
		
	}
}
