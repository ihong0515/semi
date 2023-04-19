package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_HotelDTO;
import com.model.hotel.HotelDAO;
import com.model.hotel.HotelDTO;

public class OwnerBoardGetContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int bo_no = Integer.parseInt(request.getParameter("no").trim());
		
		Inquiry_HotelDTO dto = BoardDAO.getInstance().getHotelBoardContent(bo_no);
		HotelDTO hotel = HotelDAO.getInstance().getHotelContent(dto.getInqho_hotelno());
		
		request.setAttribute("Dto", dto);
		request.setAttribute("Hotel", hotel);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("owner/board/board_content.jsp");
		return forward;
	}
}