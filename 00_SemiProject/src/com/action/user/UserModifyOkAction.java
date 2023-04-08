package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		String user_phone = "010-" + request.getParameter("user_phone_mid").trim() + "-" + request.getParameter("user_phone_end").trim();
		String user_birth = request.getParameter("user_birth").trim();
		String user_region = request.getParameter("user_region").trim();
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO dto = dao.getUserContent(user_no);
		dto.setUser_no(user_no);
		dto.setUser_phone(user_phone);
		dto.setUser_birth(user_birth);
		dto.setUser_region(user_region);
		
		int check = dao.updateUser(dto);
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원정보 수정 성공')");
			out.println("location.href='user_info.do?no="+dto.getUser_no()+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원정보 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}
}
