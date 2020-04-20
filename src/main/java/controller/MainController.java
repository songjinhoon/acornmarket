package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Board;
import model.User;
import model.WebNote;
import repository.MybatisBoardDao;
import repository.MybatisUserDao;

@Controller
@RequestMapping("/main/")
public class MainController {
	
	@Autowired
	MybatisUserDao userService;
	@Autowired
	MybatisBoardDao boardService;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("------------------");
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(){
		
		return "main/main";
	}
	
//	userscore top6 추출
	@RequestMapping(value = "chart1", method = RequestMethod.GET)
	@ResponseBody
	public List<User> chart1() {
		int count = 6;
		List<User> userList = userService.getUserList(count);
		
		return userList;
	}
	
//	likecount top6 추출 
	@RequestMapping(value = "chart2")
	@ResponseBody
	public List<Board> chart2(){
		int count = 6;
		List<Board> boardList = boardService.getBoardList(count);
		//이곳에 해쉬 태그 처리 해주고 해시태그를 데이터에 넣어주면 끝.
		
		return boardList;
	}
	
}
