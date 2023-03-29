package com.action.hotel;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;

public class HotelLowPriceSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward fowrd = new ActionForward();
		String location = request.getParameter("Location");
		
		List<HotelDTO>list = HotelDAO.getInstance().getHotelLowPriceSearch(location);
		
		request.setAttribute("hotel_LowPrice_List", list);
		
		fowrd.setRedirect(false);
		fowrd.setPath("index.jsp");
		return fowrd;
	}

}
