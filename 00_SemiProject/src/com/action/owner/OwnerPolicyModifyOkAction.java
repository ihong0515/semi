package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.owner.OwnerDAO;

public class OwnerPolicyModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		String[] str = {
		request.getParameter("wifi"),
		request.getParameter("park"),
		request.getParameter("tub"),
		request.getParameter("pool"),
		request.getParameter("rest"),
		request.getParameter("fit"),
		request.getParameter("bar"),
		request.getParameter("tera"),
		request.getParameter("sau")
		};
		
		int re = OwnerDAO.getInstance().updatePolicyContent(no, str);
		
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_hotel_list.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('편의기능 수정에 실패하였습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}