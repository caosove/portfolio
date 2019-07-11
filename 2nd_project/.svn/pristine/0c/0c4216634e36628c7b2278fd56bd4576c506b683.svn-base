<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보 입력 페이지(product_add.jsp)에서 입력되어 전달된 제품정보를 
반환받아 PRODUCT 테이블에 저장하고 제품 목록 페이지(product_list.jsp)로 
이동하는 JSP 문서 --%>    
<%
   	if(request.getMethod().equals("GET")) {
   		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
   		return;
   	}

   	//업로드 파일(제품이미지)를 저장하기 위한 디렉토리의 실제 경로를 반환받아 저장
   	String saveDirectory = request.getServletContext().getRealPath("/this14/product/images/product_image");
   	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "UTF-8", new DefaultFileRenamePolicy());

   	String pType = mr.getParameter("pType");
   	String pName = mr.getParameter("pName");
   	String pCategory = mr.getParameter("pCategory");
   	String pExp = mr.getParameter("pExp");
   	int pPrice = Integer.parseInt(mr.getParameter("pPrice"));
   	String pImage = mr.getFilesystemName("pImage");   
   	String pStatus = mr.getParameter("pStatus");
   	
   	ProductDTO product = new ProductDTO();
   	product.setpType(pType);
   	product.setpName(pName);
   	product.setpCategory(pCategory);
   	product.setpExp(pExp);
   	product.setpPrice(pPrice);
   	product.setpImage(pImage);
   	product.setpStatus(pStatus);
   	
   	/* if (ProductDAO.getDAO().isProduct(pID)) {//이미 저장된 제품인 경우
		//자동 업로드된 이미지파일(제품이미지) 제거
		new File(saveDirectory,pImage).delete();
		session.setAttribute("message", "이미 등록된 제품입니다.(제품코드 중복)");
		session.setAttribute("product", product);
		response.sendRedirect(request.getContextPath()+"/This3_product/index.jsp?workgroup=admin&work=product_add");
		return;
	} */
   	
	ProductDAO.getDAO().addProdType(product);
   	
   	response.sendRedirect(request.getContextPath() + "/this14/admin/indexAdmin.jsp?work=product_list");
%>