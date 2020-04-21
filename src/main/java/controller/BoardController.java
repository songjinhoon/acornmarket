package controller;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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

import model.Board;
import model.LikeCheck;
import model.Reply;
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
	}

	@RequestMapping(value = "list")
	public String board_list(HttpServletRequest request, Model m) {

		List li = dbPro.getlistArticles();
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
		m.addAttribute("startRow", startRow); // 몇개를 보여줄건지
		m.addAttribute("endRow", endRow);
		m.addAttribute("count", count);
		m.addAttribute("pageSize", pageSize); // 페이징작업
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
		List<Reply> list = replyPro.getArticles(num);
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
	public String board_updatePro(HttpServletRequest multipart, Board article, Model m, String address1,
			String address2) throws Exception {

		System.out.println(article.getOldfile());

		MultipartFile multi = ((MultipartRequest) multipart).getFile("uploadfile");

		String filename = multi.getOriginalFilename();
		if (filename != null && !filename.equals("")) {
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";

			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));

			article.setFilename(filename);
		} else {
			article.setFilename(article.getOldfile());
		}

		article.setAddress(address1 + " " + address2);
		dbPro.updateArticle(article);
		m.addAttribute("boardnum", article.getBoardnum());

		return "board/updatePro";
	}

	@RequestMapping(value = "delete")
	public String board_deleteForm(int num, Model m) {

		m.addAttribute("num", num);
		return "board/deleteForm";
	}

	@RequestMapping(value = "deletePro")
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
		int check = dbPro.soldoutCheck1(boardnum);

		if (check == 1) {
			return "ok";
		} else {
			return "no";
		}
	}

	@ResponseBody // 0 -> 1
	@RequestMapping(value = "selloff", method = RequestMethod.POST)
	public String selloff(HttpServletRequest request, String boardnum) {
		String bdnum = request.getParameter("boardnum");
		int check = dbPro.soldoutCheck2(Integer.parseInt(boardnum));

		if (check == 1) {
			return "ok";
		} else {
			return "no";
		}
	}

	@ResponseBody
	@RequestMapping(value = "like", method = RequestMethod.GET)
	public String like(HttpServletRequest request, LikeCheck like) {

		
		JSONObject obj = new JSONObject();

		LikeCheck likeResult = dbPro.getLikeCheck(like);
		if (likeResult == null) {
			dbPro.insertLike(like);
			
			System.out.println("@@@@@@@@@@@likesetting");
		}

		dbPro.toggleLike(like);
		likeResult = dbPro.getLikeCheck(like);

		System.out.println(">>>00>>>>>>>>>" + like);
		System.out.println("@@@@++++@@@@@@@"+likeResult.toString());
		
		obj.put("boardnum", likeResult.getBoardnum());
		obj.put("userid", likeResult.getUserid());
		obj.put("likecheck", likeResult.getLikecheck());

		return obj.toJSONString();
	}

}// class end
