package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.owner.*;

public class OwnerLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("owner_id").trim();
		String pwd = request.getParameter("owner_pwd").trim();
		
		int re = OwnerDAO.getInstance().LoginCheck(id, pwd);
		
		
		if(re==1) {
			OwnerDTO dto = OwnerDAO.getInstance().getOwnerContent(id);
			request.getSession().setAttribute("loginOwner", dto);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_index_move.do");
			return forward;
		}else if(re==-1) {
			response.getWriter().println("<script>"
					+ "alert('비밀번호가 다릅니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}else {
			response.getWriter().println("<script>"
					+ "alert('회원정보가 없습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}