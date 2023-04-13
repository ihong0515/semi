package com.action.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;
import com.model.user.UserDTO;

public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String user_id = request.getParameter("id").trim();
		String user_pwd = request.getParameter("pwd").trim();
		UserDAO dao = UserDAO.getInstance();
		
		int idCheck = dao.checkUserId(user_id);
		if(idCheck==-1) {
			int pwdCheck = dao.checkPwd(user_pwd);
			if(pwdCheck==1) {
				UserDTO cont = dao.loginUser(user_id, user_pwd);
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", cont);
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("index.jsp");
				return forward;
			}else { //pwd 틀림
				response.getWriter().println("<script>"
						+ "alert('패스워드가 틀립니다.');"
						+ "history.back();"
						+ "</script>");
				return null;
			}
		}else { //ID 없음.
			response.getWriter().println("<script>"
					+ "alert('ID를 찾을 수 없습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}