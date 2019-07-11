
<%@page import="user.Utility"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

if(request.getMethod().equals("GET")){
	response.sendRedirect(request.getContextPath()+"/this14/product/index.jsp");
	return;
}

request.setCharacterEncoding("UTF-8");

String uId=request.getParameter("mb_id");
UserDTO user=UserDAO.getDAO().getUser(uId);
String uPwd="";
if(request.getParameter("mb_password_re")==""){
	uPwd=user.getuPwd();
} else{
	uPwd=Utility.encrypt(request.getParameter("mb_password_re"), "SHA-256");
}
String uName=request.getParameter("mb_name");
String uPhone=(request.getParameter("mb_hp1")+"-"+request.getParameter("mb_hp2")+"-"+request.getParameter("mb_hp3"));
String uEmail=request.getParameter("mb_email1")+"@"+request.getParameter("mb_email2");
String uPost=request.getParameter("mb_zip");
String uAbasic=request.getParameter("mb_addr1");
String uAdetail=request.getParameter("mb_addr2");

/*
System.out.println(uId);
System.out.println(uPwd);
System.out.println(uName);
System.out.println(uPhone);
System.out.println(uEmail);
System.out.println(uPost);
System.out.println(uAbasic);
System.out.println(uAdetail);
*/


user.setuPwd(uPwd);
user.setuName(uName);
user.setuPhone(uPhone);
user.setuEmail(uEmail);
user.setuPost(uPost);
user.setuAbasic(uAbasic);
user.setuAdetail(uAdetail);

UserDAO.getDAO().modifyUser(user);

UserDTO renew=UserDAO.getDAO().getUser(uId);

if(renew.getuGrade().equals("password")){
	UserDAO.getDAO().modifyUserGrade(renew.getuId(), "user");
}

UserDTO userRenew=UserDAO.getDAO().getUser(uId);

session.setAttribute("loginUser", userRenew);

UserDTO ttuser=(UserDTO)session.getAttribute("loginUser");

response.sendRedirect(request.getContextPath()+"/this14/login/user_detail.jsp");


%>