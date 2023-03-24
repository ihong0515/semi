package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.hotel.model.HotelDAO;
import com.hotel.model.HotelDTO;

public class HotelSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward fowrd = new ActionForward();
		
		String hotel_location = request.getParameter("location");
		String hotel_checkinDate = request.getParameter("checkinDate");
		String hotel_checkoutDate = request.getParameter("checkoutDate");
		String hotel_keyword = request.getParameter("keyword");
		
		ArrayList<HotelDTO> list = HotelDAO.getInstance().getHotelList(hotel_location, hotel_keyword, hotel_checkinDate, hotel_checkoutDate);
	
		request.setAttribute("List", list);
		
		fowrd.setRedirect(false);
		fowrd.setPath("hotel/hotel_List.jsp");
		return fowrd;
	}
}