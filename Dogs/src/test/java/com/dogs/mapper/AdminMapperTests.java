package com.dogs.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.DogVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

	@Autowired 
	private AdminMapper mapper;
	
	/*강쥐 등록*/
	@Test
	public void dogEnrollTest() throws Exception {
		
		DogVO dog = new DogVO();
		
		dog.setDogName("mapper 테스트");
		dog.setDogCateCode("001");
		dog.setDogPrice(200000);
		dog.setDogPoint("귀여움");
		dog.setDogContent("우리집은 동구가 있다");
		
		mapper.dogEnroll(dog);
		
	}
	
	
}
