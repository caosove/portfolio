<%@page import="StockList.StockListDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   if(request.getParameter("pID")==null) {
%>
      <script type="text/javascript">
      location.href="<%=request.getContextPath()%>/this14/product/index.jsp?workgroup=product&work=product_list";
      </script>
<%      
      return;
   }

    //전달된 제품번호를 반환받아 저장
    int pID = Integer.parseInt(request.getParameter("pID"));
   
    //제품번호를 전달하여 PRODUCT 테이블에 저장된 제품정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
    ProductDTO product = ProductDAO.getDAO().getProduct(pID);
	String pname = product.getpName();
	int price = product.getpPrice();
	int count = 1;
	
	UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");	
	String uname ="janggilsan";
	String add1 ="123-456";
	String add2 = "서울시 서초구";
	String add3 = "역삼동";
	int credit = price * count;
	
	String address = add1 + add2 + add3;
	
	StockListDAO dbPro = StockListDAO.getDAO();
	
	dbPro.addBuy(uname, pname, price, credit, count, address);
%>
<script type="text/javascript">
	alert("구매내역에 추가 하였습니다.");
	history.go(-1);
</script>