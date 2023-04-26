package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class UserQuitOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String user_pwd = request.getParameter("user_pwd");
		
		UserDAO dao = UserDAO.getInstance();
		
		int check = dao.quitUser(user_no, user_pwd);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('탈퇴가 완료되었습니다.')");
			out.println("location.href='index_move.do'");
			out.println("</script>");
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 탈퇴에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}
}