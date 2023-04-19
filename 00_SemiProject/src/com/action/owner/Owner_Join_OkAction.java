package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.owner.OwnerDAO;
import com.model.owner.OwnerDTO;

public class Owner_Join_OkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String owner_id = request.getParameter("owner_id").trim();
		String owner_pwd = request.getParameter("owner_pwd").trim();
		String owner_name = request.getParameter("owner_name").trim();
		String[] phone = request.getParameterValues("owner_phone");
		String owner_email = request.getParameter("owner_email").trim();
		String[] business =request.getParameterValues("owner_business");
		String owner_phone = phone[0]+"-"+phone[1]+"-"+phone[2];
		String owner_business = business[0]+"-"+business[1]+"-"+business[2];
		
		OwnerDTO dto = new OwnerDTO();
		dto.setOwner_id(owner_id);
		dto.setOwner_pwd(owner_pwd);
		dto.setOwner_name(owner_name);
		dto.setOwner_phone(owner_phone);
		dto.setOwner_email(owner_email);
		dto.setOwner_business(owner_business);
		
		OwnerDAO dao = OwnerDAO.getInstance();
		
		int check = dao.insertOwner(dto);
		
		if(check > 0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("owner_index.jsp");
			return forward;
		} else {
			response.getWriter().println("<script>"
					+ "alert('회원가입에 실패했습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}