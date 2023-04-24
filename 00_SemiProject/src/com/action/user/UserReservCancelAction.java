package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.user.UserDAO;

public class UserReservCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int reserv_no = Integer.parseInt(request.getParameter("reserv_no").trim());
		
		UserDAO daoUser = UserDAO.getInstance();
		
		SessionRenewal.renewal(request);
		
		int res = daoUser.getUserReservCancel(reserv_no);
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('예약이 취소되었습니다.')");
			out.println("location.href='user_reservation.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('예약 취소에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}
}