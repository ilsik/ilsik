package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CinemaBean;
import model.CinemaDAO;


public class _1_1_cinemaList implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		ArrayList<CinemaBean>cinemaList=CinemaDAO.getInstance().getCinemaList();
		
		request.setAttribute("cinemaList", cinemaList);
	 	
	    
	return "1_1_cinemaList";
	}
}
