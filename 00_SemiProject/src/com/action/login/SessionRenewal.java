package com.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class SessionRenewal {

	public static void renewal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")!=null) {
			UserDTO dto = (UserDTO)session.getAttribute("loginUser");
			dto = UserDAO.getInstance().getUserContent(dto.getUser_no());
			session.setAttribute("loginUser", dto);
		}
	}
}