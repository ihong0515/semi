package com.action.owner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.owner.OwnerDAO;
import com.model.user.UserDAO;

public class Owner_idcheck_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String owner_Id = request.getParameter("paramId").trim();
		OwnerDAO dao = OwnerDAO.getInstance();
		int res = dao.checkUserId(owner_Id);
		response.getWriter().println(res);
		return null;
	}

}
