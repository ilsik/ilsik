package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.MemberDAO;
import model.TicketBean;
import model.TicketDAO;


public class _04_myPage implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session=request.getSession();
		String log=(String)session.getAttribute("log");
	    ArrayList<MemberBean>memberList=MemberDAO.getInstance().memberList();
	    int index=-1;
	    for(int i=0;i<memberList.size();i++) {
	    	if(memberList.get(i).getMember_id().equals(log)) {
	    		index=i;
	    	}
	    }
	    System.out.println(index);
	    
	    ArrayList<TicketBean>ticketList=TicketDAO.getInstance().getTicketList();
	    
	    request.setAttribute("ticketList", ticketList);
		request.setAttribute("memberList", memberList);
		request.setAttribute("index", index);
	return "0_4_mypage.jsp";
	}
}