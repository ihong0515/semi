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

		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO dto = dao.getUserContent(user_no);
		
		SessionRenewal.renewal(request);
		
		int res = dao.jjimCancel(user_no, hotel_no);
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('찜 취소되었습니다.')");
			out.println("location.href='user_jjim.do?no="+dto.getUser_no()+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('찜 취소 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
