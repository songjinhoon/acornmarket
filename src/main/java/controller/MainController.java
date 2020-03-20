package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main/")
public class MainController {
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("------------------");
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response) {

		return "main/main";
	}
}
