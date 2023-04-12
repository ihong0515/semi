package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.*;
import com.model.hotel.*;

public class BoardHotelGetContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Inquiry_HotelDTO dto = BoardDAO.getInstance().getHotelBoardContent(Integer.parseInt(request.getParameter("board_no").trim()));
		
		HotelDTO hoDto = HotelDAO.getInstance().getHotelContent(dto.getInqho_hotelno());
		
		request.setAttribute("Dto", dto);
		request.setAttribute("HoDto", hoDto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("board/board_hotel_content.jsp");
		return forward;
	}
}