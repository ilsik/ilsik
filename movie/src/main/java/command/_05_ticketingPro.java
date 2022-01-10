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
		
		ArrayList<CinemaBean>cinemaTimeList=CinemaDAO.getInstance().cinemaTimeList(selMovie);
		System.out.println(index);
		ArrayList<TicketBean>SelticketList=TicketDAO.getInstance().SelticketList(cinemaTimeList, index);
		int seatCheck[][]=new int[10][10];
		for(int i=0;i<SelticketList.size();i++) {
			 char seat1=SelticketList.get(i).getTicket_seat1();
			    int seat2=SelticketList.get(i).getTicket_seat2();
				int seat=(int)seat1-65;
				seatCheck[seat][seat2-1]=1;
		}
		
		request.setAttribute("no", no);
		request.setAttribute("SelticketList", SelticketList);
		request.setAttribute("index", index);
		request.setAttribute("seatCheck", seatCheck);
		
	return "0_5_ticketingPro.jsp";
	}
}