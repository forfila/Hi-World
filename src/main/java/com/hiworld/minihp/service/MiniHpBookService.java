package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpBookReplyVO;
import com.hiworld.minihp.vo.MiniHpBookVO;

public interface MiniHpBookService {
	
	List<MiniHpBookVO> getAll(int userSerial, int page, int pageSize);
	//현재 로그인된 유저 미니미 가져오기
	String getMiniMe(int userSerial);
	//페이징처리
	int countAll(int userSerial);
	
	int insert(MiniHpBookVO vo);
	//delete
	int delete(int serial);
	//update
	int update(int serial, String content);
	
	//비밀로 하기
	int changeSecret(int serial,int isSecret);
	
	//댓글
	//selectAll
//	int getReplyCnt(int videoSerial);
	List<MiniHpBookReplyVO> getAllReply(int bookSerial);
	//insert
	int insertReply(MiniHpBookReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(int serial, String content);
	
}
