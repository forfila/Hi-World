package com.hiworld.minihp.vo;

import org.springframework.web.multipart.MultipartFile;

public class MiniHpIntroVO {
	
	private int userSerial;
	private String userID;
	private String userName;
	private String hpTitle;
	private String fileName;
	private MultipartFile hpPicture_imgFile;
	private byte[] hpPicture;
	private String hpInfo;
	private int hpToday;
	private int hpTotal;
	
	
	public int getUserSerial() {
		return userSerial;
	}
	public void setUserSerial(int userSerial) {
		this.userSerial = userSerial;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getHpTitle() {
		return hpTitle;
	}
	public void setHpTitle(String hpTitle) {
		this.hpTitle = hpTitle;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getHpPicture_imgFile() {
		return hpPicture_imgFile;
	}
	public void setHpPicture_imgFile(MultipartFile hpPicture_imgFile) {
		this.hpPicture_imgFile = hpPicture_imgFile;
	}
	public byte[] getHpPicture() {
		return hpPicture;
	}
	public void setHpPicture(byte[] hpPicture) {
		this.hpPicture = hpPicture;
	}
	public String getHpInfo() {
		return hpInfo;
	}
	public void setHpInfo(String hpInfo) {
		this.hpInfo = hpInfo;
	}
	public int getHpToday() {
		return hpToday;
	}
	public void setHpToday(int hpToday) {
		this.hpToday = hpToday;
	}
	public int getHpTotal() {
		return hpTotal;
	}
	public void setHpTotal(int hpTotal) {
		this.hpTotal = hpTotal;
	}
}
