package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hiworld.minihp.vo.CntTodayVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;
import com.hiworld.minihp.vo.MiniHpNeiWordVO;
import com.hiworld.minihp.vo.MiniHpPictureVO;
import com.hiworld.minihp.vo.MiniHpVideoVO;

public interface MiniHpRightDAO {
	//게시판,사진첩,동영상에서 최신꺼 5개씩 가져옴
	List<MiniHpBoardVO> getBoardList(int userSerial);
	List<MiniHpPictureVO> getPictureList(int userSerial);
	List<MiniHpVideoVO> getVideoList(int userSerial);
	
	//게시판,사진첩,동영상,방명록 오늘 올린 갯수/총 갯수
	CntTodayVO countToday(int userSerial);
	
	//이웃평 CRUD
	List<MiniHpNeiWordVO> getAll(int userSerial);
	int insert(MiniHpNeiWordVO vo);
	int delete(int serial);
	int update(@Param("serial") int serial,@Param("content") String content);
	
	//랜덤미니홈피
	List<Integer> random(int userSerial);
}
