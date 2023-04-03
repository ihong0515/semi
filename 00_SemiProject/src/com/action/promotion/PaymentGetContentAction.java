package com.action.promotion;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.PaymentDTO;
import com.model.user.UserDAO;

public class PaymentGetContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PaymentDTO dto = UserDAO.getInstance().getPaymentContent(Integer.parseInt(request.getParameter("card_no")));
		
		String str = "<payment>";
		str += "<pay_cardno>"+dto.getPay_cardno()+"</pay_cardno>"
				+ "<pay_cardcom>"+dto.getPay_cardcom()+"</pay_cardcom>";
		str += "</payment>";
		response.getWriter().println(str);
		return null;
	}
}