package com.hiworld.minihp.vo;

public class MiniHpNeighborListVO {

	private int senderSerial;
	private String senderName;
	private String senderValue;
	private int receiverSerial;
	private String receiverName;
	private String receiverValue;
	private String userMessage;
	private int type;
	
	public int getSenderSerial() {
		return senderSerial;
	}
	public void setSenderSerial(int senderSerial) {
		this.senderSerial = senderSerial;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderValue() {
		return senderValue;
	}
	public void setSenderValue(String senderValue) {
		this.senderValue = senderValue;
	}
	public int getReceiverSerial() {
		return receiverSerial;
	}
	public void setReceiverSerial(int receiverSerial) {
		this.receiverSerial = receiverSerial;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverValue() {
		return receiverValue;
	}
	public void setReceiverValue(String receiverValue) {
		this.receiverValue = receiverValue;
	}
	public String getUserMessage() {
		return userMessage;
	}
	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
