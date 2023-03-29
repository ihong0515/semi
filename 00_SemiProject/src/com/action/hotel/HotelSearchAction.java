package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;

public class HotelSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forwrd = new ActionForward();
		
		String hotel_location = request.getParameter("location").trim();
		String hotel_checkinDate = request.getParameter("checkinDate").trim();
		String hotel_checkoutDate = request.getParameter("checkoutDate").trim();
		String hotel_keyword = request.getParameter("keyword").trim();
		
		ArrayList<HotelDTO> list = HotelDAO.getInstance().getHotelList(hotel_location, hotel_keyword, hotel_checkinDate, hotel_checkoutDate);
	
		request.setAttribute("List", list);
		request.setAttribute("hotel_location", hotel_location);
		request.setAttribute("hotel_checkinDate", hotel_checkinDate);
		request.setAttribute("hotel_checkoutDate", hotel_checkoutDate);
		request.setAttribute("hotel_keyword", hotel_keyword);
		
		forwrd.setRedirect(false);
		forwrd.setPath("hotel/hotel_list.jsp");
		return forwrd;
	}
}