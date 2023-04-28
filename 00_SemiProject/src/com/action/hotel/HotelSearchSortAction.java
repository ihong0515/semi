package com.action.hotel;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.*;

public class HotelSearchSortAction implements Action {

	@SuppressWarnings("all")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		
		String[] hotel_list = request.getParameterValues("hotel_list");
		ArrayList<HotelDTO> list = new ArrayList<HotelDTO>();
		if(hotel_list==null) {
			response.getWriter().println("<script>"
					+ "alert('정렬할 호텔 리스트가 필요합니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}else {
			for(int i =0; i<hotel_list.length;i++) {
				HotelDTO dto = HotelDAO.getInstance().getHotelContent(Integer.parseInt(hotel_list[i]));
				list.add(dto);
			}
			
			String field = request.getParameter("field");
			
			try {
				Class sortFiled = Class.forName("com.action.hotel."+field);
				Constructor constructor =  sortFiled.getConstructor();
				Collections.sort(list, (Comparator<HotelDTO>)constructor.newInstance());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("Hotel_List", list);
			
			forward.setRedirect(false);
			forward.setPath("hotel/hotel_list.jsp");
			return forward;
		}
	}
}