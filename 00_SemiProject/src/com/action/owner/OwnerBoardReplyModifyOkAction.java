package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_HotelDTO;

public class OwnerBoardReplyModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		String title = request.getParameter("title").trim();
		String cont = request.getParameter("cont").trim();
		
		Inquiry_HotelDTO dto = new Inquiry_HotelDTO();
		
		dto.setInqho_no(no);
		dto.setInqho_title(title);
		dto.setInqho_content(cont);
		
		int re = BoardDAO.getInstance().updateHotelBoardContent(dto);
		
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_board_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('문의글 수정에 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}