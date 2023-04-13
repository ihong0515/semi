package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class EmailCodeCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//check_code, email 파라미터를 통해 인증코드가 일치하는지 여부 확인 / ajax 리턴
		String code = request.getParameter("check_code").trim();
		String user_email = request.getParameter("email").trim();
		
		int re = UserDAO.getInstance().checkEmailCode(user_email, code);
		if(re>0) {
			UserDAO.getInstance().updateEmailCode(user_email);
		}
		response.getWriter().println(re);
		
		return null;
	}
}