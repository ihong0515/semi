package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class DbCheckIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String user_id = request.getParameter("user_id");
		
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(user_id);
		
		UserDAO dao = UserDAO.getInstance();
		
		int result = dao.selectAllId(user_id);
		
		ActionForward forwd = new ActionForward();
		
		if(result > 0) { 
			forwd.setRedirect(true);
			forwd.setPath("user_list.do");
		} else if(result == 0) {
			forwd.setRedirect(true);
			forwd.setPath("user_list.do");
		} else { 
			forwd.setRedirect(true);
			forwd.setPath("user_list.do");
		}
		
		return null;
	}

}
