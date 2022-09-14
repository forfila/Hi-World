package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpMusicVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;

public interface MiniHpItemService {
	
	/*적용중인 아이템 목록 가져오기*/
	MiniHpSelectedItemVO getItemList(int userSerial);
	
	/*보유중인 미니미 목록 가져오기*/
	List<MiniHpUserItemVO> getMinimiList(int userSerial);
	
	/*보유중인 스토리룸 목록 가져오기*/
	List<MiniHpUserItemVO> getStoryRoomList(int userSerial);
	
	/*보유중인 마우스 커서 커스텀 가져오기*/
	List<MiniHpUserItemVO> getMouseList(int userSerial);
	
	/*재생목록에 적용중인 노래 목록 가져오기*/
	List<MiniHpMusicVO> getPlayList(int userSerial);
	
	/*사용중이지 않는 노래 목록*/
	List<MiniHpMusicVO> getNotUsingSongList(int userSerial);
	
	/*스토리룸 수정*/
	void updateStoryRoom(int userSerial, String storyRoom);
	
	/*미니미 수정*/
	void updateMinimi(int userSerial, String minimi, String minimiX, String minimiY);
	
	/*마우스 커서 커스텀 수정*/
	void updateMousePointer(int userSerial, String mousePointer);


	/*가지고 있는 스킨 가져오기*/
	List<String> getAllSkin(int userSerial);
	/*사용중인 스킨 가져오기*/
	String getUsingSkin(int userSerial);
	/*사용중인 스킨 변경*/
	int updateSkin(int userSerial,String src);

	
	/*미니홈피 배경음악 재생목록 설정하기*/
	void setPlayList(int userSerial, String[] playList, String[] nonPlayList);


}
