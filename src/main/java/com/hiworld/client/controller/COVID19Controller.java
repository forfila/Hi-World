package com.hiworld.client.controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import java.io.BufferedReader;

@Controller
public class COVID19Controller {
	
	public static int INDENT_FACTOR = 4;
	
	
	@GetMapping("/covid19.do")
	@ResponseBody
	public String covid19() throws Exception {
		/* 오늘 날짜 가져오기 */
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        Date day = new Date();
        
        String today = format.format(day);
        
        
        int hours = day.getHours();
				
        System.out.println(hours);
		if(hours<12) {
			// 오전 5시이전은 어제 날짜로 잡혀야함
			day.setDate(day.getDate()-1);
			today = format.format(day);
		}
        
        
        /* 어제 날짜 가져오기 */
        day.setDate(day.getDate()-1);
        String yesterday = format.format(day);
		
		StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=VnbK%2FXlPOfVybOeQsORLUuM0%2FsFZnarpLmP75wVkDQ8Hmiabt7WMAaQ276L8IUxGg92NdZJ%2BgMOsxIN7kZqELw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(yesterday, "UTF-8")); /*검색할 생성일 범위의 시작*/
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8")); /*검색할 생성일 범위의 종료*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        int first = 0;
        int last = 0;
        
//        System.out.println(today);
//        System.out.println(yesterday);
//      현재 완치자
        String totalClear = sb.toString();
        first = totalClear.indexOf("<clearCnt>")+10;
        last = totalClear.indexOf("</clearCnt>");
        totalClear = totalClear.substring(first,last); 
        System.out.println(totalClear);
        
//      어제 완치자
        String yesterDayClear = sb.toString();
        System.out.println(today);
        System.out.println(yesterday);
        System.out.println(yesterDayClear.indexOf(today));
        System.out.println(yesterDayClear.indexOf(yesterday));
        yesterDayClear = yesterDayClear.substring(yesterDayClear.indexOf(today),yesterDayClear.indexOf(yesterday));
        first = yesterDayClear.indexOf("<clearCnt>")+10;
        last = yesterDayClear.indexOf("</clearCnt>");
        yesterDayClear = yesterDayClear.substring(first,last);
        
//      전체 확진자  
        String totalCovid = sb.toString();
        first = totalCovid.indexOf("<decideCnt>")+11;
        last = totalCovid.indexOf("</decideCnt>");
        totalCovid = totalCovid.substring(first, last);
//        System.out.println(totalCovid);
        
//      어제 확진자
        String yesterDayCovid = sb.toString();
        yesterDayCovid = yesterDayCovid.substring(yesterDayCovid.indexOf(today),yesterDayCovid.indexOf(yesterday));
        first = yesterDayCovid.indexOf("<decideCnt>")+11;
        last = yesterDayCovid.indexOf("</decideCnt>");
        yesterDayCovid = yesterDayCovid.substring(first, last);
//        System.out.println(yesterDayCovid);
        
//      오늘 확진자 수  오늘 완치자 수
        String todayCovid = String.valueOf(Integer.parseInt(totalCovid)-Integer.parseInt(yesterDayCovid));
        String todayClear = String.valueOf(Integer.parseInt(totalClear)-Integer.parseInt(yesterDayClear));
//        System.out.println(todayCovid);
        
        
        ArrayList<String> Covid19 = new ArrayList<String>();
        Covid19.add(totalCovid);
        Covid19.add(todayCovid);
        Covid19.add(totalClear);
        Covid19.add(todayClear);
        
        
        Gson gson = new Gson();
        return gson.toJson(Covid19);
	}
	
}

