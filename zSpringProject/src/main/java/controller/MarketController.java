package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.CScenterDataBean;
import model.CmtDataBean;
import model.MarketDataBean;
import repository.MarketDao;

@Controller
@RequestMapping("/market/")
public class MarketController {

	String userId;
	String ip;

	@Autowired
	MarketDao service;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		ip = request.getRemoteAddr();
		HttpSession session = request.getSession();
		userId = (String) session.getAttribute("userId");
		System.out.println("User----------" + userId);
	}

	@RequestMapping(value = "market_main", method = RequestMethod.GET)
	public String market_main(Model model) throws Exception {

		List li = service.getArticle();

		model.addAttribute("li", li);

		return "market/market_main";
	}

	@RequestMapping(value = "market_write", method = RequestMethod.GET)
	public String market_write(Model model) throws Exception {

		return "redirect:market_write.jsp";
	}

	@RequestMapping(value = "market_writePro", method = RequestMethod.POST)
	public String market_writePro(MarketDataBean article, Model model) throws Exception {

		System.out.println(article);
		article.setIp(ip);
		service.insertArticle(article);

		return "market/market_writePro";
	}

	@RequestMapping(value = "market_content", method = RequestMethod.GET)
	public String market_content(Model model,@RequestParam int num) throws Exception {

		MarketDataBean article = service.getArticles(num);
		model.addAttribute("article", article);
		model.addAttribute("userId", userId);
		model.addAttribute("num", num);
		List li = service.getArticles2(num);
		model.addAttribute("li", li);
		
		return "market/market_content";
	}
	
	@RequestMapping(value = "market_cmtwrite", method = RequestMethod.POST)
	public String market_cmtwrite(CmtDataBean article,Model model,@RequestParam int num) throws Exception {

		System.out.println(article);
		service.insertArticle2(article);
		return "redirect:/market/market_content?num="+num;
	}
}
