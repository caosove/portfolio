<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name="";
	String phone="";
	String id="";
	
	if(session.getAttribute("name")!=null){
		name=(String)session.getAttribute("name");
		session.removeAttribute("name");
	}
	if(session.getAttribute("phone")!=null){
		phone=(String)session.getAttribute("phone");
		session.removeAttribute("phone");
	}
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
		session.removeAttribute("id");
	}

	String pwName="";
	String pwPhone="";
	String pwId="";
	String newPwd="";
	
	if(session.getAttribute("pwName")!=null){
		pwName=(String)session.getAttribute("pwName");
		session.removeAttribute("pwName");
	}
	if(session.getAttribute("pwPhone")!=null){
		pwPhone=(String)session.getAttribute("pwPhone");
		session.removeAttribute("pwPhone");
	}
	if(session.getAttribute("pwId")!=null){
		pwId=(String)session.getAttribute("pwId");
		session.removeAttribute("pwId");
	}
	if(session.getAttribute("newPwd")!=null){
		newPwd=(String)session.getAttribute("newPwd");
		session.removeAttribute("newPwd");
	}
	
	//System.out.println(newPwd);
%>
    
<jsp:include page="/this14/header.jsp"/>

<style type="text/css">

.lookupWrapper {
	width: 1060px;	
	height: 480px;
	margin: 80px auto;
}

.lookupInfo {
	width: 47%;
	height:97%;
	display: inline;
	float: left;
	border: 1px solid gray;
	border-radius: 15px;
	text-align: center;
}
.lookupInfo form{
	padding: 30px 0;
	text-align: center;
	font-size: 20px;
}

.lookupId{
	float: left;
	
}
.lookupPwd{
	float: right;
}

.lookupBtn {
	width: 260px ;
	height: 50px; 
	background-color: rgb(0,94,157); 
	border-radius: 6px; 
	padding: 10px;
	padding-top: 12px;
	margin-top: 10px; 
	font-size: 15px;
	font-weight: bold; 
	color: #f9d932;
}

</style>

<div id="allContent">
<div id="mainPadding">
<div class="lookupWrapper">
	<div class="lookupId lookupInfo">
		<form name="lookupId" method="post" action="lookup_action.jsp">
			<div style="font-size:25px; font-weight:bold;margin-bottom:50px;">아이디 찾기</div>
			<input type="text" class="login-id" name="lookupId-name" placeholder="이름" value="<%=name %>" autocomplete="off"> 
	        <label></label> 
            <input type="text" class="login-pw" name="lookupId-phone" placeholder="전화번호 (ex. 010-1234-5678)" value="<%=phone %>" autocomplete="off">
			<input type="submit" class="lookupBtn" value="아이디 찾기" style="margin-top:40px;">	
		</form>
		<% if(id.equals("")){ %>
			<div style="font-style:italic;visibility:hidden;"></div>
		<%} else if(id.equals("false")){ %>
			<div style="font-style:italic;visibility:visible;">
			<font color="red">일치하는 회원 기록이 없습니다.<br>회원 정보를 다시 확인해 주세요.</font>
			</div>
		<%} else { %>
			<div style="font-style:italic;visibility:visible;">
			<%=name %> 회원님의 아이디는 <span style="color:red;font-weight:bold;"><%=id %></span>입니다.
			</div>
		<%} %>
	</div>
	
	<div class="lookupPwd lookupInfo">
		<form name="lookupPwd" method="post" action="lookup_action.jsp" onsubmit="return lookupPwd()">
			<div style="font-size:25px; font-weight:bold;margin-bottom:20px;">비밀번호 찾기</div>
			<input type="text" class="login-id" name="lookupPw-id" placeholder="아이디" value="<%=pwId %>" autocomplete="off"> 
			<label></label>
			<input type="text" class="login-id" name="lookupPw-name" placeholder="이름" value="<%=pwName %>" autocomplete="off"> 
	        <label></label> 
            <input type="text" class="login-pw" name="lookupPw-phone" placeholder="전화번호 (ex. 010-1234-5678)" value="<%=pwPhone %>" autocomplete="off">
			<input type="submit" class="lookupBtn" value="비밀번호 찾기">	
		</form>
		<% if(newPwd.equals("")){ %>
			<div style="font-style:italic;visibility:hidden;"></div>
		<%} else if(newPwd.equals("false")){ %>
			<div style="font-style:italic;visibility:visible;">
			<font color="red">일치하는 회원 기록이 없습니다.<br>회원 정보를 다시 확인해 주세요.</font>
			</div>
		<%} else{ %>
			<div style="font-style:italic;visibility:visible;">
			<%=pwName %> 회원님의 임시 비밀번호는 <span style="color:red;font-weight:bold;"><%=newPwd %></span>입니다.<br>비밀번호 변경 후 이용하시기 바랍니다.
			</div>
		<%} %>
	</div>
</div>
</div>
</div>
<jsp:include page="/this14/footer.jsp"/>