package com.action.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class UserIdSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name").trim();
		String mail = request.getParameter("mail").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		ArrayList<String> idList = dao.getSearchId(name, mail);
		
		response.getWriter().println(idList.size());
		return null;
	}

}
