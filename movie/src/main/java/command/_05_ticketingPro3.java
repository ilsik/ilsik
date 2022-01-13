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
import model.TicketBean;
import model.TicketDAO;

public class _05_ticketingPro3 implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
	response.setCharacterEncoding("EUC-KR");
		
		HttpSession session =request.getSession();
		String log=(String)session.getAttribute("log");
		
		String buy_type=request.getParameter("buy_type");
		String selMovie=request.getParameter("selMovie");
		int index=Integer.parseInt(request.getParameter("index"));
		String seatlist=request.getParameter("index1");
		String seat[]=seatlist.split(",");
		int point=Integer.parseInt(request.getParameter("point"));
		int price=Integer.parseInt(request.getParameter("price"));
		
		
		
		ArrayList<CinemaBean>cinemaList=CinemaDAO.getInstance().cinemaList(selMovie);
		int check=0;
		
		if(price <= point) {
			for(int i=0;i<seat.length;i++) {
				TicketBean ticket=new TicketBean();
				String token[]=seat[i].split("-");
				ticket.setTicket_memberid(log);
				ticket.setTicket_buy_type(buy_type);
				ticket.setTicket_cinema_title(selMovie);
				ticket.setTicket_cinema_time(cinemaList.get(index).getCinema_time());
				ticket.setTicket_theater(cinemaList.get(index).getCinema_theater());
				ticket.setTicket_seat1(token[0].charAt(0));
				ticket.setTicket_seat2(Integer.parseInt(token[1]));
				check=TicketDAO.getInstance().insertTicket(ticket);
				if(check==-1) {
					break;
				}
				point=MemberDAO.getInstance().pointUse(cinemaList.get(index).getCinema_price(), log);
			}
		}
		
		request.setAttribute("check", check);
		request.setAttribute("point", point);
		
	return "0_5_ticketingPro3";
	}
}