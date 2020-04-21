package util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

 
public class KakaoAPI {
	private static String clientId = "de621075efa65c9dc9ec223e759b1e6d";
	private static String redirectUri = "http://localhost:8080/zSpringProject/user/kakaoLoginForm";
	
	public static String getApiUrl() {
		String apiUrl = "https://kauth.kakao.com/oauth/authorize?client_id=" + clientId +"&redirect_uri=" + redirectUri +"&response_type=code";
		
		return apiUrl; 
	}
	
    public String getAccessToken (String authorize_code) {
	    String access_Token = "";
	    String refresh_Token = "";
	    String reqURL = "https://kauth.kakao.com/oauth/token";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        
	        //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=" + clientId);
	        sb.append("&redirect_uri=" + redirectUri);
	        sb.append("&code=" + authorize_code);
	        bw.write(sb.toString());
	        bw.flush();
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        if(responseCode == 400){
	        	
	        	return "error";
	        }
	 
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        access_Token = element.getAsJsonObject().get("access_token").getAsString();
	        refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	        
	        System.out.println("access_token : " + access_Token);
	        System.out.println("refresh_token : " + refresh_Token);
	        
	        br.close();
	        bw.close();
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } 
	    
	    return access_Token;
	}
    
    public HashMap<String, String> getUserInfo (String access_Token) {
        HashMap<String, String> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
//          nickname 한글이 깨져서 utf-8을 넣어봄
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String userName = properties.getAsJsonObject().get("nickname").getAsString();
            userInfo.put("userName", userName);
            String userId = kakao_account.getAsJsonObject().get("email").getAsString();
            userInfo.put("userId", userId);
            
        } catch (NullPointerException e) {
			e.printStackTrace();
			System.out.println("-카카오 이메일 선택적 동의 거부-");
			userInfo.put("userId", "emailerror");
			return userInfo;
			
		} catch (IOException e) {
            e.printStackTrace();
        }
        
        return userInfo;
    }
    
    // 카카오 연결 끊기
    public int kakaoLogout(String access_Token) {
        String reqURL = "https://kapi.kakao.com/v1/user/unlink";
        int responseCode = 0;
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String result = "";
            String line = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return responseCode;
    }
}
