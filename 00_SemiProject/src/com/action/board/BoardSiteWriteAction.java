package com.action.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.BoardDAO;
import com.model.board.Inquiry_SiteDTO;

public class BoardSiteWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String inqsi_title = request.getParameter("title").trim();
		String inqsi_content = request.getParameter("content").trim();
		
		Inquiry_SiteDTO dto = new Inquiry_SiteDTO();
		
		dto.setInqsi_title(inqsi_title);
		dto.setInqsi_content(inqsi_content);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int check = dao.insertSite(dto);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('1:1 문의글 등록 완료')");
			out.println("</script>");
			forward.setRedirect(true);
			forward.setPath("board_site_write.do");
		}else {
			out.println("<script>");
			out.println("alert('1:1 문의글 등록 실패')");
			out.println("</script>");
			forward.setRedirect(false);
			forward.setPath("board/board_site_write.jsp");
		}
		return forward;
	}

}
