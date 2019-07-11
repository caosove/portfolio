<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="pager.ThePager"%>
<%@page import="java.util.List"%>
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
	
	//페이지에 검색될 회원 갯수 설정
	int pageSize=10;//검색 회원 갯수를 저장하기 위한 변수
	
	//user 테이블에 저장된 전체(검색) 회원의 갯수의 반환받는 DAO 클래스의 메소드 호출
	int totalUser=UserDAO.getDAO().getTotalUser(search,keyword);//회원 갯수를 저장하기 위한 변수

	//전체 페이지의 갯수를 계산하여 저장
	int totalPage=totalUser/pageSize+(totalUser%pageSize==0?0:1);//전체 페이지의 갯수를 저장하기 위한 변수
	
	//페이지 번호에 대한 검사
	if(pageNum<=0 || pageNum>totalPage) {//전달된 페이지 번호가 잘못된 경우
		pageNum=1;
	}
	
	//페이지 번호에 대한 회원 시작 행번호 계산하여 저장
	// => 1 Page : 1, 2 Page : 11, 3 Page : 21, 4 Page : 31,... 
	int startRow=(pageNum-1)*pageSize+1;//시작 행번호를 저장하기 위한 변수
	
	//페이지 번호에 대한 회원 마지막 행번호 계산하여 저장
	// => 1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 40,... 
	int endRow=pageNum*pageSize;//마지막 행번호를 저장하기 위한 변수
	
	//마지막 페이지의 회원 마지막 행번호를 회원의 갯수로 변경
	if(endRow>totalUser) {
		endRow=totalUser;
	}
	
	//시작 행번호와 마지막 행번호를 전달하여 user 테이블에 저장된 회원
	//목록을 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<UserDTO> userList=UserDAO.getDAO().getUserList(startRow, endRow, search, keyword);
	
	//응답 회원 시작번호를 계산하여 저장
	int number=totalUser-(pageNum-1)*pageSize;
	
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
							<h1 style="font-weight: bold;">&nbsp;&nbsp;&nbsp;<span><a href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=member_list">회원목록</a></span><span><a href="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=member_leave_list">&nbsp;&nbsp;&nbsp;탈퇴회원</a></span></h1>
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
										<th class="table-header-repeat line-left"><a style="cursor:default;">아이디</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">전화번호</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">이름</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">이메일</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">주소</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">등급</a></th>
										<th class="table-header-repeat line-left"><a style="cursor:default;">가입일</a></th>
									</tr>
									<%-- <% for(int i =0; i<50; i++){ %> --%>
									<% if(totalUser==0) { %>
									<tr>
										<td colspan="8" style="text-align: center;">검색된 회원정보가 하나도 없습니다.</td>
									</tr>
									<% } else { %>
									<%		for(UserDTO user:userList) { %>
									<tr>
										<td>
											<% if(user.getuGrade().equals("admin")) { %>
											A
											<% } else { %>
											<input  type="checkbox" name="checkId" value="<%=user.getuId()%>" class="check" />
											<% } %>
										</td>
										<td><%=user.getuId() %></td>
										<%-- <td><%=user.getU_PWD() %></td> --%>
										<td><%=user.getuPhone() %></td>
										<td><%=user.getuName() %></td>
										<td><%=user.getuEmail() %></td>
										<td><%=user.getuAbasic()+" "+user.getuAdetail() %></td>
										<%-- <td><%=user.getU_ADETAIL() %></td> --%>
										<td>
											<select class="u_grade" name="<%=user.getuId()%>">
												<option value="<%="user"%>" <% if(user.getuGrade().equals("user")) { %> selected <% } %>>user</option>
												<option value="<%="admin"%>" <% if(user.getuGrade().equals("admin")) { %> selected <% } %>>admin</option>
											</select>
										</td>
										<td><%=user.getuJoindate().substring(0, 10) %></td>
									</tr>
									<%-- <% } %> --%>
									<%		} %>
									<% } %>					
									</table>
									<!--  end product-table................................... --> 
									</form>
								</div>
								<!--  end content-table  -->
							
						 	<div class="editButton">
								<!-- <button style="width:100px;" onclick="">수정</button> -->
								<div id="message" style="color: red;"></div>									
								
								<form style="margin-bottom: 10px" action="<%=request.getContextPath()%>/this14/admin/indexAdmin.jsp?work=member_list" method="post" id="searchForm">
								
							<button style="width:100px;" type="button" id="removeBtn">삭제</button>	
								
									<div style="float:right">
											<select name="search" class="styledselect">
												<option value="u_id" selected="selected"> 아이디</option>
												<option value="u_name"> 이름</option>
												<option value="u_phone"> 전화번호</option>
												<option value="u_grade">등급</option>
												<option value="u_joindate">가입일</option>
											</select> 
											<input type="text" name="keyword" id="keyword"> 
											<button type="submit" style="width: 100px;">검색</button>
									</div>
								</form>
								
								<%
									int blockSize=5;
									String linkUrl=request.getContextPath()+"/this14/admin/indexAdmin.jsp?work=member_list&search="+search+"&keyword="+keyword+"&";
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

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").size()==0){
		$("#message").text("선택한 회원이 하나도 없습니다.");
		return;
	}
	
	$("#mainform").attr("method", "post");
	$("#mainform").attr("action","<%=request.getContextPath()%>/this14/admin/member_leave_action.jsp");
	$("#mainform").submit();
});

$(".u_grade").change(function() {
	var id=$(this).attr("name");
	var grade=$(this).val();
	//alert(id+","+grade);
	location.href="<%=request.getContextPath()%>/this14/admin/member_change_action.jsp?id="+id+"&grade="+grade;
});
</script>
		