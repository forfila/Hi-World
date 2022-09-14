package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.CntTodayVO;
import com.hiworld.minihp.vo.MiniHpLatestPostsVO;
import com.hiworld.minihp.vo.MiniHpNeiWordVO;

public interface MiniHpRightService {
	List<MiniHpLatestPostsVO> getLatestPosts(int userSerial);
	
	CntTodayVO countToday(int userSerial);
	
	List<MiniHpNeiWordVO> getAll(int userSerial);
	int insert(MiniHpNeiWordVO vo);
	int delete(int serial);
	int update(int serial, String content);
	
	int random(int userSerial);
}
