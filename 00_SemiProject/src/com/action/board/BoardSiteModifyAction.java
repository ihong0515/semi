package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_SiteDTO;

public class BoardSiteModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Inquiry_SiteDTO board = BoardDAO.getInstance().getSiteContent(Integer.parseInt(request.getParameter("board_no").trim()));
		
		request.setAttribute("Board_DTO", board);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/board/board_site_modify.jsp");
		return forward;
	}
}