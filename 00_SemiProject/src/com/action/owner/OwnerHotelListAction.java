package com.action.owner;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.hotel.*;
import com.model.owner.*;

public class OwnerHotelListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		OwnerDTO owner = (OwnerDTO)request.getSession().getAttribute("loginOwner");
		
		ArrayList<HotelDTO> hotel_list = OwnerDAO.getInstance().getHotelList(owner.getOwner_no());
		
		request.setAttribute("hotel_list", hotel_list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("owner/hotel/hotel_list.jsp");
		return forward;
	}
}