package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDAO;


public class _01_joinPro implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
		response.setCharacterEncoding("EUC-KR");
		
	 	String id=request.getParameter("id");
	 	String pw=request.getParameter("pw");
	 	String name=request.getParameter("name");
	 	String gender=request.getParameter("gender");
	 	String age=request.getParameter("age");
	 	System.out.println(name);
	    MemberBean member=new MemberBean();
	    member.setMember_id(id);
	    member.setMember_pw(pw);
	    member.setMember_name(name);
	    member.setMember_gender(gender);
	    member.setMember_age(age);
	    int check= MemberDAO.getInstance().join(member);
	    request.setAttribute("check", check);
	    
	return "0_1_joinPro";
	}
}