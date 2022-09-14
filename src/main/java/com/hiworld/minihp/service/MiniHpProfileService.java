package com.hiworld.minihp.service;

import com.hiworld.minihp.vo.MiniHpProfileVO;

public interface MiniHpProfileService {
	
	/*미니홈피 프로필 존재 확인*/
	String checkProfile(String id);

	/*미니홈피 프로필 불러오기*/
	String getProfile(String id);
	
	/*미니홈피 프로필 작성*/ 
	int insertProfile(MiniHpProfileVO profileVO);

	/*미니홈피 프로필 수정*/
	int updateProfile(MiniHpProfileVO profileVO);
}
