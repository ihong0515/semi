package com.action.user;

import java.io.IOException;
import java.util.ArrayList;

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
		String path_check = request.getParameter("check").trim();
		
		int re = UserDAO.getInstance().checkEmailCode(user_email, code);
		if(re>0) {
			UserDAO.getInstance().updateEmailCode(user_email);
		}
		
		if(path_check.equals("user_join")) {
			response.getWriter().println(re);
			return null;
			
		}else if(path_check.equals("id_search")){
			if(re>0) {
				UserDAO dao = UserDAO.getInstance();
				String name = request.getParameter("name").trim();
				ArrayList<String> idList = dao.getSearchId(name, user_email);
				dao.deleteEmailCode(user_email);
				
				request.setAttribute("check", "2");
				request.setAttribute("id_List", idList);
				request.setAttribute("name", name);
				request.setAttribute("mail", user_email);
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/login/login_id_search.jsp");
				return forward;
				
			}else {
				response.getWriter().println("<script>"
						+ "alert('인증코드가 다릅니다.');"
						+ "history.back();"
						+ "</script>");
				return null;
			}
			
		}else if(path_check.equals("pwd_search")) {
			if(re>0) {
				UserDAO dao = UserDAO.getInstance();
				String id = request.getParameter("id").trim();
				dao.deleteEmailCode(user_email);
				
				request.setAttribute("check", "2");
				request.setAttribute("id", id);
				request.setAttribute("mail", user_email);
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/login/login_pwd_search.jsp");
				return forward;
			}else {
				response.getWriter().println("<script>"
						+ "alert('인증코드가 다릅니다.');"
						+ "history.back();"
						+ "</script>");
				return null;
			}
		}else {
			return null;
		}
	}
}