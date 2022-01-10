package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MovieDAO;

public class _00_main implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
	 	String[] title=MovieDAO.getInstance().title();
	 	
	 	request.setAttribute("title", title);
	    
	return "_center.jsp";
	}
}
