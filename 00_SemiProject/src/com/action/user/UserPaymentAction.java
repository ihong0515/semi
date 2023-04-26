package com.action.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.PaymentDTO;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserDTO user_dto = (UserDTO)request.getSession().getAttribute("loginUser");
		UserDAO user_dao = UserDAO.getInstance();
		
		ArrayList<PaymentDTO> list = user_dao.getPaymentList(user_dto.getUser_no());
		
		request.setAttribute("pay_list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_payment.jsp");
		
		return forward;
	}
}