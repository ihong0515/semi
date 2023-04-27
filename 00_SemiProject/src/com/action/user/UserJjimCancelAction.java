package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserJjimCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserDAO dao = UserDAO.getInstance();
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		UserDTO user_dto = (UserDTO)request.getSession().getAttribute("loginUser");
		
		int res = dao.jjimCancel(user_dto.getUser_no(), hotel_no);
		
		SessionRenewal.renewal(request);
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('찜 취소되었습니다.')");
			out.println("location.href='user_jjim.do'");
			out.println("</script>");
			return null;
		} else {
			out.println("<script>");
			out.println("alert('찜 취소 실패')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
	}
}