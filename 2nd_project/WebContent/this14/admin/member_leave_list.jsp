
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.List"%>
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
	
	 /* List<UserDTO> userList=UserDAO.getDAO().getUserList(); */
	 List<UserDTO> userList=UserDAO.getDAO().getLeaveUserList();
%>
<div id="allContent">
			<div id="mainPadding">
				<!-- 내용 넣는 곳 : 시작 -->
					<div id="content-outer">
					<!-- start content -->
					<div id="content">
					
						<!--  start page-heading -->
						<div id="page-heading">
							<h1 style="font-weight: bold;">&nbsp;&nbsp;&nbsp;탈퇴회원<span><a href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=member_list">&nbsp;&nbsp;&nbsp;회원목록</a></span></h1>
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
										<th class="table-header-check"><input type="checkbox" id="allCheck"></th>
										<th class="table-header-repeat line-left"><a href="">아이디</a></th>
										<th class="table-header-repeat line-left"><a href="">전화번호</a></th>
										<th class="table-header-repeat line-left"><a href="">이름</a></th>
										<th class="table-header-repeat line-left"><a href="">이메일</a></th>
										<th class="table-header-repeat line-left"><a href="">주소</a></th>
										<!-- <th class="table-header-repeat line-left"><a href="">등급</a></th> -->
										<th class="table-header-repeat line-left"><a href="">탈퇴일</a></th>
									</tr>							
									
									<%if(userList.isEmpty()) { %>
									<tr>
										<td colspan="7" style="text-align: center;">탈퇴한 회원이 아무도 없습니다.</td>
									</tr>
									<%	} else { %>
									
									<%		for(UserDTO user:userList) { %>								
									<tr>
										<td>								
											<input  type="checkbox" name="checkId" value="<%=user.getuId()%>" class="check" />											
										</td>
										<td><%=user.getuId() %></td>
										<%-- <td><%=user.getU_PWD() %></td> --%>
										<td><%=user.getuPhone() %></td>
										<td><%=user.getuName() %></td>
										<td><%=user.getuEmail() %></td>
										<td><%=user.getuAbasic()+" "+user.getuAdetail() %></td>
										<%-- <td><%=user.getU_ADETAIL() %></td> --%>
										<td><%=user.getuJoindate().substring(0, 10) %></td>
									</tr>
									<%-- <% } %> --%><%-- <% } %> --%>
									<% 			} %>
									<%		} %>					
									</table>
									<!--  end product-table................................... --> 
									</form>
								</div>
								<!--  end content-table  -->
							
						 	<div class="editButton">
								<!-- <button style="width:100px;" onclick="">수정</button> -->
								<button style="width:100px;" type="button" id="removeBtn">데이터 파기</button>	
								<div id="message" style="color: red;/*  display: none; */"></div>	
								<div style="float:right">
										<input type="text"/> 
										<select  class="styledselect">
											<option value=""> 아이디</option>
											<option value=""> 이름</option>
											<option value=""> 전화번호</option>
											<option value="">등급</option>
											<option value="">가입일</option>
										</select> 
										<input type="button" style="width:100px;" value="search"/>
								</div>
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

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").size()==0){
		/* $("#message").display */
		$("#message").text("선택한 회원이 하나도 없습니다.");
		return;
	}
	
	$("#mainform").attr("method", "post");
	$("#mainform").attr("action","<%=request.getContextPath()%>/this14/admin/member_remove_action.jsp");
	$("#mainform").submit();
});
</script>
		