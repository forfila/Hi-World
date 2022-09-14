package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hiworld.minihp.vo.MiniHPVideoFolderVO;
import com.hiworld.minihp.vo.MiniHpVideoReplyVO;
import com.hiworld.minihp.vo.MiniHpVideoVO;

public interface MiniHpVideoDAO {
	int getFolderScope(int folderSerial);
	
	//폴더 부분
	//select all
	List<MiniHPVideoFolderVO> getAllFolder(int userSerial);
	//insert
	int addFolder(MiniHPVideoFolderVO vo);
	//delete
	int countInsideFolder(int serial);//삭제하고자 하는 폴더안에 게시글이 있는지 확인
	int deleteFolder(int serial);//없을 경우 삭제
	//update
	int updateFolder(MiniHPVideoFolderVO vo);
	
	
	// 게시판 관련--------------------------
	//맨 첫번째 폴더 가져오기
	int getFirstFolderSerial(int userSerial);
	List<MiniHpVideoVO> getAll(@Param("folderSerial") int folderSerial,@Param("offset") int offset,@Param("size") int size);
	String getFolderName(int folderSerial);
	//게시물 insert
	int insert(MiniHpVideoVO vo);
	//게시글 폴더 이동
	int updateVideoFolder(@Param("videoSerial") int videoSerial,@Param("folderSerial")  int folderSerial);
	//delete
	int delete(int serial);
	//update
	MiniHpVideoVO get(int serial);
	int update(MiniHpVideoVO vo);
	
	//댓글
	//selectAll
	int getReplyCnt(int videoSerial);
	List<MiniHpVideoReplyVO> getAllReply(int videoSerial);
	//insert
	int insertReply(MiniHpVideoReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(@Param("serial") int serial, @Param("content") String content);
}
