<%@page import="user.UserDTO"%>
<%@page import="product.ProductDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	UserDTO loginUser=(UserDTO)session.getAttribute("loginUser");

	if(loginUser==null || !loginUser.getuGrade().equals("admin")){
		/* session.setAttribute("message", "로그인 상태의 관리자만 접근 가능합니다."); */
%>   
		<script type="text/javascript">
		location.href="<%=request.getContextPath()%>/this14/product/index.jsp";
		</script>
<%
		return;
	}
%> 
<%
	String message=(String)session.getAttribute("message");
	if(message == null) {
		message = "";
	} else {
		session.removeAttribute("message");
	}
	
	ProductDTO product = (ProductDTO)session.getAttribute("product");
	 
	if(product!=null) {
		session.removeAttribute("product");
	}	
%>
<div id="ikea" class="ikea-new-ui-body">
	<div class="category-container">
		<section class="category-cover">
			<div class="wrap">
				<h1>상품 등록</h1>
			</div>
		</section>				
	</div>
</div>
<div id="allContent">
	<div id="mainPadding">
		<!-- 내용 넣는 곳 : 시작 -->
		<div id="product" class="product-regist-container">
			<form action="<%=request.getContextPath()%>/this14/admin/product_add_action.jsp" 
		method="post" enctype="multipart/form-data" id="prodForm">
				<table class="product-regist">
					<colgroup>
						<col width="25%" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th>상품종류(ProductType)</th>
							<td>
								<input type="radio" name="pType" id="type01" value="BED" /><label for="type01">침대·매트리스</label>
				                <input type="radio" name="pType" id="type02" value="LIVING" /><label for="type02">소파·의자·테이블</label>
				                <input type="radio" name="pType" id="type03" value="KITCHEN" /><label for="type03">요리·식기·주방가구</label>
				                <input type="radio" name="pType" id="type04" value="TEXTILE" /><label for="type04">텍스타일·러그·커튼</label>								
							</td>
						</tr>
						<tr>
							<th>상품명(ProductName)</th>
							<td><input type="text" name="pName" id="pName" /></td>
						</tr>
						<tr>
							<th>소카테고리(ProductCategory)</th>
							<td><input type="text" name="pCategory" id="pCategory" /></td>
						</tr>
						<tr>
							<th>가격(Price)</th>
							<td><input type="text" name="pPrice" id="pPrice" /> </td>
						</tr>
						<tr>
							<th>상품이미지</th>
							<td><input type="file" name="pImage" id="pImage" /></td>
						</tr>
						<tr>
							<th>등록상태</th>
							<td>
							<select class="status" name="pStatus" id="pStatus">
           						<option value="PROGRESS">진행</option>
           						<option value="STOP" >중지</option>
           					</select>
							</td>
						</tr>
						<tr>
							<th>설명(Explanation)</th>
							<td>
								<textarea rows="7" name="pExp" id="pExp" ></textarea>
							</td>
						</tr>
					</tbody> 
				</table>
				<div id="message" style="color: red; text-align: center"></div>
				<div class="button-wrap">
					<button type="submit">제품등록</button>
				</div>
			</form>
			
		</div>
		<!-- 내용 넣는 곳 : 끝 -->
	</div>	
</div>

<script type="text/javascript">
$("#prodForm").submit(function() {
	
	if (!$("input[name='pType']:checked").val()) {
		$("#message").text("상품종류를 선택해 주세요.");
		$("#pType").focus();
		return false;
	}	
	
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
	
	if($("#pPrice").val()=="") {
		$("#message").text("제품가격을 숫자로 입력해 주세요.");
		$("#pPrice").focus();
		return false;
	}
	if($("#pImage").val()=="") {
		$("#message").text("제품이미지를 등록해주세요.");
		$("#pImage").focus();
		return false;
	}
	if($("#pStatus").val()=="") {
		$("#message").text("select product's status");
		$("#pStatus").focus();
		return false;
	}	
	if($("#pExp").val()=="") {
		$("#message").text("제품상세설명을 입력해 주세요.");
		$("#pExp").focus();
		return false;
	}	
	
});
</script>