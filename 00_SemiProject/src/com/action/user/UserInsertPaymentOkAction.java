package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.PaymentDTO;
import com.model.user.UserDAO;

public class UserInsertPaymentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		System.out.println("user_no : "+ user_no);
		
		String pay_name = request.getParameter("pay_name").trim();
		int pay_cardno = Integer.parseInt(request.getParameter("pay_cardno").trim());
		String pay_cardcom = request.getParameter("pay_cardcom").trim();
		int pay_cvc = Integer.parseInt(request.getParameter("pay_cvc").trim());
		String pay_pwd = request.getParameter("pay_pwd").trim();
		String pay_date = request.getParameter("pay_date").trim();

		PaymentDTO dto = new PaymentDTO();
		
		dto.setPay_name(pay_name);
		dto.setPay_cardno(pay_cardno);
		dto.setPay_cardcom(pay_cardcom);
		dto.setPay_cvc(pay_cvc);
		dto.setPay_pwd(pay_pwd);
		dto.setPay_date(pay_date);

		UserDAO daoUser = UserDAO.getInstance();
		int res = daoUser.insertPayment(dto, user_no);
		ActionForward forward = new ActionForward();
		
		if(res > 0) {
			forward.setRedirect(false);
			forward.setPath("user_payment.do");
		} else {
			forward.setRedirect(false);
			forward.setPath("user/user_insertPayment.jsp");
		}
		return forward;
	}

}
