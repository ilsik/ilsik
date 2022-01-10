package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;




public class _07_idcheck implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
		String id=request.getParameter("id");
		System.out.println("실행");
		int check=MemberDAO.getInstance().idcheck(id);
		
		request.setAttribute("check", check);
		
	return "0_7_idcheck.jsp";
	}
}