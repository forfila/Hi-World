package com.hiworld.client.controller;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20{

	/* Api20을 통해서 네이버 로그인을 할때 토큰값하고 네아를 사용하기위한 url주소 호출할때 사용 됨 */
	protected NaverLoginApi(){
	}
	private static class InstanceHolder{
	private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}
	public static NaverLoginApi instance(){
	return InstanceHolder.INSTANCE;
	}
	/* oauth2.0이란 각종 웹, 모바일 어플리케이션에서 타사의 API를 사용하고 싶을때 권한 획득을 위한 프로토콜임 */
	@Override
	public String getAccessTokenEndpoint() {
	return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}
	@Override
	protected String getAuthorizationBaseUrl() {
	return "https://nid.naver.com/oauth2.0/authorize";
	}

	
}
