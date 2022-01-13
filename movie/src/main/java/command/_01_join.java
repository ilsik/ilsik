package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class _01_join implements CommandAction{
@Override
public String reqPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
	 	
	    
	return "0_1_join";
	}
}