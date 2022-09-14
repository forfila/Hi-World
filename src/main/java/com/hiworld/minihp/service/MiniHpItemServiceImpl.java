package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpItemDAO;
import com.hiworld.minihp.vo.MiniHpMusicVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;

@Service
public class MiniHpItemServiceImpl implements MiniHpItemService {

	@Autowired
	private MiniHpItemDAO itemDAO;
	
	MiniHpSelectedItemVO itemListVO;
	
	MiniHpMusicVO musicVO;
	
	/*적용중인 아이템 목록 가져오기*/
	@Override
	public MiniHpSelectedItemVO getItemList(int userSerial) {
		itemListVO = new MiniHpSelectedItemVO();
		itemListVO = itemDAO.getItemList(userSerial);
		
		return itemListVO;
	}
	
	/*미니미 목록 가져오기*/
	@Override
	public List<MiniHpUserItemVO> getMinimiList(int userSerial) {
		String type = "캐릭터";
		List<MiniHpUserItemVO> minimiList = itemDAO.getMinimiList(userSerial, type);
		
		return minimiList;
	}
	
	/*스토리룸 목록 가져오기*/
	@Override
	public List<MiniHpUserItemVO> getStoryRoomList(int userSerial) {
		String type = "배경";
		List<MiniHpUserItemVO> storyroomList = itemDAO.getStoryRoomList(userSerial, type);
		
		return storyroomList;
	}
	
	/*마우스 커서 커스텀 목록 가져오기*/
	@Override
	public List<MiniHpUserItemVO> getMouseList(int userSerial) {
		String type = "마우스";
		List<MiniHpUserItemVO> mouseList = itemDAO.getMouseList(userSerial, type);
		
		return mouseList;
	}
	
	/*노래 재생목록 가져오기*/
	@Override
	public List<MiniHpMusicVO> getPlayList(int userSerial) {
		List<MiniHpMusicVO> playList = itemDAO.getPlayList(userSerial);
		
		return playList;
	}
	
	/*사용중이지 않는 노래 목록*/
	@Override
	public List<MiniHpMusicVO> getNotUsingSongList(int userSerial) {
		List<MiniHpMusicVO> notUsingSong = itemDAO.getNotUsingSongList(userSerial);
		
		return notUsingSong;
	}
	
	@Override
	public void updateStoryRoom(int userSerial, String storyRoom) {
		itemDAO.updateStoryRoom(userSerial, storyRoom);
	}

	@Override
	public void updateMinimi(int userSerial, String minimi, String minimiX, String minimiY) {
		itemDAO.updateMinimi(userSerial, minimi, minimiX, minimiY);	
	}

	@Override
	public void updateMousePointer(int userSerial, String mousePointer) {
		itemDAO.updateMousePointer(userSerial, mousePointer);	
	}

	@Override
	public void setPlayList(int userSerial, String[] playList, String[] nonPlayList) {
		String songTitle = "";
		if(!playList[0].equals("")) {
			for(int i=0; i<playList.length; i++) {
				System.out.println(playList[i]);
				songTitle = itemDAO.getMusicTitle(userSerial, playList[i]);
				if(songTitle == null) {
					musicVO = new MiniHpMusicVO();
					musicVO.setUserSerial(userSerial);
					musicVO.setMusicTitle(playList[i]);
					musicVO.setMusicSrc(itemDAO.getMusicSrc(userSerial, playList[i]));
					System.out.println(musicVO.getMusicSrc());
					itemDAO.addToPlayList(musicVO);
				}
			}
		}
		if(!nonPlayList[0].equals("")) {
			for(int i=0; i<nonPlayList.length; i++) {
				System.out.println(nonPlayList[i]);
				itemDAO.removeFromPlayList(userSerial, nonPlayList[i]);
			}
		}
	}	
	
	@Override
	public List<String> getAllSkin(int userSerial) {
		return itemDAO.getAllSkin(userSerial);
	}
	@Override
	public String getUsingSkin(int userSerial) {
		return itemDAO.getUsingSkin(userSerial);
	}
	@Override
	public int updateSkin(int userSerial, String src) {
		return itemDAO.updateSkin(userSerial, src);
	}
}
