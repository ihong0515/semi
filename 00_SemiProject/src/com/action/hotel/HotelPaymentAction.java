package com.action.hotel;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.model.hotel.*;
import com.model.promotion.*;
import com.model.user.*;

public class HotelPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward forward = new ActionForward();
		
		RoomDTO room = HotelDAO.getInstance().getRoomContent(Integer.parseInt(request.getParameter("room_no").trim()));
		HotelDTO hotel = HotelDAO.getInstance().getHotelContent(Integer.parseInt(request.getParameter("hotel_no").trim()));
		
		UserDTO user = (UserDTO)request.getSession().getAttribute("loginUser");
		if(user!=null) {
			ArrayList<PaymentDTO> cardList = UserDAO.getInstance().getPaymentList(user.getUser_no());
			request.setAttribute("CardList", cardList);
			
			ArrayList<CouponDTO> coupList = PromotionDAO.getInstance().getUseableCoupon(user.getUser_no());
			request.setAttribute("CoupList", coupList);
			
			List<PromotionDTO> promList = PromotionDAO.getInstance().getpromotionList();
			request.setAttribute("PromList", promList);
		}
		
		request.setAttribute("HotelDTO", hotel);
		request.setAttribute("RoomDTO", room);
		
		forward.setRedirect(false);
		forward.setPath("hotel/hotel_payment.jsp");
		return forward;
	}
}