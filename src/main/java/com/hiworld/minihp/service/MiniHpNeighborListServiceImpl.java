package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpNeighborListDAO;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;

@Service
public class MiniHpNeighborListServiceImpl implements MiniHpNeighborListService {

	@Autowired
	private MiniHpNeighborListDAO neighborListDAO;
	
	MiniHpNeighborListVO neighborListVO;
	
	MiniHpNeighborVO neighborVO;
	
	/*이웃 신청 정보 테이블에 저장*/
	@Override
	public void insertNeighborList(MiniHpNeighborListVO neighborListVO) {
		neighborListDAO.insertNeighborList(neighborListVO);
	}
	
	/*이웃 신청 목록 불러오기*/
	@Override
	public List<MiniHpNeighborListVO> getRegisterList(int userSerial) {
		
		List<MiniHpNeighborListVO> list = neighborListDAO.getRegisterList(userSerial);
		
		if(list.size() == 0) {
			list = null;
		}
		
		/*System.out.println(list);*/
		
		return list;
	}
	
	/*이웃 신청 정보 불러오기*/
	@Override
	public MiniHpNeighborListVO getRegisterCheck(int senderSerial, int receiverSerial) {
		
		neighborListVO = neighborListDAO.getData(senderSerial, receiverSerial);
		
		return neighborListVO;
	}
	
	/*이웃 신청 여부 확인*/
	@Override
	public int neighborListCheck(int userSerial, int neighborSerial) {
		int result = 0;
		int check = neighborListDAO.listCheck(userSerial, neighborSerial);
		
		if(check == 0) {
			result = 0;
		} else {
			result = 1;
		}
		return result;
	}
}
