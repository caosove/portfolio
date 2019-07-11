<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="StockList.StockListDAO"%>
<%@ page import="StockList.StockListDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<%-- <jsp:include page="header.jsp" /> --%>

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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Checkout Page </title>
<% request.setCharacterEncoding("utf-8");%>
</head>
<%if(request.getParameter("sts")==null || session.getAttribute("loginUser")==null){
	response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
	return;
} 

%>
<%int sts = Integer.parseInt(request.getParameter("sts"));

UserDTO loginUser=(UserDTO)session.getAttribute("loginUser");

//System.out.println(sts);%>

<body>
<jsp:include page="/this14/header.jsp" />
<Script type="text/javascript">

	    function chk_radio(){
	            alert('결제되었습니다.');
	    }

</Script>

	<!-- Cart view section -->
	<section id="checkout">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="checkout-area">
						<form method ="post" action="CheckUpdate.jsp?&sts=<%=sts%>"  id=myform onSubmit="chk_radio();">
							<div class="row">
								<div class="col-md-12">
									<div class="checkout-left">
										<div class="panel-group" id="accordion">

										<div class="checkout-right">
										
												<div class="aa-order-summary-area">
													<% 
													
													
													
													String name =loginUser.getuName();
													String grade = loginUser.getuGrade();
													//System.out.println(name + grade);
													String add1 ="["+loginUser.getuPost()+"] ";
													String add2 =loginUser.getuAbasic();
													String add3 =loginUser.getuAdetail(); 
													String address = add1+"  "+add2+"  "+add3;
													String phone = loginUser.getuPhone();
													/* String name = "janggilsan";
													String grade = "user"; */
													   int Ccredit=0;
													   int Ccount=0;
													   String Cpname = "";
													   int Cprice =0;
													   int AC = 0;
													   int Cpknum=0;
													   DecimalFormat df = new DecimalFormat("###,###");
													/* 	List<StockListDTO> articleList = null;
														StockListDAO dbPro = StockListDAO.getDAO();
														articleList = dbPro.getArticles(grade, id); */
													%>
													<h4>배송지 정보 </h4>
													<table class="table table-responsive">
														<thead>
															<tr>
																<th>주문자</th>
																<th>배송지</th>
																<th>연락처</th>
															</tr>
														</thead>
														<tbody>
														<tr>
															<td> <%=name %> </td>
															<td> <%=address %></td>
															<td> <%=phone %></td>
														</tr>	
														</tbody>
													</table>
													
															<h4>구매 품목</h4>
													<table class="table table-responsive">
														<thead>
															<tr>
																<th>상품</th>
																<th>가격</th>
															</tr>
														</thead>
														<% if(sts ==4){
															//String[] pknum = request.getParameterValues("pknum");
															String[] Scredit = request.getParameterValues("sum");
															String[] count = request.getParameterValues("pCount");
															String[] Pname = request.getParameterValues("pName");
															String[] Price = request.getParameterValues("pPrice");
															int[] arrsc=new int[Scredit.length];
															int[] arrcount = new int[count.length];
															int[] price = new int[Price.length];
															//int[] arrpknum = new int[pknum.length];
																
																for(int i=0; i<Scredit.length; i++){
																	Ccredit = arrsc[i] = Integer.parseInt(Scredit[i].replace(",", ""));
																	Ccount = arrcount[i] = Integer.parseInt(count[i]);
																	Cprice = price[i] = Integer.parseInt(Price[i].replace(",", ""));
																//	Cpknum = arrpknum[i] = Integer.parseInt(pknum[i]);
																	Cpname  = Pname[i];
																	
																	AC += Ccredit; 
																
																	//System.out.println(Cpknum);

															%>
														<tbody>
															<tr>
																<td>
																 <input type="hidden" name="status" value='배송중'>
																<%-- <input type="hidden" name="Cpknum" value="<%=Cpknum%>"> --%>
																<input type="hidden" name="Ccount" value="<%=Ccount%>">
																<input type="hidden" name="Cprice" value="<%=Cprice%>">
																<input type="hidden" name="Cpname" value="<%=Cpname%>">
																<%=Cpname%> 
																<strong> x <%=Ccount%></strong></td>
																<td>
																<input type="hidden" name="Ccredit" value="<%=Ccredit%>">
																<%=df.format (Ccredit) %>(원)</td>
															</tr>
														</tbody>
														<% 								
													}
														}
														%>
														<% if(sts ==5){
															String[] pknum = request.getParameterValues("pknum");
															String[] Scredit = request.getParameterValues("sum");
															String[] count = request.getParameterValues("amount");
															String[] Pname = request.getParameterValues("Pname");
															
															int[] arrsc=new int[Scredit.length];
															int[] arrcount = new int[count.length];
															int[] arrpknum = new int[pknum.length];
																
																for(int i=0; i<Scredit.length; i++){
																	Ccredit = arrsc[i] = Integer.parseInt(Scredit[i].replace(",", ""));
																	Ccount = arrcount[i] = Integer.parseInt(count[i]);
																	Cpknum = arrpknum[i] = Integer.parseInt(pknum[i]);
																	Cpname  = Pname[i];
																	
																	AC += Ccredit; 
																
																	//System.out.println(Cpknum);

															%>
														<tbody>
															<tr>
																<td>
																 <input type="hidden" name="Cpname" value="<%=Cpname%>">
																 <input type="hidden" name="status" value='배송중'>
																 <input type="hidden" name="Cpknum" value="<%=Cpknum%>">
																<input type="hidden" name="Ccount" value="<%=Ccount%>">
																<%=Cpname%> 
																<strong> x <%=Ccount%></strong></td>
																<td>
																<input type="hidden" name="Ccredit" value="<%=Ccredit%>">
																<%=df.format (Ccredit) %>(원)</td>
															</tr>
														</tbody>
														<% 								
													}
														}
														%>
														
															<% if(sts ==2 ){
																int pID = Integer.parseInt(request.getParameter("pID"));
																ProductDTO product = ProductDAO.getDAO().getProduct(pID);
															//String[] pknum = request.getParameterValues("pknum");
															//String[] Scredit = request.getParameterValues("sum");
															//String[] count = request.getParameterValues("pCount");
															 //Cpname = request.getParameter("pName");
															 Cpname = product.getpName();
															//System.out.println(Cpname);
															 Cprice = product.getpPrice();
															 Ccount = 1;
														     AC += Cprice; 
																
																	//System.out.println(Cpknum);

															%>
														<tbody>
															<tr>
																<td>
																 <input type="hidden" name="Cpname" value="<%=Cpname%>">
																 <%--System.out.println(Cpname); --%>
																 <input type="hidden" name="status" value='배송중'>
																<input type="hidden" name="Cprice" value="<%=Cprice%>">
																<input type="hidden" name="Ccount" value="<%=Ccount%>">
																<%=Cpname%> 
																<strong> x <%=Ccount%></strong></td>
																<td>
																<input type="hidden" name="Ccredit" value="<%=Cprice%>">
																<%=df.format (Cprice) %>(원)</td>
															</tr>
														</tbody>
														<% 							
													
														}
														%>
														<tfoot>
															<tr>
																<th>총 상품 가격 </th>
																<td><%=df.format(AC)  %>(원)</td>
															</tr>
															<tr>
																<th>배송비</th>
																<td>무료(이벤트)</td>
															</tr>
															<tr>
																<th>총 결제 금액</th>
																<td><% int sum = AC; %>
																<input type="hidden" name="sum" value="<%=sum%>">
																	<%=df.format(sum) %> (원)</td>
															</tr>
														</tfoot>
													</table>
												</div>
												<h4>결제방법</h4>
												<div class="aa-payment-method">
													<label for="cashdelivery"> <input type="radio"
														id="cashdelivery" name="optionsRadios" value="계좌이체"> 
														계좌이체 (예금주 : this  예금 : 국민은행 736602-00-068145)
													</label> <label for="paypal"> <input type="radio"
														id="paypal" name="optionsRadios" value="카드결제" checked > 
														카드결제
													</label> <img
														src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg"
														border="0" alt="PayPal Acceptance Mark"> 
														<input type="submit" value="결제하기" class="aa-browse-btn" >
													</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			
		</div>
		<jsp:include page="footter.jsp" />
</body>
</html>

