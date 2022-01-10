package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CinemaDAO;


public class _1_1_cinemaDelete implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String theater=request.getParameter("theater");
		String time=request.getParameter("time");
		System.out.println(theater);
		System.out.println(time);
		int check=CinemaDAO.getInstance().cinemaDelete(theater, time);
		
	 	request.setAttribute("check", check);
	    
	return "1_1_cinemaDelete.jsp";
	}
}