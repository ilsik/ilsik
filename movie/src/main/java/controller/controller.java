package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import command._00_main;
import command._01_join;
import command._01_joinPro;
import command._02_login;
import command._02_loginPro;
import command._03_logout;
import command._04_myPage;
import command._05_ticketing;
import command._05_ticketingPro;
import command._05_ticketingPro2;
import command._05_ticketingPro3;
import command._06_movieList;
import command._07_idcheck;
import command._08_search;
import command._09_charge;
import command._1_0_adminPage;
import command._1_1_cinemaAdd;
import command._1_1_cinemaAddPro;
import command._1_1_cinemaDelete;
import command._1_1_cinemaList;
import command._1_1_memberDelete;
import command._1_1_memberList;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"*.do"})
public class controller extends HttpServlet{
	private Map<String, Object> mapList=new HashMap<String, Object>();
	
	public void init() throws ServletException{
		mapList.put("/main.do",new _00_main());
		mapList.put("/join.do",new _01_join());
		mapList.put("/joinPro.do",new _01_joinPro());
		mapList.put("/login.do",new _02_login());
		mapList.put("/loginPro.do",new _02_loginPro());
		mapList.put("/logout.do",new _03_logout());
		mapList.put("/myPage.do",new _04_myPage());
		mapList.put("/ticketing.do",new _05_ticketing());
		mapList.put("/ticketingPro.do",new _05_ticketingPro());
		mapList.put("/ticketingPro2.do",new _05_ticketingPro2());
		mapList.put("/ticketingPro3.do",new _05_ticketingPro3());
		mapList.put("/movieList.do",new _06_movieList());
		mapList.put("/idcheck.do",new _07_idcheck());
		mapList.put("/search.do",new _08_search());
		mapList.put("/charge.do",new _09_charge());
		mapList.put("/admin.do",new _1_0_adminPage());
		mapList.put("/memberList.do",new _1_1_memberList());
		mapList.put("/cinemaAdd.do",new _1_1_cinemaAdd());
		mapList.put("/cinemaList.do",new _1_1_cinemaList());
		mapList.put("/memberDelete.do",new _1_1_memberDelete());
		mapList.put("/cinemaDelete.do",new _1_1_cinemaDelete());
		mapList.put("/cinemaAddPro.do",new _1_1_cinemaAddPro());
		
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		reqPro(request, response);
	}protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		reqPro(request, response);
	}protected void reqPro(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		String uri=request.getRequestURI();
		String path=request.getContextPath();
		String action=uri.substring(path.length());
		
		CommandAction com=(CommandAction)mapList.get(action);
		String view="";
		try {
			view=com.reqPro(request, response);
			request.setAttribute("view", view);
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		RequestDispatcher dis=request.getRequestDispatcher("0_0_main.jsp");
		dis.forward(request, response);
		
		
	}
}
