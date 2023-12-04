package com.dogs.model;

public class AttachDogImageVO {

	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* uuid1 */
	private String uuid1;
	
	/* uuid2 */
	private String uuid2;
	
	/* uuid3 */
	private String uuid3;
	
	/* 강아지 id */
	private int dogId;

	/* 메인 사진 파일 이름 */
	private String fileMain;
	
	/* 1번쨰 상세 사진 파일 이름 */
	private String fileSub1;
	
	/* 2번째 상세 사진 파일 이름 */
	private String fileSub2;
	
	/* 3번째 상세 사진 파일 이름 */
	private String fileSub3;

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUuid1() {
		return uuid1;
	}

	public void setUuid1(String uuid1) {
		this.uuid1 = uuid1;
	}

	public String getUuid2() {
		return uuid2;
	}

	public void setUuid2(String uuid2) {
		this.uuid2 = uuid2;
	}

	public String getUuid3() {
		return uuid3;
	}

	public void setUuid3(String uuid3) {
		this.uuid3 = uuid3;
	}

	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	public String getFileMain() {
		return fileMain;
	}

	public void setFileMain(String fileMain) {
		this.fileMain = fileMain;
	}

	public String getFileSub1() {
		return fileSub1;
	}

	public void setFileSub1(String fileSub1) {
		this.fileSub1 = fileSub1;
	}

	public String getFileSub2() {
		return fileSub2;
	}

	public void setFileSub2(String fileSub2) {
		this.fileSub2 = fileSub2;
	}

	public String getFileSub3() {
		return fileSub3;
	}

	public void setFileSub3(String fileSub3) {
		this.fileSub3 = fileSub3;
	}

	@Override
	public String toString() {
		return "AttachDogImageVO [uploadPath=" + uploadPath + ", uuid=" + uuid + ", uuid1=" + uuid1 + ", uuid2=" + uuid2
				+ ", uuid3=" + uuid3 + ", dogId=" + dogId + ", fileMain=" + fileMain + ", fileSub1=" + fileSub1
				+ ", fileSub2=" + fileSub2 + ", fileSub3=" + fileSub3 + "]";
	}
	
}
