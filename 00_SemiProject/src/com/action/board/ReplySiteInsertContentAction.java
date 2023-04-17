package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_Site_ReplyDTO;

public class ReplySiteInsertContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int bo_no = Integer.parseInt(request.getParameter("board_no"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String cont = request.getParameter("board_cont");
		
		Inquiry_Site_ReplyDTO dto = new Inquiry_Site_ReplyDTO();
		dto.setInqre_siteno(bo_no);
		dto.setInqre_userno(user_no);
		dto.setInqre_content(cont);
		
		int re = BoardDAO.getInstance().InsertReplySiteContent(dto);
		
		response.getWriter().println(re);
		return null;
	}
}