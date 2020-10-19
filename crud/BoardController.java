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
	
	@RequestMapping("/community.do")
	public String community_select() {
		return "com_community";
	}//end
	
	@RequestMapping("/studyword.do")
	public String studyword_select() {
		return "study_word";
	}//end
	
	@RequestMapping("/write.do")
	public String write_select() {
		return "com_write";
	}//end
	
	@RequestMapping("/loginSave.do")
	public String loginSave_select() {
		return "main";
	}//end
}//class END







