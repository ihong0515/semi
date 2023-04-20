package com.action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_SiteDTO;
import com.model.user.UserDTO;

public class BoardSiteGetContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int bo_no = Integer.parseInt(request.getParameter("board_no").trim());
		UserDTO user = (UserDTO)request.getSession().getAttribute("loginUser");
		Inquiry_SiteDTO board = BoardDAO.getInstance().getSiteContent(bo_no);
		
		if(board.getInqsi_userno()==user.getUser_no()||user.getUser_no()==1) {
			request.setAttribute("Board_site", board);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/board/board_site_content.jsp");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('본인이 작성한 게시글만 열람할 수 있습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}