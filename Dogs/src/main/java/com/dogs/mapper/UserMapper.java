package com.dogs.mapper;

import com.dogs.model.UserVO;

public interface UserMapper {
	
	//회원가입
	public void userJoin(UserVO user);
	
	//아이디 중복검사
	public int idCheck(String userId);
	
	//로그인
	public UserVO userLogin(UserVO user);

}
