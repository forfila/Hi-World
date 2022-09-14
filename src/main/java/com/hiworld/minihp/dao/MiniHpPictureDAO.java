package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hiworld.minihp.vo.MiniHPPictureFolderVO;
import com.hiworld.minihp.vo.MiniHpPictureReplyVO;
import com.hiworld.minihp.vo.MiniHpPictureVO;

public interface MiniHpPictureDAO {
	int getFolderScope(int folderSerial);
	
	
	//폴더 부분
	//select all
	List<MiniHPPictureFolderVO> getAllFolder(int userSerial);
	//insert
	int addFolder(MiniHPPictureFolderVO vo);
	//delete
	int countInsideFolder(int serial);//삭제하고자 하는 폴더안에 게시글이 있는지 확인
	int deleteFolder(int serial);//없을 경우 삭제
	//update
	int updateFolder(MiniHPPictureFolderVO vo);
	
	
	// 게시판 관련--------------------------
	//맨 첫번째 폴더 가져오기
	int getFirstFolderSerial(int userSerial);
	List<MiniHpPictureVO> getAll(@Param("folderSerial") int folderSerial,@Param("offset") int offset,@Param("size") int size);
	String getFolderName(int folderSerial);
	//게시물 insert
	int insert(MiniHpPictureVO vo);
	//게시글 폴더 이동
	int updatePictureFolder(@Param("pictureSerial") int pictureSerial,@Param("folderSerial")  int folderSerial);
	//delete
	int delete(int serial);
	//update
	MiniHpPictureVO get(int serial);
	int update(MiniHpPictureVO vo);
	
	//댓글
	//selectAll
	int getReplyCnt(int pictureSerial);
	List<MiniHpPictureReplyVO> getAllReply(int pictureSerial);
	//insert
	int insertReply(MiniHpPictureReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(@Param("serial") int serial, @Param("content") String content);
}
