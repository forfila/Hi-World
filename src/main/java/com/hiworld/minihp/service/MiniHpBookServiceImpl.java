package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.minihp.dao.MiniHpBookDAO;
import com.hiworld.minihp.vo.MiniHpBookReplyVO;
import com.hiworld.minihp.vo.MiniHpBookVO;
@Service
public class MiniHpBookServiceImpl implements MiniHpBookService {
	
	@Autowired
	private MiniHpBookDAO dao;
	
	
	@Override
	@Transactional
	public List<MiniHpBookVO> getAll(int userSerial, int page, int pageSize) {
		//페이징
		int offset = 0+(page-1)*pageSize;//1페이지일 경우 1~5, 2페이지일 경우 2~10... 이런식으로 게시글 가져옴
		
		List<MiniHpBookVO> list = dao.getAll(userSerial,offset, pageSize);
		if(list==null || list.size()==0)
			return null;
		else
			return list;
	}
	@Override
	public String getMiniMe(int userSerial) {
		return dao.getMiniMe(userSerial);
	}
	@Override
	public int countAll(int userSerial) {
		return dao.countAll(userSerial);
	}

	@Override
	public int insert(MiniHpBookVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(int serial) {
		return dao.delete(serial);
	}

	@Override
	public int update(int serial, String content) {
		return dao.update(serial, content);
	}
	
	@Override
	public int changeSecret(int serial,int isSecret) {
		return dao.changeSecret(serial,isSecret);
	}
	
//	@Override
//	public int getReplyCnt(int videoSerial) {
//		return dao.getReplyCnt(videoSerial);
//	}
	@Override
	public List<MiniHpBookReplyVO> getAllReply(int bookSerial) {
		return dao.getAllReply(bookSerial);
	}
	@Override
	public int insertReply(MiniHpBookReplyVO vo) {
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
