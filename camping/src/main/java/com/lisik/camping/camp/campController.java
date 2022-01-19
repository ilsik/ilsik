package com.lisik.camping.camp;

import java.text.DecimalFormat;
import java.util.ArrayList;

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
	@RequestMapping(value = "/search.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String search(HttpServletResponse response,Model model,HttpServletRequest request) {
		System.out.println("====search 시작=====");
		
		String search=request.getParameter("search");
		ArrayList<campDTO>campSearchList=dao.campSearchList(search);
		ArrayList<imgDTO>imgSearchList=dao.imgSearchList(search);
		for(int i=0;i<imgSearchList.size();i++) {
			System.out.println(imgSearchList.get(i).getNo());
			System.out.println(imgSearchList.get(i).getImg());
		}
		int index=0;
		
		DecimalFormat df=new DecimalFormat("###,###");
		
		model.addAttribute("campSearchList", campSearchList);
		model.addAttribute("imgSearchList", imgSearchList);
		model.addAttribute("index", index);
		model.addAttribute("cont","02_search.jsp");
		model.addAttribute("df",df);
		
		System.out.println("====search 끝=====");
		return "camp/main";
	}
	@RequestMapping(value = "/prevImg.do",method = {RequestMethod.GET,RequestMethod.POST})
	public void prevImg(HttpServletResponse response,Model model,HttpServletRequest request) {
		System.out.println("====prevImg 시작=====");
		
		int index=Integer.parseInt(request.getParameter("index"));
		if(index >=1) {
			index=-1;
		}
		model.addAttribute("index", index);
		
		System.out.println("====prevImg 끝=====");
	}
	@RequestMapping(value = "/nextImg.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String nextImg(HttpServletResponse response,Model model,HttpServletRequest request) {
		System.out.println("====nextImg 시작=====");
		
		int index=Integer.parseInt(request.getParameter("index"));
		
		index+=1;
		System.out.println(index);
		model.addAttribute("index", index);
		
		System.out.println("====nextImg 끝=====");
		return "camp/02_check";
	}
}
