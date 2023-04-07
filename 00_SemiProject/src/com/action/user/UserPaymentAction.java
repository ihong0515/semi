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

public class UserPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int user_no = Integer.parseInt(request.getParameter("no").trim());
		System.out.println(user_no);
		
		UserDAO daoUser = UserDAO.getInstance();
		UserDTO dtoUser = daoUser.getUserContent(user_no);
		PaymentDTO dtoPayment = daoUser.getPaymentContent(user_no);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dtoUser);
		request.setAttribute("dtoPayment", dtoPayment);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_payment.jsp");
		
		return forward;
	}

}
