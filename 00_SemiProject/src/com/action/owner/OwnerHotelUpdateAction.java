package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.*;

public class OwnerHotelUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int hotel_no = Integer.parseInt(request.getParameter("no").trim());
		
		HotelDTO dto = HotelDAO.getInstance().getHotelContent(hotel_no);
		
		request.setAttribute("Dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("owner/hotel/hotel_Modify.jsp");
		return forward;
	}
}