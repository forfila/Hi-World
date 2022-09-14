package com.hiworld.minihp.service;

import org.springframework.http.ResponseEntity;

import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpVisitorVO;

public interface MiniHpIntroService {
	
	/*유저의 미니홈피 소개글 가져오기*/
	String getIntroInfo(int userSerial);
	
	/*유저의 미니홈피 소개글 수정*/
	void updateIntroInfo(MiniHpIntroVO introVO);
	
	/*유저의 미니홈피 타이틀 가져오기*/
	String getIntroTitle(int userSerial);
	
	/*유저의 미니홈피 타이틀 수정*/
	void updateIntroTitle(MiniHpIntroVO introVO);
	
	/*유저의 미니홈피 프로필 사진 가져오기*/
	ResponseEntity<byte[]> getIntroPicture(int userSerial);
	
	/*유저의 미니홈피 프로필 사진 수정*/
	void updateIntroPicture(MiniHpIntroVO introVO);
	
	/*유저의 미니홈피 방문자 체크*/
	void todayCheck(MiniHpVisitorVO visitorVO);
	
	
}
