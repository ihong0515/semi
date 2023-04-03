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
		
		String user_id = request.getParameter("user_id").trim();
		String user_pwd = request.getParameter("user_pwd").trim();
		String user_name = request.getParameter("user_name").trim();
		String user_phone = "010-"+request.getParameter("user_phone_mid").trim()+"-"+request.getParameter("user_phone_end").trim();
		String user_birth = request.getParameter("user_birth").trim();
		String user_region = request.getParameter("user_region").trim();
		String user_email = request.getParameter("user_email").trim();
		
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
