<%@page import="user.UserDTO"%>
<%@page import="pager.ThePager"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="StockList.StockListDAO"%>
<%@page import="java.util.List"%>
<%@page import="StockList.StockListDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	UserDTO loginUser=(UserDTO)session.getAttribute("loginUser");

	if(loginUser==null || !loginUser.getuGrade().equals("admin")) {
		/* session.setAttribute("message", "로그인 상태의 관리자만 접근 가능합니다."); */
%>   
		<script type="text/javascript">
		location.href="<%=request.getContextPath()%>/this14/product/index.jsp";
		</script>
<%
		return;
	}

	/* List<UserDTO> userList=UserDAO.getDAO().getUserList();
 */
	//검색 관련 전달값을 반환받아 저장
	String search=request.getParameter("search");
	if(search==null) search="";
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";
	//System.out.println(search+" = "+keyword);
	
	int pageNum=1;//페이지번호를 저장하기 위한 변수
	if(request.getParameter("pageNum")!=null) {//전달값이 존재할 경우
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//페이지에 검색될 갯수 설정
	int pageSize=10;//검색 갯수를 저장하기 위한 변수
	
	//user 테이블에 저장된 전체(검색) 갯수의 반환받는 DAO 클래스의 메소드 호출
	int totalStock=StockListDAO.getDAO().getTotalStock(search, keyword);//회원 갯수를 저장하기 위한 변수

	//전체 페이지의 갯수를 계산하여 저장
	int totalPage=totalStock/pageSize+(totalStock%pageSize==0?0:1);//전체 페이지의 갯수를 저장하기 위한 변수
	
	//페이지 번호에 대한 검사
	if(pageNum<=0 || pageNum>totalPage) {//전달된 페이지 번호가 잘못된 경우
		pageNum=1;
	}
	
	//페이지 번호에 대한 시작 행번호 계산하여 저장
	// => 1 Page : 1, 2 Page : 11, 3 Page : 21, 4 Page : 31,... 
	int startRow=(pageNum-1)*pageSize+1;//시작 행번호를 저장하기 위한 변수
	
	//페이지 번호에 대한 마지막 행번호 계산하여 저장
	// => 1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 40,... 
	int endRow=pageNum*pageSize;//마지막 행번호를 저장하기 위한 변수
	
	//마지막 페이지의 마지막 행번호를 회원의 갯수로 변경
	if(endRow>totalStock) {
		endRow=totalStock;
	}
	
	//시작 행번호와 마지막 행번호를 전달하여 user 테이블에 저장된
	//목록을 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<StockListDTO> stockList=StockListDAO.getDAO().getStockList(startRow, endRow, search, keyword);
	
	//응답 회원 시작번호를 계산하여 저장
	int number=totalStock-(pageNum-1)*pageSize;
	
	/* //세션에 저장된 로그인 인증정보(회원정보)를 반환받아 저장
	UserDTO loginMember=(UserDTO)session.getAttribute("loginMember"); */
	
%>
<div id="allContent">
			<div id="mainPadding">
				<!-- 내용 넣는 곳 : 시작 -->
				<div id="content-outer">
					<!-- start content -->
					<div id="content">
					
						<!--  start page-heading -->
						<div id="page-heading">
							<h1 style="font-weight: bold;">&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=order_list">주문목록</a><%-- <span><a href="<%=request.getContextPath()%>/admin/indexAdmin.jsp?work=order_cancel">&nbsp;&nbsp;&nbsp;주문취소목록</a></span> --%></h1>
						</div>
						<!-- end page-heading -->
					
						<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
						<tr>
							<th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
							<th class="topleft"></th>
							<td id="tbl-border-top">&nbsp;</td>
							<th class="topright"></th>
							<th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
						</tr>
						<tr>
							<td id="tbl-border-left"></td>
							<td>
							<!--  start content-table-inner ...................................................................... START -->
							<div id="content-table-inner">
					
									<!--  start product-table ..................................................................................... -->
									<form id="mainform" action="">
									<table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
									<tr>
										<!-- <th class="table-header-check"><input type="checkbox" id="allCheck"> </th> -->
										<th class="table-header-repeat line-left"><a style="cursor:default;">주문번호</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">주문자명</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">주문일</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">상품</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">가격</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">수량</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">배송지</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">배송상태</a></th>
									</tr>
									<% if(totalStock==0) { %>
									<tr>
										<td colspan="8" style="text-align: center;">검색된 회원정보가 하나도 없습니다.</td>
									</tr>
									<% } else { %>
									<% for(StockListDTO stock:stockList) { %>
									<tr>
										<%-- <td><input type="checkbox" name="checkId" value="<%=stock.getNum()%>" class="check"/></td> --%>
										<td><%=stock.getNum() %></td>
										<td><%=stock.getUname() %></td>
										<td><%=stock.getDate().substring(0, 10) %></td>
										<td><%=stock.getPname() %></td>
										<td><%=DecimalFormat.getCurrencyInstance().format(stock.getCredit()) %></td>
										<td><%=stock.getCount() %> (개)</td>
										<td><%=stock.getAddress() %></td>
										<td><select class="s_status" name="<%=stock.getNum()%>">
										
												<option value="<%="배송중"%>" 
												<% if(stock.getStatus().equals("배송중")) { %> selected <% } %>>배송중</option>
												<option value="<%="배송준비중"%>" <%
												if(stock.getStatus().equals("배송준비중")) { %> selected <% } %>>배송준비중</option>
													<option value="<%="배송완료"%>" 
												<% if(stock.getStatus().equals("배송완료")) { %> selected <% } %>>배송완료</option>
											</select> </td>
									</tr>
									<% } %>
									<%} %>
									</table>
									<!--  end product-table................................... --> 
									</form>
								</div>
								<!--  end content-table  -->
							
						 	<div class="editButton" style="line-height: 2;">
								<!-- <button style="width:100px;" onclick="">수정</button> -->
									
								
								<form style="margin-bottom: 10px" action="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=order_list" method="post" id="searchForm">
								
							     	<!-- <button style="width:100px;" type="button" id="removeBtn">삭제</button> -->
								
									<div style="float:right">
											<select name="search" class="styledselect">
												<option value="s_Num" selected="selected"> 주문번호</option>
												<option value="s_Date"> 주문일시</option>
												<option value="s_Pname"> 상품</option>
												<option value="s_Address">배송지</option>
											</select> 
											<input type="text" name="keyword" id="keyword"> 
											<button type="submit" style="width: 100px;">검색</button>
									</div>
								</form><div>&nbsp;</div>
								<%
									int blockSize=5;
									String linkUrl=request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=order_list&search="+search+"&keyword="+keyword+"&";
									ThePager pager=new ThePager(pageNum,blockSize,totalPage,linkUrl);
								%>
								<%=pager%>
							</div>
							</td>
							<td id="tbl-border-right"></td>
						</tr>
						<tr>
							<th class="sized bottomleft"></th>
							<td id="tbl-border-bottom">&nbsp;</td>
							<th class="sized bottomright"></th>
						</tr>
						</table>
						</div>
					</div>
				
						
							

				<!-- 내용 넣는 곳 : 끝 -->
			</div>		
		</div>
<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked", true);
	} else {
		$(".check").prop("checked", false);
	}
});

$(".s_status").change(function() {
	var num=$(this).attr("name");
	var status=$(this).val();
	//alert(num+","+status);
	location.href="<%=request.getContextPath()%>/this14/admin/order_change_action.jsp?num="+num+"&status="+status;
});
</script>