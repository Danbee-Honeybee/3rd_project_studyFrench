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

/*�ܺ�����*/
@Controller
public class LoginController {
	@Autowired 
	LoginDAO loginDAO;
	
	@Inject
	@Autowired
	BoardDAO boarddao;
	
	
	/*ȸ������======================================================*/
	
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
	public String idcheck_complete(HttpServletRequest request) {
		String custid = request.getParameter("custid");
		System.out.println("�˻� �Ϸ�� id : " + custid);
		request.setAttribute("custid", custid);
		return "signup";
	}//end
	
	@RequestMapping("/signupSave.do")
	public String signup_insert(BoardDTO dto, HttpServletRequest request) {
		boarddao.signupInsert(dto);
		HttpSession session = request.getSession();
		session.setAttribute("custcode", dto.getCustcode());
		return "main";
	}//end
		
	/*�α���========================================================*/
	@RequestMapping("/login.do")
	public String login_select() {
		System.out.println("[LoginController] login_select �޼ҵ� ����");
		return "login";
	}//end
	
	@RequestMapping(value="loginprocess.do") //login.jsp���� �Ѿ��
	public void loginprocess(LoginDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("�Ѿ�� id : "   + dto.getCustid());
		System.out.println("�Ѿ�� pass : " + dto.getCustpassword());
		int result = loginDAO.login(dto); // ���� 1 ���� 0
		System.out.println("result �� : "+result);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result==0) {
			out.println("No such costomer");
			out.append("<script>alert('���� ȸ���Դϴ�.');"
					+ "location.href='login.do';");
			out.append("</script>");
			out.flush();
		} else {
			session.setAttribute("daum", dto.getCustid());
			System.out.println("[LoginController] ����: daum / ȸ�����簪:" + result);
			RequestDispatcher dis = request.getRequestDispatcher("main.do");
		    dis.include(request, response);
		}
	}//end
	
}
