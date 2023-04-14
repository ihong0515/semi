package com.action.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class UserPwdContUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id").trim();
		String new_pwd = request.getParameter("repwd").trim();
		UserDAO dao = UserDAO.getInstance();
		
		int re = dao.changeUserPwd(id, new_pwd);
		if(re>0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("login/login_pwd_search.jsp");
			return forward;
		}else {
			response.getWriter().println("<script>"
					+ "alert('새로운 비밀번호 등록에 실패했습니다.');"
					+ "history.back();"
					+ "</script>");
			return null;
		}
	}
}