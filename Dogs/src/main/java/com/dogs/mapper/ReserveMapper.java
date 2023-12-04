package com.dogs.mapper;

import java.util.List;

import com.dogs.model.ReserveVO;

public interface ReserveMapper {
	
	/* 강아지 분양 예약 등록 */
	public void enroll(ReserveVO rvo);
	
	/* 휴대폰 인증 */
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
	
	/* 예약 목록 */
	public List<ReserveVO> getList();
	
}
