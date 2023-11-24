package com.dogs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogs.mapper.UserMapper;
import com.dogs.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper usermapper;
	
	//회원가입
	@Override
	public void userJoin(UserVO user) throws Exception {
		
		usermapper.userJoin(user);
		
	}
	
	
	//아이디 중복검사
	public int idCheck(String userId) throws Exception {
		
		return usermapper.idCheck(userId);
		
	}
	
	
	/*로그인*/
	@Override
	public UserVO userLogin(UserVO user) throws Exception {
		
		return usermapper.userLogin(user);
		
	}
	
	
}
