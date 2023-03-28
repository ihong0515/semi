package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String user_id = request.getParameter("id").trim();
		String user_pwd = request.getParameter("pwd").trim();
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO cont = dao.loginUser(user_id, user_pwd);
		request.setAttribute("Content", cont);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", cont);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_myPage.jsp");
		
		return forward;
	}

}
