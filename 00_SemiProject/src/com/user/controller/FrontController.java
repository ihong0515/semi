package com.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.action.Action;
import com.user.action.UserJoinOkAction;
import com.user.action.UserJoinInfoAction;
import com.user.action.UserListAction;

public class FrontController extends HttpServlet {

private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length()+1);
		
		Action action = null;
		String viewPage = null;
		
		if(command.equals("user_join.uo")) {
			action = new UserJoinOkAction();
			action.execute(request, response);
			viewPage = "user/user_join_normal.jsp";
			
		} else if(command.equals("user_join_info.uo")) {
			action = new UserJoinInfoAction();
			action.execute(request, response);
			viewPage = "user/user_join_info.jsp";
			
		} else if(command.equals("user_list.uo")) {
			action = new UserListAction();
			action.execute(request, response);
			viewPage = "user/user_list.jsp";
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}
}
