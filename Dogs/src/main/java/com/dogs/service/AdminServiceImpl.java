package com.dogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dogs.mapper.AdminMapper;
import com.dogs.model.AttachDogImageVO;
import com.dogs.model.Criteria;
import com.dogs.model.DogCateVO;
import com.dogs.model.DogVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	/*강쥐 등록*/
	@Transactional
	@Override
	public void dogEnroll(DogVO dog) {
		
		log.info("(service)dogEnroll........");
		
		adminMapper.dogEnroll(dog);
		
	}

	
	/*강아지 카테고리 리스트*/
	@Override
	public List<DogCateVO> dogCateList() {
		
		log.info("(service)dogCateList.......");
		
		return adminMapper.dogCateList();
		
	}


	/*강아지 상품 리스트*/
	@Override
	public List<DogVO> dogsGetList(Criteria cri) {
		log.info("dogsGetTotalList()..........");
		return adminMapper.dogsGetList(cri);
	}


	/*강아지 상품 총 갯수*/
	@Override
	public int dogsGetTotal(Criteria cri) {
		log.info("dogsGetTotal().........");
		return adminMapper.dogsGetTotal(cri);
	}


	/*강아지 상품 조회 페이지*/
	@Override
	public DogVO dogsGetDetail(int dogId) {
		log.info("(service)dogsGetDetail......." + dogId);
		return adminMapper.dogsGetDetail(dogId);
	}


	/*강아지 상품 정보 수정*/
	@Override
	public int dogsModify(DogVO vo) {
		
		log.info("dogsModify.......");
		
		return adminMapper.dogsModify(vo);
		
	}
	
	
	/*강아지 상품 정보 삭제*/
	@Override
	public int dogsDelete(int dogId) {
		
		log.info("dogsDelete........");
		
		return adminMapper.dogsDelete(dogId);
		
	}
	
	
	/*강아지 이미지 리스트*/
	@Override
	public List<DogVO> dogsImageList() {
		
		log.info("dogsImageList.......");
		
		return adminMapper.dogsImageList();
	}

	
	/*강아지 상세 이미지 리스트*/
	public List<DogVO> dogsImageListByCategory(String dogCateCode) {
		
		log.info("dogsImageListByCategory......." + dogCateCode);
		
	    return adminMapper.dogsImageListByCategory(dogCateCode);
	    	
	}
	

}
