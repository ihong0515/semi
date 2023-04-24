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
		
		UserDAO dao = UserDAO.getInstance();
		
		String checkEmail = dao.checkEmailUseable(user_email);
		if(checkEmail.equalsIgnoreCase("Y")) {
			UserDTO dto = new UserDTO();
			
			dto.setUser_id(user_id);
			dto.setUser_pwd(user_pwd);
			dto.setUser_name(user_name);
			dto.setUser_phone(user_phone);
			dto.setUser_birth(user_birth);
			dto.setUser_email(user_email);
			dto.setUser_region(user_region);
			
			int check = dao.insertUser(dto);
			
			if(check > 0) {
				dao.deleteEmailCode(user_email);
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("index.jsp");
				return forward;
			} else {
				response.getWriter().println("<script>"
						+ "alert('회원가입에 실패했습니다.');"
						+ "history.back();"
						+ "</script>");
				return null;
			}
		}else {
			response.getWriter().println("<script>"
					+ "alert('이메일 인증이 필요합니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}