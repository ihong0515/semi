package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;

public class BoardSiteDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int re = BoardDAO.getInstance().deleteSiteBoardContent(Integer.parseInt(request.getParameter("board_no").trim()));
		
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("user_board_main.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('삭제 중 오류가 발생했습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}