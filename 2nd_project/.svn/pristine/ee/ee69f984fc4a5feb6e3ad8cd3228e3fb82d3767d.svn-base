
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	String[] checkId=request.getParameterValues("checkId");
	
	for(String uId:checkId){
		UserDAO.getDAO().modifyUserGrade(uId, "leave");
	}
	
	response.sendRedirect(request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=member_list");
%>