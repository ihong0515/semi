package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.PaymentDTO;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserModifyPaymentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		int pay_no = Integer.parseInt(request.getParameter("pay_no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO user_cont = dao.getUserContent(user_no);
		PaymentDTO pay_cont = dao.getPaymentContent(pay_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user_cont);
		request.setAttribute("dtoPayment", pay_cont);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_payment.jsp");
		return forward;
	}

}
