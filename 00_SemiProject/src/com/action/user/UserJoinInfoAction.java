package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserJoinInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward fowrd = new ActionForward();
		
		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO content = dao.getUserContent(user_no);
		request.setAttribute("Content", content);
		
		fowrd.setRedirect(false);
		fowrd.setPath("user/user_join_info.jsp");
		return fowrd;
		
	}

}
