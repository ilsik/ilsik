package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CinemaBean;
import model.CinemaDAO;


public class _1_1_cinemaAddPro implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		String title=request.getParameter("title");
		String time=request.getParameter("time");
		String type=request.getParameter("type");
		int theater=Integer.parseInt(request.getParameter("theater"));
		int price=Integer.parseInt(request.getParameter("price"));
		CinemaBean cinema=new CinemaBean();
		cinema.setCinema_title(title);
		cinema.setCinema_time(time);
		cinema.setCinema_type(type);
		cinema.setCinema_theater(theater);
		cinema.setCinema_price(price);
		
		int check=CinemaDAO.getInstance().cinemaAdd(cinema);
		
		request.setAttribute("check", check);
	    
	return "1_1_cinemaAddPro";
	}
}
