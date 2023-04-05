package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserJjimAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO user_dao = UserDAO.getInstance();
		UserDTO user_dto = user_dao.getUserContent(user_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user_dto);
		
		HotelDAO hotel_dao = HotelDAO.getInstance();
		HotelDTO hotel_dto1 = hotel_dao.getHotelContent(user_dto.getUser_jjim1());
		HotelDTO hotel_dto2 = hotel_dao.getHotelContent(user_dto.getUser_jjim2());
		HotelDTO hotel_dto3 = hotel_dao.getHotelContent(user_dto.getUser_jjim3());
		
		request.setAttribute("hotel_dto1", hotel_dto1);
		request.setAttribute("hotel_dto2", hotel_dto2);
		request.setAttribute("hotel_dto3", hotel_dto3);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_jjim.jsp");
		
		return forward;
	}

}
