package com.dogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogs.mapper.CommunityMapper;
import com.dogs.model.CommunityVO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityMapper comMapper;
	
	@Override
	public void enroll(CommunityVO cvo) {
		comMapper.enroll(cvo);
	}
	
	@Override
	public List<CommunityVO> getList() {
		return comMapper.getList();
	}
}
