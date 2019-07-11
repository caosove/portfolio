<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("num")==null || request.getParameter("status")==null){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	String num=request.getParameter("num");
	String status=request.getParameter("status");
	
	UserDAO.getDAO().modifyorderstatus(num, status);
	
	/* UserDTO user=UserDAO.getDAO().getUser(uId);
	session.setAttribute("loginUser", user);
	 */
	response.sendRedirect(request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=order_list");
%>