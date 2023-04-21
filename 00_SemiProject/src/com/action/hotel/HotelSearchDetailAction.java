package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.model.hotel.*;

public class HotelSearchDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		
		int price_min = Integer.parseInt(request.getParameter("price_min").trim());
		int price_max = Integer.parseInt(request.getParameter("price_max").trim());
		String[] list = null;
		String point = null;
		String bed = null;
		int people = 0;
		if(request.getParameter("number_people")!="") {
			people = Integer.parseInt(request.getParameter("number_people").trim());
		}
		if(request.getParameterValues("star")!=null) {
			list = request.getParameterValues("star");
		}
		if(request.getParameter("point")!=null) {
			point = request.getParameter("point").trim();
		}if(request.getParameter("bed")!=null) {
			bed = request.getParameter("bed").trim();
		}
		
		ArrayList<HotelDTO> detail_List = HotelDAO.getInstance().getHotelDetailList(price_min, price_max, people, list, point);
		
		if(bed!=null) {
			ArrayList<HotelDTO> realList = new ArrayList<HotelDTO>();
			
			ArrayList<Integer> bedlist = HotelDAO.getInstance().getHotelBedList(bed);
			
			for(HotelDTO d : detail_List) {
				for(int b : bedlist) {
					if(d.getHotel_no() == b) {
						realList.add(d);
					}
				}
			}
			request.setAttribute("Hotel_List", realList);
			
			forward.setRedirect(false);
			forward.setPath("hotel/hotel_list.jsp");
			return forward;
		}else {
			request.setAttribute("Hotel_List", detail_List);
			
			forward.setRedirect(false);
			forward.setPath("hotel/hotel_list.jsp");
			return forward;
		}
	}
}