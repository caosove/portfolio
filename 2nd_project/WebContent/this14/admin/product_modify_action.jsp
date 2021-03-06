<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	String saveDirectory = request.getServletContext().getRealPath("/this14/admin/images/product_image");
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	int pID = Integer.parseInt(mr.getParameter("pID"));
	String currentImage = mr.getParameter("currentImage");
	String pName = mr.getParameter("pName");
	String pCategory = mr.getParameter("pCategory");
 	String pExp = mr.getParameter("pExp");
	int pPrice = Integer.parseInt(mr.getParameter("pPrice"));
	int pInv = Integer.parseInt(mr.getParameter("pInv"));
	String pImage = mr.getFilesystemName("pImage");
	String pStatus = mr.getParameter("pStatus");
	
	ProductDTO product = new ProductDTO();
	product.setpID(pID);
	product.setpName(pName);
	product.setpCategory(pCategory);
	product.setpExp(pExp);
	product.setpPrice(pPrice);
	product.setpInv(pInv);
	if (pImage != null) {
		product.setpImage(pImage);
		new File(saveDirectory, currentImage).delete();
	} else {
		product.setpImage(currentImage);
	};
	product.setpStatus(pStatus);
	
	ProductDAO.getDAO().modifyProduct(product);
	
	response.sendRedirect(request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=product_detail&pID=" + pID);
	
%>