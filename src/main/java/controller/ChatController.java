package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.WebNote;
import repository.MybatisUserDao;
import repository.MybatisWebNoteDao;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	
	@Autowired
	MybatisWebNoteDao service;
	@Autowired
	MybatisUserDao userService;
	boolean userIdCheck;
	String userName;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		if(userId != null){
			userIdCheck = true;
			userName = (String) session.getAttribute("userName");
		}else{
			userIdCheck = false;
		}
	}
	
	@RequestMapping(value = "chatForm", method = RequestMethod.GET)
	public String list(HttpServletRequest request) throws IOException {
		System.out.println("[userIdCheck] = " + userIdCheck);
		System.out.println("[userName] = " + userName);
		if(userIdCheck){
			return "chat/chatForm";
		}else{
			return "user/loginForm";
		}
	}
	
	@RequestMapping(value = "webNoteListForm", method = RequestMethod.GET)
	public String webNoteListForm(@RequestParam(value="categoryCheck", defaultValue="1") int categoryCheck, @RequestParam(value="pageNum", defaultValue="1") int pageNum ,Model model) {
		List<WebNote> webNoteList;
		if(categoryCheck == 1){
			webNoteList = service.getWebNoteList1(userName);
		}else{
			webNoteList = service.getWebNoteList2(userName);
		}
//		페이지넘 처리 작업
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1; // 1, 11
		int endRow = startRow + pageSize - 1; // 10, 20
		int count = webNoteList.size(); // 10       -> 20
		if(categoryCheck == 1){
			webNoteList = service.getWebNoteList3(startRow, endRow, userName);
		}else{
			webNoteList = service.getWebNoteList4(startRow, endRow, userName);
		}
		int number = count - (pageNum - 1) * pageSize; // 10 -> 20, 10  
		int bottomLine = 3;// 페이지번호의 단위
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); 
		int startPage = 1 + (pageNum - 1) / bottomLine * bottomLine; 
		int endPage = startPage + bottomLine - 1; 
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("categoryCheck", categoryCheck);
		model.addAttribute("webNoteList", webNoteList);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "chat/webNoteListForm";
	}
	
	@RequestMapping(value = "messagePro", method = RequestMethod.POST)
	public void messagePro(WebNote webNote, HttpServletResponse response) throws IOException {
		String check = userService.checkUserId(webNote.getReceiver());
		if(check == null){
//			쪽지를 받을 사람이 존재하지 않는다는거지.
			System.out.println("[쪽지 전송 실패]");
			PrintWriter script = response.getWriter();
//			아래에 추가 효과 작업 해야함.
			script.println("<script>");
			script.println("history.go(-1)");
			script.println("</script>");
		}else{
//			존재 한다면?
			service.insertWebNote(webNote);
			System.out.println("[쪽지 전송 완료]");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("window.close()");
			script.println("opener.location.reload(true)");
			script.println("</script>");
		}
	}
}
