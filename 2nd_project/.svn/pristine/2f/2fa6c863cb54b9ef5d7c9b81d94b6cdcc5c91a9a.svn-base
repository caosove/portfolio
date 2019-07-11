<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (request.getParameter("pID") == null) {	
		response.sendRedirect(request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=product_list");
		return;
	}
	
	int pID = Integer.parseInt(request.getParameter("pID"));
	/* new File(request.getServletContext().getRealPath("/this14/admin/images/product_image")
				, ProductDAO.getDAO().getProduct(pID).getpImage()).delete(); */
	ProductDAO.getDAO().removeProduct(pID);	
	
	response.sendRedirect(request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=product_list");
%>