package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;

public class OwnerRoomInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HotelDTO dto = HotelDAO.getInstance().getHotelContent(Integer.parseInt(request.getParameter("ho_no").trim()));
		
		request.setAttribute("Dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("owner/hotel/room_insert.jsp");
		return forward;
	}
}