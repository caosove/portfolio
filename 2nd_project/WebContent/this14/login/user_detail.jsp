<%@page import="StockList.StockListDAO"%>
<%@page import="StockList.StockListDTO"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/this14/header.jsp"/>
<%
DecimalFormat df = new DecimalFormat("###,###");
	if(session.getAttribute("loginUser")==null){
		response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
		return;
	}

	UserDTO user=(UserDTO)session.getAttribute("loginUser");
	//System.out.println(user.getuGrade());
%>

<style type="text/css">
	.usr-info{width: 1030px; margin: 100px auto; min-height:450px;}
	.info-bt{width: 1030px; height: 30px; margin-top:30px; margin-left:2.5px;}
	.info-bt input{minwidth: 75px; float: right; margin-left: 10px;}
	.info-list table{margin-top: 2.5px; width: 1030px;height: 70px; text-align: left; font-size: 13px; border-collapse: separate; border-spacing: 3px;}
	.info-value{width: 10%; background-color: #efefef; text-align: center; padding: 0 20px;}
	.info-input{padding-left: 10px;}

	.order-list table {margin-top:10px; margin-bottom:20px; width: 1030px; height: 35px; text-align: center; font-size: 14px; }
	.order-list th {background-color: #7c95af; color: white; border: 1px solid white; height: 35px; width:20px;}
	.order-list tr {height: 35px;}
	.order-list {margin-top: 50px; maring-bottom:10px; width: 20%; display: inline-block; margin-left: 8px; }
	.list-btn {width: 1030px; height: 30px; margin-top:30px; margin-left:2.5px;}
	.list-btn input{minwidth: 75px; float: right; margin-left: 10px;}	
	.usr-info h3{width: 20%; display: inline-block; margin-left: 8px; margin-top: 30px;}

</style>
<div id="allContent">
<div id="mainPadding">
	<div class="usr-info">
		<div class="info-bt">
			<span id="user_info" style="font-size:18px;font-weight:bold;"><img src="images/heart-icon.png" width="26px;">  회원 정보</span>
			<input type="button" style="border:1px solid gray;padding:5px;font-size:14px;" id="user_drop" value="회원탈퇴">
			<input type="button" style="border:1px solid gray;padding:5px;font-size:14px;" id="user_edit" value="회원정보수정">
		</div><!--info-bt-->
		<div class="info-list">
			<table>
				<tr>
					<td class="info-value">아이디</td>
					<td class="info-input"><%=user.getuId() %></td>
					<td class="info-value">이름</td>
					<td class="info-input"><%=user.getuName() %></td>
					<td class="info-value">전화번호</td>
					<td class="info-input"><%=user.getuPhone() %></td>
					<td class="info-value">가입일</td>
					<td class="info-input"><%=user.getuJoindate().substring(0, 10) %></td>
				</tr>
				<tr>
					<td class="info-value">이메일</td>
					<td colspan="3" class="info-input"><%=user.getuEmail() %></td>
					
					<td class="info-value">주소</td>
					<td colspan="3" class="info-input">[<%=user.getuPost()%>] <%=user.getuAbasic() %>&nbsp;<%=user.getuAdetail() %></td>
					
				</tr>
			</table>
			
		</div><!--info-list-->

		
		<div class="order-list">
			<div class="list-btn">
				<span id="user_info" style="font-size:1.17em;font-weight:bold;"><img src="images/heart-icon.png" width="26px;"> 최근 구매 내역</span>
				<input type="button" style="border:1px solid gray;padding:5px;font-size:14px;" id="buy_list" value="구매내역 전체보기">
			</div>
			<table>
				<tr>
					<th>주문번호</th>
					<th>주문일시</th>
					<th width="140px">상품명</th>
					<th>가격</th>
					<th>수량</th>
				</tr>
				<%
				List<StockListDTO> stockList=StockListDAO.getDAO().checkList(user.getuName(),user.getuGrade(),1,10,"","");
				if(stockList.isEmpty()){ 
				%>	
				<tr>		
					<td colspan="5">구매 내역이 없습니다.</td>
				</tr>
				<%
				} else{
					int i=1;
					for(StockListDTO stock:stockList){
				%>	
				<tr>
					<td><%=stock.getNum() %></td>
					<td><%=stock.getDate().substring(0, 19) %></td>
					<td width="140px"><%=stock.getPname() %></td>
					<td><%=df.format(stock.getCredit()) %> (원)</td>
					<td><%=stock.getCount() %> (개)</td>
				</tr>
				<%	
					if(i==10) break;
					i++;
					}
				}
				%>
			</table>
		</div><!--order-list-->
	</div><!--usr-info-->
</div>
</div>

<script type="text/javascript">

document.getElementById("user_edit").addEventListener("click",function(){
	location.href="<%=request.getContextPath()%>/this14/login/user_edit.jsp";
});

document.getElementById("user_drop").addEventListener("click",function(){
	if(confirm("정말로 탈퇴 하시겠습니까?")){
		location.href="<%=request.getContextPath()%>/this14/login/user_drop_action.jsp";
	}
});

		document.getElementById("buy_list").addEventListener("click",function(){
			<%if (user.getuGrade().equals("user")){%>
				location.href="<%=request.getContextPath()%>/this14/Cart/Buy_List.jsp";
					

<%}else{%>
	alert("어드민은 관리자창에서 확인하세요.");
		<%}%>
		});


</script>


<jsp:include page="/this14/footer.jsp"/>