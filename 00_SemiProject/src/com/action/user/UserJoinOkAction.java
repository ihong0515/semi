package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String user_id = request.getParameter("id").trim();
		String user_pwd = request.getParameter("pwd").trim();
		String user_name = request.getParameter("name").trim();
		String user_phone = request.getParameter("phone").trim();
		String user_birth = request.getParameter("birth").trim();
		String user_email = request.getParameter("email").trim();
		String user_region = request.getParameter("region").trim();
		
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(user_id);
		dto.setUser_pwd(user_pwd);
		dto.setUser_name(user_name);
		dto.setUser_phone(user_phone);
		dto.setUser_birth(user_birth);
		dto.setUser_email(user_email);
		dto.setUser_region(user_region);
		
		UserDAO dao = UserDAO.getInstance();
		
		int check = dao.insertUser(dto);
		
		ActionForward forward = new ActionForward();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("user_list.do");
		} else {
			forward.setRedirect(false);
			forward.setPath("user/user_join_normal.jsp");
		}
		return forward;
	}

}
