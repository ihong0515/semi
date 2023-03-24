package com.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UserListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		UserDAO dao = UserDAO.getInstance();
		List<UserDTO> list = dao.getUserList();
		request.setAttribute("List", list);
		
		ActionForward fowrd = new ActionForward();
		
		fowrd.setRedirect(false);
		fowrd.setPath("user/user_list.jsp");
		return fowrd;
	}

}
