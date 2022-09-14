package com.hiworld.minihp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hiworld.minihp.vo.MiniHPPictureFolderVO;
import com.hiworld.minihp.vo.MiniHpPictureReplyVO;
import com.hiworld.minihp.vo.MiniHpPictureVO;

public interface MiniHpPictureService {
	int getFolderScope(int folderSerial);
	int scrapePicture(int pictureSerial,int folderSerial,HttpServletRequest request);
	
	//폴더 관련-------
	List<MiniHPPictureFolderVO> getAllFolder(int userSerial);
	int addFolder(MiniHPPictureFolderVO vo);
	int deleteFolder(int serial);
	int updateFolder(MiniHPPictureFolderVO vo);
	
	//게시판 관련---------------
	int getFirstFolderSerial(int userSerial);
	List<MiniHpPictureVO> getAll(Integer folderSerial, int page, int pageSize);
	String getFolderName(int folderSerial);
	//페이징처리
	int countInsideFolder(int serial);
	
	int insert(MiniHpPictureVO vo);
	
	//게시글 폴더 이동
	int updatePictureFolder(int pictureSerial, int folderSerial);
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
	int updateReply(int serial, String content);
	
}
