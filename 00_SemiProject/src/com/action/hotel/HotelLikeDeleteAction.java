package com.action.hotel;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.user.UserDAO;

public class HotelLikeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int result = UserDAO.getInstance().jjimCancel(Integer.parseInt(request.getParameter("param_user_no").trim()),
				Integer.parseInt(request.getParameter("param_hotel_no").trim()));
		
		SessionRenewal.renewal(request);
		response.getWriter().println(result);
		
		return null;
	}
}