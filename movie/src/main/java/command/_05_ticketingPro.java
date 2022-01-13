package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CinemaBean;
import model.CinemaDAO;
import model.MovieDAO;
import model.TicketBean;
import model.TicketDAO;

public class _05_ticketingPro implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
		response.setCharacterEncoding("EUC-KR");
	
		String str=request.getParameter("index");
		int index=Integer.parseInt(str);
		int no=Integer.parseInt(request.getParameter("title"));
		String []title=MovieDAO.getInstance().title();
		String selMovie=title[no];
		ArrayList<CinemaBean>cinemaList=CinemaDAO.getInstance().cinemaList(selMovie);
		ArrayList<TicketBean>ticketList=TicketDAO.getInstance().ticketList(cinemaList, index);
		int seatCheck[][]=new int[10][10];
		
		for(int i=0;i<ticketList.size();i++) {
			 char seat1=ticketList.get(i).getTicket_seat1();
			    int seat2=ticketList.get(i).getTicket_seat2();
				int seat=(int)seat1-65;
				seatCheck[seat][seat2-1]=1;
		}
		
		request.setAttribute("no", no);
		request.setAttribute("cinemaList", cinemaList);
		request.setAttribute("index", index);
		request.setAttribute("seatCheck", seatCheck);
		
	return "0_5_ticketingPro";
	}
}