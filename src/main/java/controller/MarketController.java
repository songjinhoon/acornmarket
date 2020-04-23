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
	public String market_main(Model model,@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "searchType", required = false, defaultValue = "all") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		int perPageNum = 3; //데이터의 갯수
		int getPageStart = (page - 1) * perPageNum+1; //시작데이터
		int getPageEnd = perPageNum*page;
		int displayPageCnt = 10; // 화면에 보여질 페이지 번호 수
		int totalDataCount = service.getArticleCount(); // 실제 게시물 수
		int endPage = (int)(Math.ceil(page/(double)displayPageCnt)*displayPageCnt); // 현재 페이지 기준 끝 페이지 번호 ex)13/10=1.3 올림 -> 2*10=20
		int startPage = (endPage-displayPageCnt) + 1; // 현재 페이지 기준 시작 페이지 번호 ex)13 -> 20-10+1=11
		int tempEndPage = (int)(Math.ceil(totalDataCount / (double) perPageNum)); //전체 게시물 수가 88개이면 88/10=8.8 올림-> 9
		//만약 계산된 끝 페이지 번호보다 실제 사용되는 페이지 수가 더 작으면 실제 사용될 페이지 번호만 보여줌
		if(endPage > tempEndPage) {
					endPage = tempEndPage;
				}
		int number = totalDataCount - (page - 1) * perPageNum;	
		
		/*if(keyword == null) {
			List li = service.getArticle(getPageStart,getPageEnd);
			model.addAttribute("li", li);
		}
		else { 
			List li = service.getArticle(searchType,keyword,getPageStart,getPageEnd);
			model.addAttribute("li", li);
		}*/
		List li = service.getArticle(searchType,keyword,getPageStart,getPageEnd);
		model.addAttribute("li", li);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("tempEndPage",tempEndPage);
		model.addAttribute("page",page);
		model.addAttribute("number",number);

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
	public String market_content(Model model,@RequestParam int num,@RequestParam(value = "page", required = false, defaultValue = "1") int page) throws Exception {

		MarketDataBean article = service.getArticles(num);
		model.addAttribute("article", article);
		
		double average = service.getAverage(num);
		model.addAttribute("average", average);
		
		model.addAttribute("userId", userId);
		model.addAttribute("num", num);
		model.addAttribute("page", page);
		
		int perPageNum = 3; //데이터의 갯수
		int getPageStart = (page - 1) * perPageNum+1; //시작데이터
		int getPageEnd = perPageNum*page;
		int displayPageCnt = 10; // 화면에 보여질 페이지 번호 수
		int totalDataCount = service.getCmtCount(num); // 실제 게시물 수
		int endPage = (int)(Math.ceil(page/(double)displayPageCnt)*displayPageCnt); // 현재 페이지 기준 끝 페이지 번호 ex)13/10=1.3 올림 -> 2*10=20
		int startPage = (endPage-displayPageCnt) + 1; // 현재 페이지 기준 시작 페이지 번호 ex)13 -> 20-10+1=11
		int tempEndPage = (int)(Math.ceil(totalDataCount / (double) perPageNum)); //전체 게시물 수가 88개이면 88/10=8.8 올림-> 9
		//만약 계산된 끝 페이지 번호보다 실제 사용되는 페이지 수가 더 작으면 실제 사용될 페이지 번호만 보여줌
		if(endPage > tempEndPage) {
					endPage = tempEndPage;
				}
		int number = totalDataCount - (page - 1) * perPageNum;	
		
		List li = service.getArticles2(num,getPageStart,getPageEnd);
		model.addAttribute("li", li);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("tempEndPage",tempEndPage);
		
		return "market/market_content";
	}
	
	@RequestMapping(value = "market_cmtwrite", method = RequestMethod.POST)
	public String market_cmtwrite(CmtDataBean article,Model model,@RequestParam int num) throws Exception {

		System.out.println(article);
		service.insertArticle2(article);
		return "redirect:/market/market_content?num="+num;
	}
	
	@RequestMapping(value = "market_deleteform", method = RequestMethod.GET)
	public String market_deleteForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,@RequestParam int num, Model model) {

		model.addAttribute("num", num);
		model.addAttribute("page", page);
		return "market/market_deleteform";
	}
	
	@RequestMapping(value = "market_delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String market_delete(@RequestParam(value = "page", required = false, defaultValue = "1") int page,@RequestParam int num, String passwd, Model model) throws Exception {

		int check = service.deleteArticle(num, passwd);
		model.addAttribute("check", check);
		model.addAttribute("page", page);
		
		return "market/market_deletePro";
	}

}
