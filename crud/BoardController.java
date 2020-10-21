package net.hb.crud;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.FileInputStream;

import java.net.URLEncoder;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	@Autowired
	ServletContext application;
	
	@Inject
	@Autowired
	BoardDAO dao;

	@RequestMapping("/main.do")
	public String main_select() {
		return "main";
	}//end
	
	@RequestMapping("/project.do")
	public String project_select() {
		return "project";
	}//end
	
	
	/*community================================================================*/
	@RequestMapping("/community.do")
	public String community_select(HttpServletRequest request, Model model) {
		int pagecount, pageNum, start, end, GGtotal, Gtotal, temp, startpage, endpage;
		String skey, sval;
		
		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");
		if(skey=="" || skey==null || sval=="" || sval==null) {
			skey="name"; sval="";
		}
		String returnpage = "&keyfield="+skey+"&keyword="+sval;
		
		String pnum = request.getParameter("pageNum");
		if(pnum=="" || pnum==null) {
			pnum="1";
		}
		pageNum = Integer.parseInt(pnum);
		
		start = (pageNum-1)*10+1;
		end = pageNum*10;
		
		GGtotal = dao.boardCount();
		Gtotal = dao.boardCountSearch(skey, sval);
		
		if(Gtotal%10==0) {pagecount=Gtotal/10;}
		else {pagecount=(Gtotal/10)+1;}
		
		temp = (pageNum-1)%10;
		startpage = pageNum-temp;
		endpage = startpage+9;
		if(endpage>pagecount) {endpage=pagecount;}
		
		List<BoardDTO> LG = dao.boardSelect(start, end, skey, sval);
		
		model.addAttribute("skey", skey);
		model.addAttribute("sval", sval);
		model.addAttribute("returnpage", returnpage);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("GGtotal", GGtotal);
		model.addAttribute("Gtotal", Gtotal);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("LG", LG);
		
		dao.boardSelect(start, end, skey, sval);
		return "com_community";
	}//end
	
	
	/*detail================================================================*/
	@RequestMapping("/community_detail.do")
	public String detail_select(@RequestParam("idx") int idx, Model model) {
		dao.BoardAddhit(idx);
		BoardDTO dto=dao.boardDetail(idx);
		model.addAttribute("dto", dto);
		return "com_detail";
	}//end
	
	@RequestMapping("/boardLike.do")
	public String boardLike_insert(@RequestParam("idx") int idx, Model model, HttpSession session, HttpServletResponse response, BoardDTO dto) throws Exception {
		
		String hwriter = (String) session.getAttribute("custid");
		
		dto.setBoard_idx(idx);
		dto.setHwriter(hwriter);
		
		int heartCheck = dao.boardLikeCheck(dto); //값이 1 또는 0
		
		if(heartCheck==0) { //검사했는데 결과값이 0임
			//추천을 안한사람
			dao.boardLikePlusOne(dto);
			dao.boardLikeInsert(dto);
		} else if(heartCheck==1) { 
			//추천을 한 사람
			dao.boardLikeMinusOne(dto);
			dao.boardLikeDelete(dto);
		}
		dto=dao.boardDetail(idx);
		model.addAttribute("dto", dto);
		return "com_detail";
	}//end
	
	/*studyword================================================================*/
	@RequestMapping("/studyword.do")
	public String studyword_select() {
		return "study_word";
	}//end
	
	@RequestMapping("/write.do")
	public String write_select() {
		return "com_write";
	}//end
	
	@RequestMapping("/writeSave.do")
	public String write_insert(HttpSession session, BoardDTO dto) {
		String custid = (String) session.getAttribute("custid");
		dto.setCustid(custid);
		dao.boardInsert(dto);
		return "redirect:/community.do";
	}//end
	
	@RequestMapping("/loginSave.do")
	public String loginSave_select() {
		return "main";
	}//end
}//class END







