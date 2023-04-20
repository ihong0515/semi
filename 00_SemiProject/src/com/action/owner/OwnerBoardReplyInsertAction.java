package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.board.Inquiry_HotelDTO;
import com.model.owner.OwnerDAO;
import com.model.owner.OwnerDTO;

public class OwnerBoardReplyInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int ho_no = Integer.parseInt(request.getParameter("ho_no").trim());
		int group = Integer.parseInt(request.getParameter("group").trim());
		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		
		String title = request.getParameter("title").trim();
		String cont = request.getParameter("cont").trim();
		String ho_name = request.getParameter("ho_name").trim();
		
		OwnerDTO owner = (OwnerDTO)request.getSession().getAttribute("loginOwner");
		
		Inquiry_HotelDTO dto = new Inquiry_HotelDTO();
		
		dto.setInqho_ownerno(owner.getOwner_no());
		dto.setInqho_hotelno(ho_no);
		dto.setInqho_writer(ho_name);
		dto.setInqho_title(title);
		dto.setInqho_content(cont);
		dto.setInqho_group(group);
		dto.setInqho_userno(user_no);
		dto.setInqho_write_check("O");
		
		int re = OwnerDAO.getInstance().insertBoardReplyContent(dto);
		
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_board_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('답글 등록에 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}