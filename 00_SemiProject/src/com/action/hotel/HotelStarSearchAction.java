package com.action.hotel;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;


public class HotelStarSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//ActionForward forward = new ActionForward();
		String location = request.getParameter("Location");
		PrintWriter out = response.getWriter();
		String list = HotelDAO.getInstance().getHotelStarSearch(location);
		out.println(list);
		//HttpSession session = request.getSession();
		//session.setAttribute("hotel_Star_List", list);
		//request.setAttribute("hotel_Star_List", list);
		
		//forward.setRedirect(false);
		//forward.setPath("index.jsp");
		return null;
	}
}