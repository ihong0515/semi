package com.action.hotel;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.RoomDTO;

public class HotelPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		
		RoomDTO room = HotelDAO.getInstance().getRoomCont(Integer.parseInt(request.getParameter("room_no").trim()));
		String hn = request.getParameter("hotel_name");
		
		request.setAttribute("hotel_name", hn);
		request.setAttribute("room", room);
		
		forward.setRedirect(false);
		forward.setPath("hotel/hotel_payment.jsp");
		return forward;
	}

}
