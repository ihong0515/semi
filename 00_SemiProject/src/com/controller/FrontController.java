package com.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.*;

public class FrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	@SuppressWarnings("all")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length()+1);
		
		Action action = null;
		ActionForward forward = null;
		Properties prop = new Properties();
		System.out.println();
		
		String propertiesPath = request.getServletContext().getRealPath("\\WEB-INF\\classes\\com\\controller\\mapping.properties");
		FileInputStream fis = new FileInputStream(propertiesPath);

		prop.load(fis);
		
		String value = prop.getProperty(command);
		
		if(value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			st.nextToken(); 
			String url_2 = st.nextToken(); 
			try {
				Class url = Class.forName(url_2);
				Constructor constructor =  url.getConstructor();
				action = (Action)constructor.newInstance();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				request.getRequestDispatcher(forward.getPath()).forward(request, response);
			}
		}
	}
}