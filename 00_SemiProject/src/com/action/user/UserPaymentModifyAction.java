package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.user.PaymentDTO;
import com.model.user.UserDAO;

public class UserPaymentModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int pay_no = Integer.parseInt(request.getParameter("pay_no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		PaymentDTO pay_cont = dao.getPaymentContent(pay_no);
		
		SessionRenewal.renewal(request);
		request.setAttribute("dtoPayment", pay_cont);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_paymentModify.jsp");
		return forward;
		
	}

}
