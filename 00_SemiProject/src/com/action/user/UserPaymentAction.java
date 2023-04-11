package com.action.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.user.PaymentDTO;
import com.model.user.UserDAO;

public class UserPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int user_no = Integer.parseInt(request.getParameter("no").trim());
		
		UserDAO user_dao = UserDAO.getInstance();
		SessionRenewal.renewal(request);
		ArrayList<PaymentDTO> list = user_dao.getPaymentList(user_no);
		request.setAttribute("pay_list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_payment.jsp");
		
		return forward;
	}

}
