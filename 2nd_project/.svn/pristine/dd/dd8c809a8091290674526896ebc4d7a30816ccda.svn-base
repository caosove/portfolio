<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginUser")==null){
		response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
		return;
	}

	session.invalidate();

	response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");


%>