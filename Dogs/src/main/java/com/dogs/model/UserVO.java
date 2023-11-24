package com.dogs.model;

import java.util.Date;

public class UserVO {

		//회원 id
		private String userId;
		
		//회원 비밀번호
		private String password;
		
		//회원 이름
		private String userName;
		
		//회원 이메일
		private String email;
		
		//회원 전화번호
		private String phone;
		
		//회원 우편번호
		private String addr1;
		
		//회원 주소
		private String addr2;
		
		//회원 상세주소
		private String addr3;
		
		// 관리자 구분(0:일반사용자, 1:관리자)
		private int adminCk;
		
		//등록일자
		private Date regDate;
		
		//회원 돈
		private int money;

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getAddr1() {
			return addr1;
		}

		public void setAddr1(String addr1) {
			this.addr1 = addr1;
		}

		public String getAddr2() {
			return addr2;
		}

		public void setAddr2(String addr2) {
			this.addr2 = addr2;
		}

		public String getAddr3() {
			return addr3;
		}

		public void setAddr3(String addr3) {
			this.addr3 = addr3;
		}

		public int getAdminCk() {
			return adminCk;
		}

		public void setAdminCk(int adminCk) {
			this.adminCk = adminCk;
		}

		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}

		public int getMoney() {
			return money;
		}

		public void setMoney(int money) {
			this.money = money;
		}

		@Override
		public String toString() {
			return "UserVO [userId=" + userId + ", password=" + password + ", userName=" + userName + ", email=" + email
					+ ", phone=" + phone + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", adminCk="
					+ adminCk + ", regDate=" + regDate + ", money=" + money + "]";
		}	
	
}
