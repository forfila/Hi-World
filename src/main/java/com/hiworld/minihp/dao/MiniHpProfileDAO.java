package com.hiworld.minihp.dao;

import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpProfileVO;

@Repository
public interface MiniHpProfileDAO {
	
	/*회원 미니홈피 프로필 존재 확인*/
	MiniHpProfileVO checkProfile(String userId); 
	
	/*회원 미니홈피 프로필 불러오기*/
	MiniHpProfileVO getProfile(String userId);
	
	/*회원 미니홈피 프로필 수정*/
	int updateProfile(MiniHpProfileVO profileVO);
	
	/*회원 미니홈피 프로필 작성*/
	int insertProfile(MiniHpProfileVO profileVO);

	
}
