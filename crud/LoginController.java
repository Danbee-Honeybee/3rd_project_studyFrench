package net.hb.crud;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/*단비프젝*/
@Controller
public class LoginController {
	@Autowired 
	LoginDAO loginDAO;
	
	@Inject
	@Autowired
	BoardDAO boarddao;
	
	
	/*회원가입======================================================*/
	
	@RequestMapping("/signup.do")
	public String signup_select() {
		return "signup";
	}//end
	
	@RequestMapping("/idcheck.do")
	public String idcheck(HttpServletRequest request) {
		String custid= request.getParameter("custid");
		request.setAttribute("custid", custid);
		return "signup_idcheck";
	}//end
	
	@RequestMapping("/idcheckSave.do")
	public String idcheckSave(@RequestParam String custid,HttpServletRequest request) {
		int cnt = loginDAO.idcheckSave(custid);
		request.setAttribute("cnt", cnt);
		request.setAttribute("custid", custid);
		return "signup_idcheck";
	}//end
	
	@RequestMapping("/idcheck_complete.do")
	public ModelAndView idcheck_complete(@RequestParam String custid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("custid",custid);
		mav.setViewName("signup");
		return mav;
	}//end
	
	@RequestMapping("/signupSave.do")
	public String signup_insert(BoardDTO dto, HttpServletRequest request) {
		boarddao.signupInsert(dto);
		HttpSession session = request.getSession();
		session.setAttribute("custcode", dto.getCustcode());
		return "main";
	}//end
		
	/*로그인========================================================*/
	
	@RequestMapping("/login.do")
	public String login_select() {
		return "login";
	}//end
	
	@RequestMapping(value="loginprocess.do") //login.jsp에서 넘어옴
	public void loginprocess(LoginDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		int result = loginDAO.login(dto); // 존재 1 없음 0
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result==0) {
			out.println("No such costomer");
			out.append("<script>alert('없는 회원입니다.');"
					+ "location.href='login.do';");
			out.append("</script>");
			out.flush();
		} else {
			session.setAttribute("custid", dto.getCustid());
			RequestDispatcher dis = request.getRequestDispatcher("main.do");
		    dis.include(request, response);
		}
	}//end
	
	@RequestMapping("/loginSave.do")
	public String loginSave_select() {
		return "main";
	}//end
	
	/*로그아웃 ==================================================*/
	@RequestMapping("/logout.do")
	public String logout(HttpServletResponse response, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main.do";
	}//end
}
