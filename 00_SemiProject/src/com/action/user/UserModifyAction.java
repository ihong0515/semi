package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int user_no = Integer.parseInt(request.getParameter("no").trim());
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.getUserContent(user_no);
		request.setAttribute("Modify", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_modify.jsp");
		
		return forward;
	}

}
