package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpLatestPostsVO {
	private int boardSerial;
	private int pictureSerial;
	private int videoSerial;
	private String title;
	private Date cDate;
	
	public MiniHpLatestPostsVO() {}
	
	public MiniHpLatestPostsVO(int boardSerial, int pictureSerial, int videoSerial, String title, Date cDate) {
		this.boardSerial = boardSerial;
		this.pictureSerial = pictureSerial;
		this.videoSerial = videoSerial;
		this.title = title;
		this.cDate = cDate;
	}
	public MiniHpLatestPostsVO(MiniHpBoardVO vo) {
		this.boardSerial = vo.getBoardSerial();
		this.title = vo.getTitle();
		this.cDate = vo.getcDate();
	}
	public MiniHpLatestPostsVO(MiniHpPictureVO vo) {
		this.pictureSerial = vo.getPictureSerial();
		this.title = vo.getTitle();
		this.cDate = vo.getcDate();
	}
	public MiniHpLatestPostsVO(MiniHpVideoVO vo) {
		this.videoSerial = vo.getVideoSerial();
		this.title = vo.getTitle();
		this.cDate = vo.getcDate();
	}
	
	public int getBoardSerial() {
		return boardSerial;
	}
	public void setBoardSerial(int boardSerial) {
		this.boardSerial = boardSerial;
	}
	public int getPictureSerial() {
		return pictureSerial;
	}
	public void setPictureSerial(int pictureSerial) {
		this.pictureSerial = pictureSerial;
	}
	public int getVideoSerial() {
		return videoSerial;
	}
	public void setVideoSerial(int videoSerial) {
		this.videoSerial = videoSerial;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	@Override
	public String toString() {
		return "MiniHpLatestPostsVO [boardSerial=" + boardSerial + ", pictureSerial=" + pictureSerial + ", videoSerial="
				+ videoSerial + ", title=" + title + ", cDate=" + cDate + "]";
	}
	
}
