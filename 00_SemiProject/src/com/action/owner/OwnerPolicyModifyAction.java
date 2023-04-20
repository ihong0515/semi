package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;
import com.model.hotel.HotelPolicyDTO;

public class OwnerPolicyModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int hotel_no = Integer.parseInt(request.getParameter("no").trim());
		HotelPolicyDTO dto = HotelDAO.getInstance().getHotelPolicyContent(hotel_no);
		HotelDTO hotel = HotelDAO.getInstance().getHotelContent(hotel_no);
		
		request.setAttribute("Hotel", hotel);
		request.setAttribute("Dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("owner/hotel/policy_modify.jsp");
		return forward;
	}
}