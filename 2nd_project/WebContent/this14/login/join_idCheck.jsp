
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String message="";	
	String grade=UserDAO.getDAO().checkUserId(id);
	
	//System.out.println(id);
	if(id!=null){
		if(grade.equals("")){
			if(pass.equals("true")){
				message="<br><font color='blue'>사용할 수 있는 아이디 입니다.&nbsp;&nbsp;&nbsp;<input type='button' value='아이디 사용하기' name='usingId' id='usingId' onclick='send()'></font>";
			} else {
				message="아이디 형식이 잘못 되었습니다.<br>영문자로 시작하여 영문자,숫자,_를 이용한 5~16자리로 입력해 주세요.";
			}
		} else if(grade.equals("drop")){
			message="탈퇴한 회원의 아이디는 6개월간 사용이 불가능 합니다.<br>다른 아이디를 사용해 주세요.";
		} else {
			message="<br>이미 사용중인 아이디 입니다.";
		}
	} else{
		id="";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 입력</title>
<style type="text/css">
#wrapper{
	width:100%;
	overflow-x: hidden
}

#idCheckFrame{
	width: 100%;
	margin: 0 auto;
	padding:12px;
	background: #ddd;
	text-align: center;
}
#idCheckFrame input[type="text"] {
	height: 30px;
	line-height: 30px;
	padding: 0;
	border: 0;
	vertical-align: middle;
	border: 1px solid #ccc
}
#idCheckFrame input[type="button"] {
	border: 0;
	outline: 0;
	padding: 0 10px;
	margin: 0;
	height: 30px;
	vertical-align: middle;
	background-color: #0051ba;
	color: #fff;
	cursor: pointer;
}
#message{
	width: 99%;
	margin-top:10px;
	font-size:13px;
	color:red;
	text-align: left;
}
input[name="usingId"] {
	border: 0;
	outline: 0;
	padding: 0 10px;
	margin: 0;
	height: 20px;
	vertical-align: middle;
	background-color: #5b5b5b;
	color: #fff;
	font-size: 13px;
	cursor: pointer;
}
</style>
</head>
<body>
<div id="wrapper">
	<div id="idCheckFrame">
	<input type="text" id="id" name="id" value="<%=id %>" autofocus="autofocus" autocomplete="off">
	<input type="button" value="중복검사" onclick="idCheck()">
	</div>
	<div id="message"><%=message %></div>
</div>
<script type="text/javascript">

function idCheck(){
	var regId=/^[a-zA-Z]\w{5,16}$/g;
	if(regId.test(id.value)){
		location.href="<%=request.getContextPath()%>/this14/login/join_idCheck.jsp?id="+id.value+"&pass=true";
		return;
	} else{
		location.href="<%=request.getContextPath()%>/this14/login/join_idCheck.jsp?id="+id.value+"&pass=false";
		return;
	}
};

function send(){
	opener.fregisterform.mb_id.value="<%=id %>";
	window.close();
}

document.getElementById("id").onkeypress=function(event){
	if(event.keyCode==13) idCheck();
}

</script>
</body>
</html>


