package com.hiworld.minihp.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.controller.Utils;
import com.hiworld.minihp.dao.MiniHpPictureDAO;
import com.hiworld.minihp.vo.MiniHPPictureFolderVO;
import com.hiworld.minihp.vo.MiniHpPictureReplyVO;
import com.hiworld.minihp.vo.MiniHpPictureVO;
@Service
public class MiniHpPictureServiceImpl implements MiniHpPictureService {
	
	@Autowired
	private MiniHpPictureDAO dao;
	
	@Override
	public int getFolderScope(int folderSerial) {
		return dao.getFolderScope(folderSerial);
	}
	@Override
	public int scrapePicture(int pictureSerial, int folderSerial,HttpServletRequest request) {
		// 1. 스크랩할 데이터 가져오기
		MiniHpPictureVO oriVO = dao.get(pictureSerial);
		
		// 2. 파일 복사
		MiniHpPictureVO newVO = new MiniHpPictureVO();
		
		//기존 파일
		String oriFileName = oriVO.getFile();
		if(oriFileName!=null) {
			String savePath = request.getRealPath("/resources/upload/");
	  		//파일 이름 변경
	  		String cutFileName = oriFileName.substring(oriFileName.lastIndexOf("_")+1);
	  		String newFileName = Utils.getUuidFileName(cutFileName);
	  		//파일 저장
	  		//파일객체생성
	        File oriFile = new File(savePath+oriFileName);
	        //복사파일객체생성
	        File copyFile = new File(savePath+newFileName);
	        
	        try {
	            
	            FileInputStream fis = new FileInputStream(oriFile); //읽을파일
	            FileOutputStream fos = new FileOutputStream(copyFile); //복사할파일
	            
	            int fileByte = 0; 
	            // fis.read()가 -1 이면 파일을 다 읽은것
	            while((fileByte = fis.read()) != -1) {
	                fos.write(fileByte);
	            }
	            //자원사용종료
	            fis.close();
	            fos.close();
	            
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        newVO.setFile(newFileName);
		}
        
        // 3. 데이터 insert
        HttpSession session = request.getSession();
        sessionVO vo = (sessionVO)session.getAttribute("sessionVO");
        newVO.setUserSerial(vo.getUserSerial());
        
        newVO.setFolderSerial(folderSerial);
        newVO.setTitle("[스크랩] "+oriVO.getTitle());
        newVO.setContent(oriVO.getContent());
		
		return dao.insert(newVO);
	}
	
	//폴더 관련------------
	//폴더 selectAll
	@Override
	public List<MiniHPPictureFolderVO> getAllFolder(int userSerial) {
		return dao.getAllFolder(userSerial);
	}
	//insert
	@Override
	public int addFolder(MiniHPPictureFolderVO vo) {
		return dao.addFolder(vo);
	}
	//delete
	//폴더안에 게시글이 있는지 확인, 게시글이 하나도 없을시만 삭제 가능
	@Override
	@Transactional
	public int deleteFolder(int serial) {
		int count = dao.countInsideFolder(serial);
		if(count==0)
			return dao.deleteFolder(serial);
		else
			return 0;
	}
	//update
	@Override
	@Transactional
	public int updateFolder(MiniHPPictureFolderVO vo) {
		return dao.updateFolder(vo);
	}
	
	
	// 게시판 관련-------------
	@Override
	public int getFirstFolderSerial(int userSerial) {
		return dao.getFirstFolderSerial(userSerial);
	}
	@Override
	@Transactional
	public List<MiniHpPictureVO> getAll(Integer folderSerial, int page, int pageSize) {
		//페이징
		int offset = 0+(page-1)*pageSize;//1페이지일 경우 1~5, 2페이지일 경우 2~10... 이런식으로 게시글 가져옴
		
		List<MiniHpPictureVO> list = dao.getAll(folderSerial, offset, pageSize);
		if(list==null || list.size()==0)
			return null;
		else
			return list;
	}
	@Override
	public String getFolderName(int folderSerial) {
		return dao.getFolderName(folderSerial);
	}
	@Override
	public int countInsideFolder(int serial) {
		return dao.countInsideFolder(serial);
	}
	
	@Override
	public int insert(MiniHpPictureVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int updatePictureFolder(int pictureSerial,int folderSerial) {
		return dao.updatePictureFolder(pictureSerial, folderSerial);
	}
	@Override
	public int delete(int serial) {
		return dao.delete(serial);
	}
	@Override
	public MiniHpPictureVO get(int serial) {
		return dao.get(serial);
	}
	@Override
	public int update(MiniHpPictureVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public int getReplyCnt(int pictureSerial) {
		return dao.getReplyCnt(pictureSerial);
	}
	@Override
	public List<MiniHpPictureReplyVO> getAllReply(int pictureSerial) {
		return dao.getAllReply(pictureSerial);
	}
	@Override
	public int insertReply(MiniHpPictureReplyVO vo) {
		return dao.insertReply(vo);
	}
	@Override
	public int deleteReply(int serial) {
		return dao.deleteReply(serial);
	}
	@Override
	public int updateReply(int serial, String content) {
		return dao.updateReply(serial, content);
	}
}
