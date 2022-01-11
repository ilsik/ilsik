package com.spring.board.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class memberController {
	@Autowired
	memberDAO dao;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	@RequestMapping(value = "board/join")
	public String join(HttpServletRequest request, Model model) {
		System.out.println("====조인시작====");
		return "board/01_join";
	}
	@RequestMapping(value = "board/joinPro")
	public String joinPro(HttpServletRequest request, Model model) {
		System.out.println("====조인프로시작====");
		String id=request.getParameter("id");
	 	String pw=request.getParameter("pw");
	 	String name=request.getParameter("name");
	 	String gender=request.getParameter("gender");
	 	String age=request.getParameter("age");
	 	System.out.println(name);
	    memberDTO member=new memberDTO();
	    member.setId(id);
	    member.setPw(pw);
	    member.setName(name);
	    member.setGender(gender);
	    member.setAge(age);
	    int check=dao.insert(member);
	    
	    request.setAttribute("check", check);
	    System.out.println("====조인프로끝====");
		return "board/01_joinPro";
	}
	@RequestMapping(value = "board/idCheck")
	public String idCehck(HttpServletRequest request, Model model) {
		System.out.println("====아이디체크시작====");
		String id=request.getParameter("id");
		int check=dao.idCheck(id);
		
		request.setAttribute("check", check);
		System.out.println("====아이디체크 끝====");
		return "board/02_idCheck";
	}
	@RequestMapping(value = "board/login")
	public String login(HttpServletRequest request, Model model) {
		System.out.println("====로그인시작====");
		return "board/03_login";
	}
	@RequestMapping(value = "board/loginPro")
	public String loginPro(HttpServletRequest request, Model model) {
		System.out.println("====로그인프로시작====");
		String id=request.getParameter("id");
	 	String pw=request.getParameter("pw");
	 	
	 	int check=dao.login(id, pw);
	    if(check==1) {
	    	HttpSession session=request.getSession();
	    	session.setAttribute("log", id);
	    }
	    System.out.println(id);
	    System.out.println(pw);
	    System.out.println(check);
	    request.setAttribute("check", check);
	    System.out.println("====로그인프로끝====");
		return "board/03_loginPro";
	}
	@RequestMapping(value = "board/logout")
	public String logout(HttpServletRequest request, Model model) {
		System.out.println("====로그아웃시작====");
		HttpSession session=request.getSession();
		session.invalidate();
		
		return "redirect:/board/main";
	}
}
