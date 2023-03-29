package com.action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionForward;

public class UserModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_modify.jsp");
		
		return forward;
	}

}
