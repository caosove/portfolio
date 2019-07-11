<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="StockList.StockListDAO"%>
<%@ page import="StockList.StockListDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page import="java.util.List"%>

<%
   if(request.getParameter("pID")==null) {
%>
      <script type="text/javascript">
      location.href="<%=request.getContextPath()%>/this14/product/index.jsp?workgroup=product&work=product_list";
      </script>
<%      
      return;
   }

   if(session.getAttribute("loginUser")==null) {
%>
      <script type="text/javascript">
      location.href="<%=request.getContextPath()%>/this14/product/index.jsp";
      </script>
<%      
      return;
   }

   //전달된 제품번호를 반환받아 저장
   int pID = Integer.parseInt(request.getParameter("pID"));
   
   //제품번호를 전달하여 PRODUCT 테이블에 저장된 제품정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
   ProductDTO product = ProductDAO.getDAO().getProduct(pID);
   String pName = product.getpName();
	
	UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
	
 	int sts = Integer.parseInt(request.getParameter("sts"));
	StockListDAO dbPro = StockListDAO.getDAO();
	
 	String uname = loginUser.getuName();
	//String add1 = loginUser.getuPost();
	String add2 = loginUser.getuAbasic();
	String add3 = loginUser.getuAdetail();

	String address =  add2 +" "+ add3; 
	
	if (sts == 1) {
		String pname = product.getpName();
		int price = product.getpPrice();
		int count = 1;

		dbPro.addCart(uname, pname, price, count, address); 

	} else if (sts ==3) {
		String pname = request.getParameter("pName");
		int price = Integer.parseInt(request.getParameter("pPrice"));
		int count = Integer.parseInt(request.getParameter("pCount"));
		
		dbPro.addCart(uname, pname, price, count, address);
	
	} 
%>
<script type="text/javascript">

	history.go(-1);
</script>
