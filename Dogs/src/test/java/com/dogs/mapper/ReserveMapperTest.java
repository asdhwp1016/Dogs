package com.dogs.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.ReserveVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReserveMapperTest {
	
	@Autowired
	private ReserveMapper rMapper;
	
	@Test
	public void reserveEnrollTest() throws Exception {
		
		ReserveVO rvo = new ReserveVO();
		
		rvo.setReserveId("ddd");
		rvo.setReserveName("가가가");
		rvo.setReservePhone("kkk");
		rvo.setReserveDate("23-12-03");
		
		rMapper.enroll(rvo);
	}
}
