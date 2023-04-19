package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.hotel.HotelPolicyDTO;

public class OwnerHotelPolicyGetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		HotelPolicyDTO dto = HotelDAO.getInstance().getHotelPolicyContent(no);
		HotelDTO hotel = HotelDAO.getInstance().getHotelContent(no);
		request.setAttribute("Dto", dto);
		request.setAttribute("Hotel", hotel);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("owner/hotel/hotel_policy.jsp");
		return forward;
	}
}