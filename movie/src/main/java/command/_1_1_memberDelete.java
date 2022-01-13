package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;


public class _1_1_memberDelete implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		String id=request.getParameter("id");
		System.out.println(id);
		
		int check=MemberDAO.getInstance().delete(id);
		request.setAttribute("check", check);
	 	
	    
	return "1_1_memberDelete";
	}
}