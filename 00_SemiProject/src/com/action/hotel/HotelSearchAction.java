package com.action.hotel;

import java.io.IOException;
import java.util.*;

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
		
		ArrayList<HotelDTO> hotel_list = HotelDAO.getInstance().getHotelList(hotel_location, hotel_keyword, hotel_checkinDate, hotel_checkoutDate);
		
		request.setAttribute("Hotel_List", hotel_list);
		request.setAttribute("Hotel_location", hotel_location);
		request.setAttribute("Hotel_keyword", hotel_keyword);
		
		//checkDate setting
		ArrayList<Date> checkdate = new ArrayList<>();
		
		StringTokenizer stin = new StringTokenizer(hotel_checkinDate,"-");
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, Integer.parseInt(stin.nextToken()));
		cal.set(Calendar.MONTH, Integer.parseInt(stin.nextToken())-1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(stin.nextToken()));
		Date indate = cal.getTime();
		StringTokenizer stout = new StringTokenizer(hotel_checkoutDate,"-");
		
		cal.set(Calendar.YEAR, Integer.parseInt(stout.nextToken()));
		cal.set(Calendar.MONTH, Integer.parseInt(stout.nextToken())-1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(stout.nextToken()));
		Date outdate = cal.getTime();
		
		checkdate.add(indate);
		checkdate.add(outdate);
		request.getSession().setAttribute("CheckDate", checkdate);
		
		forwrd.setRedirect(false);
		forwrd.setPath("hotel/hotel_list.jsp");
		return forwrd;
	}
}