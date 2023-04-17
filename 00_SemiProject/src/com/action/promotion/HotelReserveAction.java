package com.action.promotion;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.ReserveDTO;
import com.model.user.UserDAO;

public class HotelReserveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String phonebody = request.getParameter("userPhone_body").trim();
		
		ReserveDTO dto = new ReserveDTO();
		
		dto.setReserv_hotelno(Integer.parseInt(request.getParameter("hotel_no").trim()));
		dto.setReserv_hotelname(request.getParameter("hotel_name").trim());
		dto.setReserv_roomno(Integer.parseInt(request.getParameter("room_no").trim()));
		dto.setReserv_roomname(request.getParameter("room_name").trim());
		dto.setReserv_userno(Integer.parseInt(request.getParameter("user_no").trim()));
		dto.setReserv_username(request.getParameter("userFirstName").trim()+request.getParameter("userLastName").trim());
		if(request.getParameter("prom_no").trim()!="") {
			dto.setReserv_promno(Integer.parseInt(request.getParameter("prom_no").trim()));
			dto.setReserv_coupno(Integer.parseInt(request.getParameter("coup_no").trim()));
		}
		dto.setReserv_nomalprice(Integer.parseInt(request.getParameter("nomalPrice").trim()));
		dto.setReserv_realprice(Integer.parseInt(request.getParameter("realPrice").trim()));
		dto.setReserv_start(request.getParameter("payment_hotel_indate").trim());
		dto.setReserv_end(request.getParameter("payment_hotel_outdate").trim());
		dto.setReserv_daycount(Integer.parseInt(request.getParameter("inoutDay").trim()));
		dto.setReserv_people(Integer.parseInt(request.getParameter("reserv_people").trim()));
		dto.setReserv_request(request.getParameter("payment_hotel_userReq").trim());
		dto.setReserv_payment(Integer.parseInt(request.getParameter("card_no").trim()));
		dto.setReserv_ins(Integer.parseInt(request.getParameter("reserv_ins").trim()));
		dto.setReserv_phone(request.getParameter("userPhone_head")+"-"+phonebody.substring(0,4)+"-"+phonebody.substring(4));
		System.out.println(dto.getReserv_phone());

		int re = UserDAO.getInstance().insertReservContent(dto);
		if(re>0) {
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("index.jsp");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('결제 오류 발생!!');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}