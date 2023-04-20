package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.owner.OwnerDAO;
import com.model.owner.OwnerDTO;

public class OwnerInfoModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		String name = request.getParameter("name").trim();
		String pwd = request.getParameter("pwd").trim();
		String ph = request.getParameter("phone").trim();
		String mail = request.getParameter("email").trim();
		
		OwnerDTO dto = new OwnerDTO();
		dto.setOwner_no(no);
		dto.setOwner_name(name);
		dto.setOwner_pwd(pwd);
		dto.setOwner_phone(ph);
		dto.setOwner_email(mail);
		int re = OwnerDAO.getInstance().updateOwnerContent(dto);
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("owner_index_move.do");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('정보 수정에 실패했습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}