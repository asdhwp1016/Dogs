package com.dogs.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.AttachDogImageVO;
import com.dogs.model.DogVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTests {
	
	@Autowired
	private AdminService service;
	
	
	/*강아지 상품 등록 & 강아지 상품 이미지 등록 테스트*/
	@Test
	public void dogEnrollTests() {
		
		DogVO dog = new DogVO();
		
		//강아지 상품 정보
		dog.setDogName("냥냥");
		dog.setDogCateCode("003");
		dog.setDogPrice(200000);
		dog.setDogPoint("졸귀탱");
		dog.setDogContent("진짜 개 졸귀탱");
		
		//이미지 정보
		List<AttachDogImageVO> imageList = new ArrayList<AttachDogImageVO>();
		
		AttachDogImageVO image1 = new AttachDogImageVO();
		
		image1.setFileMain("test main image1");
		image1.setFileSub1("test sub image1");
		image1.setFileSub2("test sub image2");
		image1.setFileSub3("test sub image3");
		image1.setUploadPath("test sub image");
		image1.setUuid("test1112");
		
		imageList.add(image1);
		
		dog.setImageList(imageList);
		
		service.dogEnroll(dog);
		
		System.out.println("등록된 VO : " + dog);
		
	}

}
