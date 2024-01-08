package com.dogs.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogs.mapper.ReserveMapper;
import com.dogs.model.ReserveVO;

import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Log4j
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveMapper revMapper;
	
	@Override
		public void enroll(ReserveVO rvo) {
			revMapper.enroll(rvo);
		}
	
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSZI7KDEGDCAP2O";
	    String api_secret = "PNIBQAWY4KUCG6HDKPQUOHKOGNCXNG1M";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "010-2773-6079");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[PUPPY] 인증번호는" + "["+randomNumber+"]" + "입니다. 대단히 감사합니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}
	
	@Override
	public List<ReserveVO> getList() {
		return revMapper.getList();
	}
}
