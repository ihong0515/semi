package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;

public class ReplySiteDeleteContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int re = BoardDAO.getInstance().deleteSiteReplyContent(Integer.parseInt(request.getParameter("board_no").trim()));
		response.getWriter().println(re);
		return null;
	}
}