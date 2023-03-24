package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.hotel.model.*;

public class HotelContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward fowrd = new ActionForward();
		
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		
		HotelDTO hDTO = HotelDAO.getInstance().getHotelContent(hotel_no);
		HotelPolicyDTO pDTO = HotelDAO.getInstance().getHotelPolicyContent(hotel_no);
		ArrayList<RoomDTO> roomList = HotelDAO.getInstance().getRoomCont(hotel_no);
		
		request.setAttribute("HotelDTO", hDTO);
		request.setAttribute("HPDTO", pDTO);
		request.setAttribute("RoomList", roomList);
		
		fowrd.setRedirect(false);
		fowrd.setPath("hotel/hotel_content.jsp");
		return fowrd;
	}
}