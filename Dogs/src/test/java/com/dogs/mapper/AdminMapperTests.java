package com.dogs.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.Criteria;
import com.dogs.model.DogVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

	@Autowired 
	private AdminMapper mapper;
	
	/*강아지 등록*/
	/*
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
	*/
	
	
	/*강아지 카테고리 리스트*/
	/*
	@Test
	public void dogCateListTest() throws Exception {
		
		System.out.println("dogCateList()........" + mapper.dogCateList());
		
	}
	*/
	
	
	/*강아지 상품 리스트 & 강아지 상품 총 갯수*/
	/*
	@Test
	public void dogsGetListTest() {
		
		Criteria cri = new Criteria();
		
		//검색조건 
		//cri.setKeyword("");
		
		//검색 리스트 
		List list = mapper.dogsGetList(cri);
		for(int i = 0; i < list.size(); i++) {
			System.out.println("result......." + i + " : " + list.get(i));
		}
		
		//상품 총 갯수
		int result = mapper.dogsGetTotal(cri);
		System.out.println("resutl.........." + result);
		
	}*/
	
	
	/*강아지 상품 조회 페이지*/
	/*
	@Test
	public void dogsGetDetailTest() {
		
		int dogId = 3;
		
		DogVO result = mapper.dogsGetDetail(dogId);
		
		System.out.println("강아지 상품 조회 데이터 : " + result);
		
	}
	*/
	
	
	/* 강아지 상품 정보 수정 */ 
	/*
	@Test
	public void dogsModifyTest() {
		
		DogVO dog = new DogVO();
		
		dog.setDogId(3);
		dog.setDogName("동구 이름 수정");
		dog.setDogCateCode("002");
		dog.setDogPrice(900000);
		dog.setDogPoint("동구 특징 수정");
		dog.setDogContent("동구 소개 수정");
		
		mapper.dogsModify(dog);
		
	}
	*/
	
	
	/*강아지 상품 정보 삭제*/
	@Test
	public void dogsDeleteTest() {
		
		int dogId = 2;
		
		int result = mapper.dogsDelete(dogId);
		
		if(result == 1) {
			System.out.println("삭제 성공");
		}
		
	}
	
	
}
