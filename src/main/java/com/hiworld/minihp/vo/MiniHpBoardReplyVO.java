package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpBoardReplyVO {
	private int replySerial;
	private int userSerial;
	private String userName;
	private int boardSerial;
	private String replyContent;
	private Date cDate;
	
	public MiniHpBoardReplyVO() {}
	public MiniHpBoardReplyVO(int replySerial, int userSerial, String userName, int boardSerial, String replyContent,
			Date cDate) {
		this.replySerial = replySerial;
		this.userSerial = userSerial;
		this.userName = userName;
		this.boardSerial = boardSerial;
		this.replyContent = replyContent;
		this.cDate = cDate;
	}
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
	public int getBoardSerial() {
		return boardSerial;
	}
	public void setBoardSerial(int boardSerial) {
		this.boardSerial = boardSerial;
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
		return "MiniHpBoardReplyVO [replySerial=" + replySerial + ", userSerial=" + userSerial + ", userName="
				+ userName + ", boardSerial=" + boardSerial + ", replyContent=" + replyContent + ", cDate=" + cDate
				+ "]";
	}
	
	
}
