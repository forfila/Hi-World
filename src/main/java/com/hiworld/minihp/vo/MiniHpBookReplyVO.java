package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpBookReplyVO {
	private int replySerial;
	private int userSerial;
	private String userName;
	private int bookSerial;
	private String replyContent;
	private Date cDate;
	public int getReplySerial() {
		return replySerial;
	}
	public void setReplySerial(int replySerial) {
		this.replySerial = replySerial;
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
	public int getBookSerial() {
		return bookSerial;
	}
	public void setBookSerial(int bookSerial) {
		this.bookSerial = bookSerial;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	@Override
	public String toString() {
		return "MiniHpBookReplyVO [replySerial=" + replySerial + ", userSerial=" + userSerial + ", userName=" + userName
				+ ", bookSerial=" + bookSerial + ", replyContent=" + replyContent + ", cDate=" + cDate + "]";
	}
	
}
