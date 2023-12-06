package com.dogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogs.mapper.DogMapper;
import com.dogs.model.DogVO;

@Service
public class DogServiceImpl implements DogService {

	@Autowired
	private DogMapper dogMapper;
	
	// 포메라니안
	@Override
	public List<DogVO> dogList_1() {
		return dogMapper.dogList_1();
	}

	// 비숑
	@Override
	public List<DogVO> dogList_2() {
		return dogMapper.dogList_2();
	}

	// 불독
	@Override
	public List<DogVO> dogList_3() {
		return dogMapper.dogList_3();
	}

	// 웰시코기
	@Override
	public List<DogVO> dogList_4() {
		return dogMapper.dogList_4();
	}

	// 말티푸
	@Override
	public List<DogVO> dogList_5() {
		return dogMapper.dogList_5();
	}
}
