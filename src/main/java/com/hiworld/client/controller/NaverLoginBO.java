package com.hiworld.client.controller;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {

	/* client_id: 네이버 애플리케이션 등록 후 발급받은 ID 값 */
	private final static String CLIENT_ID = "VBRcDSvmTwE9_oyQ5KnY";
	/* client secret : 네이버 애플리케이션 등록 후 발급받은 secret 값 */
	private final static String CLIENT_SECRET = "zldNDsMNlE";
	/* redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다. */
	private final static String REDIRECT_URI = "http://ec2-3-36-174-35.ap-northeast-2.compute.amazonaws.com:8080/callback";
	/* state: 애플리케이션이 생성한 상태 토큰 */
	private final static String SESSION_STATE = "oauth_state";
	/* 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	
	
	/* 네이버 아이디 인증 URL 생성 Method */
	public String getAuthorizationUrl(HttpSession session) {
		
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		
		/* 생성한 난수 값을 session에 저장 */
		/* 로그아웃시 이 세션값을 없애면 네이버로그인 다시 해야함 안없애고 나두면 한번 로그인 후 그냥 네이버로그인 클릭만 해도 됨 */
		setSession(session, state);
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				/* 앞에 생성한 난수값을 네아 인증 URL기능을 하게 만듬 아래 두개가 */
				.callback(REDIRECT_URI).state(state) 
				.build(NaverLoginApi.instance());
		/* 이제 만들어둔 URL을 리턴함 */
		return oauthService.getAuthorizationUrl();
	}

	/* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		
		if (StringUtils.pathEquals(sessionState, state)) {
			
			OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());
			
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}

	
	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	
	/* http session에 데이터 저장 */
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	/* http session에서 데이터 가져오기 */
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}

	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
		
		/* 네이버 로그인 API에 접근 */
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).build(NaverLoginApi.instance());
		
		/* 토큰값을 이용해서 해당 사용자의 정보를 가져옴 */
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		
		/* response_type: 인증 과정에 대한 구분값. code로 값이 고정 */
		Response response = request.send();
		/* Body에 해당 사용자의 정보가 담겨져 있음 */
		return response.getBody();
	}
}
