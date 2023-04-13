package com.action.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class UserPwdContGetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email").trim();
		String id = request.getParameter("id").trim();
		UserDAO dao = UserDAO.getInstance();
		
		int re = dao.getSearchPwd(id, email);
		
		dao.deleteEmailCode(email);
		response.getWriter().println(re);
		return null;
	}
}