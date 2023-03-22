package com.hotel.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.model.*;

public class HotelGetAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		HotelDTO hoDTO = HotelDAO.getInstance().getHotelCont(no);
		ArrayList<RoomDTO> roomList = HotelDAO.getInstance().getRoomCont(no);
		
		request.setAttribute("hoDTO", hoDTO);
		request.setAttribute("roomList", roomList);
	}
}