package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardReplyVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

public interface MiniHpBoardDAO {
	int getFolderScope(int folderSerial);
	
	//폴더 부분
	//select all
	List<MiniHPBoardFolderVO> getAllFolder(int userSerial);
	//insert
	int addFolder(MiniHPBoardFolderVO vo);
	//delete
	int countInsideFolder(int serial);//삭제하고자 하는 폴더안에 게시글이 있는지 확인
	int deleteFolder(int serial);//없을 경우 삭제
	//update
	int updateFolder(MiniHPBoardFolderVO vo);
	
	
	// 게시판 관련--------------------------
	//맨 첫번째 폴더 가져오기
	int getFirstFolderSerial(int userSerial);
	List<MiniHpBoardVO> getAll(@Param("folderSerial") int folderSerial,@Param("offset")  int offset,@Param("size")  int size);
	String getFolderName(int folderSerial);
	//게시물 insert
	int insert(MiniHpBoardVO vo);
	//select one
	MiniHpBoardVO get(int serial);
	//게시글 폴더 이동
	int updateBoardFolder(@Param("boardSerial") int boardSerial,@Param("folderSerial")  int folderSerial);
	//delete
	int delete(int serial);
	//update
	int update(MiniHpBoardVO vo);
	
	//댓글
	//selectAll
	List<MiniHpBoardReplyVO> getAllReply(int boardSerial);
	//insert
	int insertReply(MiniHpBoardReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(@Param("serial") int serial, @Param("content") String content);
	
	//조회수
	int updateHit(int boardSerial);
}
