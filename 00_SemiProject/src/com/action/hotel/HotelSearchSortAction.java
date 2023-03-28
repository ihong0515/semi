package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;

public class HotelSearchSortAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward fowrd = new ActionForward();
		
		String hotel_location = request.getParameter("hotel_location").trim();
		String hotel_checkinDate = request.getParameter("hotel_checkinDate").trim();
		String hotel_checkoutDate = request.getParameter("hotel_checkoutDate").trim();
		String hotel_keyword = request.getParameter("hotel_keyword").trim();
		String hotel_field = request.getParameter("field").trim();

		System.out.println(hotel_checkinDate);
		System.out.println(hotel_checkoutDate);

		ArrayList<HotelDTO> list = HotelDAO.getInstance().getHotelListSort(hotel_location, hotel_keyword, hotel_checkinDate, hotel_checkoutDate, hotel_field);
	
		request.setAttribute("List", list);
		request.setAttribute("hotel_location", hotel_location);
		request.setAttribute("hotel_checkinDate", hotel_checkinDate);
		request.setAttribute("hotel_checkoutDate", hotel_checkoutDate);
		request.setAttribute("hotel_keyword", hotel_keyword);
		
		fowrd.setRedirect(false);
		fowrd.setPath("hotel/hotel_list.jsp");
		return fowrd;
	}

}
