package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpVideoReplyVO {
	private int replySerial;
	private int userSerial;
	private String userName;
	private int videoSerial;
	private String replyContent;
	private Date cDate;
	
	public MiniHpVideoReplyVO() {}

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

	public int getVideoSerial() {
		return videoSerial;
	}

	public void setVideoSerial(int videoSerial) {
		this.videoSerial = videoSerial;
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
		return "MiniHpVideoReplyVO [replySerial=" + replySerial + ", userSerial=" + userSerial + ", userName="
				+ userName + ", videoSerial=" + videoSerial + ", replyContent=" + replyContent + ", cDate=" + cDate
				+ "]";
	}

	
	
}
