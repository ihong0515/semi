package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class UserPayNameCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String payName = request.getParameter("paramPayName").trim();
		UserDAO dao = UserDAO.getInstance();
		int res = dao.checkPayName(payName);
		response.getWriter().println(res);
		return null;
	}

}
