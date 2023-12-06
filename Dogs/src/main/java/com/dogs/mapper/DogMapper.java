package com.dogs.mapper;

import java.util.List;

import com.dogs.model.DogVO;

public interface DogMapper {
	
	// 포메라니안
	public List<DogVO> dogList_1();
	
	// 비숑
	public List<DogVO> dogList_2();
	
	// 불독
	public List<DogVO> dogList_3();
		
	// 웰시코기
	public List<DogVO> dogList_4();
		
	// 말티푸
	public List<DogVO> dogList_5();
}
