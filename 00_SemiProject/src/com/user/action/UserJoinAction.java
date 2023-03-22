package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UserJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String user_id = request.getParameter("id").trim();
		String user_pwd = request.getParameter("pwd").trim();
		String user_pwdCheck = request.getParameter("pwdCheck").trim();
		String user_name = request.getParameter("name").trim();
		String user_phone = request.getParameter("phone").trim();
		String user_birth = request.getParameter("birth").trim();
		String user_email = request.getParameter("email").trim();
		String user_region = request.getParameter("location").trim();
		
		UserDTO dto = new UserDTO();
		
		dto.setUserId(user_id);
		dto.setUserPwd(user_pwd);
		dto.setUserName(user_name);
		dto.setUserPhone(user_phone);
		dto.setUserBirth(user_birth);
		dto.setUserEmail(user_email);
		dto.setUserRegion(user_region);
		
		UserDAO dao = UserDAO.getInstance();
		
		int check = dao.insertUser(dto);
		
		PrintWriter out = response.getWriter();

		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원 가입 성공')");
			out.println("location.href='user/myPage.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원 가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
