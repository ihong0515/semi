package com.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.*;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		UserDAO dao = UserDAO.getInstance();
		List<UserDTO> list = dao.getUserList();
		request.setAttribute("List", list);
		
		HttpSession session = request.getSession();
		session.setAttribute("id", "123");
		
		ActionForward fowrd = new ActionForward();
		
		fowrd.setRedirect(false);
		fowrd.setPath("user/user_list.jsp");
		return fowrd;
	}

}
