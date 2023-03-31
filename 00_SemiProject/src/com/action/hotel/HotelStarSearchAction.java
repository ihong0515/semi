package com.action.hotel;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;

public class HotelStarSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		String location = request.getParameter("Location");
		
		List<HotelDTO>list = HotelDAO.getInstance().getHotelStarSearch(location);
		HttpSession session = request.getSession();
		session.setAttribute("hotel_Star_List", list);
		request.setAttribute("hotel_Star_List", list);
		
		forward.setRedirect(false);
		forward.setPath("index.jsp");
		return forward;
	}
}