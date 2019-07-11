<%@page import="user.UserDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품아이디를 전달받아 상품 테이블에 저장된 제품정보를 검색하여 
입력태그에 초기값으로 설정 후 제품정보 변경 처리 페이지
(product_modify_action.jsp)로 전달하는 JSP 문서 --%>
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
	
	if (request.getParameter("pID") == null) {
%>
		<script type="text/javaScript">
			location.href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=product_list";
		</script>
<% 
		return;
	}
	
	//전달된 제품 아이디를 반환받아 저장
	int pID = Integer.parseInt(request.getParameter("pID"));
	//메소드 호출
	ProductDTO product = ProductDAO.getDAO().getProduct(pID);

%>
<div id="ikea" class="ikea-new-ui-body">
	<div class="category-container">
		<section class="category-cover">
			<div class="wrap">
				<h1>상품 수정</h1>
			</div>
		</section>				
	</div>
</div>
<div id="allContent">
	<div id="mainPadding">
		<!-- 내용 넣는 곳 : 시작 -->
		<div id="product" class="product-regist-container">
			<form action="<%=request.getContextPath()%>/this14/admin/product_modify_action.jsp" 
		method="post" enctype="multipart/form-data" id="prodForm">
				<%-- 제품 이미지를 변경하지 않을 경우 또는 제품 이미지를 변경할 경우의
	기존 이미지 파일을 제거하기 위해 전달 --%>
				<input type="hidden" name="pID" value="<%=product.getpID() %>">
				<input type="hidden" name="currentImage" value="<%=product.getpName()%>.jpg">
				<table class="product-regist">
					<colgroup>
						<col width="25%" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th>상품ID(ProductID)</th>
							<td class="value"><%=product.getpID() %></td>
						</tr>
						<tr>
							<th>상품종류(ProductType)</th>
							<td class="value"><%=product.getpType() %></td>
						</tr>
						<tr>
							<th>상품명(ProductName)</th>
							<td><input type="text" name="pName" id="pName" value="<%=product.getpName() %>" /></td>
						</tr>
						<tr>
							<th>소카테고리(ProductCategory)</th>
							<td><input type="text" name="pCategory" id="pCategory" value="<%=product.getpCategory() %>" /></td>
						</tr>
						<tr>
							<th>가격(Price)</th>
							<td><input type="text" name="pPrice" id="pPrice" value="<%=product.getpPrice() %>"></td>
						</tr>
						<tr>
							<th>재고(Inventory)</th>
							<td><input type="text" name="pInv" id="pInv" value="<%=product.getpInv() %>" /></td>
						</tr>
						<tr>
							<th>상품이미지</th>
							<td>
								<img src="<%=request.getContextPath()%>/this14/product/images/product_image/<%=product.getpName()%>.jpg" class="prodImg">
								<br />
								<input type="file" name="pImage" id="pImage" />
							</td>
						</tr>
						<tr>
							<th>등록상태(ProductStatus)</th>
							<td class="value">
								<select id="pStatus" name="pStatus" class="status">
	           						<option value="PROGRESS" <%if(product.getpStatus().equals("PROGRESS")) {%>selected="selected"<%} %>>진행</option>
	           						<option value="STOP" <%if(product.getpStatus().equals("STOP")) {%>selected="selected"<%} %>>중지</option>
	           					</select>
							</td>
						</tr>
						<tr>
							<th>등록일(ProductDate)</th>
							<td class="value"><%=product.getpDate() %></td>
						</tr>
						<tr>
							<th>설명(Explanation)</th>
							<td>
								<textarea rows="7" name="pExp" id="pExp" ><%=product.getpExp() %></textarea>
							</td>
						</tr>
					</tbody> 
				</table>
				<div class="button-wrap">
					<button type="submit">확인</button>
				</div>
			</form>
			<div id="message" style="color: red;"></div>
		</div>
		<!-- 내용 넣는 곳 : 끝 -->
	</div>	
</div>

<script type="text/javascript">
$("#prodForm").submit(function() {
	$("#pName").focus();
	if($("#pName").val()=="") {
		$("#message").text("제품명을 입력해 주세요.");
		$("#pName").focus();
		return false;
	}	
	
	if($("#pCategory").val()=="") {
		$("#message").text("제품카테고리를 입력해 주세요.");
		$("#pCategory").focus();
		return false;
	}	
	
	if($("#pExp").val()=="") {
		$("#message").text("제품상세설명을 입력해 주세요.");
		$("#pExp").focus();
		return false;
	}	
	
	if($("#pPrice").val()=="") {
		$("#message").text("제품가격을 입력해 주세요.");
		$("#pPrice").focus();
		return false;
	}
	
	if($("#pInv").val()=="") {
		$("#message").text("제품수량을 입력해 주세요.");
		$("#pInv").focus();
		return false;
	}
	
	if (!$("select[name='pStatus']").val()) {
		$("#message").text("등록상태를 선택해 주세요.");
		$("#pStatus").focus();
		return false;
	}
});
</script>