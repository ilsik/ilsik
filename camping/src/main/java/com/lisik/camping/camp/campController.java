package com.lisik.camping.camp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class campController {
	@Autowired
	campDAO dao;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	@RequestMapping(value = "/main.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String index(HttpServletResponse response,Model model,HttpServletRequest request) {
		
		model.addAttribute("cont","cont.jsp");
		return "camp/main";
	}
}