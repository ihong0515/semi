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

public class UserReservCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		int reserv_no = Integer.parseInt(request.getParameter("reserv_no").trim());
		
		UserDAO daoUser = UserDAO.getInstance();
		UserDTO dtoUser = daoUser.getUserContent(user_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dtoUser);
		
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
