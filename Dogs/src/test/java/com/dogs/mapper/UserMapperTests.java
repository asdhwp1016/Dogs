package com.dogs.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dogs.model.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {

	@Autowired
	private UserMapper usermapper;  //UserMapper.java 인터페이스 의존성 주입
	
	//회원가입 쿼리 테스트 메서드
	/*
	@Test
	public void userJoin() throws Exception {
		UserVO user = new UserVO();
		
		user.setUserId("test2");
		user.setPassword("test2");
		user.setUserName("test");
		user.setEmail("test");
		user.setPhone("test");
		user.setAddr1("test");
		user.setAddr2("test");
		user.setAddr3("test");
		
		usermapper.userJoin(user);
	}
	*/
	
	
	// 아이디 중복검사
	/*
	@Test
	public void userIdChk() throws Exception{
		String id = "test";	// 존재하는 아이디
		String id2 = "test123";	// 존재하지 않는 아이디
		usermapper.idCheck(id);
		usermapper.idCheck(id2);
	}
	*/
	
	
	/* 로그인 쿼리 mapper 메서드 테스트 */
	/*
    @Test
    public void userLogin() throws Exception{
        
        UserVO user = new UserVO();    // UserVO 변수 선언 및 초기화
        
        //올바른 아이디 비번 입력경우 
        user.setUserId("test1");
        user.setPassword("test1");
        
        //올바른 않은 아이디 비번 입력경우 
        //member.setMemberId("test1123");
        //member.setMemberPw("test1321321");
        
        usermapper.userLogin(user);
        System.out.println("결과 값 : " + usermapper.userLogin(user));
    }
	*/
	
}
