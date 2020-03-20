package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	boolean userIdCheck;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		userIdCheck = false;
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		if(userId != null){
			
			userIdCheck = true;
			request.setAttribute("userIdCheck", userIdCheck);
			request.setAttribute("userName", session.getAttribute("userName")); 
		}else{
			request.setAttribute("userIdCheck", userIdCheck);
		}
	}
	
	@RequestMapping(value = "chatForm", method = RequestMethod.GET)
	public String list(HttpServletRequest request) throws IOException {
		System.out.println("============"+userIdCheck);
		if(userIdCheck){
			System.out.println("[ChartController] " + request.getAttribute("userName"));
			return "chat/chatForm";
		}else{
			return "user/loginForm";
		}
	}
	
}
