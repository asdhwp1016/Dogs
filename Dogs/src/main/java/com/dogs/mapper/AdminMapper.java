package com.dogs.mapper;

import java.util.List;

import com.dogs.model.AttachDogImageVO;
import com.dogs.model.Criteria;
import com.dogs.model.DogCateVO;
import com.dogs.model.DogVO;

public interface AdminMapper {

	/* 강쥐 등록 */
	public void dogEnroll(DogVO dog);
	
	/*강아지 카테고리 리스트*/
	public List<DogCateVO> dogCateList();
	
	/*강아지 상품 리스트*/
	public List<DogVO> dogsGetList(Criteria cri);
	
	/*강아지 상품 총 개수*/
	public int dogsGetTotal(Criteria cri);
	
	/*강아지 상품 조회 페이지*/
	public DogVO dogsGetDetail(int dogId);	
	
	/*강아지 상품 수정*/
	public int dogsModify(DogVO vo);
	
	/*강아지 상품 삭제*/
	public int dogsDelete(int dogId);
	
	/*강아지 이미지 리스트*/
	public List<DogVO> dogsImageList();
	
	/*강아지 상품 상세 이미지 리스트*/
	public List<DogVO> dogsImageListByCategory(String dogCateCode);
	
}
