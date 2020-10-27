package net.fr.crud.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*�ܺ�����*/
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class); 
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	    throws Exception {
		HttpSession session = request.getSession();
		String ss = (String) session.getAttribute("custid");
		
		String uri = request.getRequestURI();
		
		int idx = uri.lastIndexOf("/");
		uri = uri.substring(idx+1);
		
		String query = request.getQueryString(); //�Ѿ�°����� ������ ���ڿ��� �� �Ѹ���
		
		if(query==null || query.equals("null")){ query="";}
		else{ query="?"+query;}
		uri = uri + query;
		boolean adminCheck = false;
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		  	
			if(ss!=null){
				System.out.println("[LoginInterceptor] �α��� �Ǿ�����");
				adminCheck=true;	//�α����� �Ǿ��ִٴ� ��
			} else {
				//out.println ����ϸ� �ȉ�
				out.append("<script>alert('�α����� �ʿ��մϴ�.');");
				out.append("location.href='login.do';");
				out.append("</script>").flush();
				adminCheck=false;
			}
			return adminCheck;
	}//end

	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
					throws Exception {
		logger.info("=======================afterCompletion start========================");
		logger.info("=======================afterCompletion end=========================");
	}//end

	public void afterCompletion(
			HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
					throws Exception {
		logger.info("=======================postHandle start======================");
		logger.info("=======================postHandle end=========================");
	}//end
}
