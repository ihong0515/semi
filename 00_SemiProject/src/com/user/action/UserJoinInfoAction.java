package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDAO;
import com.user.model.UserDTO;

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
