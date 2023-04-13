package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;
import com.model.board.*;
import com.model.hotel.*;
import com.model.user.*;

public class BoardHotelWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int u_no = Integer.parseInt(request.getParameter("user_no").trim());
		int h_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		String tit = request.getParameter("title").trim();
		String con = request.getParameter("content").trim();
		
		HotelDTO ho = HotelDAO.getInstance().getHotelContent(h_no);
		UserDTO us = UserDAO.getInstance().getUserContent(u_no);
		
		Inquiry_HotelDTO dto = new Inquiry_HotelDTO();
		
		dto.setInqho_ownerno(ho.getHotel_ownerNo());
		dto.setInqho_hotelno(h_no);
		dto.setInqho_writer(us.getUser_name());
		dto.setInqho_title(tit);
		dto.setInqho_content(con);
		dto.setInqho_userno(u_no);
		dto.setInqho_write_check("U");
		
		int re = BoardDAO.getInstance().insertBoardHotelContent(dto);
		
		response.getWriter().println(re);
		return null;
	}
}