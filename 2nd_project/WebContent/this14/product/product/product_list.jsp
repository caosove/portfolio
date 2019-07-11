<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//페이지 관련 메뉴값 저장	
	String menu = request.getParameter("menu");
	if (menu == null) {
		menu = "ALL";
	}
	//sorting 관련 전달값 저장
	String sorting = request.getParameter("sorting");

	if (sorting == null) {
		sorting = "P_ID";
	} 
	
	if (menu.equals("NEW")) {
		sorting = "P_DATE";
	}
	
	String keyword=request.getParameter("keyword");	
	if(keyword==null) keyword="";
	
	//전체상품 갯수 메소드 호출
	int totalProduct = ProductDAO.getDAO().getTotalProduct(menu, sorting);

	//System.out.println(keyword + ", " + totalProduct);
	
	//페이지번호를 반환받아 저장
	int pageNum = 1;
	if (request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//페이지에 검색될 상품갯수 설정
	int pageSize = 8;
	
	//전체 페이지의 갯수를 계산하여 저장
	int totalPage = totalProduct / pageSize + (totalProduct % pageSize == 0 ? 0 : 1);
	
	//페이지 번호에 대한 검사
	if (pageNum <= 0 || pageNum > totalPage) {
		pageNum = 1;
	}
	
	//페이지 번호에 대한 상품 행번호 계산하여 저장
	int startRow = (pageNum -1) * pageSize + 1;
	
	//페이지 번호에 대한 상품 마지막 행 번호 계산하여 저장
	int endRow = pageNum * pageSize;
	
	//마지막 페이지의 게시글 마지막 행번호를 게시글 갯수로 변경
	if (endRow > totalProduct) {
		endRow = totalProduct;
	}
	
	List<ProductDTO> productList = ProductDAO.getDAO().getProductList2(startRow, endRow, menu, sorting);
	
	UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");	
	
%>
<%@include file="/this14/returnURI.jspf" %>

<div id="ikea" class="ikea-new-ui-body">
	<div class="category-container">
		<section class="category-cover">
			<div class="wrap">
				<h1>
					<% if (menu.equals("BED")) { %>침대 · 매트리스
					<%} else if (menu.equals("LIVING")) { %>소파·의자·테이블
					<%} else if (menu.equals("KITCHEN")) { %>요리·식기·주방가구
					<%} else if (menu.equals("TEXTILE")) { %>텍스타일·러그·커튼
					<%} else if (menu.equals("NEW")) { %> IKEA 신제품
					<%} else { %>모든제품<%} %>
				</h1>
			</div>
		</section>
		
		<section class="product-list-container wrap">
			<% if (menu.equals("NEW")) { %>
			<div class="sort-container"></div>
			<% } else { %>
			<div class="sort-container">
				<form method="post" id="filterForm" name="filterForm">
					<%-- <span style="font-size:12px; display: BLOCK;TEXT-ALIGN: RIGHT;PADDING-RIGHT: 190PX;">
					[확인용] 검색 게시 상품 목록 (수 : <%=totalProduct %>)					
					</span> --%>
					<select class="sorting" name="sorting" id="sorting">
						<option value="P_ID" <% if(sorting.equals("P_ID")) { %> selected="selected" <% } %>>전체</option>
						<option value="P_NAME" <% if(sorting.equals("P_NAME")) { %> selected="selected" <% } %>>이름순</option>
						<option value="P_PRICE" <% if(sorting.equals("P_PRICE")) { %> selected="selected" <% } %>>가격순 </option>
						<option value="P_DATE"<% if(sorting.equals("P_DATE")) { %> selected="selected" <% } %>>등록순</option>
					</select>
					
				</form>
			</div>
			<% } %>
		</section>
	</div>
</div>
<div id="allContent">
	<div id="mainPadding">
		<div class="productLists adproductLists" id="productLists">
			<div class="gridRow">
				<div class="sixColumn">
					<% if (menu.equals("BED")) { %>
						<div class="categoryGray">
							<h2>침대 · 매트리스</h2>
						</div>
						<h2 class="headOneGray">행복하게 하루를 시작하세요</h2>
						<p class="bodyTextGray">상쾌한 하루의 시작은 숙면입니다. IKEA의 다양한 스타일의 견고한 더블 침대는 편안함과 안락함으로 기분 좋은 하루의 시작을 도와드립니다. 또한, 빌트인 수납함이나 수납 상자처럼 스마트한 기능도 갖추고 있으며, IKEA 홈페이지를 방문하면 꿈꾸던 안락한 숙면을 완성시켜주는 다양한 매트리스와 베개도 만나볼 수 있습니다.</p>
					<%} else if (menu.equals("LIVING")) { %>
						<div class="categoryGray">
							<h2>소파·의자·테이블</h2>
						</div>
						<h2 class="headOneGray">하루 종일 편안하게</h2>
						<p class="bodyTextGray">두 가지 기능을 가진 제품은 공간과 돈을 아낄 수 있습니다. 사용하는 분의 취향에 맞게 IKEA 소파베드를 활용해 보세요. 체어베드와 코너 소파베드와 같이 IKEA는 스타일과 색상이 다양한 제품으로 가득합니다. 많은 제품에 침구를 보관할 수납공간이 내장되어 있습니다.</p>
					
					<%} else if (menu.equals("KITCHEN")) { %>
						<div class="categoryGray">
							<h2>요리·식기·주방가구</h2>
						</div>
						<h2 class="headOneGray">내가 만드는 주방</h2>
						<p class="bodyTextGray">다양한 디자인을 떠올려보고 나만의 개성과 스타일을 담은 주방을 꾸며보세요. 방법도 매우 간단해 한 번의 클릭으로 주방 앞판은 물론 색상도 바꿔볼 수 있답니다. 주방을 내 마음대로 인테리어해보세요.</p>
					
					<%} else if (menu.equals("TEXTILE")) { %>
						<div class="categoryGray">
							<h2>텍스타일·러그·커튼</h2>
						</div>
						<h2 class="headOneGray">새 쿠션으로 분위기를 새롭게 바꿔보세요</h2>
						<p class="bodyTextGray">쿠션은 멋진 장식 효과를 주는 아이템입니다. 부드럽고 편안하면서도 아름다운 색상과 무늬로 
분위기를 한 층 빛내주며 개성도 살려주죠. 새 쿠션 혹은 커버를 마련하면 저렴하면서도 빠르게 실내 분위기를 상쾌하게 만들 수 있습니다.</p>
					
					<%}%>					
				</div>
			</div>
			<div class="gridRow">
			<% if(totalProduct == 0) {%> 
			<p>검색된 상품이 없습니다.</p>
			<% } else { %>
				<% for (ProductDTO product:productList) {%>	
				<div class="product " title="">						
					<div class="productDetails">
						<a href="<%=request.getContextPath()%>/this14/product/index.jsp?workgroup=product&work=product_detail&pID=<%=product.getpID()%>" 
						style="color:#000000">
							<div class="image">
								<img src="<%=request.getContextPath()%>/this14/product/images/product_image/<%=product.getpName()%>.jpg" alt="" >
							</div>
							<h3 class="noBold">
								<span class="productTitle floatLeft"><%=product.getpName() %></span>
								<span class="productDesp"><%=product.getpCategory() %></span>
							</h3>											
							<span class="price regularPrice">
							<%=DecimalFormat.getCurrencyInstance().format(product.getpPrice()) %>
							<span class="unit">/개</span></span>
						</a>
						<div class="button-wrap">
							<%if (loginUser == null) { %>
							<a href="javascript:toggle()">장바구니</a>							
							<% } else if(loginUser.getuGrade().equals("admin")){ %>
							<a href="#">장바구니</a>
							<% } else {%>
							<a href="index.jsp?
							workgroup=product&work=InsertCart&pID=<%=product.getpID()%>&sts=1" onclick = "alert('장바구니에 추가하였습니다.')">장바구니</a>
							
							<% } %>
							<%if (loginUser == null) { %>
							<a href="javascript:toggle()">구매하기</a>							
							<% } else if(loginUser.getuGrade().equals("admin")){ %>
							<a href="#">구매하기</a>
							<% } else {%>
							<a href="../Cart/checkout.jsp?pID=<%=product.getpID()%>&sts=2&pName=<%= product.getpName()%>">구매하기</a>
							<% } %>
						</div>
					</div>						
					<div class="clearBoth"></div>
				</div>
				<% }%>
			<% }%>
			</div>			
		</div>
		<div style="clear: both;"></div>
		<%-- 페이지 번호 출력 - 페이징 처리 --%>
		<%
			//보여줄 페이지 번호 갯수 설정
			int blockSize = 5;
		
			//시작페이지 번호 계산
			int startPage = (pageNum - 1) / blockSize * blockSize + 1;
			
			//마지막페이지 번호 계산
			int endPage = startPage + blockSize - 1;
			
			//마지막 페이지 블럭의 마지막 페이지 번호 변경
			if (endPage > totalPage) {
				endPage = totalPage;
			}
		
		%>
		<div class="list_number_2">
			<div class="list_n_menu_2">
			<% if(startPage > blockSize) { %>
				<a href="<%=request.getContextPath()%>/this14/product/index.jsp?workgroup=product&work=product_list&menu=<%=menu%>&sorting=<%=sorting %>&pageNum=1">처음</a>
				<a href="<%=request.getContextPath()%>/this14/product/index.jsp?workgroup=product&work=product_list&menu=<%=menu%>&sorting=<%=sorting %>&pageNum=<%=startPage-blockSize%>">이전</a>
			<% } else if (startPage < blockSize){ %>
			<% } else { %>
				<span class="disabled">처음</span>
				<span class="disabled">이전</span>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<% if (pageNum != i) { %>
				<a href="<%=request.getContextPath() %>/this14/product/index.jsp?workgroup=product&work=product_list&menu=<%=menu%>&sorting=<%=sorting %>&pageNum=<%=i %>"><%=i %></a>
				<%} else { %>
				<span class="current"><%=i %></span>
				<% } %>
			<%} %>		
			
			<% if (endPage != totalPage) { %>
			<a href="<%=request.getContextPath() %>/this14/product/index.jsp?workgroup=product&work=product_list&menu=<%=menu%>&sorting=<%=sorting %>&pageNum=<%=startPage+blockSize %>">다음</a>
			<a href="<%=request.getContextPath() %>/this14/product/index.jsp?workgroup=product&work=product_list&menu=<%=menu%>&sorting=<%=sorting %>&pageNum=<%=totalPage %>">마지막</a>
			<% } else if (endPage < blockSize){ %>
			<% } else {%>
			<span class="disabled">다음</span>
			<span class="disabled">마지막</span>
			<% } %>
			</div>
		</div>
	</div>		
</div>
<script type="text/javascript">
	$("#sorting").change(function() {
		$("#filterForm").submit();
	});
	
</script>