package com.action.hotel;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.*;
import com.model.board.*;
import com.model.hotel.*;

public class HotelContentAction implements Action {

	@SuppressWarnings("unchecked")
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
		
		HttpSession session = request.getSession();
		
		ArrayList<HotelDTO> visitList = null;
		
		if(session.getAttribute("VisitList")==null) {
			visitList = new ArrayList<>();
		}else {
			visitList = (ArrayList<HotelDTO>)session.getAttribute("VisitList");
		}
		
		if(visitList.size()>0) {
			for(int i = 0; i<visitList.size();i++) {
				if(visitList.get(i).getHotel_no()==hotel_no) {
					visitList.remove(i);
				}
			}
		}
		
		ArrayList<HotelDTO> realList = new ArrayList<>();
		
		realList.add(hDTO);
		
		if(visitList.size()>0) {
			for(int i = 0; i<visitList.size();i++) {
				realList.add(visitList.get(i));
			}
		}
		
		if(realList.size()>3) {
			realList.remove(3);
		}
		
		session.setAttribute("VisitList", realList);
		
		forward.setRedirect(false);
		forward.setPath("hotel/hotel_content.jsp");
		return forward;
	}
}