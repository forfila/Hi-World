package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hiworld.minihp.vo.MiniHpBookReplyVO;
import com.hiworld.minihp.vo.MiniHpBookVO;

public interface MiniHpBookDAO {
	//selectAll
	List<MiniHpBookVO> getAll(@Param("userSerial") int userSerial, @Param("offset") int offset,@Param("size") int size);
	//현재 로그인된 유저 미니미 가져오기
	String getMiniMe(int userSerial);
	//페이징처리
	int countAll(int userSerial);
	//게시물 insert
	int insert(MiniHpBookVO vo);
	//delete
	int delete(int serial);
	//update
	int update(@Param("serial") int serial, @Param("content") String content);
	//비밀로 하기
	int changeSecret(@Param("serial") int serial,@Param("isSecret") int isSecret);
	
	//댓글
	//selectAll
	//int getReplyCnt(int videoSerial);
	List<MiniHpBookReplyVO> getAllReply(int bookSerial);
	//insert
	int insertReply(MiniHpBookReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(@Param("serial") int serial, @Param("content") String content);
}
