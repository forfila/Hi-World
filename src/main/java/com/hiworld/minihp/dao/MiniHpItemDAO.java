package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpMusicVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;

@Repository
public interface MiniHpItemDAO {
	
	/*적용중인 아이템 목록 가져오기*/
	MiniHpSelectedItemVO getItemList(int userSerial);
	
	/*미니미 목록 가져오기*/
	List<MiniHpUserItemVO> getMinimiList(@Param("UserSerial")int userSerial, @Param("type")String type);
	
	/*스토리룸 목록 가져오기*/
	List<MiniHpUserItemVO> getStoryRoomList(@Param("UserSerial")int userSerial, @Param("type")String type);
	
	/*마우스 커서 커스텀 목록 가져오기*/
	List<MiniHpUserItemVO> getMouseList(@Param("UserSerial")int userSerial, @Param("type")String type);
	
	/*노래 재생목록 가져오기*/
	List<MiniHpMusicVO> getPlayList(int userSerial);
	
	/*사용중이지 않는 노래 목록*/
	List<MiniHpMusicVO> getNotUsingSongList(int userSerial);
	
	/*스토리룸 수정*/
	void updateStoryRoom(@Param("UserSerial")int userSerial, @Param("storyRoom")String storyRoom);
	
	/*미니미 수정*/
	void updateMinimi(@Param("UserSerial")int userSerial, @Param("minimi")String minimi, @Param("minimiX")String minimiX,  @Param("minimiY")String minimiX2);
	
	/*마우스 커서 커스텀*/ 
	void updateMousePointer(@Param("UserSerial")int userSerial, @Param("mousePointer")String mousePointer);
	

	/*가지고 있는 스킨 가져오기*/
	List<String> getAllSkin(int userSerial);
	/*사용중인 스킨 가져오기*/
	String getUsingSkin(int userSerial);
	/*사용중인 스킨 변경*/
	int updateSkin(@Param("userSerial") int userSerial, @Param("src") String src);

	/*노래 제목으로 노래 src 가져오기*/
	String getMusicSrc(@Param("userSerial")int userSerial, @Param("musicTitle")String musicTitle);
	
	/*재생목록에 노래 있는지 확인*/
	String getMusicTitle(@Param("userSerial")int userSerial, @Param("musicTitle")String musicTitle);
	
	/*재생목록에 노래 추가하기*/
	void addToPlayList(MiniHpMusicVO musicVO);
	
	/*재생목록에서 노래 제거하기*/
	void removeFromPlayList(@Param("userSerial")int userSerial, @Param("musicTitle")String musicTitle);

	
			
	

}
