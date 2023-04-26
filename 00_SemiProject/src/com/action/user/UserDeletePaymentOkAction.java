package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.action.login.SessionRenewal;
import com.model.user.UserDAO;

public class UserDeletePaymentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pay_no = Integer.parseInt(request.getParameter("pay_no").trim());
		
		UserDAO dao = UserDAO.getInstance();
		int res = dao.deletePayment(pay_no);
		PrintWriter out = response.getWriter();
		
		SessionRenewal.renewal(request);

		if(res > 0) {
			out.println("<script>");
			out.println("alert('해당 결제수단이 삭제 되었습니다.')");
			out.println("location.href='user_payment.do'");
			out.println("</script>");
		} else if(res == -1) {
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}
}
