package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpNeiWordVO {
	private int serial;
	private int userSerial;
	private String userName;
	private int writeUserSerial;
	private String writeUserName;
	private String content;
	private Date cDate;
	private Date uDate;
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
		return "MiniHpNeiWordVO [serial=" + serial + ", userSerial=" + userSerial + ", userName=" + userName
				+ ", writeUserSerial=" + writeUserSerial + ", writeUserName=" + writeUserName + ", content=" + content
				+ ", cDate=" + cDate + ", uDate=" + uDate + "]";
	}
	
}
