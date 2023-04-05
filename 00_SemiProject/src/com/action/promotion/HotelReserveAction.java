package com.action.promotion;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.reserve.ReserveDTO;

public class HotelReserveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ReserveDTO dto = new ReserveDTO();
		
		dto.setReserv_hotelno(Integer.parseInt(request.getParameter("hotel_no").trim()));
		dto.setReserv_hotelname(request.getParameter("hotel_name").trim());
		dto.setReserv_roomno(Integer.parseInt(request.getParameter("room_no").trim()));
		dto.setReserv_roomname(request.getParameter("room_name").trim());
		dto.setReserv_userno(Integer.parseInt(request.getParameter("user_no").trim()));
		dto.setReserv_username(request.getParameter("userFirstName").trim()+request.getParameter("+userLastName").trim());
		dto.setReserv_promno(Integer.parseInt(request.getParameter("prom_no").trim()));
		dto.setReserv_coupno(Integer.parseInt(request.getParameter("coup_no").trim()));
		dto.setReserv_nomalprice(Integer.parseInt(request.getParameter("nomalPrice").trim()));
		dto.setReserv_realprice(Integer.parseInt(request.getParameter("realPrice").trim()));
		dto.setReserv_start(request.getParameter("payment_hotel_indate").trim());
		dto.setReserv_end(request.getParameter("payment_hotel_outdate").trim());
		dto.setReserv_daycount(Integer.parseInt(request.getParameter("inoutDay").trim()));
		dto.setReserv_people(Integer.parseInt(request.getParameter("reserv_people").trim()));
		dto.setReserv_request(request.getParameter("payment_hotel_userReq").trim());
		dto.setReserv_payment(Integer.parseInt(request.getParameter("card_no").trim()));
		dto.setReserv_ins(Integer.parseInt(request.getParameter("reserv_ins").trim()));
		dto.setReserv_phone(request.getParameter("userPhone_body").trim());
		
		
		
		return null;
	}
}