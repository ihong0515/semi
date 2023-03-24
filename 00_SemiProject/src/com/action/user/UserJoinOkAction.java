package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UserJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward fowrd = new ActionForward();
		
		UserDTO dto = new UserDTO();
		UserDAO dao = UserDAO.getInstance();
		
		String user_id = request.getParameter("id").trim();
		String user_pwd = request.getParameter("pwd").trim();
		String user_name = request.getParameter("name").trim();
		String user_phone = request.getParameter("phone").trim();
		String user_birth = request.getParameter("birth").trim();
		String user_email = request.getParameter("email").trim();
		String user_region = request.getParameter("location").trim();
		
		dto.setUser_id(user_id);
		dto.setUser_pwd(user_pwd);
		dto.setUser_name(user_name);
		dto.setUser_phone(user_phone);
		dto.setUser_birth(user_birth);
		dto.setUser_email(user_email);
		dto.setUser_egion(user_region);
		
		int check = dao.insertUser(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원 등록 성공')");
			out.println("location.href='user_join_info.uo'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		fowrd.setRedirect(false);
		fowrd.setPath("user/user_join_nomal.jsp");
		return fowrd;

	}

}
