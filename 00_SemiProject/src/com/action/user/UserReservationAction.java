package com.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.reserve.ReserveDTO;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO dto = dao.getUserContent(user_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dto);

		List<ReserveDTO> reservList = dao.getReservList(user_no);
		request.setAttribute("reservList", reservList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_reservation.jsp");
		
		return forward;
		
	}

}
