package net.hb.crud;

import java.io.File;
import java.util.Arrays;
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
import java.io.UnsupportedEncodingException;
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
	
	@RequestMapping("/addexam.do")
	public String addexam_insert() {
		//추가가 될때마다 alter table add column 을 해주고 insert를 해준다. 
		dao.wordExamAdd();
		return "study_word";
	}//end
	
	
	
	/*community================================================================*/
	@RequestMapping("/community.do")
	public String community_select(HttpServletRequest request, Model model) throws Exception {
		int pagecount, pageNum, start, end, GGtotal, Gtotal, temp, startpage, endpage;
		String skey, sval;
		String topic;
		
		topic = request.getParameter("topic");
		
		if(topic=="" || topic==null) {
			topic="";
		}
		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");
		
		if(skey=="" || skey==null || sval=="" || sval==null) {
			skey="custid"; sval="";
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
		
		List<BoardDTO> LG = dao.boardSelect(start, end, skey, sval, topic);
		
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
		return "com_community";
	}//end
	
	
	
	/*
	 
	

	@RequestMapping(value="/boardreply.do", method=RequestMethod.GET)
	public String reply_insert(BoardReplyDTO dto) {
		rdao.dbInsert(dto);
		return "redirect:/boardDetail.do?idx="+dto.getHobby_idx();
	}//end

	 
	@RequestMapping(value="/boardreply_list.do", method=RequestMethod.GET)
	public ModelAndView reply_select(@RequestParam("idx") int idx) {
		ModelAndView mav = new ModelAndView();
		List<BoardReplyDTO> rLG = rdao.dbSelect(idx);
		mav.addObject("rLG", rLG);
		mav.setViewName("board_reply");
		return mav;
	}//end
	 
	*/
	
	
	/*댓글 삽입 ==================================================================*/
	@RequestMapping("/replyInsert.do")
	public String reply_insert(BoardDTO dto, Model model, HttpSession session) {
		String rwriter = (String) session.getAttribute("custid");
		dto.setRwriter(rwriter);
		
		System.out.println("===========replyInsert.do===========");
		System.out.println("rwriter : " + dto.getRwriter());
		System.out.println("보낼 idx 값 : " + dto.getBoard_idx());
		System.out.println("====================================");
		
		/*댓글삽입 DAO*/
		dao.replyInsert(dto);
		return "redirect:/community_detail.do?idx="+dto.getBoard_idx();
	}//end
	
	
	@RequestMapping("/replySelect.do")
	public ModelAndView reply_select(@RequestParam("idx") int idx) {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> rdto = dao.replySelect(idx);
		mav.addObject("rdto",rdto);
		mav.setViewName("com_reply");
		return mav;
	}
	
	
	/*detail================================================================*/
	@RequestMapping("/community_detail.do")
	public String detail_select(@RequestParam("idx") int idx, Model model) {
		dao.BoardAddhit(idx);
		BoardDTO dto=dao.boardDetail(idx);
		model.addAttribute("dto", dto);
		return "com_detail";
	}//end
	
	
	
	/*
	 @RequestMapping("/boardDetail.do")
	 public String  board_detail( @RequestParam("idx") int data ,Model model) {
	 	BoardDTO dto=dao.boardDetail(data);
		System.out.println("lombok @toString디티오는 = " + dto);
		model.addAttribute("dto", dto);
		return "boardDetail";
	 }//end
 
	 
	 * */
	
	
	
	
	
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
	
	//한건 삭제 ================================================================
	
	@RequestMapping("/delete.do")
	public String detail_delete(@RequestParam("idx") int idx, Model model) {
		dao.boardDelete(idx);
		return "redirect:/community.do";
	}//end
	
	
	//한건 수정==================================================================
	@RequestMapping("/edit.do")
	public String board_edit(@RequestParam int idx, Model model) {
		BoardDTO dto = dao.boardDetail(idx);
		model.addAttribute("idx", idx);
		model.addAttribute("dto", dto);
		return "com_edit";
	}//end
	
	@RequestMapping("/editSave.do")
	public String board_editSave(BoardDTO dto, @RequestParam("idx") int idx, Model model) {
		dto.setBoard_idx(idx);
		dao.boardEdit(dto);
		dto=dao.boardDetail(idx);
		model.addAttribute("dto", dto);
		return "com_detail";
	}//end
	
	/*단어외우기 ================================================================*/
	
	@RequestMapping("/studyword.do") //1
	public String studyword_select(Model model, HttpServletRequest request, BoardDTO dto) {
		
		List<BoardDTO> wordlist = dao.wordSelect();
		int wordcnt = dao.wordCount();
		
		if(dto.getWrn()==0) {
			dto.setWrn(1);
		}
		
		BoardDTO worddto = dao.wordSelectOne(dto.getWrn());
		
		model.addAttribute("worddto", worddto);
		model.addAttribute("word", wordlist);
		model.addAttribute("wordcnt", wordcnt);
		return "study_word";
	}//end
	
	
	@RequestMapping("/wordCard.do")
	public String wordCard_select(Model model, HttpServletRequest request, BoardDTO dto) {
		String command = request.getParameter("command"); 
		int crrentwrn = Integer.parseInt(request.getParameter("c"));
		
		if(command.equals("back")) {
			dto.setWrn(crrentwrn-1);
		} 
		if (command.equals("plus")){
			dto.setWrn(crrentwrn+1);
		}
		
		List<BoardDTO> wordlist = dao.wordSelect();
		int wordcnt = dao.wordCount();
		
		if(dto.getWrn()==0) {
			dto.setWrn(1);
		}
		
		BoardDTO worddto = dao.wordSelectOne(dto.getWrn());
		
		model.addAttribute("worddto", worddto);
		model.addAttribute("word", wordlist);
		model.addAttribute("wordcnt", wordcnt);
		return "study_word";
	}//end
	
	/*글쓰기 ================================================================*/
	
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
	
	
}//class END







