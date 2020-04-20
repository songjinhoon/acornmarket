package controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import model.Reply;
import model.Board;
import repository.MybatisBoardDao;
import repository.MybatisReplyDao;

@Controller
@RequestMapping("/board/")
public class BoardController {

	String boardid;
	String pageNum;
	String userid;

	@Autowired
	MybatisBoardDao dbPro;
	
	@Autowired
	MybatisReplyDao replyPro;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userId");

		System.out.println("Board----------" + userid);

		if (request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", 1);
			boardid = (String) session.getAttribute("boardid");
		}

		if (boardid == null) {
			boardid = "1";
			session.setAttribute("boardid", "1");
		}
	}


	@RequestMapping(value = "list")
	public String board_list(HttpServletRequest request, Model m) {

		List li = dbPro.getlistArticles();
		System.out.println(">>>>>" + li);
		m.addAttribute("li", li);

		return "board/list";
	}


	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String board_writeForm(@ModelAttribute("article") Board article) {

		return "board/writeForm";
	}


	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String board_writePro(HttpServletRequest multipart, Board article, Model m, String address1, String address2,
			HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		article.setAddress(address1 + " " + address2);

		article.setFilename("null");
		m.addAttribute("category", article.getCategory());

		MultipartFile multi = ((MultipartRequest) multipart).getFile("uploadfile");

		String filename = multi.getOriginalFilename();
		if (filename != null && !filename.equals("")) {
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";

			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));

			article.setFilename(filename);
		} else {
			article.setFilename("");
		}

		article.setUserid(userid);
		System.out.println("writer--" + article);
		dbPro.insertArticle(article);

		return "board/writePro";
	}


	@RequestMapping(value = "categoryForm")
	public String board_categoryForm(HttpServletRequest request, @RequestParam("category") String category, Model m) {

		HttpSession session = request.getSession();

		userid = (String) session.getAttribute("userId");
		System.out.println(userid);

		int pageSize = 5;
		int num = 9;
		int currentPage = 1;

		if (session.getAttribute("pageNum") == null) {
			session.setAttribute("pageNum", 1);
		}

		try {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

		}

		currentPage = (Integer) session.getAttribute("pageNum");
		int count = dbPro.getArticleCount(category);

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (currentPage > pageCount) {
			currentPage = pageCount;
			session.setAttribute("pageNum", currentPage);
		}

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		// int endRow = currentPage * pageSize;

		List li = dbPro.getArticles(startRow, endRow, category);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;

		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow); // 紐뉕컻瑜� 蹂댁뿬以꾧굔吏�
		m.addAttribute("endRow", endRow);
		m.addAttribute("count", count);
		m.addAttribute("pageSize", pageSize); // �럹�씠吏뺤옉�뾽
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine); // [1][2][3]
		m.addAttribute("startPage", startPage);//
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);

		m.addAttribute("li", li);
		request.setAttribute("userid", userid);

		return "board/categoryForm";
	}


	@RequestMapping(value = "content")
	public String content(int num, Model m) throws Exception {

		Board article = dbPro.getArticle(num);
		List<model.Reply> list = replyPro.getArticles(num);
		m.addAttribute("article", article);
		m.addAttribute("list", list);
		return "board/content";
	}


	@RequestMapping(value = "updateForm")
	public String board_updateForm(int num, Model m) {

		Board article = dbPro.getUpdateArticle(num);
		m.addAttribute("article", article);

		return "board/updateForm";
	}


	@RequestMapping(value = "updatePro", method = RequestMethod.POST)
	public String board_updatePro(HttpServletRequest request, Board article, Model m, String address1, String address2)
			throws Exception {

		article.setAddress(address1 + " " + address2);

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));

		dbPro.updateArticle(article);

		request.setAttribute("boardnum", boardnum);

		return "board/updatePro";
	}


	@RequestMapping(value = "delete")
	public String board_deleteForm(int num, Model m) {

		m.addAttribute("num", num);
		return "board/deleteForm";
	}


	public String board_deletePro(int num, String passwd, Model m) throws Exception {

		int check = dbPro.deleteArticle(num, passwd);
		m.addAttribute("check", check);
		return "board/deletePro";
	}

	
	@ResponseBody
	@RequestMapping(value = "replyinsert", method = RequestMethod.GET)
	public String reply_insert(HttpServletRequest request, Reply reply) throws Exception {

		System.out.println(reply);
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		reply.setUserid(userid);
		replyPro.insertreply(reply);

		System.out.println(boardnum);

		request.setAttribute("boardnum", boardnum);
		request.setAttribute("reply", reply);
		return "ok";
	}
	

	@ResponseBody
	@RequestMapping(value = "replyUpdate", method = RequestMethod.GET)
	public String reply_update(Reply reply) {

		System.out.println(reply.getComments() + " + : " + reply.getReplynum());
		System.out.println(reply.getBoardnum() + " + : " + reply.getUserid());
		reply.setUserid(userid);

		int check = replyPro.updatereply(reply);

		if (check == 1) {
			return "ok";
		} else {
			return "no";
		}
	}

	@ResponseBody
	@RequestMapping(value = "replyDelete", method = RequestMethod.POST)
	public String reply_delete(Reply reply) {
		reply.setUserid(userid);
		int check = replyPro.deletereply(reply);

		if (check == 1) {
			return "ok";
		} else {
			return "no";
		}
	}
	

	@ResponseBody // 1 -> 0
	@RequestMapping(value = "selling", method = RequestMethod.GET)
	public String selling(HttpServletRequest request) {

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		System.out.println(boardnum);
		int check = dbPro.soldoutCheck1(boardnum);

		if (check == 1) {
			return "ok";
		} else {
			return "no";
		}
	}
	

	@ResponseBody // 0 -> 1
	@RequestMapping(value = "selloff", method = RequestMethod.POST)
	public String selloff(HttpServletRequest request,String boardnum) {
		String bdnum = request.getParameter("boardnum");
		System.out.println(boardnum);
		int check = dbPro.soldoutCheck2(Integer.parseInt(boardnum));

		if (check == 1) {
			return "ok";
		} else {
			return "no";
		}
	}
	//////////////////////////////////////////////////////////////////////////

	// 판매 내역
	@RequestMapping(value = "sellList", method = RequestMethod.GET)
	public String sellBoard(Model model) throws Exception {

		List list = dbPro.sellList(userid);
		System.out.println(list);

		model.addAttribute("list", list);

		return "user/board/buy/sellList";
	}

	// 구매 내역
	@RequestMapping(value = "buyList", method = RequestMethod.GET)
	public String buyBoard(Model model) throws Exception {
		List list = dbPro.buyList(userid);
		System.out.println(list);

		model.addAttribute("list", list);

		return "user/board/buy/buyList";
	}

	// 찜 목록
	@RequestMapping(value = "jjimList", method = RequestMethod.GET)
	public String jjimList(HttpServletRequest request, Model model) throws Exception {

		List li = dbPro.likeList(userid);
		System.out.println(li);

		model.addAttribute("list", li);

		return "user/board/jjimList";
	}

	// 작성한 리뷰
	@RequestMapping(value = "MyReply", method = RequestMethod.GET)
	public String Reply(HttpServletRequest request, Model model) throws Exception {

		

		return "user/board/Reply";
	}
}
