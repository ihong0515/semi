<%@page import="com.model.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String userId = request.getParameter("paramId").trim();
	
	UserDAO dao = UserDAO.getInstance();
	int res = dao.checkUserId(userId);
	
	// ajax에게 응답해주기
	out.println(res);
	
%>