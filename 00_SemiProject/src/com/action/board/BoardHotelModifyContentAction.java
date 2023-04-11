package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_HotelDTO;

public class BoardHotelModifyContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int board_no = Integer.parseInt(request.getParameter("hotel_no").trim());
		String title = request.getParameter("hotel_title").trim();
		String cont = request.getParameter("hotel_content").trim();
		
		Inquiry_HotelDTO dto = new Inquiry_HotelDTO();
		dto.setInqho_no(board_no);
		dto.setInqho_title(title);
		dto.setInqho_content(cont);
		
		int re = BoardDAO.getInstance().updateHotelBoardContent(dto);
		
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("board_Get_Hotel_Content.do?board_no="+board_no);
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('수정 중 오류가 발생했습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}