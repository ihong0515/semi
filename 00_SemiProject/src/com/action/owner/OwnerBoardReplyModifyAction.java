package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_HotelDTO;

public class OwnerBoardReplyModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		Inquiry_HotelDTO dto =  BoardDAO.getInstance().getHotelBoardContent(no);
		
		request.setAttribute("Dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("owner/board/reply_modify.jsp");
		return forward;
	}
}