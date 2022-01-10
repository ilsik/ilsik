package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;




public class _09_charge implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String log=(String)session.getAttribute("log");
		int charge=Integer.parseInt(request.getParameter("chargePoint"));
		System.out.println(charge);
		
		int check=MemberDAO.getInstance().pointCharge(charge, log);
		
		request.setAttribute("check", check);
		
	return "0_9_charge.jsp";
	}
}