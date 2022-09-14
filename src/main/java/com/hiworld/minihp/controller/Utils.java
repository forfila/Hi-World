package com.hiworld.minihp.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.hiworld.client.vo.sessionVO;

public class Utils {
	//세션에서 현재 유저 정보 가져오기 메소드
	public static int getSessionUser(HttpSession session) {
		//세션에서 현재 유저 가져오기
		sessionVO sessionUser = (sessionVO)session.getAttribute("sessionVO"); 
		int userSerial = sessionUser.getUserSerial();
//		//임시로 7로 지정
//		int userSerial = 7;
		return userSerial;
	}
	
	// 파일명 중복방지 처리
	public static String getUuidFileName(String originalFileName) {
    	 return UUID.randomUUID().toString() + "_" + originalFileName;
    }
	
    //파일 저장 로직
	public static void saveFile(MultipartFile file1,String fileName, HttpServletRequest request) {
  		//업로드된 파일을 서버에 저장
  		ServletContext ctx = request.getServletContext();//파일 경로 얻기 위한 객체
  		String webPath = "/resources/upload";//웹상의 위치
  		String realPath = ctx.getRealPath(webPath);//실제 위치
  		
  		//우선 해당 경로까지의 폴더가 있는지 체크, 없으면 만들어줌
  		File savePath = new File(realPath);
  		if(!savePath.exists())
  			savePath.mkdirs();//s가 붙으면 mkdir -p 같은 효과
  		//경로와 파일명 사이에 구분자가 필요,File.separator가 os마다 맞는 구분자를 넣어줌
  		realPath += File.separator + fileName;
  		//파일위치, 파일명 출력
  		System.out.println("realPath: " + realPath);
  		File saveFile = new File(realPath);

  		//업로드된 파일을 서버 저장소에 저장하는 방법
  		try {
  			file1.transferTo(saveFile);
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  	}
	
  	//파일 삭제 로직
	public static void deleteFile(String fileName,HttpServletRequest request) {
  		String savePath = request.getRealPath("/resources/upload/");
  	    
  		File file = new File(savePath+fileName);
  		if(file.exists()){
  			file.delete();
  			System.out.println("파일 삭제됨");
  		}else{
  			System.out.println("파일 없음");
  		}
  	}
}
