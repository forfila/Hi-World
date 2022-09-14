package com.hiworld.client.vo;

public class ClientVO {
	
	/* 필요 칼럼 정의 */
	private int UserSerial;
	private String UserName;
	private String UserID;
	private String UserPW;
	private String UserGender;
	private String UserBirth;
	private String UserTel;
	private String UserTel1;
	private String UserTel2;
	private String UserTel3;
	private String UserAddress;
	private int UserCash;
	private int Admin;
	private int Ban;
	private int count;
	
	
	public ClientVO() {
		super();
	}


	/* 칼럼 setter, getter */
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


	public String getUserPW() {
		return UserPW;
	}


	public void setUserPW(String userPW) {
		UserPW = userPW;
	}


	public String getUserGender() {
		return UserGender;
	}


	public void setUserGender(String userGender) {
		UserGender = userGender;
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


	public String getUserTel1() {
		return UserTel1;
	}


	public void setUserTel1(String userTel1) {
		UserTel1 = userTel1;
	}


	public String getUserTel2() {
		return UserTel2;
	}


	public void setUserTel2(String userTel2) {
		UserTel2 = userTel2;
	}


	public String getUserTel3() {
		return UserTel3;
	}


	public void setUserTel3(String userTel3) {
		UserTel3 = userTel3;
	}


	public String getUserAddress() {
		return UserAddress;
	}


	public void setUserAddress(String userAddress) {
		UserAddress = userAddress;
	}


	public int getUserCash() {
		return UserCash;
	}


	public void setUserCash(int userCash) {
		UserCash = userCash;
	}


	public int getAdmin() {
		return Admin;
	}


	public void setAdmin(int admin) {
		Admin = admin;
	}


	public int getBan() {
		return Ban;
	}


	public void setBan(int ban) {
		Ban = ban;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}
	
	
}
