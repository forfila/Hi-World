package com.hiworld.minihp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hiworld.minihp.vo.MiniHPVideoFolderVO;
import com.hiworld.minihp.vo.MiniHpVideoReplyVO;
import com.hiworld.minihp.vo.MiniHpVideoVO;

public interface MiniHpVideoService {
	int getFolderScope(int folderSerial);
	int scrapeVideo(int videoSerial,int folderSerial,HttpServletRequest request);
	
	//폴더 관련-------
	List<MiniHPVideoFolderVO> getAllFolder(int userSerial);
	int addFolder(MiniHPVideoFolderVO vo);
	int deleteFolder(int serial);
	int updateFolder(MiniHPVideoFolderVO vo);
	
	//게시판 관련---------------
	int getFirstFolderSerial(int userSerial);
	List<MiniHpVideoVO> getAll(Integer folderSerial, int page, int pageSize);
	String getFolderName(int folderSerial);
	//페이징처리
	int countInsideFolder(int serial);
	
	int insert(MiniHpVideoVO vo);
	
	//게시글 폴더 이동
	int updateVideoFolder(int videoSerial, int folderSerial);
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
	int updateReply(int serial, String content);
	
}
