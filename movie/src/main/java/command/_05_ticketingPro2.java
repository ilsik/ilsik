package command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CinemaBean;
import model.CinemaDAO;
import model.MemberDAO;
import model.MovieDAO;

public class _05_ticketingPro2 implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
	response.setCharacterEncoding("EUC-KR");
	
		String []seat=request.getParameterValues("index1");
		
		int index=Integer.parseInt(request.getParameter("index"));
		String str=request.getParameter("titleNo");
		int no=Integer.parseInt(str);
		
		String []title=MovieDAO.getInstance().title();
		String selMovie=title[no];
		System.out.println(selMovie);
		ArrayList<CinemaBean>cinemaTimeList=CinemaDAO.getInstance().cinemaTimeList(selMovie);
		HttpSession session=request.getSession();
		String log=(String)session.getAttribute("log");
		int point=MemberDAO.getInstance().pointchekc(log);
		
		
		request.setAttribute("index", index);
		request.setAttribute("point", point);
		request.setAttribute("selMovie", selMovie);
		request.setAttribute("time", cinemaTimeList.get(index).getCinema_time());
		request.setAttribute("seat", seat);
		request.setAttribute("price", cinemaTimeList.get(index).getCinema_price()*seat.length);
		
	return "0_5_ticketingPro2.jsp";
	}
}