package com.action.hotel;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;

public class HotelIndexSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String location = request.getParameter("param");
		String type = request.getParameter("search");
		String list = "";
		PrintWriter out = response.getWriter();
		if(type.equals("Starlocation")) {
			list = HotelDAO.getInstance().getHotelStarSearch(location);
		}else {
			list = HotelDAO.getInstance().getHotelLowPriceSearch(location);
		}
		out.println(list);
		return null;
	}
}