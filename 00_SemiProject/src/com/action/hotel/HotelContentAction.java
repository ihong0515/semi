package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.model.board.*;
import com.model.hotel.*;

public class HotelContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		
		HotelDTO hDTO = HotelDAO.getInstance().getHotelContent(hotel_no);
		HotelPolicyDTO pDTO = HotelDAO.getInstance().getHotelPolicyContent(hotel_no);
		ArrayList<RoomDTO> roomList = HotelDAO.getInstance().getRoomList(hotel_no);
		ArrayList<ReviewDTO> reviewList = ReviewDAO.getInstance().getReviewList(hotel_no);
		
		request.setAttribute("HotelDTO", hDTO);
		request.setAttribute("HPDTO", pDTO);
		request.setAttribute("RoomList", roomList);
		request.setAttribute("ReviewList", reviewList);
		
		forward.setRedirect(false);
		forward.setPath("hotel/hotel_content.jsp");
		return forward;
	}
}