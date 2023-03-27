package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.user.model.UserDAO;

public class UserMyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		dao.getUserContent(user_no);

		HttpSession session = request.getSession();
		session.setAttribute("user_no", 1);
		
		ActionForward fowrd = new ActionForward();
		fowrd.setRedirect(false);
		fowrd.setPath("user/user_info.jsp");
		
		return fowrd;
	}

}
