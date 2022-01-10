package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDAO;


public class _1_1_memberList implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		
		ArrayList<MemberBean>memberList=MemberDAO.getInstance().memberList();
		
		request.setAttribute("memberList", memberList);
	 	
	    
	return "1_1_memberList.jsp";
	}
}
