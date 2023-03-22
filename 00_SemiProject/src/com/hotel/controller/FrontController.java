package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.action.*;

public class FrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length()+1);
		
		String viewPage = null;
		Action action = null;
		
		
		
		if(viewPage!=null) {
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}
}