package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.owner.OwnerDAO;

public class OwnerHotelDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());

		int re = OwnerDAO.getInstance().deleteHotelContent(no);
		
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_hotel_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('등록 호텔 삭제를 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}