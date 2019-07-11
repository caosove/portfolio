<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="StockList.StockListDAO"%>
<%@ page import="StockList.StockListDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page import="java.util.List"%>
<%@page import="pager.ThePager"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/this14/header.jsp" />

<!-- Font awesome -->
 <link href="css/font-awesome.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- Theme color -->
 <link id="switcher" href="css/theme-color/default-theme.css" rel="stylesheet">  
<!-- Main style sheet -->
<link href="css/style.css" rel="stylesheet"> 
<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Buy Page</title>

</head>
<body>
	
<%-- 	 <jsp:include page="header.jsp" />  --%>
	
	<!-- Cart view section -->
	<section id="cart-view">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="cart-view-area">
					<div class="cart-view-table">
						<form action="">
							<div class="table-responsive">
							<% 
							if(session.getAttribute("loginUser")==null){
								response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
								return;
							}
							UserDTO loginUser=(UserDTO)session.getAttribute("loginUser");
							String name =loginUser.getuName();
							String grade = loginUser.getuGrade();
							  DecimalFormat df = new DecimalFormat("###,###");
					 	
						
					    /* String name ="janggilsan";
						String grade = "user"; */
							 if(grade.equals("admin")){%>
							<script type="text/javascript">
							history.go(-1);										
							alert('어드민은 이용못함.');
							</script> 
							<%  }
							String search=request.getParameter("search");
							if(search==null) search="";
							String keyword=request.getParameter("keyword");
							if(keyword==null) keyword="";
							int pageNum=1;
							if(request.getParameter("pageNum")!=null) {
								pageNum=Integer.parseInt(request.getParameter("pageNum"));
							}
							int pageSize=10;
							int totalStock=StockListDAO.getDAO().getChechkTotalStock(name, grade);

							int totalPage=totalStock/pageSize+(totalStock%pageSize==0?0:1);
							
							if(pageNum<=0 || pageNum>totalPage) {
								pageNum=1;
							}
				
							int startRow=(pageNum-1)*pageSize+1;
							
							int endRow=pageNum*pageSize;
							
							if(endRow>totalStock) {
								endRow=totalStock;
							}
							
							List<StockListDTO> stockList=StockListDAO.getDAO().getcartList(name, grade, startRow, endRow, search, keyword);
							
							int number=totalStock-(pageNum-1)*pageSize;

							//<%loginUser.getuID()  - 유저아이디
							//<%loginUser.getuGrade() - 로그인한 등급
							//grade, id는 header.jsp에 있는 UserDTO loginUser=(UserDTO)session.getAttribute("loginUser");
							//참조하여 가져올수있게 변경해야함.
							
							
							List<StockListDTO> articleList = null;
							StockListDAO dbPro = StockListDAO.getDAO();
							articleList = dbPro.checkList(name, grade, startRow, endRow, search, keyword);
							%>
								<table class="table">
									<thead>	
										<tr>
											<th>주문번호</th>
											<th>주문일시</th>
											<th>상품</th>
											<th>가격</th>
											<th>수량</th>
											<th>배송지</th>
											<th>배송상태</th>
										</tr>
									</thead>
									
										<% if(totalStock==0) { %>
									<tr>
										<td colspan="8" style="text-align: center;">구매 내역이 없습니다.</td>
									</tr>
									<% } else { 
									for(StockListDTO article:articleList){ 
										ProductDTO product = ProductDAO.getDAO().SearchProduct(article.getPname());
									String date = article.getDate();
								
									
									%>
									
									<tbody>
										<tr>
											<td><%=article.getNum() %></td>
											<td><%=	date.substring(0,16) %></td>
											<td><img src="<%=request.getContextPath()%>/this14/product/images/product_image/<%=article.getPname()%>.jpg" alt="img">
											<a class="aa-cart-title"  href="<%=request.getContextPath()%>/this14/product/index.jsp?workgroup=product&work=product_detail&pID=<%=product.getpID()%>" ><%=article.getPname() %></a></td>
											<td><%=df.format(article.getCredit()) %> (원)</td>
											<td><%=article.getCount() %> (개)</td>
											<td><%=article.getAddress() %></td>
											<td><%=article.getStatus() %></td>
										</tr>
										<% }
										}%>
								</table>
							</div>
						</form>
						<%
									int blockSize=5;
									String linkUrl="Buy_List.jsp?"+"&";
									ThePager pager=new ThePager(pageNum,blockSize,totalPage,linkUrl);
								%>
								<%=pager%>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footter.jsp" />
