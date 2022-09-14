package com.hiworld.client.vo;

public class sessionVO {
	private int UserSerial;
	private String UserName;
	private String UserID;
	private String UserBirth;
	private String UserTel;
	private String UserGender;
	private String UserAddress;
	private int UserCash;
	private int count;
	private int isFollow;
	
	
	
	public int getUserSerial() {
		return UserSerial;
	}
	public void setUserSerial(int userSerial) {
		UserSerial = userSerial;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserBirth() {
		return UserBirth;
	}
	public void setUserBirth(String userBirth) {
		UserBirth = userBirth;
	}
	public String getUserTel() {
		return UserTel;
	}
	public void setUserTel(String userTel) {
		UserTel = userTel;
	}
	public String getUserGender() {
		return UserGender;
	}
	public String getUserAddress() {
		return UserAddress;
	}
	public void setUserAddress(String userAddress) {
		UserAddress = userAddress;
	}
	public void setUserGender(String userGender) {
		UserGender = userGender;
	}
	public int getUserCash() {
		return UserCash;
	}
	public void setUserCash(int userCash) {
		UserCash = userCash;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getIsFollow() {
		return isFollow;
	}
	public void setIsFollow(int isFollow) {
		this.isFollow = isFollow;
	}
	
	
	
	
	
}
