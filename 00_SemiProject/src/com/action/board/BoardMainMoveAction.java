package com.action.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.FaqCateNameDTO;
import com.model.board.FaqDTO;

public class BoardMainMoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ArrayList<FaqDTO> list = BoardDAO.getInstance().getFaqList();
		ArrayList<FaqCateNameDTO> caName = BoardDAO.getInstance().getFaqName();
		
		request.setAttribute("List", list);
		request.setAttribute("caName", caName);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("board/board_main.jsp");
		return forward;
	}
}