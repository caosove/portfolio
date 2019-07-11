<%@page import="user.UserDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품번호를 전달받아 PRODUCT 테이블에 저장된 제품정보를 검색하여 응답하는 JSP 문서 --%>
<%-- => [제품정보 변경] 버튼을 누른 경우 제품정보 변경 페이지(product_modify.jsp)로 이동 --%>    
<%
	UserDTO loginUser=(UserDTO)session.getAttribute("loginUser");

	if(loginUser==null || !loginUser.getuGrade().equals("admin")){
		/* session.setAttribute("message", "로그인 상태의 관리자만 접근 가능합니다.") */;
%>   
		<script type="text/javascript">
		location.href="<%=request.getContextPath()%>/this14/product/index.jsp";
		</script>
<%
		return;
	}
	
	if(request.getParameter("pID")==null) {
%>
		<script type="text/javascript">
		location.href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=product_list";
		</script>
<%		
		return;
	}

	//전달된 제품번호를 반환받아 저장
	int pID=Integer.parseInt(request.getParameter("pID"));
	
	//제품번호를 전달하여 PRODUCT 테이블에 저장된 제품정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	ProductDTO product = ProductDAO.getDAO().getProduct(pID);

%>
<div id="ikea" class="ikea-new-ui-body">
	<div class="category-container">
		<section class="category-cover">
			<div class="wrap">
				<h1>제품상세정보</h1>
			</div>
		</section>				
	</div>
</div>
<div id="allContent">
	<div id="mainPadding">
		<!-- 내용 넣는 곳 : 시작 -->
		<div id="product" class="product-regist-container">
			<table class="product-regist adminDetail">
				<colgroup>
					<col width="25%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>상품ID(ProductID)</th>
						<td><%=product.getpID()%></td>
					</tr>
					<tr>
						<th>상품종류(ProductType)</th>
						<td><%=product.getpType()%></td>
					</tr>
					<tr>
						<th>상품명(ProductName)</th>
						<td><%=product.getpName() %></td>
					</tr>
					<tr>
						<th>소카테고리(ProductCategory)</th>
						<td><%=product.getpCategory()%></td>
					</tr>
					<tr>
						<th>가격(Price)</th>
						<td><%=product.getpPrice()%></td>
					</tr>
					<tr>
						<th>재고(Inventory)</th>
						<td><%=product.getpInv()%></td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td><img class="prodImg" src="<%=request.getContextPath()%>/this14/product/images/product_image/<%=product.getpName()%>.jpg"></td>
					</tr>
					<tr>
						<th>status</th>
						<td><% if(product.getpStatus().equals("PROGRESS")) {%>진행<%} else {%>중지<%} %></td>
					</tr>
					<tr>
						<th>설명(Explanation)</th>
						<td>
							<%=product.getpExp().replace("\n", "<br>") %>
						</td>
					</tr>
					<tr>
						<th>상품등록일(ProductDate)</th>
						<td><%=product.getpDate()%></td>
					</tr>
				</tbody> 
			</table>
			<div class="button-wrap">
				<button type="button" id="modifyBtn">제품정보 변경</button>
				<button type="button" id="listBtn">제품목록</button>
				<button type="button" id="removeBtn">제품정보 삭제</button>
			</div>
		</div>

		<!-- 내용 넣는 곳 : 끝 -->
	</div>	
</div>
<script type="text/javascript">
$("#modifyBtn").click(function() {
	location.href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=product_modify&pID=<%=product.getpID()%>";
});

$("#removeBtn").click(function() {
	if(confirm("정말로 삭제 하시겠습니까?")) {
		location.href="<%=request.getContextPath()%>/this14/admin/product_remove_action.jsp?pID=<%=product.getpID()%>";
	}
});
$("#listBtn").click(function() {
	location.href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=product_list";
});
</script>