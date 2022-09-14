package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpBookVO {
	private int bookSerial;
	private int userSerial;
	private String userName;
	private int writeUserSerial;
	private String writeUserName;
	private String miniMe;
	private String content;
	private int replyCnt;
	private int isSecret;
	private Date cDate;
	private Date uDate;
	public int getBookSerial() {
		return bookSerial;
	}
	public void setBookSerial(int bookSerial) {
		this.bookSerial = bookSerial;
	}
	public int getUserSerial() {
		return userSerial;
	}
	public void setUserSerial(int userSerial) {
		this.userSerial = userSerial;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getWriteUserSerial() {
		return writeUserSerial;
	}
	public void setWriteUserSerial(int writeUserSerial) {
		this.writeUserSerial = writeUserSerial;
	}
	public String getWriteUserName() {
		return writeUserName;
	}
	public void setWriteUserName(String writeUserName) {
		this.writeUserName = writeUserName;
	}
	public String getMiniMe() {
		return miniMe;
	}
	public void setMiniMe(String miniMe) {
		this.miniMe = miniMe;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getIsSecret() {
		return isSecret;
	}
	public void setIsSecret(int isSecret) {
		this.isSecret = isSecret;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Date getuDate() {
		return uDate;
	}
	public void setuDate(Date uDate) {
		this.uDate = uDate;
	}
	@Override
	public String toString() {
		return "MiniHpBookVO [bookSerial=" + bookSerial + ", userSerial=" + userSerial + ", userName=" + userName
				+ ", writeUserSerial=" + writeUserSerial + ", writeUserName=" + writeUserName + ", miniMe=" + miniMe
				+ ", content=" + content + ", replyCnt=" + replyCnt + ", isSecret=" + isSecret + ", cDate=" + cDate
				+ ", uDate=" + uDate + "]";
	}
	
}
