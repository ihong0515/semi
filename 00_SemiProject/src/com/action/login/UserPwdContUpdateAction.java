package com.action.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class UserPwdContUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id").trim();
		String new_pwd = request.getParameter("new_pwd").trim();
		String email = request.getParameter("email").trim();
		UserDAO dao = UserDAO.getInstance();
		
		dao.deleteEmailCode(email);
		int re = dao.changeUserPwd(id, new_pwd);
		
		response.getWriter().println(re);
		return null;
	}
}