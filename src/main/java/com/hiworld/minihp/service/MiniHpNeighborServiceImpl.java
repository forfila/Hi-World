package com.hiworld.minihp.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpNeighborDAO;
import com.hiworld.minihp.dao.MiniHpNeighborListDAO;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;

@Service
public class MiniHpNeighborServiceImpl implements MiniHpNeighborService {

	@Autowired
	private MiniHpNeighborListDAO neighborListDAO;
	
	@Autowired
	private MiniHpNeighborDAO neighborDAO;
	
	MiniHpNeighborListVO neighborListVO;
	
	MiniHpNeighborVO neighborVO;
	
	MiniHpNeighborViewVO neighborViewVO;

	
	/*이웃 신청 결과 처리*/
	@Override
	public void registerCheck_ok(int type, MiniHpNeighborVO nVO) {

		int senderSerial = nVO.getNeighborSerial1();
		int receiverSerial = nVO.getNeighborSerial2();
		System.out.println(senderSerial);
		System.out.println(receiverSerial);
		switch(type) {
		case 0: //이웃 신청 거절
			neighborListDAO.deleteNeighborList(senderSerial, receiverSerial);
			break;
			
		case 1: //이웃 신청 수락
			neighborVO = neighborDAO.checkNeighbor(senderSerial, receiverSerial);
			if(neighborVO == null) {
				neighborDAO.insertNeighbor(nVO);
			}
			neighborListDAO.deleteNeighborList(senderSerial, receiverSerial);
			break;
		
		case 2: //이웃 신청 보류
			
			break;
		}
	}
	
	/*이웃명 수정 신청 결과 처리*/
	@Override
	public void updateCheck_ok(int type, MiniHpNeighborVO nVO) {
		// TODO Auto-generated method stub
		int senderSerial = nVO.getNeighborSerial1();
		int receiverSerial = nVO.getNeighborSerial2();
		String senderValue = nVO.getNeighborValue1();
		String receiverValue = nVO.getNeighborValue2();
		
		switch(type) {
		case 0: //이웃 신청 거절
			neighborListDAO.deleteNeighborList(senderSerial, receiverSerial);
			break;
			
		case 1: //이웃 신청 수락
			neighborVO = neighborDAO.checkNeighbor(senderSerial, receiverSerial);
			if(neighborVO.getNeighborSerial1() == senderSerial) {
				neighborDAO.updateNeighbor(senderSerial, senderValue, receiverSerial, receiverValue);
			} else {
				neighborDAO.updateNeighbor(receiverSerial, receiverValue, senderSerial, senderValue);
			}
			neighborListDAO.deleteNeighborList(senderSerial, receiverSerial);
			break;
		
		case 2: //이웃 신청 보류
			
			break;
		}
	}
	
	/*이웃 목록 불러오기*/
	@SuppressWarnings("null")
	@Override
	public List<MiniHpNeighborViewVO> getNeighborList(int userSerial) {
		
		List<MiniHpNeighborVO> neighborList = neighborDAO.getNeighborList(userSerial);
		Iterator<MiniHpNeighborVO> lit = neighborList.iterator();
		List<MiniHpNeighborViewVO> neighborViewList = new ArrayList<MiniHpNeighborViewVO>();
		/*System.out.println(neighborList);*/
		if(neighborList.size() == 0) {
			return null;
		} else {	
			while(lit.hasNext()) {
				neighborVO = lit.next();
				neighborViewVO = new MiniHpNeighborViewVO();
				if(neighborVO.getNeighborSerial1() == userSerial) {
					neighborViewVO.setUserSerial(neighborVO.getNeighborSerial1());
					neighborViewVO.setUserName(neighborVO.getNeighborName1());
					neighborViewVO.setUserValue(neighborVO.getNeighborValue1());
					neighborViewVO.setNeighborSerial(neighborVO.getNeighborSerial2());
					neighborViewVO.setNeighborName(neighborVO.getNeighborName2());
					neighborViewVO.setNeighborValue(neighborVO.getNeighborValue2());
				} else {
					neighborViewVO.setUserSerial(neighborVO.getNeighborSerial2());
					neighborViewVO.setUserName(neighborVO.getNeighborName2());
					neighborViewVO.setUserValue(neighborVO.getNeighborValue2());
					neighborViewVO.setNeighborSerial(neighborVO.getNeighborSerial1());
					neighborViewVO.setNeighborName(neighborVO.getNeighborName1());
					neighborViewVO.setNeighborValue(neighborVO.getNeighborValue1());
				}
				neighborViewList.add(neighborViewVO);
			}	
			return neighborViewList;
		}
	}
	
	/*이웃 정보 불러오기*/
	@Override
	public MiniHpNeighborViewVO getNeighborList(int userSerial, int neighborSerial) {
		neighborVO = neighborDAO.getNeighborListInfo(userSerial, neighborSerial);
		neighborViewVO = new MiniHpNeighborViewVO();
		if(neighborVO.getNeighborSerial1() == userSerial) {
			neighborViewVO.setUserSerial(neighborVO.getNeighborSerial1());
			neighborViewVO.setUserName(neighborVO.getNeighborName1());
			neighborViewVO.setUserValue(neighborVO.getNeighborValue1());
			neighborViewVO.setNeighborSerial(neighborVO.getNeighborSerial2());
			neighborViewVO.setNeighborName(neighborVO.getNeighborName2());
			neighborViewVO.setNeighborValue(neighborVO.getNeighborValue2());
		} else {
			neighborViewVO.setUserSerial(neighborVO.getNeighborSerial2());
			neighborViewVO.setUserName(neighborVO.getNeighborName2());
			neighborViewVO.setUserValue(neighborVO.getNeighborValue2());
			neighborViewVO.setNeighborSerial(neighborVO.getNeighborSerial1());
			neighborViewVO.setNeighborName(neighborVO.getNeighborName1());
			neighborViewVO.setNeighborValue(neighborVO.getNeighborValue1());
		}
		
		return neighborViewVO;
	}
	/*이웃 끊기*/
	@Override
	public void deleteNeighbor(int userSerial, int neighborSerial) {	
		neighborDAO.deleteNeighbor(userSerial, neighborSerial);	
	}

}
