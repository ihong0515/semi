package com.action.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.user.EmailSendAction;
import com.model.user.UserDAO;

public class UserIdSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name").trim();
		String mail = request.getParameter("email").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		ArrayList<String> idList = dao.getSearchId(name, mail);
		
		if(idList.size()>0) {
			
			request.setAttribute("name", name);
			request.setAttribute("mail", mail);
			request.setAttribute("check", "1");
			
			return new EmailSendAction().execute(request, response);
		}else {
			response.getWriter().println("<script>"
					+ "alert('회원정보를 찾을 수 없습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}