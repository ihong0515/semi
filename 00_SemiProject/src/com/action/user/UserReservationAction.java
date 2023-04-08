package com.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDTO;
import com.model.user.*;

public class UserReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO daoUser = UserDAO.getInstance();
		UserDTO dtoUser = daoUser.getUserContent(user_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dtoUser);

		List<ReserveDTO> reservList = daoUser.getReservList(user_no);
		request.setAttribute("reservList", reservList);
		
		HotelDTO dtoHotel = daoUser.getHotelContentbyUserNo(user_no);
		request.setAttribute("dtoHotelt", dtoHotel);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_reservation.jsp");
		
		return forward;
		
	}

}
