package com.action.user;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;

public class UserLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그아웃 세션 종료 기능
		
		  
		  request.getSession().invalidate();
		  //String id = session.getId();
		  //PrintWriter out = response.getWriter();
		  
		  //out.println(id);
		  
			
			 ActionForward forward = new ActionForward();
			 
			 forward.setRedirect(false);
			 forward.setPath("index.jsp");
			
			 return forward;
			
		 
	}

}
