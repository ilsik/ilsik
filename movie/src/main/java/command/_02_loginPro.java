package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;


public class _02_loginPro implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
	response.setCharacterEncoding("EUC-KR");
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		int check=MemberDAO.getInstance().login(id, pw);
		if(check==1) {
			HttpSession session=request.getSession();
			session.setAttribute("log", id);
		}
		request.setAttribute("check", check);
	    
	return "0_2_loginPro.jsp";
	}
}