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
		
		String user_name = request.getParameter("user_name").trim();
		String user_id = request.getParameter("user_id").trim();
		String user_pwd = request.getParameter("user_pwd").trim();
		String user_phone = request.getParameter("user_phone").trim();
		String user_birth = request.getParameter("user_birth").trim();
		String user_email = request.getParameter("user_email").trim();
		String user_region = request.getParameter("user_region").trim();
		
		UserDTO dto = new UserDTO();
		dto.setUser_no(user_no);
		dto.setUser_name(user_name);
		dto.setUser_id(user_id);
		dto.setUser_pwd(user_pwd);
		dto.setUser_phone(user_phone);
		dto.setUser_birth(user_birth);
		dto.setUser_email(user_email);
		dto.setUser_region(user_region);
		
		UserDAO dao = UserDAO.getInstance();
		int check = dao.updateUser(dto);
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원정보 수정 성공')");
			out.println("location.href='user_info.do?no="+dto.getUser_no()+"'");
			out.println("</script>");
		} else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("history.back()");
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
