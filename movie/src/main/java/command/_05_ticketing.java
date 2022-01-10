package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CinemaBean;
import model.CinemaDAO;
import model.MovieDAO;



public class _05_ticketing implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	response.setCharacterEncoding("EUC-KR");
	
		String str=request.getParameter("titleno");
		int no=Integer.parseInt(str);
		String []title=MovieDAO.getInstance().title();
		
		String selMovie=title[no];
		
		ArrayList<CinemaBean>cinemaTimeList=CinemaDAO.getInstance().cinemaTimeList(selMovie);
		
		request.setAttribute("titleNo", no);
		request.setAttribute("cinemaTimeList", cinemaTimeList);
		request.setAttribute("selMovie", selMovie);
		
	return "0_5_ticketing.jsp";
	}
}