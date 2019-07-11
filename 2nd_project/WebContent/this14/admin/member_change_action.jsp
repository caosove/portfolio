<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("id")==null || request.getParameter("grade")==null){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	String uId=request.getParameter("id");
	String uGrade=request.getParameter("grade");
	
	UserDAO.getDAO().modifyUserGrade(uId, uGrade);
	
	UserDTO user=UserDAO.getDAO().getUser(uId);
	session.setAttribute("loginUser", user);
	
	response.sendRedirect(request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=member_list");
%>