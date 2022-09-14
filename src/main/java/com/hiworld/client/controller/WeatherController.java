package com.hiworld.client.controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import java.io.BufferedReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class WeatherController {
	
	
	// 위치의 날씨 정보를 얻어오는 생성자
	public String returnWeather(String today, String kinds, String serviceKey, String nx, String ny, String baseDate, String baseTime, String type) throws Exception{
		
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("datatype", "UTF-8") + "=" + URLEncoder.encode(type, "UTF-8")); /* 타입 */
		urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜 */
		urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
		urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); // 경도
		urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); // 위도

//		System.out.println(urlBuilder);
		
		/*
		 * GET방식으로 전송해서 파라미터 받아오기
		 */
		URL url = new URL(urlBuilder.toString());
		// 어떻게 넘어가는지 확인하고 싶으면 아래 출력분 주석 해제
//		System.out.println(url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
		String result = sb.toString();
		System.out.println(result);
		
		
		return result;
	}
	
	// 초단기 실황 정보를 가져오는 생성자
	public String returnWeather2(String today, String kinds, String serviceKey, String nx, String ny) throws Exception {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	    Date day = new Date();
	    String baseTime = "";

	    day.setHours(day.getHours()-1);
	    if(day.getHours()<10) {
	    	baseTime = "0";
	    }
		String hour = String.valueOf(day.getHours());
		String baseDate = format.format(day);
		baseTime += hour+"00";
		
		
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst";
		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜 */
		urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
		urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); // 경도
		urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); // 위도

		
//		System.out.println(urlBuilder);
		/*
		 * GET방식으로 전송해서 파라미터 받아오기
		 */
		URL url = new URL(urlBuilder.toString());
		// 어떻게 넘어가는지 확인하고 싶으면 아래 출력분 주석 해제
//		System.out.println(url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
		String result = sb.toString();
//		System.out.println(result);
		
		
		return result;
		
		
	}
	
	
	// 해당 위치의 정보를 가지고 rain 정보를 리턴
	public String returnRain(String result) {
		
		int first = 0;
		int last = 0;
		
		String rain = result;
//		System.out.println(rain);
		first = rain.indexOf("POP");
		rain = rain.substring(first);
		first = rain.indexOf("<fcstValue>")+11;
		last = rain.indexOf("</fcstValue>");
		rain = rain.substring(first, last);
		
		return rain;
	}
	
	// 해당 위치의 정보를 가지고 temperature 정보를 리턴
	public String returnTemperature(String result) {
		
		int first = 0;
		int last = 0;
		
		String temperature = result;
		first = temperature.indexOf("T1H");
		temperature = temperature.substring(first);
		first = temperature.indexOf("<obsrValue>")+11;
		last = temperature.indexOf("</obsrValue>");
		temperature = temperature.substring(first,last);
		if(temperature.contains(".")) {
//			System.out.println(temperature);
			String[] cut = temperature.split("\\.");
			int check = Integer.valueOf(cut[1]);
			if(check<5) {
				temperature = cut[0];				
			}else {
				int round = Integer.valueOf(cut[0])+1;
				temperature = String.valueOf(round);
			}
		}
//		System.out.println(temperature);
		
		return temperature;
	}

	
	@GetMapping("/weather.do")
	@ResponseBody
	public String weather(HttpServletRequest request) throws Exception{
		
		// 위도, 경도
		/*
			서울 60 127 
			부산 98 76 
			대구 89 90 
			인천 54 125
			광주 58 74 
			대전 67 100 
	 		울산 102 84 
		  	수원 60 120
		 */
				
		/* 오늘 날짜 가져오기 */
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        Date day = new Date();
        
		int hours = day.getHours();
		
		String hour = "";
		
		if(hours<=5) {
			// 오전 5시이전은 어제 날짜로 잡혀야함
			day.setDate(day.getDate()-1);
			hour = "2300";
		}else if(hours>=6 && hours<=8) {
			hour = "0500";
		}else if(hours>=9 && hours<=11) {
			hour = "0800";
		}else if(hours>=12 && hours<=14) {
			hour = "1100";
		}else if(hours>=15 && hours<=17) {
			hour = "1400";
		}else if(hours>=18 && hours<=20) {
			hour = "1700";
		}else if(hours>=21 && hours<=23) {
			hour = "2000";
		}
		String today = format.format(day);
		
		System.out.println(hour);
		
		String kinds = request.getParameter("kind");
		// 홈페이지에서 받은 키
		String serviceKey = "VnbK%2FXlPOfVybOeQsORLUuM0%2FsFZnarpLmP75wVkDQ8Hmiabt7WMAaQ276L8IUxGg92NdZJ%2BgMOsxIN7kZqELw%3D%3D";
		String nx = ""; //위도
		String ny = ""; //경도
		String baseDate = today; // 조회하고 싶은 날짜 20210407
		String baseTime = hour; // 조회하고 싶은 시간 05시부터 3시간단위 05 08 11 14 17 20 23
		String type = "xml";
		
		String result = "";
		String rain = "";
		String temperature = "";
		
		ArrayList<String> Weather = new ArrayList<String>();
		
		for(int i=0; i<8; i++) {
			if(i==0) {
				//서울
				nx = "60";
				ny = "127";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				System.out.println(rain);
				System.out.println(temperature);
				Weather.add(rain);
				Weather.add(temperature);
			}else if(i==1) {
				//부산
				nx = "98";
				ny = "76";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				Weather.add(rain);
				Weather.add(temperature);
			}else if(i==2) {
				//대구
				nx = "89";
				ny = "90";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				Weather.add(rain);
				Weather.add(temperature);
			}else if(i==3) {
				//인천
				nx = "54";
				ny = "125";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				Weather.add(rain);
				Weather.add(temperature);
			}else if(i==4) {
				//광주
				nx = "58";
				ny = "74";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				Weather.add(rain);
				Weather.add(temperature);
			}else if(i==5) {
				//대전
				nx = "67";
				ny = "100";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				Weather.add(rain);
				Weather.add(temperature);
			}else if(i==6) {
				//울산
				nx = "102";
				ny = "84";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				Weather.add(rain);
				Weather.add(temperature);
			}else if(i==7) { // 수원
				nx = "60";
				ny = "120";
				result = returnWeather(today, kinds, serviceKey, nx, ny, baseDate, baseTime, type);
				rain = returnRain(result);
				result = returnWeather2(today, kinds, serviceKey, nx, ny);
				temperature = returnTemperature(result);
				Weather.add(rain);
				Weather.add(temperature);
			}
		}
			
		
		/*
		 * 항목값	항목명	단위
		 * POP	강수확률	 %
		 * PTY	강수형태	코드값
		 * R06	6시간 강수량	범주 (1 mm)
		 * REH	습도	 %
		 * S06	6시간 신적설	범주(1 cm)
		 * SKY	하늘상태	코드값
		 * T3H	3시간 기온	 ℃
		 * TMN	아침 최저기온	 ℃
		 * TMX	낮 최고기온	 ℃
		 * UUU	풍속(동서성분)	 m/s
		 * VVV	풍속(남북성분)	 m/s
		 * WAV	파고	 M
		 * VEC	풍향	 m/s
		 * WSD	풍속	1

		 */
		
		Gson gson = new Gson();
	
		
		return gson.toJson(Weather);
	}
	
}