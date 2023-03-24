package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.hotel.model.HotelDAO;
import com.hotel.model.HotelDTO;

public class HotelStarSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward fowrd = new ActionForward();
		String location = request.getParameter("hotel_StarSearch_Location");
		
		
		HotelDAO dao = HotelDAO.getInstance();
		List<HotelDTO>list = dao.getHotelStarSearch(location);
		
		request.setAttribute("hotel_Star_List", list);
		
		fowrd.setRedirect(false);
		fowrd.setPath("include/hotel_main_content.jsp");
		return fowrd;
		
		
	}

}
