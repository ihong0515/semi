package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.PaymentDTO;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserInsertPaymentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserDTO user_dto = (UserDTO)request.getSession().getAttribute("loginUser");
		
		String pay_name = request.getParameter("pay_name").trim();
		String pay_cardno = request.getParameter("pay_cardno1")+"-"+request.getParameter("pay_cardno2")+"-"+request.getParameter("pay_cardno3")+"-"+request.getParameter("pay_cardno4");
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
		int res = daoUser.insertPayment(dto, user_dto.getUser_no());
		
		if(res > 0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("user_payment.do");
			return forward;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('결제수단 등록에 실패하였습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
	}
}