package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/")
public class BoardController {

	public void initProcess(HttpServletRequest request, HttpServletResponse response) {

	}

	@RequestMapping("test")
	public String index() {
		return "index";
	}

}
