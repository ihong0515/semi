package com.action.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_SiteDTO;
import com.model.user.UserDTO;

public class BoardSiteWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String inqsi_title = request.getParameter("board_title").trim();
		String inqsi_content = request.getParameter("board_content").trim();
		UserDTO user = (UserDTO)request.getSession().getAttribute("loginUser");
		
		Inquiry_SiteDTO dto = new Inquiry_SiteDTO();
		
		dto.setInqsi_title(inqsi_title);
		dto.setInqsi_content(inqsi_content);
		dto.setInqsi_userno(user.getUser_no());
		dto.setInqsi_writer(user.getUser_name());
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int check = dao.insertBoardSiteContent(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("user_board_main.do");
			return forward;
		}else {
			out.println("<script>");
			out.println("alert('1:1 문의글 등록 실패');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
	}
}