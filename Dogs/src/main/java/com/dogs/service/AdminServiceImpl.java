package com.dogs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogs.mapper.AdminMapper;
import com.dogs.model.DogVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	/*강쥐 등록*/
	@Override
	public void dogEnroll(DogVO dog) {
		
		log.info("(service)dogEnroll........");
		
		adminMapper.dogEnroll(dog);
		
	}

}
