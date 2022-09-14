package com.hiworld.minihp.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpRightDAO;
import com.hiworld.minihp.vo.CntTodayVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;
import com.hiworld.minihp.vo.MiniHpLatestPostsVO;
import com.hiworld.minihp.vo.MiniHpNeiWordVO;
import com.hiworld.minihp.vo.MiniHpPictureVO;
import com.hiworld.minihp.vo.MiniHpVideoVO;
@Service
public class MiniHpRightServiceImpl implements MiniHpRightService {

	@Autowired
	private MiniHpRightDAO dao;
	
	@Override
	public List<MiniHpLatestPostsVO> getLatestPosts(int userSerial) {
		// 1. 게시판, 사진첩, 동영상에서 최신 게시물 5개씩 가져옴
		List<MiniHpBoardVO> boardList = dao.getBoardList(userSerial);
		List<MiniHpPictureVO> pictureList = dao.getPictureList(userSerial);
		List<MiniHpVideoVO> videoList = dao.getVideoList(userSerial);
		
		// 2. 가져온 게시물들을 하나의 테이블에 담음
		List<MiniHpLatestPostsVO> latestPosts = new ArrayList<>();
		for(MiniHpBoardVO vo : boardList)
			latestPosts.add(new MiniHpLatestPostsVO(vo));
		for(MiniHpPictureVO vo : pictureList)
			latestPosts.add(new MiniHpLatestPostsVO(vo));
		for(MiniHpVideoVO vo : videoList)
			latestPosts.add(new MiniHpLatestPostsVO(vo));
		
		//게시글이 하나도 없을 경우 null 반환
		if(latestPosts.size()==0)
			return null;
		
		// 3. 날짜순으로 정렬
		Collections.sort(latestPosts, new Comparator<MiniHpLatestPostsVO>() {
			@Override
			public int compare(MiniHpLatestPostsVO o1, MiniHpLatestPostsVO o2) {
				return o1.getcDate().compareTo(o2.getcDate());
			}
		});
		Collections.reverse(latestPosts);
		
		// 4. 최신 5개만 담아서 반환
		if(latestPosts.size()>5)
			return latestPosts.subList(0, 5);
		else
			return latestPosts;
	}

	@Override
	public CntTodayVO countToday(int userSerial) {
		return dao.countToday(userSerial);
	}
	
	@Override
	public List<MiniHpNeiWordVO> getAll(int userSerial) {
		return dao.getAll(userSerial);
	}
	@Override
	public int insert(MiniHpNeiWordVO vo) {
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
	public int random(int userSerial) {
		List<Integer> userList = dao.random(userSerial);
		int ranIdx = (int)(Math.random()*userList.size());
		return userList.get(ranIdx);
	}
}
