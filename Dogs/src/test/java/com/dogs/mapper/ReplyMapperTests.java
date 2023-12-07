package com.dogs.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(CommunityMapperTest.class);
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void replyEnrollTest() {
		
		String userId = "ddd";
		int bno = 1043;
		String content = "댓글 테스트";
		
		ReplyVO vo = new ReplyVO();
		vo.setUserId(userId);
		vo.setBno(bno);
		vo.setContent(content);
		
		mapper.enrollReply(vo);
		System.out.println(vo);
	}
	
	/* 댓글 가져오기 테스트 */
	@Test
	public void testGetList() {

		List list = mapper.getReplyList();

		list.forEach(reply -> log.info("" + reply));
	}
	
	@Test
	public void testDelete() {
		int result = mapper.deleteReply(1);
	}

}
