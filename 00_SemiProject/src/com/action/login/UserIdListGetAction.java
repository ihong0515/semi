package com.action.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class UserIdListGetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email").trim();
		String name = request.getParameter("name").trim();
		UserDAO dao = UserDAO.getInstance();
		ArrayList<String> list = dao.getSearchId(name, email);
		
		String str = "<idList>";
		for(String s : list) {
			str += "<dto>";
			str += "<id>"+s+"</id>";
			str += "</dto>";
		}
		str += "</idList>";
		
		dao.deleteEmailCode(email);
		response.getWriter().println(str);
		return null;
	}

}
