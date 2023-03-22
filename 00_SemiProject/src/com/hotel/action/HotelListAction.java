package com.hotel.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HotelListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String hotel_location = request.getParameter("location");
		String hotel_checkinDate = request.getParameter("checkinDate");
		String hotel_checkoutDate = request.getParameter("checkoutDate");
		String hotel_keyword = request.getParameter("keyword");
	
		PrintWriter out = response.getWriter();
		
		out.println(hotel_location);
		out.println(hotel_checkinDate);
		out.println(hotel_checkoutDate);
		out.println(hotel_keyword);
	}
}