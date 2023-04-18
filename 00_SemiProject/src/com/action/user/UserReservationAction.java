package com.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.hotel.HotelDTO;
import com.model.user.*;

public class UserReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO daoUser = UserDAO.getInstance();
		
		SessionRenewal.renewal(request);

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